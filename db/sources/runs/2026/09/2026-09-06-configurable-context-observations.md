---
type: run
id: 01m1vkwm5d44ybbpvy9xw90dvx
created: 2026-09-06T15:02:47.725176+00:00
updated: 2026-09-06T15:02:47.946459+00:00
summary: Context diagnostic VM observations and frozen grouped small-pass successor
binary: Build 5 and 6; source archives retained under sources/artifacts
captured_at: 2026-09-06
command: Extract before/after VM observations and freeze the unchanged successor acceptance contract
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Context diagnostic VM observations and frozen grouped small-pass successor
tool: Portable extraction from diagnostic manifests
---
# Context component observations: environment and numerical successor

This record supplements the first component and sub-256 counterexample runs.
All three model invocations observed system-wide swap-ins during their full
process intervals (including startup). No swap-outs were observed. Timings and
memory-capacity conclusions are therefore discarded; deterministic functional
assertions and the numerical counterexample remain valid diagnostic evidence.
No full-context capacity run has occurred.

The source closures for the successful HTTP build and failing numerical build
are preserved byte-for-byte at:
- `sources/artifacts/configurable-context-2026-09-06/build-5-source.tar.gz`
- `sources/artifacts/configurable-context-2026-09-06/build-6-source.tar.gz`

The successor keeps 515 IDs, the 256/512 reference/control, all continuations,
rollback cases, repeat checks and numeric tolerances fixed. Only the candidate
64/128 prefill selects the established staged grouped expert QMM; ordinary
short inputs and decode are unchanged. No attention pass is enlarged. Dispatch
counters must prove the path actually ran. It is diagnostic-only until the
same gates pass, and it has not yet been built or executed.

The following portable extraction retains the exact observed VM counters and
raw vm_stat strings, environment and diagnostic outcome. Local executable
paths are omitted. Its source manifests remain with the frozen candidates.

