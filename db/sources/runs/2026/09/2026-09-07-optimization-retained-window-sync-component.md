---
type: run
id: 01m1xxrnacx4a6vfv0y1jh7gxx
created: 2026-09-07T12:33:52.460755+00:00
updated: 2026-09-07T12:33:52.726683+00:00
summary: Retained-window synchronization component probe and explicit serving qualification boundary
binary: V280 eba9ee894aba4722d082fda7d39192339d0299fe7af264a624dd4209d1e648cf
captured_at: 2026-09-07
command: Exact archived protocols, actual raw results and guarded receipts below
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Retained-window synchronization component probe and explicit serving qualification boundary
tool: python3
---
# Joined retained-window evaluation: bounded component evidence

Source inspection of the actual LinearCache.compactWindows implementation finds two consecutive eval calls after the independent convState and pleConvState copies are already constructed. V301 prospectively tests grouping those evaluations using pinned Python MLX0.31.1 and the actual curated geometry:10240 channels, a3-row GDN window and9-row PLE window. Parent prompt lengths are17,256 and4096. Each shape has one64-iteration warmup per arm, then16 fixed interleaved pairs with64 compactions per arm; there are no replacement rounds. Absent/both/one-window cases, exact shapes/dtypes and equal copied values all pass (12 edge cases). The runtime source and candidate remain unchanged.

All sixteen pairs per shape have unchanged swap counters and normal pressure. Median paired reductions in this isolated operation are46.26749439821745%,48.279977253399764% and45.88753198959179%. Separate/joined arm medians are318.597977/167.279617 microseconds for17 rows,313.839844/162.357102 for256, and311.344406/164.461594 for4096. The complete component work takes2.028252875 seconds; its ownership wrapper takes2.368355542 seconds. Peak active-plus-cache allocation reported by the MLX peak API is preserved as the raw allocator peak336,183,310 bytes; no process-footprint or machine-memory saving is inferred. Protocol a71bc2dd622019f652e2e2b3408848764f459607ab8931566a4268daeb1c2a6b passes unchanged library/probe/config identity, two-GB owned-RSS bound, cleanup, normal-pressure and deadline checks.

These numbers include Python/C binding overhead. They are neither a measured Swift call-site improvement nor an end-to-end inference speedup, and they do not attribute V293's small first-protocol regression to this code. Nominal-power performance qualification is not part of this small exploratory probe. Native Swift verification and whole-model qualification remain required before adopting a changed evaluation schedule. The isolated measurements are not added to any serving percentage. The pre-launch version-binding correction uses installed distribution metadata rather than assuming a core-module attribute; both source images remain below. This is a concrete follow-up under OPT02, not an activated optimization or a replacement unified plan.

## Complete artifact inventory

````json
[
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-sync-v301/component-result.json",
    "sha256": "018feed43f2a3910fcdaf305d00c6f770ea6c23c14248f7c64b342c0e23b7193",
    "bytes": 21232
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-sync-v301/manifest.json",
    "sha256": "514b5582ffbbbaf9d536c8e1fc0b8718ff48b8c77e8762c0ebe69c2875217b9c",
    "bytes": 5325
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-sync-v301/ownership-memory.json",
    "sha256": "d63d37f90340406006337fb6c15fca290d746af8e30668df36098747f6816e3c",
    "bytes": 9014
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-sync-v301/ownership-memory.samples.jsonl",
    "sha256": "f43b0d2cb0f65450cd7c9ec07e3358d548bbe846b6cf908530fab99359318e64",
    "bytes": 1670
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-sync-v301/preparation.json",
    "sha256": "06ab873234b3ac7643e07cbc4b92a481d89685f1bb3533afca30a6c081d9ceb6",
    "bytes": 1004
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-sync-v301/probe-before-version-binding.py",
    "sha256": "dccef27bdd73d45debde47d98d466b81a5f9e180559bb2787faf2a51cf0e0213",
    "bytes": 5390
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-sync-v301/probe.py",
    "sha256": "ff76531842e27a1bed5a28a848a51b4fc520191219f700c11e1ddd7216689057",
    "bytes": 5439
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-sync-v301/protocol.json",
    "sha256": "a71bc2dd622019f652e2e2b3408848764f459607ab8931566a4268daeb1c2a6b",
    "bytes": 1770
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-sync-v301/run.py",
    "sha256": "15142ea1b7d8e40b328f3796b13ae144170ee5e0cf0b7e8af13561ef03960f13",
    "bytes": 3901
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-sync-v301/stderr.txt",
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
    "bytes": 0
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-sync-v301/stdout.txt",
    "sha256": "063458fa012279dc3e12f840da0ef75730197506a7b4fc1b939045aeb1923f57",
    "bytes": 702
  }
]
````

