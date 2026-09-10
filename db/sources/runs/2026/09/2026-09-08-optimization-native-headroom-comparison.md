---
type: run
id: 01m1zmjxsfhe71aqmn9pte3vwj
created: 2026-09-08T04:31:56.207184+00:00
updated: 2026-09-08T04:31:56.498192+00:00
summary: Native pressure stop compared with the prior successful launch
binary: V349 7fb2cc0c6cccf93e8a589d02ce5aa839eea38140a1cb8f44cefeb10ec3f472f6; model-free comparison/preparation
captured_at: 2026-09-08
command: Read-only comparison of recorded native resource observations and the actual integrated diagnostic source
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Native pressure stop compared with the prior successful launch
tool: Slotstream local qualification and exact artifact capture
---
The prior V304 ordinary native pass began at 22,189,686,784 reclaimable bytes; V350 began at 15,558,950,912 and stopped on OS pressure. Both retain the original reference model pool of640 slots,256-row compute pass,64MiB prefill cache cap and128MiB global allocator cache cap. The different-build runs are not a controlled causal comparison and establish no guaranteed minimum. As an additional conservative readiness condition, a future full native attempt will require at least22.2GB reclaimable, a meaningful resource change, a fresh explicit grant and all existing live/OS-pressure guards. The original failed identity cannot retry. No app is closed, no live model runs here, and no runtime allocation bug is inferred from aggregate pressure. Exact source and observations follow.

## Exact artifact inventory

```json
[
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v350/combined-plain/memory.json",
    "bytes": 43879,
    "sha256": "9c149033cd0ef36de483e11d1b0bc97d0027d901daa7d825badf09026bdebbd6"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-campaign-v305/native/combined-plain/evidence/memory.json",
    "bytes": 238966,
    "sha256": "2ce21c1ee8727c738601e2f0102ee2776339aca07423dfd4c9f9e116dba69400"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift",
    "bytes": 22051,
    "sha256": "512dd096a194f8c56f1d9be16931714035150ca54cbb02cbbb9d0aec5871657d"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/native-headroom-comparison-v351.json",
    "bytes": 1772,
    "sha256": "5f394cc5c06b669fc9ce968475766088caf17ef9873bf559d16e46d51bd5dc2e"
  }
]
```

## Artifact SHA-256 9c149033cd0ef36de483e11d1b0bc97d0027d901daa7d825badf09026bdebbd6

Encoding: `utf-8`. Original bytes: 43879.