```json
{
  "http-4": {
    "before": {
      "page_bytes": 16384,
      "reclaimable_bytes": 28649340928,
      "swapins": 43753194,
      "swapouts": 77323699,
      "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   690355.\nPages active:                                 829875.\nPages inactive:                               771884.\nPages speculative:                            343785.\nPages throttled:                                   0.\nPages wired down:                             230867.\nPages purgeable:                                3786.\n\"Translation faults\":                    14755075395.\nPages copy-on-write:                       681912031.\nPages zero filled:                       19939710050.\nPages reactivated:                        3275751756.\nPages purged:                               69219885.\nFile-backed pages:                           1054476.\nAnonymous pages:                              891068.\nPages stored in compressor:                  1412550.\nPages occupied by compressor:                 216573.\nDecompressions:                           1135186151.\nCompressions:                             1445812217.\nPageins:                                  7022307434.\nPageouts:                                   10952529.\nSwapins:                                    43753194.\nSwapouts:                                   77323699.\nPages tagged:                                 162834.\nPages tagged resident:                        133739.\nPages tagged compressed:                       29095.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6794.\nPages tag-storage free:                         2453.\nPages tag-storage non-tag pageable:            89049.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5120128.\nTagged compressions:                        10727678.\nTagged decompressions:                       9905735.\n"
    },
    "after": {
      "page_bytes": 16384,
      "reclaimable_bytes": 28325560320,
      "swapins": 43753222,
      "swapouts": 77323699,
      "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   494284.\nPages active:                                 845257.\nPages inactive:                               931560.\nPages speculative:                            363271.\nPages throttled:                                   0.\nPages wired down:                             232223.\nPages purgeable:                                3810.\n\"Translation faults\":                    14755734865.\nPages copy-on-write:                       681967749.\nPages zero filled:                       19940621926.\nPages reactivated:                        3275752334.\nPages purged:                               69220834.\nFile-backed pages:                           1230761.\nAnonymous pages:                              909327.\nPages stored in compressor:                  1411735.\nPages occupied by compressor:                 216430.\nDecompressions:                           1135186963.\nCompressions:                             1445812217.\nPageins:                                  7022470017.\nPageouts:                                   10952529.\nSwapins:                                    43753222.\nSwapouts:                                   77323699.\nPages tagged:                                 162959.\nPages tagged resident:                        133986.\nPages tagged compressed:                       28973.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6794.\nPages tag-storage free:                         2773.\nPages tag-storage non-tag pageable:            88729.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5101376.\nTagged compressions:                        10727678.\nTagged decompressions:                       9905854.\n"
    },
    "environment": {},
    "passed": false,
    "assertions": 462,
    "duration_seconds": 61.903532166000005,
    "classification": "Correctness result retained; global VM swap-in activity excludes timings and capacity claims."
  },
  "http-5": {
    "before": {
      "page_bytes": 16384,
      "reclaimable_bytes": 28078784512,
      "swapins": 43794270,
      "swapouts": 77363385,
      "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   460367.\nPages active:                                 858468.\nPages inactive:                               945506.\nPages speculative:                            369680.\nPages throttled:                                   0.\nPages wired down:                             232131.\nPages purgeable:                                3844.\n\"Translation faults\":                    14757431155.\nPages copy-on-write:                       682130603.\nPages zero filled:                       19941538740.\nPages reactivated:                        3275753533.\nPages purged:                               69222935.\nFile-backed pages:                           1249582.\nAnonymous pages:                              924072.\nPages stored in compressor:                  1407696.\nPages occupied by compressor:                 217064.\nDecompressions:                           1135190991.\nCompressions:                             1445812217.\nPageins:                                  7022486223.\nPageouts:                                   10952529.\nSwapins:                                    43794270.\nSwapouts:                                   77363385.\nPages tagged:                                 162841.\nPages tagged resident:                        133985.\nPages tagged compressed:                       28856.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6794.\nPages tag-storage free:                         2532.\nPages tag-storage non-tag pageable:            88970.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5076032.\nTagged compressions:                        10727678.\nTagged decompressions:                       9905963.\n"
    },
    "after": {
      "page_bytes": 16384,
      "reclaimable_bytes": 28039430144,
      "swapins": 43794277,
      "swapouts": 77363385,
      "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   459781.\nPages active:                                 890679.\nPages inactive:                               948356.\nPages speculative:                            351067.\nPages throttled:                                   0.\nPages wired down:                             216652.\nPages purgeable:                               15874.\n\"Translation faults\":                    14757976494.\nPages copy-on-write:                       682163836.\nPages zero filled:                       19942411580.\nPages reactivated:                        3275753743.\nPages purged:                               69222935.\nFile-backed pages:                           1235736.\nAnonymous pages:                              954366.\nPages stored in compressor:                  1406776.\nPages occupied by compressor:                 216842.\nDecompressions:                           1135191911.\nCompressions:                             1445812217.\nPageins:                                  7022487062.\nPageouts:                                   10952529.\nSwapins:                                    43794277.\nSwapouts:                                   77363385.\nPages tagged:                                 163141.\nPages tagged resident:                        134351.\nPages tagged compressed:                       28790.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6794.\nPages tag-storage free:                         2113.\nPages tag-storage non-tag pageable:            89389.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5063232.\nTagged compressions:                        10727678.\nTagged decompressions:                       9906029.\n"
    },
    "environment": {},
    "passed": true,
    "assertions": 462,
    "duration_seconds": 50.492341834,
    "classification": "Correctness result retained; global VM swap-in activity excludes timings and capacity claims."
  },
  "small64-6": {
    "before": {
      "page_bytes": 16384,
      "reclaimable_bytes": 27569815552,
      "swapins": 43794305,
      "swapouts": 77363385,
      "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   480304.\nPages active:                                 870955.\nPages inactive:                               946947.\nPages speculative:                            332353.\nPages throttled:                                   0.\nPages wired down:                             237641.\nPages purgeable:                                8345.\n\"Translation faults\":                    14759539856.\nPages copy-on-write:                       682261470.\nPages zero filled:                       19943511669.\nPages reactivated:                        3275756412.\nPages purged:                               69226425.\nFile-backed pages:                           1194079.\nAnonymous pages:                              956176.\nPages stored in compressor:                  1402191.\nPages occupied by compressor:                 215225.\nDecompressions:                           1135196290.\nCompressions:                             1445812217.\nPageins:                                  7022508232.\nPageouts:                                   10952529.\nSwapins:                                    43794305.\nSwapouts:                                   77363385.\nPages tagged:                                 163728.\nPages tagged resident:                        135829.\nPages tagged compressed:                       27899.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6794.\nPages tag-storage free:                         2261.\nPages tag-storage non-tag pageable:            89241.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    4911104.\nTagged compressions:                        10727678.\nTagged decompressions:                       9906889.\n"
    },
    "after": {
      "page_bytes": 16384,
      "reclaimable_bytes": 27838414848,
      "swapins": 43794313,
      "swapouts": 77363385,
      "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   436747.\nPages active:                                1108179.\nPages inactive:                              1106241.\nPages speculative:                              1396.\nPages throttled:                                   0.\nPages wired down:                             216299.\nPages purgeable:                                8379.\n\"Translation faults\":                    14759951849.\nPages copy-on-write:                       682277648.\nPages zero filled:                       19946922954.\nPages reactivated:                        3276370670.\nPages purged:                               69240467.\nFile-backed pages:                           1253996.\nAnonymous pages:                              961820.\nPages stored in compressor:                  1401795.\nPages occupied by compressor:                 215060.\nDecompressions:                           1135196686.\nCompressions:                             1445812217.\nPageins:                                  7023131551.\nPageouts:                                   10952832.\nSwapins:                                    43794313.\nSwapouts:                                   77363385.\nPages tagged:                                 163949.\nPages tagged resident:                        136050.\nPages tagged compressed:                       27899.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6794.\nPages tag-storage free:                         1642.\nPages tag-storage non-tag pageable:            89860.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    4911104.\nTagged compressions:                        10727678.\nTagged decompressions:                       9906889.\n"
    },
    "environment": {},
    "passed": false,
    "assertions": 1600,
    "duration_seconds": 46.799081041,
    "classification": "Correctness result retained; global VM swap-in activity excludes timings and capacity claims."
  }
}
```