## /tmp/slotstream-optimization-execution/compact-window-sync-v301/component-result.json

SHA-256 `018feed43f2a3910fcdaf305d00c6f770ea6c23c14248f7c64b342c0e23b7193`; 21232 bytes.

````text
{
  "passed": true,
  "classification": "Interleaved array-component timing using pinned Python MLX0.31.1 and the exact retained-window geometry. Only eval grouping changes. These timings include Python/C binding overhead and cannot establish a Swift or end-to-end inference improvement.",
  "mlx_version": "0.31.1",
  "geometry": {
    "conv_width": 10240,
    "conv_rows": 3,
    "ple_width": 10240,
    "ple_rows": 9
  },
  "model_loaded": false,
  "runtime_changed": false,
  "cases": [
    {
      "parent_prompt_rows": 17,
      "pairs": [
        {
          "round": 1,
          "seconds_per_compaction": {
            "separate": 0.000383044265625,
            "joined": 0.000179998703125
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 2,
          "seconds_per_compaction": {
            "joined": 0.00020784375,
            "separate": 0.000383233078125
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 3,
          "seconds_per_compaction": {
            "separate": 0.000355095703125,
            "joined": 0.000167852203125
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 4,
          "seconds_per_compaction": {
            "joined": 0.000178794265625,
            "separate": 0.0003281920625
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 5,
          "seconds_per_compaction": {
            "separate": 0.000330130859375,
            "joined": 0.000160309890625
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 6,
          "seconds_per_compaction": {
            "joined": 0.0001657018125,
            "separate": 0.000302653640625
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 7,
          "seconds_per_compaction": {
            "separate": 0.000303725265625,
            "joined": 0.000161675140625
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 8,
          "seconds_per_compaction": {
            "joined": 0.0001763111875,
            "separate": 0.000310591796875
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 9,
          "seconds_per_compaction": {
            "separate": 0.00032713346875,
            "joined": 0.000163004546875
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 10,
          "seconds_per_compaction": {
            "joined": 0.00016670703125,
            "separate": 0.0002944798125
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 11,
          "seconds_per_compaction": {
            "separate": 0.000322814453125,
            "joined": 0.000163313140625
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 12,
          "seconds_per_compaction": {
            "joined": 0.0001766139375,
            "separate": 0.000311645828125
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 13,
          "seconds_per_compaction": {
            "separate": 0.00031534765625,
            "joined": 0.00016431640625
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 14,
          "seconds_per_compaction": {
            "joined": 0.000176435546875,
            "separate": 0.000310817703125
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 15,
          "seconds_per_compaction": {
            "separate": 0.000321379546875,
            "joined": 0.000162848953125
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 16,
          "seconds_per_compaction": {
            "joined": 0.00017407096875,
            "separate": 0.00031581640625
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        }
      ],
      "summary": {
        "clean_pairs": 16,
        "minimum_pairs": 5,
        "median_separate_seconds": 0.00031859797656250003,
        "median_joined_seconds": 0.0001672796171875,
        "median_paired_reduction_percent": 46.26749439821745
      }
    },
    {
      "parent_prompt_rows": 256,
      "pairs": [
        {
          "round": 1,
          "seconds_per_compaction": {
            "separate": 0.000325162109375,
            "joined": 0.000161580078125
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 2,
          "seconds_per_compaction": {
            "joined": 0.000167602203125,
            "separate": 0.000293953125
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 3,
          "seconds_per_compaction": {
            "separate": 0.000309561203125,
            "joined": 0.0001566640625
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 4,
          "seconds_per_compaction": {
            "joined": 0.00017463803125,
            "separate": 0.00030245834375
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 5,
          "seconds_per_compaction": {
            "separate": 0.000320669921875,
            "joined": 0.000153264984375
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 6,
          "seconds_per_compaction": {
            "joined": 0.0001751875,
            "separate": 0.000309758453125
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 7,
          "seconds_per_compaction": {
            "separate": 0.00030878125,
            "joined": 0.000163134125
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 8,
          "seconds_per_compaction": {
            "joined": 0.000169337234375,
            "separate": 0.000302220046875
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 9,
          "seconds_per_compaction": {
            "separate": 0.0003230703125,
            "joined": 0.00015759375
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 10,
          "seconds_per_compaction": {
            "joined": 0.0001756705625,
            "separate": 0.000315490875
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 11,
          "seconds_per_compaction": {
            "separate": 0.000320727859375,
            "joined": 0.00016003515625
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 12,
          "seconds_per_compaction": {
            "joined": 0.0001593860625,
            "separate": 0.000315431640625
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 13,
          "seconds_per_compaction": {
            "separate": 0.000312985015625,
            "joined": 0.00015382096875
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 14,
          "seconds_per_compaction": {
            "joined": 0.0001676985625,
            "separate": 0.000313533203125
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 15,
          "seconds_per_compaction": {
            "separate": 0.000314146484375,
            "joined": 0.000141838546875
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 16,
          "seconds_per_compaction": {
            "joined": 0.00017435546875,
            "separate": 0.000315510421875
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        }
      ],
      "summary": {
        "clean_pairs": 16,
        "minimum_pairs": 5,
        "median_separate_seconds": 0.00031383984375,
        "median_joined_seconds": 0.0001623571015625,
        "median_paired_reduction_percent": 48.279977253399764
      }
    },
    {
      "parent_prompt_rows": 4096,
      "pairs": [
        {
          "round": 1,
          "seconds_per_compaction": {
            "separate": 0.00031966665625,
            "joined": 0.00016659440625
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 2,
          "seconds_per_compaction": {
            "joined": 0.000164537765625,
            "separate": 0.00029387825
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 3,
          "seconds_per_compaction": {
            "separate": 0.0002823951875,
            "joined": 0.000159260421875
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 4,
          "seconds_per_compaction": {
            "joined": 0.000174971359375,
            "separate": 0.000290756515625
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 5,
          "seconds_per_compaction": {
            "separate": 0.00030739584375,
            "joined": 0.000150643890625
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 6,
          "seconds_per_compaction": {
            "joined": 0.000161032546875,
            "separate": 0.000305260421875
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 7,
          "seconds_per_compaction": {
            "separate": 0.000319574875,
            "joined": 0.00016166796875
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 8,
          "seconds_per_compaction": {
            "joined": 0.0001779016875,
            "separate": 0.000313027984375
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 9,
          "seconds_per_compaction": {
            "separate": 0.000327453125,
            "joined": 0.000161512375
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 10,
          "seconds_per_compaction": {
            "joined": 0.000175979171875,
            "separate": 0.00030918684375
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 11,
          "seconds_per_compaction": {
            "separate": 0.00031986653125,
            "joined": 0.000164385421875
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 12,
          "seconds_per_compaction": {
            "joined": 0.000172951171875,
            "separate": 0.00031177865625
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 13,
          "seconds_per_compaction": {
            "separate": 0.000321927734375,
            "joined": 0.000163955734375
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 14,
          "seconds_per_compaction": {
            "joined": 0.000177785796875,
            "separate": 0.00031091015625
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 15,
          "seconds_per_compaction": {
            "separate": 0.00032361328125,
            "joined": 0.00016146615625
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        },
        {
          "round": 16,
          "seconds_per_compaction": {
            "joined": 0.00017421028125,
            "separate": 0.0003039889375
          },
          "before_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "after_vm": {
            "swapins": 44114981,
            "swapouts": 77536098
          },
          "eligible": true
        }
      ],
      "summary": {
        "clean_pairs": 16,
        "minimum_pairs": 5,
        "median_separate_seconds": 0.00031134440624999997,
        "median_joined_seconds": 0.00016446159374999998,
        "median_paired_reduction_percent": 45.88753198959179
      }
    }
  ],
  "edge_cases": 12,
  "elapsed_seconds": 2.028252874966711,
  "allocator_peak_bytes": 336183310
}
````

## /tmp/slotstream-optimization-execution/compact-window-sync-v301/manifest.json

SHA-256 `514b5582ffbbbaf9d536c8e1fc0b8718ff48b8c77e8762c0ebe69c2875217b9c`; 5325 bytes.

````text
{
  "passed": true,
  "protocol_sha256": "a71bc2dd622019f652e2e2b3408848764f459607ab8931566a4268daeb1c2a6b",
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 26839187456,
    "swapins": 44114981,
    "swapouts": 77536098,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   470591.\nPages active:                                 810601.\nPages inactive:                               649218.\nPages speculative:                            174786.\nPages throttled:                                   0.\nPages wired down:                             215185.\nPages purgeable:                                7040.\n\"Translation faults\":                    15847295981.\nPages copy-on-write:                       776399794.\nPages zero filled:                       21755575630.\nPages reactivated:                        3568122647.\nPages purged:                               74706113.\nFile-backed pages:                           1160503.\nAnonymous pages:                              474102.\nPages stored in compressor:                  1924018.\nPages occupied by compressor:                 762595.\nDecompressions:                           1197908485.\nCompressions:                             1515613636.\nPageins:                                  7812880788.\nPageouts:                                   11174411.\nSwapins:                                    44114981.\nSwapouts:                                   77536098.\nPages tagged:                                 172803.\nPages tagged resident:                        112892.\nPages tagged compressed:                       59911.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6911.\nPages tag-storage free:                         2231.\nPages tag-storage non-tag pageable:            89154.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9384896.\nTagged compressions:                        11571480.\nTagged decompressions:                      10660899.\n"
  },
  "exit_code": 0,
  "summaries": [
    {
      "parent_prompt_rows": 17,
      "clean_pairs": 16,
      "minimum_pairs": 5,
      "median_separate_seconds": 0.00031859797656250003,
      "median_joined_seconds": 0.0001672796171875,
      "median_paired_reduction_percent": 46.26749439821745
    },
    {
      "parent_prompt_rows": 256,
      "clean_pairs": 16,
      "minimum_pairs": 5,
      "median_separate_seconds": 0.00031383984375,
      "median_joined_seconds": 0.0001623571015625,
      "median_paired_reduction_percent": 48.279977253399764
    },
    {
      "parent_prompt_rows": 4096,
      "clean_pairs": 16,
      "minimum_pairs": 5,
      "median_separate_seconds": 0.00031134440624999997,
      "median_joined_seconds": 0.00016446159374999998,
      "median_paired_reduction_percent": 45.88753198959179
    }
  ],
  "elapsed_seconds": 2.368355542,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 26843922432,
    "swapins": 44114981,
    "swapouts": 77536098,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   471824.\nPages active:                                 810216.\nPages inactive:                               649278.\nPages speculative:                            175187.\nPages throttled:                                   0.\nPages wired down:                             214676.\nPages purgeable:                                5016.\n\"Translation faults\":                    15847444278.\nPages copy-on-write:                       776434196.\nPages zero filled:                       21755640420.\nPages reactivated:                        3568122796.\nPages purged:                               74706113.\nFile-backed pages:                           1161583.\nAnonymous pages:                              473098.\nPages stored in compressor:                  1923265.\nPages occupied by compressor:                 762314.\nDecompressions:                           1197909238.\nCompressions:                             1515613636.\nPageins:                                  7812881823.\nPageouts:                                   11174411.\nSwapins:                                    44114981.\nSwapouts:                                   77536098.\nPages tagged:                                 172731.\nPages tagged resident:                        113168.\nPages tagged compressed:                       59563.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6911.\nPages tag-storage free:                         2201.\nPages tag-storage non-tag pageable:            89184.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9308928.\nTagged compressions:                        11571480.\nTagged decompressions:                      10661247.\n"
  },
  "pressure": {
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
  "identity_unchanged": true,
  "remaining_jobs": [],
  "model_lock_free": true,
  "within_reservation": true
}
````

## /tmp/slotstream-optimization-execution/compact-window-sync-v301/preparation.json

SHA-256 `06ab873234b3ac7643e07cbc4b92a481d89685f1bb3533afca30a6c081d9ceb6`; 1004 bytes.

````text
{
  "probe_sha256": "ff76531842e27a1bed5a28a848a51b4fc520191219f700c11e1ddd7216689057",
  "config_sha256": "0da22a8ed4323fbe969bf982aeb054743b315206791f28ef74a309c707080ba5",
  "scope": "Component exploration only. Existing library0.31.1 and exact geometry; two separate eval calls versus a joined eval. No inference, no source change, no serving gain or memory-capacity inference.",
  "fixed_prompt_lengths": [
    17,
    256,
    4096
  ],
  "fixed_pairs_per_length": 16,
  "iterations_per_arm": 64,
  "warmup_batches_per_arm": 1,
  "minimum_clean_pairs": 5,
  "runtime_or_compiler_launched": false,
  "remaining_requirement": "Run under an ownership/deadline/normal-pressure guard only after the active portable native process has drained.",
  "prior_probe_sha256": "dccef27bdd73d45debde47d98d466b81a5f9e180559bb2787faf2a51cf0e0213",
  "version_binding": "Pin via installed distribution metadata; core module version attribute is not part of its stub API. Corrected before any MLX runtime launch."
}
````

## /tmp/slotstream-optimization-execution/compact-window-sync-v301/probe-before-version-binding.py

SHA-256 `dccef27bdd73d45debde47d98d466b81a5f9e180559bb2787faf2a51cf0e0213`; 5390 bytes.

````text
"""Bounded component probe; Python overhead is not Swift serving evidence."""
from pathlib import Path
import gc
import hashlib
import json
import statistics
import sys
import time
import mlx.core as mx

R = Path('/Users/carlos/Projects/slotstream')
P = Path(__file__).parent
sys.path.insert(0, str(R / 'Tools'))
from prefill_bench import vm_snapshot
from optimization_readiness import pressure_snapshot, require_normal

assert mx.__version__ == '0.31.1', mx.__version__
mx.set_cache_limit(64 * 1024 * 1024)
config = json.loads(Path('/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/config.json').read_text())
config = config.get('text_config', config)
conv_width = 2 * config['linear_num_key_heads'] * config['linear_key_head_dim'] + config['linear_num_value_heads'] * config['linear_value_head_dim']
ple_width = config['hc_count'] * config['hidden_size']
conv_rows = config['linear_conv_kernel_dim'] - 1
ple_rows = (config['ple_conv_kernel_size'] - 1) * config['ngram_size']


def compact(a, b, joined):
    ca = mx.contiguous(a) if a is not None else None
    cb = mx.contiguous(b) if b is not None else None
    if joined:
        windows = [x for x in (ca, cb) if x is not None]
        if windows: mx.eval(windows)
    else:
        if ca is not None: mx.eval(ca)
        if cb is not None: mx.eval(cb)
    return ca, cb


def parent(rows, width):
    result = ((mx.arange(rows * width, dtype=mx.int32) % 64).astype(mx.bfloat16) / 64).reshape(1, rows, width)
    mx.eval(result)
    return result


def timed(a, b, joined):
    begin = time.perf_counter_ns()
    for _ in range(64):
        result = compact(a, b, joined)
    elapsed = (time.perf_counter_ns() - begin) / 1e9
    return elapsed / 64, result


result = {'passed': False, 'classification': 'Interleaved array-component timing using pinned Python MLX0.31.1 and the exact retained-window geometry. Only eval grouping changes. These timings include Python/C binding overhead and cannot establish a Swift or end-to-end inference improvement.',
          'mlx_version': mx.__version__, 'geometry': {'conv_width': conv_width, 'conv_rows': conv_rows, 'ple_width': ple_width, 'ple_rows': ple_rows},
          'model_loaded': False, 'runtime_changed': False, 'cases': [], 'edge_cases': 0}
started = time.monotonic()
try:
    for length in [17, 256, 4096]:
        pa, pb = parent(length + conv_rows, conv_width), parent(length + ple_rows, ple_width)
        a, b = pa[:, -conv_rows:, :], pb[:, -ple_rows:, :]
        for va, vb in [(None, None), (a, None), (None, b), (a, b)]:
            old, new = compact(va, vb, False), compact(va, vb, True)
            for x, y in zip(old, new):
                assert (x is None) == (y is None)
                if x is not None:
                    assert x.shape == y.shape and x.dtype == y.dtype
                    assert bool(mx.array_equal(x, y).item())
            result['edge_cases'] += 1
        for joined in [False, True]: timed(a, b, joined)
        case = {'parent_prompt_rows': length, 'pairs': [], 'summary': None}
        result['cases'].append(case)
        for round_number in range(1, 17):
            before = vm_snapshot()
            require_normal(pressure_snapshot())
            row = {'round': round_number, 'seconds_per_compaction': {}}
            for joined in ([False, True] if round_number % 2 else [True, False]):
                seconds, values = timed(a, b, joined)
                row['seconds_per_compaction']['joined' if joined else 'separate'] = seconds
                for x, expected in zip(values, (a, b)):
                    assert x.shape == expected.shape and x.dtype == expected.dtype
                    assert bool(mx.array_equal(x, expected).item())
            after = vm_snapshot()
            require_normal(pressure_snapshot())
            row['before_vm'] = {k: before[k] for k in ['swapins', 'swapouts']}
            row['after_vm'] = {k: after[k] for k in ['swapins', 'swapouts']}
            row['eligible'] = row['before_vm'] == row['after_vm']
            case['pairs'].append(row)
        eligible = [row['seconds_per_compaction'] for row in case['pairs'] if row['eligible']]
        case['summary'] = {'clean_pairs': len(eligible), 'minimum_pairs': 5,
            'median_separate_seconds': statistics.median(r['separate'] for r in eligible) if len(eligible) >= 5 else None,
            'median_joined_seconds': statistics.median(r['joined'] for r in eligible) if len(eligible) >= 5 else None,
            'median_paired_reduction_percent': statistics.median(100 * (1 - r['joined'] / r['separate']) for r in eligible) if len(eligible) >= 5 else None}
        print(json.dumps({'length': length, **case['summary']}), flush=True)
        del pa, pb, a, b, old, new, values, x, y, va, vb, expected
        gc.collect()
    result['passed'] = all(c['summary']['clean_pairs'] >= 5 for c in result['cases'])
except BaseException as error:
    result['error'] = f'{type(error).__name__}: {error}'
finally:
    result['elapsed_seconds'] = time.monotonic() - started
    result['allocator_peak_bytes'] = mx.get_peak_memory()
    (P / 'component-result.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps({'passed': result['passed'], 'error': result.get('error'), 'edge_cases': result['edge_cases'], 'elapsed_seconds': result['elapsed_seconds']}), flush=True)
raise SystemExit(0 if result['passed'] else 1)
````

## /tmp/slotstream-optimization-execution/compact-window-sync-v301/probe.py

SHA-256 `ff76531842e27a1bed5a28a848a51b4fc520191219f700c11e1ddd7216689057`; 5439 bytes.

````text
"""Bounded component probe; Python overhead is not Swift serving evidence."""
from pathlib import Path
import gc
import importlib.metadata
import hashlib
import json
import statistics
import sys
import time
import mlx.core as mx

R = Path('/Users/carlos/Projects/slotstream')
P = Path(__file__).parent
sys.path.insert(0, str(R / 'Tools'))
from prefill_bench import vm_snapshot
from optimization_readiness import pressure_snapshot, require_normal

version = importlib.metadata.version('mlx')
assert version == '0.31.1', version
mx.set_cache_limit(64 * 1024 * 1024)
config = json.loads(Path('/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/config.json').read_text())
config = config.get('text_config', config)
conv_width = 2 * config['linear_num_key_heads'] * config['linear_key_head_dim'] + config['linear_num_value_heads'] * config['linear_value_head_dim']
ple_width = config['hc_count'] * config['hidden_size']
conv_rows = config['linear_conv_kernel_dim'] - 1
ple_rows = (config['ple_conv_kernel_size'] - 1) * config['ngram_size']


def compact(a, b, joined):
    ca = mx.contiguous(a) if a is not None else None
    cb = mx.contiguous(b) if b is not None else None
    if joined:
        windows = [x for x in (ca, cb) if x is not None]
        if windows: mx.eval(windows)
    else:
        if ca is not None: mx.eval(ca)
        if cb is not None: mx.eval(cb)
    return ca, cb


def parent(rows, width):
    result = ((mx.arange(rows * width, dtype=mx.int32) % 64).astype(mx.bfloat16) / 64).reshape(1, rows, width)
    mx.eval(result)
    return result


def timed(a, b, joined):
    begin = time.perf_counter_ns()
    for _ in range(64):
        result = compact(a, b, joined)
    elapsed = (time.perf_counter_ns() - begin) / 1e9
    return elapsed / 64, result


result = {'passed': False, 'classification': 'Interleaved array-component timing using pinned Python MLX0.31.1 and the exact retained-window geometry. Only eval grouping changes. These timings include Python/C binding overhead and cannot establish a Swift or end-to-end inference improvement.',
          'mlx_version': version, 'geometry': {'conv_width': conv_width, 'conv_rows': conv_rows, 'ple_width': ple_width, 'ple_rows': ple_rows},
          'model_loaded': False, 'runtime_changed': False, 'cases': [], 'edge_cases': 0}
started = time.monotonic()
try:
    for length in [17, 256, 4096]:
        pa, pb = parent(length + conv_rows, conv_width), parent(length + ple_rows, ple_width)
        a, b = pa[:, -conv_rows:, :], pb[:, -ple_rows:, :]
        for va, vb in [(None, None), (a, None), (None, b), (a, b)]:
            old, new = compact(va, vb, False), compact(va, vb, True)
            for x, y in zip(old, new):
                assert (x is None) == (y is None)
                if x is not None:
                    assert x.shape == y.shape and x.dtype == y.dtype
                    assert bool(mx.array_equal(x, y).item())
            result['edge_cases'] += 1
        for joined in [False, True]: timed(a, b, joined)
        case = {'parent_prompt_rows': length, 'pairs': [], 'summary': None}
        result['cases'].append(case)
        for round_number in range(1, 17):
            before = vm_snapshot()
            require_normal(pressure_snapshot())
            row = {'round': round_number, 'seconds_per_compaction': {}}
            for joined in ([False, True] if round_number % 2 else [True, False]):
                seconds, values = timed(a, b, joined)
                row['seconds_per_compaction']['joined' if joined else 'separate'] = seconds
                for x, expected in zip(values, (a, b)):
                    assert x.shape == expected.shape and x.dtype == expected.dtype
                    assert bool(mx.array_equal(x, expected).item())
            after = vm_snapshot()
            require_normal(pressure_snapshot())
            row['before_vm'] = {k: before[k] for k in ['swapins', 'swapouts']}
            row['after_vm'] = {k: after[k] for k in ['swapins', 'swapouts']}
            row['eligible'] = row['before_vm'] == row['after_vm']
            case['pairs'].append(row)
        eligible = [row['seconds_per_compaction'] for row in case['pairs'] if row['eligible']]
        case['summary'] = {'clean_pairs': len(eligible), 'minimum_pairs': 5,
            'median_separate_seconds': statistics.median(r['separate'] for r in eligible) if len(eligible) >= 5 else None,
            'median_joined_seconds': statistics.median(r['joined'] for r in eligible) if len(eligible) >= 5 else None,
            'median_paired_reduction_percent': statistics.median(100 * (1 - r['joined'] / r['separate']) for r in eligible) if len(eligible) >= 5 else None}
        print(json.dumps({'length': length, **case['summary']}), flush=True)
        del pa, pb, a, b, old, new, values, x, y, va, vb, expected
        gc.collect()
    result['passed'] = all(c['summary']['clean_pairs'] >= 5 for c in result['cases'])
except BaseException as error:
    result['error'] = f'{type(error).__name__}: {error}'
finally:
    result['elapsed_seconds'] = time.monotonic() - started
    result['allocator_peak_bytes'] = mx.get_peak_memory()
    (P / 'component-result.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps({'passed': result['passed'], 'error': result.get('error'), 'edge_cases': result['edge_cases'], 'elapsed_seconds': result['elapsed_seconds']}), flush=True)
raise SystemExit(0 if result['passed'] else 1)
````

## /tmp/slotstream-optimization-execution/compact-window-sync-v301/protocol.json

SHA-256 `a71bc2dd622019f652e2e2b3408848764f459607ab8931566a4268daeb1c2a6b`; 1770 bytes.

````text
{
  "classification": "Small array component exploration only; no model, compilation, runtime change or serving-speed claim.",
  "deadline_utc": "2026-09-07T12:25:00Z",
  "identity": {
    "/Users/carlos/Projects/slotstream/.venv31/lib/python3.12/site-packages/mlx/core.cpython-312-darwin.so": "3ec832345b8dfdcc8cabe2335040628584e1bff6b38c45d51e58992a24c95d36",
    "/Users/carlos/Projects/slotstream/.venv31/lib/python3.12/site-packages/mlx/lib/libmlx.dylib": "e0dacaec414323e43010ade1b464214c837ebe82ca72465e897c1912fdfdc601",
    "/Users/carlos/Projects/slotstream/.venv31/lib/python3.12/site-packages/mlx/lib/mlx.metallib": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
    "/tmp/slotstream-optimization-execution/compact-window-sync-v301/probe.py": "ff76531842e27a1bed5a28a848a51b4fc520191219f700c11e1ddd7216689057",
    "/Users/carlos/Projects/slotstream/.venv31/lib/python3.12/site-packages/mlx-0.31.1.dist-info/METADATA": "7aad63c2b959429d42454ed2d90adb00ba40f333dd4e2b79cd40728c09b69276",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/config.json": "0da22a8ed4323fbe969bf982aeb054743b315206791f28ef74a309c707080ba5"
  },
  "wrapper_sha256": "15142ea1b7d8e40b328f3796b13ae144170ee5e0cf0b7e8af13561ef03960f13",
  "policy": {
    "startup_reclaimable_bytes": 3000000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 2000000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 90,
    "stop_on_new_swapouts": true
  },
  "command": [
    "/Users/carlos/Projects/slotstream/.venv31/bin/python",
    "/tmp/slotstream-optimization-execution/compact-window-sync-v301/probe.py"
  ],
  "preparation_sha256": "06ab873234b3ac7643e07cbc4b92a481d89685f1bb3533afca30a6c081d9ceb6"
}
````

## /tmp/slotstream-optimization-execution/compact-window-sync-v301/run.py

SHA-256 `15142ea1b7d8e40b328f3796b13ae144170ee5e0cf0b7e8af13561ef03960f13`; 3901 bytes.

````text
from pathlib import Path
import datetime
import json
import os
import signal
import sys
import time

R = Path('/Users/carlos/Projects/slotstream')
P = Path(__file__).parent
sys.path.insert(0, str(R / 'Tools'))
from prefill_bench import digest, preflight, vm_snapshot
from serve_bench import competing_jobs
from optimization_readiness import pressure_snapshot, require_normal
from optimization_serial_build import guarded_run

deadline = datetime.datetime.fromisoformat(sys.argv[1].replace('Z', '+00:00')).timestamp()
remaining = int(deadline - time.time() - 30)
if remaining < 90: raise RuntimeError('component probe requires90reserved seconds plus cleanup')
site = R / '.venv31/lib/python3.12/site-packages'
files = sorted([p for p in (site / 'mlx').rglob('*') if p.is_file() and p.suffix in ['.so', '.dylib', '.metallib']])
files += [P / 'probe.py', site / 'mlx-0.31.1.dist-info/METADATA',
          Path('/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/config.json')]
identity = {str(p): digest(p) for p in files}
policy = {'startup_reclaimable_bytes': 3_000_000_000, 'minimum_live_reclaimable_bytes': 3_000_000_000,
    'maximum_owned_rss_bytes': 2_000_000_000, 'sample_interval_seconds': .2,
    'maximum_build_seconds': min(90, remaining), 'stop_on_new_swapouts': True}
s = {'classification': 'Small array component exploration only; no model, compilation, runtime change or serving-speed claim.',
     'deadline_utc': sys.argv[1], 'identity': identity, 'wrapper_sha256': digest(Path(__file__)),
     'policy': policy, 'command': [str(R / '.venv31/bin/python'), str(P / 'probe.py')],
     'preparation_sha256': digest(P / 'preparation.json')}
with (P / 'protocol.json').open('x') as out: out.write(json.dumps(s, indent=2) + '\n')
r = {'passed': False, 'protocol_sha256': digest(P / 'protocol.json')}
begin = time.monotonic()
def interrupted(number, _): raise KeyboardInterrupt(f'component interrupted by signal{number}')
signal.signal(signal.SIGINT, interrupted)
signal.signal(signal.SIGTERM, interrupted)
def snapshot():
    state = vm_snapshot()
    require_normal(pressure_snapshot())
    return state
try:
    r['before'] = preflight(3)
    snapshot()
    assert not competing_jobs()
    with (P / 'stdout.txt').open('w') as out, (P / 'stderr.txt').open('w') as err:
        result = guarded_run(s['command'], cwd=R, stdout=out, stderr=err,
            record_path=P / 'ownership-memory.json', snapshot=snapshot, policy=policy,
            classification=s['classification'])
    r['exit_code'] = result.returncode
    report = json.loads((P / 'component-result.json').read_text())
    r['passed'] = result.returncode == 0 and report['passed'] is True
    r['summaries'] = [{'parent_prompt_rows': c['parent_prompt_rows'], **c['summary']} for c in report['cases']]
except BaseException as error:
    r['error'] = f'{type(error).__name__}: {error}'
finally:
    r['elapsed_seconds'] = time.monotonic() - begin
    (P / 'manifest.json').write_text(json.dumps(r, indent=2) + '\n')
    for key, function in {'after': vm_snapshot, 'pressure': pressure_snapshot,
        'identity_unchanged': lambda: all(digest(Path(p)) == h for p, h in identity.items()),
        'remaining_jobs': competing_jobs, 'model_lock_free': lambda: bool(preflight(0))}.items():
        try: r[key] = function()
        except BaseException as error: r.setdefault('cleanup_errors', {})[key] = str(error)
    r['within_reservation'] = time.time() <= deadline
    r['passed'] = bool(r['passed'] and not r.get('cleanup_errors') and r.get('identity_unchanged')
        and not r.get('remaining_jobs') and r.get('model_lock_free')
        and r.get('pressure', {}).get('level') == 1 and r['within_reservation'])
    (P / 'manifest.json').write_text(json.dumps(r, indent=2) + '\n')
print(json.dumps({k: v for k, v in r.items() if k not in ['before', 'after']}), flush=True)
raise SystemExit(0 if r['passed'] else 1)
````

## /tmp/slotstream-optimization-execution/compact-window-sync-v301/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/compact-window-sync-v301/stdout.txt

SHA-256 `063458fa012279dc3e12f840da0ef75730197506a7b4fc1b939045aeb1923f57`; 702 bytes.

````text
{"length": 17, "clean_pairs": 16, "minimum_pairs": 5, "median_separate_seconds": 0.00031859797656250003, "median_joined_seconds": 0.0001672796171875, "median_paired_reduction_percent": 46.26749439821745}
{"length": 256, "clean_pairs": 16, "minimum_pairs": 5, "median_separate_seconds": 0.00031383984375, "median_joined_seconds": 0.0001623571015625, "median_paired_reduction_percent": 48.279977253399764}
{"length": 4096, "clean_pairs": 16, "minimum_pairs": 5, "median_separate_seconds": 0.00031134440624999997, "median_joined_seconds": 0.00016446159374999998, "median_paired_reduction_percent": 45.88753198959179}
{"passed": true, "error": null, "edge_cases": 12, "elapsed_seconds": 2.028252874966711}
````