````````````text
{
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "integrated",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "policy": {
    "startup_reclaimable_bytes": 13000000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 10000000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 900,
    "stop_on_new_swapouts": false
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 15558950912,
    "swapins": 44130047,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    92431.\nPages active:                                1005889.\nPages inactive:                               951688.\nPages speculative:                             72043.\nPages throttled:                                   0.\nPages wired down:                             226877.\nPages purgeable:                               19124.\n\"Translation faults\":                    16889585468.\nPages copy-on-write:                       875479433.\nPages zero filled:                       22664015359.\nPages reactivated:                        3736554280.\nPages purged:                               79173481.\nFile-backed pages:                            838088.\nAnonymous pages:                             1191532.\nPages stored in compressor:                  1622385.\nPages occupied by compressor:                 736126.\nDecompressions:                           1278877611.\nCompressions:                             1602412867.\nPageins:                                  8057003180.\nPageouts:                                   11392302.\nSwapins:                                    44130047.\nSwapouts:                                   77538158.\nPages tagged:                                 179661.\nPages tagged resident:                        139670.\nPages tagged compressed:                       39991.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6992.\nPages tag-storage free:                          414.\nPages tag-storage non-tag pageable:            90890.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6392640.\nTagged compressions:                        12437748.\nTagged decompressions:                      11486774.\n"
  },
  "samples": [
    {
      "elapsed_seconds": 0.0017632500000000217,
      "owned_rss_bytes": 32768,
      "owned_process_count": 1,
      "reclaimable_bytes": 15559868416,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 0.22521625,
      "owned_rss_bytes": 32768,
      "owned_process_count": 1,
      "reclaimable_bytes": 15558328320,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 0.47415366700000006,
      "owned_rss_bytes": 32768,
      "owned_process_count": 1,
      "reclaimable_bytes": 15347712000,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 0.709091542,
      "owned_rss_bytes": 807600128,
      "owned_process_count": 1,
      "reclaimable_bytes": 14225752064,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 0.949518625,
      "owned_rss_bytes": 3890708480,
      "owned_process_count": 1,
      "reclaimable_bytes": 9628434432,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 1.1842115830000002,
      "owned_rss_bytes": 4198989824,
      "owned_process_count": 1,
      "reclaimable_bytes": 9383886848,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 1.421932125,
      "owned_rss_bytes": 4237688832,
      "owned_process_count": 1,
      "reclaimable_bytes": 9387851776,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 1.6527820000000002,
      "owned_rss_bytes": 4278255616,
      "owned_process_count": 1,
      "reclaimable_bytes": 9375662080,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 1.888935917,
      "owned_rss_bytes": 4278550528,
      "owned_process_count": 1,
      "reclaimable_bytes": 9350316032,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 2.125801125,
      "owned_rss_bytes": 4288561152,
      "owned_process_count": 1,
      "reclaimable_bytes": 9332342784,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 2.3521847080000002,
      "owned_rss_bytes": 4417437696,
      "owned_process_count": 1,
      "reclaimable_bytes": 9313878016,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 2.584098542,
      "owned_rss_bytes": 4392697856,
      "owned_process_count": 1,
      "reclaimable_bytes": 9375285248,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 2.817232042,
      "owned_rss_bytes": 4394057728,
      "owned_process_count": 1,
      "reclaimable_bytes": 9365553152,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 3.04362325,
      "owned_rss_bytes": 4394106880,
      "owned_process_count": 1,
      "reclaimable_bytes": 9354166272,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 3.268999167,
      "owned_rss_bytes": 4394156032,
      "owned_process_count": 1,
      "reclaimable_bytes": 9348743168,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 3.497856833,
      "owned_rss_bytes": 4394270720,
      "owned_process_count": 1,
      "reclaimable_bytes": 9333538816,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 3.7268049580000002,
      "owned_rss_bytes": 4394385408,
      "owned_process_count": 1,
      "reclaimable_bytes": 9320333312,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 3.9539520830000003,
      "owned_rss_bytes": 4394614784,
      "owned_process_count": 1,
      "reclaimable_bytes": 9310502912,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 4.177516832999999,
      "owned_rss_bytes": 4394926080,
      "owned_process_count": 1,
      "reclaimable_bytes": 9315336192,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 4.404545375,
      "owned_rss_bytes": 4395089920,
      "owned_process_count": 1,
      "reclaimable_bytes": 9472933888,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 4.633456417,
      "owned_rss_bytes": 4395302912,
      "owned_process_count": 1,
      "reclaimable_bytes": 9493708800,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 4.866548333,
      "owned_rss_bytes": 4395532288,
      "owned_process_count": 1,
      "reclaimable_bytes": 9494167552,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 5.090338,
      "owned_rss_bytes": 4395761664,
      "owned_process_count": 1,
      "reclaimable_bytes": 9490694144,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 5.315073792,
      "owned_rss_bytes": 4817977344,
      "owned_process_count": 1,
      "reclaimable_bytes": 9281060864,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 5.5490144169999995,
      "owned_rss_bytes": 4800757760,
      "owned_process_count": 1,
      "reclaimable_bytes": 9284943872,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 5.790845999999999,
      "owned_rss_bytes": 4771971072,
      "owned_process_count": 1,
      "reclaimable_bytes": 9275293696,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 6.030637583,
      "owned_rss_bytes": 4860526592,
      "owned_process_count": 1,
      "reclaimable_bytes": 9306931200,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 6.283548499999999,
      "owned_rss_bytes": 3965206528,
      "owned_process_count": 1,
      "reclaimable_bytes": 9204023296,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 6.5151052499999995,
      "owned_rss_bytes": 3967107072,
      "owned_process_count": 1,
      "reclaimable_bytes": 9392881664,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 6.7536165,
      "owned_rss_bytes": 3968188416,
      "owned_process_count": 1,
      "reclaimable_bytes": 9315909632,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 6.988062875,
      "owned_rss_bytes": 3969105920,
      "owned_process_count": 1,
      "reclaimable_bytes": 9157181440,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 7.217376832999999,
      "owned_rss_bytes": 3969122304,
      "owned_process_count": 1,
      "reclaimable_bytes": 9219883008,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 7.446943167,
      "owned_rss_bytes": 3969712128,
      "owned_process_count": 1,
      "reclaimable_bytes": 9371107328,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 7.683158625,
      "owned_rss_bytes": 3970023424,
      "owned_process_count": 1,
      "reclaimable_bytes": 9319448576,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 7.917475124999999,
      "owned_rss_bytes": 3970629632,
      "owned_process_count": 1,
      "reclaimable_bytes": 9344565248,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 8.150000833,
      "owned_rss_bytes": 3970662400,
      "owned_process_count": 1,
      "reclaimable_bytes": 9311092736,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 8.380771208,
      "owned_rss_bytes": 3970695168,
      "owned_process_count": 1,
      "reclaimable_bytes": 9310044160,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 8.608103625,
      "owned_rss_bytes": 3970777088,
      "owned_process_count": 1,
      "reclaimable_bytes": 9300066304,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 8.841454125,
      "owned_rss_bytes": 3970940928,
      "owned_process_count": 1,
      "reclaimable_bytes": 9345351680,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 9.077714457999999,
      "owned_rss_bytes": 3970580480,
      "owned_process_count": 1,
      "reclaimable_bytes": 9354280960,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 9.304993167,
      "owned_rss_bytes": 4064149504,
      "owned_process_count": 1,
      "reclaimable_bytes": 9492168704,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 9.535495375,
      "owned_rss_bytes": 3957211136,
      "owned_process_count": 1,
      "reclaimable_bytes": 9635250176,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 9.766041458,
      "owned_rss_bytes": 3956768768,
      "owned_process_count": 1,
      "reclaimable_bytes": 9626484736,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 10.006724208,
      "owned_rss_bytes": 3955441664,
      "owned_process_count": 1,
      "reclaimable_bytes": 9575989248,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 10.243814667,
      "owned_rss_bytes": 3955474432,
      "owned_process_count": 1,
      "reclaimable_bytes": 9575940096,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 10.475144083,
      "owned_rss_bytes": 3955507200,
      "owned_process_count": 1,
      "reclaimable_bytes": 9617113088,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 10.707776041999999,
      "owned_rss_bytes": 3955605504,
      "owned_process_count": 1,
      "reclaimable_bytes": 9594273792,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 10.937071625,
      "owned_rss_bytes": 3955736576,
      "owned_process_count": 1,
      "reclaimable_bytes": 9579364352,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 11.170729625,
      "owned_rss_bytes": 3955834880,
      "owned_process_count": 1,
      "reclaimable_bytes": 9659891712,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 11.399209958,
      "owned_rss_bytes": 3955867648,
      "owned_process_count": 1,
      "reclaimable_bytes": 9680945152,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 11.624455667,
      "owned_rss_bytes": 3956326400,
      "owned_process_count": 1,
      "reclaimable_bytes": 9490186240,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 11.8561705,
      "owned_rss_bytes": 3956359168,
      "owned_process_count": 1,
      "reclaimable_bytes": 9347727360,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 12.093097375,
      "owned_rss_bytes": 3956719616,
      "owned_process_count": 1,
      "reclaimable_bytes": 9199353856,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 12.318419458,
      "owned_rss_bytes": 3956490240,
      "owned_process_count": 1,
      "reclaimable_bytes": 9162850304,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 12.544169542,
      "owned_rss_bytes": 3956506624,
      "owned_process_count": 1,
      "reclaimable_bytes": 9208823808,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 12.777773374999999,
      "owned_rss_bytes": 3956523008,
      "owned_process_count": 1,
      "reclaimable_bytes": 9148694528,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 13.01029075,
      "owned_rss_bytes": 3956768768,
      "owned_process_count": 1,
      "reclaimable_bytes": 9309765632,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 13.238287249999999,
      "owned_rss_bytes": 3956867072,
      "owned_process_count": 1,
      "reclaimable_bytes": 9481781248,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 13.462416832999999,
      "owned_rss_bytes": 3956785152,
      "owned_process_count": 1,
      "reclaimable_bytes": 9574760448,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 13.690698874999999,
      "owned_rss_bytes": 3956834304,
      "owned_process_count": 1,
      "reclaimable_bytes": 9418293248,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 13.916096792,
      "owned_rss_bytes": 3956916224,
      "owned_process_count": 1,
      "reclaimable_bytes": 9419702272,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 14.139957875,
      "owned_rss_bytes": 3956998144,
      "owned_process_count": 1,
      "reclaimable_bytes": 9412345856,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 14.3702645,
      "owned_rss_bytes": 3957063680,
      "owned_process_count": 1,
      "reclaimable_bytes": 9416966144,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 14.597622083,
      "owned_rss_bytes": 3957506048,
      "owned_process_count": 1,
      "reclaimable_bytes": 9648570368,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 14.825215542,
      "owned_rss_bytes": 3957473280,
      "owned_process_count": 1,
      "reclaimable_bytes": 10071883776,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 15.064414916999999,
      "owned_rss_bytes": 3957686272,
      "owned_process_count": 1,
      "reclaimable_bytes": 10619191296,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 15.341489958,
      "owned_rss_bytes": 3951869952,
      "owned_process_count": 1,
      "reclaimable_bytes": 11216863232,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 15.615676666999999,
      "owned_rss_bytes": 3944005632,
      "owned_process_count": 1,
      "reclaimable_bytes": 11516936192,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 15.848763083,
      "owned_rss_bytes": 3588997120,
      "owned_process_count": 1,
      "reclaimable_bytes": 11575410688,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 16.091552167,
      "owned_rss_bytes": 3301769216,
      "owned_process_count": 1,
      "reclaimable_bytes": 11780587520,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 16.324478667,
      "owned_rss_bytes": 3309699072,
      "owned_process_count": 1,
      "reclaimable_bytes": 11901960192,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 16.562218667,
      "owned_rss_bytes": 3305160704,
      "owned_process_count": 1,
      "reclaimable_bytes": 12351913984,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 16.819646291999998,
      "owned_rss_bytes": 3307585536,
      "owned_process_count": 1,
      "reclaimable_bytes": 12678905856,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 17.057402958,
      "owned_rss_bytes": 3307601920,
      "owned_process_count": 1,
      "reclaimable_bytes": 12871319552,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 17.293095292,
      "owned_rss_bytes": 2758557696,
      "owned_process_count": 1,
      "reclaimable_bytes": 13006684160,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 17.576867208,
      "owned_rss_bytes": 1889812480,
      "owned_process_count": 1,
      "reclaimable_bytes": 13187022848,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 17.816383208,
      "owned_rss_bytes": 1784512512,
      "owned_process_count": 1,
      "reclaimable_bytes": 13556989952,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 18.066067083,
      "owned_rss_bytes": 1774419968,
      "owned_process_count": 1,
      "reclaimable_bytes": 13754269696,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 18.305508708,
      "owned_rss_bytes": 1726283776,
      "owned_process_count": 1,
      "reclaimable_bytes": 13960560640,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 18.552139458,
      "owned_rss_bytes": 1844756480,
      "owned_process_count": 1,
      "reclaimable_bytes": 13842759680,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 18.784563792,
      "owned_rss_bytes": 1727676416,
      "owned_process_count": 1,
      "reclaimable_bytes": 14150696960,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 19.037294583,
      "owned_rss_bytes": 1727561728,
      "owned_process_count": 1,
      "reclaimable_bytes": 14116798464,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 19.278188583,
      "owned_rss_bytes": 1727922176,
      "owned_process_count": 1,
      "reclaimable_bytes": 14084014080,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 19.5086195,
      "owned_rss_bytes": 1727971328,
      "owned_process_count": 1,
      "reclaimable_bytes": 14286716928,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 19.749315375,
      "owned_rss_bytes": 1728004096,
      "owned_process_count": 1,
      "reclaimable_bytes": 14291681280,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 19.987325417,
      "owned_rss_bytes": 1728053248,
      "owned_process_count": 1,
      "reclaimable_bytes": 14334967808,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 20.225714625,
      "owned_rss_bytes": 1728069632,
      "owned_process_count": 1,
      "reclaimable_bytes": 14241464320,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 20.4579715,
      "owned_rss_bytes": 1728086016,
      "owned_process_count": 1,
      "reclaimable_bytes": 14256275456,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 20.689556708,
      "owned_rss_bytes": 1728282624,
      "owned_process_count": 1,
      "reclaimable_bytes": 14308786176,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 20.926684833,
      "owned_rss_bytes": 1728331776,
      "owned_process_count": 1,
      "reclaimable_bytes": 14326087680,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 21.155274249999998,
      "owned_rss_bytes": 1728331776,
      "owned_process_count": 1,
      "reclaimable_bytes": 14304788480,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 21.389817042,
      "owned_rss_bytes": 1728151552,
      "owned_process_count": 1,
      "reclaimable_bytes": 14334836736,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 21.619770167,
      "owned_rss_bytes": 1728167936,
      "owned_process_count": 1,
      "reclaimable_bytes": 14375239680,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 21.852461083,
      "owned_rss_bytes": 1728331776,
      "owned_process_count": 1,
      "reclaimable_bytes": 14481571840,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 22.081923833,
      "owned_rss_bytes": 1728364544,
      "owned_process_count": 1,
      "reclaimable_bytes": 14532034560,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 22.309765667,
      "owned_rss_bytes": 1728446464,
      "owned_process_count": 1,
      "reclaimable_bytes": 14537457664,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 22.534009708,
      "owned_rss_bytes": 1728512000,
      "owned_process_count": 1,
      "reclaimable_bytes": 14526152704,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 22.765804417,
      "owned_rss_bytes": 1728577536,
      "owned_process_count": 1,
      "reclaimable_bytes": 14513586176,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 22.990826166999998,
      "owned_rss_bytes": 1728659456,
      "owned_process_count": 1,
      "reclaimable_bytes": 14474067968,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 23.220561542,
      "owned_rss_bytes": 1728610304,
      "owned_process_count": 1,
      "reclaimable_bytes": 14631436288,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 23.460967791999998,
      "owned_rss_bytes": 1728626688,
      "owned_process_count": 1,
      "reclaimable_bytes": 14462746624,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 23.693979,
      "owned_rss_bytes": 1728692224,
      "owned_process_count": 1,
      "reclaimable_bytes": 14558904320,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 23.932701667,
      "owned_rss_bytes": 1728692224,
      "owned_process_count": 1,
      "reclaimable_bytes": 14447935488,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 24.161734875,
      "owned_rss_bytes": 1728692224,
      "owned_process_count": 1,
      "reclaimable_bytes": 14446641152,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 24.387574833,
      "owned_rss_bytes": 1728724992,
      "owned_process_count": 1,
      "reclaimable_bytes": 14490828800,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 24.613119167,
      "owned_rss_bytes": 1728331776,
      "owned_process_count": 1,
      "reclaimable_bytes": 14572896256,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 24.851624375,
      "owned_rss_bytes": 1728364544,
      "owned_process_count": 1,
      "reclaimable_bytes": 14605123584,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 25.085917166999998,
      "owned_rss_bytes": 1728364544,
      "owned_process_count": 1,
      "reclaimable_bytes": 14426636288,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 25.322435291999998,
      "owned_rss_bytes": 1728380928,
      "owned_process_count": 1,
      "reclaimable_bytes": 14447312896,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 25.56267475,
      "owned_rss_bytes": 1728544768,
      "owned_process_count": 1,
      "reclaimable_bytes": 14487601152,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 25.797541458,
      "owned_rss_bytes": 1728593920,
      "owned_process_count": 1,
      "reclaimable_bytes": 14654062592,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 26.030096916999998,
      "owned_rss_bytes": 1763934208,
      "owned_process_count": 1,
      "reclaimable_bytes": 14765506560,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 26.280229207999998,
      "owned_rss_bytes": 1731739648,
      "owned_process_count": 1,
      "reclaimable_bytes": 14906703872,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 26.516940125,
      "owned_rss_bytes": 1731739648,
      "owned_process_count": 1,
      "reclaimable_bytes": 14856880128,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 26.759150625,
      "owned_rss_bytes": 1731756032,
      "owned_process_count": 1,
      "reclaimable_bytes": 14565474304,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 26.992997875,
      "owned_rss_bytes": 1731772416,
      "owned_process_count": 1,
      "reclaimable_bytes": 14624997376,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 27.220925125,
      "owned_rss_bytes": 1731772416,
      "owned_process_count": 1,
      "reclaimable_bytes": 14601814016,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 27.455974208,
      "owned_rss_bytes": 1731805184,
      "owned_process_count": 1,
      "reclaimable_bytes": 14497316864,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 27.683167542,
      "owned_rss_bytes": 1731805184,
      "owned_process_count": 1,
      "reclaimable_bytes": 14429732864,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 27.918029292,
      "owned_rss_bytes": 1731821568,
      "owned_process_count": 1,
      "reclaimable_bytes": 14451605504,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 28.151779583,
      "owned_rss_bytes": 1731821568,
      "owned_process_count": 1,
      "reclaimable_bytes": 14491762688,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 28.387982208,
      "owned_rss_bytes": 1731837952,
      "owned_process_count": 1,
      "reclaimable_bytes": 14492614656,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 28.626808708,
      "owned_rss_bytes": 1731854336,
      "owned_process_count": 1,
      "reclaimable_bytes": 14482522112,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 28.858762792,
      "owned_rss_bytes": 1731903488,
      "owned_process_count": 1,
      "reclaimable_bytes": 14677295104,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 29.08364775,
      "owned_rss_bytes": 1731952640,
      "owned_process_count": 1,
      "reclaimable_bytes": 14695104512,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 29.308171958,
      "owned_rss_bytes": 1732050944,
      "owned_process_count": 1,
      "reclaimable_bytes": 14697201664,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 29.538082333,
      "owned_rss_bytes": 1732132864,
      "owned_process_count": 1,
      "reclaimable_bytes": 14691123200,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 29.765639625,
      "owned_rss_bytes": 1732214784,
      "owned_process_count": 1,
      "reclaimable_bytes": 14688665600,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 29.998739,
      "owned_rss_bytes": 1732280320,
      "owned_process_count": 1,
      "reclaimable_bytes": 14685421568,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 30.224724,
      "owned_rss_bytes": 1732362240,
      "owned_process_count": 1,
      "reclaimable_bytes": 14598684672,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 30.456353375,
      "owned_rss_bytes": 1729232896,
      "owned_process_count": 1,
      "reclaimable_bytes": 14698496000,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 30.699302499999998,
      "owned_rss_bytes": 1729232896,
      "owned_process_count": 1,
      "reclaimable_bytes": 14720843776,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 30.924826624999998,
      "owned_rss_bytes": 1729249280,
      "owned_process_count": 1,
      "reclaimable_bytes": 14733934592,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 31.158795292,
      "owned_rss_bytes": 1729265664,
      "owned_process_count": 1,
      "reclaimable_bytes": 14777974784,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 31.391136541999998,
      "owned_rss_bytes": 1729265664,
      "owned_process_count": 1,
      "reclaimable_bytes": 14692040704,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 31.621249042,
      "owned_rss_bytes": 1729282048,
      "owned_process_count": 1,
      "reclaimable_bytes": 14659354624,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 31.844604583,
      "owned_rss_bytes": 1729314816,
      "owned_process_count": 1,
      "reclaimable_bytes": 14526595072,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 32.074413167,
      "owned_rss_bytes": 1729331200,
      "owned_process_count": 1,
      "reclaimable_bytes": 14452523008,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 32.302123458000004,
      "owned_rss_bytes": 1729331200,
      "owned_process_count": 1,
      "reclaimable_bytes": 14530199552,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 32.545319625000005,
      "owned_rss_bytes": 1729363968,
      "owned_process_count": 1,
      "reclaimable_bytes": 14533427200,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 32.779297292,
      "owned_rss_bytes": 1729380352,
      "owned_process_count": 1,
      "reclaimable_bytes": 14482817024,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 33.008338625,
      "owned_rss_bytes": 1731248128,
      "owned_process_count": 1,
      "reclaimable_bytes": 14638317568,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 33.239368958,
      "owned_rss_bytes": 1732673536,
      "owned_process_count": 1,
      "reclaimable_bytes": 14828093440,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 33.480710875,
      "owned_rss_bytes": 1732689920,
      "owned_process_count": 1,
      "reclaimable_bytes": 14893875200,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 33.724438208,
      "owned_rss_bytes": 1732673536,
      "owned_process_count": 1,
      "reclaimable_bytes": 15054602240,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 33.956249417,
      "owned_rss_bytes": 1732706304,
      "owned_process_count": 1,
      "reclaimable_bytes": 15096233984,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 34.188781125000006,
      "owned_rss_bytes": 1732460544,
      "owned_process_count": 1,
      "reclaimable_bytes": 15274835968,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 34.428944,
      "owned_rss_bytes": 1732460544,
      "owned_process_count": 1,
      "reclaimable_bytes": 15337619456,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 34.668825792,
      "owned_rss_bytes": 1733246976,
      "owned_process_count": 1,
      "reclaimable_bytes": 15546417152,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 34.901458625000004,
      "owned_rss_bytes": 1733263360,
      "owned_process_count": 1,
      "reclaimable_bytes": 15604875264,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 35.127963583,
      "owned_rss_bytes": 1733263360,
      "owned_process_count": 1,
      "reclaimable_bytes": 15751659520,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 35.370535375,
      "owned_rss_bytes": 1733263360,
      "owned_process_count": 1,
      "reclaimable_bytes": 15771566080,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 35.598624333000004,
      "owned_rss_bytes": 1733279744,
      "owned_process_count": 1,
      "reclaimable_bytes": 15835529216,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 35.828676958,
      "owned_rss_bytes": 1733279744,
      "owned_process_count": 1,
      "reclaimable_bytes": 15833661440,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 36.063132167000006,
      "owned_rss_bytes": 1739096064,
      "owned_process_count": 1,
      "reclaimable_bytes": 15882027008,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 36.320555333,
      "owned_rss_bytes": 1736491008,
      "owned_process_count": 1,
      "reclaimable_bytes": 15883567104,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 36.563145167,
      "owned_rss_bytes": 1736507392,
      "owned_process_count": 1,
      "reclaimable_bytes": 15985967104,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 36.799724542,
      "owned_rss_bytes": 1736507392,
      "owned_process_count": 1,
      "reclaimable_bytes": 15848554496,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 37.036597708,
      "owned_rss_bytes": 1736523776,
      "owned_process_count": 1,
      "reclaimable_bytes": 16029237248,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 37.277312667000004,
      "owned_rss_bytes": 1736540160,
      "owned_process_count": 1,
      "reclaimable_bytes": 16080158720,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 37.50928883300001,
      "owned_rss_bytes": 1736540160,
      "owned_process_count": 1,
      "reclaimable_bytes": 16298524672,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 37.750746833,
      "owned_rss_bytes": 1736441856,
      "owned_process_count": 1,
      "reclaimable_bytes": 16371646464,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 37.980673125,
      "owned_rss_bytes": 1736359936,
      "owned_process_count": 1,
      "reclaimable_bytes": 16396632064,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 38.217843208000005,
      "owned_rss_bytes": 1736458240,
      "owned_process_count": 1,
      "reclaimable_bytes": 16463626240,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 38.452709417,
      "owned_rss_bytes": 1736441856,
      "owned_process_count": 1,
      "reclaimable_bytes": 16291545088,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 38.68969812500001,
      "owned_rss_bytes": 1736458240,
      "owned_process_count": 1,
      "reclaimable_bytes": 16399810560,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 38.927714667000004,
      "owned_rss_bytes": 1735327744,
      "owned_process_count": 1,
      "reclaimable_bytes": 16363749376,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 39.164069542,
      "owned_rss_bytes": 1738719232,
      "owned_process_count": 1,
      "reclaimable_bytes": 16425123840,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 39.406386583,
      "owned_rss_bytes": 1738735616,
      "owned_process_count": 1,
      "reclaimable_bytes": 16392830976,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 39.646876917,
      "owned_rss_bytes": 1738752000,
      "owned_process_count": 1,
      "reclaimable_bytes": 16564879360,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 39.891085583000006,
      "owned_rss_bytes": 1738752000,
      "owned_process_count": 1,
      "reclaimable_bytes": 16563814400,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 40.130575667,
      "owned_rss_bytes": 1738768384,
      "owned_process_count": 1,
      "reclaimable_bytes": 16393781248,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 40.366934500000006,
      "owned_rss_bytes": 1738784768,
      "owned_process_count": 1,
      "reclaimable_bytes": 16302735360,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 40.605837833,
      "owned_rss_bytes": 1723727872,
      "owned_process_count": 1,
      "reclaimable_bytes": 16452894720,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 40.840569792000004,
      "owned_rss_bytes": 1723351040,
      "owned_process_count": 1,
      "reclaimable_bytes": 16470507520,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 41.079963458,
      "owned_rss_bytes": 1680834560,
      "owned_process_count": 1,
      "reclaimable_bytes": 16449634304,
      "swapins": 44130047,
      "swapouts": 77538158
    }
  ],
  "passed": false,
  "classification": "Same complete native commands on new V349 compact-cache/bounded-tail composition with all added assertions. Native correctness only; full serving/resource/long-TPS qualification remains. Fixed 900-second work allowance and 30-second cleanup reserve; no retries or activation. Additive V341 failure observer is explicitly bound; original guard policy is otherwise unchanged.",
  "child_pid": 55473,
  "owned_root_identity": {
    "pid": 55473,
    "start_abstime": 33464268130394
  },
  "error": "RuntimeError: OS memory pressure is not normal (observed level=2); model work is not eligible",
  "traceback": "Traceback (most recent call last):\n  File \"/tmp/slotstream-optimization-execution/pressure-footprint-v341/guard_with_footprint.py\", line 140, in guarded_run\n    current = snapshot()\n  File \"/tmp/slotstream-optimization-execution/optional-current-serving-v330/run.py::execute\", line 30, in snapshot\n    value={'prepared_at':now(),'build':build,'dependencies':{str(p):digest(p) for p in dependencies},'executor_sha256':digest(Path(__file__)),'native_specs':NATIVE,'commands':{k:[str(BINARY),'optimization-state-check','--variant',v[0],'--model',MODEL,'--json'] for k,v in NATIVE.items()},'environment':{},'seconds':SECONDS,'policy':dict(c.NATIVE_POLICY,maximum_build_seconds=SECONDS),'classification':'Same complete native commands on new V349 compact-cache/bounded-tail composition with all added assertions. Native correctness only; full serving/resource/long-TPS qualification remains. Fixed 900-second work allowance and 30-second cleanup reserve; no retries or activation. Additive V341 failure observer is explicitly bound; original guard policy is otherwise unchanged.'}\n  File \"/Users/carlos/Projects/slotstream/Tools/optimization_readiness.py\", line 20, in require_normal\n    raise RuntimeError(f'OS memory pressure is not normal (observed level={level!r}); '\nRuntimeError: OS memory pressure is not normal (observed level=2); model work is not eligible\n",
  "failure_footprint": {
    "original_error": "RuntimeError: OS memory pressure is not normal (observed level=2); model work is not eligible",
    "observation": {
      "at_utc": "2026-09-08T04:23:29.898043+00:00",
      "complete": true,
      "root_identity": {
        "pid": 55473,
        "start_abstime": 33464268130394
      },
      "processes": [
        {
          "pid": 55473,
          "start_abstime": 33464268130394,
          "exit_abstime": 0,
          "physical_footprint_bytes": 7202034152,
          "resident_size_bytes": 1674706944
        }
      ],
      "classification": "Failure-time diagnostic only; not a sampled peak or admission/cleanup proof",
      "sum_process_footprints_bytes": 7202034152,
      "sum_process_resident_sizes_bytes": 1674706944,
      "sum_scope": "Sum of OS charges to these processes; not unique system memory or free/reclaimable memory.",
      "elapsed_seconds": 0.0373723750000039
    },
    "original_failure_preserved": true
  },
  "owned_groups": [
    55473
  ],
  "remaining_owned_members_after_cleanup": [],
  "elapsed_seconds": 41.640300542000006,
  "child_exit_code": -15,
  "after_cleanup_error": "RuntimeError: OS memory pressure is not normal (observed level=2); model work is not eligible"
}

