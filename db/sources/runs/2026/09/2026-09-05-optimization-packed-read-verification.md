---
type: run
id: 01m1sfpb83g9my15gcg7w32s56
created: 2026-09-05T19:10:58.819715+00:00
updated: 2026-09-05T19:10:58.907210+00:00
summary: Packed expert per-read verification V77
binary: Frozen native C component probe V77
captured_at: 2026-09-05
command: Tools/expert_layout_probe.py --verify-records; bounded corrupt/truncated digest seams
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Packed expert per-read verification V77
tool: exec
---
# Packed expert per-read verification V77: speed hypothesis rejected

This prospective successor of V72 includes SHA-256 verification of each packed record inside the timed native worker, before deinterleaving bytes. The complete fresh uncached four-layer artifact and sparse original-column copies preserve actual checkpoint offsets. All criteria remain seven alternating pairs, at least five clean pairs, five-percent median gain, 80% positive pairs, 98% physical disk-read coverage, 512 MB physical/owned-buffer ceilings and whole-pair global-swap exclusion. No replacements or posthoc threshold changes ran.

The verified packed arm regresses median component duration by 127.5204296%, 47.8034520%, 21.7805559% and 0.9773315% for random batches of 1, 4, 10 and 32 misses, retaining 6, 6, 5 and 7 clean exact pairs. All four speed hypotheses fail. Dense sweep has one cold pair, 371.3125210% slower; later references are cache-resident. Half-density sweep has no qualified pair, with cached references and packed physical-footprint violations. These are component results, not serving measurements. Per-read SHA verification is not adopted. Load-time verification remains a separate untested runtime candidate whose cold-start cost must be included.

The study completed, reverified the artifact and retained unchanged source identities. Six Python construction/failure tests pass. Two bounded native failures against separate diagnostic digest files reject a corrupt digest and a truncated table before successful output; the preserved study artifact and original checkpoints are unchanged. No model or GPU allocation ran.

## .build/optimization/expert-layout-verified-v77/protocol.json

SHA-256 `7251047fbf2512cf0f6145a55d6872cfbb0949fc3663cc9a05fa1f93cbf43251`; 1804 bytes.

```
{
  "kind": "actual-offset component qualification; no model speed claim",
  "layers": [
    0,
    15,
    31,
    47
  ],
  "rounds": 7,
  "minimum_pairs": 5,
  "minimum_median_reduction": 0.05,
  "minimum_positive_fraction": 0.8,
  "required_reclaimable_gb": 4,
  "maximum_process_bytes": 512000000,
  "maximum_buffer_bytes": 512000000,
  "workloads": [
    "random pool 1 miss",
    "random pool 4 misses",
    "random pool 10 misses",
    "random pool 32 misses",
    "dense sweep 32",
    "half-density sweep 32"
  ],
  "timing": "allocation, job scheduling, uncached reads, packed deinterleave, and free; excludes equal full-payload SHA-256 verification",
  "reference": "actual tensor offsets; pool 32 static lanes; sweep 12 longest-first dynamic lanes",
  "candidate": "verified packed records; same output columns; per-lane aligned scratch; pool 32 / sweep 12 lanes",
  "minimum_disk_read_fraction": 0.98,
  "exclusions": "any global swap change over a cell excludes its whole pair; disk-read bytes below 98% of requested payload; missing/invalid metrics or failed bytes; no replacements",
  "scope": "four complete selected layers; packed payload 5,662,310,400 bytes plus uncached sparse column copies at original checkpoint offsets (same selected payload); original weights stay read-only; no runtime loading or direct GPU writes",
  "candidate_mode": 2,
  "record_verification": "SHA-256 of every packed record is compared with the construction digest inside the timed worker",
  "source_hashes": {
    "prefill_bench.py": "6c21e7449abb1dee24cf8a747a018d270211cd9f20bdb2621595d7e6d35e3398",
    "expert_layout_probe.c": "2eacf90d744d1bc60ee1e0473b49df8f0c842880c14f185376761f05f81b4a8c",
    "expert_layout_probe.py": "a76bcba5750c58d8aad0188569c3c53e9721476009034c802a7f21f9d35d3ec2"
  }
}

```

## .build/optimization/expert-layout-verified-v77/manifest.json

SHA-256 `78273b8bb921dcbe578ba2343b70f0f17037347d36e204a8c2b29a775ad06710`; 617051 bytes.

```
{
  "protocol": {
    "kind": "actual-offset component qualification; no model speed claim",
    "layers": [
      0,
      15,
      31,
      47
    ],
    "rounds": 7,
    "minimum_pairs": 5,
    "minimum_median_reduction": 0.05,
    "minimum_positive_fraction": 0.8,
    "required_reclaimable_gb": 4,
    "maximum_process_bytes": 512000000,
    "maximum_buffer_bytes": 512000000,
    "workloads": [
      "random pool 1 miss",
      "random pool 4 misses",
      "random pool 10 misses",
      "random pool 32 misses",
      "dense sweep 32",
      "half-density sweep 32"
    ],
    "timing": "allocation, job scheduling, uncached reads, packed deinterleave, and free; excludes equal full-payload SHA-256 verification",
    "reference": "actual tensor offsets; pool 32 static lanes; sweep 12 longest-first dynamic lanes",
    "candidate": "verified packed records; same output columns; per-lane aligned scratch; pool 32 / sweep 12 lanes",
    "minimum_disk_read_fraction": 0.98,
    "exclusions": "any global swap change over a cell excludes its whole pair; disk-read bytes below 98% of requested payload; missing/invalid metrics or failed bytes; no replacements",
    "scope": "four complete selected layers; packed payload 5,662,310,400 bytes plus uncached sparse column copies at original checkpoint offsets (same selected payload); original weights stay read-only; no runtime loading or direct GPU writes",
    "candidate_mode": 2,
    "record_verification": "SHA-256 of every packed record is compared with the construction digest inside the timed worker",
    "source_hashes": {
      "prefill_bench.py": "6c21e7449abb1dee24cf8a747a018d270211cd9f20bdb2621595d7e6d35e3398",
      "expert_layout_probe.c": "2eacf90d744d1bc60ee1e0473b49df8f0c842880c14f185376761f05f81b4a8c",
      "expert_layout_probe.py": "a76bcba5750c58d8aad0188569c3c53e9721476009034c802a7f21f9d35d3ec2"
    }
  },
  "completed": true,
  "cells": [
    {
      "workload": 0,
      "round": 1,
      "mode": 0,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28362080256,
        "swapins": 41717681,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   316945.\nPages active:                                1027099.\nPages inactive:                               971814.\nPages speculative:                             81769.\nPages throttled:                                   0.\nPages wired down:                             206856.\nPages purgeable:                               20325.\n\"Translation faults\":                    14026101855.\nPages copy-on-write:                       640215567.\nPages zero filled:                       15961381702.\nPages reactivated:                        2447109063.\nPages purged:                               63065002.\nFile-backed pages:                           1393814.\nAnonymous pages:                              686868.\nPages stored in compressor:                  1446840.\nPages occupied by compressor:                 479875.\nDecompressions:                            983271589.\nCompressions:                             1278414336.\nPageins:                                  6063804108.\nPageouts:                                   10665701.\nSwapins:                                    41717681.\nSwapouts:                                   69922789.\nPages tagged:                                 170006.\nPages tagged resident:                        125642.\nPages tagged compressed:                       44364.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1259.\nPages tag-storage non-tag pageable:            90197.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052928.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          1.51220703125,
          1.48974609375,
          1.56591796875
        ],
        "observed_at_unix_seconds": 1788634873.516502,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "0"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 0,
        "records": 2048,
        "batches": 2048,
        "bytes": 5662310400,
        "read_calls": 18432,
        "seconds": 1.180889998,
        "batch_median_seconds": 0.000531,
        "batch_p95_seconds": 0.000613,
        "sampled_footprint_bytes": 5046680,
        "lifetime_rss_peak_bytes": 5423104,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 2764800,
        "diskio_bytesread": 5964300288,
        "reformat_bytes": 0,
        "tensor_sha256": "d4a24e9ae9c1211d735c3df9101b17241b78c1809d00c5d692736ca7793c29ac"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28198076416,
        "swapins": 41717681,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   319722.\nPages active:                                1010405.\nPages inactive:                               971813.\nPages speculative:                             81777.\nPages throttled:                                   0.\nPages wired down:                             220880.\nPages purgeable:                                7525.\n\"Translation faults\":                    14026109420.\nPages copy-on-write:                       640216517.\nPages zero filled:                       15961390341.\nPages reactivated:                        2447109215.\nPages purged:                               63065002.\nFile-backed pages:                           1393827.\nAnonymous pages:                              670168.\nPages stored in compressor:                  1446833.\nPages occupied by compressor:                 479871.\nDecompressions:                            983271596.\nCompressions:                             1278414336.\nPageins:                                  6063804119.\nPageouts:                                   10665701.\nSwapins:                                    41717681.\nSwapouts:                                   69922789.\nPages tagged:                                 169992.\nPages tagged resident:                        125628.\nPages tagged compressed:                       44364.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1209.\nPages tag-storage non-tag pageable:            90247.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052928.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      }
    },
    {
      "workload": 0,
      "round": 1,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28196683776,
        "swapins": 41717681,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   319633.\nPages active:                                1010406.\nPages inactive:                               971813.\nPages speculative:                             81781.\nPages throttled:                                   0.\nPages wired down:                             220880.\nPages purgeable:                                7525.\n\"Translation faults\":                    14026110017.\nPages copy-on-write:                       640216662.\nPages zero filled:                       15961390396.\nPages reactivated:                        2447109215.\nPages purged:                               63065002.\nFile-backed pages:                           1393831.\nAnonymous pages:                              670169.\nPages stored in compressor:                  1446833.\nPages occupied by compressor:                 479871.\nDecompressions:                            983271596.\nCompressions:                             1278414336.\nPageins:                                  6063804120.\nPageouts:                                   10665701.\nSwapins:                                    41717681.\nSwapouts:                                   69922789.\nPages tagged:                                 169992.\nPages tagged resident:                        125628.\nPages tagged compressed:                       44364.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1208.\nPages tag-storage non-tag pageable:            90248.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052928.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          1.55078125,
          1.498046875,
          1.568359375
        ],
        "observed_at_unix_seconds": 1788634876.409426,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "0"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 0,
        "records": 2048,
        "batches": 2048,
        "bytes": 5662310400,
        "read_calls": 2048,
        "seconds": 2.494315997,
        "batch_median_seconds": 0.001212,
        "batch_p95_seconds": 0.001258,
        "sampled_footprint_bytes": 7061888,
        "lifetime_rss_peak_bytes": 7454720,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 5529600,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "d4a24e9ae9c1211d735c3df9101b17241b78c1809d00c5d692736ca7793c29ac"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28354527232,
        "swapins": 41717681,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   322314.\nPages active:                                1021750.\nPages inactive:                               971846.\nPages speculative:                             81782.\nPages throttled:                                   0.\nPages wired down:                             206876.\nPages purgeable:                               14476.\n\"Translation faults\":                    14026115312.\nPages copy-on-write:                       640217491.\nPages zero filled:                       15961392325.\nPages reactivated:                        2447109215.\nPages purged:                               63065002.\nFile-backed pages:                           1393833.\nAnonymous pages:                              681545.\nPages stored in compressor:                  1446832.\nPages occupied by compressor:                 479871.\nDecompressions:                            983271597.\nCompressions:                             1278414336.\nPageins:                                  6063804127.\nPageouts:                                   10665701.\nSwapins:                                    41717681.\nSwapouts:                                   69922789.\nPages tagged:                                 169972.\nPages tagged resident:                        125608.\nPages tagged compressed:                       44364.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1209.\nPages tag-storage non-tag pageable:            90247.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052928.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      }
    },
    {
      "workload": 0,
      "round": 2,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28357263360,
        "swapins": 41717681,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   322479.\nPages active:                                1021752.\nPages inactive:                               971846.\nPages speculative:                             81784.\nPages throttled:                                   0.\nPages wired down:                             206876.\nPages purgeable:                               14476.\n\"Translation faults\":                    14026115906.\nPages copy-on-write:                       640217636.\nPages zero filled:                       15961392377.\nPages reactivated:                        2447109215.\nPages purged:                               63065002.\nFile-backed pages:                           1393835.\nAnonymous pages:                              681547.\nPages stored in compressor:                  1446832.\nPages occupied by compressor:                 479871.\nDecompressions:                            983271597.\nCompressions:                             1278414336.\nPageins:                                  6063804128.\nPageouts:                                   10665701.\nSwapins:                                    41717681.\nSwapouts:                                   69922789.\nPages tagged:                                 169972.\nPages tagged resident:                        125608.\nPages tagged compressed:                       44364.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1210.\nPages tag-storage non-tag pageable:            90246.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052928.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          1.50634765625,
          1.48974609375,
          1.56494140625
        ],
        "observed_at_unix_seconds": 1788634880.57159,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "0"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 0,
        "records": 2048,
        "batches": 2048,
        "bytes": 5662310400,
        "read_calls": 2048,
        "seconds": 2.496386007,
        "batch_median_seconds": 0.001212,
        "batch_p95_seconds": 0.001259,
        "sampled_footprint_bytes": 7061888,
        "lifetime_rss_peak_bytes": 7454720,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 5529600,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "d4a24e9ae9c1211d735c3df9101b17241b78c1809d00c5d692736ca7793c29ac"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28365733888,
        "swapins": 41717681,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   334295.\nPages active:                                 995367.\nPages inactive:                               970908.\nPages speculative:                             81805.\nPages throttled:                                   0.\nPages wired down:                             222148.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026120746.\nPages copy-on-write:                       640218513.\nPages zero filled:                       15961396560.\nPages reactivated:                        2447109221.\nPages purged:                               63065258.\nFile-backed pages:                           1393839.\nAnonymous pages:                              654241.\nPages stored in compressor:                  1446818.\nPages occupied by compressor:                 479868.\nDecompressions:                            983271611.\nCompressions:                             1278414336.\nPageins:                                  6063804135.\nPageouts:                                   10665701.\nSwapins:                                    41717681.\nSwapouts:                                   69922789.\nPages tagged:                                 170040.\nPages tagged resident:                        125676.\nPages tagged compressed:                       44364.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1263.\nPages tag-storage non-tag pageable:            90193.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052928.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      }
    },
    {
      "workload": 0,
      "round": 2,
      "mode": 0,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28366422016,
        "swapins": 41717681,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   334336.\nPages active:                                 995365.\nPages inactive:                               970908.\nPages speculative:                             81806.\nPages throttled:                                   0.\nPages wired down:                             222148.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026121347.\nPages copy-on-write:                       640218658.\nPages zero filled:                       15961396613.\nPages reactivated:                        2447109221.\nPages purged:                               63065258.\nFile-backed pages:                           1393840.\nAnonymous pages:                              654239.\nPages stored in compressor:                  1446818.\nPages occupied by compressor:                 479868.\nDecompressions:                            983271611.\nCompressions:                             1278414336.\nPageins:                                  6063804136.\nPageouts:                                   10665701.\nSwapins:                                    41717681.\nSwapouts:                                   69922789.\nPages tagged:                                 170040.\nPages tagged resident:                        125676.\nPages tagged compressed:                       44364.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1263.\nPages tag-storage non-tag pageable:            90193.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052928.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          1.50634765625,
          1.48974609375,
          1.56494140625
        ],
        "observed_at_unix_seconds": 1788634884.76075,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "0"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 0,
        "records": 2048,
        "batches": 2048,
        "bytes": 5662310400,
        "read_calls": 18432,
        "seconds": 1.099333001,
        "batch_median_seconds": 0.000531,
        "batch_p95_seconds": 0.000609,
        "sampled_footprint_bytes": 5063088,
        "lifetime_rss_peak_bytes": 5423104,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 2764800,
        "diskio_bytesread": 5964300288,
        "reformat_bytes": 0,
        "tensor_sha256": "d4a24e9ae9c1211d735c3df9101b17241b78c1809d00c5d692736ca7793c29ac"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28365373440,
        "swapins": 41717681,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   334266.\nPages active:                                 997043.\nPages inactive:                               970909.\nPages speculative:                             81807.\nPages throttled:                                   0.\nPages wired down:                             220549.\nPages purgeable:                                3176.\n\"Translation faults\":                    14026126669.\nPages copy-on-write:                       640219488.\nPages zero filled:                       15961401439.\nPages reactivated:                        2447109221.\nPages purged:                               63065258.\nFile-backed pages:                           1393843.\nAnonymous pages:                              655916.\nPages stored in compressor:                  1446815.\nPages occupied by compressor:                 479868.\nDecompressions:                            983271614.\nCompressions:                             1278414336.\nPageins:                                  6063804143.\nPageouts:                                   10665701.\nSwapins:                                    41717681.\nSwapouts:                                   69922789.\nPages tagged:                                 170025.\nPages tagged resident:                        125661.\nPages tagged compressed:                       44364.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1249.\nPages tag-storage non-tag pageable:            90207.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052928.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      }
    },
    {
      "workload": 0,
      "round": 3,
      "mode": 0,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28364095488,
        "swapins": 41717681,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   334186.\nPages active:                                 997039.\nPages inactive:                               970909.\nPages speculative:                             81809.\nPages throttled:                                   0.\nPages wired down:                             220549.\nPages purgeable:                                3176.\n\"Translation faults\":                    14026127274.\nPages copy-on-write:                       640219634.\nPages zero filled:                       15961401491.\nPages reactivated:                        2447109221.\nPages purged:                               63065258.\nFile-backed pages:                           1393845.\nAnonymous pages:                              655912.\nPages stored in compressor:                  1446815.\nPages occupied by compressor:                 479868.\nDecompressions:                            983271614.\nCompressions:                             1278414336.\nPageins:                                  6063804144.\nPageouts:                                   10665701.\nSwapins:                                    41717681.\nSwapouts:                                   69922789.\nPages tagged:                                 170025.\nPages tagged resident:                        125661.\nPages tagged compressed:                       44364.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1248.\nPages tag-storage non-tag pageable:            90208.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052928.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.18603515625,
          1.630859375,
          1.6142578125
        ],
        "observed_at_unix_seconds": 1788634887.593028,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "0"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 0,
        "records": 2048,
        "batches": 2048,
        "bytes": 5662310400,
        "read_calls": 18432,
        "seconds": 1.094484996,
        "batch_median_seconds": 0.000529,
        "batch_p95_seconds": 0.000612,
        "sampled_footprint_bytes": 5030296,
        "lifetime_rss_peak_bytes": 5439488,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 2764800,
        "diskio_bytesread": 5964300288,
        "reformat_bytes": 0,
        "tensor_sha256": "d4a24e9ae9c1211d735c3df9101b17241b78c1809d00c5d692736ca7793c29ac"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28362588160,
        "swapins": 41717681,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   334096.\nPages active:                                 997030.\nPages inactive:                               970910.\nPages speculative:                             81809.\nPages throttled:                                   0.\nPages wired down:                             220547.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026131091.\nPages copy-on-write:                       640220419.\nPages zero filled:                       15961405386.\nPages reactivated:                        2447109221.\nPages purged:                               63065258.\nFile-backed pages:                           1393846.\nAnonymous pages:                              655903.\nPages stored in compressor:                  1446814.\nPages occupied by compressor:                 479867.\nDecompressions:                            983271615.\nCompressions:                             1278414336.\nPageins:                                  6063804149.\nPageouts:                                   10665701.\nSwapins:                                    41717681.\nSwapouts:                                   69922789.\nPages tagged:                                 170078.\nPages tagged resident:                        125714.\nPages tagged compressed:                       44364.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1225.\nPages tag-storage non-tag pageable:            90231.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052928.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      }
    },
    {
      "workload": 0,
      "round": 3,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28363194368,
        "swapins": 41717681,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   334132.\nPages active:                                 997035.\nPages inactive:                               970910.\nPages speculative:                             81810.\nPages throttled:                                   0.\nPages wired down:                             220547.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026131700.\nPages copy-on-write:                       640220564.\nPages zero filled:                       15961405438.\nPages reactivated:                        2447109221.\nPages purged:                               63065258.\nFile-backed pages:                           1393847.\nAnonymous pages:                              655908.\nPages stored in compressor:                  1446814.\nPages occupied by compressor:                 479867.\nDecompressions:                            983271615.\nCompressions:                             1278414336.\nPageins:                                  6063804150.\nPageouts:                                   10665701.\nSwapins:                                    41717681.\nSwapouts:                                   69922789.\nPages tagged:                                 170078.\nPages tagged resident:                        125714.\nPages tagged compressed:                       44364.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1225.\nPages tag-storage non-tag pageable:            90231.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052928.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.18603515625,
          1.630859375,
          1.6142578125
        ],
        "observed_at_unix_seconds": 1788634890.396656,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "0"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 0,
        "records": 2048,
        "batches": 2048,
        "bytes": 5662310400,
        "read_calls": 2048,
        "seconds": 2.497725008,
        "batch_median_seconds": 0.001213,
        "batch_p95_seconds": 0.001261,
        "sampled_footprint_bytes": 7061888,
        "lifetime_rss_peak_bytes": 7454720,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 5529600,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "d4a24e9ae9c1211d735c3df9101b17241b78c1809d00c5d692736ca7793c29ac"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28361293824,
        "swapins": 41717681,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   334013.\nPages active:                                 997105.\nPages inactive:                               970911.\nPages speculative:                             81812.\nPages throttled:                                   0.\nPages wired down:                             220531.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026146312.\nPages copy-on-write:                       640222386.\nPages zero filled:                       15961411503.\nPages reactivated:                        2447109224.\nPages purged:                               63065288.\nFile-backed pages:                           1393850.\nAnonymous pages:                              655978.\nPages stored in compressor:                  1446807.\nPages occupied by compressor:                 479865.\nDecompressions:                            983271622.\nCompressions:                             1278414336.\nPageins:                                  6063804160.\nPageouts:                                   10665701.\nSwapins:                                    41717681.\nSwapouts:                                   69922789.\nPages tagged:                                 170183.\nPages tagged resident:                        125819.\nPages tagged compressed:                       44364.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1214.\nPages tag-storage non-tag pageable:            90242.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052928.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      }
    },
    {
      "workload": 0,
      "round": 4,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28362178560,
        "swapins": 41717681,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   334066.\nPages active:                                 997096.\nPages inactive:                               970911.\nPages speculative:                             81813.\nPages throttled:                                   0.\nPages wired down:                             220531.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026146922.\nPages copy-on-write:                       640222534.\nPages zero filled:                       15961411555.\nPages reactivated:                        2447109224.\nPages purged:                               63065288.\nFile-backed pages:                           1393851.\nAnonymous pages:                              655969.\nPages stored in compressor:                  1446807.\nPages occupied by compressor:                 479865.\nDecompressions:                            983271622.\nCompressions:                             1278414336.\nPageins:                                  6063804161.\nPageouts:                                   10665701.\nSwapins:                                    41717681.\nSwapouts:                                   69922789.\nPages tagged:                                 170183.\nPages tagged resident:                        125819.\nPages tagged compressed:                       44364.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1215.\nPages tag-storage non-tag pageable:            90241.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052928.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.0908203125,
          1.6201171875,
          1.6103515625
        ],
        "observed_at_unix_seconds": 1788634894.6001642,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "0"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 0,
        "records": 2048,
        "batches": 2048,
        "bytes": 5662310400,
        "read_calls": 2048,
        "seconds": 2.495142999,
        "batch_median_seconds": 0.001212,
        "batch_p95_seconds": 0.00126,
        "sampled_footprint_bytes": 7061888,
        "lifetime_rss_peak_bytes": 7454720,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 5529600,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "d4a24e9ae9c1211d735c3df9101b17241b78c1809d00c5d692736ca7793c29ac"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28364750848,
        "swapins": 41717681,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   334137.\nPages active:                                 995472.\nPages inactive:                               970913.\nPages speculative:                             81896.\nPages throttled:                                   0.\nPages wired down:                             222136.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026150751.\nPages copy-on-write:                       640223323.\nPages zero filled:                       15961412691.\nPages reactivated:                        2447109247.\nPages purged:                               63065288.\nFile-backed pages:                           1393937.\nAnonymous pages:                              654344.\nPages stored in compressor:                  1446807.\nPages occupied by compressor:                 479865.\nDecompressions:                            983271622.\nCompressions:                             1278414336.\nPageins:                                  6063804166.\nPageouts:                                   10665701.\nSwapins:                                    41717681.\nSwapouts:                                   69922789.\nPages tagged:                                 170160.\nPages tagged resident:                        125796.\nPages tagged compressed:                       44364.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1216.\nPages tag-storage non-tag pageable:            90240.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052928.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      }
    },
    {
      "workload": 0,
      "round": 4,
      "mode": 0,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28363390976,
        "swapins": 41717681,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   334052.\nPages active:                                 995475.\nPages inactive:                               970913.\nPages speculative:                             81898.\nPages throttled:                                   0.\nPages wired down:                             222136.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026151368.\nPages copy-on-write:                       640223469.\nPages zero filled:                       15961412746.\nPages reactivated:                        2447109247.\nPages purged:                               63065288.\nFile-backed pages:                           1393939.\nAnonymous pages:                              654347.\nPages stored in compressor:                  1446807.\nPages occupied by compressor:                 479865.\nDecompressions:                            983271622.\nCompressions:                             1278414336.\nPageins:                                  6063804167.\nPageouts:                                   10665701.\nSwapins:                                    41717681.\nSwapouts:                                   69922789.\nPages tagged:                                 170160.\nPages tagged resident:                        125796.\nPages tagged compressed:                       44364.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1216.\nPages tag-storage non-tag pageable:            90240.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052928.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.00341796875,
          1.609375,
          1.6064453125
        ],
        "observed_at_unix_seconds": 1788634898.7750132,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "0"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 0,
        "records": 2048,
        "batches": 2048,
        "bytes": 5662310400,
        "read_calls": 18432,
        "seconds": 1.092796996,
        "batch_median_seconds": 0.000529,
        "batch_p95_seconds": 0.000609,
        "sampled_footprint_bytes": 5030296,
        "lifetime_rss_peak_bytes": 5423104,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 2764800,
        "diskio_bytesread": 5964300288,
        "reformat_bytes": 0,
        "tensor_sha256": "d4a24e9ae9c1211d735c3df9101b17241b78c1809d00c5d692736ca7793c29ac"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28364374016,
        "swapins": 41717681,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   334111.\nPages active:                                 997042.\nPages inactive:                               970916.\nPages speculative:                             81898.\nPages throttled:                                   0.\nPages wired down:                             220534.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026156433.\nPages copy-on-write:                       640224300.\nPages zero filled:                       15961417471.\nPages reactivated:                        2447109247.\nPages purged:                               63065288.\nFile-backed pages:                           1393940.\nAnonymous pages:                              655916.\nPages stored in compressor:                  1446805.\nPages occupied by compressor:                 479865.\nDecompressions:                            983271624.\nCompressions:                             1278414336.\nPageins:                                  6063804174.\nPageouts:                                   10665701.\nSwapins:                                    41717681.\nSwapouts:                                   69922789.\nPages tagged:                                 170149.\nPages tagged resident:                        125785.\nPages tagged compressed:                       44364.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1217.\nPages tag-storage non-tag pageable:            90239.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052928.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      }
    },
    {
      "workload": 0,
      "round": 5,
      "mode": 0,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28363096064,
        "swapins": 41717681,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   334032.\nPages active:                                 997044.\nPages inactive:                               970916.\nPages speculative:                             81899.\nPages throttled:                                   0.\nPages wired down:                             220534.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026157058.\nPages copy-on-write:                       640224449.\nPages zero filled:                       15961417526.\nPages reactivated:                        2447109247.\nPages purged:                               63065288.\nFile-backed pages:                           1393941.\nAnonymous pages:                              655918.\nPages stored in compressor:                  1446805.\nPages occupied by compressor:                 479865.\nDecompressions:                            983271624.\nCompressions:                             1278414336.\nPageins:                                  6063804175.\nPageouts:                                   10665701.\nSwapins:                                    41717681.\nSwapouts:                                   69922789.\nPages tagged:                                 170149.\nPages tagged resident:                        125785.\nPages tagged compressed:                       44364.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1217.\nPages tag-storage non-tag pageable:            90239.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052928.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          1.9228515625,
          1.59912109375,
          1.6025390625
        ],
        "observed_at_unix_seconds": 1788634901.586016,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "0"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 0,
        "records": 2048,
        "batches": 2048,
        "bytes": 5662310400,
        "read_calls": 18432,
        "seconds": 1.095891006,
        "batch_median_seconds": 0.00053,
        "batch_p95_seconds": 0.000608,
        "sampled_footprint_bytes": 4997552,
        "lifetime_rss_peak_bytes": 5439488,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 2764800,
        "diskio_bytesread": 5964300288,
        "reformat_bytes": 0,
        "tensor_sha256": "d4a24e9ae9c1211d735c3df9101b17241b78c1809d00c5d692736ca7793c29ac"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28358656000,
        "swapins": 41717681,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   333759.\nPages active:                                 997363.\nPages inactive:                               970917.\nPages speculative:                             81900.\nPages throttled:                                   0.\nPages wired down:                             220534.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026190349.\nPages copy-on-write:                       640225329.\nPages zero filled:                       15961443482.\nPages reactivated:                        2447109247.\nPages purged:                               63065288.\nFile-backed pages:                           1393943.\nAnonymous pages:                              656237.\nPages stored in compressor:                  1446802.\nPages occupied by compressor:                 479864.\nDecompressions:                            983271627.\nCompressions:                             1278414336.\nPageins:                                  6063804182.\nPageouts:                                   10665701.\nSwapins:                                    41717681.\nSwapouts:                                   69922789.\nPages tagged:                                 170134.\nPages tagged resident:                        125770.\nPages tagged compressed:                       44364.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1221.\nPages tag-storage non-tag pageable:            90235.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052928.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      }
    },
    {
      "workload": 0,
      "round": 5,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28357345280,
        "swapins": 41717681,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   333677.\nPages active:                                 997366.\nPages inactive:                               970917.\nPages speculative:                             81902.\nPages throttled:                                   0.\nPages wired down:                             220534.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026190971.\nPages copy-on-write:                       640225476.\nPages zero filled:                       15961443537.\nPages reactivated:                        2447109247.\nPages purged:                               63065288.\nFile-backed pages:                           1393945.\nAnonymous pages:                              656240.\nPages stored in compressor:                  1446802.\nPages occupied by compressor:                 479864.\nDecompressions:                            983271627.\nCompressions:                             1278414336.\nPageins:                                  6063804183.\nPageouts:                                   10665701.\nSwapins:                                    41717681.\nSwapouts:                                   69922789.\nPages tagged:                                 170134.\nPages tagged resident:                        125770.\nPages tagged compressed:                       44364.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1220.\nPages tag-storage non-tag pageable:            90236.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052928.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          1.9228515625,
          1.59912109375,
          1.6025390625
        ],
        "observed_at_unix_seconds": 1788634904.423041,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "0"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 0,
        "records": 2048,
        "batches": 2048,
        "bytes": 5662310400,
        "read_calls": 2048,
        "seconds": 2.498181989,
        "batch_median_seconds": 0.001213,
        "batch_p95_seconds": 0.001266,
        "sampled_footprint_bytes": 7045504,
        "lifetime_rss_peak_bytes": 7438336,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 5529600,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "d4a24e9ae9c1211d735c3df9101b17241b78c1809d00c5d692736ca7793c29ac"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28522020864,
        "swapins": 41717681,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   334203.\nPages active:                                1010813.\nPages inactive:                               970928.\nPages speculative:                             81905.\nPages throttled:                                   0.\nPages wired down:                             206780.\nPages purgeable:                               12684.\n\"Translation faults\":                    14026196532.\nPages copy-on-write:                       640226320.\nPages zero filled:                       15961448362.\nPages reactivated:                        2447109387.\nPages purged:                               63065288.\nFile-backed pages:                           1393959.\nAnonymous pages:                              669687.\nPages stored in compressor:                  1446794.\nPages occupied by compressor:                 479862.\nDecompressions:                            983271633.\nCompressions:                             1278414336.\nPageins:                                  6063804190.\nPageouts:                                   10665701.\nSwapins:                                    41717681.\nSwapouts:                                   69922789.\nPages tagged:                                 170079.\nPages tagged resident:                        125717.\nPages tagged compressed:                       44362.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1220.\nPages tag-storage non-tag pageable:            90236.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052800.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      }
    },
    {
      "workload": 0,
      "round": 6,
      "mode": 2,
      "exclusions": [
        "global swap activity"
      ],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28520628224,
        "swapins": 41717681,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   334117.\nPages active:                                1010821.\nPages inactive:                               970928.\nPages speculative:                             81906.\nPages throttled:                                   0.\nPages wired down:                             206780.\nPages purgeable:                               12684.\n\"Translation faults\":                    14026197155.\nPages copy-on-write:                       640226471.\nPages zero filled:                       15961448415.\nPages reactivated:                        2447109387.\nPages purged:                               63065288.\nFile-backed pages:                           1393960.\nAnonymous pages:                              669695.\nPages stored in compressor:                  1446794.\nPages occupied by compressor:                 479862.\nDecompressions:                            983271633.\nCompressions:                             1278414336.\nPageins:                                  6063804191.\nPageouts:                                   10665701.\nSwapins:                                    41717681.\nSwapouts:                                   69922789.\nPages tagged:                                 170079.\nPages tagged resident:                        125717.\nPages tagged compressed:                       44362.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1220.\nPages tag-storage non-tag pageable:            90236.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052800.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          1.8486328125,
          1.5888671875,
          1.5986328125
        ],
        "observed_at_unix_seconds": 1788634908.610794,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "0"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 0,
        "records": 2048,
        "batches": 2048,
        "bytes": 5662310400,
        "read_calls": 2048,
        "seconds": 2.503425003,
        "batch_median_seconds": 0.001214,
        "batch_p95_seconds": 0.001269,
        "sampled_footprint_bytes": 7061888,
        "lifetime_rss_peak_bytes": 7454720,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 5529600,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "d4a24e9ae9c1211d735c3df9101b17241b78c1809d00c5d692736ca7793c29ac"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 27978055680,
        "swapins": 41717685,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   310947.\nPages active:                                1007572.\nPages inactive:                               970947.\nPages speculative:                             81899.\nPages throttled:                                   0.\nPages wired down:                             233233.\nPages purgeable:                                2724.\n\"Translation faults\":                    14026227444.\nPages copy-on-write:                       640228449.\nPages zero filled:                       15961477660.\nPages reactivated:                        2447109387.\nPages purged:                               63065288.\nFile-backed pages:                           1393974.\nAnonymous pages:                              666444.\nPages stored in compressor:                  1446786.\nPages occupied by compressor:                 479863.\nDecompressions:                            983271641.\nCompressions:                             1278414336.\nPageins:                                  6063804210.\nPageouts:                                   10665701.\nSwapins:                                    41717685.\nSwapouts:                                   69922789.\nPages tagged:                                 170039.\nPages tagged resident:                        125677.\nPages tagged compressed:                       44362.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1223.\nPages tag-storage non-tag pageable:            90233.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052800.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      }
    },
    {
      "workload": 0,
      "round": 6,
      "mode": 0,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 27976892416,
        "swapins": 41717685,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   310875.\nPages active:                                1007592.\nPages inactive:                               970947.\nPages speculative:                             81900.\nPages throttled:                                   0.\nPages wired down:                             233233.\nPages purgeable:                                2724.\n\"Translation faults\":                    14026228094.\nPages copy-on-write:                       640228599.\nPages zero filled:                       15961477740.\nPages reactivated:                        2447109387.\nPages purged:                               63065288.\nFile-backed pages:                           1393975.\nAnonymous pages:                              666464.\nPages stored in compressor:                  1446786.\nPages occupied by compressor:                 479863.\nDecompressions:                            983271641.\nCompressions:                             1278414336.\nPageins:                                  6063804211.\nPageouts:                                   10665701.\nSwapins:                                    41717685.\nSwapouts:                                   69922789.\nPages tagged:                                 170039.\nPages tagged resident:                        125677.\nPages tagged compressed:                       44362.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1224.\nPages tag-storage non-tag pageable:            90232.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052800.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          1.7001953125,
          1.56201171875,
          1.5888671875
        ],
        "observed_at_unix_seconds": 1788634912.799423,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "0"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 0,
        "records": 2048,
        "batches": 2048,
        "bytes": 5662310400,
        "read_calls": 18432,
        "seconds": 1.095615,
        "batch_median_seconds": 0.00053,
        "batch_p95_seconds": 0.000608,
        "sampled_footprint_bytes": 5030320,
        "lifetime_rss_peak_bytes": 5423104,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 2764800,
        "diskio_bytesread": 5964300288,
        "reformat_bytes": 0,
        "tensor_sha256": "d4a24e9ae9c1211d735c3df9101b17241b78c1809d00c5d692736ca7793c29ac"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28216426496,
        "swapins": 41717685,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   318392.\nPages active:                                1011626.\nPages inactive:                               971888.\nPages speculative:                             81904.\nPages throttled:                                   0.\nPages wired down:                             220824.\nPages purgeable:                                9829.\n\"Translation faults\":                    14026247533.\nPages copy-on-write:                       640229441.\nPages zero filled:                       15961492693.\nPages reactivated:                        2447109387.\nPages purged:                               63065288.\nFile-backed pages:                           1393973.\nAnonymous pages:                              671445.\nPages stored in compressor:                  1446786.\nPages occupied by compressor:                 479863.\nDecompressions:                            983271641.\nCompressions:                             1278414336.\nPageins:                                  6063804218.\nPageouts:                                   10665701.\nSwapins:                                    41717685.\nSwapouts:                                   69922789.\nPages tagged:                                 170021.\nPages tagged resident:                        125659.\nPages tagged compressed:                       44362.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1340.\nPages tag-storage non-tag pageable:            90116.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052800.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      }
    },
    {
      "workload": 0,
      "round": 7,
      "mode": 0,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28215246848,
        "swapins": 41717685,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   318318.\nPages active:                                1011623.\nPages inactive:                               971888.\nPages speculative:                             81906.\nPages throttled:                                   0.\nPages wired down:                             220824.\nPages purgeable:                                9829.\n\"Translation faults\":                    14026248167.\nPages copy-on-write:                       640229585.\nPages zero filled:                       15961492751.\nPages reactivated:                        2447109387.\nPages purged:                               63065288.\nFile-backed pages:                           1393975.\nAnonymous pages:                              671442.\nPages stored in compressor:                  1446786.\nPages occupied by compressor:                 479863.\nDecompressions:                            983271641.\nCompressions:                             1278414336.\nPageins:                                  6063804219.\nPageouts:                                   10665701.\nSwapins:                                    41717685.\nSwapouts:                                   69922789.\nPages tagged:                                 170021.\nPages tagged resident:                        125659.\nPages tagged compressed:                       44362.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1340.\nPages tag-storage non-tag pageable:            90116.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052800.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          1.96435546875,
          1.61865234375,
          1.6083984375
        ],
        "observed_at_unix_seconds": 1788634915.600352,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "0"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 0,
        "records": 2048,
        "batches": 2048,
        "bytes": 5662310400,
        "read_calls": 18432,
        "seconds": 1.101639999,
        "batch_median_seconds": 0.000534,
        "batch_p95_seconds": 0.00061,
        "sampled_footprint_bytes": 5013936,
        "lifetime_rss_peak_bytes": 5455872,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 2764800,
        "diskio_bytesread": 5964300288,
        "reformat_bytes": 0,
        "tensor_sha256": "d4a24e9ae9c1211d735c3df9101b17241b78c1809d00c5d692736ca7793c29ac"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28213182464,
        "swapins": 41717685,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   321257.\nPages active:                                1008782.\nPages inactive:                               971889.\nPages speculative:                             81912.\nPages throttled:                                   0.\nPages wired down:                             220557.\nPages purgeable:                                6757.\n\"Translation faults\":                    14026263992.\nPages copy-on-write:                       640230384.\nPages zero filled:                       15961502028.\nPages reactivated:                        2447109393.\nPages purged:                               63065288.\nFile-backed pages:                           1393982.\nAnonymous pages:                              668601.\nPages stored in compressor:                  1446785.\nPages occupied by compressor:                 479862.\nDecompressions:                            983271642.\nCompressions:                             1278414336.\nPageins:                                  6063804224.\nPageouts:                                   10665701.\nSwapins:                                    41717685.\nSwapouts:                                   69922789.\nPages tagged:                                 170002.\nPages tagged resident:                        125640.\nPages tagged compressed:                       44362.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1332.\nPages tag-storage non-tag pageable:            90124.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052800.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      }
    },
    {
      "workload": 0,
      "round": 7,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28213575680,
        "swapins": 41717685,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   321280.\nPages active:                                1008775.\nPages inactive:                               971889.\nPages speculative:                             81913.\nPages throttled:                                   0.\nPages wired down:                             220557.\nPages purgeable:                                6757.\n\"Translation faults\":                    14026264620.\nPages copy-on-write:                       640230531.\nPages zero filled:                       15961502079.\nPages reactivated:                        2447109393.\nPages purged:                               63065288.\nFile-backed pages:                           1393983.\nAnonymous pages:                              668594.\nPages stored in compressor:                  1446785.\nPages occupied by compressor:                 479862.\nDecompressions:                            983271642.\nCompressions:                             1278414336.\nPageins:                                  6063804225.\nPageouts:                                   10665701.\nSwapins:                                    41717685.\nSwapouts:                                   69922789.\nPages tagged:                                 170002.\nPages tagged resident:                        125640.\nPages tagged compressed:                       44362.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1330.\nPages tag-storage non-tag pageable:            90126.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052800.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          1.96435546875,
          1.61865234375,
          1.6083984375
        ],
        "observed_at_unix_seconds": 1788634918.432839,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "0"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 0,
        "records": 2048,
        "batches": 2048,
        "bytes": 5662310400,
        "read_calls": 2048,
        "seconds": 2.496347004,
        "batch_median_seconds": 0.001212,
        "batch_p95_seconds": 0.001262,
        "sampled_footprint_bytes": 7045504,
        "lifetime_rss_peak_bytes": 7438336,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 5529600,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "d4a24e9ae9c1211d735c3df9101b17241b78c1809d00c5d692736ca7793c29ac"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28097249280,
        "swapins": 41717685,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   309944.\nPages active:                                1012723.\nPages inactive:                               971890.\nPages speculative:                             81913.\nPages throttled:                                   0.\nPages wired down:                             227971.\nPages purgeable:                               10992.\n\"Translation faults\":                    14026280021.\nPages copy-on-write:                       640232391.\nPages zero filled:                       15961527755.\nPages reactivated:                        2447109397.\nPages purged:                               63065288.\nFile-backed pages:                           1393984.\nAnonymous pages:                              672542.\nPages stored in compressor:                  1446778.\nPages occupied by compressor:                 479857.\nDecompressions:                            983271649.\nCompressions:                             1278414336.\nPageins:                                  6063804235.\nPageouts:                                   10665701.\nSwapins:                                    41717685.\nSwapouts:                                   69922789.\nPages tagged:                                 169980.\nPages tagged resident:                        125618.\nPages tagged compressed:                       44362.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1338.\nPages tag-storage non-tag pageable:            90118.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052800.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      }
    },
    {
      "workload": 1,
      "round": 1,
      "mode": 0,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28098068480,
        "swapins": 41717685,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   309992.\nPages active:                                1012719.\nPages inactive:                               971890.\nPages speculative:                             81915.\nPages throttled:                                   0.\nPages wired down:                             227971.\nPages purgeable:                               10992.\n\"Translation faults\":                    14026280647.\nPages copy-on-write:                       640232538.\nPages zero filled:                       15961527807.\nPages reactivated:                        2447109397.\nPages purged:                               63065288.\nFile-backed pages:                           1393986.\nAnonymous pages:                              672538.\nPages stored in compressor:                  1446778.\nPages occupied by compressor:                 479857.\nDecompressions:                            983271649.\nCompressions:                             1278414336.\nPageins:                                  6063804236.\nPageouts:                                   10665701.\nSwapins:                                    41717685.\nSwapouts:                                   69922789.\nPages tagged:                                 169980.\nPages tagged resident:                        125618.\nPages tagged compressed:                       44362.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1341.\nPages tag-storage non-tag pageable:            90115.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052800.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          1.88671875,
          1.60791015625,
          1.6044921875
        ],
        "observed_at_unix_seconds": 1788634922.656704,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "1"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 1,
        "records": 2048,
        "batches": 512,
        "bytes": 5662310400,
        "read_calls": 18432,
        "seconds": 0.665413999,
        "batch_median_seconds": 0.001286,
        "batch_p95_seconds": 0.001424,
        "sampled_footprint_bytes": 13500848,
        "lifetime_rss_peak_bytes": 13860864,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 11059200,
        "diskio_bytesread": 5964300288,
        "reformat_bytes": 0,
        "tensor_sha256": "25ebd25ee0cf34270baca4336cd648a771d88fd8220bedce3a71397fb629b680"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28209020928,
        "swapins": 41717685,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   316050.\nPages active:                                1013880.\nPages inactive:                               971891.\nPages speculative:                             81917.\nPages throttled:                                   0.\nPages wired down:                             220556.\nPages purgeable:                               11703.\n\"Translation faults\":                    14026285008.\nPages copy-on-write:                       640233355.\nPages zero filled:                       15961529058.\nPages reactivated:                        2447109397.\nPages purged:                               63065416.\nFile-backed pages:                           1393989.\nAnonymous pages:                              673699.\nPages stored in compressor:                  1446774.\nPages occupied by compressor:                 479857.\nDecompressions:                            983271653.\nCompressions:                             1278414336.\nPageins:                                  6063804241.\nPageouts:                                   10665701.\nSwapins:                                    41717685.\nSwapouts:                                   69922789.\nPages tagged:                                 170032.\nPages tagged resident:                        125670.\nPages tagged compressed:                       44362.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1328.\nPages tag-storage non-tag pageable:            90128.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052800.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      }
    },
    {
      "workload": 1,
      "round": 1,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28207497216,
        "swapins": 41717685,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   315956.\nPages active:                                1013877.\nPages inactive:                               971891.\nPages speculative:                             81918.\nPages throttled:                                   0.\nPages wired down:                             220556.\nPages purgeable:                               11703.\n\"Translation faults\":                    14026285634.\nPages copy-on-write:                       640233499.\nPages zero filled:                       15961529111.\nPages reactivated:                        2447109397.\nPages purged:                               63065416.\nFile-backed pages:                           1393990.\nAnonymous pages:                              673696.\nPages stored in compressor:                  1446774.\nPages occupied by compressor:                 479857.\nDecompressions:                            983271653.\nCompressions:                             1278414336.\nPageins:                                  6063804242.\nPageouts:                                   10665701.\nSwapins:                                    41717685.\nSwapouts:                                   69922789.\nPages tagged:                                 170032.\nPages tagged resident:                        125670.\nPages tagged compressed:                       44362.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1326.\nPages tag-storage non-tag pageable:            90130.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052800.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          1.88671875,
          1.60791015625,
          1.6044921875
        ],
        "observed_at_unix_seconds": 1788634925.002759,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "1"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 1,
        "records": 2048,
        "batches": 512,
        "bytes": 5662310400,
        "read_calls": 2048,
        "seconds": 0.985428996,
        "batch_median_seconds": 0.001919,
        "batch_p95_seconds": 0.001987,
        "sampled_footprint_bytes": 24002992,
        "lifetime_rss_peak_bytes": 24363008,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 22118400,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "25ebd25ee0cf34270baca4336cd648a771d88fd8220bedce3a71397fb629b680"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28213870592,
        "swapins": 41717685,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   319415.\nPages active:                                1010705.\nPages inactive:                               971892.\nPages speculative:                             81919.\nPages throttled:                                   0.\nPages wired down:                             220557.\nPages purgeable:                                8631.\n\"Translation faults\":                    14026291845.\nPages copy-on-write:                       640234333.\nPages zero filled:                       15961534410.\nPages reactivated:                        2447109397.\nPages purged:                               63065416.\nFile-backed pages:                           1393992.\nAnonymous pages:                              670524.\nPages stored in compressor:                  1446773.\nPages occupied by compressor:                 479857.\nDecompressions:                            983271654.\nCompressions:                             1278414336.\nPageins:                                  6063804249.\nPageouts:                                   10665701.\nSwapins:                                    41717685.\nSwapouts:                                   69922789.\nPages tagged:                                 170081.\nPages tagged resident:                        125719.\nPages tagged compressed:                       44362.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1324.\nPages tag-storage non-tag pageable:            90132.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052800.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      }
    },
    {
      "workload": 1,
      "round": 2,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28214525952,
        "swapins": 41717685,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   319454.\nPages active:                                1010703.\nPages inactive:                               971892.\nPages speculative:                             81920.\nPages throttled:                                   0.\nPages wired down:                             220557.\nPages purgeable:                                8631.\n\"Translation faults\":                    14026292476.\nPages copy-on-write:                       640234478.\nPages zero filled:                       15961534465.\nPages reactivated:                        2447109397.\nPages purged:                               63065416.\nFile-backed pages:                           1393993.\nAnonymous pages:                              670522.\nPages stored in compressor:                  1446773.\nPages occupied by compressor:                 479857.\nDecompressions:                            983271654.\nCompressions:                             1278414336.\nPageins:                                  6063804250.\nPageouts:                                   10665701.\nSwapins:                                    41717685.\nSwapouts:                                   69922789.\nPages tagged:                                 170081.\nPages tagged resident:                        125719.\nPages tagged compressed:                       44362.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1323.\nPages tag-storage non-tag pageable:            90133.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052800.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          1.8154296875,
          1.59765625,
          1.6005859375
        ],
        "observed_at_unix_seconds": 1788634927.675574,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "1"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 1,
        "records": 2048,
        "batches": 512,
        "bytes": 5662310400,
        "read_calls": 2048,
        "seconds": 0.98527,
        "batch_median_seconds": 0.001918,
        "batch_p95_seconds": 0.001985,
        "sampled_footprint_bytes": 23986584,
        "lifetime_rss_peak_bytes": 24363008,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 22118400,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "25ebd25ee0cf34270baca4336cd648a771d88fd8220bedce3a71397fb629b680"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28214378496,
        "swapins": 41717685,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   322008.\nPages active:                                1006217.\nPages inactive:                               971893.\nPages speculative:                             81920.\nPages throttled:                                   0.\nPages wired down:                             222112.\nPages purgeable:                                6071.\n\"Translation faults\":                    14026297411.\nPages copy-on-write:                       640235272.\nPages zero filled:                       15961536143.\nPages reactivated:                        2447109397.\nPages purged:                               63065444.\nFile-backed pages:                           1393990.\nAnonymous pages:                              666040.\nPages stored in compressor:                  1446768.\nPages occupied by compressor:                 479847.\nDecompressions:                            983271659.\nCompressions:                             1278414336.\nPageins:                                  6063804255.\nPageouts:                                   10665701.\nSwapins:                                    41717685.\nSwapouts:                                   69922789.\nPages tagged:                                 170066.\nPages tagged resident:                        125704.\nPages tagged compressed:                       44362.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1371.\nPages tag-storage non-tag pageable:            90085.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052800.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      }
    },
    {
      "workload": 1,
      "round": 2,
      "mode": 0,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28212920320,
        "swapins": 41717685,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   321917.\nPages active:                                1006214.\nPages inactive:                               971893.\nPages speculative:                             81922.\nPages throttled:                                   0.\nPages wired down:                             222112.\nPages purgeable:                                6071.\n\"Translation faults\":                    14026298043.\nPages copy-on-write:                       640235415.\nPages zero filled:                       15961536194.\nPages reactivated:                        2447109397.\nPages purged:                               63065444.\nFile-backed pages:                           1393992.\nAnonymous pages:                              666037.\nPages stored in compressor:                  1446768.\nPages occupied by compressor:                 479847.\nDecompressions:                            983271659.\nCompressions:                             1278414336.\nPageins:                                  6063804256.\nPageouts:                                   10665701.\nSwapins:                                    41717685.\nSwapouts:                                   69922789.\nPages tagged:                                 170066.\nPages tagged resident:                        125704.\nPages tagged compressed:                       44362.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1368.\nPages tag-storage non-tag pageable:            90088.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052800.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          1.8154296875,
          1.59765625,
          1.6005859375
        ],
        "observed_at_unix_seconds": 1788634930.314929,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "1"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 1,
        "records": 2048,
        "batches": 512,
        "bytes": 5662310400,
        "read_calls": 18432,
        "seconds": 0.667147001,
        "batch_median_seconds": 0.001293,
        "batch_p95_seconds": 0.001423,
        "sampled_footprint_bytes": 13500824,
        "lifetime_rss_peak_bytes": 13877248,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 11059200,
        "diskio_bytesread": 5964300288,
        "reformat_bytes": 0,
        "tensor_sha256": "25ebd25ee0cf34270baca4336cd648a771d88fd8220bedce3a71397fb629b680"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28222767104,
        "swapins": 41717685,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   324386.\nPages active:                                1005598.\nPages inactive:                               971894.\nPages speculative:                             81927.\nPages throttled:                                   0.\nPages wired down:                             220509.\nPages purgeable:                                4197.\n\"Translation faults\":                    14026304250.\nPages copy-on-write:                       640236325.\nPages zero filled:                       15961538727.\nPages reactivated:                        2447109397.\nPages purged:                               63065828.\nFile-backed pages:                           1393998.\nAnonymous pages:                              665421.\nPages stored in compressor:                  1446753.\nPages occupied by compressor:                 479834.\nDecompressions:                            983271674.\nCompressions:                             1278414336.\nPageins:                                  6063804265.\nPageouts:                                   10665701.\nSwapins:                                    41717685.\nSwapouts:                                   69922789.\nPages tagged:                                 170114.\nPages tagged resident:                        125752.\nPages tagged compressed:                       44362.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1342.\nPages tag-storage non-tag pageable:            90114.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052800.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      }
    },
    {
      "workload": 1,
      "round": 3,
      "mode": 0,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28225355776,
        "swapins": 41717685,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   324543.\nPages active:                                1005597.\nPages inactive:                               971894.\nPages speculative:                             81928.\nPages throttled:                                   0.\nPages wired down:                             220509.\nPages purgeable:                                4197.\n\"Translation faults\":                    14026304891.\nPages copy-on-write:                       640236470.\nPages zero filled:                       15961538779.\nPages reactivated:                        2447109397.\nPages purged:                               63065828.\nFile-backed pages:                           1393999.\nAnonymous pages:                              665420.\nPages stored in compressor:                  1446753.\nPages occupied by compressor:                 479834.\nDecompressions:                            983271674.\nCompressions:                             1278414336.\nPageins:                                  6063804266.\nPageouts:                                   10665701.\nSwapins:                                    41717685.\nSwapouts:                                   69922789.\nPages tagged:                                 170114.\nPages tagged resident:                        125752.\nPages tagged compressed:                       44362.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1344.\nPages tag-storage non-tag pageable:            90112.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052800.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          1.91015625,
          1.62060546875,
          1.6083984375
        ],
        "observed_at_unix_seconds": 1788634932.6715531,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "1"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 1,
        "records": 2048,
        "batches": 512,
        "bytes": 5662310400,
        "read_calls": 18432,
        "seconds": 0.664712002,
        "batch_median_seconds": 0.001289,
        "batch_p95_seconds": 0.001425,
        "sampled_footprint_bytes": 13468080,
        "lifetime_rss_peak_bytes": 13828096,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 11059200,
        "diskio_bytesread": 5964300288,
        "reformat_bytes": 0,
        "tensor_sha256": "25ebd25ee0cf34270baca4336cd648a771d88fd8220bedce3a71397fb629b680"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28395421696,
        "swapins": 41717685,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   328522.\nPages active:                                1015182.\nPages inactive:                               971895.\nPages speculative:                             81928.\nPages throttled:                                   0.\nPages wired down:                             206764.\nPages purgeable:                               10597.\n\"Translation faults\":                    14026309060.\nPages copy-on-write:                       640237265.\nPages zero filled:                       15961542866.\nPages reactivated:                        2447109400.\nPages purged:                               63065828.\nFile-backed pages:                           1394000.\nAnonymous pages:                              675005.\nPages stored in compressor:                  1446752.\nPages occupied by compressor:                 479834.\nDecompressions:                            983271675.\nCompressions:                             1278414336.\nPageins:                                  6063804271.\nPageouts:                                   10665701.\nSwapins:                                    41717685.\nSwapouts:                                   69922789.\nPages tagged:                                 170107.\nPages tagged resident:                        125745.\nPages tagged compressed:                       44362.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1337.\nPages tag-storage non-tag pageable:            90119.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052800.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      }
    },
    {
      "workload": 1,
      "round": 3,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28394242048,
        "swapins": 41717685,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   328448.\nPages active:                                1015178.\nPages inactive:                               971895.\nPages speculative:                             81930.\nPages throttled:                                   0.\nPages wired down:                             206764.\nPages purgeable:                               10597.\n\"Translation faults\":                    14026309703.\nPages copy-on-write:                       640237413.\nPages zero filled:                       15961542918.\nPages reactivated:                        2447109400.\nPages purged:                               63065828.\nFile-backed pages:                           1394002.\nAnonymous pages:                              675001.\nPages stored in compressor:                  1446752.\nPages occupied by compressor:                 479834.\nDecompressions:                            983271675.\nCompressions:                             1278414336.\nPageins:                                  6063804272.\nPageouts:                                   10665701.\nSwapins:                                    41717685.\nSwapouts:                                   69922789.\nPages tagged:                                 170107.\nPages tagged resident:                        125745.\nPages tagged compressed:                       44362.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1337.\nPages tag-storage non-tag pageable:            90119.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052800.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          1.91015625,
          1.62060546875,
          1.6083984375
        ],
        "observed_at_unix_seconds": 1788634935.02936,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "1"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 1,
        "records": 2048,
        "batches": 512,
        "bytes": 5662310400,
        "read_calls": 2048,
        "seconds": 0.986044999,
        "batch_median_seconds": 0.001917,
        "batch_p95_seconds": 0.001992,
        "sampled_footprint_bytes": 24002992,
        "lifetime_rss_peak_bytes": 24363008,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 22118400,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "25ebd25ee0cf34270baca4336cd648a771d88fd8220bedce3a71397fb629b680"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28223651840,
        "swapins": 41717685,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   325450.\nPages active:                                1002902.\nPages inactive:                               971899.\nPages speculative:                             81936.\nPages throttled:                                   0.\nPages wired down:                             222111.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026315838.\nPages copy-on-write:                       640238264.\nPages zero filled:                       15961548433.\nPages reactivated:                        2447109534.\nPages purged:                               63065828.\nFile-backed pages:                           1394012.\nAnonymous pages:                              662725.\nPages stored in compressor:                  1446752.\nPages occupied by compressor:                 479834.\nDecompressions:                            983271675.\nCompressions:                             1278414336.\nPageins:                                  6063804279.\nPageouts:                                   10665701.\nSwapins:                                    41717685.\nSwapouts:                                   69922789.\nPages tagged:                                 170084.\nPages tagged resident:                        125722.\nPages tagged compressed:                       44362.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1339.\nPages tag-storage non-tag pageable:            90117.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052800.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      }
    },
    {
      "workload": 1,
      "round": 4,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28224569344,
        "swapins": 41717685,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   325505.\nPages active:                                1002901.\nPages inactive:                               971899.\nPages speculative:                             81937.\nPages throttled:                                   0.\nPages wired down:                             222111.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026316483.\nPages copy-on-write:                       640238414.\nPages zero filled:                       15961548486.\nPages reactivated:                        2447109534.\nPages purged:                               63065828.\nFile-backed pages:                           1394013.\nAnonymous pages:                              662724.\nPages stored in compressor:                  1446752.\nPages occupied by compressor:                 479834.\nDecompressions:                            983271675.\nCompressions:                             1278414336.\nPageins:                                  6063804280.\nPageouts:                                   10665701.\nSwapins:                                    41717685.\nSwapouts:                                   69922789.\nPages tagged:                                 170084.\nPages tagged resident:                        125722.\nPages tagged compressed:                       44362.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1339.\nPages tag-storage non-tag pageable:            90117.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052800.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888875.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          1.7568359375,
          1.59326171875,
          1.5986328125
        ],
        "observed_at_unix_seconds": 1788634937.6974158,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "1"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 1,
        "records": 2048,
        "batches": 512,
        "bytes": 5662310400,
        "read_calls": 2048,
        "seconds": 0.985324998,
        "batch_median_seconds": 0.001918,
        "batch_p95_seconds": 0.001988,
        "sampled_footprint_bytes": 23986608,
        "lifetime_rss_peak_bytes": 24346624,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 22118400,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "25ebd25ee0cf34270baca4336cd648a771d88fd8220bedce3a71397fb629b680"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28225536000,
        "swapins": 41717685,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   325559.\nPages active:                                1004517.\nPages inactive:                               971900.\nPages speculative:                             81941.\nPages throttled:                                   0.\nPages wired down:                             220509.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026321453.\nPages copy-on-write:                       640239218.\nPages zero filled:                       15961552762.\nPages reactivated:                        2447109534.\nPages purged:                               63065828.\nFile-backed pages:                           1394018.\nAnonymous pages:                              664340.\nPages stored in compressor:                  1446737.\nPages occupied by compressor:                 479829.\nDecompressions:                            983271690.\nCompressions:                             1278414336.\nPageins:                                  6063804285.\nPageouts:                                   10665701.\nSwapins:                                    41717685.\nSwapouts:                                   69922789.\nPages tagged:                                 170072.\nPages tagged resident:                        125711.\nPages tagged compressed:                       44361.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1342.\nPages tag-storage non-tag pageable:            90114.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052544.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888876.\n"
      }
    },
    {
      "workload": 1,
      "round": 4,
      "mode": 0,
      "exclusions": [
        "global swap activity"
      ],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28226502656,
        "swapins": 41717685,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   325616.\nPages active:                                1004513.\nPages inactive:                               971900.\nPages speculative:                             81943.\nPages throttled:                                   0.\nPages wired down:                             220509.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026322103.\nPages copy-on-write:                       640239368.\nPages zero filled:                       15961552813.\nPages reactivated:                        2447109534.\nPages purged:                               63065828.\nFile-backed pages:                           1394020.\nAnonymous pages:                              664336.\nPages stored in compressor:                  1446737.\nPages occupied by compressor:                 479829.\nDecompressions:                            983271690.\nCompressions:                             1278414336.\nPageins:                                  6063804286.\nPageouts:                                   10665701.\nSwapins:                                    41717685.\nSwapouts:                                   69922789.\nPages tagged:                                 170072.\nPages tagged resident:                        125711.\nPages tagged compressed:                       44361.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1341.\nPages tag-storage non-tag pageable:            90115.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052544.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888876.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          1.7568359375,
          1.59326171875,
          1.5986328125
        ],
        "observed_at_unix_seconds": 1788634940.377791,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "1"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 1,
        "records": 2048,
        "batches": 512,
        "bytes": 5662310400,
        "read_calls": 18432,
        "seconds": 0.667448,
        "batch_median_seconds": 0.001291,
        "batch_p95_seconds": 0.001439,
        "sampled_footprint_bytes": 13500872,
        "lifetime_rss_peak_bytes": 13844480,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 11059200,
        "diskio_bytesread": 5964300288,
        "reformat_bytes": 0,
        "tensor_sha256": "25ebd25ee0cf34270baca4336cd648a771d88fd8220bedce3a71397fb629b680"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28224897024,
        "swapins": 41717689,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   325515.\nPages active:                                1002524.\nPages inactive:                               972013.\nPages speculative:                             81945.\nPages throttled:                                   0.\nPages wired down:                             222367.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026326842.\nPages copy-on-write:                       640240254.\nPages zero filled:                       15961557294.\nPages reactivated:                        2447109553.\nPages purged:                               63065828.\nFile-backed pages:                           1394023.\nAnonymous pages:                              662459.\nPages stored in compressor:                  1446732.\nPages occupied by compressor:                 479832.\nDecompressions:                            983271695.\nCompressions:                             1278414336.\nPageins:                                  6063804293.\nPageouts:                                   10665701.\nSwapins:                                    41717689.\nSwapouts:                                   69922789.\nPages tagged:                                 170061.\nPages tagged resident:                        125700.\nPages tagged compressed:                       44361.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1324.\nPages tag-storage non-tag pageable:            90132.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052544.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888876.\n"
      }
    },
    {
      "workload": 1,
      "round": 5,
      "mode": 0,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28225552384,
        "swapins": 41717689,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   325554.\nPages active:                                1002522.\nPages inactive:                               972013.\nPages speculative:                             81946.\nPages throttled:                                   0.\nPages wired down:                             222367.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026327491.\nPages copy-on-write:                       640240404.\nPages zero filled:                       15961557346.\nPages reactivated:                        2447109553.\nPages purged:                               63065828.\nFile-backed pages:                           1394024.\nAnonymous pages:                              662457.\nPages stored in compressor:                  1446732.\nPages occupied by compressor:                 479832.\nDecompressions:                            983271695.\nCompressions:                             1278414336.\nPageins:                                  6063804294.\nPageouts:                                   10665701.\nSwapins:                                    41717689.\nSwapouts:                                   69922789.\nPages tagged:                                 170061.\nPages tagged resident:                        125700.\nPages tagged compressed:                       44361.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1325.\nPages tag-storage non-tag pageable:            90131.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052544.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888876.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.97705078125,
          1.8486328125,
          1.6884765625
        ],
        "observed_at_unix_seconds": 1788634942.715224,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "1"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 1,
        "records": 2048,
        "batches": 512,
        "bytes": 5662310400,
        "read_calls": 18432,
        "seconds": 0.667503,
        "batch_median_seconds": 0.001291,
        "batch_p95_seconds": 0.001429,
        "sampled_footprint_bytes": 13500848,
        "lifetime_rss_peak_bytes": 13860864,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 11059200,
        "diskio_bytesread": 5964300288,
        "reformat_bytes": 0,
        "tensor_sha256": "25ebd25ee0cf34270baca4336cd648a771d88fd8220bedce3a71397fb629b680"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28391211008,
        "swapins": 41717689,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   335664.\nPages active:                                 993923.\nPages inactive:                               970962.\nPages speculative:                             81947.\nPages throttled:                                   0.\nPages wired down:                             222033.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026333397.\nPages copy-on-write:                       640241243.\nPages zero filled:                       15961559766.\nPages reactivated:                        2447109553.\nPages purged:                               63065828.\nFile-backed pages:                           1394025.\nAnonymous pages:                              652807.\nPages stored in compressor:                  1446729.\nPages occupied by compressor:                 479829.\nDecompressions:                            983271698.\nCompressions:                             1278414336.\nPageins:                                  6063804301.\nPageouts:                                   10665701.\nSwapins:                                    41717689.\nSwapouts:                                   69922789.\nPages tagged:                                 169981.\nPages tagged resident:                        125620.\nPages tagged compressed:                       44361.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1318.\nPages tag-storage non-tag pageable:            90138.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052544.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888876.\n"
      }
    },
    {
      "workload": 1,
      "round": 5,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28391702528,
        "swapins": 41717689,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   335693.\nPages active:                                 993920.\nPages inactive:                               970962.\nPages speculative:                             81948.\nPages throttled:                                   0.\nPages wired down:                             222033.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026334050.\nPages copy-on-write:                       640241388.\nPages zero filled:                       15961559817.\nPages reactivated:                        2447109553.\nPages purged:                               63065828.\nFile-backed pages:                           1394026.\nAnonymous pages:                              652804.\nPages stored in compressor:                  1446729.\nPages occupied by compressor:                 479829.\nDecompressions:                            983271698.\nCompressions:                             1278414336.\nPageins:                                  6063804302.\nPageouts:                                   10665701.\nSwapins:                                    41717689.\nSwapouts:                                   69922789.\nPages tagged:                                 169981.\nPages tagged resident:                        125620.\nPages tagged compressed:                       44361.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1317.\nPages tag-storage non-tag pageable:            90139.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052544.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888876.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.97705078125,
          1.8486328125,
          1.6884765625
        ],
        "observed_at_unix_seconds": 1788634945.104609,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "1"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 1,
        "records": 2048,
        "batches": 512,
        "bytes": 5662310400,
        "read_calls": 2048,
        "seconds": 0.985646999,
        "batch_median_seconds": 0.001919,
        "batch_p95_seconds": 0.001988,
        "sampled_footprint_bytes": 23986584,
        "lifetime_rss_peak_bytes": 24363008,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 22118400,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "25ebd25ee0cf34270baca4336cd648a771d88fd8220bedce3a71397fb629b680"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28383379456,
        "swapins": 41717689,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   335179.\nPages active:                                 995921.\nPages inactive:                               970963.\nPages speculative:                             81948.\nPages throttled:                                   0.\nPages wired down:                             220442.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026340469.\nPages copy-on-write:                       640242285.\nPages zero filled:                       15961564397.\nPages reactivated:                        2447109553.\nPages purged:                               63065828.\nFile-backed pages:                           1394032.\nAnonymous pages:                              654800.\nPages stored in compressor:                  1446728.\nPages occupied by compressor:                 479829.\nDecompressions:                            983271699.\nCompressions:                             1278414336.\nPageins:                                  6063804313.\nPageouts:                                   10665701.\nSwapins:                                    41717689.\nSwapouts:                                   69922789.\nPages tagged:                                 169973.\nPages tagged resident:                        125612.\nPages tagged compressed:                       44361.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1320.\nPages tag-storage non-tag pageable:            90136.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052544.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888876.\n"
      }
    },
    {
      "workload": 1,
      "round": 6,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28384215040,
        "swapins": 41717689,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   335228.\nPages active:                                 995918.\nPages inactive:                               970963.\nPages speculative:                             81950.\nPages throttled:                                   0.\nPages wired down:                             220442.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026341130.\nPages copy-on-write:                       640242430.\nPages zero filled:                       15961564450.\nPages reactivated:                        2447109553.\nPages purged:                               63065828.\nFile-backed pages:                           1394034.\nAnonymous pages:                              654797.\nPages stored in compressor:                  1446728.\nPages occupied by compressor:                 479829.\nDecompressions:                            983271699.\nCompressions:                             1278414336.\nPageins:                                  6063804314.\nPageouts:                                   10665701.\nSwapins:                                    41717689.\nSwapouts:                                   69922789.\nPages tagged:                                 169973.\nPages tagged resident:                        125612.\nPages tagged compressed:                       44361.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1323.\nPages tag-storage non-tag pageable:            90133.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052544.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888876.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          3.138671875,
          1.90087890625,
          1.70751953125
        ],
        "observed_at_unix_seconds": 1788634947.784512,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "1"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 1,
        "records": 2048,
        "batches": 512,
        "bytes": 5662310400,
        "read_calls": 2048,
        "seconds": 0.984768999,
        "batch_median_seconds": 0.001916,
        "batch_p95_seconds": 0.001991,
        "sampled_footprint_bytes": 24002992,
        "lifetime_rss_peak_bytes": 24363008,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 22118400,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "25ebd25ee0cf34270baca4336cd648a771d88fd8220bedce3a71397fb629b680"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28383379456,
        "swapins": 41717689,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   335176.\nPages active:                                 995950.\nPages inactive:                               970964.\nPages speculative:                             81950.\nPages throttled:                                   0.\nPages wired down:                             220442.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026347356.\nPages copy-on-write:                       640243270.\nPages zero filled:                       15961567244.\nPages reactivated:                        2447109553.\nPages purged:                               63065828.\nFile-backed pages:                           1394035.\nAnonymous pages:                              654829.\nPages stored in compressor:                  1446727.\nPages occupied by compressor:                 479827.\nDecompressions:                            983271700.\nCompressions:                             1278414336.\nPageins:                                  6063804321.\nPageouts:                                   10665701.\nSwapins:                                    41717689.\nSwapouts:                                   69922789.\nPages tagged:                                 169954.\nPages tagged resident:                        125593.\nPages tagged compressed:                       44361.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1321.\nPages tag-storage non-tag pageable:            90135.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052544.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888876.\n"
      }
    },
    {
      "workload": 1,
      "round": 6,
      "mode": 0,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28384346112,
        "swapins": 41717689,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   335234.\nPages active:                                 995946.\nPages inactive:                               970964.\nPages speculative:                             81951.\nPages throttled:                                   0.\nPages wired down:                             220442.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026348016.\nPages copy-on-write:                       640243417.\nPages zero filled:                       15961567296.\nPages reactivated:                        2447109553.\nPages purged:                               63065828.\nFile-backed pages:                           1394036.\nAnonymous pages:                              654825.\nPages stored in compressor:                  1446727.\nPages occupied by compressor:                 479827.\nDecompressions:                            983271700.\nCompressions:                             1278414336.\nPageins:                                  6063804322.\nPageouts:                                   10665701.\nSwapins:                                    41717689.\nSwapouts:                                   69922789.\nPages tagged:                                 169954.\nPages tagged resident:                        125593.\nPages tagged compressed:                       44361.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1319.\nPages tag-storage non-tag pageable:            90137.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052544.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888876.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          3.138671875,
          1.90087890625,
          1.70751953125
        ],
        "observed_at_unix_seconds": 1788634950.4935548,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "1"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 1,
        "records": 2048,
        "batches": 512,
        "bytes": 5662310400,
        "read_calls": 18432,
        "seconds": 0.667255998,
        "batch_median_seconds": 0.001289,
        "batch_p95_seconds": 0.001434,
        "sampled_footprint_bytes": 14877152,
        "lifetime_rss_peak_bytes": 15204352,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 11059200,
        "diskio_bytesread": 5964300288,
        "reformat_bytes": 0,
        "tensor_sha256": "25ebd25ee0cf34270baca4336cd648a771d88fd8220bedce3a71397fb629b680"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28560162816,
        "swapins": 41717689,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   338241.\nPages active:                                1006895.\nPages inactive:                               970979.\nPages speculative:                             81954.\nPages throttled:                                   0.\nPages wired down:                             206698.\nPages purgeable:                               10892.\n\"Translation faults\":                    14026361767.\nPages copy-on-write:                       640245194.\nPages zero filled:                       15961569887.\nPages reactivated:                        2447109556.\nPages purged:                               63065828.\nFile-backed pages:                           1394041.\nAnonymous pages:                              665787.\nPages stored in compressor:                  1446682.\nPages occupied by compressor:                 479787.\nDecompressions:                            983271745.\nCompressions:                             1278414336.\nPageins:                                  6063804331.\nPageouts:                                   10665701.\nSwapins:                                    41717689.\nSwapouts:                                   69922789.\nPages tagged:                                 170010.\nPages tagged resident:                        125649.\nPages tagged compressed:                       44361.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1378.\nPages tag-storage non-tag pageable:            90078.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052544.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888876.\n"
      }
    },
    {
      "workload": 1,
      "round": 7,
      "mode": 0,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28558868480,
        "swapins": 41717689,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   338160.\nPages active:                                1006895.\nPages inactive:                               970979.\nPages speculative:                             81956.\nPages throttled:                                   0.\nPages wired down:                             206698.\nPages purgeable:                               10892.\n\"Translation faults\":                    14026362430.\nPages copy-on-write:                       640245337.\nPages zero filled:                       15961569939.\nPages reactivated:                        2447109556.\nPages purged:                               63065828.\nFile-backed pages:                           1394043.\nAnonymous pages:                              665787.\nPages stored in compressor:                  1446682.\nPages occupied by compressor:                 479787.\nDecompressions:                            983271745.\nCompressions:                             1278414336.\nPageins:                                  6063804332.\nPageouts:                                   10665701.\nSwapins:                                    41717689.\nSwapouts:                                   69922789.\nPages tagged:                                 170010.\nPages tagged resident:                        125649.\nPages tagged compressed:                       44361.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1380.\nPages tag-storage non-tag pageable:            90076.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052544.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888876.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.96728515625,
          1.8857421875,
          1.703125
        ],
        "observed_at_unix_seconds": 1788634952.872776,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "1"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 1,
        "records": 2048,
        "batches": 512,
        "bytes": 5662310400,
        "read_calls": 18432,
        "seconds": 0.665730997,
        "batch_median_seconds": 0.001292,
        "batch_p95_seconds": 0.001427,
        "sampled_footprint_bytes": 13484464,
        "lifetime_rss_peak_bytes": 13844480,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 11059200,
        "diskio_bytesread": 5964300288,
        "reformat_bytes": 0,
        "tensor_sha256": "25ebd25ee0cf34270baca4336cd648a771d88fd8220bedce3a71397fb629b680"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28385148928,
        "swapins": 41717689,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   335264.\nPages active:                                 995746.\nPages inactive:                               970996.\nPages speculative:                             81967.\nPages throttled:                                   0.\nPages wired down:                             220700.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026368025.\nPages copy-on-write:                       640246159.\nPages zero filled:                       15961578170.\nPages reactivated:                        2447109556.\nPages purged:                               63065828.\nFile-backed pages:                           1394055.\nAnonymous pages:                              654654.\nPages stored in compressor:                  1446675.\nPages occupied by compressor:                 479785.\nDecompressions:                            983271752.\nCompressions:                             1278414336.\nPageins:                                  6063804339.\nPageouts:                                   10665701.\nSwapins:                                    41717689.\nSwapouts:                                   69922789.\nPages tagged:                                 169992.\nPages tagged resident:                        125631.\nPages tagged compressed:                       44361.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1379.\nPages tag-storage non-tag pageable:            90077.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052544.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888876.\n"
      }
    },
    {
      "workload": 1,
      "round": 7,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28383969280,
        "swapins": 41717689,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   335191.\nPages active:                                 995742.\nPages inactive:                               970996.\nPages speculative:                             81968.\nPages throttled:                                   0.\nPages wired down:                             220700.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026368693.\nPages copy-on-write:                       640246304.\nPages zero filled:                       15961578221.\nPages reactivated:                        2447109556.\nPages purged:                               63065828.\nFile-backed pages:                           1394056.\nAnonymous pages:                              654650.\nPages stored in compressor:                  1446675.\nPages occupied by compressor:                 479785.\nDecompressions:                            983271752.\nCompressions:                             1278414336.\nPageins:                                  6063804340.\nPageouts:                                   10665701.\nSwapins:                                    41717689.\nSwapouts:                                   69922789.\nPages tagged:                                 169992.\nPages tagged resident:                        125631.\nPages tagged compressed:                       44361.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1379.\nPages tag-storage non-tag pageable:            90077.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052544.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888876.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.96728515625,
          1.8857421875,
          1.703125
        ],
        "observed_at_unix_seconds": 1788634955.244139,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "1"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 1,
        "records": 2048,
        "batches": 512,
        "bytes": 5662310400,
        "read_calls": 2048,
        "seconds": 0.984768002,
        "batch_median_seconds": 0.001916,
        "batch_p95_seconds": 0.001993,
        "sampled_footprint_bytes": 23986584,
        "lifetime_rss_peak_bytes": 24363008,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 22118400,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "25ebd25ee0cf34270baca4336cd648a771d88fd8220bedce3a71397fb629b680"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28395520000,
        "swapins": 41717689,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   335900.\nPages active:                                 995140.\nPages inactive:                               970997.\nPages speculative:                             81967.\nPages throttled:                                   0.\nPages wired down:                             220426.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026373505.\nPages copy-on-write:                       640247085.\nPages zero filled:                       15961579654.\nPages reactivated:                        2447109562.\nPages purged:                               63065828.\nFile-backed pages:                           1394052.\nAnonymous pages:                              654052.\nPages stored in compressor:                  1446673.\nPages occupied by compressor:                 479784.\nDecompressions:                            983271754.\nCompressions:                             1278414336.\nPageins:                                  6063804345.\nPageouts:                                   10665701.\nSwapins:                                    41717689.\nSwapouts:                                   69922789.\nPages tagged:                                 169980.\nPages tagged resident:                        125619.\nPages tagged compressed:                       44361.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1427.\nPages tag-storage non-tag pageable:            90029.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052544.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888876.\n"
      }
    },
    {
      "workload": 2,
      "round": 1,
      "mode": 0,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28393816064,
        "swapins": 41717689,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   335795.\nPages active:                                 995140.\nPages inactive:                               970997.\nPages speculative:                             81968.\nPages throttled:                                   0.\nPages wired down:                             220426.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026374178.\nPages copy-on-write:                       640247231.\nPages zero filled:                       15961579708.\nPages reactivated:                        2447109562.\nPages purged:                               63065828.\nFile-backed pages:                           1394053.\nAnonymous pages:                              654052.\nPages stored in compressor:                  1446673.\nPages occupied by compressor:                 479784.\nDecompressions:                            983271754.\nCompressions:                             1278414336.\nPageins:                                  6063804346.\nPageouts:                                   10665701.\nSwapins:                                    41717689.\nSwapouts:                                   69922789.\nPages tagged:                                 169980.\nPages tagged resident:                        125619.\nPages tagged compressed:                       44361.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1429.\nPages tag-storage non-tag pageable:            90027.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052544.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888876.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.8095703125,
          1.87060546875,
          1.69873046875
        ],
        "observed_at_unix_seconds": 1788634957.91847,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "2"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 2,
        "records": 2048,
        "batches": 208,
        "bytes": 5662310400,
        "read_calls": 18432,
        "seconds": 0.550347003,
        "batch_median_seconds": 0.002668,
        "batch_p95_seconds": 0.002849,
        "sampled_footprint_bytes": 32260552,
        "lifetime_rss_peak_bytes": 32604160,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 27648000,
        "diskio_bytesread": 5964300288,
        "reformat_bytes": 0,
        "tensor_sha256": "2de130e51531ec50c3663d361c9666706ec3bc3577986cad830fd51c8c62aff7"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28571680768,
        "swapins": 41717689,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   338931.\nPages active:                                1006013.\nPages inactive:                               970998.\nPages speculative:                             81968.\nPages throttled:                                   0.\nPages wired down:                             206680.\nPages purgeable:                               10892.\n\"Translation faults\":                    14026380826.\nPages copy-on-write:                       640248073.\nPages zero filled:                       15961583120.\nPages reactivated:                        2447109562.\nPages purged:                               63065828.\nFile-backed pages:                           1394054.\nAnonymous pages:                              664925.\nPages stored in compressor:                  1446673.\nPages occupied by compressor:                 479784.\nDecompressions:                            983271754.\nCompressions:                             1278414336.\nPageins:                                  6063804353.\nPageouts:                                   10665701.\nSwapins:                                    41717689.\nSwapouts:                                   69922789.\nPages tagged:                                 169972.\nPages tagged resident:                        125611.\nPages tagged compressed:                       44361.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1429.\nPages tag-storage non-tag pageable:            90027.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052544.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888876.\n"
      }
    },
    {
      "workload": 2,
      "round": 1,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28574187520,
        "swapins": 41717689,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   339082.\nPages active:                                1006013.\nPages inactive:                               970998.\nPages speculative:                             81970.\nPages throttled:                                   0.\nPages wired down:                             206680.\nPages purgeable:                               10892.\n\"Translation faults\":                    14026381500.\nPages copy-on-write:                       640248220.\nPages zero filled:                       15961583171.\nPages reactivated:                        2447109562.\nPages purged:                               63065828.\nFile-backed pages:                           1394056.\nAnonymous pages:                              664925.\nPages stored in compressor:                  1446673.\nPages occupied by compressor:                 479784.\nDecompressions:                            983271754.\nCompressions:                             1278414336.\nPageins:                                  6063804354.\nPageouts:                                   10665701.\nSwapins:                                    41717689.\nSwapouts:                                   69922789.\nPages tagged:                                 169972.\nPages tagged resident:                        125611.\nPages tagged compressed:                       44361.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1426.\nPages tag-storage non-tag pageable:            90030.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052544.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888876.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.8095703125,
          1.87060546875,
          1.69873046875
        ],
        "observed_at_unix_seconds": 1788634960.1288939,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "2"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 2,
        "records": 2048,
        "batches": 208,
        "bytes": 5662310400,
        "read_calls": 2048,
        "seconds": 0.669734999,
        "batch_median_seconds": 0.003236,
        "batch_p95_seconds": 0.003371,
        "sampled_footprint_bytes": 59916768,
        "lifetime_rss_peak_bytes": 60243968,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 55296000,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "2de130e51531ec50c3663d361c9666706ec3bc3577986cad830fd51c8c62aff7"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28392734720,
        "swapins": 41717689,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   335725.\nPages active:                                 994839.\nPages inactive:                               970999.\nPages speculative:                             81970.\nPages throttled:                                   0.\nPages wired down:                             220680.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026388553.\nPages copy-on-write:                       640249029.\nPages zero filled:                       15961589117.\nPages reactivated:                        2447109562.\nPages purged:                               63065828.\nFile-backed pages:                           1394057.\nAnonymous pages:                              653751.\nPages stored in compressor:                  1446670.\nPages occupied by compressor:                 479784.\nDecompressions:                            983271757.\nCompressions:                             1278414336.\nPageins:                                  6063804359.\nPageouts:                                   10665701.\nSwapins:                                    41717689.\nSwapouts:                                   69922789.\nPages tagged:                                 170016.\nPages tagged resident:                        125655.\nPages tagged compressed:                       44361.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1428.\nPages tag-storage non-tag pageable:            90028.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052544.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888876.\n"
      }
    },
    {
      "workload": 2,
      "round": 2,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28393242624,
        "swapins": 41717689,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   335755.\nPages active:                                 994845.\nPages inactive:                               970999.\nPages speculative:                             81971.\nPages throttled:                                   0.\nPages wired down:                             220680.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026389223.\nPages copy-on-write:                       640249173.\nPages zero filled:                       15961589170.\nPages reactivated:                        2447109562.\nPages purged:                               63065828.\nFile-backed pages:                           1394058.\nAnonymous pages:                              653757.\nPages stored in compressor:                  1446670.\nPages occupied by compressor:                 479784.\nDecompressions:                            983271757.\nCompressions:                             1278414336.\nPageins:                                  6063804360.\nPageouts:                                   10665701.\nSwapins:                                    41717689.\nSwapouts:                                   69922789.\nPages tagged:                                 170016.\nPages tagged resident:                        125655.\nPages tagged compressed:                       44361.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1433.\nPages tag-storage non-tag pageable:            90023.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052544.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888876.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.74462890625,
          1.87255859375,
          1.7001953125
        ],
        "observed_at_unix_seconds": 1788634962.465195,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "2"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 2,
        "records": 2048,
        "batches": 208,
        "bytes": 5662310400,
        "read_calls": 2048,
        "seconds": 0.669710998,
        "batch_median_seconds": 0.003236,
        "batch_p95_seconds": 0.003383,
        "sampled_footprint_bytes": 59933152,
        "lifetime_rss_peak_bytes": 60260352,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 55296000,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "2de130e51531ec50c3663d361c9666706ec3bc3577986cad830fd51c8c62aff7"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28395290624,
        "swapins": 41717689,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   335879.\nPages active:                                 995163.\nPages inactive:                               971000.\nPages speculative:                             81971.\nPages throttled:                                   0.\nPages wired down:                             220424.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026396986.\nPages copy-on-write:                       640250077.\nPages zero filled:                       15961592088.\nPages reactivated:                        2447109562.\nPages purged:                               63065828.\nFile-backed pages:                           1394059.\nAnonymous pages:                              654075.\nPages stored in compressor:                  1446638.\nPages occupied by compressor:                 479774.\nDecompressions:                            983271789.\nCompressions:                             1278414336.\nPageins:                                  6063804367.\nPageouts:                                   10665701.\nSwapins:                                    41717689.\nSwapouts:                                   69922789.\nPages tagged:                                 170004.\nPages tagged resident:                        125643.\nPages tagged compressed:                       44361.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1419.\nPages tag-storage non-tag pageable:            90037.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052544.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888876.\n"
      }
    },
    {
      "workload": 2,
      "round": 2,
      "mode": 0,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28395945984,
        "swapins": 41717689,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   335917.\nPages active:                                 995163.\nPages inactive:                               971000.\nPages speculative:                             81973.\nPages throttled:                                   0.\nPages wired down:                             220424.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026397659.\nPages copy-on-write:                       640250223.\nPages zero filled:                       15961592141.\nPages reactivated:                        2447109562.\nPages purged:                               63065828.\nFile-backed pages:                           1394061.\nAnonymous pages:                              654075.\nPages stored in compressor:                  1446638.\nPages occupied by compressor:                 479774.\nDecompressions:                            983271789.\nCompressions:                             1278414336.\nPageins:                                  6063804368.\nPageouts:                                   10665701.\nSwapins:                                    41717689.\nSwapouts:                                   69922789.\nPages tagged:                                 170004.\nPages tagged resident:                        125643.\nPages tagged compressed:                       44361.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1417.\nPages tag-storage non-tag pageable:            90039.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052544.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888876.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.74462890625,
          1.87255859375,
          1.7001953125
        ],
        "observed_at_unix_seconds": 1788634964.781024,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "2"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 2,
        "records": 2048,
        "batches": 208,
        "bytes": 5662310400,
        "read_calls": 18432,
        "seconds": 0.551944999,
        "batch_median_seconds": 0.002679,
        "batch_p95_seconds": 0.002854,
        "sampled_footprint_bytes": 32244144,
        "lifetime_rss_peak_bytes": 32604160,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 27648000,
        "diskio_bytesread": 5964300288,
        "reformat_bytes": 0,
        "tensor_sha256": "2de130e51531ec50c3663d361c9666706ec3bc3577986cad830fd51c8c62aff7"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28391030784,
        "swapins": 41717689,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   335610.\nPages active:                                 995176.\nPages inactive:                               971005.\nPages speculative:                             81975.\nPages throttled:                                   0.\nPages wired down:                             220424.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026404603.\nPages copy-on-write:                       640251061.\nPages zero filled:                       15961595552.\nPages reactivated:                        2447109696.\nPages purged:                               63065828.\nFile-backed pages:                           1394068.\nAnonymous pages:                              654088.\nPages stored in compressor:                  1446638.\nPages occupied by compressor:                 479774.\nDecompressions:                            983271789.\nCompressions:                             1278414336.\nPageins:                                  6063804375.\nPageouts:                                   10665701.\nSwapins:                                    41717689.\nSwapouts:                                   69922789.\nPages tagged:                                 170053.\nPages tagged resident:                        125692.\nPages tagged compressed:                       44361.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1415.\nPages tag-storage non-tag pageable:            90041.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052544.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888876.\n"
      }
    },
    {
      "workload": 2,
      "round": 3,
      "mode": 0,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28393652224,
        "swapins": 41717689,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   335769.\nPages active:                                 995168.\nPages inactive:                               971005.\nPages speculative:                             81976.\nPages throttled:                                   0.\nPages wired down:                             220424.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026405279.\nPages copy-on-write:                       640251208.\nPages zero filled:                       15961595604.\nPages reactivated:                        2447109696.\nPages purged:                               63065828.\nFile-backed pages:                           1394069.\nAnonymous pages:                              654080.\nPages stored in compressor:                  1446638.\nPages occupied by compressor:                 479774.\nDecompressions:                            983271789.\nCompressions:                             1278414336.\nPageins:                                  6063804376.\nPageouts:                                   10665701.\nSwapins:                                    41717689.\nSwapouts:                                   69922789.\nPages tagged:                                 170053.\nPages tagged resident:                        125692.\nPages tagged compressed:                       44361.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1421.\nPages tag-storage non-tag pageable:            90035.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052544.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888876.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          4.0458984375,
          2.15673828125,
          1.80126953125
        ],
        "observed_at_unix_seconds": 1788634967.0085492,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "2"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 2,
        "records": 2048,
        "batches": 208,
        "bytes": 5662310400,
        "read_calls": 18432,
        "seconds": 0.549906998,
        "batch_median_seconds": 0.002668,
        "batch_p95_seconds": 0.002839,
        "sampled_footprint_bytes": 32227736,
        "lifetime_rss_peak_bytes": 32604160,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 27648000,
        "diskio_bytesread": 5964300288,
        "reformat_bytes": 0,
        "tensor_sha256": "2de130e51531ec50c3663d361c9666706ec3bc3577986cad830fd51c8c62aff7"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28399648768,
        "swapins": 41717689,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   336134.\nPages active:                                 993302.\nPages inactive:                               971022.\nPages speculative:                             81976.\nPages throttled:                                   0.\nPages wired down:                             222280.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026410741.\nPages copy-on-write:                       640251993.\nPages zero filled:                       15961601214.\nPages reactivated:                        2447109696.\nPages purged:                               63065828.\nFile-backed pages:                           1394070.\nAnonymous pages:                              652230.\nPages stored in compressor:                  1446636.\nPages occupied by compressor:                 479771.\nDecompressions:                            983271791.\nCompressions:                             1278414336.\nPageins:                                  6063804381.\nPageouts:                                   10665701.\nSwapins:                                    41717689.\nSwapouts:                                   69922789.\nPages tagged:                                 170042.\nPages tagged resident:                        125681.\nPages tagged compressed:                       44361.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1401.\nPages tag-storage non-tag pageable:            90055.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052544.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888876.\n"
      }
    },
    {
      "workload": 2,
      "round": 3,
      "mode": 2,
      "exclusions": [
        "global swap activity"
      ],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28398092288,
        "swapins": 41717689,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   336037.\nPages active:                                 993301.\nPages inactive:                               971022.\nPages speculative:                             81978.\nPages throttled:                                   0.\nPages wired down:                             222280.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026411419.\nPages copy-on-write:                       640252137.\nPages zero filled:                       15961601265.\nPages reactivated:                        2447109696.\nPages purged:                               63065828.\nFile-backed pages:                           1394072.\nAnonymous pages:                              652229.\nPages stored in compressor:                  1446636.\nPages occupied by compressor:                 479771.\nDecompressions:                            983271791.\nCompressions:                             1278414336.\nPageins:                                  6063804382.\nPageouts:                                   10665701.\nSwapins:                                    41717689.\nSwapouts:                                   69922789.\nPages tagged:                                 170042.\nPages tagged resident:                        125681.\nPages tagged compressed:                       44361.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1391.\nPages tag-storage non-tag pageable:            90065.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052544.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888876.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          4.0458984375,
          2.15673828125,
          1.80126953125
        ],
        "observed_at_unix_seconds": 1788634969.217283,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "2"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 2,
        "records": 2048,
        "batches": 208,
        "bytes": 5662310400,
        "read_calls": 2048,
        "seconds": 0.671390999,
        "batch_median_seconds": 0.003247,
        "batch_p95_seconds": 0.003378,
        "sampled_footprint_bytes": 59916768,
        "lifetime_rss_peak_bytes": 60243968,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 55296000,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "2de130e51531ec50c3663d361c9666706ec3bc3577986cad830fd51c8c62aff7"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28318728192,
        "swapins": 41717693,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   330802.\nPages active:                                 998042.\nPages inactive:                               971214.\nPages speculative:                             82129.\nPages throttled:                                   0.\nPages wired down:                             222201.\nPages purgeable:                                3177.\n\"Translation faults\":                    14026432868.\nPages copy-on-write:                       640254345.\nPages zero filled:                       15961609046.\nPages reactivated:                        2447109696.\nPages purged:                               63065828.\nFile-backed pages:                           1394459.\nAnonymous pages:                              656926.\nPages stored in compressor:                  1446501.\nPages occupied by compressor:                 479745.\nDecompressions:                            983271926.\nCompressions:                             1278414336.\nPageins:                                  6063804702.\nPageouts:                                   10665701.\nSwapins:                                    41717693.\nSwapouts:                                   69922789.\nPages tagged:                                 171200.\nPages tagged resident:                        126842.\nPages tagged compressed:                       44358.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1387.\nPages tag-storage non-tag pageable:            90069.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052160.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888879.\n"
      }
    },
    {
      "workload": 2,
      "round": 4,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28321251328,
        "swapins": 41717693,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   330955.\nPages active:                                 998038.\nPages inactive:                               971214.\nPages speculative:                             82130.\nPages throttled:                                   0.\nPages wired down:                             222203.\nPages purgeable:                                3177.\n\"Translation faults\":                    14026433547.\nPages copy-on-write:                       640254487.\nPages zero filled:                       15961609099.\nPages reactivated:                        2447109696.\nPages purged:                               63065828.\nFile-backed pages:                           1394460.\nAnonymous pages:                              656922.\nPages stored in compressor:                  1446501.\nPages occupied by compressor:                 479745.\nDecompressions:                            983271926.\nCompressions:                             1278414336.\nPageins:                                  6063804703.\nPageouts:                                   10665701.\nSwapins:                                    41717693.\nSwapouts:                                   69922789.\nPages tagged:                                 171200.\nPages tagged resident:                        126842.\nPages tagged compressed:                       44358.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1385.\nPages tag-storage non-tag pageable:            90071.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052160.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888879.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          4.0419921875,
          2.18701171875,
          1.81396484375
        ],
        "observed_at_unix_seconds": 1788634971.611032,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "2"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 2,
        "records": 2048,
        "batches": 208,
        "bytes": 5662310400,
        "read_calls": 2048,
        "seconds": 0.671605001,
        "batch_median_seconds": 0.003246,
        "batch_p95_seconds": 0.003399,
        "sampled_footprint_bytes": 59933152,
        "lifetime_rss_peak_bytes": 60260352,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 55296000,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "2de130e51531ec50c3663d361c9666706ec3bc3577986cad830fd51c8c62aff7"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 27963359232,
        "swapins": 41717693,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   309538.\nPages active:                                1007342.\nPages inactive:                               972171.\nPages speculative:                             82147.\nPages throttled:                                   0.\nPages wired down:                             233317.\nPages purgeable:                                2727.\n\"Translation faults\":                    14026470601.\nPages copy-on-write:                       640256470.\nPages zero filled:                       15961642794.\nPages reactivated:                        2447109699.\nPages purged:                               63065828.\nFile-backed pages:                           1394483.\nAnonymous pages:                              667177.\nPages stored in compressor:                  1446478.\nPages occupied by compressor:                 479734.\nDecompressions:                            983271949.\nCompressions:                             1278414336.\nPageins:                                  6063804739.\nPageouts:                                   10665701.\nSwapins:                                    41717693.\nSwapouts:                                   69922789.\nPages tagged:                                 171172.\nPages tagged resident:                        126814.\nPages tagged compressed:                       44358.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1316.\nPages tag-storage non-tag pageable:            90140.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052160.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888879.\n"
      }
    },
    {
      "workload": 2,
      "round": 4,
      "mode": 0,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 27962130432,
        "swapins": 41717693,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   309462.\nPages active:                                1007344.\nPages inactive:                               972171.\nPages speculative:                             82148.\nPages throttled:                                   0.\nPages wired down:                             233317.\nPages purgeable:                                2727.\n\"Translation faults\":                    14026471288.\nPages copy-on-write:                       640256615.\nPages zero filled:                       15961642850.\nPages reactivated:                        2447109699.\nPages purged:                               63065828.\nFile-backed pages:                           1394484.\nAnonymous pages:                              667179.\nPages stored in compressor:                  1446478.\nPages occupied by compressor:                 479734.\nDecompressions:                            983271949.\nCompressions:                             1278414336.\nPageins:                                  6063804740.\nPageouts:                                   10665701.\nSwapins:                                    41717693.\nSwapouts:                                   69922789.\nPages tagged:                                 171172.\nPages tagged resident:                        126814.\nPages tagged compressed:                       44358.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1319.\nPages tag-storage non-tag pageable:            90137.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7052160.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888879.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          4.0419921875,
          2.18701171875,
          1.81396484375
        ],
        "observed_at_unix_seconds": 1788634973.9690518,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "2"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 2,
        "records": 2048,
        "batches": 208,
        "bytes": 5662310400,
        "read_calls": 18432,
        "seconds": 0.550460002,
        "batch_median_seconds": 0.002674,
        "batch_p95_seconds": 0.002836,
        "sampled_footprint_bytes": 32260552,
        "lifetime_rss_peak_bytes": 32604160,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 27648000,
        "diskio_bytesread": 5964300288,
        "reformat_bytes": 0,
        "tensor_sha256": "2de130e51531ec50c3663d361c9666706ec3bc3577986cad830fd51c8c62aff7"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28127494144,
        "swapins": 41717693,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   312437.\nPages active:                                1014870.\nPages inactive:                               972172.\nPages speculative:                             82151.\nPages throttled:                                   0.\nPages wired down:                             222585.\nPages purgeable:                                9832.\n\"Translation faults\":                    14026487266.\nPages copy-on-write:                       640257662.\nPages zero filled:                       15961654384.\nPages reactivated:                        2447109699.\nPages purged:                               63065828.\nFile-backed pages:                           1394497.\nAnonymous pages:                              674696.\nPages stored in compressor:                  1446469.\nPages occupied by compressor:                 479732.\nDecompressions:                            983271955.\nCompressions:                             1278414336.\nPageins:                                  6063804757.\nPageouts:                                   10665701.\nSwapins:                                    41717693.\nSwapouts:                                   69922789.\nPages tagged:                                 171349.\nPages tagged resident:                        126995.\nPages tagged compressed:                       44354.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1325.\nPages tag-storage non-tag pageable:            90131.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051904.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888880.\n"
      }
    },
    {
      "workload": 2,
      "round": 5,
      "mode": 0,
      "exclusions": [
        "global swap activity"
      ],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28128264192,
        "swapins": 41717693,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   312482.\nPages active:                                1014868.\nPages inactive:                               972172.\nPages speculative:                             82153.\nPages throttled:                                   0.\nPages wired down:                             222585.\nPages purgeable:                                9832.\n\"Translation faults\":                    14026487956.\nPages copy-on-write:                       640257807.\nPages zero filled:                       15961654440.\nPages reactivated:                        2447109699.\nPages purged:                               63065828.\nFile-backed pages:                           1394499.\nAnonymous pages:                              674694.\nPages stored in compressor:                  1446469.\nPages occupied by compressor:                 479732.\nDecompressions:                            983271955.\nCompressions:                             1278414336.\nPageins:                                  6063804758.\nPageouts:                                   10665701.\nSwapins:                                    41717693.\nSwapouts:                                   69922789.\nPages tagged:                                 171349.\nPages tagged resident:                        126995.\nPages tagged compressed:                       44354.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1324.\nPages tag-storage non-tag pageable:            90132.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051904.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888880.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          3.95849609375,
          2.2001953125,
          1.82080078125
        ],
        "observed_at_unix_seconds": 1788634976.233918,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "2"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 2,
        "records": 2048,
        "batches": 208,
        "bytes": 5662310400,
        "read_calls": 18432,
        "seconds": 0.551915999,
        "batch_median_seconds": 0.002684,
        "batch_p95_seconds": 0.002846,
        "sampled_footprint_bytes": 32260528,
        "lifetime_rss_peak_bytes": 32620544,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 27648000,
        "diskio_bytesread": 5964300288,
        "reformat_bytes": 0,
        "tensor_sha256": "2de130e51531ec50c3663d361c9666706ec3bc3577986cad830fd51c8c62aff7"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28126707712,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   314688.\nPages active:                                1014665.\nPages inactive:                               972172.\nPages speculative:                             82154.\nPages throttled:                                   0.\nPages wired down:                             220724.\nPages purgeable:                                7525.\n\"Translation faults\":                    14026500476.\nPages copy-on-write:                       640258596.\nPages zero filled:                       15961661540.\nPages reactivated:                        2447109699.\nPages purged:                               63065828.\nFile-backed pages:                           1394505.\nAnonymous pages:                              674486.\nPages stored in compressor:                  1446454.\nPages occupied by compressor:                 479732.\nDecompressions:                            983271970.\nCompressions:                             1278414336.\nPageins:                                  6063804765.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 171398.\nPages tagged resident:                        127044.\nPages tagged compressed:                       44354.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1328.\nPages tag-storage non-tag pageable:            90128.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051904.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888880.\n"
      }
    },
    {
      "workload": 2,
      "round": 5,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28129427456,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   314853.\nPages active:                                1014670.\nPages inactive:                               972172.\nPages speculative:                             82155.\nPages throttled:                                   0.\nPages wired down:                             220724.\nPages purgeable:                                7525.\n\"Translation faults\":                    14026501172.\nPages copy-on-write:                       640258740.\nPages zero filled:                       15961661596.\nPages reactivated:                        2447109699.\nPages purged:                               63065828.\nFile-backed pages:                           1394506.\nAnonymous pages:                              674491.\nPages stored in compressor:                  1446454.\nPages occupied by compressor:                 479732.\nDecompressions:                            983271970.\nCompressions:                             1278414336.\nPageins:                                  6063804766.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 171398.\nPages tagged resident:                        127044.\nPages tagged compressed:                       44354.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1334.\nPages tag-storage non-tag pageable:            90122.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051904.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888880.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          3.95849609375,
          2.2001953125,
          1.82080078125
        ],
        "observed_at_unix_seconds": 1788634978.4480681,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "2"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 2,
        "records": 2048,
        "batches": 208,
        "bytes": 5662310400,
        "read_calls": 2048,
        "seconds": 0.666482997,
        "batch_median_seconds": 0.003221,
        "batch_p95_seconds": 0.00336,
        "sampled_footprint_bytes": 59900360,
        "lifetime_rss_peak_bytes": 60243968,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 55296000,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "2de130e51531ec50c3663d361c9666706ec3bc3577986cad830fd51c8c62aff7"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 27820752896,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   301193.\nPages active:                                1007790.\nPages inactive:                               972173.\nPages speculative:                             82162.\nPages throttled:                                   0.\nPages wired down:                             241072.\nPages purgeable:                                2337.\n\"Translation faults\":                    14026517642.\nPages copy-on-write:                       640259571.\nPages zero filled:                       15961689356.\nPages reactivated:                        2447109699.\nPages purged:                               63066276.\nFile-backed pages:                           1394514.\nAnonymous pages:                              667611.\nPages stored in compressor:                  1446453.\nPages occupied by compressor:                 479732.\nDecompressions:                            983271971.\nCompressions:                             1278414336.\nPageins:                                  6063804773.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 171450.\nPages tagged resident:                        127097.\nPages tagged compressed:                       44353.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1382.\nPages tag-storage non-tag pageable:            90074.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051840.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888881.\n"
      }
    },
    {
      "workload": 2,
      "round": 6,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 27819655168,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   301124.\nPages active:                                1007792.\nPages inactive:                               972173.\nPages speculative:                             82164.\nPages throttled:                                   0.\nPages wired down:                             241072.\nPages purgeable:                                2337.\n\"Translation faults\":                    14026518340.\nPages copy-on-write:                       640259715.\nPages zero filled:                       15961689412.\nPages reactivated:                        2447109699.\nPages purged:                               63066276.\nFile-backed pages:                           1394516.\nAnonymous pages:                              667613.\nPages stored in compressor:                  1446453.\nPages occupied by compressor:                 479732.\nDecompressions:                            983271971.\nCompressions:                             1278414336.\nPageins:                                  6063804774.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 171450.\nPages tagged resident:                        127097.\nPages tagged compressed:                       44353.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1380.\nPages tag-storage non-tag pageable:            90076.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051840.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888881.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          3.80126953125,
          2.19677734375,
          1.82177734375
        ],
        "observed_at_unix_seconds": 1788634980.768437,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "2"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 2,
        "records": 2048,
        "batches": 208,
        "bytes": 5662310400,
        "read_calls": 2048,
        "seconds": 0.66993,
        "batch_median_seconds": 0.003241,
        "batch_p95_seconds": 0.003385,
        "sampled_footprint_bytes": 59900384,
        "lifetime_rss_peak_bytes": 60227584,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 55296000,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "2de130e51531ec50c3663d361c9666706ec3bc3577986cad830fd51c8c62aff7"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28120563712,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   305910.\nPages active:                                1021783.\nPages inactive:                               972171.\nPages speculative:                             82164.\nPages throttled:                                   0.\nPages wired down:                             222329.\nPages purgeable:                               15916.\n\"Translation faults\":                    14026534967.\nPages copy-on-write:                       640261481.\nPages zero filled:                       15961694077.\nPages reactivated:                        2447109703.\nPages purged:                               63066276.\nFile-backed pages:                           1394517.\nAnonymous pages:                              681601.\nPages stored in compressor:                  1446449.\nPages occupied by compressor:                 479732.\nDecompressions:                            983271975.\nCompressions:                             1278414336.\nPageins:                                  6063804782.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 171435.\nPages tagged resident:                        127082.\nPages tagged compressed:                       44353.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1353.\nPages tag-storage non-tag pageable:            90103.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051840.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888881.\n"
      }
    },
    {
      "workload": 2,
      "round": 6,
      "mode": 0,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28121350144,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   305957.\nPages active:                                1021780.\nPages inactive:                               972171.\nPages speculative:                             82165.\nPages throttled:                                   0.\nPages wired down:                             222329.\nPages purgeable:                               15916.\n\"Translation faults\":                    14026535664.\nPages copy-on-write:                       640261629.\nPages zero filled:                       15961694129.\nPages reactivated:                        2447109703.\nPages purged:                               63066276.\nFile-backed pages:                           1394518.\nAnonymous pages:                              681598.\nPages stored in compressor:                  1446449.\nPages occupied by compressor:                 479732.\nDecompressions:                            983271975.\nCompressions:                             1278414336.\nPageins:                                  6063804783.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 171435.\nPages tagged resident:                        127082.\nPages tagged compressed:                       44353.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1351.\nPages tag-storage non-tag pageable:            90105.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051840.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888881.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          3.80126953125,
          2.19677734375,
          1.82177734375
        ],
        "observed_at_unix_seconds": 1788634983.0972748,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "2"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 2,
        "records": 2048,
        "batches": 208,
        "bytes": 5662310400,
        "read_calls": 18432,
        "seconds": 0.54916,
        "batch_median_seconds": 0.002664,
        "batch_p95_seconds": 0.002828,
        "sampled_footprint_bytes": 32227760,
        "lifetime_rss_peak_bytes": 32587776,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 27648000,
        "diskio_bytesread": 5964300288,
        "reformat_bytes": 0,
        "tensor_sha256": "2de130e51531ec50c3663d361c9666706ec3bc3577986cad830fd51c8c62aff7"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28128722944,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   310615.\nPages active:                                1018396.\nPages inactive:                               972172.\nPages speculative:                             82165.\nPages throttled:                                   0.\nPages wired down:                             220727.\nPages purgeable:                               11707.\n\"Translation faults\":                    14026540996.\nPages copy-on-write:                       640262429.\nPages zero filled:                       15961696492.\nPages reactivated:                        2447109703.\nPages purged:                               63066404.\nFile-backed pages:                           1394519.\nAnonymous pages:                              678214.\nPages stored in compressor:                  1446447.\nPages occupied by compressor:                 479731.\nDecompressions:                            983271977.\nCompressions:                             1278414336.\nPageins:                                  6063804788.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 171427.\nPages tagged resident:                        127074.\nPages tagged compressed:                       44353.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1338.\nPages tag-storage non-tag pageable:            90118.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051840.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888881.\n"
      }
    },
    {
      "workload": 2,
      "round": 7,
      "mode": 0,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28131377152,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   310776.\nPages active:                                1018400.\nPages inactive:                               972172.\nPages speculative:                             82166.\nPages throttled:                                   0.\nPages wired down:                             220727.\nPages purgeable:                               11707.\n\"Translation faults\":                    14026541696.\nPages copy-on-write:                       640262577.\nPages zero filled:                       15961696546.\nPages reactivated:                        2447109703.\nPages purged:                               63066404.\nFile-backed pages:                           1394520.\nAnonymous pages:                              678218.\nPages stored in compressor:                  1446447.\nPages occupied by compressor:                 479731.\nDecompressions:                            983271977.\nCompressions:                             1278414336.\nPageins:                                  6063804789.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 171427.\nPages tagged resident:                        127074.\nPages tagged compressed:                       44353.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1345.\nPages tag-storage non-tag pageable:            90111.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051840.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888881.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          3.80126953125,
          2.19677734375,
          1.82177734375
        ],
        "observed_at_unix_seconds": 1788634985.356948,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "2"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 2,
        "records": 2048,
        "batches": 208,
        "bytes": 5662310400,
        "read_calls": 18432,
        "seconds": 0.549761001,
        "batch_median_seconds": 0.002674,
        "batch_p95_seconds": 0.002827,
        "sampled_footprint_bytes": 32227736,
        "lifetime_rss_peak_bytes": 32604160,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 27648000,
        "diskio_bytesread": 5964300288,
        "reformat_bytes": 0,
        "tensor_sha256": "2de130e51531ec50c3663d361c9666706ec3bc3577986cad830fd51c8c62aff7"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28072329216,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   310209.\nPages active:                                1019280.\nPages inactive:                               972173.\nPages speculative:                             82170.\nPages throttled:                                   0.\nPages wired down:                             220910.\nPages purgeable:                                8635.\n\"Translation faults\":                    14026560602.\nPages copy-on-write:                       640264678.\nPages zero filled:                       15961706877.\nPages reactivated:                        2447109703.\nPages purged:                               63066404.\nFile-backed pages:                           1394555.\nAnonymous pages:                              679068.\nPages stored in compressor:                  1446446.\nPages occupied by compressor:                 479729.\nDecompressions:                            983271978.\nCompressions:                             1278414336.\nPageins:                                  6063804836.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172697.\nPages tagged resident:                        128345.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1311.\nPages tag-storage non-tag pageable:            90145.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      }
    },
    {
      "workload": 2,
      "round": 7,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28072886272,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   310241.\nPages active:                                1019276.\nPages inactive:                               972173.\nPages speculative:                             82172.\nPages throttled:                                   0.\nPages wired down:                             220910.\nPages purgeable:                                8635.\n\"Translation faults\":                    14026561300.\nPages copy-on-write:                       640264825.\nPages zero filled:                       15961706928.\nPages reactivated:                        2447109703.\nPages purged:                               63066404.\nFile-backed pages:                           1394557.\nAnonymous pages:                              679064.\nPages stored in compressor:                  1446446.\nPages occupied by compressor:                 479729.\nDecompressions:                            983271978.\nCompressions:                             1278414336.\nPageins:                                  6063804837.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172697.\nPages tagged resident:                        128345.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1311.\nPages tag-storage non-tag pageable:            90145.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          3.57666015625,
          2.1767578125,
          1.81689453125
        ],
        "observed_at_unix_seconds": 1788634987.593554,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "2"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 2,
        "records": 2048,
        "batches": 208,
        "bytes": 5662310400,
        "read_calls": 2048,
        "seconds": 0.669502003,
        "batch_median_seconds": 0.003236,
        "batch_p95_seconds": 0.003379,
        "sampled_footprint_bytes": 59900384,
        "lifetime_rss_peak_bytes": 60227584,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 55296000,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "2de130e51531ec50c3663d361c9666706ec3bc3577986cad830fd51c8c62aff7"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28073607168,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   312849.\nPages active:                                1014785.\nPages inactive:                               972174.\nPages speculative:                             82171.\nPages throttled:                                   0.\nPages wired down:                             222496.\nPages purgeable:                                6075.\n\"Translation faults\":                    14026568363.\nPages copy-on-write:                       640265607.\nPages zero filled:                       15961712899.\nPages reactivated:                        2447109703.\nPages purged:                               63066404.\nFile-backed pages:                           1394553.\nAnonymous pages:                              674577.\nPages stored in compressor:                  1446446.\nPages occupied by compressor:                 479729.\nDecompressions:                            983271978.\nCompressions:                             1278414336.\nPageins:                                  6063804842.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172682.\nPages tagged resident:                        128330.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1322.\nPages tag-storage non-tag pageable:            90134.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      }
    },
    {
      "workload": 3,
      "round": 1,
      "mode": 0,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28076589056,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   313030.\nPages active:                                1014780.\nPages inactive:                               972174.\nPages speculative:                             82172.\nPages throttled:                                   0.\nPages wired down:                             222496.\nPages purgeable:                                6075.\n\"Translation faults\":                    14026569059.\nPages copy-on-write:                       640265751.\nPages zero filled:                       15961712953.\nPages reactivated:                        2447109703.\nPages purged:                               63066404.\nFile-backed pages:                           1394554.\nAnonymous pages:                              674572.\nPages stored in compressor:                  1446446.\nPages occupied by compressor:                 479729.\nDecompressions:                            983271978.\nCompressions:                             1278414336.\nPageins:                                  6063804843.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172682.\nPages tagged resident:                        128330.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1314.\nPages tag-storage non-tag pageable:            90142.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          3.57666015625,
          2.1767578125,
          1.81689453125
        ],
        "observed_at_unix_seconds": 1788634989.948946,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "3"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 3,
        "records": 2048,
        "batches": 64,
        "bytes": 5662310400,
        "read_calls": 18432,
        "seconds": 0.510390001,
        "batch_median_seconds": 0.007906,
        "batch_p95_seconds": 0.008174,
        "sampled_footprint_bytes": 90456544,
        "lifetime_rss_peak_bytes": 90783744,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 88473600,
        "diskio_bytesread": 5964300288,
        "reformat_bytes": 0,
        "tensor_sha256": "4d6acf7dc3d1f60f9afcb01dab007f9f541b211d517b2d7257c05265c7053961"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28076769280,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   314860.\nPages active:                                1014276.\nPages inactive:                               972175.\nPages speculative:                             82182.\nPages throttled:                                   0.\nPages wired down:                             220894.\nPages purgeable:                                4245.\n\"Translation faults\":                    14026578360.\nPages copy-on-write:                       640266543.\nPages zero filled:                       15961719067.\nPages reactivated:                        2447109703.\nPages purged:                               63066660.\nFile-backed pages:                           1394565.\nAnonymous pages:                              674068.\nPages stored in compressor:                  1446439.\nPages occupied by compressor:                 479728.\nDecompressions:                            983271985.\nCompressions:                             1278414336.\nPageins:                                  6063804848.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172672.\nPages tagged resident:                        128320.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1328.\nPages tag-storage non-tag pageable:            90128.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      }
    },
    {
      "workload": 3,
      "round": 1,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28077785088,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   314920.\nPages active:                                1014273.\nPages inactive:                               972175.\nPages speculative:                             82184.\nPages throttled:                                   0.\nPages wired down:                             220894.\nPages purgeable:                                4245.\n\"Translation faults\":                    14026579066.\nPages copy-on-write:                       640266687.\nPages zero filled:                       15961719119.\nPages reactivated:                        2447109703.\nPages purged:                               63066660.\nFile-backed pages:                           1394567.\nAnonymous pages:                              674065.\nPages stored in compressor:                  1446439.\nPages occupied by compressor:                 479728.\nDecompressions:                            983271985.\nCompressions:                             1278414336.\nPageins:                                  6063804849.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172672.\nPages tagged resident:                        128320.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1326.\nPages tag-storage non-tag pageable:            90130.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          3.3701171875,
          2.15673828125,
          1.81201171875
        ],
        "observed_at_unix_seconds": 1788634992.1326919,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "3"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 3,
        "records": 2048,
        "batches": 64,
        "bytes": 5662310400,
        "read_calls": 2048,
        "seconds": 0.511529999,
        "batch_median_seconds": 0.007938,
        "batch_p95_seconds": 0.00825,
        "sampled_footprint_bytes": 140608016,
        "lifetime_rss_peak_bytes": 140902400,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 176947200,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "4d6acf7dc3d1f60f9afcb01dab007f9f541b211d517b2d7257c05265c7053961"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28083437568,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   316336.\nPages active:                                1012854.\nPages inactive:                               972177.\nPages speculative:                             82184.\nPages throttled:                                   0.\nPages wired down:                             220895.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026592868.\nPages copy-on-write:                       640267603.\nPages zero filled:                       15961729910.\nPages reactivated:                        2447109731.\nPages purged:                               63066788.\nFile-backed pages:                           1394568.\nAnonymous pages:                              672647.\nPages stored in compressor:                  1446438.\nPages occupied by compressor:                 479727.\nDecompressions:                            983271986.\nCompressions:                             1278414336.\nPageins:                                  6063804858.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172661.\nPages tagged resident:                        128309.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1311.\nPages tag-storage non-tag pageable:            90145.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      }
    },
    {
      "workload": 3,
      "round": 2,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28084584448,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   316405.\nPages active:                                1012844.\nPages inactive:                               972177.\nPages speculative:                             82185.\nPages throttled:                                   0.\nPages wired down:                             220895.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026593572.\nPages copy-on-write:                       640267749.\nPages zero filled:                       15961729963.\nPages reactivated:                        2447109731.\nPages purged:                               63066788.\nFile-backed pages:                           1394569.\nAnonymous pages:                              672637.\nPages stored in compressor:                  1446438.\nPages occupied by compressor:                 479727.\nDecompressions:                            983271986.\nCompressions:                             1278414336.\nPageins:                                  6063804859.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172661.\nPages tagged resident:                        128309.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1312.\nPages tag-storage non-tag pageable:            90144.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          3.3701171875,
          2.15673828125,
          1.81201171875
        ],
        "observed_at_unix_seconds": 1788634994.324533,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "3"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 3,
        "records": 2048,
        "batches": 64,
        "bytes": 5662310400,
        "read_calls": 2048,
        "seconds": 0.510994001,
        "batch_median_seconds": 0.007948,
        "batch_p95_seconds": 0.00822,
        "sampled_footprint_bytes": 140575224,
        "lifetime_rss_peak_bytes": 140886016,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 176947200,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "4d6acf7dc3d1f60f9afcb01dab007f9f541b211d517b2d7257c05265c7053961"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28079833088,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   316104.\nPages active:                                1011219.\nPages inactive:                               972491.\nPages speculative:                             82192.\nPages throttled:                                   0.\nPages wired down:                             222497.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026606085.\nPages copy-on-write:                       640268526.\nPages zero filled:                       15961739836.\nPages reactivated:                        2447109866.\nPages purged:                               63066788.\nFile-backed pages:                           1394580.\nAnonymous pages:                              671322.\nPages stored in compressor:                  1446434.\nPages occupied by compressor:                 479726.\nDecompressions:                            983271990.\nCompressions:                             1278414336.\nPageins:                                  6063804864.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172646.\nPages tagged resident:                        128294.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1309.\nPages tag-storage non-tag pageable:            90147.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      }
    },
    {
      "workload": 3,
      "round": 2,
      "mode": 0,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28078686208,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   316033.\nPages active:                                1011219.\nPages inactive:                               972491.\nPages speculative:                             82193.\nPages throttled:                                   0.\nPages wired down:                             222497.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026606795.\nPages copy-on-write:                       640268670.\nPages zero filled:                       15961739891.\nPages reactivated:                        2447109866.\nPages purged:                               63066788.\nFile-backed pages:                           1394581.\nAnonymous pages:                              671322.\nPages stored in compressor:                  1446434.\nPages occupied by compressor:                 479726.\nDecompressions:                            983271990.\nCompressions:                             1278414336.\nPageins:                                  6063804865.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172646.\nPages tagged resident:                        128294.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1312.\nPages tag-storage non-tag pageable:            90144.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          3.26025390625,
          2.15380859375,
          1.81298828125
        ],
        "observed_at_unix_seconds": 1788634996.551542,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "3"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 3,
        "records": 2048,
        "batches": 64,
        "bytes": 5662310400,
        "read_calls": 18432,
        "seconds": 0.504678,
        "batch_median_seconds": 0.007873,
        "batch_p95_seconds": 0.008077,
        "sampled_footprint_bytes": 90407368,
        "lifetime_rss_peak_bytes": 90750976,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 88473600,
        "diskio_bytesread": 5964300288,
        "reformat_bytes": 0,
        "tensor_sha256": "4d6acf7dc3d1f60f9afcb01dab007f9f541b211d517b2d7257c05265c7053961"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28081143808,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   316180.\nPages active:                                1012785.\nPages inactive:                               972492.\nPages speculative:                             82195.\nPages throttled:                                   0.\nPages wired down:                             220895.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026615613.\nPages copy-on-write:                       640269448.\nPages zero filled:                       15961745797.\nPages reactivated:                        2447109866.\nPages purged:                               63066788.\nFile-backed pages:                           1394584.\nAnonymous pages:                              672888.\nPages stored in compressor:                  1446434.\nPages occupied by compressor:                 479726.\nDecompressions:                            983271990.\nCompressions:                             1278414336.\nPageins:                                  6063804870.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172638.\nPages tagged resident:                        128286.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1317.\nPages tag-storage non-tag pageable:            90139.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      }
    },
    {
      "workload": 3,
      "round": 3,
      "mode": 0,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28080046080,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   316111.\nPages active:                                1012783.\nPages inactive:                               972492.\nPages speculative:                             82197.\nPages throttled:                                   0.\nPages wired down:                             220895.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026616329.\nPages copy-on-write:                       640269591.\nPages zero filled:                       15961745850.\nPages reactivated:                        2447109866.\nPages purged:                               63066788.\nFile-backed pages:                           1394586.\nAnonymous pages:                              672886.\nPages stored in compressor:                  1446434.\nPages occupied by compressor:                 479726.\nDecompressions:                            983271990.\nCompressions:                             1278414336.\nPageins:                                  6063804871.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172638.\nPages tagged resident:                        128286.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1317.\nPages tag-storage non-tag pageable:            90139.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          3.26025390625,
          2.15380859375,
          1.81298828125
        ],
        "observed_at_unix_seconds": 1788634998.761376,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "3"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 3,
        "records": 2048,
        "batches": 64,
        "bytes": 5662310400,
        "read_calls": 18432,
        "seconds": 0.507311002,
        "batch_median_seconds": 0.007946,
        "batch_p95_seconds": 0.008132,
        "sampled_footprint_bytes": 90407368,
        "lifetime_rss_peak_bytes": 90750976,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 88473600,
        "diskio_bytesread": 5964300288,
        "reformat_bytes": 0,
        "tensor_sha256": "4d6acf7dc3d1f60f9afcb01dab007f9f541b211d517b2d7257c05265c7053961"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28088287232,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   316613.\nPages active:                                1012515.\nPages inactive:                               972493.\nPages speculative:                             82197.\nPages throttled:                                   0.\nPages wired down:                             220892.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026626476.\nPages copy-on-write:                       640270420.\nPages zero filled:                       15961752823.\nPages reactivated:                        2447109866.\nPages purged:                               63066788.\nFile-backed pages:                           1394587.\nAnonymous pages:                              672618.\nPages stored in compressor:                  1446433.\nPages occupied by compressor:                 479726.\nDecompressions:                            983271991.\nCompressions:                             1278414336.\nPageins:                                  6063804878.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172627.\nPages tagged resident:                        128275.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1320.\nPages tag-storage non-tag pageable:            90136.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      }
    },
    {
      "workload": 3,
      "round": 3,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28089303040,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   316674.\nPages active:                                1012512.\nPages inactive:                               972493.\nPages speculative:                             82198.\nPages throttled:                                   0.\nPages wired down:                             220892.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026627180.\nPages copy-on-write:                       640270564.\nPages zero filled:                       15961752874.\nPages reactivated:                        2447109866.\nPages purged:                               63066788.\nFile-backed pages:                           1394588.\nAnonymous pages:                              672615.\nPages stored in compressor:                  1446433.\nPages occupied by compressor:                 479726.\nDecompressions:                            983271991.\nCompressions:                             1278414336.\nPageins:                                  6063804879.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172627.\nPages tagged resident:                        128275.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1320.\nPages tag-storage non-tag pageable:            90136.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          3.0791015625,
          2.13427734375,
          1.80810546875
        ],
        "observed_at_unix_seconds": 1788635000.9940538,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "3"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 3,
        "records": 2048,
        "batches": 64,
        "bytes": 5662310400,
        "read_calls": 2048,
        "seconds": 0.512011001,
        "batch_median_seconds": 0.007947,
        "batch_p95_seconds": 0.008251,
        "sampled_footprint_bytes": 140575248,
        "lifetime_rss_peak_bytes": 140869632,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 176947200,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "4d6acf7dc3d1f60f9afcb01dab007f9f541b211d517b2d7257c05265c7053961"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28078866432,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   316031.\nPages active:                                1011391.\nPages inactive:                               972606.\nPages speculative:                             82200.\nPages throttled:                                   0.\nPages wired down:                             222514.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026641065.\nPages copy-on-write:                       640271555.\nPages zero filled:                       15961763358.\nPages reactivated:                        2447109872.\nPages purged:                               63066788.\nFile-backed pages:                           1394594.\nAnonymous pages:                              671603.\nPages stored in compressor:                  1446429.\nPages occupied by compressor:                 479724.\nDecompressions:                            983271995.\nCompressions:                             1278414336.\nPageins:                                  6063804890.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172785.\nPages tagged resident:                        128433.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1292.\nPages tag-storage non-tag pageable:            90164.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      }
    },
    {
      "workload": 3,
      "round": 4,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28079767552,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   316084.\nPages active:                                1011390.\nPages inactive:                               972606.\nPages speculative:                             82202.\nPages throttled:                                   0.\nPages wired down:                             222514.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026641777.\nPages copy-on-write:                       640271699.\nPages zero filled:                       15961763410.\nPages reactivated:                        2447109872.\nPages purged:                               63066788.\nFile-backed pages:                           1394596.\nAnonymous pages:                              671602.\nPages stored in compressor:                  1446429.\nPages occupied by compressor:                 479724.\nDecompressions:                            983271995.\nCompressions:                             1278414336.\nPageins:                                  6063804891.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172785.\nPages tagged resident:                        128433.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1284.\nPages tag-storage non-tag pageable:            90172.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          3.0791015625,
          2.13427734375,
          1.80810546875
        ],
        "observed_at_unix_seconds": 1788635003.2127638,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "3"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 3,
        "records": 2048,
        "batches": 64,
        "bytes": 5662310400,
        "read_calls": 2048,
        "seconds": 0.50957,
        "batch_median_seconds": 0.007932,
        "batch_p95_seconds": 0.008251,
        "sampled_footprint_bytes": 140591656,
        "lifetime_rss_peak_bytes": 140869632,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 176947200,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "4d6acf7dc3d1f60f9afcb01dab007f9f541b211d517b2d7257c05265c7053961"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28240592896,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   325900.\nPages active:                                1004082.\nPages inactive:                               971541.\nPages speculative:                             82202.\nPages throttled:                                   0.\nPages wired down:                             220835.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026653841.\nPages copy-on-write:                       640272481.\nPages zero filled:                       15961770162.\nPages reactivated:                        2447109872.\nPages purged:                               63066788.\nFile-backed pages:                           1394596.\nAnonymous pages:                              663229.\nPages stored in compressor:                  1446428.\nPages occupied by compressor:                 479723.\nDecompressions:                            983271996.\nCompressions:                             1278414336.\nPageins:                                  6063804896.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172777.\nPages tagged resident:                        128425.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1362.\nPages tag-storage non-tag pageable:            90094.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      }
    },
    {
      "workload": 3,
      "round": 4,
      "mode": 0,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28241592320,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   325960.\nPages active:                                1004079.\nPages inactive:                               971541.\nPages speculative:                             82203.\nPages throttled:                                   0.\nPages wired down:                             220835.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026654548.\nPages copy-on-write:                       640272627.\nPages zero filled:                       15961770214.\nPages reactivated:                        2447109872.\nPages purged:                               63066788.\nFile-backed pages:                           1394597.\nAnonymous pages:                              663226.\nPages stored in compressor:                  1446428.\nPages occupied by compressor:                 479723.\nDecompressions:                            983271996.\nCompressions:                             1278414336.\nPageins:                                  6063804897.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172777.\nPages tagged resident:                        128425.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1360.\nPages tag-storage non-tag pageable:            90096.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          3.0791015625,
          2.13427734375,
          1.80810546875
        ],
        "observed_at_unix_seconds": 1788635005.4310641,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "3"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 3,
        "records": 2048,
        "batches": 64,
        "bytes": 5662310400,
        "read_calls": 18432,
        "seconds": 0.50448,
        "batch_median_seconds": 0.007888,
        "batch_p95_seconds": 0.00806,
        "sampled_footprint_bytes": 90423776,
        "lifetime_rss_peak_bytes": 90750976,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 88473600,
        "diskio_bytesread": 5964300288,
        "reformat_bytes": 0,
        "tensor_sha256": "4d6acf7dc3d1f60f9afcb01dab007f9f541b211d517b2d7257c05265c7053961"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28233646080,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   325467.\nPages active:                                1004504.\nPages inactive:                               971542.\nPages speculative:                             82205.\nPages throttled:                                   0.\nPages wired down:                             220854.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026666993.\nPages copy-on-write:                       640273582.\nPages zero filled:                       15961780759.\nPages reactivated:                        2447109872.\nPages purged:                               63066788.\nFile-backed pages:                           1394605.\nAnonymous pages:                              663646.\nPages stored in compressor:                  1446428.\nPages occupied by compressor:                 479723.\nDecompressions:                            983271996.\nCompressions:                             1278414336.\nPageins:                                  6063804910.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172766.\nPages tagged resident:                        128414.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1307.\nPages tag-storage non-tag pageable:            90149.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      }
    },
    {
      "workload": 3,
      "round": 5,
      "mode": 0,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28230254592,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   325258.\nPages active:                                1004501.\nPages inactive:                               971542.\nPages speculative:                             82207.\nPages throttled:                                   0.\nPages wired down:                             220854.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026667706.\nPages copy-on-write:                       640273732.\nPages zero filled:                       15961780811.\nPages reactivated:                        2447109872.\nPages purged:                               63066788.\nFile-backed pages:                           1394607.\nAnonymous pages:                              663643.\nPages stored in compressor:                  1446428.\nPages occupied by compressor:                 479723.\nDecompressions:                            983271996.\nCompressions:                             1278414336.\nPageins:                                  6063804911.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172766.\nPages tagged resident:                        128414.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1309.\nPages tag-storage non-tag pageable:            90147.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.99267578125,
          2.1318359375,
          1.80908203125
        ],
        "observed_at_unix_seconds": 1788635007.649109,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "3"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 3,
        "records": 2048,
        "batches": 64,
        "bytes": 5662310400,
        "read_calls": 18432,
        "seconds": 0.505444001,
        "batch_median_seconds": 0.007876,
        "batch_p95_seconds": 0.008124,
        "sampled_footprint_bytes": 90440136,
        "lifetime_rss_peak_bytes": 90783744,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 88473600,
        "diskio_bytesread": 5964300288,
        "reformat_bytes": 0,
        "tensor_sha256": "4d6acf7dc3d1f60f9afcb01dab007f9f541b211d517b2d7257c05265c7053961"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28231696384,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   325343.\nPages active:                                1003126.\nPages inactive:                               971543.\nPages speculative:                             82209.\nPages throttled:                                   0.\nPages wired down:                             222453.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026676496.\nPages copy-on-write:                       640274536.\nPages zero filled:                       15961789806.\nPages reactivated:                        2447109872.\nPages purged:                               63066788.\nFile-backed pages:                           1394610.\nAnonymous pages:                              662268.\nPages stored in compressor:                  1446422.\nPages occupied by compressor:                 479723.\nDecompressions:                            983272002.\nCompressions:                             1278414336.\nPageins:                                  6063804916.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172815.\nPages tagged resident:                        128463.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1309.\nPages tag-storage non-tag pageable:            90147.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      }
    },
    {
      "workload": 3,
      "round": 5,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28232368128,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   325383.\nPages active:                                1003125.\nPages inactive:                               971543.\nPages speculative:                             82210.\nPages throttled:                                   0.\nPages wired down:                             222453.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026677208.\nPages copy-on-write:                       640274683.\nPages zero filled:                       15961789857.\nPages reactivated:                        2447109872.\nPages purged:                               63066788.\nFile-backed pages:                           1394611.\nAnonymous pages:                              662267.\nPages stored in compressor:                  1446422.\nPages occupied by compressor:                 479723.\nDecompressions:                            983272002.\nCompressions:                             1278414336.\nPageins:                                  6063804917.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172815.\nPages tagged resident:                        128463.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1317.\nPages tag-storage non-tag pageable:            90139.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.99267578125,
          2.1318359375,
          1.80908203125
        ],
        "observed_at_unix_seconds": 1788635009.860054,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "3"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 3,
        "records": 2048,
        "batches": 64,
        "bytes": 5662310400,
        "read_calls": 2048,
        "seconds": 0.510227001,
        "batch_median_seconds": 0.007946,
        "batch_p95_seconds": 0.008252,
        "sampled_footprint_bytes": 140575224,
        "lifetime_rss_peak_bytes": 140886016,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 176947200,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "4d6acf7dc3d1f60f9afcb01dab007f9f541b211d517b2d7257c05265c7053961"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28224831488,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   324922.\nPages active:                                1004787.\nPages inactive:                               971544.\nPages speculative:                             82210.\nPages throttled:                                   0.\nPages wired down:                             220850.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026698289.\nPages copy-on-write:                       640276366.\nPages zero filled:                       15961798161.\nPages reactivated:                        2447109881.\nPages purged:                               63066788.\nFile-backed pages:                           1394612.\nAnonymous pages:                              663929.\nPages stored in compressor:                  1446422.\nPages occupied by compressor:                 479723.\nDecompressions:                            983272002.\nCompressions:                             1278414336.\nPageins:                                  6063804923.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172871.\nPages tagged resident:                        128519.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1323.\nPages tag-storage non-tag pageable:            90133.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      }
    },
    {
      "workload": 3,
      "round": 6,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28225617920,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   324969.\nPages active:                                1004777.\nPages inactive:                               971544.\nPages speculative:                             82211.\nPages throttled:                                   0.\nPages wired down:                             220850.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026699002.\nPages copy-on-write:                       640276510.\nPages zero filled:                       15961798213.\nPages reactivated:                        2447109881.\nPages purged:                               63066788.\nFile-backed pages:                           1394613.\nAnonymous pages:                              663919.\nPages stored in compressor:                  1446422.\nPages occupied by compressor:                 479723.\nDecompressions:                            983272002.\nCompressions:                             1278414336.\nPageins:                                  6063804924.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172871.\nPages tagged resident:                        128519.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1320.\nPages tag-storage non-tag pageable:            90136.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.8330078125,
          2.11279296875,
          1.80419921875
        ],
        "observed_at_unix_seconds": 1788635012.074682,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "3"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 3,
        "records": 2048,
        "batches": 64,
        "bytes": 5662310400,
        "read_calls": 2048,
        "seconds": 0.509517999,
        "batch_median_seconds": 0.007934,
        "batch_p95_seconds": 0.00823,
        "sampled_footprint_bytes": 140575248,
        "lifetime_rss_peak_bytes": 140869632,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 176947200,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "4d6acf7dc3d1f60f9afcb01dab007f9f541b211d517b2d7257c05265c7053961"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28232941568,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   325411.\nPages active:                                1004523.\nPages inactive:                               971545.\nPages speculative:                             82215.\nPages throttled:                                   0.\nPages wired down:                             220853.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026712851.\nPages copy-on-write:                       640277422.\nPages zero filled:                       15961809023.\nPages reactivated:                        2447109881.\nPages purged:                               63066788.\nFile-backed pages:                           1394618.\nAnonymous pages:                              663665.\nPages stored in compressor:                  1446418.\nPages occupied by compressor:                 479722.\nDecompressions:                            983272006.\nCompressions:                             1278414336.\nPageins:                                  6063804933.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172796.\nPages tagged resident:                        128444.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1327.\nPages tag-storage non-tag pageable:            90129.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      }
    },
    {
      "workload": 3,
      "round": 6,
      "mode": 0,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28233744384,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   325458.\nPages active:                                1004520.\nPages inactive:                               971545.\nPages speculative:                             82217.\nPages throttled:                                   0.\nPages wired down:                             220853.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026713570.\nPages copy-on-write:                       640277566.\nPages zero filled:                       15961809075.\nPages reactivated:                        2447109881.\nPages purged:                               63066788.\nFile-backed pages:                           1394620.\nAnonymous pages:                              663662.\nPages stored in compressor:                  1446418.\nPages occupied by compressor:                 479722.\nDecompressions:                            983272006.\nCompressions:                             1278414336.\nPageins:                                  6063804934.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172796.\nPages tagged resident:                        128444.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1327.\nPages tag-storage non-tag pageable:            90129.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.8330078125,
          2.11279296875,
          1.80419921875
        ],
        "observed_at_unix_seconds": 1788635014.26241,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "3"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 3,
        "records": 2048,
        "batches": 64,
        "bytes": 5662310400,
        "read_calls": 18432,
        "seconds": 0.503333,
        "batch_median_seconds": 0.007858,
        "batch_p95_seconds": 0.008063,
        "sampled_footprint_bytes": 90407368,
        "lifetime_rss_peak_bytes": 90750976,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 88473600,
        "diskio_bytesread": 5964300288,
        "reformat_bytes": 0,
        "tensor_sha256": "4d6acf7dc3d1f60f9afcb01dab007f9f541b211d517b2d7257c05265c7053961"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28229484544,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   325195.\nPages active:                                1003195.\nPages inactive:                               971546.\nPages speculative:                             82219.\nPages throttled:                                   0.\nPages wired down:                             222455.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026722322.\nPages copy-on-write:                       640278344.\nPages zero filled:                       15961815256.\nPages reactivated:                        2447109881.\nPages purged:                               63066788.\nFile-backed pages:                           1394623.\nAnonymous pages:                              662337.\nPages stored in compressor:                  1446418.\nPages occupied by compressor:                 479722.\nDecompressions:                            983272006.\nCompressions:                             1278414336.\nPageins:                                  6063804939.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172781.\nPages tagged resident:                        128429.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1332.\nPages tag-storage non-tag pageable:            90124.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      }
    },
    {
      "workload": 3,
      "round": 7,
      "mode": 0,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28232318976,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   325367.\nPages active:                                1004794.\nPages inactive:                               971546.\nPages speculative:                             82220.\nPages throttled:                                   0.\nPages wired down:                             220854.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026723043.\nPages copy-on-write:                       640278486.\nPages zero filled:                       15961815309.\nPages reactivated:                        2447109881.\nPages purged:                               63066788.\nFile-backed pages:                           1394624.\nAnonymous pages:                              663936.\nPages stored in compressor:                  1446418.\nPages occupied by compressor:                 479722.\nDecompressions:                            983272006.\nCompressions:                             1278414336.\nPageins:                                  6063804940.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172781.\nPages tagged resident:                        128429.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1335.\nPages tag-storage non-tag pageable:            90121.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.68603515625,
          2.09423828125,
          1.79931640625
        ],
        "observed_at_unix_seconds": 1788635016.487605,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "3"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 3,
        "records": 2048,
        "batches": 64,
        "bytes": 5662310400,
        "read_calls": 18432,
        "seconds": 0.505151001,
        "batch_median_seconds": 0.007882,
        "batch_p95_seconds": 0.008174,
        "sampled_footprint_bytes": 90391008,
        "lifetime_rss_peak_bytes": 90718208,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 88473600,
        "diskio_bytesread": 5964300288,
        "reformat_bytes": 0,
        "tensor_sha256": "4d6acf7dc3d1f60f9afcb01dab007f9f541b211d517b2d7257c05265c7053961"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28238823424,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   325768.\nPages active:                                1004078.\nPages inactive:                               971547.\nPages speculative:                             82219.\nPages throttled:                                   0.\nPages wired down:                             220834.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026731740.\nPages copy-on-write:                       640279253.\nPages zero filled:                       15961821215.\nPages reactivated:                        2447109881.\nPages purged:                               63066788.\nFile-backed pages:                           1394620.\nAnonymous pages:                              663224.\nPages stored in compressor:                  1446416.\nPages occupied by compressor:                 479722.\nDecompressions:                            983272008.\nCompressions:                             1278414336.\nPageins:                                  6063804945.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172773.\nPages tagged resident:                        128421.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1332.\nPages tag-storage non-tag pageable:            90124.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      }
    },
    {
      "workload": 3,
      "round": 7,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28239347712,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   325798.\nPages active:                                1004075.\nPages inactive:                               971547.\nPages speculative:                             82221.\nPages throttled:                                   0.\nPages wired down:                             220834.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026732467.\nPages copy-on-write:                       640279395.\nPages zero filled:                       15961821266.\nPages reactivated:                        2447109881.\nPages purged:                               63066788.\nFile-backed pages:                           1394622.\nAnonymous pages:                              663221.\nPages stored in compressor:                  1446416.\nPages occupied by compressor:                 479722.\nDecompressions:                            983272008.\nCompressions:                             1278414336.\nPageins:                                  6063804946.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172773.\nPages tagged resident:                        128421.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1332.\nPages tag-storage non-tag pageable:            90124.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.68603515625,
          2.09423828125,
          1.79931640625
        ],
        "observed_at_unix_seconds": 1788635018.665629,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "3"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 3,
        "records": 2048,
        "batches": 64,
        "bytes": 5662310400,
        "read_calls": 2048,
        "seconds": 0.510088001,
        "batch_median_seconds": 0.007942,
        "batch_p95_seconds": 0.008235,
        "sampled_footprint_bytes": 140591632,
        "lifetime_rss_peak_bytes": 140886016,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 176947200,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "4d6acf7dc3d1f60f9afcb01dab007f9f541b211d517b2d7257c05265c7053961"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28246163456,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   326213.\nPages active:                                1003748.\nPages inactive:                               971548.\nPages speculative:                             82221.\nPages throttled:                                   0.\nPages wired down:                             220829.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026745778.\nPages copy-on-write:                       640280216.\nPages zero filled:                       15961831948.\nPages reactivated:                        2447109881.\nPages purged:                               63066788.\nFile-backed pages:                           1394623.\nAnonymous pages:                              662894.\nPages stored in compressor:                  1446416.\nPages occupied by compressor:                 479722.\nDecompressions:                            983272008.\nCompressions:                             1278414336.\nPageins:                                  6063804953.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172762.\nPages tagged resident:                        128410.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1334.\nPages tag-storage non-tag pageable:            90122.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      }
    },
    {
      "workload": 4,
      "round": 1,
      "mode": 0,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28247228416,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   326277.\nPages active:                                1003747.\nPages inactive:                               971548.\nPages speculative:                             82222.\nPages throttled:                                   0.\nPages wired down:                             220829.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026746509.\nPages copy-on-write:                       640280360.\nPages zero filled:                       15961832001.\nPages reactivated:                        2447109881.\nPages purged:                               63066788.\nFile-backed pages:                           1394624.\nAnonymous pages:                              662893.\nPages stored in compressor:                  1446416.\nPages occupied by compressor:                 479722.\nDecompressions:                            983272008.\nCompressions:                             1278414336.\nPageins:                                  6063804954.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172762.\nPages tagged resident:                        128410.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1335.\nPages tag-storage non-tag pageable:            90121.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.68603515625,
          2.09423828125,
          1.79931640625
        ],
        "observed_at_unix_seconds": 1788635020.884195,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "4"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 4,
        "records": 2048,
        "batches": 64,
        "bytes": 5662310400,
        "read_calls": 576,
        "seconds": 0.472823,
        "batch_median_seconds": 0.007312,
        "batch_p95_seconds": 0.007644,
        "sampled_footprint_bytes": 90259936,
        "lifetime_rss_peak_bytes": 90587136,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 88473600,
        "diskio_bytesread": 5662900224,
        "reformat_bytes": 0,
        "tensor_sha256": "8f2020be78b87dc9f3c5a5cb4fa3b635cfeeb0b85dc58797c37f37edaf7bb25c"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28242034688,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    17179.\nPages active:                                1002412.\nPages inactive:                               971549.\nPages speculative:                            391002.\nPages throttled:                                   0.\nPages wired down:                             222430.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026756116.\nPages copy-on-write:                       640281235.\nPages zero filled:                       15961841265.\nPages reactivated:                        2447109881.\nPages purged:                               63066788.\nFile-backed pages:                           1703405.\nAnonymous pages:                              661558.\nPages stored in compressor:                  1446409.\nPages occupied by compressor:                 479719.\nDecompressions:                            983272015.\nCompressions:                             1278414336.\nPageins:                                  6064113733.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172746.\nPages tagged resident:                        128394.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1321.\nPages tag-storage non-tag pageable:            90135.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      }
    },
    {
      "workload": 4,
      "round": 1,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28240658432,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    17094.\nPages active:                                1002418.\nPages inactive:                               971549.\nPages speculative:                            391003.\nPages throttled:                                   0.\nPages wired down:                             222431.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026756947.\nPages copy-on-write:                       640281379.\nPages zero filled:                       15961841334.\nPages reactivated:                        2447109881.\nPages purged:                               63066788.\nFile-backed pages:                           1703406.\nAnonymous pages:                              661564.\nPages stored in compressor:                  1446409.\nPages occupied by compressor:                 479719.\nDecompressions:                            983272015.\nCompressions:                             1278414336.\nPageins:                                  6064113734.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172746.\nPages tagged resident:                        128394.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1319.\nPages tag-storage non-tag pageable:            90137.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.55078125,
          2.07568359375,
          1.79443359375
        ],
        "observed_at_unix_seconds": 1788635023.034145,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "4"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 4,
        "records": 2048,
        "batches": 64,
        "bytes": 5662310400,
        "read_calls": 64,
        "seconds": 2.228474001,
        "batch_median_seconds": 0.033605,
        "batch_p95_seconds": 0.037659,
        "sampled_footprint_bytes": 178553336,
        "lifetime_rss_peak_bytes": 178864128,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 176947200,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "8f2020be78b87dc9f3c5a5cb4fa3b635cfeeb0b85dc58797c37f37edaf7bb25c"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28242296832,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    17183.\nPages active:                                1004116.\nPages inactive:                               971557.\nPages speculative:                            391005.\nPages throttled:                                   0.\nPages wired down:                             220832.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026772897.\nPages copy-on-write:                       640282211.\nPages zero filled:                       15961851414.\nPages reactivated:                        2447110038.\nPages purged:                               63066788.\nFile-backed pages:                           1703417.\nAnonymous pages:                              663261.\nPages stored in compressor:                  1446393.\nPages occupied by compressor:                 479713.\nDecompressions:                            983272031.\nCompressions:                             1278414336.\nPageins:                                  6064113743.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172727.\nPages tagged resident:                        128375.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1194.\nPages tag-storage non-tag pageable:            90262.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      }
    },
    {
      "workload": 4,
      "round": 2,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28240920576,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    17097.\nPages active:                                1004114.\nPages inactive:                               971557.\nPages speculative:                            391007.\nPages throttled:                                   0.\nPages wired down:                             220832.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026773630.\nPages copy-on-write:                       640282353.\nPages zero filled:                       15961851466.\nPages reactivated:                        2447110038.\nPages purged:                               63066788.\nFile-backed pages:                           1703419.\nAnonymous pages:                              663259.\nPages stored in compressor:                  1446393.\nPages occupied by compressor:                 479713.\nDecompressions:                            983272031.\nCompressions:                             1278414336.\nPageins:                                  6064113744.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 172727.\nPages tagged resident:                        128375.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1194.\nPages tag-storage non-tag pageable:            90262.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.50634765625,
          2.07421875,
          1.79541015625
        ],
        "observed_at_unix_seconds": 1788635026.950063,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "4"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 4,
        "records": 2048,
        "batches": 64,
        "bytes": 5662310400,
        "read_calls": 64,
        "seconds": 2.239749999,
        "batch_median_seconds": 0.033616,
        "batch_p95_seconds": 0.038029,
        "sampled_footprint_bytes": 178553360,
        "lifetime_rss_peak_bytes": 178847744,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 176947200,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "8f2020be78b87dc9f3c5a5cb4fa3b635cfeeb0b85dc58797c37f37edaf7bb25c"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28305326080,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    21053.\nPages active:                                1000645.\nPages inactive:                               971558.\nPages speculative:                            391008.\nPages throttled:                                   0.\nPages wired down:                             220664.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026788207.\nPages copy-on-write:                       640283150.\nPages zero filled:                       15961860649.\nPages reactivated:                        2447110041.\nPages purged:                               63066788.\nFile-backed pages:                           1703394.\nAnonymous pages:                              659817.\nPages stored in compressor:                  1446382.\nPages occupied by compressor:                 479711.\nDecompressions:                            983272042.\nCompressions:                             1278414336.\nPageins:                                  6064113749.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 171521.\nPages tagged resident:                        127169.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1097.\nPages tag-storage non-tag pageable:            90359.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      }
    },
    {
      "workload": 4,
      "round": 2,
      "mode": 0,
      "exclusions": [
        "disk reads do not cover requested payload"
      ],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28304064512,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    20975.\nPages active:                                1000643.\nPages inactive:                               971558.\nPages speculative:                            391009.\nPages throttled:                                   0.\nPages wired down:                             220664.\nPages purgeable:                                3173.\n\"Translation faults\":                    14026788941.\nPages copy-on-write:                       640283295.\nPages zero filled:                       15961860700.\nPages reactivated:                        2447110041.\nPages purged:                               63066788.\nFile-backed pages:                           1703395.\nAnonymous pages:                              659815.\nPages stored in compressor:                  1446382.\nPages occupied by compressor:                 479711.\nDecompressions:                            983272042.\nCompressions:                             1278414336.\nPageins:                                  6064113750.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 171521.\nPages tagged resident:                        127169.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1097.\nPages tag-storage non-tag pageable:            90359.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.50634765625,
          2.07421875,
          1.79541015625
        ],
        "observed_at_unix_seconds": 1788635030.8581991,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "4"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 4,
        "records": 2048,
        "batches": 64,
        "bytes": 5662310400,
        "read_calls": 576,
        "seconds": 0.181418002,
        "batch_median_seconds": 0.002836,
        "batch_p95_seconds": 0.002961,
        "sampled_footprint_bytes": 90259936,
        "lifetime_rss_peak_bytes": 90587136,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 88473600,
        "diskio_bytesread": 603897856,
        "reformat_bytes": 0,
        "tensor_sha256": "8f2020be78b87dc9f3c5a5cb4fa3b635cfeeb0b85dc58797c37f37edaf7bb25c"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28460957696,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    21033.\nPages active:                                1014399.\nPages inactive:                               971559.\nPages speculative:                            391015.\nPages throttled:                                   0.\nPages wired down:                             206917.\nPages purgeable:                               12684.\n\"Translation faults\":                    14026799702.\nPages copy-on-write:                       640284229.\nPages zero filled:                       15961867914.\nPages reactivated:                        2447110041.\nPages purged:                               63066788.\nFile-backed pages:                           1703402.\nAnonymous pages:                              673571.\nPages stored in compressor:                  1446369.\nPages occupied by compressor:                 479706.\nDecompressions:                            983272055.\nCompressions:                             1278414336.\nPageins:                                  6064113759.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 171513.\nPages tagged resident:                        127161.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1066.\nPages tag-storage non-tag pageable:            90390.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      }
    },
    {
      "workload": 4,
      "round": 3,
      "mode": 0,
      "exclusions": [
        "disk reads do not cover requested payload"
      ],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28461776896,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    21081.\nPages active:                                1014397.\nPages inactive:                               971559.\nPages speculative:                            391017.\nPages throttled:                                   0.\nPages wired down:                             206917.\nPages purgeable:                               12684.\n\"Translation faults\":                    14026800436.\nPages copy-on-write:                       640284375.\nPages zero filled:                       15961867966.\nPages reactivated:                        2447110041.\nPages purged:                               63066788.\nFile-backed pages:                           1703404.\nAnonymous pages:                              673569.\nPages stored in compressor:                  1446369.\nPages occupied by compressor:                 479706.\nDecompressions:                            983272055.\nCompressions:                             1278414336.\nPageins:                                  6064113760.\nPageouts:                                   10665701.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 171513.\nPages tagged resident:                        127161.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1064.\nPages tag-storage non-tag pageable:            90392.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.46533203125,
          2.07275390625,
          1.79638671875
        ],
        "observed_at_unix_seconds": 1788635032.7649899,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "4"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 4,
        "records": 2048,
        "batches": 64,
        "bytes": 5662310400,
        "read_calls": 576,
        "seconds": 0.182806001,
        "batch_median_seconds": 0.002836,
        "batch_p95_seconds": 0.003047,
        "sampled_footprint_bytes": 90243528,
        "lifetime_rss_peak_bytes": 90587136,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 88473600,
        "diskio_bytesread": 603897856,
        "reformat_bytes": 0,
        "tensor_sha256": "8f2020be78b87dc9f3c5a5cb4fa3b635cfeeb0b85dc58797c37f37edaf7bb25c"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 27924201472,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    11670.\nPages active:                                1010158.\nPages inactive:                               972503.\nPages speculative:                            377559.\nPages throttled:                                   0.\nPages wired down:                             233683.\nPages purgeable:                                2707.\n\"Translation faults\":                    14026846129.\nPages copy-on-write:                       640287144.\nPages zero filled:                       15961905175.\nPages reactivated:                        2447110045.\nPages purged:                               63066809.\nFile-backed pages:                           1689981.\nAnonymous pages:                              670239.\nPages stored in compressor:                  1446367.\nPages occupied by compressor:                 479704.\nDecompressions:                            983272057.\nCompressions:                             1278414336.\nPageins:                                  6064113859.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 171481.\nPages tagged resident:                        127129.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          396.\nPages tag-storage non-tag pageable:            91060.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      }
    },
    {
      "workload": 4,
      "round": 3,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 27922956288,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    11593.\nPages active:                                1010151.\nPages inactive:                               972503.\nPages speculative:                            377560.\nPages throttled:                                   0.\nPages wired down:                             233683.\nPages purgeable:                                2707.\n\"Translation faults\":                    14026846867.\nPages copy-on-write:                       640287288.\nPages zero filled:                       15961905228.\nPages reactivated:                        2447110045.\nPages purged:                               63066809.\nFile-backed pages:                           1689982.\nAnonymous pages:                              670232.\nPages stored in compressor:                  1446367.\nPages occupied by compressor:                 479704.\nDecompressions:                            983272057.\nCompressions:                             1278414336.\nPageins:                                  6064113860.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 171481.\nPages tagged resident:                        127129.\nPages tagged compressed:                       44352.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          392.\nPages tag-storage non-tag pageable:            91064.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7051776.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888882.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.46533203125,
          2.07275390625,
          1.79638671875
        ],
        "observed_at_unix_seconds": 1788635034.646444,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "4"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 4,
        "records": 2048,
        "batches": 64,
        "bytes": 5662310400,
        "read_calls": 64,
        "seconds": 2.242623999,
        "batch_median_seconds": 0.033614,
        "batch_p95_seconds": 0.038009,
        "sampled_footprint_bytes": 178553336,
        "lifetime_rss_peak_bytes": 178864128,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 176947200,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "8f2020be78b87dc9f3c5a5cb4fa3b635cfeeb0b85dc58797c37f37edaf7bb25c"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28068167680,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    19815.\nPages active:                                1019305.\nPages inactive:                               972448.\nPages speculative:                            373394.\nPages throttled:                                   0.\nPages wired down:                             220855.\nPages purgeable:                                7549.\n\"Translation faults\":                    14026879942.\nPages copy-on-write:                       640288452.\nPages zero filled:                       15961921878.\nPages reactivated:                        2447110055.\nPages purged:                               63066815.\nFile-backed pages:                           1685781.\nAnonymous pages:                              679366.\nPages stored in compressor:                  1446122.\nPages occupied by compressor:                 479598.\nDecompressions:                            983272302.\nCompressions:                             1278414336.\nPageins:                                  6064113896.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 171414.\nPages tagged resident:                        127176.\nPages tagged compressed:                       44238.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          372.\nPages tag-storage non-tag pageable:            91084.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7025344.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888996.\n"
      }
    },
    {
      "workload": 4,
      "round": 4,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28071247872,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    20001.\nPages active:                                1019313.\nPages inactive:                               972448.\nPages speculative:                            373396.\nPages throttled:                                   0.\nPages wired down:                             220855.\nPages purgeable:                                7549.\n\"Translation faults\":                    14026880699.\nPages copy-on-write:                       640288597.\nPages zero filled:                       15961921948.\nPages reactivated:                        2447110055.\nPages purged:                               63066815.\nFile-backed pages:                           1685783.\nAnonymous pages:                              679374.\nPages stored in compressor:                  1446122.\nPages occupied by compressor:                 479598.\nDecompressions:                            983272302.\nCompressions:                             1278414336.\nPageins:                                  6064113897.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 171414.\nPages tagged resident:                        127176.\nPages tagged compressed:                       44238.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          361.\nPages tag-storage non-tag pageable:            91095.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7025344.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888996.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.587890625,
          2.1044921875,
          1.80908203125
        ],
        "observed_at_unix_seconds": 1788635038.548682,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "4"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 4,
        "records": 2048,
        "batches": 64,
        "bytes": 5662310400,
        "read_calls": 64,
        "seconds": 2.200364999,
        "batch_median_seconds": 0.033338,
        "batch_p95_seconds": 0.037404,
        "sampled_footprint_bytes": 178553336,
        "lifetime_rss_peak_bytes": 178864128,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 176947200,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "8f2020be78b87dc9f3c5a5cb4fa3b635cfeeb0b85dc58797c37f37edaf7bb25c"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 27936145408,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    17923.\nPages active:                                1023673.\nPages inactive:                               972475.\nPages speculative:                            363715.\nPages throttled:                                   0.\nPages wired down:                             228027.\nPages purgeable:                               11028.\n\"Translation faults\":                    14026918624.\nPages copy-on-write:                       640290477.\nPages zero filled:                       15961960483.\nPages reactivated:                        2447110066.\nPages purged:                               63066817.\nFile-backed pages:                           1676136.\nAnonymous pages:                              683727.\nPages stored in compressor:                  1446091.\nPages occupied by compressor:                 479595.\nDecompressions:                            983272332.\nCompressions:                             1278414336.\nPageins:                                  6064113922.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 171578.\nPages tagged resident:                        127346.\nPages tagged compressed:                       44232.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          270.\nPages tag-storage non-tag pageable:            91186.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7024960.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889001.\n"
      }
    },
    {
      "workload": 4,
      "round": 4,
      "mode": 0,
      "exclusions": [
        "disk reads do not cover requested payload"
      ],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 27935047680,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    17855.\nPages active:                                1023669.\nPages inactive:                               972475.\nPages speculative:                            363716.\nPages throttled:                                   0.\nPages wired down:                             228027.\nPages purgeable:                               11028.\n\"Translation faults\":                    14026919367.\nPages copy-on-write:                       640290622.\nPages zero filled:                       15961960535.\nPages reactivated:                        2447110066.\nPages purged:                               63066817.\nFile-backed pages:                           1676137.\nAnonymous pages:                              683723.\nPages stored in compressor:                  1446091.\nPages occupied by compressor:                 479595.\nDecompressions:                            983272332.\nCompressions:                             1278414336.\nPageins:                                  6064113923.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 171578.\nPages tagged resident:                        127346.\nPages tagged compressed:                       44232.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          266.\nPages tag-storage non-tag pageable:            91190.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7024960.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889001.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.54052734375,
          2.1025390625,
          1.81005859375
        ],
        "observed_at_unix_seconds": 1788635042.423198,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "4"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 4,
        "records": 2048,
        "batches": 64,
        "bytes": 5662310400,
        "read_calls": 576,
        "seconds": 0.182199001,
        "batch_median_seconds": 0.002839,
        "batch_p95_seconds": 0.002996,
        "sampled_footprint_bytes": 90243528,
        "lifetime_rss_peak_bytes": 90587136,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 88473600,
        "diskio_bytesread": 603897856,
        "reformat_bytes": 0,
        "tensor_sha256": "8f2020be78b87dc9f3c5a5cb4fa3b635cfeeb0b85dc58797c37f37edaf7bb25c"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28049752064,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    23107.\nPages active:                                1024145.\nPages inactive:                               972476.\nPages speculative:                            363719.\nPages throttled:                                   0.\nPages wired down:                             222459.\nPages purgeable:                               12773.\n\"Translation faults\":                    14026929287.\nPages copy-on-write:                       640291495.\nPages zero filled:                       15961967092.\nPages reactivated:                        2447110066.\nPages purged:                               63066817.\nFile-backed pages:                           1676141.\nAnonymous pages:                              684199.\nPages stored in compressor:                  1446090.\nPages occupied by compressor:                 479595.\nDecompressions:                            983272333.\nCompressions:                             1278414336.\nPageins:                                  6064113930.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 171566.\nPages tagged resident:                        127334.\nPages tagged compressed:                       44232.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          265.\nPages tag-storage non-tag pageable:            91191.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7024960.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889001.\n"
      }
    },
    {
      "workload": 4,
      "round": 5,
      "mode": 0,
      "exclusions": [
        "disk reads do not cover requested payload"
      ],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28050898944,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    23178.\nPages active:                                1024141.\nPages inactive:                               972476.\nPages speculative:                            363720.\nPages throttled:                                   0.\nPages wired down:                             222462.\nPages purgeable:                               12771.\n\"Translation faults\":                    14026930035.\nPages copy-on-write:                       640291640.\nPages zero filled:                       15961967145.\nPages reactivated:                        2447110066.\nPages purged:                               63066817.\nFile-backed pages:                           1676142.\nAnonymous pages:                              684195.\nPages stored in compressor:                  1446090.\nPages occupied by compressor:                 479595.\nDecompressions:                            983272333.\nCompressions:                             1278414336.\nPageins:                                  6064113931.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 171566.\nPages tagged resident:                        127334.\nPages tagged compressed:                       44232.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          267.\nPages tag-storage non-tag pageable:            91189.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7024960.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889001.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.54052734375,
          2.1025390625,
          1.81005859375
        ],
        "observed_at_unix_seconds": 1788635044.306009,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "4"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 4,
        "records": 2048,
        "batches": 64,
        "bytes": 5662310400,
        "read_calls": 576,
        "seconds": 0.180347,
        "batch_median_seconds": 0.00281,
        "batch_p95_seconds": 0.002955,
        "sampled_footprint_bytes": 90259936,
        "lifetime_rss_peak_bytes": 90587136,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 88473600,
        "diskio_bytesread": 603897856,
        "reformat_bytes": 0,
        "tensor_sha256": "8f2020be78b87dc9f3c5a5cb4fa3b635cfeeb0b85dc58797c37f37edaf7bb25c"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28040347648,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    25586.\nPages active:                                1022843.\nPages inactive:                               972485.\nPages speculative:                            363983.\nPages throttled:                                   0.\nPages wired down:                             220899.\nPages purgeable:                                9439.\n\"Translation faults\":                    14026942183.\nPages copy-on-write:                       640292605.\nPages zero filled:                       15961977845.\nPages reactivated:                        2447110066.\nPages purged:                               63066945.\nFile-backed pages:                           1676422.\nAnonymous pages:                              682889.\nPages stored in compressor:                  1446010.\nPages occupied by compressor:                 479579.\nDecompressions:                            983272413.\nCompressions:                             1278414336.\nPageins:                                  6064114154.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 171541.\nPages tagged resident:                        127323.\nPages tagged compressed:                       44218.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          242.\nPages tag-storage non-tag pageable:            91214.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7022464.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889015.\n"
      }
    },
    {
      "workload": 4,
      "round": 5,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28041494528,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    25645.\nPages active:                                1022843.\nPages inactive:                               972485.\nPages speculative:                            363986.\nPages throttled:                                   0.\nPages wired down:                             220899.\nPages purgeable:                                9447.\n\"Translation faults\":                    14026942948.\nPages copy-on-write:                       640292749.\nPages zero filled:                       15961977903.\nPages reactivated:                        2447110066.\nPages purged:                               63066945.\nFile-backed pages:                           1676425.\nAnonymous pages:                              682889.\nPages stored in compressor:                  1446010.\nPages occupied by compressor:                 479579.\nDecompressions:                            983272413.\nCompressions:                             1278414336.\nPageins:                                  6064114155.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 171541.\nPages tagged resident:                        127323.\nPages tagged compressed:                       44218.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          239.\nPages tag-storage non-tag pageable:            91217.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7022464.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889015.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          3.1376953125,
          2.2333984375,
          1.85791015625
        ],
        "observed_at_unix_seconds": 1788635046.1570299,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "4"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 4,
        "records": 2048,
        "batches": 64,
        "bytes": 5662310400,
        "read_calls": 64,
        "seconds": 2.230236,
        "batch_median_seconds": 0.033524,
        "batch_p95_seconds": 0.0377,
        "sampled_footprint_bytes": 178569744,
        "lifetime_rss_peak_bytes": 178864128,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 176947200,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "8f2020be78b87dc9f3c5a5cb4fa3b635cfeeb0b85dc58797c37f37edaf7bb25c"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28060172288,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    30000.\nPages active:                                1016948.\nPages inactive:                               972494.\nPages speculative:                            364152.\nPages throttled:                                   0.\nPages wired down:                             222318.\nPages purgeable:                                6091.\n\"Translation faults\":                    14026962123.\nPages copy-on-write:                       640293549.\nPages zero filled:                       15961987820.\nPages reactivated:                        2447110066.\nPages purged:                               63066953.\nFile-backed pages:                           1676566.\nAnonymous pages:                              677028.\nPages stored in compressor:                  1445742.\nPages occupied by compressor:                 479495.\nDecompressions:                            983272679.\nCompressions:                             1278414336.\nPageins:                                  6064114163.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170642.\nPages tagged resident:                        126529.\nPages tagged compressed:                       44113.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          298.\nPages tag-storage non-tag pageable:            91158.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7002048.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889118.\n"
      }
    },
    {
      "workload": 4,
      "round": 6,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28060925952,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    30045.\nPages active:                                1016946.\nPages inactive:                               972494.\nPages speculative:                            364153.\nPages throttled:                                   0.\nPages wired down:                             222318.\nPages purgeable:                                6091.\n\"Translation faults\":                    14026962888.\nPages copy-on-write:                       640293692.\nPages zero filled:                       15961987872.\nPages reactivated:                        2447110066.\nPages purged:                               63066953.\nFile-backed pages:                           1676567.\nAnonymous pages:                              677026.\nPages stored in compressor:                  1445742.\nPages occupied by compressor:                 479495.\nDecompressions:                            983272679.\nCompressions:                             1278414336.\nPageins:                                  6064114164.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170642.\nPages tagged resident:                        126529.\nPages tagged compressed:                       44113.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          305.\nPages tag-storage non-tag pageable:            91151.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7002048.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889118.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          3.1376953125,
          2.2333984375,
          1.85791015625
        ],
        "observed_at_unix_seconds": 1788635050.0742679,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "4"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 4,
        "records": 2048,
        "batches": 64,
        "bytes": 5662310400,
        "read_calls": 64,
        "seconds": 2.222281,
        "batch_median_seconds": 0.033498,
        "batch_p95_seconds": 0.037767,
        "sampled_footprint_bytes": 178553336,
        "lifetime_rss_peak_bytes": 178864128,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 176947200,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "8f2020be78b87dc9f3c5a5cb4fa3b635cfeeb0b85dc58797c37f37edaf7bb25c"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28245114880,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    35810.\nPages active:                                1026454.\nPages inactive:                               972554.\nPages speculative:                            364377.\nPages throttled:                                   0.\nPages wired down:                             206963.\nPages purgeable:                               11218.\n\"Translation faults\":                    14026983852.\nPages copy-on-write:                       640294608.\nPages zero filled:                       15962000810.\nPages reactivated:                        2447110066.\nPages purged:                               63067337.\nFile-backed pages:                           1676917.\nAnonymous pages:                              686468.\nPages stored in compressor:                  1445634.\nPages occupied by compressor:                 479420.\nDecompressions:                            983272787.\nCompressions:                             1278414336.\nPageins:                                  6064114396.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170683.\nPages tagged resident:                        126571.\nPages tagged compressed:                       44112.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          238.\nPages tag-storage non-tag pageable:            91218.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001984.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889119.\n"
      }
    },
    {
      "workload": 4,
      "round": 6,
      "mode": 0,
      "exclusions": [
        "disk reads do not cover requested payload"
      ],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28244148224,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    35749.\nPages active:                                1026454.\nPages inactive:                               972554.\nPages speculative:                            364379.\nPages throttled:                                   0.\nPages wired down:                             206963.\nPages purgeable:                               11218.\n\"Translation faults\":                    14026984622.\nPages copy-on-write:                       640294752.\nPages zero filled:                       15962000866.\nPages reactivated:                        2447110066.\nPages purged:                               63067337.\nFile-backed pages:                           1676919.\nAnonymous pages:                              686468.\nPages stored in compressor:                  1445634.\nPages occupied by compressor:                 479420.\nDecompressions:                            983272787.\nCompressions:                             1278414336.\nPageins:                                  6064114397.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170683.\nPages tagged resident:                        126571.\nPages tagged compressed:                       44112.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          227.\nPages tag-storage non-tag pageable:            91229.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001984.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889119.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          3.20654296875,
          2.2626953125,
          1.8701171875
        ],
        "observed_at_unix_seconds": 1788635054.0133371,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "4"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 4,
        "records": 2048,
        "batches": 64,
        "bytes": 5662310400,
        "read_calls": 576,
        "seconds": 0.181747,
        "batch_median_seconds": 0.002823,
        "batch_p95_seconds": 0.00298,
        "sampled_footprint_bytes": 90259936,
        "lifetime_rss_peak_bytes": 90587136,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 88473600,
        "diskio_bytesread": 603897856,
        "reformat_bytes": 0,
        "tensor_sha256": "8f2020be78b87dc9f3c5a5cb4fa3b635cfeeb0b85dc58797c37f37edaf7bb25c"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28066725888,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    32638.\nPages active:                                1014163.\nPages inactive:                               972552.\nPages speculative:                            364379.\nPages throttled:                                   0.\nPages wired down:                             222312.\nPages purgeable:                                3499.\n\"Translation faults\":                    14026993605.\nPages copy-on-write:                       640295546.\nPages zero filled:                       15962009976.\nPages reactivated:                        2447110066.\nPages purged:                               63067337.\nFile-backed pages:                           1676920.\nAnonymous pages:                              674174.\nPages stored in compressor:                  1445633.\nPages occupied by compressor:                 479418.\nDecompressions:                            983272788.\nCompressions:                             1278414336.\nPageins:                                  6064114402.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170731.\nPages tagged resident:                        126620.\nPages tagged compressed:                       44111.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          244.\nPages tag-storage non-tag pageable:            91212.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001920.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889120.\n"
      }
    },
    {
      "workload": 4,
      "round": 7,
      "mode": 0,
      "exclusions": [
        "disk reads do not cover requested payload"
      ],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28065529856,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    32564.\nPages active:                                1014161.\nPages inactive:                               972552.\nPages speculative:                            364380.\nPages throttled:                                   0.\nPages wired down:                             222312.\nPages purgeable:                                3499.\n\"Translation faults\":                    14026994377.\nPages copy-on-write:                       640295689.\nPages zero filled:                       15962010028.\nPages reactivated:                        2447110066.\nPages purged:                               63067337.\nFile-backed pages:                           1676921.\nAnonymous pages:                              674172.\nPages stored in compressor:                  1445633.\nPages occupied by compressor:                 479418.\nDecompressions:                            983272788.\nCompressions:                             1278414336.\nPageins:                                  6064114403.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170731.\nPages tagged resident:                        126620.\nPages tagged compressed:                       44111.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          243.\nPages tag-storage non-tag pageable:            91213.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001920.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889120.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          3.20654296875,
          2.2626953125,
          1.8701171875
        ],
        "observed_at_unix_seconds": 1788635055.862067,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "4"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 4,
        "records": 2048,
        "batches": 64,
        "bytes": 5662310400,
        "read_calls": 576,
        "seconds": 0.181933998,
        "batch_median_seconds": 0.002836,
        "batch_p95_seconds": 0.00296,
        "sampled_footprint_bytes": 90259936,
        "lifetime_rss_peak_bytes": 90587136,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 88473600,
        "diskio_bytesread": 603897856,
        "reformat_bytes": 0,
        "tensor_sha256": "8f2020be78b87dc9f3c5a5cb4fa3b635cfeeb0b85dc58797c37f37edaf7bb25c"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28065759232,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    32573.\nPages active:                                1015579.\nPages inactive:                               972559.\nPages speculative:                            364383.\nPages throttled:                                   0.\nPages wired down:                             220705.\nPages purgeable:                                3499.\n\"Translation faults\":                    14027004472.\nPages copy-on-write:                       640296522.\nPages zero filled:                       15962017011.\nPages reactivated:                        2447110200.\nPages purged:                               63067337.\nFile-backed pages:                           1676926.\nAnonymous pages:                              675595.\nPages stored in compressor:                  1445633.\nPages occupied by compressor:                 479418.\nDecompressions:                            983272788.\nCompressions:                             1278414336.\nPageins:                                  6064114410.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170783.\nPages tagged resident:                        126672.\nPages tagged compressed:                       44111.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          276.\nPages tag-storage non-tag pageable:            91180.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001920.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889120.\n"
      }
    },
    {
      "workload": 4,
      "round": 7,
      "mode": 2,
      "exclusions": [],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28064595968,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    32501.\nPages active:                                1015580.\nPages inactive:                               972559.\nPages speculative:                            364384.\nPages throttled:                                   0.\nPages wired down:                             220705.\nPages purgeable:                                3499.\n\"Translation faults\":                    14027005248.\nPages copy-on-write:                       640296670.\nPages zero filled:                       15962017066.\nPages reactivated:                        2447110200.\nPages purged:                               63067337.\nFile-backed pages:                           1676927.\nAnonymous pages:                              675596.\nPages stored in compressor:                  1445633.\nPages occupied by compressor:                 479418.\nDecompressions:                            983272788.\nCompressions:                             1278414336.\nPageins:                                  6064114411.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170783.\nPages tagged resident:                        126672.\nPages tagged compressed:                       44111.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          278.\nPages tag-storage non-tag pageable:            91178.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001920.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889120.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          3.10986328125,
          2.25830078125,
          1.87060546875
        ],
        "observed_at_unix_seconds": 1788635057.7179992,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "4"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 4,
        "records": 2048,
        "batches": 64,
        "bytes": 5662310400,
        "read_calls": 64,
        "seconds": 2.224731,
        "batch_median_seconds": 0.033478,
        "batch_p95_seconds": 0.037528,
        "sampled_footprint_bytes": 178536952,
        "lifetime_rss_peak_bytes": 178847744,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 176947200,
        "diskio_bytesread": 5662310400,
        "reformat_bytes": 5662310400,
        "tensor_sha256": "8f2020be78b87dc9f3c5a5cb4fa3b635cfeeb0b85dc58797c37f37edaf7bb25c"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28068790272,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    32753.\nPages active:                                1015235.\nPages inactive:                               972556.\nPages speculative:                            364388.\nPages throttled:                                   0.\nPages wired down:                             220962.\nPages purgeable:                                3498.\n\"Translation faults\":                    14027019686.\nPages copy-on-write:                       640297480.\nPages zero filled:                       15962029013.\nPages reactivated:                        2447110203.\nPages purged:                               63067337.\nFile-backed pages:                           1676932.\nAnonymous pages:                              675247.\nPages stored in compressor:                  1445627.\nPages occupied by compressor:                 479418.\nDecompressions:                            983272794.\nCompressions:                             1278414336.\nPageins:                                  6064114416.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170769.\nPages tagged resident:                        126658.\nPages tagged compressed:                       44111.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          288.\nPages tag-storage non-tag pageable:            91168.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001920.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889120.\n"
      }
    },
    {
      "workload": 5,
      "round": 1,
      "mode": 0,
      "exclusions": [
        "disk reads do not cover requested payload"
      ],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28067381248,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    32667.\nPages active:                                1015234.\nPages inactive:                               972556.\nPages speculative:                            364390.\nPages throttled:                                   0.\nPages wired down:                             220963.\nPages purgeable:                                3496.\n\"Translation faults\":                    14027020458.\nPages copy-on-write:                       640297627.\nPages zero filled:                       15962029067.\nPages reactivated:                        2447110203.\nPages purged:                               63067337.\nFile-backed pages:                           1676934.\nAnonymous pages:                              675246.\nPages stored in compressor:                  1445627.\nPages occupied by compressor:                 479418.\nDecompressions:                            983272794.\nCompressions:                             1278414336.\nPageins:                                  6064114417.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170769.\nPages tagged resident:                        126658.\nPages tagged compressed:                       44111.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          287.\nPages tag-storage non-tag pageable:            91169.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001920.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889120.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          3.1806640625,
          2.287109375,
          1.8828125
        ],
        "observed_at_unix_seconds": 1788635061.64015,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "5"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 5,
        "records": 1024,
        "batches": 32,
        "bytes": 2831155200,
        "read_calls": 4680,
        "seconds": 0.091057001,
        "batch_median_seconds": 0.002823,
        "batch_p95_seconds": 0.003138,
        "sampled_footprint_bytes": 90309088,
        "lifetime_rss_peak_bytes": 90636288,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 88473600,
        "diskio_bytesread": 336347136,
        "reformat_bytes": 0,
        "tensor_sha256": "437f4461dd80edc9e798e9f9699f3b665ef9d09be87d085060a4577fdf114d65"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28065447936,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    32545.\nPages active:                                1013885.\nPages inactive:                               972557.\nPages speculative:                            364391.\nPages throttled:                                   0.\nPages wired down:                             222309.\nPages purgeable:                                3498.\n\"Translation faults\":                    14027030497.\nPages copy-on-write:                       640298488.\nPages zero filled:                       15962036027.\nPages reactivated:                        2447110203.\nPages purged:                               63067337.\nFile-backed pages:                           1676936.\nAnonymous pages:                              673897.\nPages stored in compressor:                  1445627.\nPages occupied by compressor:                 479418.\nDecompressions:                            983272794.\nCompressions:                             1278414336.\nPageins:                                  6064114424.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170821.\nPages tagged resident:                        126710.\nPages tagged compressed:                       44111.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          301.\nPages tag-storage non-tag pageable:            91155.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001920.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889120.\n"
      }
    },
    {
      "workload": 5,
      "round": 1,
      "mode": 2,
      "exclusions": [
        "physical footprint over bound"
      ],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28064514048,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    32487.\nPages active:                                1013882.\nPages inactive:                               972557.\nPages speculative:                            364392.\nPages throttled:                                   0.\nPages wired down:                             222309.\nPages purgeable:                                3498.\n\"Translation faults\":                    14027031266.\nPages copy-on-write:                       640298637.\nPages zero filled:                       15962036078.\nPages reactivated:                        2447110203.\nPages purged:                               63067337.\nFile-backed pages:                           1676937.\nAnonymous pages:                              673894.\nPages stored in compressor:                  1445627.\nPages occupied by compressor:                 479418.\nDecompressions:                            983272794.\nCompressions:                             1278414336.\nPageins:                                  6064114425.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170821.\nPages tagged resident:                        126710.\nPages tagged compressed:                       44111.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          292.\nPages tag-storage non-tag pageable:            91164.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001920.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889120.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          3.1806640625,
          2.287109375,
          1.8828125
        ],
        "observed_at_unix_seconds": 1788635062.6067772,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "5"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 5,
        "records": 1024,
        "batches": 32,
        "bytes": 2831155200,
        "read_calls": 520,
        "seconds": 0.368881,
        "batch_median_seconds": 0.011281,
        "batch_p95_seconds": 0.014167,
        "sampled_footprint_bytes": 548127968,
        "lifetime_rss_peak_bytes": 547930112,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 423014400,
        "diskio_bytesread": 2831155200,
        "reformat_bytes": 2831155200,
        "tensor_sha256": "437f4461dd80edc9e798e9f9699f3b665ef9d09be87d085060a4577fdf114d65"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28264562688,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    46823.\nPages active:                                1004051.\nPages inactive:                               971629.\nPages speculative:                            362270.\nPages throttled:                                   0.\nPages wired down:                             220554.\nPages purgeable:                                3498.\n\"Translation faults\":                    14027068861.\nPages copy-on-write:                       640299531.\nPages zero filled:                       15962044881.\nPages reactivated:                        2447110224.\nPages purged:                               63067339.\nFile-backed pages:                           1674811.\nAnonymous pages:                              663139.\nPages stored in compressor:                  1445627.\nPages occupied by compressor:                 479418.\nDecompressions:                            983272794.\nCompressions:                             1278414336.\nPageins:                                  6064114432.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170694.\nPages tagged resident:                        126583.\nPages tagged compressed:                       44111.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          925.\nPages tag-storage non-tag pageable:            90531.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001920.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889120.\n"
      }
    },
    {
      "workload": 5,
      "round": 2,
      "mode": 2,
      "exclusions": [
        "physical footprint over bound"
      ],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28263317504,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    46745.\nPages active:                                1004052.\nPages inactive:                               971629.\nPages speculative:                            362272.\nPages throttled:                                   0.\nPages wired down:                             220554.\nPages purgeable:                                3498.\n\"Translation faults\":                    14027069642.\nPages copy-on-write:                       640299678.\nPages zero filled:                       15962044939.\nPages reactivated:                        2447110224.\nPages purged:                               63067339.\nFile-backed pages:                           1674813.\nAnonymous pages:                              663140.\nPages stored in compressor:                  1445627.\nPages occupied by compressor:                 479418.\nDecompressions:                            983272794.\nCompressions:                             1278414336.\nPageins:                                  6064114433.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170694.\nPages tagged resident:                        126583.\nPages tagged compressed:                       44111.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          921.\nPages tag-storage non-tag pageable:            90535.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001920.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889120.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          3.1806640625,
          2.287109375,
          1.8828125
        ],
        "observed_at_unix_seconds": 1788635063.877214,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "5"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 5,
        "records": 1024,
        "batches": 32,
        "bytes": 2831155200,
        "read_calls": 520,
        "seconds": 0.369681,
        "batch_median_seconds": 0.011239,
        "batch_p95_seconds": 0.014189,
        "sampled_footprint_bytes": 550880480,
        "lifetime_rss_peak_bytes": 550682624,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 423014400,
        "diskio_bytesread": 2831155200,
        "reformat_bytes": 2831155200,
        "tensor_sha256": "437f4461dd80edc9e798e9f9699f3b665ef9d09be87d085060a4577fdf114d65"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28414738432,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    46470.\nPages active:                                1017723.\nPages inactive:                               971630.\nPages speculative:                            362277.\nPages throttled:                                   0.\nPages wired down:                             206797.\nPages purgeable:                               13009.\n\"Translation faults\":                    14027106551.\nPages copy-on-write:                       640300473.\nPages zero filled:                       15962053488.\nPages reactivated:                        2447110224.\nPages purged:                               63067339.\nFile-backed pages:                           1674819.\nAnonymous pages:                              676811.\nPages stored in compressor:                  1445625.\nPages occupied by compressor:                 479418.\nDecompressions:                            983272796.\nCompressions:                             1278414336.\nPageins:                                  6064114438.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170683.\nPages tagged resident:                        126573.\nPages tagged compressed:                       44110.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          960.\nPages tag-storage non-tag pageable:            90496.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001856.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889121.\n"
      }
    },
    {
      "workload": 5,
      "round": 2,
      "mode": 0,
      "exclusions": [
        "disk reads do not cover requested payload"
      ],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28417916928,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    46663.\nPages active:                                1017718.\nPages inactive:                               971630.\nPages speculative:                            362278.\nPages throttled:                                   0.\nPages wired down:                             206797.\nPages purgeable:                               13009.\n\"Translation faults\":                    14027107325.\nPages copy-on-write:                       640300620.\nPages zero filled:                       15962053540.\nPages reactivated:                        2447110224.\nPages purged:                               63067339.\nFile-backed pages:                           1674820.\nAnonymous pages:                              676806.\nPages stored in compressor:                  1445625.\nPages occupied by compressor:                 479418.\nDecompressions:                            983272796.\nCompressions:                             1278414336.\nPageins:                                  6064114439.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170683.\nPages tagged resident:                        126573.\nPages tagged compressed:                       44110.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          957.\nPages tag-storage non-tag pageable:            90499.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001856.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889121.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          3.1806640625,
          2.287109375,
          1.8828125
        ],
        "observed_at_unix_seconds": 1788635065.145108,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "5"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 5,
        "records": 1024,
        "batches": 32,
        "bytes": 2831155200,
        "read_calls": 4680,
        "seconds": 0.090663,
        "batch_median_seconds": 0.002787,
        "batch_p95_seconds": 0.003034,
        "sampled_footprint_bytes": 90309088,
        "lifetime_rss_peak_bytes": 90636288,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 88473600,
        "diskio_bytesread": 336347136,
        "reformat_bytes": 0,
        "tensor_sha256": "437f4461dd80edc9e798e9f9699f3b665ef9d09be87d085060a4577fdf114d65"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28279128064,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    47789.\nPages active:                                1002933.\nPages inactive:                               971629.\nPages speculative:                            362280.\nPages throttled:                                   0.\nPages wired down:                             220508.\nPages purgeable:                                3410.\n\"Translation faults\":                    14027116114.\nPages copy-on-write:                       640301411.\nPages zero filled:                       15962059445.\nPages reactivated:                        2447110224.\nPages purged:                               63067354.\nFile-backed pages:                           1674822.\nAnonymous pages:                              662020.\nPages stored in compressor:                  1445625.\nPages occupied by compressor:                 479418.\nDecompressions:                            983272796.\nCompressions:                             1278414336.\nPageins:                                  6064114444.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170676.\nPages tagged resident:                        126566.\nPages tagged compressed:                       44110.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          959.\nPages tag-storage non-tag pageable:            90497.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001856.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889121.\n"
      }
    },
    {
      "workload": 5,
      "round": 3,
      "mode": 0,
      "exclusions": [
        "disk reads do not cover requested payload"
      ],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28281946112,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    47959.\nPages active:                                1002932.\nPages inactive:                               971629.\nPages speculative:                            362282.\nPages throttled:                                   0.\nPages wired down:                             220508.\nPages purgeable:                                3410.\n\"Translation faults\":                    14027116898.\nPages copy-on-write:                       640301557.\nPages zero filled:                       15962059498.\nPages reactivated:                        2447110224.\nPages purged:                               63067354.\nFile-backed pages:                           1674824.\nAnonymous pages:                              662019.\nPages stored in compressor:                  1445625.\nPages occupied by compressor:                 479418.\nDecompressions:                            983272796.\nCompressions:                             1278414336.\nPageins:                                  6064114445.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170676.\nPages tagged resident:                        126566.\nPages tagged compressed:                       44110.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          957.\nPages tag-storage non-tag pageable:            90499.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001856.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889121.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          3.1806640625,
          2.287109375,
          1.8828125
        ],
        "observed_at_unix_seconds": 1788635066.1599019,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "5"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 5,
        "records": 1024,
        "batches": 32,
        "bytes": 2831155200,
        "read_calls": 4680,
        "seconds": 0.091215,
        "batch_median_seconds": 0.002793,
        "batch_p95_seconds": 0.003121,
        "sampled_footprint_bytes": 90292680,
        "lifetime_rss_peak_bytes": 90636288,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 88473600,
        "diskio_bytesread": 336347136,
        "reformat_bytes": 0,
        "tensor_sha256": "437f4461dd80edc9e798e9f9699f3b665ef9d09be87d085060a4577fdf114d65"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28276686848,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    47625.\nPages active:                                1003484.\nPages inactive:                               971630.\nPages speculative:                            362282.\nPages throttled:                                   0.\nPages wired down:                             220528.\nPages purgeable:                                3412.\n\"Translation faults\":                    14027129166.\nPages copy-on-write:                       640302575.\nPages zero filled:                       15962066390.\nPages reactivated:                        2447110224.\nPages purged:                               63067354.\nFile-backed pages:                           1674835.\nAnonymous pages:                              662561.\nPages stored in compressor:                  1445625.\nPages occupied by compressor:                 479418.\nDecompressions:                            983272796.\nCompressions:                             1278414336.\nPageins:                                  6064114462.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170665.\nPages tagged resident:                        126555.\nPages tagged compressed:                       44110.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          801.\nPages tag-storage non-tag pageable:            90655.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001856.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889121.\n"
      }
    },
    {
      "workload": 5,
      "round": 3,
      "mode": 2,
      "exclusions": [
        "physical footprint over bound"
      ],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28273344512,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    47420.\nPages active:                                1003480.\nPages inactive:                               971630.\nPages speculative:                            362283.\nPages throttled:                                   0.\nPages wired down:                             220528.\nPages purgeable:                                3412.\n\"Translation faults\":                    14027129947.\nPages copy-on-write:                       640302722.\nPages zero filled:                       15962066441.\nPages reactivated:                        2447110224.\nPages purged:                               63067354.\nFile-backed pages:                           1674836.\nAnonymous pages:                              662557.\nPages stored in compressor:                  1445625.\nPages occupied by compressor:                 479418.\nDecompressions:                            983272796.\nCompressions:                             1278414336.\nPageins:                                  6064114463.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170665.\nPages tagged resident:                        126555.\nPages tagged compressed:                       44110.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          795.\nPages tag-storage non-tag pageable:            90661.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001856.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889121.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          3.005859375,
          2.265625,
          1.87744140625
        ],
        "observed_at_unix_seconds": 1788635067.121878,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "5"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 5,
        "records": 1024,
        "batches": 32,
        "bytes": 2831155200,
        "read_calls": 520,
        "seconds": 0.369425999,
        "batch_median_seconds": 0.011004,
        "batch_p95_seconds": 0.014187,
        "sampled_footprint_bytes": 545359072,
        "lifetime_rss_peak_bytes": 545161216,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 423014400,
        "diskio_bytesread": 2831155200,
        "reformat_bytes": 2831155200,
        "tensor_sha256": "437f4461dd80edc9e798e9f9699f3b665ef9d09be87d085060a4577fdf114d65"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28255141888,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    46226.\nPages active:                                1001963.\nPages inactive:                               971645.\nPages speculative:                            362343.\nPages throttled:                                   0.\nPages wired down:                             223476.\nPages purgeable:                                3414.\n\"Translation faults\":                    14027167929.\nPages copy-on-write:                       640303565.\nPages zero filled:                       15962080246.\nPages reactivated:                        2447110224.\nPages purged:                               63067354.\nFile-backed pages:                           1674917.\nAnonymous pages:                              661034.\nPages stored in compressor:                  1445623.\nPages occupied by compressor:                 479418.\nDecompressions:                            983272798.\nCompressions:                             1278414336.\nPageins:                                  6064114541.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170714.\nPages tagged resident:                        126604.\nPages tagged compressed:                       44110.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          716.\nPages tag-storage non-tag pageable:            90725.\nPages tag-storage non-tag wired:                  23.\nBytes of compressed tags:                    7001856.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889121.\n"
      }
    },
    {
      "workload": 5,
      "round": 4,
      "mode": 2,
      "exclusions": [
        "physical footprint over bound"
      ],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28251029504,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    46029.\nPages active:                                1002006.\nPages inactive:                               971645.\nPages speculative:                            362289.\nPages throttled:                                   0.\nPages wired down:                             223637.\nPages purgeable:                                3414.\n\"Translation faults\":                    14027168772.\nPages copy-on-write:                       640303712.\nPages zero filled:                       15962080449.\nPages reactivated:                        2447110224.\nPages purged:                               63067354.\nFile-backed pages:                           1674863.\nAnonymous pages:                              661077.\nPages stored in compressor:                  1445623.\nPages occupied by compressor:                 479418.\nDecompressions:                            983272798.\nCompressions:                             1278414336.\nPageins:                                  6064114542.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170714.\nPages tagged resident:                        126604.\nPages tagged compressed:                       44110.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          709.\nPages tag-storage non-tag pageable:            90747.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001856.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889121.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          3.005859375,
          2.265625,
          1.87744140625
        ],
        "observed_at_unix_seconds": 1788635068.3575768,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "5"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 5,
        "records": 1024,
        "batches": 32,
        "bytes": 2831155200,
        "read_calls": 520,
        "seconds": 0.369611,
        "batch_median_seconds": 0.011009,
        "batch_p95_seconds": 0.014427,
        "sampled_footprint_bytes": 550864096,
        "lifetime_rss_peak_bytes": 550666240,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 423014400,
        "diskio_bytesread": 2831155200,
        "reformat_bytes": 2831155200,
        "tensor_sha256": "437f4461dd80edc9e798e9f9699f3b665ef9d09be87d085060a4577fdf114d65"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28253749248,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    39555.\nPages active:                                1004560.\nPages inactive:                               971813.\nPages speculative:                            368145.\nPages throttled:                                   0.\nPages wired down:                             221648.\nPages purgeable:                                3966.\n\"Translation faults\":                    14027206492.\nPages copy-on-write:                       640304507.\nPages zero filled:                       15962089629.\nPages reactivated:                        2447110225.\nPages purged:                               63067354.\nFile-backed pages:                           1680951.\nAnonymous pages:                              663567.\nPages stored in compressor:                  1445619.\nPages occupied by compressor:                 479416.\nDecompressions:                            983272802.\nCompressions:                             1278414336.\nPageins:                                  6064114589.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170638.\nPages tagged resident:                        126529.\nPages tagged compressed:                       44109.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          669.\nPages tag-storage non-tag pageable:            90787.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001792.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889122.\n"
      }
    },
    {
      "workload": 5,
      "round": 4,
      "mode": 0,
      "exclusions": [
        "disk reads do not cover requested payload"
      ],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28254535680,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    39601.\nPages active:                                1004556.\nPages inactive:                               971813.\nPages speculative:                            368147.\nPages throttled:                                   0.\nPages wired down:                             221648.\nPages purgeable:                                3966.\n\"Translation faults\":                    14027207279.\nPages copy-on-write:                       640304654.\nPages zero filled:                       15962089680.\nPages reactivated:                        2447110225.\nPages purged:                               63067354.\nFile-backed pages:                           1680953.\nAnonymous pages:                              663563.\nPages stored in compressor:                  1445619.\nPages occupied by compressor:                 479416.\nDecompressions:                            983272802.\nCompressions:                             1278414336.\nPageins:                                  6064114590.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170638.\nPages tagged resident:                        126529.\nPages tagged compressed:                       44109.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          668.\nPages tag-storage non-tag pageable:            90788.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001792.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889122.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          3.005859375,
          2.265625,
          1.87744140625
        ],
        "observed_at_unix_seconds": 1788635069.696783,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "5"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 5,
        "records": 1024,
        "batches": 32,
        "bytes": 2831155200,
        "read_calls": 4680,
        "seconds": 0.090912,
        "batch_median_seconds": 0.002748,
        "batch_p95_seconds": 0.003159,
        "sampled_footprint_bytes": 90309088,
        "lifetime_rss_peak_bytes": 90636288,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 88473600,
        "diskio_bytesread": 336347136,
        "reformat_bytes": 0,
        "tensor_sha256": "437f4461dd80edc9e798e9f9699f3b665ef9d09be87d085060a4577fdf114d65"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28248424448,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    39227.\nPages active:                                1002951.\nPages inactive:                               971814.\nPages speculative:                            368147.\nPages throttled:                                   0.\nPages wired down:                             223249.\nPages purgeable:                                3966.\n\"Translation faults\":                    14027216223.\nPages copy-on-write:                       640305449.\nPages zero filled:                       15962095665.\nPages reactivated:                        2447110225.\nPages purged:                               63067354.\nFile-backed pages:                           1680954.\nAnonymous pages:                              661958.\nPages stored in compressor:                  1445619.\nPages occupied by compressor:                 479416.\nDecompressions:                            983272802.\nCompressions:                             1278414336.\nPageins:                                  6064114595.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170630.\nPages tagged resident:                        126521.\nPages tagged compressed:                       44109.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          659.\nPages tag-storage non-tag pageable:            90797.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001792.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889122.\n"
      }
    },
    {
      "workload": 5,
      "round": 5,
      "mode": 0,
      "exclusions": [
        "disk reads do not cover requested payload"
      ],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28251373568,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    39406.\nPages active:                                1002946.\nPages inactive:                               971814.\nPages speculative:                            368148.\nPages throttled:                                   0.\nPages wired down:                             223249.\nPages purgeable:                                3966.\n\"Translation faults\":                    14027217017.\nPages copy-on-write:                       640305598.\nPages zero filled:                       15962095717.\nPages reactivated:                        2447110225.\nPages purged:                               63067354.\nFile-backed pages:                           1680955.\nAnonymous pages:                              661953.\nPages stored in compressor:                  1445619.\nPages occupied by compressor:                 479416.\nDecompressions:                            983272802.\nCompressions:                             1278414336.\nPageins:                                  6064114596.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170630.\nPages tagged resident:                        126521.\nPages tagged compressed:                       44109.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          663.\nPages tag-storage non-tag pageable:            90793.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001792.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889122.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          3.005859375,
          2.265625,
          1.87744140625
        ],
        "observed_at_unix_seconds": 1788635070.6543202,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "5"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 5,
        "records": 1024,
        "batches": 32,
        "bytes": 2831155200,
        "read_calls": 4680,
        "seconds": 0.090772001,
        "batch_median_seconds": 0.002774,
        "batch_p95_seconds": 0.003047,
        "sampled_footprint_bytes": 90292680,
        "lifetime_rss_peak_bytes": 90636288,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 88473600,
        "diskio_bytesread": 336347136,
        "reformat_bytes": 0,
        "tensor_sha256": "437f4461dd80edc9e798e9f9699f3b665ef9d09be87d085060a4577fdf114d65"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28243951616,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    38941.\nPages active:                                1005663.\nPages inactive:                               971881.\nPages speculative:                            368151.\nPages throttled:                                   0.\nPages wired down:                             221647.\nPages purgeable:                                3974.\n\"Translation faults\":                    14027228032.\nPages copy-on-write:                       640306405.\nPages zero filled:                       15962101643.\nPages reactivated:                        2447110225.\nPages purged:                               63067354.\nFile-backed pages:                           1680959.\nAnonymous pages:                              664736.\nPages stored in compressor:                  1444497.\nPages occupied by compressor:                 478606.\nDecompressions:                            983273924.\nCompressions:                             1278414336.\nPageins:                                  6064114601.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170630.\nPages tagged resident:                        126521.\nPages tagged compressed:                       44109.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          494.\nPages tag-storage non-tag pageable:            90962.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001792.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889122.\n"
      }
    },
    {
      "workload": 5,
      "round": 5,
      "mode": 2,
      "exclusions": [
        "physical footprint over bound"
      ],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28245114880,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    39010.\nPages active:                                1005658.\nPages inactive:                               971881.\nPages speculative:                            368153.\nPages throttled:                                   0.\nPages wired down:                             221647.\nPages purgeable:                                3974.\n\"Translation faults\":                    14027228827.\nPages copy-on-write:                       640306556.\nPages zero filled:                       15962101694.\nPages reactivated:                        2447110225.\nPages purged:                               63067354.\nFile-backed pages:                           1680961.\nAnonymous pages:                              664731.\nPages stored in compressor:                  1444497.\nPages occupied by compressor:                 478606.\nDecompressions:                            983273924.\nCompressions:                             1278414336.\nPageins:                                  6064114602.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170630.\nPages tagged resident:                        126521.\nPages tagged compressed:                       44109.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          493.\nPages tag-storage non-tag pageable:            90963.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001792.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889122.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.84521484375,
          2.244140625,
          1.8720703125
        ],
        "observed_at_unix_seconds": 1788635071.611136,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "5"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 5,
        "records": 1024,
        "batches": 32,
        "bytes": 2831155200,
        "read_calls": 520,
        "seconds": 0.37075,
        "batch_median_seconds": 0.011221,
        "batch_p95_seconds": 0.01417,
        "sampled_footprint_bytes": 550864072,
        "lifetime_rss_peak_bytes": 550682624,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 423014400,
        "diskio_bytesread": 2831155200,
        "reformat_bytes": 2831155200,
        "tensor_sha256": "437f4461dd80edc9e798e9f9699f3b665ef9d09be87d085060a4577fdf114d65"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28244705280,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    38985.\nPages active:                                1005647.\nPages inactive:                               971882.\nPages speculative:                            368152.\nPages throttled:                                   0.\nPages wired down:                             221648.\nPages purgeable:                                3974.\n\"Translation faults\":                    14027275126.\nPages copy-on-write:                       640308361.\nPages zero filled:                       15962114240.\nPages reactivated:                        2447110229.\nPages purged:                               63067354.\nFile-backed pages:                           1680961.\nAnonymous pages:                              664720.\nPages stored in compressor:                  1444488.\nPages occupied by compressor:                 478605.\nDecompressions:                            983273933.\nCompressions:                             1278414336.\nPageins:                                  6064114610.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170623.\nPages tagged resident:                        126514.\nPages tagged compressed:                       44109.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          437.\nPages tag-storage non-tag pageable:            91019.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001792.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889122.\n"
      }
    },
    {
      "workload": 5,
      "round": 6,
      "mode": 2,
      "exclusions": [
        "physical footprint over bound"
      ],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28241657856,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    38798.\nPages active:                                1005636.\nPages inactive:                               971882.\nPages speculative:                            368153.\nPages throttled:                                   0.\nPages wired down:                             221648.\nPages purgeable:                                3974.\n\"Translation faults\":                    14027275925.\nPages copy-on-write:                       640308512.\nPages zero filled:                       15962114293.\nPages reactivated:                        2447110229.\nPages purged:                               63067354.\nFile-backed pages:                           1680962.\nAnonymous pages:                              664709.\nPages stored in compressor:                  1444488.\nPages occupied by compressor:                 478605.\nDecompressions:                            983273933.\nCompressions:                             1278414336.\nPageins:                                  6064114611.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170623.\nPages tagged resident:                        126514.\nPages tagged compressed:                       44109.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          430.\nPages tag-storage non-tag pageable:            91026.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001792.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889122.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.84521484375,
          2.244140625,
          1.8720703125
        ],
        "observed_at_unix_seconds": 1788635072.9126332,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "5"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 5,
        "records": 1024,
        "batches": 32,
        "bytes": 2831155200,
        "read_calls": 520,
        "seconds": 0.369188001,
        "batch_median_seconds": 0.011193,
        "batch_p95_seconds": 0.014123,
        "sampled_footprint_bytes": 545359072,
        "lifetime_rss_peak_bytes": 545161216,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 423014400,
        "diskio_bytesread": 2831155200,
        "reformat_bytes": 2831155200,
        "tensor_sha256": "437f4461dd80edc9e798e9f9699f3b665ef9d09be87d085060a4577fdf114d65"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28427239424,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    42405.\nPages active:                                1016299.\nPages inactive:                               971883.\nPages speculative:                            368153.\nPages throttled:                                   0.\nPages wired down:                             207900.\nPages purgeable:                               11693.\n\"Translation faults\":                    14027313851.\nPages copy-on-write:                       640309370.\nPages zero filled:                       15962123787.\nPages reactivated:                        2447110229.\nPages purged:                               63067354.\nFile-backed pages:                           1680963.\nAnonymous pages:                              675372.\nPages stored in compressor:                  1444486.\nPages occupied by compressor:                 478603.\nDecompressions:                            983273935.\nCompressions:                             1278414336.\nPageins:                                  6064114618.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170619.\nPages tagged resident:                        126510.\nPages tagged compressed:                       44109.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          434.\nPages tag-storage non-tag pageable:            91022.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001792.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889122.\n"
      }
    },
    {
      "workload": 5,
      "round": 6,
      "mode": 0,
      "exclusions": [
        "disk reads do not cover requested payload"
      ],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28426027008,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    42330.\nPages active:                                1016295.\nPages inactive:                               971883.\nPages speculative:                            368154.\nPages throttled:                                   0.\nPages wired down:                             207900.\nPages purgeable:                               11693.\n\"Translation faults\":                    14027314649.\nPages copy-on-write:                       640309520.\nPages zero filled:                       15962123840.\nPages reactivated:                        2447110229.\nPages purged:                               63067354.\nFile-backed pages:                           1680964.\nAnonymous pages:                              675368.\nPages stored in compressor:                  1444486.\nPages occupied by compressor:                 478603.\nDecompressions:                            983273935.\nCompressions:                             1278414336.\nPageins:                                  6064114619.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170619.\nPages tagged resident:                        126510.\nPages tagged compressed:                       44109.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          433.\nPages tag-storage non-tag pageable:            91023.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001792.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889122.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.84521484375,
          2.244140625,
          1.8720703125
        ],
        "observed_at_unix_seconds": 1788635074.159816,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "5"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 5,
        "records": 1024,
        "batches": 32,
        "bytes": 2831155200,
        "read_calls": 4680,
        "seconds": 0.090968,
        "batch_median_seconds": 0.002775,
        "batch_p95_seconds": 0.003098,
        "sampled_footprint_bytes": 90341880,
        "lifetime_rss_peak_bytes": 90652672,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 88473600,
        "diskio_bytesread": 336347136,
        "reformat_bytes": 0,
        "tensor_sha256": "437f4461dd80edc9e798e9f9699f3b665ef9d09be87d085060a4577fdf114d65"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28269002752,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    40464.\nPages active:                                1003632.\nPages inactive:                               971873.\nPages speculative:                            368154.\nPages throttled:                                   0.\nPages wired down:                             222389.\nPages purgeable:                                3974.\n\"Translation faults\":                    14027323444.\nPages copy-on-write:                       640310319.\nPages zero filled:                       15962132797.\nPages reactivated:                        2447110229.\nPages purged:                               63067354.\nFile-backed pages:                           1680965.\nAnonymous pages:                              662694.\nPages stored in compressor:                  1444480.\nPages occupied by compressor:                 478598.\nDecompressions:                            983273941.\nCompressions:                             1278414336.\nPageins:                                  6064114624.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170608.\nPages tagged resident:                        126499.\nPages tagged compressed:                       44109.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          477.\nPages tag-storage non-tag pageable:            90979.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001792.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889122.\n"
      }
    },
    {
      "workload": 5,
      "round": 7,
      "mode": 0,
      "exclusions": [
        "disk reads do not cover requested payload"
      ],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28267773952,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    40387.\nPages active:                                1003624.\nPages inactive:                               971873.\nPages speculative:                            368156.\nPages throttled:                                   0.\nPages wired down:                             222389.\nPages purgeable:                                3974.\n\"Translation faults\":                    14027324239.\nPages copy-on-write:                       640310466.\nPages zero filled:                       15962132849.\nPages reactivated:                        2447110229.\nPages purged:                               63067354.\nFile-backed pages:                           1680967.\nAnonymous pages:                              662686.\nPages stored in compressor:                  1444480.\nPages occupied by compressor:                 478598.\nDecompressions:                            983273941.\nCompressions:                             1278414336.\nPageins:                                  6064114625.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170608.\nPages tagged resident:                        126499.\nPages tagged compressed:                       44109.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          478.\nPages tag-storage non-tag pageable:            90978.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001792.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889122.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.84521484375,
          2.244140625,
          1.8720703125
        ],
        "observed_at_unix_seconds": 1788635075.1749701,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "0",
        "5"
      ],
      "exit_code": 0,
      "result": {
        "mode": 0,
        "workload": 5,
        "records": 1024,
        "batches": 32,
        "bytes": 2831155200,
        "read_calls": 4680,
        "seconds": 0.090267,
        "batch_median_seconds": 0.002784,
        "batch_p95_seconds": 0.003014,
        "sampled_footprint_bytes": 90309088,
        "lifetime_rss_peak_bytes": 90636288,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 88473600,
        "diskio_bytesread": 336347136,
        "reformat_bytes": 0,
        "tensor_sha256": "437f4461dd80edc9e798e9f9699f3b665ef9d09be87d085060a4577fdf114d65"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28266135552,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    40286.\nPages active:                                1005493.\nPages inactive:                               971874.\nPages speculative:                            368156.\nPages throttled:                                   0.\nPages wired down:                             220532.\nPages purgeable:                                3974.\n\"Translation faults\":                    14027333044.\nPages copy-on-write:                       640311256.\nPages zero filled:                       15962138788.\nPages reactivated:                        2447110229.\nPages purged:                               63067354.\nFile-backed pages:                           1680968.\nAnonymous pages:                              664555.\nPages stored in compressor:                  1444480.\nPages occupied by compressor:                 478598.\nDecompressions:                            983273941.\nCompressions:                             1278414336.\nPageins:                                  6064114630.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170668.\nPages tagged resident:                        126559.\nPages tagged compressed:                       44109.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          472.\nPages tag-storage non-tag pageable:            90984.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001792.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889122.\n"
      }
    },
    {
      "workload": 5,
      "round": 7,
      "mode": 2,
      "exclusions": [
        "physical footprint over bound"
      ],
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28264873984,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    40208.\nPages active:                                1005491.\nPages inactive:                               971874.\nPages speculative:                            368157.\nPages throttled:                                   0.\nPages wired down:                             220532.\nPages purgeable:                                3974.\n\"Translation faults\":                    14027333843.\nPages copy-on-write:                       640311401.\nPages zero filled:                       15962138839.\nPages reactivated:                        2447110229.\nPages purged:                               63067354.\nFile-backed pages:                           1680969.\nAnonymous pages:                              664553.\nPages stored in compressor:                  1444480.\nPages occupied by compressor:                 478598.\nDecompressions:                            983273941.\nCompressions:                             1278414336.\nPageins:                                  6064114631.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170668.\nPages tagged resident:                        126559.\nPages tagged compressed:                       44109.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          479.\nPages tag-storage non-tag pageable:            90977.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001792.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889122.\n"
      },
      "conditions_before": {
        "load_average_1_5_15_minutes": [
          2.84521484375,
          2.244140625,
          1.8720703125
        ],
        "observed_at_unix_seconds": 1788635076.138344,
        "thermal_limit": "pmset warning/status history, not continuous temperature",
        "energy_joules": null,
        "power_source": {
          "exit_code": 0,
          "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
          "stderr": ""
        },
        "power_configuration": {
          "exit_code": 0,
          "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
          "stderr": ""
        },
        "thermal_status": {
          "exit_code": 0,
          "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
          "stderr": ""
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/native-manifest.txt",
        "2",
        "5"
      ],
      "exit_code": 0,
      "result": {
        "mode": 2,
        "workload": 5,
        "records": 1024,
        "batches": 32,
        "bytes": 2831155200,
        "read_calls": 520,
        "seconds": 0.369291,
        "batch_median_seconds": 0.01115,
        "batch_p95_seconds": 0.014139,
        "sampled_footprint_bytes": 548111584,
        "lifetime_rss_peak_bytes": 547913728,
        "sampling_interval_ms": 20,
        "maximum_owned_buffer_bytes": 423014400,
        "diskio_bytesread": 2831155200,
        "reformat_bytes": 2831155200,
        "tensor_sha256": "437f4461dd80edc9e798e9f9699f3b665ef9d09be87d085060a4577fdf114d65"
      },
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28293152768,
        "swapins": 41717697,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    41938.\nPages active:                                1002417.\nPages inactive:                               971875.\nPages speculative:                            368160.\nPages throttled:                                   0.\nPages wired down:                             222095.\nPages purgeable:                                3974.\n\"Translation faults\":                    14027370419.\nPages copy-on-write:                       640312195.\nPages zero filled:                       15962147321.\nPages reactivated:                        2447110229.\nPages purged:                               63067354.\nFile-backed pages:                           1680965.\nAnonymous pages:                              661487.\nPages stored in compressor:                  1444480.\nPages occupied by compressor:                 478598.\nDecompressions:                            983273941.\nCompressions:                             1278414336.\nPageins:                                  6064114636.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170660.\nPages tagged resident:                        126551.\nPages tagged compressed:                       44109.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          477.\nPages tag-storage non-tag pageable:            90979.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001792.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889122.\n"
      }
    }
  ],
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 28415590400,
    "swapins": 41717681,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   338133.\nPages active:                                 993194.\nPages inactive:                               969161.\nPages speculative:                             83127.\nPages throttled:                                   0.\nPages wired down:                             220507.\nPages purgeable:                                3167.\n\"Translation faults\":                    14025978328.\nPages copy-on-write:                       640211679.\nPages zero filled:                       15961253844.\nPages reactivated:                        2447108879.\nPages purged:                               63064471.\nFile-backed pages:                           1393050.\nAnonymous pages:                              652432.\nPages stored in compressor:                  1447777.\nPages occupied by compressor:                 480151.\nDecompressions:                            983270654.\nCompressions:                             1278414336.\nPageins:                                  6063803501.\nPageouts:                                   10665701.\nSwapins:                                    41717681.\nSwapouts:                                   69922789.\nPages tagged:                                 169951.\nPages tagged resident:                        125441.\nPages tagged compressed:                       44510.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                         1234.\nPages tag-storage non-tag pageable:            90222.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7079616.\nTagged compressions:                         9650726.\nTagged decompressions:                       8888729.\n"
  },
  "native_sha256": "83cb6b3e1172621e79cffee0b0fb1f83d6a9191ff96260847905aeaf55f80227",
  "build_command": [
    "cc",
    "-O2",
    "-std=c11",
    "-Wno-deprecated-declarations",
    "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/expert_layout_probe.c",
    "-o",
    "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe"
  ],
  "artifact": {
    "version": 1,
    "layout": "layer-expert-piece-v1",
    "refs": [
      [
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-000.bin",
          "offset": 7458281377,
          "row_bytes": 819200,
          "source_size": 10039592993,
          "source_mtime_ns": 1788634848380776554,
          "dtype": "U32",
          "shape": [
            512,
            640,
            320
          ],
          "tensor": "model.layers.0.mlp.switch_mlp.gate_proj.weight"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-000.bin",
          "offset": 5137800865,
          "row_bytes": 51200,
          "source_size": 10039592993,
          "source_mtime_ns": 1788634848380776554,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.0.mlp.switch_mlp.gate_proj.scales"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-000.bin",
          "offset": 10013373985,
          "row_bytes": 51200,
          "source_size": 10039592993,
          "source_mtime_ns": 1788634848380776554,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.0.mlp.switch_mlp.gate_proj.biases"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-000.bin",
          "offset": 4693365737,
          "row_bytes": 819200,
          "source_size": 10039592993,
          "source_mtime_ns": 1788634848380776554,
          "dtype": "U32",
          "shape": [
            512,
            640,
            320
          ],
          "tensor": "model.layers.0.mlp.switch_mlp.up_proj.weight"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-000.bin",
          "offset": 6445595073,
          "row_bytes": 51200,
          "source_size": 10039592993,
          "source_mtime_ns": 1788634848380776554,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.0.mlp.switch_mlp.up_proj.scales"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-000.bin",
          "offset": 6770834833,
          "row_bytes": 51200,
          "source_size": 10039592993,
          "source_mtime_ns": 1788634848380776554,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.0.mlp.switch_mlp.up_proj.biases"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-000.bin",
          "offset": 4235421225,
          "row_bytes": 819200,
          "source_size": 10039592993,
          "source_mtime_ns": 1788634848380776554,
          "dtype": "U32",
          "shape": [
            512,
            2560,
            80
          ],
          "tensor": "model.layers.0.mlp.switch_mlp.down_proj.weight"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-000.bin",
          "offset": 4209206825,
          "row_bytes": 51200,
          "source_size": 10039592993,
          "source_mtime_ns": 1788634848380776554,
          "dtype": "BF16",
          "shape": [
            512,
            2560,
            10
          ],
          "tensor": "model.layers.0.mlp.switch_mlp.down_proj.scales"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-000.bin",
          "offset": 9352867441,
          "row_bytes": 51200,
          "source_size": 10039592993,
          "source_mtime_ns": 1788634848380776554,
          "dtype": "BF16",
          "shape": [
            512,
            2560,
            10
          ],
          "tensor": "model.layers.0.mlp.switch_mlp.down_proj.biases"
        }
      ],
      [
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-001.bin",
          "offset": 4881098107,
          "row_bytes": 819200,
          "source_size": 10194989755,
          "source_mtime_ns": 1788634851763424158,
          "dtype": "U32",
          "shape": [
            512,
            640,
            320
          ],
          "tensor": "model.layers.15.mlp.switch_mlp.gate_proj.weight"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-001.bin",
          "offset": 8251775131,
          "row_bytes": 51200,
          "source_size": 10194989755,
          "source_mtime_ns": 1788634851763424158,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.15.mlp.switch_mlp.gate_proj.scales"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-001.bin",
          "offset": 4854883707,
          "row_bytes": 51200,
          "source_size": 10194989755,
          "source_mtime_ns": 1788634851763424158,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.15.mlp.switch_mlp.gate_proj.biases"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-001.bin",
          "offset": 8334985467,
          "row_bytes": 819200,
          "source_size": 10194989755,
          "source_mtime_ns": 1788634851763424158,
          "dtype": "U32",
          "shape": [
            512,
            640,
            320
          ],
          "tensor": "model.layers.15.mlp.switch_mlp.up_proj.weight"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-001.bin",
          "offset": 4828566907,
          "row_bytes": 51200,
          "source_size": 10194989755,
          "source_mtime_ns": 1788634851763424158,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.15.mlp.switch_mlp.up_proj.scales"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-001.bin",
          "offset": 5329124219,
          "row_bytes": 51200,
          "source_size": 10194989755,
          "source_mtime_ns": 1788634851763424158,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.15.mlp.switch_mlp.up_proj.biases"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-001.bin",
          "offset": 7831853211,
          "row_bytes": 819200,
          "source_size": 10194989755,
          "source_mtime_ns": 1788634851763424158,
          "dtype": "U32",
          "shape": [
            512,
            2560,
            80
          ],
          "tensor": "model.layers.15.mlp.switch_mlp.down_proj.weight"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-001.bin",
          "offset": 4793013371,
          "row_bytes": 51200,
          "source_size": 10194989755,
          "source_mtime_ns": 1788634851763424158,
          "dtype": "BF16",
          "shape": [
            512,
            2560,
            10
          ],
          "tensor": "model.layers.15.mlp.switch_mlp.down_proj.scales"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-001.bin",
          "offset": 3301325755,
          "row_bytes": 51200,
          "source_size": 10194989755,
          "source_mtime_ns": 1788634851763424158,
          "dtype": "BF16",
          "shape": [
            512,
            2560,
            10
          ],
          "tensor": "model.layers.15.mlp.switch_mlp.down_proj.biases"
        }
      ],
      [
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-002.bin",
          "offset": 483469220,
          "row_bytes": 819200,
          "source_size": 10190937668,
          "source_mtime_ns": 1788634854543810290,
          "dtype": "U32",
          "shape": [
            512,
            640,
            320
          ],
          "tensor": "model.layers.31.mlp.switch_mlp.gate_proj.weight"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-002.bin",
          "offset": 1359276548,
          "row_bytes": 51200,
          "source_size": 10190937668,
          "source_mtime_ns": 1788634854543810290,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.31.mlp.switch_mlp.gate_proj.scales"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-002.bin",
          "offset": 457254820,
          "row_bytes": 51200,
          "source_size": 10190937668,
          "source_mtime_ns": 1788634854543810290,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.31.mlp.switch_mlp.gate_proj.biases"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-002.bin",
          "offset": 37824420,
          "row_bytes": 819200,
          "source_size": 10190937668,
          "source_mtime_ns": 1788634854543810290,
          "dtype": "U32",
          "shape": [
            512,
            640,
            320
          ],
          "tensor": "model.layers.31.mlp.switch_mlp.up_proj.weight"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-002.bin",
          "offset": 10035596868,
          "row_bytes": 51200,
          "source_size": 10190937668,
          "source_mtime_ns": 1788634854543810290,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.31.mlp.switch_mlp.up_proj.scales"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-002.bin",
          "offset": 6614164068,
          "row_bytes": 51200,
          "source_size": 10190937668,
          "source_mtime_ns": 1788634854543810290,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.31.mlp.switch_mlp.up_proj.biases"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-002.bin",
          "offset": 9083348036,
          "row_bytes": 819200,
          "source_size": 10190937668,
          "source_mtime_ns": 1788634854543810290,
          "dtype": "U32",
          "shape": [
            512,
            2560,
            80
          ],
          "tensor": "model.layers.31.mlp.switch_mlp.down_proj.weight"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-003.bin",
          "offset": 2050977627,
          "row_bytes": 51200,
          "source_size": 10231122683,
          "source_mtime_ns": 1788634854545817713,
          "dtype": "BF16",
          "shape": [
            512,
            2560,
            10
          ],
          "tensor": "model.layers.31.mlp.switch_mlp.down_proj.scales"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-003.bin",
          "offset": 5431842939,
          "row_bytes": 51200,
          "source_size": 10231122683,
          "source_mtime_ns": 1788634854545817713,
          "dtype": "BF16",
          "shape": [
            512,
            2560,
            10
          ],
          "tensor": "model.layers.31.mlp.switch_mlp.down_proj.biases"
        }
      ],
      [
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-004.bin",
          "offset": 3251016082,
          "row_bytes": 819200,
          "source_size": 10237786674,
          "source_mtime_ns": 1788634857908775925,
          "dtype": "U32",
          "shape": [
            512,
            640,
            320
          ],
          "tensor": "model.layers.47.mlp.switch_mlp.gate_proj.weight"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-004.bin",
          "offset": 3224648082,
          "row_bytes": 51200,
          "source_size": 10237786674,
          "source_mtime_ns": 1788634857908775925,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.47.mlp.switch_mlp.gate_proj.scales"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-004.bin",
          "offset": 3198433682,
          "row_bytes": 51200,
          "source_size": 10237786674,
          "source_mtime_ns": 1788634857908775925,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.47.mlp.switch_mlp.gate_proj.biases"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-004.bin",
          "offset": 2348431762,
          "row_bytes": 819200,
          "source_size": 10237786674,
          "source_mtime_ns": 1788634857908775925,
          "dtype": "U32",
          "shape": [
            512,
            640,
            320
          ],
          "tensor": "model.layers.47.mlp.switch_mlp.up_proj.weight"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-004.bin",
          "offset": 4249738642,
          "row_bytes": 51200,
          "source_size": 10237786674,
          "source_mtime_ns": 1788634857908775925,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.47.mlp.switch_mlp.up_proj.scales"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-004.bin",
          "offset": 8384294770,
          "row_bytes": 51200,
          "source_size": 10237786674,
          "source_mtime_ns": 1788634857908775925,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.47.mlp.switch_mlp.up_proj.biases"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-004.bin",
          "offset": 8923656146,
          "row_bytes": 819200,
          "source_size": 10237786674,
          "source_mtime_ns": 1788634857908775925,
          "dtype": "U32",
          "shape": [
            512,
            2560,
            80
          ],
          "tensor": "model.layers.47.mlp.switch_mlp.down_proj.weight"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-004.bin",
          "offset": 8356610834,
          "row_bytes": 51200,
          "source_size": 10237786674,
          "source_mtime_ns": 1788634857908775925,
          "dtype": "BF16",
          "shape": [
            512,
            2560,
            10
          ],
          "tensor": "model.layers.47.mlp.switch_mlp.down_proj.scales"
        },
        {
          "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-004.bin",
          "offset": 2219965330,
          "row_bytes": 51200,
          "source_size": 10237786674,
          "source_mtime_ns": 1788634857908775925,
          "dtype": "BF16",
          "shape": [
            512,
            2560,
            10
          ],
          "tensor": "model.layers.47.mlp.switch_mlp.down_proj.biases"
        }
      ]
    ],
    "checkpoint_refs": [
      [
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00001.safetensors",
          "offset": 7458281377,
          "row_bytes": 819200,
          "source_size": 10039592993,
          "source_mtime_ns": 1788228748798695327,
          "dtype": "U32",
          "shape": [
            512,
            640,
            320
          ],
          "tensor": "model.layers.0.mlp.switch_mlp.gate_proj.weight"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00001.safetensors",
          "offset": 5137800865,
          "row_bytes": 51200,
          "source_size": 10039592993,
          "source_mtime_ns": 1788228748798695327,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.0.mlp.switch_mlp.gate_proj.scales"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00001.safetensors",
          "offset": 10013373985,
          "row_bytes": 51200,
          "source_size": 10039592993,
          "source_mtime_ns": 1788228748798695327,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.0.mlp.switch_mlp.gate_proj.biases"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00001.safetensors",
          "offset": 4693365737,
          "row_bytes": 819200,
          "source_size": 10039592993,
          "source_mtime_ns": 1788228748798695327,
          "dtype": "U32",
          "shape": [
            512,
            640,
            320
          ],
          "tensor": "model.layers.0.mlp.switch_mlp.up_proj.weight"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00001.safetensors",
          "offset": 6445595073,
          "row_bytes": 51200,
          "source_size": 10039592993,
          "source_mtime_ns": 1788228748798695327,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.0.mlp.switch_mlp.up_proj.scales"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00001.safetensors",
          "offset": 6770834833,
          "row_bytes": 51200,
          "source_size": 10039592993,
          "source_mtime_ns": 1788228748798695327,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.0.mlp.switch_mlp.up_proj.biases"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00001.safetensors",
          "offset": 4235421225,
          "row_bytes": 819200,
          "source_size": 10039592993,
          "source_mtime_ns": 1788228748798695327,
          "dtype": "U32",
          "shape": [
            512,
            2560,
            80
          ],
          "tensor": "model.layers.0.mlp.switch_mlp.down_proj.weight"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00001.safetensors",
          "offset": 4209206825,
          "row_bytes": 51200,
          "source_size": 10039592993,
          "source_mtime_ns": 1788228748798695327,
          "dtype": "BF16",
          "shape": [
            512,
            2560,
            10
          ],
          "tensor": "model.layers.0.mlp.switch_mlp.down_proj.scales"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00001.safetensors",
          "offset": 9352867441,
          "row_bytes": 51200,
          "source_size": 10039592993,
          "source_mtime_ns": 1788228748798695327,
          "dtype": "BF16",
          "shape": [
            512,
            2560,
            10
          ],
          "tensor": "model.layers.0.mlp.switch_mlp.down_proj.biases"
        }
      ],
      [
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00005.safetensors",
          "offset": 4881098107,
          "row_bytes": 819200,
          "source_size": 10194989755,
          "source_mtime_ns": 1788230267432612830,
          "dtype": "U32",
          "shape": [
            512,
            640,
            320
          ],
          "tensor": "model.layers.15.mlp.switch_mlp.gate_proj.weight"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00005.safetensors",
          "offset": 8251775131,
          "row_bytes": 51200,
          "source_size": 10194989755,
          "source_mtime_ns": 1788230267432612830,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.15.mlp.switch_mlp.gate_proj.scales"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00005.safetensors",
          "offset": 4854883707,
          "row_bytes": 51200,
          "source_size": 10194989755,
          "source_mtime_ns": 1788230267432612830,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.15.mlp.switch_mlp.gate_proj.biases"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00005.safetensors",
          "offset": 8334985467,
          "row_bytes": 819200,
          "source_size": 10194989755,
          "source_mtime_ns": 1788230267432612830,
          "dtype": "U32",
          "shape": [
            512,
            640,
            320
          ],
          "tensor": "model.layers.15.mlp.switch_mlp.up_proj.weight"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00005.safetensors",
          "offset": 4828566907,
          "row_bytes": 51200,
          "source_size": 10194989755,
          "source_mtime_ns": 1788230267432612830,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.15.mlp.switch_mlp.up_proj.scales"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00005.safetensors",
          "offset": 5329124219,
          "row_bytes": 51200,
          "source_size": 10194989755,
          "source_mtime_ns": 1788230267432612830,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.15.mlp.switch_mlp.up_proj.biases"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00005.safetensors",
          "offset": 7831853211,
          "row_bytes": 819200,
          "source_size": 10194989755,
          "source_mtime_ns": 1788230267432612830,
          "dtype": "U32",
          "shape": [
            512,
            2560,
            80
          ],
          "tensor": "model.layers.15.mlp.switch_mlp.down_proj.weight"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00005.safetensors",
          "offset": 4793013371,
          "row_bytes": 51200,
          "source_size": 10194989755,
          "source_mtime_ns": 1788230267432612830,
          "dtype": "BF16",
          "shape": [
            512,
            2560,
            10
          ],
          "tensor": "model.layers.15.mlp.switch_mlp.down_proj.scales"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00005.safetensors",
          "offset": 3301325755,
          "row_bytes": 51200,
          "source_size": 10194989755,
          "source_mtime_ns": 1788230267432612830,
          "dtype": "BF16",
          "shape": [
            512,
            2560,
            10
          ],
          "tensor": "model.layers.15.mlp.switch_mlp.down_proj.biases"
        }
      ],
      [
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00007.safetensors",
          "offset": 483469220,
          "row_bytes": 819200,
          "source_size": 10190937668,
          "source_mtime_ns": 1788230945388951904,
          "dtype": "U32",
          "shape": [
            512,
            640,
            320
          ],
          "tensor": "model.layers.31.mlp.switch_mlp.gate_proj.weight"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00007.safetensors",
          "offset": 1359276548,
          "row_bytes": 51200,
          "source_size": 10190937668,
          "source_mtime_ns": 1788230945388951904,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.31.mlp.switch_mlp.gate_proj.scales"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00007.safetensors",
          "offset": 457254820,
          "row_bytes": 51200,
          "source_size": 10190937668,
          "source_mtime_ns": 1788230945388951904,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.31.mlp.switch_mlp.gate_proj.biases"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00007.safetensors",
          "offset": 37824420,
          "row_bytes": 819200,
          "source_size": 10190937668,
          "source_mtime_ns": 1788230945388951904,
          "dtype": "U32",
          "shape": [
            512,
            640,
            320
          ],
          "tensor": "model.layers.31.mlp.switch_mlp.up_proj.weight"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00007.safetensors",
          "offset": 10035596868,
          "row_bytes": 51200,
          "source_size": 10190937668,
          "source_mtime_ns": 1788230945388951904,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.31.mlp.switch_mlp.up_proj.scales"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00007.safetensors",
          "offset": 6614164068,
          "row_bytes": 51200,
          "source_size": 10190937668,
          "source_mtime_ns": 1788230945388951904,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.31.mlp.switch_mlp.up_proj.biases"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00007.safetensors",
          "offset": 9083348036,
          "row_bytes": 819200,
          "source_size": 10190937668,
          "source_mtime_ns": 1788230945388951904,
          "dtype": "U32",
          "shape": [
            512,
            2560,
            80
          ],
          "tensor": "model.layers.31.mlp.switch_mlp.down_proj.weight"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00008.safetensors",
          "offset": 2050977627,
          "row_bytes": 51200,
          "source_size": 10231122683,
          "source_mtime_ns": 1788231233782376452,
          "dtype": "BF16",
          "shape": [
            512,
            2560,
            10
          ],
          "tensor": "model.layers.31.mlp.switch_mlp.down_proj.scales"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00008.safetensors",
          "offset": 5431842939,
          "row_bytes": 51200,
          "source_size": 10231122683,
          "source_mtime_ns": 1788231233782376452,
          "dtype": "BF16",
          "shape": [
            512,
            2560,
            10
          ],
          "tensor": "model.layers.31.mlp.switch_mlp.down_proj.biases"
        }
      ],
      [
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00010.safetensors",
          "offset": 3251016082,
          "row_bytes": 819200,
          "source_size": 10237786674,
          "source_mtime_ns": 1788231912822219158,
          "dtype": "U32",
          "shape": [
            512,
            640,
            320
          ],
          "tensor": "model.layers.47.mlp.switch_mlp.gate_proj.weight"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00010.safetensors",
          "offset": 3224648082,
          "row_bytes": 51200,
          "source_size": 10237786674,
          "source_mtime_ns": 1788231912822219158,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.47.mlp.switch_mlp.gate_proj.scales"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00010.safetensors",
          "offset": 3198433682,
          "row_bytes": 51200,
          "source_size": 10237786674,
          "source_mtime_ns": 1788231912822219158,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.47.mlp.switch_mlp.gate_proj.biases"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00010.safetensors",
          "offset": 2348431762,
          "row_bytes": 819200,
          "source_size": 10237786674,
          "source_mtime_ns": 1788231912822219158,
          "dtype": "U32",
          "shape": [
            512,
            640,
            320
          ],
          "tensor": "model.layers.47.mlp.switch_mlp.up_proj.weight"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00010.safetensors",
          "offset": 4249738642,
          "row_bytes": 51200,
          "source_size": 10237786674,
          "source_mtime_ns": 1788231912822219158,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.47.mlp.switch_mlp.up_proj.scales"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00010.safetensors",
          "offset": 8384294770,
          "row_bytes": 51200,
          "source_size": 10237786674,
          "source_mtime_ns": 1788231912822219158,
          "dtype": "BF16",
          "shape": [
            512,
            640,
            40
          ],
          "tensor": "model.layers.47.mlp.switch_mlp.up_proj.biases"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00010.safetensors",
          "offset": 8923656146,
          "row_bytes": 819200,
          "source_size": 10237786674,
          "source_mtime_ns": 1788231912822219158,
          "dtype": "U32",
          "shape": [
            512,
            2560,
            80
          ],
          "tensor": "model.layers.47.mlp.switch_mlp.down_proj.weight"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00010.safetensors",
          "offset": 8356610834,
          "row_bytes": 51200,
          "source_size": 10237786674,
          "source_mtime_ns": 1788231912822219158,
          "dtype": "BF16",
          "shape": [
            512,
            2560,
            10
          ],
          "tensor": "model.layers.47.mlp.switch_mlp.down_proj.scales"
        },
        {
          "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00010.safetensors",
          "offset": 2219965330,
          "row_bytes": 51200,
          "source_size": 10237786674,
          "source_mtime_ns": 1788231912822219158,
          "dtype": "BF16",
          "shape": [
            512,
            2560,
            10
          ],
          "tensor": "model.layers.47.mlp.switch_mlp.down_proj.biases"
        }
      ]
    ],
    "io_controls": {
      "no_cache": 48,
      "no_cache_ext": 112,
      "read_ahead": 45
    },
    "experts_per_layer": 512,
    "bytes": 5662310400,
    "sha256": "b081e6d37a7e079f3a1c4c9d318d15fe5af6984767e847b8dc62c0df394639c7",
    "record_digests_sha256": "ae9e70ec8dff5b453a0ba3c2e446afe700f3cfdc04935e7f2bd502e20d2f5299",
    "record_digests_bytes": 65536,
    "physical_allocated_bytes": 11332186112
  },
  "artifact_verified_after": true,
  "summary": [
    {
      "workload": 0,
      "name": "random pool 1 miss",
      "pairs": [
        {
          "round": 1,
          "exact": true,
          "reduction": -1.1122339940421786,
          "reference_seconds": 1.180889998,
          "packed_seconds": 2.494315997
        },
        {
          "round": 2,
          "exact": true,
          "reduction": -1.2708187644045807,
          "reference_seconds": 1.099333001,
          "packed_seconds": 2.496386007
        },
        {
          "round": 3,
          "exact": true,
          "reduction": -1.282100729684192,
          "reference_seconds": 1.094484996,
          "packed_seconds": 2.497725008
        },
        {
          "round": 4,
          "exact": true,
          "reduction": -1.2832630471469564,
          "reference_seconds": 1.092796996,
          "packed_seconds": 2.495142999
        },
        {
          "round": 5,
          "exact": true,
          "reduction": -1.2795898272022135,
          "reference_seconds": 1.095891006,
          "packed_seconds": 2.498181989
        },
        {
          "round": 7,
          "exact": true,
          "reduction": -1.2660279276950979,
          "reference_seconds": 1.101639999,
          "packed_seconds": 2.496347004
        }
      ],
      "median_reduction": -1.2752042958033971,
      "passed": false
    },
    {
      "workload": 1,
      "name": "random pool 4 misses",
      "pairs": [
        {
          "round": 1,
          "exact": true,
          "reduction": -0.4809261564693952,
          "reference_seconds": 0.665413999,
          "packed_seconds": 0.985428996
        },
        {
          "round": 2,
          "exact": true,
          "reduction": -0.47684093389186955,
          "reference_seconds": 0.667147001,
          "packed_seconds": 0.98527
        },
        {
          "round": 3,
          "exact": true,
          "reduction": -0.4834168723193897,
          "reference_seconds": 0.664712002,
          "packed_seconds": 0.986044999
        },
        {
          "round": 5,
          "exact": true,
          "reduction": -0.47661808111723847,
          "reference_seconds": 0.667503,
          "packed_seconds": 0.985646999
        },
        {
          "round": 6,
          "exact": true,
          "reduction": -0.47584885254189957,
          "reference_seconds": 0.667255998,
          "packed_seconds": 0.984768999
        },
        {
          "round": 7,
          "exact": true,
          "reduction": -0.4792281063037236,
          "reference_seconds": 0.665730997,
          "packed_seconds": 0.984768002
        }
      ],
      "median_reduction": -0.47803452009779657,
      "passed": false
    },
    {
      "workload": 2,
      "name": "random pool 10 misses",
      "pairs": [
        {
          "round": 1,
          "exact": true,
          "reduction": -0.21693221794468465,
          "reference_seconds": 0.550347003,
          "packed_seconds": 0.669734999
        },
        {
          "round": 2,
          "exact": true,
          "reduction": -0.21336546071323292,
          "reference_seconds": 0.551944999,
          "packed_seconds": 0.669710998
        },
        {
          "round": 4,
          "exact": true,
          "reduction": -0.220079567198054,
          "reference_seconds": 0.550460002,
          "packed_seconds": 0.671605001
        },
        {
          "round": 6,
          "exact": true,
          "reduction": -0.2199176924757813,
          "reference_seconds": 0.54916,
          "packed_seconds": 0.66993
        },
        {
          "round": 7,
          "exact": true,
          "reduction": -0.21780555874679064,
          "reference_seconds": 0.549761001,
          "packed_seconds": 0.669502003
        }
      ],
      "median_reduction": -0.21780555874679064,
      "passed": false
    },
    {
      "workload": 3,
      "name": "random pool 32 misses",
      "pairs": [
        {
          "round": 1,
          "exact": true,
          "reduction": -0.002233582158283731,
          "reference_seconds": 0.510390001,
          "packed_seconds": 0.511529999
        },
        {
          "round": 2,
          "exact": true,
          "reduction": -0.01251491247884795,
          "reference_seconds": 0.504678,
          "packed_seconds": 0.510994001
        },
        {
          "round": 3,
          "exact": true,
          "reduction": -0.009264531976383106,
          "reference_seconds": 0.507311002,
          "packed_seconds": 0.512011001
        },
        {
          "round": 4,
          "exact": true,
          "reduction": -0.01008959720900715,
          "reference_seconds": 0.50448,
          "packed_seconds": 0.50957
        },
        {
          "round": 5,
          "exact": true,
          "reduction": -0.009462967194262983,
          "reference_seconds": 0.505444001,
          "packed_seconds": 0.510227001
        },
        {
          "round": 6,
          "exact": true,
          "reduction": -0.012288085621248834,
          "reference_seconds": 0.503333,
          "packed_seconds": 0.509517999
        },
        {
          "round": 7,
          "exact": true,
          "reduction": -0.009773315286373041,
          "reference_seconds": 0.505151001,
          "packed_seconds": 0.510088001
        }
      ],
      "median_reduction": -0.009773315286373041,
      "passed": false
    },
    {
      "workload": 4,
      "name": "dense sweep 32",
      "pairs": [
        {
          "round": 1,
          "exact": true,
          "reduction": -3.713125209645047,
          "reference_seconds": 0.472823,
          "packed_seconds": 2.228474001
        }
      ],
      "median_reduction": -3.713125209645047,
      "passed": false
    },
    {
      "workload": 5,
      "name": "half-density sweep 32",
      "pairs": [],
      "median_reduction": null,
      "passed": false
    }
  ],
  "sources_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 28454223872,
    "swapins": 41717697,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    42237.\nPages active:                                1017659.\nPages inactive:                               971881.\nPages speculative:                            368174.\nPages throttled:                                   0.\nPages wired down:                             206746.\nPages purgeable:                               13485.\n\"Translation faults\":                    14027372733.\nPages copy-on-write:                       640312343.\nPages zero filled:                       15962150598.\nPages reactivated:                        2447110232.\nPages purged:                               63067354.\nFile-backed pages:                           1680986.\nAnonymous pages:                              676728.\nPages stored in compressor:                  1444421.\nPages occupied by compressor:                 478562.\nDecompressions:                            983274000.\nCompressions:                             1278414336.\nPageins:                                  6064114637.\nPageouts:                                   10665726.\nSwapins:                                    41717697.\nSwapouts:                                   69922789.\nPages tagged:                                 170619.\nPages tagged resident:                        126510.\nPages tagged compressed:                       44109.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          323.\nPages tag-storage non-tag pageable:            91133.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001792.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889122.\n"
  }
}

```

## .build/optimization/expert-layout-verified-v77/artifact/manifest.json

SHA-256 `bea5186007c5bf32a237e5eea6e0ad73c868bf951bcb9488da476582c033a39c`; 32129 bytes.

```
{
  "version": 1,
  "layout": "layer-expert-piece-v1",
  "refs": [
    [
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-000.bin",
        "offset": 7458281377,
        "row_bytes": 819200,
        "source_size": 10039592993,
        "source_mtime_ns": 1788634848380776554,
        "dtype": "U32",
        "shape": [
          512,
          640,
          320
        ],
        "tensor": "model.layers.0.mlp.switch_mlp.gate_proj.weight"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-000.bin",
        "offset": 5137800865,
        "row_bytes": 51200,
        "source_size": 10039592993,
        "source_mtime_ns": 1788634848380776554,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.0.mlp.switch_mlp.gate_proj.scales"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-000.bin",
        "offset": 10013373985,
        "row_bytes": 51200,
        "source_size": 10039592993,
        "source_mtime_ns": 1788634848380776554,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.0.mlp.switch_mlp.gate_proj.biases"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-000.bin",
        "offset": 4693365737,
        "row_bytes": 819200,
        "source_size": 10039592993,
        "source_mtime_ns": 1788634848380776554,
        "dtype": "U32",
        "shape": [
          512,
          640,
          320
        ],
        "tensor": "model.layers.0.mlp.switch_mlp.up_proj.weight"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-000.bin",
        "offset": 6445595073,
        "row_bytes": 51200,
        "source_size": 10039592993,
        "source_mtime_ns": 1788634848380776554,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.0.mlp.switch_mlp.up_proj.scales"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-000.bin",
        "offset": 6770834833,
        "row_bytes": 51200,
        "source_size": 10039592993,
        "source_mtime_ns": 1788634848380776554,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.0.mlp.switch_mlp.up_proj.biases"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-000.bin",
        "offset": 4235421225,
        "row_bytes": 819200,
        "source_size": 10039592993,
        "source_mtime_ns": 1788634848380776554,
        "dtype": "U32",
        "shape": [
          512,
          2560,
          80
        ],
        "tensor": "model.layers.0.mlp.switch_mlp.down_proj.weight"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-000.bin",
        "offset": 4209206825,
        "row_bytes": 51200,
        "source_size": 10039592993,
        "source_mtime_ns": 1788634848380776554,
        "dtype": "BF16",
        "shape": [
          512,
          2560,
          10
        ],
        "tensor": "model.layers.0.mlp.switch_mlp.down_proj.scales"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-000.bin",
        "offset": 9352867441,
        "row_bytes": 51200,
        "source_size": 10039592993,
        "source_mtime_ns": 1788634848380776554,
        "dtype": "BF16",
        "shape": [
          512,
          2560,
          10
        ],
        "tensor": "model.layers.0.mlp.switch_mlp.down_proj.biases"
      }
    ],
    [
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-001.bin",
        "offset": 4881098107,
        "row_bytes": 819200,
        "source_size": 10194989755,
        "source_mtime_ns": 1788634851763424158,
        "dtype": "U32",
        "shape": [
          512,
          640,
          320
        ],
        "tensor": "model.layers.15.mlp.switch_mlp.gate_proj.weight"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-001.bin",
        "offset": 8251775131,
        "row_bytes": 51200,
        "source_size": 10194989755,
        "source_mtime_ns": 1788634851763424158,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.15.mlp.switch_mlp.gate_proj.scales"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-001.bin",
        "offset": 4854883707,
        "row_bytes": 51200,
        "source_size": 10194989755,
        "source_mtime_ns": 1788634851763424158,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.15.mlp.switch_mlp.gate_proj.biases"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-001.bin",
        "offset": 8334985467,
        "row_bytes": 819200,
        "source_size": 10194989755,
        "source_mtime_ns": 1788634851763424158,
        "dtype": "U32",
        "shape": [
          512,
          640,
          320
        ],
        "tensor": "model.layers.15.mlp.switch_mlp.up_proj.weight"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-001.bin",
        "offset": 4828566907,
        "row_bytes": 51200,
        "source_size": 10194989755,
        "source_mtime_ns": 1788634851763424158,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.15.mlp.switch_mlp.up_proj.scales"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-001.bin",
        "offset": 5329124219,
        "row_bytes": 51200,
        "source_size": 10194989755,
        "source_mtime_ns": 1788634851763424158,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.15.mlp.switch_mlp.up_proj.biases"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-001.bin",
        "offset": 7831853211,
        "row_bytes": 819200,
        "source_size": 10194989755,
        "source_mtime_ns": 1788634851763424158,
        "dtype": "U32",
        "shape": [
          512,
          2560,
          80
        ],
        "tensor": "model.layers.15.mlp.switch_mlp.down_proj.weight"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-001.bin",
        "offset": 4793013371,
        "row_bytes": 51200,
        "source_size": 10194989755,
        "source_mtime_ns": 1788634851763424158,
        "dtype": "BF16",
        "shape": [
          512,
          2560,
          10
        ],
        "tensor": "model.layers.15.mlp.switch_mlp.down_proj.scales"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-001.bin",
        "offset": 3301325755,
        "row_bytes": 51200,
        "source_size": 10194989755,
        "source_mtime_ns": 1788634851763424158,
        "dtype": "BF16",
        "shape": [
          512,
          2560,
          10
        ],
        "tensor": "model.layers.15.mlp.switch_mlp.down_proj.biases"
      }
    ],
    [
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-002.bin",
        "offset": 483469220,
        "row_bytes": 819200,
        "source_size": 10190937668,
        "source_mtime_ns": 1788634854543810290,
        "dtype": "U32",
        "shape": [
          512,
          640,
          320
        ],
        "tensor": "model.layers.31.mlp.switch_mlp.gate_proj.weight"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-002.bin",
        "offset": 1359276548,
        "row_bytes": 51200,
        "source_size": 10190937668,
        "source_mtime_ns": 1788634854543810290,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.31.mlp.switch_mlp.gate_proj.scales"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-002.bin",
        "offset": 457254820,
        "row_bytes": 51200,
        "source_size": 10190937668,
        "source_mtime_ns": 1788634854543810290,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.31.mlp.switch_mlp.gate_proj.biases"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-002.bin",
        "offset": 37824420,
        "row_bytes": 819200,
        "source_size": 10190937668,
        "source_mtime_ns": 1788634854543810290,
        "dtype": "U32",
        "shape": [
          512,
          640,
          320
        ],
        "tensor": "model.layers.31.mlp.switch_mlp.up_proj.weight"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-002.bin",
        "offset": 10035596868,
        "row_bytes": 51200,
        "source_size": 10190937668,
        "source_mtime_ns": 1788634854543810290,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.31.mlp.switch_mlp.up_proj.scales"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-002.bin",
        "offset": 6614164068,
        "row_bytes": 51200,
        "source_size": 10190937668,
        "source_mtime_ns": 1788634854543810290,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.31.mlp.switch_mlp.up_proj.biases"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-002.bin",
        "offset": 9083348036,
        "row_bytes": 819200,
        "source_size": 10190937668,
        "source_mtime_ns": 1788634854543810290,
        "dtype": "U32",
        "shape": [
          512,
          2560,
          80
        ],
        "tensor": "model.layers.31.mlp.switch_mlp.down_proj.weight"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-003.bin",
        "offset": 2050977627,
        "row_bytes": 51200,
        "source_size": 10231122683,
        "source_mtime_ns": 1788634854545817713,
        "dtype": "BF16",
        "shape": [
          512,
          2560,
          10
        ],
        "tensor": "model.layers.31.mlp.switch_mlp.down_proj.scales"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-003.bin",
        "offset": 5431842939,
        "row_bytes": 51200,
        "source_size": 10231122683,
        "source_mtime_ns": 1788634854545817713,
        "dtype": "BF16",
        "shape": [
          512,
          2560,
          10
        ],
        "tensor": "model.layers.31.mlp.switch_mlp.down_proj.biases"
      }
    ],
    [
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-004.bin",
        "offset": 3251016082,
        "row_bytes": 819200,
        "source_size": 10237786674,
        "source_mtime_ns": 1788634857908775925,
        "dtype": "U32",
        "shape": [
          512,
          640,
          320
        ],
        "tensor": "model.layers.47.mlp.switch_mlp.gate_proj.weight"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-004.bin",
        "offset": 3224648082,
        "row_bytes": 51200,
        "source_size": 10237786674,
        "source_mtime_ns": 1788634857908775925,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.47.mlp.switch_mlp.gate_proj.scales"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-004.bin",
        "offset": 3198433682,
        "row_bytes": 51200,
        "source_size": 10237786674,
        "source_mtime_ns": 1788634857908775925,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.47.mlp.switch_mlp.gate_proj.biases"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-004.bin",
        "offset": 2348431762,
        "row_bytes": 819200,
        "source_size": 10237786674,
        "source_mtime_ns": 1788634857908775925,
        "dtype": "U32",
        "shape": [
          512,
          640,
          320
        ],
        "tensor": "model.layers.47.mlp.switch_mlp.up_proj.weight"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-004.bin",
        "offset": 4249738642,
        "row_bytes": 51200,
        "source_size": 10237786674,
        "source_mtime_ns": 1788634857908775925,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.47.mlp.switch_mlp.up_proj.scales"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-004.bin",
        "offset": 8384294770,
        "row_bytes": 51200,
        "source_size": 10237786674,
        "source_mtime_ns": 1788634857908775925,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.47.mlp.switch_mlp.up_proj.biases"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-004.bin",
        "offset": 8923656146,
        "row_bytes": 819200,
        "source_size": 10237786674,
        "source_mtime_ns": 1788634857908775925,
        "dtype": "U32",
        "shape": [
          512,
          2560,
          80
        ],
        "tensor": "model.layers.47.mlp.switch_mlp.down_proj.weight"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-004.bin",
        "offset": 8356610834,
        "row_bytes": 51200,
        "source_size": 10237786674,
        "source_mtime_ns": 1788634857908775925,
        "dtype": "BF16",
        "shape": [
          512,
          2560,
          10
        ],
        "tensor": "model.layers.47.mlp.switch_mlp.down_proj.scales"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-004.bin",
        "offset": 2219965330,
        "row_bytes": 51200,
        "source_size": 10237786674,
        "source_mtime_ns": 1788634857908775925,
        "dtype": "BF16",
        "shape": [
          512,
          2560,
          10
        ],
        "tensor": "model.layers.47.mlp.switch_mlp.down_proj.biases"
      }
    ]
  ],
  "checkpoint_refs": [
    [
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00001.safetensors",
        "offset": 7458281377,
        "row_bytes": 819200,
        "source_size": 10039592993,
        "source_mtime_ns": 1788228748798695327,
        "dtype": "U32",
        "shape": [
          512,
          640,
          320
        ],
        "tensor": "model.layers.0.mlp.switch_mlp.gate_proj.weight"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00001.safetensors",
        "offset": 5137800865,
        "row_bytes": 51200,
        "source_size": 10039592993,
        "source_mtime_ns": 1788228748798695327,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.0.mlp.switch_mlp.gate_proj.scales"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00001.safetensors",
        "offset": 10013373985,
        "row_bytes": 51200,
        "source_size": 10039592993,
        "source_mtime_ns": 1788228748798695327,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.0.mlp.switch_mlp.gate_proj.biases"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00001.safetensors",
        "offset": 4693365737,
        "row_bytes": 819200,
        "source_size": 10039592993,
        "source_mtime_ns": 1788228748798695327,
        "dtype": "U32",
        "shape": [
          512,
          640,
          320
        ],
        "tensor": "model.layers.0.mlp.switch_mlp.up_proj.weight"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00001.safetensors",
        "offset": 6445595073,
        "row_bytes": 51200,
        "source_size": 10039592993,
        "source_mtime_ns": 1788228748798695327,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.0.mlp.switch_mlp.up_proj.scales"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00001.safetensors",
        "offset": 6770834833,
        "row_bytes": 51200,
        "source_size": 10039592993,
        "source_mtime_ns": 1788228748798695327,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.0.mlp.switch_mlp.up_proj.biases"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00001.safetensors",
        "offset": 4235421225,
        "row_bytes": 819200,
        "source_size": 10039592993,
        "source_mtime_ns": 1788228748798695327,
        "dtype": "U32",
        "shape": [
          512,
          2560,
          80
        ],
        "tensor": "model.layers.0.mlp.switch_mlp.down_proj.weight"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00001.safetensors",
        "offset": 4209206825,
        "row_bytes": 51200,
        "source_size": 10039592993,
        "source_mtime_ns": 1788228748798695327,
        "dtype": "BF16",
        "shape": [
          512,
          2560,
          10
        ],
        "tensor": "model.layers.0.mlp.switch_mlp.down_proj.scales"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00001.safetensors",
        "offset": 9352867441,
        "row_bytes": 51200,
        "source_size": 10039592993,
        "source_mtime_ns": 1788228748798695327,
        "dtype": "BF16",
        "shape": [
          512,
          2560,
          10
        ],
        "tensor": "model.layers.0.mlp.switch_mlp.down_proj.biases"
      }
    ],
    [
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00005.safetensors",
        "offset": 4881098107,
        "row_bytes": 819200,
        "source_size": 10194989755,
        "source_mtime_ns": 1788230267432612830,
        "dtype": "U32",
        "shape": [
          512,
          640,
          320
        ],
        "tensor": "model.layers.15.mlp.switch_mlp.gate_proj.weight"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00005.safetensors",
        "offset": 8251775131,
        "row_bytes": 51200,
        "source_size": 10194989755,
        "source_mtime_ns": 1788230267432612830,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.15.mlp.switch_mlp.gate_proj.scales"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00005.safetensors",
        "offset": 4854883707,
        "row_bytes": 51200,
        "source_size": 10194989755,
        "source_mtime_ns": 1788230267432612830,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.15.mlp.switch_mlp.gate_proj.biases"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00005.safetensors",
        "offset": 8334985467,
        "row_bytes": 819200,
        "source_size": 10194989755,
        "source_mtime_ns": 1788230267432612830,
        "dtype": "U32",
        "shape": [
          512,
          640,
          320
        ],
        "tensor": "model.layers.15.mlp.switch_mlp.up_proj.weight"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00005.safetensors",
        "offset": 4828566907,
        "row_bytes": 51200,
        "source_size": 10194989755,
        "source_mtime_ns": 1788230267432612830,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.15.mlp.switch_mlp.up_proj.scales"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00005.safetensors",
        "offset": 5329124219,
        "row_bytes": 51200,
        "source_size": 10194989755,
        "source_mtime_ns": 1788230267432612830,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.15.mlp.switch_mlp.up_proj.biases"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00005.safetensors",
        "offset": 7831853211,
        "row_bytes": 819200,
        "source_size": 10194989755,
        "source_mtime_ns": 1788230267432612830,
        "dtype": "U32",
        "shape": [
          512,
          2560,
          80
        ],
        "tensor": "model.layers.15.mlp.switch_mlp.down_proj.weight"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00005.safetensors",
        "offset": 4793013371,
        "row_bytes": 51200,
        "source_size": 10194989755,
        "source_mtime_ns": 1788230267432612830,
        "dtype": "BF16",
        "shape": [
          512,
          2560,
          10
        ],
        "tensor": "model.layers.15.mlp.switch_mlp.down_proj.scales"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00005.safetensors",
        "offset": 3301325755,
        "row_bytes": 51200,
        "source_size": 10194989755,
        "source_mtime_ns": 1788230267432612830,
        "dtype": "BF16",
        "shape": [
          512,
          2560,
          10
        ],
        "tensor": "model.layers.15.mlp.switch_mlp.down_proj.biases"
      }
    ],
    [
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00007.safetensors",
        "offset": 483469220,
        "row_bytes": 819200,
        "source_size": 10190937668,
        "source_mtime_ns": 1788230945388951904,
        "dtype": "U32",
        "shape": [
          512,
          640,
          320
        ],
        "tensor": "model.layers.31.mlp.switch_mlp.gate_proj.weight"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00007.safetensors",
        "offset": 1359276548,
        "row_bytes": 51200,
        "source_size": 10190937668,
        "source_mtime_ns": 1788230945388951904,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.31.mlp.switch_mlp.gate_proj.scales"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00007.safetensors",
        "offset": 457254820,
        "row_bytes": 51200,
        "source_size": 10190937668,
        "source_mtime_ns": 1788230945388951904,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.31.mlp.switch_mlp.gate_proj.biases"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00007.safetensors",
        "offset": 37824420,
        "row_bytes": 819200,
        "source_size": 10190937668,
        "source_mtime_ns": 1788230945388951904,
        "dtype": "U32",
        "shape": [
          512,
          640,
          320
        ],
        "tensor": "model.layers.31.mlp.switch_mlp.up_proj.weight"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00007.safetensors",
        "offset": 10035596868,
        "row_bytes": 51200,
        "source_size": 10190937668,
        "source_mtime_ns": 1788230945388951904,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.31.mlp.switch_mlp.up_proj.scales"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00007.safetensors",
        "offset": 6614164068,
        "row_bytes": 51200,
        "source_size": 10190937668,
        "source_mtime_ns": 1788230945388951904,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.31.mlp.switch_mlp.up_proj.biases"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00007.safetensors",
        "offset": 9083348036,
        "row_bytes": 819200,
        "source_size": 10190937668,
        "source_mtime_ns": 1788230945388951904,
        "dtype": "U32",
        "shape": [
          512,
          2560,
          80
        ],
        "tensor": "model.layers.31.mlp.switch_mlp.down_proj.weight"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00008.safetensors",
        "offset": 2050977627,
        "row_bytes": 51200,
        "source_size": 10231122683,
        "source_mtime_ns": 1788231233782376452,
        "dtype": "BF16",
        "shape": [
          512,
          2560,
          10
        ],
        "tensor": "model.layers.31.mlp.switch_mlp.down_proj.scales"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00008.safetensors",
        "offset": 5431842939,
        "row_bytes": 51200,
        "source_size": 10231122683,
        "source_mtime_ns": 1788231233782376452,
        "dtype": "BF16",
        "shape": [
          512,
          2560,
          10
        ],
        "tensor": "model.layers.31.mlp.switch_mlp.down_proj.biases"
      }
    ],
    [
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00010.safetensors",
        "offset": 3251016082,
        "row_bytes": 819200,
        "source_size": 10237786674,
        "source_mtime_ns": 1788231912822219158,
        "dtype": "U32",
        "shape": [
          512,
          640,
          320
        ],
        "tensor": "model.layers.47.mlp.switch_mlp.gate_proj.weight"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00010.safetensors",
        "offset": 3224648082,
        "row_bytes": 51200,
        "source_size": 10237786674,
        "source_mtime_ns": 1788231912822219158,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.47.mlp.switch_mlp.gate_proj.scales"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00010.safetensors",
        "offset": 3198433682,
        "row_bytes": 51200,
        "source_size": 10237786674,
        "source_mtime_ns": 1788231912822219158,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.47.mlp.switch_mlp.gate_proj.biases"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00010.safetensors",
        "offset": 2348431762,
        "row_bytes": 819200,
        "source_size": 10237786674,
        "source_mtime_ns": 1788231912822219158,
        "dtype": "U32",
        "shape": [
          512,
          640,
          320
        ],
        "tensor": "model.layers.47.mlp.switch_mlp.up_proj.weight"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00010.safetensors",
        "offset": 4249738642,
        "row_bytes": 51200,
        "source_size": 10237786674,
        "source_mtime_ns": 1788231912822219158,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.47.mlp.switch_mlp.up_proj.scales"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00010.safetensors",
        "offset": 8384294770,
        "row_bytes": 51200,
        "source_size": 10237786674,
        "source_mtime_ns": 1788231912822219158,
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "tensor": "model.layers.47.mlp.switch_mlp.up_proj.biases"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00010.safetensors",
        "offset": 8923656146,
        "row_bytes": 819200,
        "source_size": 10237786674,
        "source_mtime_ns": 1788231912822219158,
        "dtype": "U32",
        "shape": [
          512,
          2560,
          80
        ],
        "tensor": "model.layers.47.mlp.switch_mlp.down_proj.weight"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00010.safetensors",
        "offset": 8356610834,
        "row_bytes": 51200,
        "source_size": 10237786674,
        "source_mtime_ns": 1788231912822219158,
        "dtype": "BF16",
        "shape": [
          512,
          2560,
          10
        ],
        "tensor": "model.layers.47.mlp.switch_mlp.down_proj.scales"
      },
      {
        "path": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/model-00010.safetensors",
        "offset": 2219965330,
        "row_bytes": 51200,
        "source_size": 10237786674,
        "source_mtime_ns": 1788231912822219158,
        "dtype": "BF16",
        "shape": [
          512,
          2560,
          10
        ],
        "tensor": "model.layers.47.mlp.switch_mlp.down_proj.biases"
      }
    ]
  ],
  "io_controls": {
    "no_cache": 48,
    "no_cache_ext": 112,
    "read_ahead": 45
  },
  "experts_per_layer": 512,
  "bytes": 5662310400,
  "sha256": "b081e6d37a7e079f3a1c4c9d318d15fe5af6984767e847b8dc62c0df394639c7",
  "record_digests_sha256": "ae9e70ec8dff5b453a0ba3c2e446afe700f3cfdc04935e7f2bd502e20d2f5299",
  "record_digests_bytes": 65536,
  "physical_allocated_bytes": 11332186112
}

```

## .build/optimization/expert-layout-verified-v77/native-manifest.txt

SHA-256 `383fee52e42190911a32267205a890b5c54240295782852f3e970667bdb4e6d6`; 4619 bytes.

```
SSLP2
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/experts.bin
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/record-digests.bin
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-000.bin
7458281377 819200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-000.bin
5137800865 51200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-000.bin
10013373985 51200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-000.bin
4693365737 819200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-000.bin
6445595073 51200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-000.bin
6770834833 51200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-000.bin
4235421225 819200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-000.bin
4209206825 51200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-000.bin
9352867441 51200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-001.bin
4881098107 819200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-001.bin
8251775131 51200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-001.bin
4854883707 51200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-001.bin
8334985467 819200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-001.bin
4828566907 51200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-001.bin
5329124219 51200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-001.bin
7831853211 819200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-001.bin
4793013371 51200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-001.bin
3301325755 51200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-002.bin
483469220 819200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-002.bin
1359276548 51200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-002.bin
457254820 51200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-002.bin
37824420 819200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-002.bin
10035596868 51200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-002.bin
6614164068 51200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-002.bin
9083348036 819200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-003.bin
2050977627 51200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-003.bin
5431842939 51200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-004.bin
3251016082 819200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-004.bin
3224648082 51200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-004.bin
3198433682 51200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-004.bin
2348431762 819200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-004.bin
4249738642 51200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-004.bin
8384294770 51200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-004.bin
8923656146 819200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-004.bin
8356610834 51200
/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/artifact/source-004.bin
2219965330 51200

```

## .build/optimization/expert-layout-verified-v77/build.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

```

```

## .build/optimization/expert-layout-verified-v77/expert_layout_probe.c

SHA-256 `2eacf90d744d1bc60ee1e0473b49df8f0c842880c14f185376761f05f81b4a8c`; 12013 bytes.

```
// Bounded, actual-offset layout experiment. No model or GPU allocations.
// Reference mirrors ExpertStore's per-piece pool lanes and longest-first
// sweep jobs. Packed includes conversion back to nine contiguous columns.
#include <CommonCrypto/CommonDigest.h>
#include <dispatch/dispatch.h>
#include <errno.h>
#include <fcntl.h>
#include <libproc.h>
#include <mach/mach.h>
#include <pthread.h>
#include <stdatomic.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/resource.h>
#include <sys/stat.h>
#include <time.h>
#include <unistd.h>

#define PIECES 9
#define LAYERS 4
#define EXPERTS 512
#define MAX_ROWS 32
#define RECORD_BYTES 2764800
typedef struct { int fd; off_t offset; size_t row; } ref_t;
typedef struct { int piece, row, length; size_t bytes; } job_t;
typedef struct {
    ref_t *refs; int packed, mode, sweep, n, lanes, njobs, next;
    off_t packed_base; int *ids; void **out; job_t jobs[PIECES*MAX_ROWS];
    const unsigned char *digests;
    pthread_mutex_t lock; _Atomic int error; _Atomic long calls;
} batch_t;
static double now(void) {
    struct timespec t; clock_gettime(CLOCK_MONOTONIC, &t);
    return t.tv_sec + t.tv_nsec / 1e9;
}
static void die(const char *s) { fprintf(stderr, "%s: %s\n", s, strerror(errno)); exit(2); }
static _Atomic uint64_t sampled_peak=0;
static _Atomic int sampling_stop=0, sampling_error=0;
static void sample_memory(void) {
    struct task_vm_info info; mach_msg_type_number_t cnt=TASK_VM_INFO_COUNT;
    if(task_info(mach_task_self(),TASK_VM_INFO,(task_info_t)&info,&cnt)!=KERN_SUCCESS) {
        atomic_store(&sampling_error,1); return;
    }
    uint64_t prior=atomic_load(&sampled_peak);
    while(prior<info.phys_footprint && !atomic_compare_exchange_weak(&sampled_peak,&prior,info.phys_footprint)) {}
}
static void *sample_loop(void *unused) {
    (void)unused;
    do { sample_memory(); usleep(20000); } while(!atomic_load(&sampling_stop));
    sample_memory(); return NULL;
}
static void *aligned(size_t bytes) {
    void *p = NULL; int e = posix_memalign(&p,16384,bytes);
    if(e) { errno=e; die("allocation"); } return p;
}
static int exact(batch_t *b, int fd, void *dst, size_t bytes, off_t offset) {
    size_t done=0;
    while(done<bytes) {
        if(atomic_load(&b->error)) return 0;
        ssize_t n=pread(fd,(char*)dst+done,bytes-done,offset+done);
        atomic_fetch_add(&b->calls,1);
        if(n<0 && errno==EINTR) continue;
        if(n<=0) { atomic_store(&b->error,n==0?ENODATA:errno); return 0; }
        done+=(size_t)n;
    }
    return 1;
}
static void work(void *context,size_t lane) {
    batch_t *b=context;
    size_t largest=0;
    for(int j=0;j<b->njobs;j++) if(b->jobs[j].bytes>largest) largest=b->jobs[j].bytes;
    void *scratch=b->mode?aligned(largest):NULL;
    int cursor=(int)lane;
    while(!atomic_load(&b->error)) {
        int j=cursor;
        if(b->sweep) { pthread_mutex_lock(&b->lock); j=b->next++; pthread_mutex_unlock(&b->lock); }
        else cursor+=b->lanes;
        if(j>=b->njobs) break;
        job_t job=b->jobs[j];
        if(!b->mode) {
            ref_t ref=b->refs[job.piece];
            if(!exact(b,ref.fd,(char*)b->out[job.piece]+job.row*ref.row,
                job.bytes,ref.offset+(off_t)b->ids[job.row]*ref.row)) break;
        } else {
            if(!exact(b,b->packed,scratch,job.bytes,
                b->packed_base+(off_t)b->ids[job.row]*RECORD_BYTES)) break;
            for(int row=0;row<job.length;row++) {
                if(b->mode==2) {
                    unsigned char hash[CC_SHA256_DIGEST_LENGTH];
                    CC_SHA256((char*)scratch+row*RECORD_BYTES,RECORD_BYTES,hash);
                    if(memcmp(hash,b->digests+b->ids[job.row+row]*CC_SHA256_DIGEST_LENGTH,CC_SHA256_DIGEST_LENGTH)) {
                        atomic_store(&b->error,EBADMSG); break;
                    }
                }
                size_t offset=0;
                for(int p=0;p<PIECES;p++) {
                    size_t bytes=b->refs[p].row;
                    memcpy((char*)b->out[p]+(job.row+row)*bytes,
                        (char*)scratch+row*RECORD_BYTES+offset,bytes);
                    offset+=bytes;
                }
            }
        }
    }
    free(scratch);
}
static int largest_first(const void *a,const void *b) {
    size_t x=((const job_t*)a)->bytes,y=((const job_t*)b)->bytes;
    return (x<y)-(x>y);
}
static int ascending(const void *a,const void *b) { return *(const int*)a-*(const int*)b; }
static int by_time(const void *a,const void *b) {
    double x=*(const double*)a,y=*(const double*)b; return (x>y)-(x<y);
}
static void line(FILE *f,char *out,size_t cap) {
    if(!fgets(out,(int)cap,f)) { errno=EINVAL; die("manifest line"); }
    size_t n=strlen(out);
    if(!n||out[n-1]!='\n') { errno=EINVAL; die("manifest line length"); }
    out[n-1]=0;
}
static int open_data(const char *path) {
    int fd=open(path,O_RDONLY|O_NOFOLLOW);
    if(fd<0) die("open");
    if(fcntl(fd,F_NOCACHE,1)<0||fcntl(fd,F_RDAHEAD,0)<0) die("uncached I/O");
    return fd;
}
static void warm(void *unused,size_t lane) { (void)unused; (void)lane; }
int main(int argc,char **argv) {
    if(argc==2 && !strcmp(argv[1],"--io-constants")) {
        printf("{\"no_cache\":%d,\"no_cache_ext\":%d,\"read_ahead\":%d}\n",F_NOCACHE,F_NOCACHE_EXT,F_RDAHEAD);
        return 0;
    }
    if(argc!=4||strlen(argv[2])!=1||strlen(argv[3])!=1||argv[2][0]<'0'||argv[2][0]>'2'
        ||argv[3][0]<'0'||argv[3][0]>'5') {
        fprintf(stderr,"usage: probe manifest mode(0=pieces,1=packed,2=verified-packed) workload(0..5)\n"); return 2;
    }
    int mode=argv[2][0]-'0', workload=argv[3][0]-'0';
    FILE *file=fopen(argv[1],"r"); if(!file) die("manifest");
    char path[4096]; line(file,path,sizeof(path));
    int version=!strcmp(path,"SSLP2")?2:!strcmp(path,"SSLP1")?1:0;
    if(!version || (mode==2 && version!=2)) { errno=EINVAL; die("manifest version"); }
    line(file,path,sizeof(path)); int packed=open_data(path);
    struct stat st; if(fstat(packed,&st)||st.st_size!=(off_t)LAYERS*EXPERTS*RECORD_BYTES) {
        errno=EINVAL; die("packed length");
    }
    unsigned char digests[LAYERS*EXPERTS*CC_SHA256_DIGEST_LENGTH];
    if(version==2) {
        line(file,path,sizeof(path)); FILE *hashes=fopen(path,"rb");
        if(!hashes) die("record digests");
        if(fread(digests,1,sizeof(digests),hashes)!=sizeof(digests)||fgetc(hashes)!=EOF) {
            errno=EINVAL; die("record digests length");
        }
        fclose(hashes);
    }
    ref_t refs[LAYERS][PIECES];
    for(int l=0;l<LAYERS;l++) {
        size_t total=0;
        for(int p=0;p<PIECES;p++) {
            line(file,path,sizeof(path)); refs[l][p].fd=open_data(path);
            line(file,path,sizeof(path)); long long offset; unsigned long row; char extra;
            if(sscanf(path,"%lld %lu %c",&offset,&row,&extra)!=2||offset<0
                ||row!=(p%3==0?819200:51200)) { errno=EINVAL; die("tensor geometry"); }
            if(fstat(refs[l][p].fd,&st)||offset>st.st_size
                ||(off_t)row*EXPERTS>st.st_size-offset) { errno=EINVAL; die("tensor range"); }
            refs[l][p].offset=offset; refs[l][p].row=row; total+=row;
        }
        if(total!=RECORD_BYTES) { errno=EINVAL; die("record geometry"); }
    }
    if(fgetc(file)!=EOF) { errno=EINVAL; die("manifest trailing data"); } fclose(file);
    int sizes[]={1,4,10,32,32,32}; int batchsize=sizes[workload],sweep=workload>=4;
    dispatch_queue_t queue=dispatch_get_global_queue(QOS_CLASS_USER_INITIATED,0);
    dispatch_apply_f(32,queue,NULL,warm);
    struct rusage_info_v4 io_before={0},io_after={0};
    if(proc_pid_rusage(getpid(),RUSAGE_INFO_V4,(rusage_info_t*)&io_before)) die("disk I/O observation");
    CC_SHA256_CTX checksum; CC_SHA256_Init(&checksum);
    double seconds=0,times[LAYERS*EXPERTS]; int batches=0,records=0; long calls=0;
    size_t max_owned=0; pthread_t sampler;
    int launch=pthread_create(&sampler,NULL,sample_loop,NULL);
    if(launch) { errno=launch; die("memory sampler"); }
    for(int l=0;l<LAYERS;l++) {
        int ids[EXPERTS]; for(int i=0;i<EXPERTS;i++) ids[i]=i;
        uint32_t rng=0x91e10da5U+(uint32_t)l;
        if(workload!=4) {
            for(int i=EXPERTS-1;i>0;i--) {
                rng^=rng<<13; rng^=rng>>17; rng^=rng<<5;
                int j=(int)(rng%(uint32_t)(i+1)),temp=ids[i]; ids[i]=ids[j];ids[j]=temp;
            }
        }
        int count=workload==5?256:EXPERTS;
        if(sweep) qsort(ids,count,sizeof(int),ascending);
        for(int start=0;start<count;start+=batchsize) {
            int n=count-start<batchsize?count-start:batchsize;
            double t=now(); void *out[PIECES];
            for(int p=0;p<PIECES;p++) out[p]=aligned((size_t)n*refs[l][p].row);
            batch_t b={.refs=refs[l],.packed=packed,.mode=mode,.sweep=sweep,
                .n=n,.packed_base=(off_t)l*EXPERTS*RECORD_BYTES,.ids=ids+start,.out=out,
                .digests=digests+l*EXPERTS*CC_SHA256_DIGEST_LENGTH,
                .lock=PTHREAD_MUTEX_INITIALIZER,.error=0,.calls=0};
            for(int row=0;row<n;) {
                int len=1;
                if(sweep) while(row+len<n && b.ids[row+len]==b.ids[row]+len) len++;
                if(mode) b.jobs[b.njobs++]=(job_t){0,row,len,(size_t)len*RECORD_BYTES};
                else for(int p=0;p<PIECES;p++)
                    b.jobs[b.njobs++]=(job_t){p,row,len,(size_t)len*refs[l][p].row};
                row+=len;
            }
            if(sweep) qsort(b.jobs,b.njobs,sizeof(job_t),largest_first);
            b.lanes=sweep?12:32; if(b.lanes>b.njobs) b.lanes=b.njobs;
            dispatch_apply_f((size_t)b.lanes,queue,&b,work);
            pthread_mutex_destroy(&b.lock);
            double elapsed=now()-t;
            int error=atomic_load(&b.error); if(error) { errno=error; die("batch read"); }
            calls+=atomic_load(&b.calls);
            // Hash every returned tensor byte outside the measured region.
            // Both paths produce exactly the same column ordering.
            for(int p=0;p<PIECES;p++) CC_SHA256_Update(&checksum,out[p],(CC_LONG)((size_t)n*refs[l][p].row));
            sample_memory();
            size_t scratch=0; if(mode) for(int j=0;j<b.njobs;j++) if(b.jobs[j].bytes>scratch) scratch=b.jobs[j].bytes;
            size_t owned=(size_t)n*RECORD_BYTES+scratch*(size_t)b.lanes;
            if(owned>max_owned) max_owned=owned;
            t=now(); for(int p=0;p<PIECES;p++) free(out[p]); elapsed+=now()-t;
            times[batches++]=elapsed; seconds+=elapsed; records+=n;
        }
    }
    atomic_store(&sampling_stop,1); pthread_join(sampler,NULL);
    if(proc_pid_rusage(getpid(),RUSAGE_INFO_V4,(rusage_info_t*)&io_after)) die("disk I/O observation");
    if(atomic_load(&sampling_error)) { errno=EIO; die("footprint sampler"); }
    struct rusage usage; if(getrusage(RUSAGE_SELF,&usage)) die("RSS observation");
    unsigned char hash[CC_SHA256_DIGEST_LENGTH]; CC_SHA256_Final(hash,&checksum);
    qsort(times,batches,sizeof(double),by_time);
    printf("{\"mode\":%d,\"workload\":%d,\"records\":%d,\"batches\":%d,\"bytes\":%lld,"
        "\"read_calls\":%ld,\"seconds\":%.9f,\"batch_median_seconds\":%.9f,"
        "\"batch_p95_seconds\":%.9f,\"sampled_footprint_bytes\":%llu,\"lifetime_rss_peak_bytes\":%ld,"
        "\"sampling_interval_ms\":20,\"maximum_owned_buffer_bytes\":%zu,"
        "\"diskio_bytesread\":%llu,\"reformat_bytes\":%lld,\"tensor_sha256\":\"",
        mode,workload,records,batches,(long long)records*RECORD_BYTES,calls,seconds,
        times[batches/2],times[(batches-1)*95/100],(unsigned long long)atomic_load(&sampled_peak),usage.ru_maxrss,max_owned,
        (unsigned long long)(io_after.ri_diskio_bytesread-io_before.ri_diskio_bytesread),
        mode?(long long)records*RECORD_BYTES:0);
    for(int i=0;i<CC_SHA256_DIGEST_LENGTH;i++) printf("%02x",hash[i]); puts("\"}");
    for(int l=0;l<LAYERS;l++) for(int p=0;p<PIECES;p++) close(refs[l][p].fd);
    close(packed); return 0;
}

```

## .build/optimization/expert-layout-verified-v77/expert_layout_probe.py

SHA-256 `a76bcba5750c58d8aad0188569c3c53e9721476009034c802a7f21f9d35d3ec2`; 19199 bytes.

```
#!/usr/bin/env python3
"""Qualified actual-offset expert layout component experiment; no runtime adoption.

Build a bounded four-layer derived artifact, verify it byte for byte against
the original tensor pieces, then atomically publish the complete directory.
Original checkpoint files are always read-only. No global cache purge.
"""
import argparse
import copy
import fcntl
import hashlib
import json
import math
import os
from pathlib import Path
import shutil
import statistics
import struct
import subprocess
import tempfile
import time

from prefill_bench import vm_snapshot, host_conditions, run_child

ROOT = Path(__file__).resolve().parent.parent
LAYERS = [0, 15, 31, 47]
PIECES = [f'{proj}_proj.{part}' for proj in ['gate', 'up', 'down'] for part in ['weight', 'scales', 'biases']]
RECORD_BYTES = 2_764_800


def configure_io(fd, controls, writing=False):
    if controls:
        fcntl.fcntl(fd,controls['no_cache_ext'] if writing else controls['no_cache'],1)
        fcntl.fcntl(fd,controls['read_ahead'],0)


def digest(path, controls=None):
    h = hashlib.sha256()
    with Path(path).open('rb') as f:
        configure_io(f.fileno(), controls)
        for data in iter(lambda: f.read(1024 * 1024), b''): h.update(data)
    return h.hexdigest()


def exact_read(fd, count, offset, read=os.pread):
    if min(count, offset) < 0: raise ValueError('negative read range')
    chunks = []; done = 0
    while done < count:
        try: data = read(fd, count - done, offset + done)
        except InterruptedError: continue
        if not data: raise EOFError('incomplete expert piece')
        if len(data) > count - done: raise ValueError('reader over-reported progress')
        chunks.append(data); done += len(data)
    return b''.join(chunks)


def exact_write(fd, data, write=os.write):
    remaining = memoryview(data)
    while remaining:
        try: count = write(fd, remaining)
        except InterruptedError: continue
        if count <= 0 or count > len(remaining): raise OSError('invalid write progress')
        remaining = remaining[count:]


def source_refs(model):
    headers = {}
    for path in sorted(model.glob('*.safetensors')):
        with path.open('rb') as f:
            length = struct.unpack('<Q', f.read(8))[0]
            if not 0 < length <= 100_000_000: raise ValueError('header length')
            raw = f.read(length)
            if len(raw) != length: raise ValueError('short header')
        for name, value in json.loads(raw).items():
            name = name.removeprefix('language_model.')
            if name in headers: raise ValueError('duplicate tensor')
            if name != '__metadata__': headers[name] = (path, length + 8, value)
    refs = []
    for layer in LAYERS:
        row = []
        for p, piece in enumerate(PIECES):
            path, base, tensor = headers[f'model.layers.{layer}.mlp.switch_mlp.{piece}']
            shape = ([512, 640, 320 if p % 3 == 0 else 40] if p < 6
                     else [512, 2560, 80 if p % 3 == 0 else 10])
            dtype = 'U32' if p % 3 == 0 else 'BF16'
            rb = 819200 if p % 3 == 0 else 51200
            start, end = tensor['data_offsets']
            stat = path.stat()
            if tensor['shape'] != shape or tensor['dtype'] != dtype or not 0 <= start <= end <= stat.st_size-base:
                raise ValueError('tensor shape/dtype/range')
            if end-start != rb*512: raise ValueError('tensor byte count')
            if '\n' in str(path): raise ValueError('newline in model path')
            row.append({'path': str(path.resolve()), 'offset': base+start, 'row_bytes': rb,
                        'source_size': stat.st_size, 'source_mtime_ns': stat.st_mtime_ns,
                        'dtype': dtype, 'shape': shape, 'tensor': f'model.layers.{layer}.mlp.switch_mlp.{piece}'})
        refs.append(row)
    return refs


def verify_sources(refs):
    for row in refs:
        for ref in row:
            st = Path(ref['path']).stat()
            if (st.st_size, st.st_mtime_ns) != (ref['source_size'], ref['source_mtime_ns']):
                raise ValueError('checkpoint changed since artifact construction')


def build_artifact(destination, refs, experts=512, fault=None, controls=None):
    """fault(stage,index) is a bounded interruption/disk-full seam for tests."""
    if destination.exists(): raise FileExistsError(destination)
    verify_sources(refs)
    temp = Path(tempfile.mkdtemp(prefix='.expert-layout-', dir=destination.parent))
    fds = {}; copies = {}; published_refs = copy.deepcopy(refs)
    try:
        for row in refs:
            for ref in row:
                if ref['path'] not in fds:
                    fds[ref['path']] = os.open(ref['path'], os.O_RDONLY)
                    configure_io(fds[ref['path']],controls)
                    if controls:
                        name=f'source-{len(copies):03}.bin'
                        fd=os.open(temp/name,os.O_CREAT|os.O_EXCL|os.O_RDWR,0o600)
                        copies[ref['path']]={'fd':fd,'name':name}
                        configure_io(fd,controls,writing=True)
                        # Preserve the original tensor offsets and file extent;
                        # unselected regions remain holes and are never read.
                        os.ftruncate(fd,ref['source_size'])
        packed = temp/'experts.bin'
        fd = os.open(packed, os.O_CREAT | os.O_EXCL | os.O_WRONLY, 0o600)
        h = hashlib.sha256(); size = 0; count = 0; record_digests = bytearray()
        try:
            configure_io(fd,controls,writing=True)
            for row in refs:
                for e in range(experts):
                    record_hash = hashlib.sha256()
                    for ref in row:
                        data = exact_read(fds[ref['path']], ref['row_bytes'], ref['offset']+e*ref['row_bytes'])
                        if controls:
                            offset=ref['offset']+e*ref['row_bytes']; progress=0
                            def write_copy(unused, part):
                                nonlocal progress
                                wrote=os.pwrite(copies[ref['path']]['fd'],part,offset+progress)
                                progress+=wrote
                                return wrote
                            exact_write(0,data,write_copy)
                        exact_write(fd, data); h.update(data); record_hash.update(data); size += len(data)
                    record_digests.extend(record_hash.digest())
                    if fault: fault('write', count)
                    count += 1
            os.fsync(fd)
        finally: os.close(fd)
        for item in copies.values(): os.fsync(item['fd'])
        # Re-read the finished file and every original piece independently;
        # a digest of bytes sent to write is not proof of bytes stored.
        with packed.open('rb') as check:
            configure_io(check.fileno(),controls)
            for row in refs:
                for e in range(experts):
                    for ref in row:
                        original = exact_read(fds[ref['path']], ref['row_bytes'], ref['offset']+e*ref['row_bytes'])
                        if check.read(len(original)) != original: raise ValueError('derived bytes differ')
                        if controls and exact_read(copies[ref['path']]['fd'],ref['row_bytes'],ref['offset']+e*ref['row_bytes']) != original:
                            raise ValueError('column-copy bytes differ')
            if check.read(1): raise ValueError('derived trailing data')
        if packed.stat().st_size != size or digest(packed,controls) != h.hexdigest(): raise ValueError('stored digest/length')
        verify_sources(refs)
        if controls:
            for row in published_refs:
                for ref in row:
                    item=copies[ref['path']]; stat=os.fstat(item['fd'])
                    ref.update(path=str(destination/item['name']),source_size=stat.st_size,source_mtime_ns=stat.st_mtime_ns)
        with (temp/'record-digests.bin').open('xb') as f:
            f.write(record_digests); f.flush(); os.fsync(f.fileno())
        manifest = {'version': 1, 'layout': 'layer-expert-piece-v1', 'refs': published_refs,
                    'checkpoint_refs':refs,'io_controls':controls,
                    'experts_per_layer': experts, 'bytes': size, 'sha256': h.hexdigest(),
                    'record_digests_sha256':hashlib.sha256(record_digests).hexdigest(),
                    'record_digests_bytes':len(record_digests),
                    'physical_allocated_bytes':sum(p.stat().st_blocks*512 for p in temp.iterdir() if p.is_file())}
        with (temp/'manifest.json').open('x') as f:
            json.dump(manifest, f, indent=2); f.write('\n'); f.flush(); os.fsync(f.fileno())
        if fault: fault('publish', count)
        os.rename(temp, destination)
        directory = os.open(destination.parent, os.O_RDONLY)
        try: os.fsync(directory)
        finally: os.close(directory)
        return manifest
    finally:
        for fd in fds.values(): os.close(fd)
        for item in copies.values(): os.close(item['fd'])
        if temp.exists(): shutil.rmtree(temp)


def validate_artifact(path):
    m = json.loads((path/'manifest.json').read_text())
    if m.get('version') != 1 or m.get('layout') != 'layer-expert-piece-v1': raise ValueError('layout identity')
    size = sum(sum(r['row_bytes'] for r in row) for row in m['refs']) * m['experts_per_layer']
    if m['bytes'] != size or (path/'experts.bin').stat().st_size != size: raise ValueError('layout size')
    if digest(path/'experts.bin',m.get('io_controls')) != m['sha256']: raise ValueError('layout digest')
    if 'record_digests_sha256' in m:
        hashes=path/'record-digests.bin'
        if hashes.stat().st_size != len(m['refs'])*m['experts_per_layer']*32 or digest(hashes)!=m['record_digests_sha256']:
            raise ValueError('record digest identity')
    verify_sources(m['refs'])
    if 'checkpoint_refs' in m: verify_sources(m['checkpoint_refs'])
    return m


def summarize(cells, protocol):
    results = []
    for workload in range(6):
        pairs = []
        for round_id in range(1, protocol['rounds']+1):
            pair = [x for x in cells if x['workload'] == workload and x['round'] == round_id]
            if len(pair) != 2 or any(x['exclusions'] for x in pair): continue
            ref = next(x['result'] for x in pair if x['mode'] == 0)
            cand = next(x['result'] for x in pair if x['mode'] != 0)
            same = all(ref[k] == cand[k] for k in ['records', 'batches', 'bytes', 'tensor_sha256'])
            pairs.append({'round': round_id, 'exact': same, 'reduction': 1-cand['seconds']/ref['seconds'],
                          'reference_seconds': ref['seconds'], 'packed_seconds': cand['seconds']})
        median = statistics.median(x['reduction'] for x in pairs) if pairs else None
        passed = len(pairs) >= protocol['minimum_pairs'] and all(x['exact'] for x in pairs)
        passed = passed and median >= protocol['minimum_median_reduction']
        passed = passed and sum(x['reduction'] > 0 for x in pairs)/len(pairs) >= protocol['minimum_positive_fraction']
        results.append({'workload': workload, 'name': protocol['workloads'][workload], 'pairs': pairs,
                        'median_reduction': median, 'passed': bool(passed)})
    return results


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--model', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    parser.add_argument('--verify-records',action='store_true')
    args = parser.parse_args(); out = args.out.resolve(); out.mkdir(parents=True, exist_ok=False)
    protocol = {'kind': 'actual-offset component qualification; no model speed claim',
        'layers': LAYERS, 'rounds': 7, 'minimum_pairs': 5, 'minimum_median_reduction': .05,
        'minimum_positive_fraction': .8, 'required_reclaimable_gb': 4,
        'maximum_process_bytes': 512_000_000, 'maximum_buffer_bytes': 512_000_000,
        'workloads': ['random pool 1 miss', 'random pool 4 misses', 'random pool 10 misses',
                      'random pool 32 misses', 'dense sweep 32', 'half-density sweep 32'],
        'timing': 'allocation, job scheduling, uncached reads, packed deinterleave, and free; excludes equal full-payload SHA-256 verification',
        'reference': 'actual tensor offsets; pool 32 static lanes; sweep 12 longest-first dynamic lanes',
        'candidate': 'verified packed records; same output columns; per-lane aligned scratch; pool 32 / sweep 12 lanes',
        'minimum_disk_read_fraction': .98,
        'exclusions': 'any global swap change over a cell excludes its whole pair; disk-read bytes below 98% of requested payload; missing/invalid metrics or failed bytes; no replacements',
        'scope': 'four complete selected layers; packed payload 5,662,310,400 bytes plus uncached sparse column copies at original checkpoint offsets (same selected payload); original weights stay read-only; no runtime loading or direct GPU writes'}
    candidate_mode=2 if args.verify_records else 1
    protocol['candidate_mode']=candidate_mode
    protocol['record_verification']='SHA-256 of every packed record is compared with the construction digest inside the timed worker' if args.verify_records else 'artifact verified before/after study; output SHA outside timing'
    for name in ['expert_layout_probe.py','expert_layout_probe.c','prefill_bench.py']:
        shutil.copy2(ROOT/'Tools'/name,out/name)
    protocol['source_hashes'] = {p.name: digest(p) for p in out.iterdir() if p.is_file()}
    (out/'protocol.json').write_text(json.dumps(protocol,indent=2)+'\n')
    manifest = {'protocol': protocol, 'completed': False, 'cells': []}
    with open(f'/tmp/slotstream-model-{os.getuid()}.lock','a') as lock:
        # Acquire and retain the same lock before disk work. This experiment
        # does not instantiate a model and never races a model benchmark.
        fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
        before = vm_snapshot(); manifest['before'] = before
        if before['reclaimable_bytes'] < 4e9: raise RuntimeError('insufficient headroom')
        if shutil.disk_usage(out).free < 16e9: raise RuntimeError('need 16 GB disk headroom')
        try:
            command = ['cc','-O2','-std=c11','-Wno-deprecated-declarations',str(out/'expert_layout_probe.c'),'-o',str(out/'probe')]
            built = subprocess.run(command,capture_output=True,text=True)
            (out/'build.txt').write_text(built.stdout+built.stderr)
            built.check_returncode(); manifest['native_sha256'] = digest(out/'probe')
            manifest['build_command'] = command
            controls=json.loads(subprocess.check_output([str(out/'probe'),'--io-constants'],text=True))
            print('build and byte-verify uncached packed and column artifacts',flush=True)
            checkpoint_refs = source_refs(args.model.resolve())
            manifest['artifact'] = build_artifact(out/'artifact',checkpoint_refs,controls=controls)
            validate_artifact(out/'artifact'); refs=manifest['artifact']['refs']
            config = ['SSLP2',str(out/'artifact/experts.bin'),str(out/'artifact/record-digests.bin')]
            for row in refs:
                for ref in row: config += [ref['path'],f"{ref['offset']} {ref['row_bytes']}"]
            (out/'native-manifest.txt').write_text('\n'.join(config)+'\n')
            for workload in range(6):
                for round_id in range(1,8):
                    for mode in ([0,candidate_mode] if round_id % 2 else [candidate_mode,0]):
                        cell = out/f'w{workload}-r{round_id}-m{mode}'; cell.mkdir()
                        value = {'workload': workload,'round': round_id,'mode': mode,'exclusions':[]}
                        value['before'] = vm_snapshot(); value['conditions_before'] = host_conditions()
                        try:
                            verify_sources(refs)
                            verify_sources(checkpoint_refs)
                            if value['before']['reclaimable_bytes'] < 4e9: raise RuntimeError('insufficient headroom')
                            command=[str(out/'probe'),str(out/'native-manifest.txt'),str(mode),str(workload)]
                            value['command'] = command
                            code = run_child(command,os.environ.copy(),cell,120)
                            value['exit_code']=code
                            if code: raise RuntimeError(f'native exit {code}')
                            result=json.loads((cell/'stdout.txt').read_text()); value['result']=result
                            if type(result['seconds']) not in [int,float] or not math.isfinite(result['seconds']) or result['seconds'] <= 0:
                                raise ValueError('invalid duration')
                            expected_records=1024 if workload==5 else 2048
                            if result['records']!=expected_records or result['bytes']!=expected_records*RECORD_BYTES:
                                raise ValueError('incomplete native work')
                            if max(result['sampled_footprint_bytes'],result['lifetime_rss_peak_bytes']) > protocol['maximum_process_bytes']:
                                value['exclusions'].append('physical footprint over bound')
                            if result['maximum_owned_buffer_bytes'] > protocol['maximum_buffer_bytes']:
                                value['exclusions'].append('owned buffers over bound')
                            if result['diskio_bytesread'] < result['bytes']*protocol['minimum_disk_read_fraction']:
                                value['exclusions'].append('disk reads do not cover requested payload')
                        except Exception as e: value['exclusions'].append(f'{type(e).__name__}: {e}')
                        finally:
                            value['after']=vm_snapshot()
                            if any(value['before'][k] != value['after'][k] for k in ['swapins','swapouts']):
                                value['exclusions'].append('global swap activity')
                            (cell/'result.json').write_text(json.dumps(value,indent=2)+'\n')
                            manifest['cells'].append(value)
                            (out/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
                            print(f"workload {workload} round {round_id} mode {mode}: "
                                  f"{value.get('result',{}).get('seconds')} s; {value['exclusions']}",flush=True)
            manifest['artifact_verified_after']=validate_artifact(out/'artifact') == manifest['artifact']
            manifest['completed']=True
        finally:
            manifest['summary']=summarize(manifest['cells'],protocol)
            manifest['sources_unchanged']=all(digest(ROOT/'Tools'/name)==sha for name,sha in protocol['source_hashes'].items())
            manifest['after']=vm_snapshot()
            (out/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
    print(json.dumps(manifest['summary'],indent=2),flush=True)


if __name__ == '__main__': main()

```

## .build/optimization/expert-layout-verified-v77/prefill_bench.py

SHA-256 `6c21e7449abb1dee24cf8a747a018d270211cd9f20bdb2621595d7e6d35e3398`; 16831 bytes.

```
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


def validate_metrics(d):
    if d.get("schema_version") != 1: raise ValueError("unsupported schema")
    s = d["stats"]
    for k in ("prefillSeconds", "decodeSeconds", "requestSeconds", "imageEncodeSeconds"):
        if not isinstance(s.get(k), (int, float)) or not math.isfinite(s[k]) or s[k] < 0:
            raise ValueError(f"invalid {k}")
    for k in ("prefillRecords", "decodeRecords", "prefillTokens", "decodeTokens", "lifetimeRSSPeakBytes"):
        if type(s.get(k)) is not int or s[k] < 0: raise ValueError(f"invalid {k}")
    if s["prefillTokens"] <= 0 or s["prefillSeconds"] <= 0: raise ValueError("no completed prefill")
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


def run_child(command, env, cell, timeout):
    with (cell/"stdout.txt").open("wb") as out, (cell/"stderr.txt").open("wb") as err:
        child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=out, stderr=err, start_new_session=True)
        try: return child.wait(timeout=timeout)
        finally:
            if child.poll() is None:
                os.killpg(child.pid, signal.SIGTERM)
                try: child.wait(timeout=10)
                except subprocess.TimeoutExpired:
                    os.killpg(child.pid, signal.SIGKILL); child.wait()


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

```

## .build/optimization/expert-layout-verification-faults-v77/protocol.json

SHA-256 `8227ed49d349a50aef1bb0a4f836af7cb069802daec36c718d48c072eb7a7057`; 258 bytes.

```
{
  "kind": "correctness only",
  "cases": [
    "corrupt record digest",
    "truncated digest table"
  ],
  "binary_sha256": "83cb6b3e1172621e79cffee0b0fb1f83d6a9191ff96260847905aeaf55f80227",
  "original_unchanged": true,
  "required_reclaimable_gb": 4
}

```

## .build/optimization/expert-layout-verification-faults-v77/manifest.json

SHA-256 `726e55cdbf910a829a987ba5969be4c6be994aa80e6b9f389ee8504c669a9495`; 5241 bytes.

```
{
  "protocol": {
    "kind": "correctness only",
    "cases": [
      "corrupt record digest",
      "truncated digest table"
    ],
    "binary_sha256": "83cb6b3e1172621e79cffee0b0fb1f83d6a9191ff96260847905aeaf55f80227",
    "original_unchanged": true,
    "required_reclaimable_gb": 4
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 27808907264,
    "swapins": 41717732,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    30880.\nPages active:                                1071264.\nPages inactive:                               976292.\nPages speculative:                            322919.\nPages throttled:                                   0.\nPages wired down:                             206732.\nPages purgeable:                               15845.\n\"Translation faults\":                    14028525553.\nPages copy-on-write:                       640411774.\nPages zero filled:                       15963139462.\nPages reactivated:                        2447113669.\nPages purged:                               63070908.\nFile-backed pages:                           1650596.\nAnonymous pages:                              719879.\nPages stored in compressor:                  1442157.\nPages occupied by compressor:                 477344.\nDecompressions:                            983276155.\nCompressions:                             1278414336.\nPageins:                                  6064139131.\nPageouts:                                   10665738.\nSwapins:                                    41717732.\nSwapouts:                                   69922789.\nPages tagged:                                 171428.\nPages tagged resident:                        127723.\nPages tagged compressed:                       43705.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          242.\nPages tag-storage non-tag pageable:            91214.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6939968.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889460.\n"
  },
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 27804975104,
    "swapins": 41717732,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    30607.\nPages active:                                1071264.\nPages inactive:                               976298.\nPages speculative:                            322946.\nPages throttled:                                   0.\nPages wired down:                             206732.\nPages purgeable:                               15845.\n\"Translation faults\":                    14028530809.\nPages copy-on-write:                       640412472.\nPages zero filled:                       15963140736.\nPages reactivated:                        2447113669.\nPages purged:                               63070908.\nFile-backed pages:                           1650629.\nAnonymous pages:                              719879.\nPages stored in compressor:                  1442157.\nPages occupied by compressor:                 477344.\nDecompressions:                            983276155.\nCompressions:                             1278414336.\nPageins:                                  6064139151.\nPageouts:                                   10665738.\nSwapins:                                    41717732.\nSwapouts:                                   69922789.\nPages tagged:                                 171428.\nPages tagged resident:                        127723.\nPages tagged compressed:                       43705.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6840.\nPages tag-storage free:                          242.\nPages tag-storage non-tag pageable:            91214.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6939968.\nTagged compressions:                         9650726.\nTagged decompressions:                       8889460.\n"
  },
  "results": [
    {
      "case": "corrupt",
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verification-faults-v77/corrupt.txt",
        "2",
        "1"
      ],
      "exit_code": 2,
      "stdout": "",
      "stderr": "batch read: Bad message\n",
      "passed": true
    },
    {
      "case": "truncated",
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verified-v77/probe",
        "/Users/carlos/Projects/slotstream/.build/optimization/expert-layout-verification-faults-v77/truncated.txt",
        "2",
        "1"
      ],
      "exit_code": 2,
      "stdout": "",
      "stderr": "record digests length: Invalid argument\n",
      "passed": true
    }
  ],
  "tests_exit": 0,
  "passed": true
}

```

## .build/optimization/expert-layout-verification-faults-v77/python-tests.txt

SHA-256 `c57bdec5f19166a93690118c71d5c3ee68b3bfc2827da2e950a0cdc421d4bd4f`; 104 bytes.

```
......
----------------------------------------------------------------------
Ran 6 tests in 0.024s

OK

```

## .build/optimization/expert-layout-verification-faults-v77/expert_layout_probe_test.py

SHA-256 `e6e9363cc3afc9081cb9f00ff7adc6fc77fc1c1a12b9580b32f0cd27c1b32f9d`; 5923 bytes.

```
#!/usr/bin/env python3
import errno
import json
import os
import sys
from pathlib import Path
from tempfile import TemporaryDirectory
import unittest
from expert_layout_probe import build_artifact, validate_artifact, exact_read, exact_write, summarize


class LayoutTests(unittest.TestCase):
    def refs(self, root):
        source=root/'source.bin'; source.write_bytes(bytes(range(192)))
        stat=source.stat()
        return [[{'path':str(source),'offset':p*64,'row_bytes':8,
                  'source_size':stat.st_size,'source_mtime_ns':stat.st_mtime_ns} for p in range(3)]]

    def test_actual_interleave_and_payload_validation(self):
        with TemporaryDirectory() as name:
            root=Path(name); refs=self.refs(root); dst=root/'artifact'
            build_artifact(dst,refs,experts=8)
            self.assertEqual(validate_artifact(dst)['bytes'],192)
            expected=b''.join(bytes(range(p*64+e*8,p*64+(e+1)*8)) for e in range(8) for p in range(3))
            self.assertEqual((dst/'experts.bin').read_bytes(),expected)
            (dst/'experts.bin').write_bytes(bytes([255])+expected[1:])
            with self.assertRaisesRegex(ValueError,'digest'): validate_artifact(dst)

    @unittest.skipUnless(sys.platform=='darwin','Darwin uncached derived copies')
    def test_uncached_sparse_copies_keep_offsets_and_source_identity(self):
        controls={'no_cache':48,'no_cache_ext':112,'read_ahead':45}
        with TemporaryDirectory() as name:
            root=Path(name); refs=self.refs(root); dst=root/'artifact'
            m=build_artifact(dst,refs,experts=8,controls=controls)
            self.assertEqual(validate_artifact(dst),m)
            self.assertEqual(m['checkpoint_refs'],refs)
            self.assertEqual((dst/'source-000.bin').read_bytes(),(root/'source.bin').read_bytes())
            self.assertEqual([r['offset'] for r in m['refs'][0]],[0,64,128])
            self.assertTrue(all(r['path']==str(dst/'source-000.bin') for r in m['refs'][0]))
        for stage in ['write','publish']:
            with TemporaryDirectory() as name:
                root=Path(name); refs=self.refs(root)
                def fail(where,index):
                    if where==stage: raise OSError(errno.ENOSPC,'bounded fault')
                with self.assertRaises(OSError):
                    build_artifact(root/'artifact',refs,experts=8,controls=controls,fault=fail)
                self.assertEqual([p.name for p in root.iterdir()],['source.bin'])

    def test_interrupted_disk_full_and_publish_leave_original_usable(self):
        for stage in ['write','publish']:
            for error in [OSError(errno.ENOSPC,'injected disk full'),KeyboardInterrupt()]:
                with TemporaryDirectory() as name:
                    root=Path(name); refs=self.refs(root); original=(root/'source.bin').read_bytes()
                    def fail(where,index):
                        if where==stage: raise error
                    with self.assertRaises(type(error)): build_artifact(root/'artifact',refs,experts=8,fault=fail)
                    self.assertFalse((root/'artifact').exists())
                    self.assertEqual(sorted(x.name for x in root.iterdir()),['source.bin'])
                    self.assertEqual((root/'source.bin').read_bytes(),original)
                    build_artifact(root/'retry',refs,experts=8)
                    validate_artifact(root/'retry')

    def test_reject_identity_length_and_changed_source(self):
        for kind in ['version','layout','truncated','source','digest_table']:
            with TemporaryDirectory() as name:
                root=Path(name); refs=self.refs(root); dst=root/'artifact'; build_artifact(dst,refs,experts=8)
                m=json.loads((dst/'manifest.json').read_text())
                if kind in ['version','layout']:
                    m[kind]='unknown'; (dst/'manifest.json').write_text(json.dumps(m))
                elif kind=='truncated': (dst/'experts.bin').write_bytes(b'bad')
                elif kind=='digest_table': (dst/'record-digests.bin').write_bytes(bytes(8*32))
                else: (root/'source.bin').write_bytes(b'changed')
                with self.assertRaises(ValueError): validate_artifact(dst)

    def test_exact_partial_interrupted_and_failed_io(self):
        calls=[]
        def read(fd,n,offset):
            calls.append(offset)
            if len(calls)==1: raise InterruptedError()
            return b'abcdef'[offset:offset+min(n,2)]
        self.assertEqual(exact_read(0,6,0,read),b'abcdef')
        self.assertEqual(calls,[0,0,2,4])
        with self.assertRaises(EOFError): exact_read(0,1,0,lambda *a:b'')
        with self.assertRaises(ValueError): exact_read(0,1,0,lambda *a:b'XX')
        output=bytearray(); steps=[]
        def write(fd,data):
            steps.append(1)
            if len(steps)==1: raise InterruptedError()
            output.extend(data[:2]); return min(len(data),2)
        exact_write(0,b'abcde',write); self.assertEqual(output,b'abcde')
        for count in [0,-1,7]:
            with self.assertRaises(OSError): exact_write(0,b'abc',lambda *a:count)

    def test_whole_pair_exclusions_and_exact_work_required(self):
        protocol={'rounds':2,'minimum_pairs':1,'minimum_median_reduction':.05,
                  'minimum_positive_fraction':.8,'workloads':['x']*6}
        def cell(mode,round_id=1):
            return {'workload':0,'round':round_id,'mode':mode,'exclusions':[],
                    'result':{'seconds':1 if mode==0 else .8,'records':32,'batches':1,'bytes':100,'tensor_sha256':'exact'}}
        self.assertTrue(summarize([cell(0),cell(1)],protocol)[0]['passed'])
        a=cell(0); a['exclusions']=['swap']; self.assertFalse(summarize([a,cell(1)],protocol)[0]['passed'])
        b=cell(1); b['result']['tensor_sha256']='wrong'; self.assertFalse(summarize([cell(0),b],protocol)[0]['passed'])


if __name__=='__main__': unittest.main()

```

## .build/optimization/expert-layout-verified-v77/w0-r1-m0/stdout.txt

SHA-256 `8e2722c0f5a58cdaf92bec8b4dbc9a707de3e03cd8a8ea09a22fa6e2f23b4e30`; 444 bytes.

```
{"mode":0,"workload":0,"records":2048,"batches":2048,"bytes":5662310400,"read_calls":18432,"seconds":1.180889998,"batch_median_seconds":0.000531000,"batch_p95_seconds":0.000613000,"sampled_footprint_bytes":5046680,"lifetime_rss_peak_bytes":5423104,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":2764800,"diskio_bytesread":5964300288,"reformat_bytes":0,"tensor_sha256":"d4a24e9ae9c1211d735c3df9101b17241b78c1809d00c5d692736ca7793c29ac"}

```

## .build/optimization/expert-layout-verified-v77/w0-r1-m2/stdout.txt

SHA-256 `de5a6a0f19709b490f794089805f7af0975a28e50142e0e8fa8115701aecb5ac`; 452 bytes.

```
{"mode":2,"workload":0,"records":2048,"batches":2048,"bytes":5662310400,"read_calls":2048,"seconds":2.494315997,"batch_median_seconds":0.001212000,"batch_p95_seconds":0.001258000,"sampled_footprint_bytes":7061888,"lifetime_rss_peak_bytes":7454720,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":5529600,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"d4a24e9ae9c1211d735c3df9101b17241b78c1809d00c5d692736ca7793c29ac"}

```

## .build/optimization/expert-layout-verified-v77/w0-r2-m0/stdout.txt

SHA-256 `f674529b569c2d33184f6b1cac0d3d9aecd1f4da37b7601193c818d1d463e85f`; 444 bytes.

```
{"mode":0,"workload":0,"records":2048,"batches":2048,"bytes":5662310400,"read_calls":18432,"seconds":1.099333001,"batch_median_seconds":0.000531000,"batch_p95_seconds":0.000609000,"sampled_footprint_bytes":5063088,"lifetime_rss_peak_bytes":5423104,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":2764800,"diskio_bytesread":5964300288,"reformat_bytes":0,"tensor_sha256":"d4a24e9ae9c1211d735c3df9101b17241b78c1809d00c5d692736ca7793c29ac"}

```

## .build/optimization/expert-layout-verified-v77/w0-r2-m2/stdout.txt

SHA-256 `42b4eb56e853f550124c6cbbaa92ace655101e4362baba7660da78d8588b1193`; 452 bytes.

```
{"mode":2,"workload":0,"records":2048,"batches":2048,"bytes":5662310400,"read_calls":2048,"seconds":2.496386007,"batch_median_seconds":0.001212000,"batch_p95_seconds":0.001259000,"sampled_footprint_bytes":7061888,"lifetime_rss_peak_bytes":7454720,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":5529600,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"d4a24e9ae9c1211d735c3df9101b17241b78c1809d00c5d692736ca7793c29ac"}

```

## .build/optimization/expert-layout-verified-v77/w0-r3-m0/stdout.txt

SHA-256 `88ed240cb8f9b171e5eb728cdbb67f47b9de7aeb5ce8042b2d01482b4f8753cd`; 444 bytes.

```
{"mode":0,"workload":0,"records":2048,"batches":2048,"bytes":5662310400,"read_calls":18432,"seconds":1.094484996,"batch_median_seconds":0.000529000,"batch_p95_seconds":0.000612000,"sampled_footprint_bytes":5030296,"lifetime_rss_peak_bytes":5439488,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":2764800,"diskio_bytesread":5964300288,"reformat_bytes":0,"tensor_sha256":"d4a24e9ae9c1211d735c3df9101b17241b78c1809d00c5d692736ca7793c29ac"}

```

## .build/optimization/expert-layout-verified-v77/w0-r3-m2/stdout.txt

SHA-256 `10b6324b360db1f082bcc396a895d957d3208b47c4ef905c2ebc7515fdf65c09`; 452 bytes.

```
{"mode":2,"workload":0,"records":2048,"batches":2048,"bytes":5662310400,"read_calls":2048,"seconds":2.497725008,"batch_median_seconds":0.001213000,"batch_p95_seconds":0.001261000,"sampled_footprint_bytes":7061888,"lifetime_rss_peak_bytes":7454720,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":5529600,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"d4a24e9ae9c1211d735c3df9101b17241b78c1809d00c5d692736ca7793c29ac"}

```

## .build/optimization/expert-layout-verified-v77/w0-r4-m0/stdout.txt

SHA-256 `92c7cd3c87df0ca040a53abe901a922f49276576575a8bca981b6b7716d09aa0`; 444 bytes.

```
{"mode":0,"workload":0,"records":2048,"batches":2048,"bytes":5662310400,"read_calls":18432,"seconds":1.092796996,"batch_median_seconds":0.000529000,"batch_p95_seconds":0.000609000,"sampled_footprint_bytes":5030296,"lifetime_rss_peak_bytes":5423104,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":2764800,"diskio_bytesread":5964300288,"reformat_bytes":0,"tensor_sha256":"d4a24e9ae9c1211d735c3df9101b17241b78c1809d00c5d692736ca7793c29ac"}

```

## .build/optimization/expert-layout-verified-v77/w0-r4-m2/stdout.txt

SHA-256 `c4692368220c022d2b3f4f4e7850d2cba9ef554cdceb9af325297fed370f733e`; 452 bytes.

```
{"mode":2,"workload":0,"records":2048,"batches":2048,"bytes":5662310400,"read_calls":2048,"seconds":2.495142999,"batch_median_seconds":0.001212000,"batch_p95_seconds":0.001260000,"sampled_footprint_bytes":7061888,"lifetime_rss_peak_bytes":7454720,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":5529600,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"d4a24e9ae9c1211d735c3df9101b17241b78c1809d00c5d692736ca7793c29ac"}

```

## .build/optimization/expert-layout-verified-v77/w0-r5-m0/stdout.txt

SHA-256 `75cfe9f3469c87bd73299f4b060ec9ed41c4bb134e455f10435a5badde59e48f`; 444 bytes.

```
{"mode":0,"workload":0,"records":2048,"batches":2048,"bytes":5662310400,"read_calls":18432,"seconds":1.095891006,"batch_median_seconds":0.000530000,"batch_p95_seconds":0.000608000,"sampled_footprint_bytes":4997552,"lifetime_rss_peak_bytes":5439488,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":2764800,"diskio_bytesread":5964300288,"reformat_bytes":0,"tensor_sha256":"d4a24e9ae9c1211d735c3df9101b17241b78c1809d00c5d692736ca7793c29ac"}

```

## .build/optimization/expert-layout-verified-v77/w0-r5-m2/stdout.txt

SHA-256 `5294136308867e14648b0d7bb5a7ec962753fcf900737a95a10ecf99e4326f22`; 452 bytes.

```
{"mode":2,"workload":0,"records":2048,"batches":2048,"bytes":5662310400,"read_calls":2048,"seconds":2.498181989,"batch_median_seconds":0.001213000,"batch_p95_seconds":0.001266000,"sampled_footprint_bytes":7045504,"lifetime_rss_peak_bytes":7438336,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":5529600,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"d4a24e9ae9c1211d735c3df9101b17241b78c1809d00c5d692736ca7793c29ac"}

```

## .build/optimization/expert-layout-verified-v77/w0-r6-m0/stdout.txt

SHA-256 `4defbafb7fd89b691f0876d21679521e0521dcb8793327bd272c0c5d31bc5046`; 444 bytes.

```
{"mode":0,"workload":0,"records":2048,"batches":2048,"bytes":5662310400,"read_calls":18432,"seconds":1.095615000,"batch_median_seconds":0.000530000,"batch_p95_seconds":0.000608000,"sampled_footprint_bytes":5030320,"lifetime_rss_peak_bytes":5423104,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":2764800,"diskio_bytesread":5964300288,"reformat_bytes":0,"tensor_sha256":"d4a24e9ae9c1211d735c3df9101b17241b78c1809d00c5d692736ca7793c29ac"}

```

## .build/optimization/expert-layout-verified-v77/w0-r6-m2/stdout.txt

SHA-256 `6c98ddb5a3bb22dbbf2827e4bbb3217e155a081027764d433f3150d9e521cb03`; 452 bytes.

```
{"mode":2,"workload":0,"records":2048,"batches":2048,"bytes":5662310400,"read_calls":2048,"seconds":2.503425003,"batch_median_seconds":0.001214000,"batch_p95_seconds":0.001269000,"sampled_footprint_bytes":7061888,"lifetime_rss_peak_bytes":7454720,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":5529600,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"d4a24e9ae9c1211d735c3df9101b17241b78c1809d00c5d692736ca7793c29ac"}

```

## .build/optimization/expert-layout-verified-v77/w0-r7-m0/stdout.txt

SHA-256 `ff17bdd67185986e4267c62c64e06a9a661247b0cfc5e5b9e2582749aaed4ac1`; 444 bytes.

```
{"mode":0,"workload":0,"records":2048,"batches":2048,"bytes":5662310400,"read_calls":18432,"seconds":1.101639999,"batch_median_seconds":0.000534000,"batch_p95_seconds":0.000610000,"sampled_footprint_bytes":5013936,"lifetime_rss_peak_bytes":5455872,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":2764800,"diskio_bytesread":5964300288,"reformat_bytes":0,"tensor_sha256":"d4a24e9ae9c1211d735c3df9101b17241b78c1809d00c5d692736ca7793c29ac"}

```

## .build/optimization/expert-layout-verified-v77/w0-r7-m2/stdout.txt

SHA-256 `d7e331885657e09308314925e257745bd6681bc1682c15a3141db8599b407d6a`; 452 bytes.

```
{"mode":2,"workload":0,"records":2048,"batches":2048,"bytes":5662310400,"read_calls":2048,"seconds":2.496347004,"batch_median_seconds":0.001212000,"batch_p95_seconds":0.001262000,"sampled_footprint_bytes":7045504,"lifetime_rss_peak_bytes":7438336,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":5529600,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"d4a24e9ae9c1211d735c3df9101b17241b78c1809d00c5d692736ca7793c29ac"}

```

## .build/optimization/expert-layout-verified-v77/w1-r1-m0/stdout.txt

SHA-256 `5eb43bb6f10fe8c13546db10e1858433b2deaf88f35d1c01cb362e501c40291b`; 446 bytes.

```
{"mode":0,"workload":1,"records":2048,"batches":512,"bytes":5662310400,"read_calls":18432,"seconds":0.665413999,"batch_median_seconds":0.001286000,"batch_p95_seconds":0.001424000,"sampled_footprint_bytes":13500848,"lifetime_rss_peak_bytes":13860864,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":11059200,"diskio_bytesread":5964300288,"reformat_bytes":0,"tensor_sha256":"25ebd25ee0cf34270baca4336cd648a771d88fd8220bedce3a71397fb629b680"}

```

## .build/optimization/expert-layout-verified-v77/w1-r1-m2/stdout.txt

SHA-256 `65ff2f7ccc6caa70147f547bf64b35f33d9402a75341ade26a66ded379f65bfb`; 454 bytes.

```
{"mode":2,"workload":1,"records":2048,"batches":512,"bytes":5662310400,"read_calls":2048,"seconds":0.985428996,"batch_median_seconds":0.001919000,"batch_p95_seconds":0.001987000,"sampled_footprint_bytes":24002992,"lifetime_rss_peak_bytes":24363008,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":22118400,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"25ebd25ee0cf34270baca4336cd648a771d88fd8220bedce3a71397fb629b680"}

```

## .build/optimization/expert-layout-verified-v77/w1-r2-m0/stdout.txt

SHA-256 `fa9bf3eb6af2ff9df931ea01a4343b8d26ecefcf6c261d7fa0d2afb90d4c3ed9`; 446 bytes.

```
{"mode":0,"workload":1,"records":2048,"batches":512,"bytes":5662310400,"read_calls":18432,"seconds":0.667147001,"batch_median_seconds":0.001293000,"batch_p95_seconds":0.001423000,"sampled_footprint_bytes":13500824,"lifetime_rss_peak_bytes":13877248,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":11059200,"diskio_bytesread":5964300288,"reformat_bytes":0,"tensor_sha256":"25ebd25ee0cf34270baca4336cd648a771d88fd8220bedce3a71397fb629b680"}

```

## .build/optimization/expert-layout-verified-v77/w1-r2-m2/stdout.txt

SHA-256 `31da752f0330c2b5dd525e8fc12cef6f0018af9b3f3e0c263bad62bd2fc0a335`; 454 bytes.

```
{"mode":2,"workload":1,"records":2048,"batches":512,"bytes":5662310400,"read_calls":2048,"seconds":0.985270000,"batch_median_seconds":0.001918000,"batch_p95_seconds":0.001985000,"sampled_footprint_bytes":23986584,"lifetime_rss_peak_bytes":24363008,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":22118400,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"25ebd25ee0cf34270baca4336cd648a771d88fd8220bedce3a71397fb629b680"}

```

## .build/optimization/expert-layout-verified-v77/w1-r3-m0/stdout.txt

SHA-256 `2bae122ef0ab3e1e605aa7ab1687725fe2fc4391fc3dd52a81f9240292dee759`; 446 bytes.

```
{"mode":0,"workload":1,"records":2048,"batches":512,"bytes":5662310400,"read_calls":18432,"seconds":0.664712002,"batch_median_seconds":0.001289000,"batch_p95_seconds":0.001425000,"sampled_footprint_bytes":13468080,"lifetime_rss_peak_bytes":13828096,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":11059200,"diskio_bytesread":5964300288,"reformat_bytes":0,"tensor_sha256":"25ebd25ee0cf34270baca4336cd648a771d88fd8220bedce3a71397fb629b680"}

```

## .build/optimization/expert-layout-verified-v77/w1-r3-m2/stdout.txt

SHA-256 `4e0e23b8f38bd3851506c35c20d2c86fc2ee035ff0ffb3c9972a6a5289efc7cf`; 454 bytes.

```
{"mode":2,"workload":1,"records":2048,"batches":512,"bytes":5662310400,"read_calls":2048,"seconds":0.986044999,"batch_median_seconds":0.001917000,"batch_p95_seconds":0.001992000,"sampled_footprint_bytes":24002992,"lifetime_rss_peak_bytes":24363008,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":22118400,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"25ebd25ee0cf34270baca4336cd648a771d88fd8220bedce3a71397fb629b680"}

```

## .build/optimization/expert-layout-verified-v77/w1-r4-m0/stdout.txt

SHA-256 `46cb9d1c7cd704487f62cd2e159c4a745710e6dcd0e229d29ce8b24e9aed4329`; 446 bytes.

```
{"mode":0,"workload":1,"records":2048,"batches":512,"bytes":5662310400,"read_calls":18432,"seconds":0.667448000,"batch_median_seconds":0.001291000,"batch_p95_seconds":0.001439000,"sampled_footprint_bytes":13500872,"lifetime_rss_peak_bytes":13844480,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":11059200,"diskio_bytesread":5964300288,"reformat_bytes":0,"tensor_sha256":"25ebd25ee0cf34270baca4336cd648a771d88fd8220bedce3a71397fb629b680"}

```

## .build/optimization/expert-layout-verified-v77/w1-r4-m2/stdout.txt

SHA-256 `394baf9ec00721765b183bd6049a85d740d3f8453340ac8d4fa9d65c8f8c03ad`; 454 bytes.

```
{"mode":2,"workload":1,"records":2048,"batches":512,"bytes":5662310400,"read_calls":2048,"seconds":0.985324998,"batch_median_seconds":0.001918000,"batch_p95_seconds":0.001988000,"sampled_footprint_bytes":23986608,"lifetime_rss_peak_bytes":24346624,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":22118400,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"25ebd25ee0cf34270baca4336cd648a771d88fd8220bedce3a71397fb629b680"}

```

## .build/optimization/expert-layout-verified-v77/w1-r5-m0/stdout.txt

SHA-256 `912269b3f92b68e9a1da8490be47d3ec62c6730ecb1c367e3193fbfaf1247d32`; 446 bytes.

```
{"mode":0,"workload":1,"records":2048,"batches":512,"bytes":5662310400,"read_calls":18432,"seconds":0.667503000,"batch_median_seconds":0.001291000,"batch_p95_seconds":0.001429000,"sampled_footprint_bytes":13500848,"lifetime_rss_peak_bytes":13860864,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":11059200,"diskio_bytesread":5964300288,"reformat_bytes":0,"tensor_sha256":"25ebd25ee0cf34270baca4336cd648a771d88fd8220bedce3a71397fb629b680"}

```

## .build/optimization/expert-layout-verified-v77/w1-r5-m2/stdout.txt

SHA-256 `c55327a706c10c995d5ce99f07b87b1da6834fadd7ee03b576770bf22684c3c1`; 454 bytes.

```
{"mode":2,"workload":1,"records":2048,"batches":512,"bytes":5662310400,"read_calls":2048,"seconds":0.985646999,"batch_median_seconds":0.001919000,"batch_p95_seconds":0.001988000,"sampled_footprint_bytes":23986584,"lifetime_rss_peak_bytes":24363008,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":22118400,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"25ebd25ee0cf34270baca4336cd648a771d88fd8220bedce3a71397fb629b680"}

```

## .build/optimization/expert-layout-verified-v77/w1-r6-m0/stdout.txt

SHA-256 `cf68c5ef371c503d0df0bc5d622b5fbbe28837605df89eaa798387b3be13c2c5`; 446 bytes.

```
{"mode":0,"workload":1,"records":2048,"batches":512,"bytes":5662310400,"read_calls":18432,"seconds":0.667255998,"batch_median_seconds":0.001289000,"batch_p95_seconds":0.001434000,"sampled_footprint_bytes":14877152,"lifetime_rss_peak_bytes":15204352,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":11059200,"diskio_bytesread":5964300288,"reformat_bytes":0,"tensor_sha256":"25ebd25ee0cf34270baca4336cd648a771d88fd8220bedce3a71397fb629b680"}

```

## .build/optimization/expert-layout-verified-v77/w1-r6-m2/stdout.txt

SHA-256 `7500901299272f22d126f0503c5e8c458f48aefcbea7347a0028514678273849`; 454 bytes.

```
{"mode":2,"workload":1,"records":2048,"batches":512,"bytes":5662310400,"read_calls":2048,"seconds":0.984768999,"batch_median_seconds":0.001916000,"batch_p95_seconds":0.001991000,"sampled_footprint_bytes":24002992,"lifetime_rss_peak_bytes":24363008,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":22118400,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"25ebd25ee0cf34270baca4336cd648a771d88fd8220bedce3a71397fb629b680"}

```

## .build/optimization/expert-layout-verified-v77/w1-r7-m0/stdout.txt

SHA-256 `3a9df6d07dfe67b2840ffc8c9e8730e203c775f51bb6c2f6c918850de522ec06`; 446 bytes.

```
{"mode":0,"workload":1,"records":2048,"batches":512,"bytes":5662310400,"read_calls":18432,"seconds":0.665730997,"batch_median_seconds":0.001292000,"batch_p95_seconds":0.001427000,"sampled_footprint_bytes":13484464,"lifetime_rss_peak_bytes":13844480,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":11059200,"diskio_bytesread":5964300288,"reformat_bytes":0,"tensor_sha256":"25ebd25ee0cf34270baca4336cd648a771d88fd8220bedce3a71397fb629b680"}

```

## .build/optimization/expert-layout-verified-v77/w1-r7-m2/stdout.txt

SHA-256 `a1dd52bc9495e3851b43e4dff3d5d72fd4a724e6146d764281bee0baccbe7030`; 454 bytes.

```
{"mode":2,"workload":1,"records":2048,"batches":512,"bytes":5662310400,"read_calls":2048,"seconds":0.984768002,"batch_median_seconds":0.001916000,"batch_p95_seconds":0.001993000,"sampled_footprint_bytes":23986584,"lifetime_rss_peak_bytes":24363008,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":22118400,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"25ebd25ee0cf34270baca4336cd648a771d88fd8220bedce3a71397fb629b680"}

```

## .build/optimization/expert-layout-verified-v77/w2-r1-m0/stdout.txt

SHA-256 `6a5356aafdf1e9630fc4cfab3764fdf4e6f2e684c754ddc4f58285a4d8f91f26`; 446 bytes.

```
{"mode":0,"workload":2,"records":2048,"batches":208,"bytes":5662310400,"read_calls":18432,"seconds":0.550347003,"batch_median_seconds":0.002668000,"batch_p95_seconds":0.002849000,"sampled_footprint_bytes":32260552,"lifetime_rss_peak_bytes":32604160,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":27648000,"diskio_bytesread":5964300288,"reformat_bytes":0,"tensor_sha256":"2de130e51531ec50c3663d361c9666706ec3bc3577986cad830fd51c8c62aff7"}

```

## .build/optimization/expert-layout-verified-v77/w2-r1-m2/stdout.txt

SHA-256 `e8c3910363b791fd4125721ccddc38b878e6de5b4fa96aece062bc65af36588b`; 454 bytes.

```
{"mode":2,"workload":2,"records":2048,"batches":208,"bytes":5662310400,"read_calls":2048,"seconds":0.669734999,"batch_median_seconds":0.003236000,"batch_p95_seconds":0.003371000,"sampled_footprint_bytes":59916768,"lifetime_rss_peak_bytes":60243968,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":55296000,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"2de130e51531ec50c3663d361c9666706ec3bc3577986cad830fd51c8c62aff7"}

```

## .build/optimization/expert-layout-verified-v77/w2-r2-m0/stdout.txt

SHA-256 `1baab6d20336bbb2ff185c02ebe6da023c61724df45ee29b486836f13f6fa3e7`; 446 bytes.

```
{"mode":0,"workload":2,"records":2048,"batches":208,"bytes":5662310400,"read_calls":18432,"seconds":0.551944999,"batch_median_seconds":0.002679000,"batch_p95_seconds":0.002854000,"sampled_footprint_bytes":32244144,"lifetime_rss_peak_bytes":32604160,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":27648000,"diskio_bytesread":5964300288,"reformat_bytes":0,"tensor_sha256":"2de130e51531ec50c3663d361c9666706ec3bc3577986cad830fd51c8c62aff7"}

```

## .build/optimization/expert-layout-verified-v77/w2-r2-m2/stdout.txt

SHA-256 `07d047ff10c679dcaed9ea0e5071e3a226e852156b67f6ce05c3851b6f269b0a`; 454 bytes.

```
{"mode":2,"workload":2,"records":2048,"batches":208,"bytes":5662310400,"read_calls":2048,"seconds":0.669710998,"batch_median_seconds":0.003236000,"batch_p95_seconds":0.003383000,"sampled_footprint_bytes":59933152,"lifetime_rss_peak_bytes":60260352,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":55296000,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"2de130e51531ec50c3663d361c9666706ec3bc3577986cad830fd51c8c62aff7"}

```

## .build/optimization/expert-layout-verified-v77/w2-r3-m0/stdout.txt

SHA-256 `89f4fd1db105cbfaaaf2f40c2385dcfe6141f83c136b441567b820b1c2c306de`; 446 bytes.

```
{"mode":0,"workload":2,"records":2048,"batches":208,"bytes":5662310400,"read_calls":18432,"seconds":0.549906998,"batch_median_seconds":0.002668000,"batch_p95_seconds":0.002839000,"sampled_footprint_bytes":32227736,"lifetime_rss_peak_bytes":32604160,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":27648000,"diskio_bytesread":5964300288,"reformat_bytes":0,"tensor_sha256":"2de130e51531ec50c3663d361c9666706ec3bc3577986cad830fd51c8c62aff7"}

```

## .build/optimization/expert-layout-verified-v77/w2-r3-m2/stdout.txt

SHA-256 `8043901427a4602081684655b3b0579ab57d00156f0a90b4310daa400788d207`; 454 bytes.

```
{"mode":2,"workload":2,"records":2048,"batches":208,"bytes":5662310400,"read_calls":2048,"seconds":0.671390999,"batch_median_seconds":0.003247000,"batch_p95_seconds":0.003378000,"sampled_footprint_bytes":59916768,"lifetime_rss_peak_bytes":60243968,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":55296000,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"2de130e51531ec50c3663d361c9666706ec3bc3577986cad830fd51c8c62aff7"}

```

## .build/optimization/expert-layout-verified-v77/w2-r4-m0/stdout.txt

SHA-256 `07eb72029af9f91bffab3c5cfbb6bb41e1c74f14bb2a20376955539f173712df`; 446 bytes.

```
{"mode":0,"workload":2,"records":2048,"batches":208,"bytes":5662310400,"read_calls":18432,"seconds":0.550460002,"batch_median_seconds":0.002674000,"batch_p95_seconds":0.002836000,"sampled_footprint_bytes":32260552,"lifetime_rss_peak_bytes":32604160,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":27648000,"diskio_bytesread":5964300288,"reformat_bytes":0,"tensor_sha256":"2de130e51531ec50c3663d361c9666706ec3bc3577986cad830fd51c8c62aff7"}

```

## .build/optimization/expert-layout-verified-v77/w2-r4-m2/stdout.txt

SHA-256 `c79af4aa4888ac6d65ac28d9528f2a8d466b6ebe09f106ca8f035d6fe8a25ceb`; 454 bytes.

```
{"mode":2,"workload":2,"records":2048,"batches":208,"bytes":5662310400,"read_calls":2048,"seconds":0.671605001,"batch_median_seconds":0.003246000,"batch_p95_seconds":0.003399000,"sampled_footprint_bytes":59933152,"lifetime_rss_peak_bytes":60260352,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":55296000,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"2de130e51531ec50c3663d361c9666706ec3bc3577986cad830fd51c8c62aff7"}

```

## .build/optimization/expert-layout-verified-v77/w2-r5-m0/stdout.txt

SHA-256 `7b99add3f65838255a0b12e3cc2966a904dfd3beb4373760d646f518e6d31c87`; 446 bytes.

```
{"mode":0,"workload":2,"records":2048,"batches":208,"bytes":5662310400,"read_calls":18432,"seconds":0.551915999,"batch_median_seconds":0.002684000,"batch_p95_seconds":0.002846000,"sampled_footprint_bytes":32260528,"lifetime_rss_peak_bytes":32620544,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":27648000,"diskio_bytesread":5964300288,"reformat_bytes":0,"tensor_sha256":"2de130e51531ec50c3663d361c9666706ec3bc3577986cad830fd51c8c62aff7"}

```

## .build/optimization/expert-layout-verified-v77/w2-r5-m2/stdout.txt

SHA-256 `7a2fe0afc0d1f77750b82eb5bafe865d6e7e551ad4a533bcb3c5e66da3b324b6`; 454 bytes.

```
{"mode":2,"workload":2,"records":2048,"batches":208,"bytes":5662310400,"read_calls":2048,"seconds":0.666482997,"batch_median_seconds":0.003221000,"batch_p95_seconds":0.003360000,"sampled_footprint_bytes":59900360,"lifetime_rss_peak_bytes":60243968,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":55296000,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"2de130e51531ec50c3663d361c9666706ec3bc3577986cad830fd51c8c62aff7"}

```

## .build/optimization/expert-layout-verified-v77/w2-r6-m0/stdout.txt

SHA-256 `f8535dbd131baf9d18010cf0695604737e14907b991a753074f6f3b914fe2a42`; 446 bytes.

```
{"mode":0,"workload":2,"records":2048,"batches":208,"bytes":5662310400,"read_calls":18432,"seconds":0.549160000,"batch_median_seconds":0.002664000,"batch_p95_seconds":0.002828000,"sampled_footprint_bytes":32227760,"lifetime_rss_peak_bytes":32587776,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":27648000,"diskio_bytesread":5964300288,"reformat_bytes":0,"tensor_sha256":"2de130e51531ec50c3663d361c9666706ec3bc3577986cad830fd51c8c62aff7"}

```

## .build/optimization/expert-layout-verified-v77/w2-r6-m2/stdout.txt

SHA-256 `426a79e33d627b0fadabbd72abc934109326be3b5f4239252ca1fb43a0e303dc`; 454 bytes.

```
{"mode":2,"workload":2,"records":2048,"batches":208,"bytes":5662310400,"read_calls":2048,"seconds":0.669930000,"batch_median_seconds":0.003241000,"batch_p95_seconds":0.003385000,"sampled_footprint_bytes":59900384,"lifetime_rss_peak_bytes":60227584,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":55296000,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"2de130e51531ec50c3663d361c9666706ec3bc3577986cad830fd51c8c62aff7"}

```

## .build/optimization/expert-layout-verified-v77/w2-r7-m0/stdout.txt

SHA-256 `0a961ec943e1ddd8a7076844a061f33bd9c8dce6f76d5ef82b1a883bb0391239`; 446 bytes.

```
{"mode":0,"workload":2,"records":2048,"batches":208,"bytes":5662310400,"read_calls":18432,"seconds":0.549761001,"batch_median_seconds":0.002674000,"batch_p95_seconds":0.002827000,"sampled_footprint_bytes":32227736,"lifetime_rss_peak_bytes":32604160,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":27648000,"diskio_bytesread":5964300288,"reformat_bytes":0,"tensor_sha256":"2de130e51531ec50c3663d361c9666706ec3bc3577986cad830fd51c8c62aff7"}

```

## .build/optimization/expert-layout-verified-v77/w2-r7-m2/stdout.txt

SHA-256 `5852bbc56337c51dad16651af33125e349d66a87ed37e96f38a2b31374ff083f`; 454 bytes.

```
{"mode":2,"workload":2,"records":2048,"batches":208,"bytes":5662310400,"read_calls":2048,"seconds":0.669502003,"batch_median_seconds":0.003236000,"batch_p95_seconds":0.003379000,"sampled_footprint_bytes":59900384,"lifetime_rss_peak_bytes":60227584,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":55296000,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"2de130e51531ec50c3663d361c9666706ec3bc3577986cad830fd51c8c62aff7"}

```

## .build/optimization/expert-layout-verified-v77/w3-r1-m0/stdout.txt

SHA-256 `7e01a5ebba81021afdbb69cb237394d2fdf7ae8436f687da9c6a6fa56301b57a`; 445 bytes.

```
{"mode":0,"workload":3,"records":2048,"batches":64,"bytes":5662310400,"read_calls":18432,"seconds":0.510390001,"batch_median_seconds":0.007906000,"batch_p95_seconds":0.008174000,"sampled_footprint_bytes":90456544,"lifetime_rss_peak_bytes":90783744,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":88473600,"diskio_bytesread":5964300288,"reformat_bytes":0,"tensor_sha256":"4d6acf7dc3d1f60f9afcb01dab007f9f541b211d517b2d7257c05265c7053961"}

```

## .build/optimization/expert-layout-verified-v77/w3-r1-m2/stdout.txt

SHA-256 `44ca17974fff31cec0ca3cfaa5389a10357cfb1b4401317ea1c2f4790b2e3e04`; 456 bytes.

```
{"mode":2,"workload":3,"records":2048,"batches":64,"bytes":5662310400,"read_calls":2048,"seconds":0.511529999,"batch_median_seconds":0.007938000,"batch_p95_seconds":0.008250000,"sampled_footprint_bytes":140608016,"lifetime_rss_peak_bytes":140902400,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":176947200,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"4d6acf7dc3d1f60f9afcb01dab007f9f541b211d517b2d7257c05265c7053961"}

```

## .build/optimization/expert-layout-verified-v77/w3-r2-m0/stdout.txt

SHA-256 `ad7bce43fc2240d448f94cc712024b7af8f608a08d172a4972b8408b4faebaaf`; 445 bytes.

```
{"mode":0,"workload":3,"records":2048,"batches":64,"bytes":5662310400,"read_calls":18432,"seconds":0.504678000,"batch_median_seconds":0.007873000,"batch_p95_seconds":0.008077000,"sampled_footprint_bytes":90407368,"lifetime_rss_peak_bytes":90750976,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":88473600,"diskio_bytesread":5964300288,"reformat_bytes":0,"tensor_sha256":"4d6acf7dc3d1f60f9afcb01dab007f9f541b211d517b2d7257c05265c7053961"}

```

## .build/optimization/expert-layout-verified-v77/w3-r2-m2/stdout.txt

SHA-256 `cde0cdeb16bdd9e27b4d69f4d7e1b9ecc9cd1a66b437a503906c69cb576e71f0`; 456 bytes.

```
{"mode":2,"workload":3,"records":2048,"batches":64,"bytes":5662310400,"read_calls":2048,"seconds":0.510994001,"batch_median_seconds":0.007948000,"batch_p95_seconds":0.008220000,"sampled_footprint_bytes":140575224,"lifetime_rss_peak_bytes":140886016,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":176947200,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"4d6acf7dc3d1f60f9afcb01dab007f9f541b211d517b2d7257c05265c7053961"}

```

## .build/optimization/expert-layout-verified-v77/w3-r3-m0/stdout.txt

SHA-256 `93b610eb06a96aa973de89cb9ebbf263e2bd7bf9051999201496ae1689174b18`; 445 bytes.

```
{"mode":0,"workload":3,"records":2048,"batches":64,"bytes":5662310400,"read_calls":18432,"seconds":0.507311002,"batch_median_seconds":0.007946000,"batch_p95_seconds":0.008132000,"sampled_footprint_bytes":90407368,"lifetime_rss_peak_bytes":90750976,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":88473600,"diskio_bytesread":5964300288,"reformat_bytes":0,"tensor_sha256":"4d6acf7dc3d1f60f9afcb01dab007f9f541b211d517b2d7257c05265c7053961"}

```

## .build/optimization/expert-layout-verified-v77/w3-r3-m2/stdout.txt

SHA-256 `0d16153f650db39f7c94b8d9c11c51366b9db21f6f6786eb4edf0717d05aa9a4`; 456 bytes.

```
{"mode":2,"workload":3,"records":2048,"batches":64,"bytes":5662310400,"read_calls":2048,"seconds":0.512011001,"batch_median_seconds":0.007947000,"batch_p95_seconds":0.008251000,"sampled_footprint_bytes":140575248,"lifetime_rss_peak_bytes":140869632,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":176947200,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"4d6acf7dc3d1f60f9afcb01dab007f9f541b211d517b2d7257c05265c7053961"}

```

## .build/optimization/expert-layout-verified-v77/w3-r4-m0/stdout.txt

SHA-256 `298e09d25319b2dfe6ea7d78331fdaa03d1381022448a772221be4f77d3fbe1d`; 445 bytes.

```
{"mode":0,"workload":3,"records":2048,"batches":64,"bytes":5662310400,"read_calls":18432,"seconds":0.504480000,"batch_median_seconds":0.007888000,"batch_p95_seconds":0.008060000,"sampled_footprint_bytes":90423776,"lifetime_rss_peak_bytes":90750976,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":88473600,"diskio_bytesread":5964300288,"reformat_bytes":0,"tensor_sha256":"4d6acf7dc3d1f60f9afcb01dab007f9f541b211d517b2d7257c05265c7053961"}

```

## .build/optimization/expert-layout-verified-v77/w3-r4-m2/stdout.txt

SHA-256 `902a2609e71b5f79cd759d375f657bbc56dd88cdaf4c66797b6f121d8ea2f057`; 456 bytes.

```
{"mode":2,"workload":3,"records":2048,"batches":64,"bytes":5662310400,"read_calls":2048,"seconds":0.509570000,"batch_median_seconds":0.007932000,"batch_p95_seconds":0.008251000,"sampled_footprint_bytes":140591656,"lifetime_rss_peak_bytes":140869632,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":176947200,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"4d6acf7dc3d1f60f9afcb01dab007f9f541b211d517b2d7257c05265c7053961"}

```

## .build/optimization/expert-layout-verified-v77/w3-r5-m0/stdout.txt

SHA-256 `285b34ab26a587a12d4289169decbedc35996002eb499972b09b60c512d2ae18`; 445 bytes.

```
{"mode":0,"workload":3,"records":2048,"batches":64,"bytes":5662310400,"read_calls":18432,"seconds":0.505444001,"batch_median_seconds":0.007876000,"batch_p95_seconds":0.008124000,"sampled_footprint_bytes":90440136,"lifetime_rss_peak_bytes":90783744,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":88473600,"diskio_bytesread":5964300288,"reformat_bytes":0,"tensor_sha256":"4d6acf7dc3d1f60f9afcb01dab007f9f541b211d517b2d7257c05265c7053961"}

```

## .build/optimization/expert-layout-verified-v77/w3-r5-m2/stdout.txt

SHA-256 `554d419470f9daa919c4c3a6978ac5539f2d8656ea9ea10d10c120538adcc37d`; 456 bytes.

```
{"mode":2,"workload":3,"records":2048,"batches":64,"bytes":5662310400,"read_calls":2048,"seconds":0.510227001,"batch_median_seconds":0.007946000,"batch_p95_seconds":0.008252000,"sampled_footprint_bytes":140575224,"lifetime_rss_peak_bytes":140886016,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":176947200,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"4d6acf7dc3d1f60f9afcb01dab007f9f541b211d517b2d7257c05265c7053961"}

```

## .build/optimization/expert-layout-verified-v77/w3-r6-m0/stdout.txt

SHA-256 `b30b1a46962b34968afbcff98b40467c64fa982407e95fcbaa4d625ffd32e909`; 445 bytes.

```
{"mode":0,"workload":3,"records":2048,"batches":64,"bytes":5662310400,"read_calls":18432,"seconds":0.503333000,"batch_median_seconds":0.007858000,"batch_p95_seconds":0.008063000,"sampled_footprint_bytes":90407368,"lifetime_rss_peak_bytes":90750976,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":88473600,"diskio_bytesread":5964300288,"reformat_bytes":0,"tensor_sha256":"4d6acf7dc3d1f60f9afcb01dab007f9f541b211d517b2d7257c05265c7053961"}

```

## .build/optimization/expert-layout-verified-v77/w3-r6-m2/stdout.txt

SHA-256 `67c5412350bcb1629b2e585acb633ac63b1c9536e4ffeedb3c09f849fb24cc76`; 456 bytes.

```
{"mode":2,"workload":3,"records":2048,"batches":64,"bytes":5662310400,"read_calls":2048,"seconds":0.509517999,"batch_median_seconds":0.007934000,"batch_p95_seconds":0.008230000,"sampled_footprint_bytes":140575248,"lifetime_rss_peak_bytes":140869632,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":176947200,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"4d6acf7dc3d1f60f9afcb01dab007f9f541b211d517b2d7257c05265c7053961"}

```

## .build/optimization/expert-layout-verified-v77/w3-r7-m0/stdout.txt

SHA-256 `f967d42c86bb2a1941c4b7d58d4624d58a8630695acdf3786f1739fd83c58662`; 445 bytes.

```
{"mode":0,"workload":3,"records":2048,"batches":64,"bytes":5662310400,"read_calls":18432,"seconds":0.505151001,"batch_median_seconds":0.007882000,"batch_p95_seconds":0.008174000,"sampled_footprint_bytes":90391008,"lifetime_rss_peak_bytes":90718208,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":88473600,"diskio_bytesread":5964300288,"reformat_bytes":0,"tensor_sha256":"4d6acf7dc3d1f60f9afcb01dab007f9f541b211d517b2d7257c05265c7053961"}

```

## .build/optimization/expert-layout-verified-v77/w3-r7-m2/stdout.txt

SHA-256 `5b969cca897c2b7d026289b25047ec6037082a6474167f6a0ab651c0b70e7ebc`; 456 bytes.

```
{"mode":2,"workload":3,"records":2048,"batches":64,"bytes":5662310400,"read_calls":2048,"seconds":0.510088001,"batch_median_seconds":0.007942000,"batch_p95_seconds":0.008235000,"sampled_footprint_bytes":140591632,"lifetime_rss_peak_bytes":140886016,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":176947200,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"4d6acf7dc3d1f60f9afcb01dab007f9f541b211d517b2d7257c05265c7053961"}

```

## .build/optimization/expert-layout-verified-v77/w4-r1-m0/stdout.txt

SHA-256 `dffcfb631b823e2c38357bb4a3095e7ffa446256c93052838180b2367425bacb`; 443 bytes.

```
{"mode":0,"workload":4,"records":2048,"batches":64,"bytes":5662310400,"read_calls":576,"seconds":0.472823000,"batch_median_seconds":0.007312000,"batch_p95_seconds":0.007644000,"sampled_footprint_bytes":90259936,"lifetime_rss_peak_bytes":90587136,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":88473600,"diskio_bytesread":5662900224,"reformat_bytes":0,"tensor_sha256":"8f2020be78b87dc9f3c5a5cb4fa3b635cfeeb0b85dc58797c37f37edaf7bb25c"}

```

## .build/optimization/expert-layout-verified-v77/w4-r1-m2/stdout.txt

SHA-256 `f1a111075e290ca305697c354519bed975e0cc828b0c7399364a05cb81d765f4`; 454 bytes.

```
{"mode":2,"workload":4,"records":2048,"batches":64,"bytes":5662310400,"read_calls":64,"seconds":2.228474001,"batch_median_seconds":0.033605000,"batch_p95_seconds":0.037659000,"sampled_footprint_bytes":178553336,"lifetime_rss_peak_bytes":178864128,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":176947200,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"8f2020be78b87dc9f3c5a5cb4fa3b635cfeeb0b85dc58797c37f37edaf7bb25c"}

```

## .build/optimization/expert-layout-verified-v77/w4-r2-m0/stdout.txt

SHA-256 `91aebec4311ddfc8913fb5f0bef981d8f182539e4e4bfdc9a0caf3dbebeea422`; 442 bytes.

```
{"mode":0,"workload":4,"records":2048,"batches":64,"bytes":5662310400,"read_calls":576,"seconds":0.181418002,"batch_median_seconds":0.002836000,"batch_p95_seconds":0.002961000,"sampled_footprint_bytes":90259936,"lifetime_rss_peak_bytes":90587136,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":88473600,"diskio_bytesread":603897856,"reformat_bytes":0,"tensor_sha256":"8f2020be78b87dc9f3c5a5cb4fa3b635cfeeb0b85dc58797c37f37edaf7bb25c"}

```

## .build/optimization/expert-layout-verified-v77/w4-r2-m2/stdout.txt

SHA-256 `ae5266ff393031734ada6c453276355d9cabb1531776bbf56d2d2a148dda0da8`; 454 bytes.

```
{"mode":2,"workload":4,"records":2048,"batches":64,"bytes":5662310400,"read_calls":64,"seconds":2.239749999,"batch_median_seconds":0.033616000,"batch_p95_seconds":0.038029000,"sampled_footprint_bytes":178553360,"lifetime_rss_peak_bytes":178847744,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":176947200,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"8f2020be78b87dc9f3c5a5cb4fa3b635cfeeb0b85dc58797c37f37edaf7bb25c"}

```

## .build/optimization/expert-layout-verified-v77/w4-r3-m0/stdout.txt

SHA-256 `46f6f20f8f6fdbee942d229080c8bb68b8fd9269fedec844f7d6d6055f67fd67`; 442 bytes.

```
{"mode":0,"workload":4,"records":2048,"batches":64,"bytes":5662310400,"read_calls":576,"seconds":0.182806001,"batch_median_seconds":0.002836000,"batch_p95_seconds":0.003047000,"sampled_footprint_bytes":90243528,"lifetime_rss_peak_bytes":90587136,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":88473600,"diskio_bytesread":603897856,"reformat_bytes":0,"tensor_sha256":"8f2020be78b87dc9f3c5a5cb4fa3b635cfeeb0b85dc58797c37f37edaf7bb25c"}

```

## .build/optimization/expert-layout-verified-v77/w4-r3-m2/stdout.txt

SHA-256 `c6bc888626293ed391549a87d3981876a2b382c77fa01d02d9cd4cae119081fb`; 454 bytes.

```
{"mode":2,"workload":4,"records":2048,"batches":64,"bytes":5662310400,"read_calls":64,"seconds":2.242623999,"batch_median_seconds":0.033614000,"batch_p95_seconds":0.038009000,"sampled_footprint_bytes":178553336,"lifetime_rss_peak_bytes":178864128,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":176947200,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"8f2020be78b87dc9f3c5a5cb4fa3b635cfeeb0b85dc58797c37f37edaf7bb25c"}

```

## .build/optimization/expert-layout-verified-v77/w4-r4-m0/stdout.txt

SHA-256 `2d61bec79c2f189983d420919060b0ee0b02952b7946ac8298167b6562582e00`; 442 bytes.

```
{"mode":0,"workload":4,"records":2048,"batches":64,"bytes":5662310400,"read_calls":576,"seconds":0.182199001,"batch_median_seconds":0.002839000,"batch_p95_seconds":0.002996000,"sampled_footprint_bytes":90243528,"lifetime_rss_peak_bytes":90587136,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":88473600,"diskio_bytesread":603897856,"reformat_bytes":0,"tensor_sha256":"8f2020be78b87dc9f3c5a5cb4fa3b635cfeeb0b85dc58797c37f37edaf7bb25c"}

```

## .build/optimization/expert-layout-verified-v77/w4-r4-m2/stdout.txt

SHA-256 `7cb16f73852fb52a5423542b8c51f607ad96488f9483659b81ff2b2c152fbcfe`; 454 bytes.

```
{"mode":2,"workload":4,"records":2048,"batches":64,"bytes":5662310400,"read_calls":64,"seconds":2.200364999,"batch_median_seconds":0.033338000,"batch_p95_seconds":0.037404000,"sampled_footprint_bytes":178553336,"lifetime_rss_peak_bytes":178864128,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":176947200,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"8f2020be78b87dc9f3c5a5cb4fa3b635cfeeb0b85dc58797c37f37edaf7bb25c"}

```

## .build/optimization/expert-layout-verified-v77/w4-r5-m0/stdout.txt

SHA-256 `e10a72bb0f9a2e3992a5a15e8bc2b81287101fbc21123eab420ec7c4f88ddf9e`; 442 bytes.

```
{"mode":0,"workload":4,"records":2048,"batches":64,"bytes":5662310400,"read_calls":576,"seconds":0.180347000,"batch_median_seconds":0.002810000,"batch_p95_seconds":0.002955000,"sampled_footprint_bytes":90259936,"lifetime_rss_peak_bytes":90587136,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":88473600,"diskio_bytesread":603897856,"reformat_bytes":0,"tensor_sha256":"8f2020be78b87dc9f3c5a5cb4fa3b635cfeeb0b85dc58797c37f37edaf7bb25c"}

```

## .build/optimization/expert-layout-verified-v77/w4-r5-m2/stdout.txt

SHA-256 `be4f86ca06d383649beb556200c5cac41c3b2d3ae95394815dfd2b08567b03dd`; 454 bytes.

```
{"mode":2,"workload":4,"records":2048,"batches":64,"bytes":5662310400,"read_calls":64,"seconds":2.230236000,"batch_median_seconds":0.033524000,"batch_p95_seconds":0.037700000,"sampled_footprint_bytes":178569744,"lifetime_rss_peak_bytes":178864128,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":176947200,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"8f2020be78b87dc9f3c5a5cb4fa3b635cfeeb0b85dc58797c37f37edaf7bb25c"}

```

## .build/optimization/expert-layout-verified-v77/w4-r6-m0/stdout.txt

SHA-256 `02041f94822099baa1b1173e7835a0125b3031b6d549ddb63045ea89c79df368`; 442 bytes.

```
{"mode":0,"workload":4,"records":2048,"batches":64,"bytes":5662310400,"read_calls":576,"seconds":0.181747000,"batch_median_seconds":0.002823000,"batch_p95_seconds":0.002980000,"sampled_footprint_bytes":90259936,"lifetime_rss_peak_bytes":90587136,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":88473600,"diskio_bytesread":603897856,"reformat_bytes":0,"tensor_sha256":"8f2020be78b87dc9f3c5a5cb4fa3b635cfeeb0b85dc58797c37f37edaf7bb25c"}

```

## .build/optimization/expert-layout-verified-v77/w4-r6-m2/stdout.txt

SHA-256 `6886fb6c12c2d5821f40c567e0f8b605bf6da6eb4858c51f5b2ac84f8b75146b`; 454 bytes.

```
{"mode":2,"workload":4,"records":2048,"batches":64,"bytes":5662310400,"read_calls":64,"seconds":2.222281000,"batch_median_seconds":0.033498000,"batch_p95_seconds":0.037767000,"sampled_footprint_bytes":178553336,"lifetime_rss_peak_bytes":178864128,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":176947200,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"8f2020be78b87dc9f3c5a5cb4fa3b635cfeeb0b85dc58797c37f37edaf7bb25c"}

```

## .build/optimization/expert-layout-verified-v77/w4-r7-m0/stdout.txt

SHA-256 `b5b98cf3b12400e6716fefcb6c645e66806438303956f0102bb22db029c77f4d`; 442 bytes.

```
{"mode":0,"workload":4,"records":2048,"batches":64,"bytes":5662310400,"read_calls":576,"seconds":0.181933998,"batch_median_seconds":0.002836000,"batch_p95_seconds":0.002960000,"sampled_footprint_bytes":90259936,"lifetime_rss_peak_bytes":90587136,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":88473600,"diskio_bytesread":603897856,"reformat_bytes":0,"tensor_sha256":"8f2020be78b87dc9f3c5a5cb4fa3b635cfeeb0b85dc58797c37f37edaf7bb25c"}

```

## .build/optimization/expert-layout-verified-v77/w4-r7-m2/stdout.txt

SHA-256 `453441ddb9a8eb9e96b8a5ec509aac510eb828b6e600c4f5b6a9c8420c65a04a`; 454 bytes.

```
{"mode":2,"workload":4,"records":2048,"batches":64,"bytes":5662310400,"read_calls":64,"seconds":2.224731000,"batch_median_seconds":0.033478000,"batch_p95_seconds":0.037528000,"sampled_footprint_bytes":178536952,"lifetime_rss_peak_bytes":178847744,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":176947200,"diskio_bytesread":5662310400,"reformat_bytes":5662310400,"tensor_sha256":"8f2020be78b87dc9f3c5a5cb4fa3b635cfeeb0b85dc58797c37f37edaf7bb25c"}

```

## .build/optimization/expert-layout-verified-v77/w5-r1-m0/stdout.txt

SHA-256 `dfe9a9d9d22d575c9af7df4891e5f2341e690ca5682ab04b39dda1acd8dac128`; 443 bytes.

```
{"mode":0,"workload":5,"records":1024,"batches":32,"bytes":2831155200,"read_calls":4680,"seconds":0.091057001,"batch_median_seconds":0.002823000,"batch_p95_seconds":0.003138000,"sampled_footprint_bytes":90309088,"lifetime_rss_peak_bytes":90636288,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":88473600,"diskio_bytesread":336347136,"reformat_bytes":0,"tensor_sha256":"437f4461dd80edc9e798e9f9699f3b665ef9d09be87d085060a4577fdf114d65"}

```

## .build/optimization/expert-layout-verified-v77/w5-r1-m2/stdout.txt

SHA-256 `20ce4cf558785cca19d75b952dd2d4871df71ef6ac182c026d735dff80813df2`; 455 bytes.

```
{"mode":2,"workload":5,"records":1024,"batches":32,"bytes":2831155200,"read_calls":520,"seconds":0.368881000,"batch_median_seconds":0.011281000,"batch_p95_seconds":0.014167000,"sampled_footprint_bytes":548127968,"lifetime_rss_peak_bytes":547930112,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":423014400,"diskio_bytesread":2831155200,"reformat_bytes":2831155200,"tensor_sha256":"437f4461dd80edc9e798e9f9699f3b665ef9d09be87d085060a4577fdf114d65"}

```

## .build/optimization/expert-layout-verified-v77/w5-r2-m0/stdout.txt

SHA-256 `e114eac162abaafb3e88a6cc68a249ee3eb06760c00fef415f5e3cd2145342cb`; 443 bytes.

```
{"mode":0,"workload":5,"records":1024,"batches":32,"bytes":2831155200,"read_calls":4680,"seconds":0.090663000,"batch_median_seconds":0.002787000,"batch_p95_seconds":0.003034000,"sampled_footprint_bytes":90309088,"lifetime_rss_peak_bytes":90636288,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":88473600,"diskio_bytesread":336347136,"reformat_bytes":0,"tensor_sha256":"437f4461dd80edc9e798e9f9699f3b665ef9d09be87d085060a4577fdf114d65"}

```

## .build/optimization/expert-layout-verified-v77/w5-r2-m2/stdout.txt

SHA-256 `2d8f5f9689e0893fcfb97cdec6cd81fc1952fee40586d5a5a76b2b922e429940`; 455 bytes.

```
{"mode":2,"workload":5,"records":1024,"batches":32,"bytes":2831155200,"read_calls":520,"seconds":0.369681000,"batch_median_seconds":0.011239000,"batch_p95_seconds":0.014189000,"sampled_footprint_bytes":550880480,"lifetime_rss_peak_bytes":550682624,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":423014400,"diskio_bytesread":2831155200,"reformat_bytes":2831155200,"tensor_sha256":"437f4461dd80edc9e798e9f9699f3b665ef9d09be87d085060a4577fdf114d65"}

```

## .build/optimization/expert-layout-verified-v77/w5-r3-m0/stdout.txt

SHA-256 `d026de5286673bab1d09c87d5992bcf05cac6ce45f4d62dcaa43261126ea9970`; 443 bytes.

```
{"mode":0,"workload":5,"records":1024,"batches":32,"bytes":2831155200,"read_calls":4680,"seconds":0.091215000,"batch_median_seconds":0.002793000,"batch_p95_seconds":0.003121000,"sampled_footprint_bytes":90292680,"lifetime_rss_peak_bytes":90636288,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":88473600,"diskio_bytesread":336347136,"reformat_bytes":0,"tensor_sha256":"437f4461dd80edc9e798e9f9699f3b665ef9d09be87d085060a4577fdf114d65"}

```

## .build/optimization/expert-layout-verified-v77/w5-r3-m2/stdout.txt

SHA-256 `88089d1fc36e7fbc0f23a5509d2c40b33ad28c9768b437ff181fa1c151b294f4`; 455 bytes.

```
{"mode":2,"workload":5,"records":1024,"batches":32,"bytes":2831155200,"read_calls":520,"seconds":0.369425999,"batch_median_seconds":0.011004000,"batch_p95_seconds":0.014187000,"sampled_footprint_bytes":545359072,"lifetime_rss_peak_bytes":545161216,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":423014400,"diskio_bytesread":2831155200,"reformat_bytes":2831155200,"tensor_sha256":"437f4461dd80edc9e798e9f9699f3b665ef9d09be87d085060a4577fdf114d65"}

```

## .build/optimization/expert-layout-verified-v77/w5-r4-m0/stdout.txt

SHA-256 `a038e765a11dc03b720666aa2374d353896568b3333ca6b0747d98deddae3997`; 443 bytes.

```
{"mode":0,"workload":5,"records":1024,"batches":32,"bytes":2831155200,"read_calls":4680,"seconds":0.090912000,"batch_median_seconds":0.002748000,"batch_p95_seconds":0.003159000,"sampled_footprint_bytes":90309088,"lifetime_rss_peak_bytes":90636288,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":88473600,"diskio_bytesread":336347136,"reformat_bytes":0,"tensor_sha256":"437f4461dd80edc9e798e9f9699f3b665ef9d09be87d085060a4577fdf114d65"}

```

## .build/optimization/expert-layout-verified-v77/w5-r4-m2/stdout.txt

SHA-256 `915441f2f38480b44e2afa555b40448c0ee4823170e94c61ee6303f98c57931e`; 455 bytes.

```
{"mode":2,"workload":5,"records":1024,"batches":32,"bytes":2831155200,"read_calls":520,"seconds":0.369611000,"batch_median_seconds":0.011009000,"batch_p95_seconds":0.014427000,"sampled_footprint_bytes":550864096,"lifetime_rss_peak_bytes":550666240,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":423014400,"diskio_bytesread":2831155200,"reformat_bytes":2831155200,"tensor_sha256":"437f4461dd80edc9e798e9f9699f3b665ef9d09be87d085060a4577fdf114d65"}

```

## .build/optimization/expert-layout-verified-v77/w5-r5-m0/stdout.txt

SHA-256 `ada542d86d2237635ffe313d8f920906e38c3febb52d402f4f7ded176a4b7592`; 443 bytes.

```
{"mode":0,"workload":5,"records":1024,"batches":32,"bytes":2831155200,"read_calls":4680,"seconds":0.090772001,"batch_median_seconds":0.002774000,"batch_p95_seconds":0.003047000,"sampled_footprint_bytes":90292680,"lifetime_rss_peak_bytes":90636288,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":88473600,"diskio_bytesread":336347136,"reformat_bytes":0,"tensor_sha256":"437f4461dd80edc9e798e9f9699f3b665ef9d09be87d085060a4577fdf114d65"}

```

## .build/optimization/expert-layout-verified-v77/w5-r5-m2/stdout.txt

SHA-256 `a0831867df5f113fd0bf51aa9c5875e7ad0ce55f1398dbc66aa2afcdbb3bb3dd`; 455 bytes.

```
{"mode":2,"workload":5,"records":1024,"batches":32,"bytes":2831155200,"read_calls":520,"seconds":0.370750000,"batch_median_seconds":0.011221000,"batch_p95_seconds":0.014170000,"sampled_footprint_bytes":550864072,"lifetime_rss_peak_bytes":550682624,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":423014400,"diskio_bytesread":2831155200,"reformat_bytes":2831155200,"tensor_sha256":"437f4461dd80edc9e798e9f9699f3b665ef9d09be87d085060a4577fdf114d65"}

```

## .build/optimization/expert-layout-verified-v77/w5-r6-m0/stdout.txt

SHA-256 `b1e4a1ca24f7cdd85e536dd160fb40cc2145a0750f18782d90c64528779c83a5`; 443 bytes.

```
{"mode":0,"workload":5,"records":1024,"batches":32,"bytes":2831155200,"read_calls":4680,"seconds":0.090968000,"batch_median_seconds":0.002775000,"batch_p95_seconds":0.003098000,"sampled_footprint_bytes":90341880,"lifetime_rss_peak_bytes":90652672,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":88473600,"diskio_bytesread":336347136,"reformat_bytes":0,"tensor_sha256":"437f4461dd80edc9e798e9f9699f3b665ef9d09be87d085060a4577fdf114d65"}

```

## .build/optimization/expert-layout-verified-v77/w5-r6-m2/stdout.txt

SHA-256 `069ee75c50b4409e114724808c5754611b9c752c685a7c768f2b0da56b76324e`; 455 bytes.

```
{"mode":2,"workload":5,"records":1024,"batches":32,"bytes":2831155200,"read_calls":520,"seconds":0.369188001,"batch_median_seconds":0.011193000,"batch_p95_seconds":0.014123000,"sampled_footprint_bytes":545359072,"lifetime_rss_peak_bytes":545161216,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":423014400,"diskio_bytesread":2831155200,"reformat_bytes":2831155200,"tensor_sha256":"437f4461dd80edc9e798e9f9699f3b665ef9d09be87d085060a4577fdf114d65"}

```

## .build/optimization/expert-layout-verified-v77/w5-r7-m0/stdout.txt

SHA-256 `ed4d9b293172bd7e1ea45acebdb8c9d33bc2db5d1880a98fc54d5b7a81150a69`; 443 bytes.

```
{"mode":0,"workload":5,"records":1024,"batches":32,"bytes":2831155200,"read_calls":4680,"seconds":0.090267000,"batch_median_seconds":0.002784000,"batch_p95_seconds":0.003014000,"sampled_footprint_bytes":90309088,"lifetime_rss_peak_bytes":90636288,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":88473600,"diskio_bytesread":336347136,"reformat_bytes":0,"tensor_sha256":"437f4461dd80edc9e798e9f9699f3b665ef9d09be87d085060a4577fdf114d65"}

```

## .build/optimization/expert-layout-verified-v77/w5-r7-m2/stdout.txt

SHA-256 `74677affa5d458d97b8186e12da7ae1badeb1ba3a60307fb758cf76891d7f5a7`; 455 bytes.

```
{"mode":2,"workload":5,"records":1024,"batches":32,"bytes":2831155200,"read_calls":520,"seconds":0.369291000,"batch_median_seconds":0.011150000,"batch_p95_seconds":0.014139000,"sampled_footprint_bytes":548111584,"lifetime_rss_peak_bytes":547913728,"sampling_interval_ms":20,"maximum_owned_buffer_bytes":423014400,"diskio_bytesread":2831155200,"reformat_bytes":2831155200,"tensor_sha256":"437f4461dd80edc9e798e9f9699f3b665ef9d09be87d085060a4577fdf114d65"}

```

Native probe SHA-256 `83cb6b3e1172621e79cffee0b0fb1f83d6a9191ff96260847905aeaf55f80227`.