````````````

## Artifact SHA-256 2ce21c1ee8727c738601e2f0102ee2776339aca07423dfd4c9f9e116dba69400

Encoding: `gzip+base64`. Original bytes: 238966.

````````````text
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
````````````

## Artifact SHA-256 512dd096a194f8c56f1d9be16931714035150ca54cbb02cbbb9d0aec5871657d

Encoding: `utf-8`. Original bytes: 22051.

````````````text
import CryptoKit
import CoreGraphics
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Sequential full-model reference/candidate ownership. Only hashes, token
    /// IDs and scalar observations cross arms, never an MLX tensor or model.
    public static func optimizationIntegrated(modelDir: URL, mtp: Bool, visionQueryTile: Bool = false,
                                             ropeFusion: Bool = false, gdnProjection: Bool = false) throws -> CheckReport {
        try integratedComparison(modelDir: modelDir, mtp: mtp, visionQueryTile: visionQueryTile,
            ropeFusion: ropeFusion, gdnProjection: gdnProjection, portableRotation: false)
    }

    /// Run the complete candidate through the actual unqualified-platform
    /// selector. This exercises portable arithmetic on the available Mac; it
    /// does not certify execution or speed on hardware we have not measured.
    package static func optimizationPortableIntegrated(modelDir: URL, mtp: Bool) throws -> CheckReport {
        try integratedComparison(modelDir: modelDir, mtp: mtp, visionQueryTile: false,
            ropeFusion: false, gdnProjection: false, portableRotation: true)
    }

    private static func integratedComparison(modelDir: URL, mtp: Bool, visionQueryTile: Bool,
                                            ropeFusion: Bool, gdnProjection: Bool,
                                            portableRotation: Bool) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        var c = CheckBuilder("optimization-integrated\(mtp ? "-mtp" : "")\(visionQueryTile ? "-vision-query" : "")\(portableRotation ? "-portable" : "")")
        struct Results {
            var state: [String: [String: String]] = [:]
            var outputs: [String: [Int]] = [:]
            var sampledWork: [String: [Int]] = [:]
        }
        func hash(_ a: MLXArray) -> String {
            "\(a.dtype):\(a.shape):\(SHA256.hash(data: Data(a.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self))))"
        }
        func arm(candidate: Bool, expected: Results?) throws -> Results {
            let index = try CheckpointIndex(dir: modelDir)
            let model = try Qwen4ExpModel(index: index, poolSlots: 640, embeddingRowCache: candidate,
                packGDNProjections: candidate && gdnProjection)
            if mtp { try model.enableMTP(modelDir: modelDir) }
            model.optimizations = candidate ? .integrationCandidate : InferenceOptimizations()
            if candidate && portableRotation {
                model.optimizations = .deploymentCandidate(on: OptimizationPlatform(
                    machineModel: nil, chip: nil, osBuild: nil, nativeARM64: false))
            }
            model.optimizations.fusedGDNProjection = candidate && gdnProjection
            if candidate && visionQueryTile { model.optimizations.visionQueryTile = 256 }
            if candidate && ropeFusion {
                model.optimizations.sharedRoPE = true
                model.optimizations.fusedRoPE = true
            }
            let generator = Generator(model: model)
            generator.prefillChunk = 256; generator.prefillCacheLimit = 64 << 20
            generator.speculationEnabled = mtp; generator.draftDepth = 1
            var params = SampleParams.greedy; params.maxTokens = 8; params.seed = 7
            var results = Results()
            c.equal("\(candidate): embedding selection", model.resident.usesEmbeddingRows, candidate)
            c.equal("\(candidate): bounded greedy tail selection", model.optimizations.boundedDraftTail, candidate)
            for count in [-1, 1, Int.max] {
                let invalid = model.makeState(); invalid.tokenCount = count
                let before = invalid.prefixForkDiagnosticTensors().mapValues(hash)
                do {
                    _ = try model.lastLogitsChecked([17], state: invalid)
                    c.expect("\(candidate): invalid public offset rejected", false)
                } catch { c.expect("\(candidate): invalid public offset rejected", true) }
                c.equal("\(candidate): rejected offset leaves state unchanged", invalid.prefixForkDiagnosticTensors().mapValues(hash), before)
            }
            let blank = Qwen4ExpModel.State()
            let blankFields = blank.prefixForkDiagnosticTensors().mapValues(hash)
            do {
                _ = try model.lastLogitsChecked([17], state: blank)
                c.expect("\(candidate): empty public State rejected", false)
            } catch { c.expect("\(candidate): empty public State rejected", true) }
            c.equal("\(candidate): empty-state rejection is atomic", blank.prefixForkDiagnosticTensors().mapValues(hash), blankFields)
            let tower = try VisionTower(index: index)
            let png = Data(base64Encoded: "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==")!
            let image: CGImage
            if visionQueryTile {
                guard let context = CGContext(data: nil, width: 512, height: 512,
                    bitsPerComponent: 8, bytesPerRow: 2048, space: CGColorSpaceCreateDeviceRGB(),
                    bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) else {
                    throw ModelError("cannot allocate bounded integrated image fixture")
                }
                context.setFillColor(CGColor(red: 1, green: 0, blue: 0, alpha: 1))
                context.fill(CGRect(x: 0, y: 0, width: 512, height: 512))
                guard let made = context.makeImage() else { throw ModelError("cannot materialize integrated image fixture") }
                image = made
            } else { image = try VisionPreprocess.decodeCGImage(png) }
            let imagePlan = try tower.plan(for: image)
            func vision(_ start: Int?) -> VisionPrompt? {
                guard let start else { return nil }
                return VisionPrompt(tower: tower, items: [.init(image: image, plan: imagePlan)],
                    segments: [.init(start: start, count: imagePlan.mergedTokens,
                        hash: ImageHash(hashing: visionQueryTile ? Data("solid-red-512x512-CGContext-v1".utf8) : png))],
                    hiddenSize: model.cfg.hiddenSize)
            }
            let cases: [(String, Int, Int?)] = [
                ("cached17", 17, nil), ("boundary255", 255, nil), ("boundary256", 256, nil),
                ("boundary257", 257, nil), ("long1025", 1025, nil),
                ("image-before", 273, 1),
                ("image-crossing", 273 + imagePlan.mergedTokens, 256 - imagePlan.mergedTokens / 2)
            ]
            // Only hashes leave this phase. Its prefix cache and taken state
            // need not remain live while the independent full request runs.
            func committedFields(label: String, ids: [Int], start: Int?) throws -> [String: String] {
                let cache = PrefixCache(maxTokens: 8192)
                var keepGoing = true
                generator.onPrefillProgress = { done, total, _ in
                    if done == total && done > 0 { keepGoing = false }
                }
                defer { generator.onPrefillProgress = nil }
                let vp = vision(start)
                let prefill = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache,
                    vision: vp, shouldContinue: { keepGoing })
                c.equal("\(candidate)/\(label): cancelled prefill releases request pins", model.pool.pinnedSlotCount, 0)
                generator.onPrefillProgress = nil
                c.expect("\(candidate)/\(label): cancellation commits complete prefill", prefill.0.isEmpty && prefill.1.runtimeError == nil && prefill.1.prefillTokens == ids.count)
                guard let taken = cache.take(matching: ids + [17], images: vp?.cacheSegments(
                    attentionPadding: model.optimizations.visionAttentionPadding,
                    queryTile: model.optimizations.visionQueryTile) ?? []) else {
                    throw ModelError("integrated prefill lost its complete committed state")
                }
                c.equal("\(candidate)/\(label): exact committed offset", taken.state.tokenCount, ids.count)
                if mtp { c.expect("\(candidate)/\(label): head is aligned", taken.state.hasValidMTP) }
                var fields = taken.state.prefixForkDiagnosticTensors().mapValues(hash)
                taken.state.invalidateMTP()
                fields["continuedLogits"] = hash(try model.lastLogitsChecked([17], state: taken.state))
                return fields
            }
            for (label, count, start) in cases {
                FileHandle.standardError.write(Data("integrated \(candidate ? "candidate" : "reference") / \(label)\n".utf8))
                var ids = (0..<count).map { 1000 + ($0 * 79) % 190_000 }
                if let start {
                    ids.replaceSubrange(start..<start+imagePlan.mergedTokens,
                        with: repeatElement(model.cfg.imageTokenId, count: imagePlan.mergedTokens))
                }
                let fields = try committedFields(label: label, ids: ids, start: start)
                results.state[label] = fields
                if let wanted = expected?.state[label] { c.equal("\(label): all state bytes and continued logits exact", fields, wanted) }
                let full = generator.generate(promptIds: ids, params: params, eosIds: [], vision: vision(start))
                c.equal("\(candidate)/\(label): completed request releases pins", model.pool.pinnedSlotCount, 0)
                if visionQueryTile {
                    c.equal("\(candidate)/\(label): explicit vision query bound", full.1.visionQueryTile,
                        candidate && start != nil ? 256 : 0)
                    c.equal("\(candidate)/\(label): executed vision tile count", full.1.visionQueryTileCalls,
                        candidate && start != nil ? tower.vcfg.depth * ((imagePlan.patches + 255) / 256) : 0)
                }
                c.expect("\(candidate)/\(label): full completion succeeds", full.1.runtimeError == nil && full.0.count == params.maxTokens)
                c.equal("\(candidate)/\(label): selected n-gram cache format", model.ngram.compactRows, candidate)
                c.expect("\(candidate)/\(label): n-gram cache contains real rows", full.1.ngramCachedRows > 0)
                c.equal("\(candidate)/\(label): exact n-gram cache payload accounting", full.1.ngramCachePayloadBytes,
                    full.1.ngramCachedRows * model.ngram.headDim * (candidate ? 2 : 4))
                if mtp { c.expect("\(candidate)/\(label): verification executes", full.1.verifyPasses > 0) }
                else { c.equal("\(candidate)/\(label): final forward work is explicit", full.1.decodeModelTokens, params.maxTokens - (candidate ? 1 : 0)) }
                c.expect("\(candidate)/\(label): embeddings remain bounded", full.1.embeddingCachedPayloadBytes <= 11_796_480)
                results.outputs[label] = full.0
                if let wanted = expected?.outputs[label] { c.equal("\(label): exact complete greedy IDs", full.0, wanted) }
            }

            let prompt = (0..<273).map { 1000 + ($0 * 79) % 190_000 }
            for filtered in [false, true] {
                var sample = params
                sample.temperature = 0.7; sample.topK = filtered ? 40 : 0
                sample.topP = filtered ? 0.8 : 1; sample.minP = filtered ? 0.05 : 0
                sample.presencePenalty = filtered ? 1.1 : 0
                for seed: UInt64 in [7, 7_046_029_254_386_353_130] {
                    sample.seed = seed
                    let label = "sample/\(filtered)/\(seed)"
                    let first = generator.generate(promptIds: Array(prompt.prefix(17)), params: sample, eosIds: [])
                    let repeatRun = generator.generate(promptIds: Array(prompt.prefix(17)), params: sample, eosIds: [])
                    c.equal("\(candidate)/\(label): sampled requests return an idle pool", model.pool.pinnedSlotCount, 0)
                    c.expect("\(candidate)/\(label): sampled output completes", first.1.runtimeError == nil && first.0.count == sample.maxTokens)
                    c.equal("\(candidate)/\(label): seeded replay exact", repeatRun.0, first.0)
                    results.outputs[label] = first.0
                    if let wanted = expected?.outputs[label] { c.equal("\(label): integrated sampled IDs match reference", first.0, wanted) }
                    if mtp {
                        let work = [first.1.draftedTokens, first.1.verifyPasses,
                            first.1.decodeModelTokens, first.1.decodeForwardPasses]
                        let repeatWork = [repeatRun.1.draftedTokens, repeatRun.1.verifyPasses,
                            repeatRun.1.decodeModelTokens, repeatRun.1.decodeForwardPasses]
                        c.equal("\(candidate)/\(label): sampled replay keeps verification work", repeatWork, work)
                        results.sampledWork[label] = work
                        if let expected {
                            c.equal("\(label): integrated sampled verification work matches reference",
                                work, expected.sampledWork[label] ?? [])
                        }
                    }
                }
            }
            let retained = PrefixCache(maxTokens: 8192)
            let first = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: retained)
            c.expect("\(candidate): first retained request succeeds", first.1.runtimeError == nil)
            let casesOfReuse: [(String, [Int])] = [
                ("same", prompt),
                ("auxiliary", Array(prompt.prefix(17)) + [23]),
                ("divergent", Array(prompt.prefix(256)) + Array(repeating: 907, count: 259)),
                ("same-after-auxiliary", prompt),
                ("edited", [999] + Array(prompt.dropFirst()))
            ]
            for (label, ids) in casesOfReuse {
                let outcome = generator.generate(promptIds: ids, params: params, eosIds: [], cache: retained)
                c.equal("\(candidate)/\(label): cache reuse releases request pins", model.pool.pinnedSlotCount, 0)
                c.expect("\(candidate)/\(label): reusable-cache request succeeds", outcome.1.runtimeError == nil && outcome.0.count == params.maxTokens)
                if label == "same" {
                    c.equal("\(candidate): complete checkpoint is exercised", outcome.1.reusedPrefixTokens, candidate ? prompt.count : 0)
                    c.equal("\(candidate): complete hit is observed", outcome.1.completePromptHits, candidate ? 1 : 0)
                    c.equal("\(candidate): complete hit eliminates prefill", outcome.1.prefillTokens, candidate ? 0 : prompt.count)
                    c.equal("\(candidate): same prompt repeats exactly", outcome.0, first.0)
                }
                if label == "edited" { c.equal("\(candidate): edited prefix refuses prior state", outcome.1.reusedPrefixTokens, 0) }
                c.equal("\(candidate)/\(label): no invalid checkpoint published", outcome.1.prefixCheckpointErrors, 0)
                let key = "reuse/\(label)"; results.outputs[key] = outcome.0
                if let wanted = expected?.outputs[key] { c.equal("\(label): interleaved output matches independent reference", outcome.0, wanted) }
            }
            // A shorter committed checkpoint must still help when the entire
            // input differs. Exercise this independently of identical retries
            // and retain the same four physical-state budget.
            let editedTail = Array(prompt.prefix(256)) + Array(repeating: 907, count: 17)
            let partial = PrefixCache(maxTokens: 8192)
            _ = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: partial)
            let tailResult = generator.generate(promptIds: editedTail, params: params, eosIds: [], cache: partial)
            c.expect("\(candidate): partial fallback succeeds", tailResult.1.runtimeError == nil)
            c.equal("\(candidate): edited tail uses the shorter checkpoint", tailResult.1.reusedPrefixTokens, candidate ? 256 : 0)
            c.equal("\(candidate): partial fallback is not a complete hit", tailResult.1.completePromptHits, 0)
            c.expect("\(candidate): combined retention respects physical-state count",
                (partial.json()["conversations"] as? Int ?? Int.max) <= PrefixCache.maxEntries)
            results.outputs["partial-fallback"] = tailResult.0
            if let wanted = expected?.outputs["partial-fallback"] {
                c.equal("partial fallback output matches independent reference", tailResult.0, wanted)
            }
            var delivered: [Int] = []
            let cancelled = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: retained,
                onToken: { id in delivered.append(id); return delivered.count < 2 })
            c.equal("\(candidate): callback cancellation releases request pins", model.pool.pinnedSlotCount, 0)
            c.equal("\(candidate): callback cancellation has no hidden output", cancelled.0, delivered)
            c.equal("\(candidate): callback stops at two emissions", delivered.count, 2)
            c.equal("\(candidate): cancellation preserves exact output prefix", delivered, Array(first.0.prefix(2)))
            c.expect("\(candidate): client cancellation is not a model error", cancelled.1.runtimeError == nil)
            let retry = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: retained)
            c.equal("\(candidate): retry returns an idle pool", model.pool.pinnedSlotCount, 0)
            c.equal("\(candidate): retry after cancellation is exact", retry.0, first.0)
            c.expect("\(candidate): prefix capacity stays bounded", retained.heldTokens <= 8192)
            // Exercise exits that can follow a fresh pinned dispatch without
            // another forward to clear the pins. Derive EOS from this same
            // arithmetic path, so this gate does not assume a vocabulary ID.
            var one = params; one.maxTokens = 1
            let short = Array(prompt.prefix(17))
            let single = generator.generate(promptIds: short, params: one, eosIds: [])
            c.equal("\(candidate): one-token request releases pins", model.pool.pinnedSlotCount, 0)
            c.equal("\(candidate): one-token request emits exactly one token", single.0.count, 1)
            if mtp {
                var two = params; two.maxTokens = 2
                let terminal = generator.generate(promptIds: short, params: two, eosIds: [])
                c.expect("\(candidate): two-token MTP request completes",
                    terminal.1.runtimeError == nil && terminal.0.count == 2)
                c.equal("\(candidate): two-token MTP releases pins", model.pool.pinnedSlotCount, 0)
                c.equal("\(candidate): terminal draft work is explicit", terminal.1.draftedTokens, candidate ? 0 : 1)
                c.equal("\(candidate): terminal target work is explicit", terminal.1.decodeModelTokens, candidate ? 1 : 2)
                c.equal("\(candidate): terminal verification executes once", terminal.1.verifyPasses, 1)
                c.equal("\(candidate): terminal forward executes once", terminal.1.decodeForwardPasses, 1)
                c.equal("\(candidate): bounded output preserves the longer greedy prefix",
                    terminal.0, Array((results.outputs["cached17"] ?? []).prefix(2)))
                results.outputs["mtp-two-output"] = terminal.0
                if let expected {
                    c.equal("two-token MTP integrated output matches reference",
                        terminal.0, expected.outputs["mtp-two-output"] ?? [])
                }
            }
            if let eos = single.0.first {
                let stopped = generator.generate(promptIds: short, params: params, eosIds: [eos])
                c.expect("\(candidate): immediate EOS succeeds without emitted output",
                    stopped.1.runtimeError == nil && stopped.0.isEmpty && stopped.1.finishReason == "stop")
                c.equal("\(candidate): immediate EOS releases pins", model.pool.pinnedSlotCount, 0)
            }
            if ropeFusion || InferenceOptimizations.integrationCandidate.fusedRoPE {
                c.equal("\(candidate): fused RoPE evaluated paths", model.fusedRoPERotationsScheduled > 0,
                    candidate && !portableRotation)
                c.equal("\(candidate): shared RoPE evaluated paths", model.ropeTableHits > 0, candidate)
                c.measure("\(candidate).fused_rotations_scheduled", Double(model.fusedRoPERotationsScheduled))
            }
            if gdnProjection {
                let state = model.makeState(), before = model.fusedGDNProjectionsScheduled
                let logits = model.lastLogits([907], state: state); eval(logits)
                var snapshot = state.diagnosticTensors().mapValues(hash)
                snapshot["logits"] = hash(logits)
                results.state["gdn-single"] = snapshot
                if let wanted = expected?.state["gdn-single"] {
                    c.equal("integrated one-token projection state and logits", snapshot, wanted)
                }
                let layers = model.cfg.layerTypes.filter { $0 == "linear_attention" }.count
                c.equal("\(candidate): one-token projection mechanism", model.fusedGDNProjectionsScheduled - before,
                    candidate ? layers : 0)
                c.equal("\(candidate): packed projection layers", model.resident.packedGDNProjectionLayers,
                    candidate ? layers : 0)
            }
            return results
        }
        let reference = try arm(candidate: false, expected: nil)
        MLX.Memory.clearCache()
        _ = try arm(candidate: true, expected: reference)
        return c.report()
    }
}

````````````

## Artifact SHA-256 5f394cc5c06b669fc9ce968475766088caf17ef9873bf559d16e46d51bd5dc2e

Encoding: `utf-8`. Original bytes: 1772.

````````````text
{
  "classification": "Descriptive context for two different-build native executions; not a causal attribution or guaranteed admission threshold.",
  "historical_pass": {
    "source": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-campaign-v305/native/combined-plain/evidence/memory.json",
    "startup_reclaimable_bytes": 22189686784,
    "minimum_reclaimable_bytes": 14944616448,
    "peak_owned_rss_bytes": 4979032064,
    "elapsed_seconds": 249.61525275
  },
  "current_pressure_stop": {
    "source": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v350/combined-plain/memory.json",
    "startup_reclaimable_bytes": 15558950912,
    "minimum_reclaimable_bytes": 9148694528,
    "peak_owned_rss_bytes": 4860526592,
    "elapsed_seconds": 41.640300542000006,
    "failure_physical_footprint_bytes": 7202034152
  },
  "source_findings": {
    "same_original_reference_model_pool_slots": 640,
    "same_compute_prefill_chunk": 256,
    "same_prefill_cache_limit_bytes": 67108864,
    "same_global_cache_limit_bytes": 134217728,
    "current_phase": "reference long1025; no completed assertions report",
    "candidate_arm_not_reached": true,
    "new_compact_tail_controls_disabled_in_reference": true
  },
  "next_native_admission_readiness": {
    "minimum_reclaimable_bytes": 22200000000,
    "meaning": "Additional conservative go/no-go screen at or above the prior successful launch, not a relaxed original policy or proof of sufficient headroom. All original live limits and OS pressure stop remain.",
    "fresh_explicit_peer_grant_required": true,
    "new_prospective_attempt_identity_required_for_interrupted_case": true
  },
  "no_model_launch": true,
  "no_runtime_change_from_aggregate_pressure": true
}

````````````
