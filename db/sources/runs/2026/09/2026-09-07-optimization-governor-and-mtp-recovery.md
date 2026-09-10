---
type: run
id: 01m1xmssp4t1fsrwn9j5x9kdvz
created: 2026-09-07T09:57:12.516029+00:00
updated: 2026-09-07T09:57:12.885596+00:00
summary: Portable governor acceptance and complete MTP memory/vision recovery
binary: V280 eba9ee894aba4722d082fda7d39192339d0299fe7af264a624dd4209d1e648cf
captured_at: 2026-09-07
command: V286 real shell parser tests and V287/V289/V290 exact guarded checks below
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Portable governor acceptance and complete MTP memory/vision recovery
tool: python3
---
# Portable governor acceptance and complete MTP memory/vision recovery

V286 fixes two actual `Tools/verify.sh` acceptance bugs without changing the inference binary or any resource threshold. macOS BSD sed requires extended-regex alternation for the actual governor status. The old substring case also accepted a failed process when its details path contained PASS. The new parser uses the real final-status prefix, rejects missing/duplicate/conflicting statuses, and gives a nonzero native exit precedence. The actual source-block regression suite fails three cases before the repair and passes all 15 tests afterward, including real system sed, no trailing newline, misleading PASS words, malformed statuses and literal shell-metacharacter paths. The applied repository suite passes 15/15 in 4.446 seconds; bash syntax also passes. Both exact Tool after-images are included. No Slotstream rebuild or runtime/default change is needed for this repair.

The initial ad-hoc parser probe accidentally doubled Python raw-string backslashes; its correction and the independent exact-source extraction are both preserved. The original temporary preparation script also had a Python syntax error; no production edit or model launch came from that draft. Neither is silently used as evidence of a native bug.

V287 actually runs the corrected governor block on unchanged V280 binary `eba9ee894aba4722d082fda7d39192339d0299fe7af264a624dd4209d1e648cf`. It passes the real shrink/cooldown/regrow drill with identical output. Its subsequent whole MTP attempt remains failed: 28 swap-ins, zero swap-outs and sampled peak 9,754,399,496 bytes below 12 GB. Vision starts but does not complete its required checks. The extracted shell wrapper then lacks BIG_MEMORY, so its long request is rejected at argument parsing with exit 64 before model load; no long-memory result exists for V287. This is an orchestration error, not an inference regression. The correction copies the original explicit constants and enables nounset. All original failed outputs remain below.

V289 executes the exact original 7972-token long prompt with a 16-token allowance and a 10 GB target. It returns the correct four-token SEVENTEEN answer. Peak 7,184,993,784 bytes stays under target, but four swap-ins invalidate the memory gate; there are no generator-interval swap-outs. No capacity or speed claim is earned.

V289 then waits for an actual 60-second no-VM pre-launch interval and executes the complete unchanged `mtp-check --memory-gb 12 --mtp on --vision on --image Tools/assets/vision_test/secret1.jpg`. This whole MTP check passes: text determinism and actual speculation, the original 721-token image prompt, deterministic image speculation and actual verification, nondegenerate acceptance, recording-versus-batched logits, rollback state and next-step bounds, reused speculative turn state, and the entire memory interval. Sampled peak is 10,333,721,952 bytes, end footprint 10,332,854,032 bytes, lifetime RSS peak 5,263,081,472 bytes and 8557 samples. Both swap-in and swap-out counts remain exactly unchanged. `memory_validated` is true and the actual tool emits MTP CHECK PASS. This is a genuine whole-gate pass on V280, not a rescore of the earlier excluded attempts.

The consumer-build wrapper refuses before compilation because less than its declared six-minute minimum remains in the granted interval. The separate V290 long-request successor refuses after 2.160326750 seconds when its prospective 60-second quiet preflight detects VM activity. It launches no model request, so it produces no additional long-prompt result. Candidate/tool identities remain exact and all ownership guards drain their children; the model lock is free and pressure normal at the explicit 09:55:28 UTC early handback. Chrome and other user apps stay open.

V283's complete verification remains the historical 22-pass/3-fail run. The governor and complete MTP gates now have successful exact-build recovery evidence. The long no-VM resource gate, a fresh complete verification result, portable fallback, actual separate consumer/client/install/rollback acceptance, optional frozen studies, all eight paired studies, both soaks, empirical calibration and final activation remain open. No final combined performance percentages exist yet.

## /Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v290/manifest.json

SHA-256 `b50958c76a6e969da18a32124292377a8d1aa74984242e50d203b84dd510f08b`; 4601 bytes.

````text
{
  "passed": false,
  "protocol_sha256": "80bfa62a4f94ac5b81d5e6b59843460eca5c2507807ccaf11d2239c3e32d8cc7",
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 24786911232,
    "swapins": 44114301,
    "swapouts": 77536098,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   491610.\nPages active:                                 757704.\nPages inactive:                               536718.\nPages speculative:                            221461.\nPages throttled:                                   0.\nPages wired down:                             331730.\nPages purgeable:                                3855.\n\"Translation faults\":                    15632139202.\nPages copy-on-write:                       751993286.\nPages zero filled:                       21536786619.\nPages reactivated:                        3535895434.\nPages purged:                               73729502.\nFile-backed pages:                           1017408.\nAnonymous pages:                              498475.\nPages stored in compressor:                  1884576.\nPages occupied by compressor:                 744156.\nDecompressions:                           1191677609.\nCompressions:                             1508836240.\nPageins:                                  7784095493.\nPageouts:                                   11146759.\nSwapins:                                    44114301.\nSwapouts:                                   77536098.\nPages tagged:                                 174889.\nPages tagged resident:                        115967.\nPages tagged compressed:                       58922.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6924.\nPages tag-storage free:                         2409.\nPages tag-storage non-tag pageable:            88963.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9179520.\nTagged compressions:                        11490243.\nTagged decompressions:                      10583793.\n"
  },
  "exit_code": 1,
  "summary": [],
  "skips": [],
  "failures": [],
  "elapsed_seconds": 2.1603267500000003,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 24715247616,
    "swapins": 44114305,
    "swapouts": 77536098,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   455567.\nPages active:                                 765573.\nPages inactive:                               537810.\nPages speculative:                            250698.\nPages throttled:                                   0.\nPages wired down:                             331832.\nPages purgeable:                                3667.\n\"Translation faults\":                    15632443603.\nPages copy-on-write:                       752019869.\nPages zero filled:                       21536873853.\nPages reactivated:                        3535895434.\nPages purged:                               73729502.\nFile-backed pages:                           1049265.\nAnonymous pages:                              504816.\nPages stored in compressor:                  1879948.\nPages occupied by compressor:                 741441.\nDecompressions:                           1191682224.\nCompressions:                             1508836240.\nPageins:                                  7784100256.\nPageouts:                                   11146759.\nSwapins:                                    44114305.\nSwapouts:                                   77536098.\nPages tagged:                                 175046.\nPages tagged resident:                        116362.\nPages tagged compressed:                       58684.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6924.\nPages tag-storage free:                         2497.\nPages tag-storage non-tag pageable:            88875.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9137600.\nTagged compressions:                        11490243.\nTagged decompressions:                      10584027.\n"
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
  "candidate_unchanged": true,
  "drivers_unchanged": true,
  "remaining_jobs": [],
  "model_lock_free": true,
  "within_reservation": true
}
````

## /Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v290/memory.json

SHA-256 `843ae48c0899bcffab3370b87cd2ea0246fd9a6f5097f819fb7aec6a7a3c520b`; 9107 bytes.

````text
{
  "command": [
    "bash",
    "/tmp/slotstream-optimization-execution/long-memory-recovery-v290/checks.sh"
  ],
  "policy": {
    "startup_reclaimable_bytes": 21000000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 17500000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 301,
    "stop_on_new_swapouts": false
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 24785321984,
    "swapins": 44114301,
    "swapouts": 77536098,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   491333.\nPages active:                                 757486.\nPages inactive:                               536718.\nPages speculative:                            221826.\nPages throttled:                                   0.\nPages wired down:                             331726.\nPages purgeable:                                3670.\n\"Translation faults\":                    15632142453.\nPages copy-on-write:                       751993894.\nPages zero filled:                       21536787769.\nPages reactivated:                        3535895434.\nPages purged:                               73729502.\nFile-backed pages:                           1017773.\nAnonymous pages:                              498257.\nPages stored in compressor:                  1884576.\nPages occupied by compressor:                 744156.\nDecompressions:                           1191677609.\nCompressions:                             1508836240.\nPageins:                                  7784095497.\nPageouts:                                   11146759.\nSwapins:                                    44114301.\nSwapouts:                                   77536098.\nPages tagged:                                 174879.\nPages tagged resident:                        115957.\nPages tagged compressed:                       58922.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6924.\nPages tag-storage free:                         2409.\nPages tag-storage non-tag pageable:            88963.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9179520.\nTagged compressions:                        11490243.\nTagged decompressions:                      10583793.\n"
  },
  "samples": [
    {
      "elapsed_seconds": 0.0014401659999999927,
      "owned_rss_bytes": 2244608,
      "owned_process_count": 2,
      "reclaimable_bytes": 24777211904,
      "swapins": 44114301,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 0.230028541,
      "owned_rss_bytes": 16498688,
      "owned_process_count": 2,
      "reclaimable_bytes": 24769855488,
      "swapins": 44114301,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 0.460440125,
      "owned_rss_bytes": 16498688,
      "owned_process_count": 2,
      "reclaimable_bytes": 24772067328,
      "swapins": 44114301,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 0.691547708,
      "owned_rss_bytes": 16498688,
      "owned_process_count": 2,
      "reclaimable_bytes": 24771067904,
      "swapins": 44114301,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 0.922526958,
      "owned_rss_bytes": 16498688,
      "owned_process_count": 2,
      "reclaimable_bytes": 24837849088,
      "swapins": 44114305,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 1.153854458,
      "owned_rss_bytes": 16498688,
      "owned_process_count": 2,
      "reclaimable_bytes": 24819351552,
      "swapins": 44114305,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 1.375083875,
      "owned_rss_bytes": 16498688,
      "owned_process_count": 2,
      "reclaimable_bytes": 24797773824,
      "swapins": 44114305,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 1.60447575,
      "owned_rss_bytes": 16498688,
      "owned_process_count": 2,
      "reclaimable_bytes": 24784125952,
      "swapins": 44114305,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 1.843227458,
      "owned_rss_bytes": 16498688,
      "owned_process_count": 2,
      "reclaimable_bytes": 24724045824,
      "swapins": 44114305,
      "swapouts": 77536098
    }
  ],
  "passed": false,
  "classification": "One exact original 7972-token long request after a successful 60-second no-VM preflight. Same V280 native binary, original generated prompt, 16-token allowance, 10 GB target, no-VM and physical/RSS criteria. V283 and V289 swap-excluded long attempts remain preserved. MTP and governor have actual successful independent checks and are not repeated. No consumer compilation launched because its six-minute time preflight refused. This is not a full-suite pass.",
  "child_pid": 43048,
  "exit_code": 1,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 24723947520,
    "swapins": 44114305,
    "swapouts": 77536098,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   457379.\nPages active:                                 765168.\nPages inactive:                               537402.\nPages speculative:                            249835.\nPages throttled:                                   0.\nPages wired down:                             331827.\nPages purgeable:                                3667.\n\"Translation faults\":                    15632436521.\nPages copy-on-write:                       752018753.\nPages zero filled:                       21536870256.\nPages reactivated:                        3535895434.\nPages purged:                               73729502.\nFile-backed pages:                           1047984.\nAnonymous pages:                              504421.\nPages stored in compressor:                  1879948.\nPages occupied by compressor:                 741441.\nDecompressions:                           1191682224.\nCompressions:                             1508836240.\nPageins:                                  7784099824.\nPageouts:                                   11146759.\nSwapins:                                    44114305.\nSwapouts:                                   77536098.\nPages tagged:                                 175046.\nPages tagged resident:                        116362.\nPages tagged compressed:                       58684.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6924.\nPages tag-storage free:                         2498.\nPages tag-storage non-tag pageable:            88874.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9137600.\nTagged compressions:                        11490243.\nTagged decompressions:                      10584027.\n"
  },
  "remaining_owned_members": [],
  "owned_groups": [
    43048
  ],
  "remaining_owned_members_after_cleanup": [],
  "elapsed_seconds": 2.119486833,
  "child_exit_code": 1,
  "after_cleanup": {
    "page_bytes": 16384,
    "reclaimable_bytes": 24717344768,
    "swapins": 44114305,
    "swapouts": 77536098,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   455763.\nPages active:                                 765514.\nPages inactive:                               537804.\nPages speculative:                            250642.\nPages throttled:                                   0.\nPages wired down:                             331832.\nPages purgeable:                                3667.\n\"Translation faults\":                    15632442426.\nPages copy-on-write:                       752019555.\nPages zero filled:                       21536873704.\nPages reactivated:                        3535895434.\nPages purged:                               73729502.\nFile-backed pages:                           1049197.\nAnonymous pages:                              504757.\nPages stored in compressor:                  1879948.\nPages occupied by compressor:                 741441.\nDecompressions:                           1191682224.\nCompressions:                             1508836240.\nPageins:                                  7784100248.\nPageouts:                                   11146759.\nSwapins:                                    44114305.\nSwapouts:                                   77536098.\nPages tagged:                                 175046.\nPages tagged resident:                        116362.\nPages tagged compressed:                       58684.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6924.\nPages tag-storage free:                         2495.\nPages tag-storage non-tag pageable:            88877.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9137600.\nTagged compressions:                        11490243.\nTagged decompressions:                      10584027.\n"
  }
}
````

## /Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v290/stderr.txt

SHA-256 `9fca1de427d624a31a9e72f5d891a016b6f260bb653f792bed3e6b2bc54b45f7`; 88 bytes.

````text
long-memory pre-launch quiet interval had VM activity; long-memory request not launched
````

## /Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v290/stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v287/manifest.json

SHA-256 `596738f21c3cfe6c88c679e679c1c7fd493eb79222481b2606ea101614965f54`; 4637 bytes.

````text
{
  "passed": false,
  "protocol_sha256": "91ccfcbfc3320f39ad113f922883cafa83f56178387d25d9366da5adc3fc587b",
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 23384342528,
    "swapins": 44114165,
    "swapouts": 77536050,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   237787.\nPages active:                                 950855.\nPages inactive:                               542644.\nPages speculative:                            411447.\nPages throttled:                                   0.\nPages wired down:                             312356.\nPages purgeable:                               11368.\n\"Translation faults\":                    15614851232.\nPages copy-on-write:                       750660139.\nPages zero filled:                       21520718374.\nPages reactivated:                        3524436684.\nPages purged:                               73502729.\nFile-backed pages:                           1178112.\nAnonymous pages:                              726834.\nPages stored in compressor:                  1652695.\nPages occupied by compressor:                 623777.\nDecompressions:                           1187608767.\nCompressions:                             1504277008.\nPageins:                                  7756234683.\nPageouts:                                   11142971.\nSwapins:                                    44114165.\nSwapouts:                                   77536050.\nPages tagged:                                 177260.\nPages tagged resident:                        121813.\nPages tagged compressed:                       55447.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6932.\nPages tag-storage free:                         6850.\nPages tag-storage non-tag pageable:            84514.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8561600.\nTagged compressions:                        11455836.\nTagged decompressions:                      10554349.\n"
  },
  "exit_code": 64,
  "summary": [],
  "skips": [],
  "failures": [
    "FAIL  speculative decode gates"
  ],
  "elapsed_seconds": 176.443293166,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 27085799424,
    "swapins": 44114293,
    "swapouts": 77536050,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   528967.\nPages active:                                 684997.\nPages inactive:                               566947.\nPages speculative:                            121023.\nPages throttled:                                   0.\nPages wired down:                             343350.\nPages purgeable:                                9053.\n\"Translation faults\":                    15619571860.\nPages copy-on-write:                       751106381.\nPages zero filled:                       21524159106.\nPages reactivated:                        3526037413.\nPages purged:                               73547260.\nFile-backed pages:                           1115166.\nAnonymous pages:                              257801.\nPages stored in compressor:                  2073001.\nPages occupied by compressor:                 839638.\nDecompressions:                           1188422740.\nCompressions:                             1505689919.\nPageins:                                  7763897178.\nPageouts:                                   11143673.\nSwapins:                                    44114293.\nSwapouts:                                   77536050.\nPages tagged:                                 173877.\nPages tagged resident:                        110021.\nPages tagged compressed:                       63856.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6931.\nPages tag-storage free:                          512.\nPages tag-storage non-tag pageable:            90852.\nPages tag-storage non-tag wired:                   9.\nBytes of compressed tags:                   10220544.\nTagged compressions:                        11466694.\nTagged decompressions:                      10556760.\n"
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
  "candidate_unchanged": true,
  "drivers_unchanged": true,
  "remaining_jobs": [],
  "model_lock_free": true,
  "within_reservation": true
}
````

## /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v287/memory.json

SHA-256 `407459324859fde932887710d0ccb98567b7c75aba751fc4615f2b63cc2b7282`; 167494 bytes.

````text
{
  "command": [
    "bash",
    "/tmp/slotstream-optimization-execution/verification-recovery-v287/checks.sh"
  ],
  "policy": {
    "startup_reclaimable_bytes": 21000000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 17500000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 1036,
    "stop_on_new_swapouts": false
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 23382671360,
    "swapins": 44114165,
    "swapouts": 77536050,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   237684.\nPages active:                                 950868.\nPages inactive:                               542644.\nPages speculative:                            411448.\nPages throttled:                                   0.\nPages wired down:                             312356.\nPages purgeable:                               11368.\n\"Translation faults\":                    15614854511.\nPages copy-on-write:                       750660723.\nPages zero filled:                       21520719587.\nPages reactivated:                        3524436684.\nPages purged:                               73502729.\nFile-backed pages:                           1178113.\nAnonymous pages:                              726847.\nPages stored in compressor:                  1652695.\nPages occupied by compressor:                 623777.\nDecompressions:                           1187608767.\nCompressions:                             1504277008.\nPageins:                                  7756234687.\nPageouts:                                   11142971.\nSwapins:                                    44114165.\nSwapouts:                                   77536050.\nPages tagged:                                 177260.\nPages tagged resident:                        121813.\nPages tagged compressed:                       55447.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6932.\nPages tag-storage free:                         6846.\nPages tag-storage non-tag pageable:            84518.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8561600.\nTagged compressions:                        11455836.\nTagged decompressions:                      10554349.\n"
  },
  "samples": [
    {
      "elapsed_seconds": 0.0013184579999999946,
      "owned_rss_bytes": 2097152,
      "owned_process_count": 2,
      "reclaimable_bytes": 23377821696,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 0.22166445799999998,
      "owned_rss_bytes": 1300529152,
      "owned_process_count": 2,
      "reclaimable_bytes": 21898067968,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 0.45181758299999997,
      "owned_rss_bytes": 2628599808,
      "owned_process_count": 2,
      "reclaimable_bytes": 17756028928,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 0.6881627499999999,
      "owned_rss_bytes": 2713042944,
      "owned_process_count": 2,
      "reclaimable_bytes": 16113352704,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 0.907634,
      "owned_rss_bytes": 2787360768,
      "owned_process_count": 2,
      "reclaimable_bytes": 16037281792,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 1.137294833,
      "owned_rss_bytes": 3092676608,
      "owned_process_count": 2,
      "reclaimable_bytes": 15683829760,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 1.367714833,
      "owned_rss_bytes": 3115565056,
      "owned_process_count": 2,
      "reclaimable_bytes": 15626436608,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 1.5961765829999999,
      "owned_rss_bytes": 3123527680,
      "owned_process_count": 2,
      "reclaimable_bytes": 15623929856,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 1.8355537499999999,
      "owned_rss_bytes": 3149938688,
      "owned_process_count": 2,
      "reclaimable_bytes": 15642411008,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 2.0710045,
      "owned_rss_bytes": 3150856192,
      "owned_process_count": 2,
      "reclaimable_bytes": 15620407296,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 2.299119792,
      "owned_rss_bytes": 3151282176,
      "owned_process_count": 2,
      "reclaimable_bytes": 15597928448,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 2.540078333,
      "owned_rss_bytes": 3151986688,
      "owned_process_count": 2,
      "reclaimable_bytes": 15528656896,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 2.767513417,
      "owned_rss_bytes": 3152265216,
      "owned_process_count": 2,
      "reclaimable_bytes": 15366537216,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 2.998332125,
      "owned_rss_bytes": 3152543744,
      "owned_process_count": 2,
      "reclaimable_bytes": 15351201792,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 3.223296875,
      "owned_rss_bytes": 3152936960,
      "owned_process_count": 2,
      "reclaimable_bytes": 15344975872,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 3.45085775,
      "owned_rss_bytes": 3153199104,
      "owned_process_count": 2,
      "reclaimable_bytes": 15340617728,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 3.67809675,
      "owned_rss_bytes": 3153149952,
      "owned_process_count": 2,
      "reclaimable_bytes": 16610000896,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 3.914218125,
      "owned_rss_bytes": 3153412096,
      "owned_process_count": 2,
      "reclaimable_bytes": 16579379200,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 4.140302333,
      "owned_rss_bytes": 3153444864,
      "owned_process_count": 2,
      "reclaimable_bytes": 16568188928,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 4.377153750000001,
      "owned_rss_bytes": 3153494016,
      "owned_process_count": 2,
      "reclaimable_bytes": 16604332032,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 4.616472708000001,
      "owned_rss_bytes": 3153559552,
      "owned_process_count": 2,
      "reclaimable_bytes": 16589275136,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 4.85329,
      "owned_rss_bytes": 3153625088,
      "owned_process_count": 2,
      "reclaimable_bytes": 16569106432,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 5.082660125,
      "owned_rss_bytes": 3153739776,
      "owned_process_count": 2,
      "reclaimable_bytes": 16525344768,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 5.308568542000001,
      "owned_rss_bytes": 3153805312,
      "owned_process_count": 2,
      "reclaimable_bytes": 16421027840,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 5.538831792000001,
      "owned_rss_bytes": 3153936384,
      "owned_process_count": 2,
      "reclaimable_bytes": 16335634432,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 5.765782167,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16325509120,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 5.989415875000001,
      "owned_rss_bytes": 3154165760,
      "owned_process_count": 2,
      "reclaimable_bytes": 16330964992,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 6.2143310000000005,
      "owned_rss_bytes": 3154280448,
      "owned_process_count": 2,
      "reclaimable_bytes": 16324591616,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 6.447585833000001,
      "owned_rss_bytes": 3154362368,
      "owned_process_count": 2,
      "reclaimable_bytes": 16328425472,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 6.683889000000001,
      "owned_rss_bytes": 3154362368,
      "owned_process_count": 2,
      "reclaimable_bytes": 16407379968,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 6.933250583,
      "owned_rss_bytes": 3154362368,
      "owned_process_count": 2,
      "reclaimable_bytes": 16409853952,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 7.1810545,
      "owned_rss_bytes": 3154362368,
      "owned_process_count": 2,
      "reclaimable_bytes": 16420896768,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 7.428177125,
      "owned_rss_bytes": 3154395136,
      "owned_process_count": 2,
      "reclaimable_bytes": 16417423360,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 7.6753402920000005,
      "owned_rss_bytes": 3154395136,
      "owned_process_count": 2,
      "reclaimable_bytes": 16489512960,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 7.922868708000001,
      "owned_rss_bytes": 3154395136,
      "owned_process_count": 2,
      "reclaimable_bytes": 16488890368,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 8.169603333,
      "owned_rss_bytes": 3154395136,
      "owned_process_count": 2,
      "reclaimable_bytes": 16492003328,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 8.417691667,
      "owned_rss_bytes": 3154395136,
      "owned_process_count": 2,
      "reclaimable_bytes": 16490659840,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 8.6651035,
      "owned_rss_bytes": 3154395136,
      "owned_process_count": 2,
      "reclaimable_bytes": 16489398272,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 8.912188875,
      "owned_rss_bytes": 3154395136,
      "owned_process_count": 2,
      "reclaimable_bytes": 16489611264,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 9.160408542,
      "owned_rss_bytes": 3154395136,
      "owned_process_count": 2,
      "reclaimable_bytes": 16488169472,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 9.408299208,
      "owned_rss_bytes": 3154395136,
      "owned_process_count": 2,
      "reclaimable_bytes": 16414441472,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 9.657865375,
      "owned_rss_bytes": 3154395136,
      "owned_process_count": 2,
      "reclaimable_bytes": 16413949952,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 9.906781917,
      "owned_rss_bytes": 3154395136,
      "owned_process_count": 2,
      "reclaimable_bytes": 16410771456,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 10.156618083,
      "owned_rss_bytes": 3154395136,
      "owned_process_count": 2,
      "reclaimable_bytes": 16405528576,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 10.405177042,
      "owned_rss_bytes": 3154395136,
      "owned_process_count": 2,
      "reclaimable_bytes": 16409051136,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 10.6538085,
      "owned_rss_bytes": 3154345984,
      "owned_process_count": 2,
      "reclaimable_bytes": 16485302272,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 10.902309833,
      "owned_rss_bytes": 3154264064,
      "owned_process_count": 2,
      "reclaimable_bytes": 16486268928,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 11.151431333,
      "owned_rss_bytes": 3154165760,
      "owned_process_count": 2,
      "reclaimable_bytes": 16488988672,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 11.402092083000001,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16489742336,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 11.650990958000001,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16491036672,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 11.898384208,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16489660416,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 12.144639333,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16489201664,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 12.391681292000001,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16489365504,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 12.638860750000001,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16491102208,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 12.885632583,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16490233856,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 13.132602958,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16487497728,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 13.379345958,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16488579072,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 13.628148208,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16420569088,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 13.873924333,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16350461952,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 14.121565833,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16345710592,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 14.371471958,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16339517440,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 14.619302583,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16337354752,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 14.869268250000001,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16339714048,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 15.117296583,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16419389440,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 15.367112375,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16415506432,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 15.615440958,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16416440320,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 15.863617583,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16415129600,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 16.11208925,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16420470784,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 16.358295417,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16420241408,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 16.60447475,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16423387136,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 16.851224958,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16417669120,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 17.098137625,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16421060608,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 17.345627833,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16420077568,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 17.59253175,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16420175872,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 17.839224125,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16419012608,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 18.087049917,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16415997952,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 18.334643500000002,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16417603584,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 18.581944708,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16343252992,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 18.830029,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16340467712,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 19.079395625,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16336027648,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 19.329910208,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16335650816,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 19.579324917,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16336453632,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 19.827185583000002,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16408887296,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 20.068746292,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16405495808,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 20.317406000000002,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16414769152,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 20.566707917,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16419373056,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 20.815913958,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16419651584,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 21.063100625,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16417849344,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 21.308999625000002,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16418095104,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 21.556473917,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16422502400,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 21.802669167,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16418865152,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 22.050251917,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16419586048,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 22.297551125000002,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16422322176,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 22.545075,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16418193408,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 22.784536667,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16418783232,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 23.032818333,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16342122496,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 23.282147958,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16333586432,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 23.527984917,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16331227136,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 23.778132458,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16332292096,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 24.025803958,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16346595328,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 24.26534075,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16238018560,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 24.514784333,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16237330432,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 24.763452542,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16238116864,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 25.011322125,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16407330816,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 25.259039375,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16580640768,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 25.505853167,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16584753152,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 25.751611833000002,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16583000064,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 25.999281,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16585097216,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 26.245623875,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16582131712,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 26.491803875,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16581312512,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 26.7383615,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16582967296,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 26.979272208,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16581541888,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 27.226869625,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16579854336,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 27.47324975,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16498884608,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 27.722680917,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16493412352,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 27.971678958000002,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16494411776,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 28.220667792,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16493658112,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 28.469892292,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16492429312,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 28.719293958,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16566566912,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 28.968739833,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16565616640,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 29.217671583,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16566632448,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 29.466679083,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16573153280,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 29.714765125,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16569516032,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 29.962173333,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16567582720,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 30.209133667,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16568287232,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 30.45566875,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16566009856,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 30.7036355,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16567697408,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 30.9506615,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16565616640,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 31.198071792,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16565207040,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 31.445318042,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16569565184,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 31.694297292,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16565370880,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 31.941768832999998,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16486137856,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 32.189036417,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16488660992,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 32.43829425,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16482254848,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 32.6872015,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16479518720,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 32.936609708,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16463282176,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 33.169320917,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16481042432,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 33.396456833,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16482795520,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 33.645811583,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16493379584,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 33.894152208,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16560914432,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 34.143110792,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16561864704,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 34.383018125,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16562765824,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 34.6302735,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16566304768,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 34.877608708000004,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16566730752,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 35.124386,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16564371456,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 35.372207167,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16561700864,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 35.618949417,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16563077120,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 35.857140583,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16561471488,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 36.10386725,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16558407680,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 36.344979917,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16559718400,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 36.591138958,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16559210496,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 36.839086333,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16559177728,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 37.087187292,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16486842368,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 37.336977958,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16484302848,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 37.586110333,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16483680256,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 37.823453875,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16480632832,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 38.071025542,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16493412352,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 38.319325083,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16494608384,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 38.563853208,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16571334656,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 38.81314325,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16566501376,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 39.060651083,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16567238656,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 39.309046875,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16571629568,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 39.555796417,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16567828480,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 39.80004775,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16568025088,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 40.046520542,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16570335232,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 40.292153292,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16570417152,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 40.5394045,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16568434688,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 40.7860315,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16573218816,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 41.032894708,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16569909248,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 41.281912750000004,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16568057856,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 41.527069125,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16500178944,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 41.772499167,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16491249664,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 42.01711575,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16488841216,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 42.268014875,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16487317504,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 42.513932583,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16486858752,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 42.761532042,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16565157888,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 43.001372708,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16565420032,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 43.250913042,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16568369152,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 43.498708792,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16564682752,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 43.7465385,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16568877056,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 43.985933875,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16568385536,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 44.233520833,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16570630144,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 44.4794265,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16570384384,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 44.7264285,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16570318848,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 44.973528667000004,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16567631872,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 45.220228875000004,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16571482112,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 45.45900575,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16566091776,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 45.680789208,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16568287232,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 45.92412875,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16494116864,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 46.174435083,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16366174208,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 46.422911875,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16361144320,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 46.672635208,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16359227392,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 46.924606542,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16362815488,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 47.173609125,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16270344192,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 47.423488125,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16273145856,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 47.672189125,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16270049280,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 47.924232792,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16269492224,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 48.17197625,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16277176320,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 48.418444208000004,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16450043904,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 48.664521875,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16448208896,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 48.9125515,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16448765952,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 49.159806167,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16563109888,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 49.406179125,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16559620096,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 49.653215708,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16562339840,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 49.901066292,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16560472064,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 50.1494825,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16562798592,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 50.3968965,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16485367808,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 50.645666208,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16477913088,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 50.898461042,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16473079808,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 51.14861575,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16471670784,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 51.396514917,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16297902080,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 51.645029208,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16375480320,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 51.894000542,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16378314752,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 52.142273208,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16380952576,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 52.3902815,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16386015232,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 52.639097708,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16548102144,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 52.886431667000004,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16545857536,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 53.12926575,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16547643392,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 53.37684575,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16555098112,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 53.622838292,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16552787968,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 53.869358333,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16565174272,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 54.116383042,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16569712640,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 54.353579375,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16174465024,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 54.593044833,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16172449792,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 54.841681583,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16070983680,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 55.090601,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 15912960000,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 55.329166875,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 15910846464,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 55.579940583,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16085991424,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 55.82882525,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16088875008,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 56.075636875,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16086253568,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 56.32362775,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16295067648,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 56.571720833,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16366059520,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 56.819179708,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16369500160,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 57.066587083,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16373202944,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 57.306859833,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16417406976,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 57.53908425,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16434135040,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 57.773264125,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16435855360,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 58.021167708,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16434266112,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 58.268089667,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16437018624,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 58.515853708,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16437018624,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 58.763848208,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16435462144,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 59.011365542,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16360620032,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 59.258006042,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16363585536,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 59.504638458,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16356409344,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 59.754034042,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16358195200,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 60.001825833,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16358490112,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 60.251790833,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16358604800,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 60.498555333,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16361668608,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 60.746926708000004,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16356524032,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 60.995242417,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16354983936,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 61.240491125,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16356147200,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 61.488137375,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16351412224,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 61.738891125,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16354885632,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 61.986744125,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16366092288,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 62.231127583,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16364421120,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 62.473797875,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16365568000,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 62.724197833,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16368205824,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 62.973329583,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16363601920,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 63.222170917,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16365830144,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 63.472823708,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16365944832,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 63.722057792,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16430497792,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 63.968846375000005,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16429400064,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 64.21775724999999,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16440918016,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 64.46736387499999,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16441999360,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 64.71711454199999,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16445292544,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 64.96318174999999,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16446439424,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 65.21027025,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16448258048,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 65.457418542,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16445489152,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 65.704747375,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16445194240,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 65.94386354199999,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16449667072,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 66.190433292,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16452059136,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 66.436944333,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16452255744,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 66.68127520799999,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16449880064,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 66.927961,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16451846144,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 67.17434254199999,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16371433472,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 67.42294899999999,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16366354432,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 67.67123220799999,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16361046016,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 67.92243475,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16359424000,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 68.170367667,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16360275968,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 68.41874329199999,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16440541184,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 68.666595792,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16441327616,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 68.91524262499999,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16440901632,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 69.16270779199999,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16443457536,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 69.408954333,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16441917440,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 69.655222375,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16442261504,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 69.902172958,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16440328192,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 70.14924024999999,
      "owned_rss_bytes": 3154034688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16377085952,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 70.389409125,
      "owned_rss_bytes": 3153887232,
      "owned_process_count": 2,
      "reclaimable_bytes": 13374701568,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 70.62903779199999,
      "owned_rss_bytes": 3181625344,
      "owned_process_count": 2,
      "reclaimable_bytes": 13756973056,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 70.857708292,
      "owned_rss_bytes": 3181674496,
      "owned_process_count": 2,
      "reclaimable_bytes": 13653540864,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 71.085421,
      "owned_rss_bytes": 3181805568,
      "owned_process_count": 2,
      "reclaimable_bytes": 13629816832,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 71.313650083,
      "owned_rss_bytes": 3181821952,
      "owned_process_count": 2,
      "reclaimable_bytes": 13603913728,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 71.54946212499999,
      "owned_rss_bytes": 3181887488,
      "owned_process_count": 2,
      "reclaimable_bytes": 13585891328,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 71.787854208,
      "owned_rss_bytes": 3181936640,
      "owned_process_count": 2,
      "reclaimable_bytes": 13548339200,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 72.016761542,
      "owned_rss_bytes": 3182100480,
      "owned_process_count": 2,
      "reclaimable_bytes": 13547814912,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 72.24326054199999,
      "owned_rss_bytes": 3182231552,
      "owned_process_count": 2,
      "reclaimable_bytes": 13582286848,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 72.47106529199999,
      "owned_rss_bytes": 3182428160,
      "owned_process_count": 2,
      "reclaimable_bytes": 13577420800,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 72.69478783299999,
      "owned_rss_bytes": 3182624768,
      "owned_process_count": 2,
      "reclaimable_bytes": 13589708800,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 72.929458625,
      "owned_rss_bytes": 2195456,
      "owned_process_count": 2,
      "reclaimable_bytes": 18559942656,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 73.170090875,
      "owned_rss_bytes": 142950400,
      "owned_process_count": 2,
      "reclaimable_bytes": 23473242112,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 73.41038424999999,
      "owned_rss_bytes": 142950400,
      "owned_process_count": 2,
      "reclaimable_bytes": 23471767552,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 73.938103833,
      "owned_rss_bytes": 142950400,
      "owned_process_count": 2,
      "reclaimable_bytes": 24173789184,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 74.25563054199999,
      "owned_rss_bytes": 142884864,
      "owned_process_count": 2,
      "reclaimable_bytes": 24126898176,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 74.526271375,
      "owned_rss_bytes": 142884864,
      "owned_process_count": 2,
      "reclaimable_bytes": 24127504384,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 74.759389625,
      "owned_rss_bytes": 142884864,
      "owned_process_count": 2,
      "reclaimable_bytes": 24133435392,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 74.991911875,
      "owned_rss_bytes": 142884864,
      "owned_process_count": 2,
      "reclaimable_bytes": 24156733440,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 75.223238083,
      "owned_rss_bytes": 142884864,
      "owned_process_count": 2,
      "reclaimable_bytes": 24136876032,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 75.460467083,
      "owned_rss_bytes": 142884864,
      "owned_process_count": 2,
      "reclaimable_bytes": 24140218368,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 75.75164649999999,
      "owned_rss_bytes": 142884864,
      "owned_process_count": 2,
      "reclaimable_bytes": 24148377600,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 75.98664783299999,
      "owned_rss_bytes": 142884864,
      "owned_process_count": 2,
      "reclaimable_bytes": 24138383360,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 76.21826179199999,
      "owned_rss_bytes": 142884864,
      "owned_process_count": 2,
      "reclaimable_bytes": 24144723968,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 76.45815562499999,
      "owned_rss_bytes": 142884864,
      "owned_process_count": 2,
      "reclaimable_bytes": 25382469632,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 76.68921987499999,
      "owned_rss_bytes": 142884864,
      "owned_process_count": 2,
      "reclaimable_bytes": 25381830656,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 76.924464375,
      "owned_rss_bytes": 142884864,
      "owned_process_count": 2,
      "reclaimable_bytes": 25371344896,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 77.165318292,
      "owned_rss_bytes": 142884864,
      "owned_process_count": 2,
      "reclaimable_bytes": 25370427392,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 77.4027005,
      "owned_rss_bytes": 142884864,
      "owned_process_count": 2,
      "reclaimable_bytes": 25366216704,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 77.63913224999999,
      "owned_rss_bytes": 142884864,
      "owned_process_count": 2,
      "reclaimable_bytes": 25371197440,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 77.868491208,
      "owned_rss_bytes": 142884864,
      "owned_process_count": 2,
      "reclaimable_bytes": 25368166400,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 78.12120966699999,
      "owned_rss_bytes": 142884864,
      "owned_process_count": 2,
      "reclaimable_bytes": 25357074432,
      "swapins": 44114165,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 78.41738029199999,
      "owned_rss_bytes": 142721024,
      "owned_process_count": 2,
      "reclaimable_bytes": 25345114112,
      "swapins": 44114169,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 78.65481841699999,
      "owned_rss_bytes": 142721024,
      "owned_process_count": 2,
      "reclaimable_bytes": 25266831360,
      "swapins": 44114177,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 78.896930458,
      "owned_rss_bytes": 142721024,
      "owned_process_count": 2,
      "reclaimable_bytes": 25251446784,
      "swapins": 44114197,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 79.230543,
      "owned_rss_bytes": 142721024,
      "owned_process_count": 2,
      "reclaimable_bytes": 25232064512,
      "swapins": 44114221,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 79.48555683299999,
      "owned_rss_bytes": 142688256,
      "owned_process_count": 2,
      "reclaimable_bytes": 25227149312,
      "swapins": 44114237,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 79.719049,
      "owned_rss_bytes": 142688256,
      "owned_process_count": 2,
      "reclaimable_bytes": 25219776512,
      "swapins": 44114257,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 79.953741,
      "owned_rss_bytes": 142655488,
      "owned_process_count": 2,
      "reclaimable_bytes": 25300746240,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 80.189983833,
      "owned_rss_bytes": 142655488,
      "owned_process_count": 2,
      "reclaimable_bytes": 25339674624,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 80.430446542,
      "owned_rss_bytes": 143458304,
      "owned_process_count": 2,
      "reclaimable_bytes": 25426198528,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 80.65773775,
      "owned_rss_bytes": 143458304,
      "owned_process_count": 2,
      "reclaimable_bytes": 25397886976,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 80.89077391699999,
      "owned_rss_bytes": 143458304,
      "owned_process_count": 2,
      "reclaimable_bytes": 25300123648,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 81.11677925,
      "owned_rss_bytes": 1517191168,
      "owned_process_count": 2,
      "reclaimable_bytes": 23661379584,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 81.347777333,
      "owned_rss_bytes": 2526511104,
      "owned_process_count": 2,
      "reclaimable_bytes": 20282146816,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 81.60263487499999,
      "owned_rss_bytes": 1302642688,
      "owned_process_count": 2,
      "reclaimable_bytes": 18499698688,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 81.920281167,
      "owned_rss_bytes": 1105068032,
      "owned_process_count": 2,
      "reclaimable_bytes": 18401492992,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 82.15085616699999,
      "owned_rss_bytes": 1034321920,
      "owned_process_count": 2,
      "reclaimable_bytes": 17577738240,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 82.374162708,
      "owned_rss_bytes": 925990912,
      "owned_process_count": 2,
      "reclaimable_bytes": 16908238848,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 82.60681308299999,
      "owned_rss_bytes": 802635776,
      "owned_process_count": 2,
      "reclaimable_bytes": 16811884544,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 82.84349608299999,
      "owned_rss_bytes": 783040512,
      "owned_process_count": 2,
      "reclaimable_bytes": 16776757248,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 83.082053042,
      "owned_rss_bytes": 751616000,
      "owned_process_count": 2,
      "reclaimable_bytes": 16756588544,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 83.31760129199999,
      "owned_rss_bytes": 767000576,
      "owned_process_count": 2,
      "reclaimable_bytes": 16720199680,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 83.54511845799999,
      "owned_rss_bytes": 763592704,
      "owned_process_count": 2,
      "reclaimable_bytes": 16710598656,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 83.774629292,
      "owned_rss_bytes": 762003456,
      "owned_process_count": 2,
      "reclaimable_bytes": 16721428480,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 84.001094083,
      "owned_rss_bytes": 757923840,
      "owned_process_count": 2,
      "reclaimable_bytes": 16705388544,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 84.233756292,
      "owned_rss_bytes": 721682432,
      "owned_process_count": 2,
      "reclaimable_bytes": 16458465280,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 84.46921037499999,
      "owned_rss_bytes": 634798080,
      "owned_process_count": 2,
      "reclaimable_bytes": 16370122752,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 84.70041695799999,
      "owned_rss_bytes": 485949440,
      "owned_process_count": 2,
      "reclaimable_bytes": 16239542272,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 84.932114667,
      "owned_rss_bytes": 402096128,
      "owned_process_count": 2,
      "reclaimable_bytes": 16161325056,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 85.16478370799999,
      "owned_rss_bytes": 316604416,
      "owned_process_count": 2,
      "reclaimable_bytes": 16089546752,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 85.39257787499999,
      "owned_rss_bytes": 316817408,
      "owned_process_count": 2,
      "reclaimable_bytes": 16366780416,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 85.621014042,
      "owned_rss_bytes": 317014016,
      "owned_process_count": 2,
      "reclaimable_bytes": 16429907968,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 85.847650917,
      "owned_rss_bytes": 317145088,
      "owned_process_count": 2,
      "reclaimable_bytes": 16441638912,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 86.082082542,
      "owned_rss_bytes": 317341696,
      "owned_process_count": 2,
      "reclaimable_bytes": 16436002816,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 86.317752792,
      "owned_rss_bytes": 317440000,
      "owned_process_count": 2,
      "reclaimable_bytes": 16458760192,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 86.54500587499999,
      "owned_rss_bytes": 317521920,
      "owned_process_count": 2,
      "reclaimable_bytes": 16458301440,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 86.776634792,
      "owned_rss_bytes": 317751296,
      "owned_process_count": 2,
      "reclaimable_bytes": 16362127360,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 87.009922042,
      "owned_rss_bytes": 317931520,
      "owned_process_count": 2,
      "reclaimable_bytes": 16353755136,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 87.23665399999999,
      "owned_rss_bytes": 318144512,
      "owned_process_count": 2,
      "reclaimable_bytes": 16344875008,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 87.46219174999999,
      "owned_rss_bytes": 318308352,
      "owned_process_count": 2,
      "reclaimable_bytes": 16345710592,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 87.69493312499999,
      "owned_rss_bytes": 318406656,
      "owned_process_count": 2,
      "reclaimable_bytes": 16338010112,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 87.91827074999999,
      "owned_rss_bytes": 318570496,
      "owned_process_count": 2,
      "reclaimable_bytes": 16405839872,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 88.149976,
      "owned_rss_bytes": 318767104,
      "owned_process_count": 2,
      "reclaimable_bytes": 16397189120,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 88.37705874999999,
      "owned_rss_bytes": 318947328,
      "owned_process_count": 2,
      "reclaimable_bytes": 16419766272,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 88.60399762499999,
      "owned_rss_bytes": 319143936,
      "owned_process_count": 2,
      "reclaimable_bytes": 16404168704,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 88.83252733299999,
      "owned_rss_bytes": 319291392,
      "owned_process_count": 2,
      "reclaimable_bytes": 16402481152,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 89.066966,
      "owned_rss_bytes": 319455232,
      "owned_process_count": 2,
      "reclaimable_bytes": 16316678144,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 89.291411333,
      "owned_rss_bytes": 319684608,
      "owned_process_count": 2,
      "reclaimable_bytes": 16289087488,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 89.516965292,
      "owned_rss_bytes": 319848448,
      "owned_process_count": 2,
      "reclaimable_bytes": 16292954112,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 89.74819224999999,
      "owned_rss_bytes": 319995904,
      "owned_process_count": 2,
      "reclaimable_bytes": 16283533312,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 89.974008833,
      "owned_rss_bytes": 320159744,
      "owned_process_count": 2,
      "reclaimable_bytes": 16281862144,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 90.20749116699999,
      "owned_rss_bytes": 320258048,
      "owned_process_count": 2,
      "reclaimable_bytes": 16351019008,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 90.440569,
      "owned_rss_bytes": 320454656,
      "owned_process_count": 2,
      "reclaimable_bytes": 16365895680,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 90.674290667,
      "owned_rss_bytes": 320602112,
      "owned_process_count": 2,
      "reclaimable_bytes": 16363307008,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 90.89882075,
      "owned_rss_bytes": 578617344,
      "owned_process_count": 2,
      "reclaimable_bytes": 16357195776,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 91.131455917,
      "owned_rss_bytes": 693747712,
      "owned_process_count": 2,
      "reclaimable_bytes": 16348282880,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 91.355651833,
      "owned_rss_bytes": 705855488,
      "owned_process_count": 2,
      "reclaimable_bytes": 16035381248,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 91.58346624999999,
      "owned_rss_bytes": 706052096,
      "owned_process_count": 2,
      "reclaimable_bytes": 16035610624,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 91.80911462499999,
      "owned_rss_bytes": 714817536,
      "owned_process_count": 2,
      "reclaimable_bytes": 16026861568,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 92.04168241699999,
      "owned_rss_bytes": 715587584,
      "owned_process_count": 2,
      "reclaimable_bytes": 16027697152,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 92.26865062499999,
      "owned_rss_bytes": 716275712,
      "owned_process_count": 2,
      "reclaimable_bytes": 16027795456,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 92.498309333,
      "owned_rss_bytes": 716570624,
      "owned_process_count": 2,
      "reclaimable_bytes": 16177610752,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 92.72493633299999,
      "owned_rss_bytes": 716636160,
      "owned_process_count": 2,
      "reclaimable_bytes": 16184131584,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 92.958147083,
      "owned_rss_bytes": 716652544,
      "owned_process_count": 2,
      "reclaimable_bytes": 16174678016,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 93.19171741699999,
      "owned_rss_bytes": 716685312,
      "owned_process_count": 2,
      "reclaimable_bytes": 16172990464,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 93.416953458,
      "owned_rss_bytes": 716718080,
      "owned_process_count": 2,
      "reclaimable_bytes": 16182689792,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 93.64133162499999,
      "owned_rss_bytes": 716734464,
      "owned_process_count": 2,
      "reclaimable_bytes": 16191356928,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 93.86970491699999,
      "owned_rss_bytes": 716750848,
      "owned_process_count": 2,
      "reclaimable_bytes": 16202153984,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 94.10300687499999,
      "owned_rss_bytes": 716783616,
      "owned_process_count": 2,
      "reclaimable_bytes": 16270376960,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 94.33220474999999,
      "owned_rss_bytes": 716800000,
      "owned_process_count": 2,
      "reclaimable_bytes": 16276520960,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 94.56276129199999,
      "owned_rss_bytes": 716816384,
      "owned_process_count": 2,
      "reclaimable_bytes": 16280109056,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 94.792802083,
      "owned_rss_bytes": 716881920,
      "owned_process_count": 2,
      "reclaimable_bytes": 16277258240,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 95.021880958,
      "owned_rss_bytes": 716914688,
      "owned_process_count": 2,
      "reclaimable_bytes": 16192536576,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 95.24678583299999,
      "owned_rss_bytes": 716947456,
      "owned_process_count": 2,
      "reclaimable_bytes": 16187260928,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 95.470874625,
      "owned_rss_bytes": 716947456,
      "owned_process_count": 2,
      "reclaimable_bytes": 16191586304,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 95.69622420799999,
      "owned_rss_bytes": 716980224,
      "owned_process_count": 2,
      "reclaimable_bytes": 16187113472,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 95.929024417,
      "owned_rss_bytes": 717012992,
      "owned_process_count": 2,
      "reclaimable_bytes": 16182460416,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 96.153397292,
      "owned_rss_bytes": 717078528,
      "owned_process_count": 2,
      "reclaimable_bytes": 16191242240,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 96.38460024999999,
      "owned_rss_bytes": 717127680,
      "owned_process_count": 2,
      "reclaimable_bytes": 16188129280,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 96.608179208,
      "owned_rss_bytes": 717144064,
      "owned_process_count": 2,
      "reclaimable_bytes": 16189947904,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 96.83523908299999,
      "owned_rss_bytes": 717176832,
      "owned_process_count": 2,
      "reclaimable_bytes": 16205807616,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 97.057357625,
      "owned_rss_bytes": 717209600,
      "owned_process_count": 2,
      "reclaimable_bytes": 16272424960,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 97.283727417,
      "owned_rss_bytes": 717225984,
      "owned_process_count": 2,
      "reclaimable_bytes": 16278454272,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 97.51712049999999,
      "owned_rss_bytes": 717275136,
      "owned_process_count": 2,
      "reclaimable_bytes": 16280240128,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 97.744581833,
      "owned_rss_bytes": 717307904,
      "owned_process_count": 2,
      "reclaimable_bytes": 16267427840,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 97.97335591699999,
      "owned_rss_bytes": 717340672,
      "owned_process_count": 2,
      "reclaimable_bytes": 16192110592,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 98.198531042,
      "owned_rss_bytes": 717389824,
      "owned_process_count": 2,
      "reclaimable_bytes": 16191127552,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 98.42203158299999,
      "owned_rss_bytes": 717389824,
      "owned_process_count": 2,
      "reclaimable_bytes": 16173760512,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 98.64792154199999,
      "owned_rss_bytes": 717422592,
      "owned_process_count": 2,
      "reclaimable_bytes": 16181755904,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 98.88107049999999,
      "owned_rss_bytes": 717455360,
      "owned_process_count": 2,
      "reclaimable_bytes": 16167976960,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 99.108861417,
      "owned_rss_bytes": 717455360,
      "owned_process_count": 2,
      "reclaimable_bytes": 16177086464,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 99.337395917,
      "owned_rss_bytes": 717471744,
      "owned_process_count": 2,
      "reclaimable_bytes": 16169648128,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 99.564210542,
      "owned_rss_bytes": 717488128,
      "owned_process_count": 2,
      "reclaimable_bytes": 16168321024,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 99.795360292,
      "owned_rss_bytes": 717488128,
      "owned_process_count": 2,
      "reclaimable_bytes": 16192585728,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 100.02414624999999,
      "owned_rss_bytes": 717537280,
      "owned_process_count": 2,
      "reclaimable_bytes": 16264806400,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 100.250271833,
      "owned_rss_bytes": 717619200,
      "owned_process_count": 2,
      "reclaimable_bytes": 16264986624,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 100.48220737499999,
      "owned_rss_bytes": 717717504,
      "owned_process_count": 2,
      "reclaimable_bytes": 16271097856,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 100.70972087499999,
      "owned_rss_bytes": 717783040,
      "owned_process_count": 2,
      "reclaimable_bytes": 16226549760,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 100.940410375,
      "owned_rss_bytes": 717864960,
      "owned_process_count": 2,
      "reclaimable_bytes": 16111632384,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 101.166462125,
      "owned_rss_bytes": 717996032,
      "owned_process_count": 2,
      "reclaimable_bytes": 16106078208,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 101.39986083299999,
      "owned_rss_bytes": 718061568,
      "owned_process_count": 2,
      "reclaimable_bytes": 16101294080,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 101.633906875,
      "owned_rss_bytes": 718176256,
      "owned_process_count": 2,
      "reclaimable_bytes": 16103522304,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 101.866862167,
      "owned_rss_bytes": 718290944,
      "owned_process_count": 2,
      "reclaimable_bytes": 16100065280,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 102.090300667,
      "owned_rss_bytes": 718389248,
      "owned_process_count": 2,
      "reclaimable_bytes": 16099885056,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 102.31714716699999,
      "owned_rss_bytes": 718438400,
      "owned_process_count": 2,
      "reclaimable_bytes": 16113860608,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 102.54124875,
      "owned_rss_bytes": 718553088,
      "owned_process_count": 2,
      "reclaimable_bytes": 16111239168,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 102.770948167,
      "owned_rss_bytes": 718651392,
      "owned_process_count": 2,
      "reclaimable_bytes": 16115154944,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 102.99701599999999,
      "owned_rss_bytes": 718815232,
      "owned_process_count": 2,
      "reclaimable_bytes": 16192438272,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 103.22482041699999,
      "owned_rss_bytes": 718946304,
      "owned_process_count": 2,
      "reclaimable_bytes": 16181510144,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 103.44908091699999,
      "owned_rss_bytes": 719093760,
      "owned_process_count": 2,
      "reclaimable_bytes": 16199385088,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 103.67422733299999,
      "owned_rss_bytes": 719159296,
      "owned_process_count": 2,
      "reclaimable_bytes": 16202350592,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 103.89962558299999,
      "owned_rss_bytes": 719306752,
      "owned_process_count": 2,
      "reclaimable_bytes": 16198074368,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 104.13292,
      "owned_rss_bytes": 719372288,
      "owned_process_count": 2,
      "reclaimable_bytes": 16118136832,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 104.35665304199999,
      "owned_rss_bytes": 719486976,
      "owned_process_count": 2,
      "reclaimable_bytes": 16108322816,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 104.589800208,
      "owned_rss_bytes": 719650816,
      "owned_process_count": 2,
      "reclaimable_bytes": 16113909760,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 104.816625875,
      "owned_rss_bytes": 719896576,
      "owned_process_count": 2,
      "reclaimable_bytes": 16109010944,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 105.03971899999999,
      "owned_rss_bytes": 720125952,
      "owned_process_count": 2,
      "reclaimable_bytes": 16108814336,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 105.26780287499999,
      "owned_rss_bytes": 720273408,
      "owned_process_count": 2,
      "reclaimable_bytes": 16103620608,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 105.491816875,
      "owned_rss_bytes": 720404480,
      "owned_process_count": 2,
      "reclaimable_bytes": 16174235648,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 105.71680029199999,
      "owned_rss_bytes": 720633856,
      "owned_process_count": 2,
      "reclaimable_bytes": 16188293120,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 105.946120958,
      "owned_rss_bytes": 720781312,
      "owned_process_count": 2,
      "reclaimable_bytes": 16142303232,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 106.178879375,
      "owned_rss_bytes": 720928768,
      "owned_process_count": 2,
      "reclaimable_bytes": 16055402496,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 106.40427154199999,
      "owned_rss_bytes": 721141760,
      "owned_process_count": 2,
      "reclaimable_bytes": 16051077120,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 106.63014237499999,
      "owned_rss_bytes": 721305600,
      "owned_process_count": 2,
      "reclaimable_bytes": 15964209152,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 106.86268212499999,
      "owned_rss_bytes": 721600512,
      "owned_process_count": 2,
      "reclaimable_bytes": 15952429056,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 107.086477667,
      "owned_rss_bytes": 721813504,
      "owned_process_count": 2,
      "reclaimable_bytes": 15763439616,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 107.311880167,
      "owned_rss_bytes": 721960960,
      "owned_process_count": 2,
      "reclaimable_bytes": 15758983168,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 107.54488212499999,
      "owned_rss_bytes": 901890048,
      "owned_process_count": 2,
      "reclaimable_bytes": 15537307648,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 107.77390025,
      "owned_rss_bytes": 906051584,
      "owned_process_count": 2,
      "reclaimable_bytes": 15619211264,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 108.000379625,
      "owned_rss_bytes": 906067968,
      "owned_process_count": 2,
      "reclaimable_bytes": 15613067264,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 108.22891175,
      "owned_rss_bytes": 906100736,
      "owned_process_count": 2,
      "reclaimable_bytes": 15618310144,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 108.465009458,
      "owned_rss_bytes": 906149888,
      "owned_process_count": 2,
      "reclaimable_bytes": 15804071936,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 108.70147829199999,
      "owned_rss_bytes": 906199040,
      "owned_process_count": 2,
      "reclaimable_bytes": 15800352768,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 108.929272583,
      "owned_rss_bytes": 906199040,
      "owned_process_count": 2,
      "reclaimable_bytes": 15705800704,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 109.16774687499999,
      "owned_rss_bytes": 906231808,
      "owned_process_count": 2,
      "reclaimable_bytes": 15808036864,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 109.40304283299999,
      "owned_rss_bytes": 906231808,
      "owned_process_count": 2,
      "reclaimable_bytes": 15823585280,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 109.630081167,
      "owned_rss_bytes": 906412032,
      "owned_process_count": 2,
      "reclaimable_bytes": 15817588736,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 109.86029183299999,
      "owned_rss_bytes": 906510336,
      "owned_process_count": 2,
      "reclaimable_bytes": 15805874176,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 110.087544208,
      "owned_rss_bytes": 906559488,
      "owned_process_count": 2,
      "reclaimable_bytes": 15799844864,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 110.31173874999999,
      "owned_rss_bytes": 906575872,
      "owned_process_count": 2,
      "reclaimable_bytes": 15809888256,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 110.542382417,
      "owned_rss_bytes": 906657792,
      "owned_process_count": 2,
      "reclaimable_bytes": 15811035136,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 110.767287375,
      "owned_rss_bytes": 906903552,
      "owned_process_count": 2,
      "reclaimable_bytes": 15806709760,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 110.99948662499999,
      "owned_rss_bytes": 906985472,
      "owned_process_count": 2,
      "reclaimable_bytes": 15883091968,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 111.225045583,
      "owned_rss_bytes": 907018240,
      "owned_process_count": 2,
      "reclaimable_bytes": 15884386304,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 111.457001792,
      "owned_rss_bytes": 907149312,
      "owned_process_count": 2,
      "reclaimable_bytes": 15889973248,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 111.68229312499999,
      "owned_rss_bytes": 907214848,
      "owned_process_count": 2,
      "reclaimable_bytes": 15890743296,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 111.91265691699999,
      "owned_rss_bytes": 907247616,
      "owned_process_count": 2,
      "reclaimable_bytes": 15809167360,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 112.13766974999999,
      "owned_rss_bytes": 907296768,
      "owned_process_count": 2,
      "reclaimable_bytes": 15801597952,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 112.37019370799999,
      "owned_rss_bytes": 907345920,
      "owned_process_count": 2,
      "reclaimable_bytes": 15797108736,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 112.594822583,
      "owned_rss_bytes": 907395072,
      "owned_process_count": 2,
      "reclaimable_bytes": 15792799744,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 112.82485458299999,
      "owned_rss_bytes": 907411456,
      "owned_process_count": 2,
      "reclaimable_bytes": 15803219968,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 113.05851945799999,
      "owned_rss_bytes": 907444224,
      "owned_process_count": 2,
      "reclaimable_bytes": 15878897664,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 113.291981958,
      "owned_rss_bytes": 907476992,
      "owned_process_count": 2,
      "reclaimable_bytes": 15884845056,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 113.521514458,
      "owned_rss_bytes": 907509760,
      "owned_process_count": 2,
      "reclaimable_bytes": 15880880128,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 113.751666875,
      "owned_rss_bytes": 907542528,
      "owned_process_count": 2,
      "reclaimable_bytes": 15894183936,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 113.98216237499999,
      "owned_rss_bytes": 907575296,
      "owned_process_count": 2,
      "reclaimable_bytes": 15882600448,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 114.21548095799999,
      "owned_rss_bytes": 907624448,
      "owned_process_count": 2,
      "reclaimable_bytes": 15805595648,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 114.445311292,
      "owned_rss_bytes": 907689984,
      "owned_process_count": 2,
      "reclaimable_bytes": 15598190592,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 114.67747329199999,
      "owned_rss_bytes": 907755520,
      "owned_process_count": 2,
      "reclaimable_bytes": 15601106944,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 114.910353167,
      "owned_rss_bytes": 907804672,
      "owned_process_count": 2,
      "reclaimable_bytes": 15586557952,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 115.14410345799999,
      "owned_rss_bytes": 907870208,
      "owned_process_count": 2,
      "reclaimable_bytes": 15607021568,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 115.36893966699999,
      "owned_rss_bytes": 907886592,
      "owned_process_count": 2,
      "reclaimable_bytes": 15509323776,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 115.59257995799999,
      "owned_rss_bytes": 907919360,
      "owned_process_count": 2,
      "reclaimable_bytes": 15379415040,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 115.828945083,
      "owned_rss_bytes": 908148736,
      "owned_process_count": 2,
      "reclaimable_bytes": 15378366464,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 116.055941667,
      "owned_rss_bytes": 908197888,
      "owned_process_count": 2,
      "reclaimable_bytes": 15376580608,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 116.285006625,
      "owned_rss_bytes": 915095552,
      "owned_process_count": 2,
      "reclaimable_bytes": 15379120128,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 116.520929583,
      "owned_rss_bytes": 916045824,
      "owned_process_count": 2,
      "reclaimable_bytes": 15356854272,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 116.751545333,
      "owned_rss_bytes": 916389888,
      "owned_process_count": 2,
      "reclaimable_bytes": 15362211840,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 116.98367454199999,
      "owned_rss_bytes": 916750336,
      "owned_process_count": 2,
      "reclaimable_bytes": 15529623552,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 117.210127625,
      "owned_rss_bytes": 916799488,
      "owned_process_count": 2,
      "reclaimable_bytes": 15510159360,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 117.44747179199999,
      "owned_rss_bytes": 916832256,
      "owned_process_count": 2,
      "reclaimable_bytes": 15544647680,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 117.68127179199999,
      "owned_rss_bytes": 916848640,
      "owned_process_count": 2,
      "reclaimable_bytes": 15538683904,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 117.913380417,
      "owned_rss_bytes": 916865024,
      "owned_process_count": 2,
      "reclaimable_bytes": 15533391872,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 118.14496962499999,
      "owned_rss_bytes": 916881408,
      "owned_process_count": 2,
      "reclaimable_bytes": 15542976512,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 118.378577458,
      "owned_rss_bytes": 916979712,
      "owned_process_count": 2,
      "reclaimable_bytes": 15631581184,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 118.603579875,
      "owned_rss_bytes": 917028864,
      "owned_process_count": 2,
      "reclaimable_bytes": 15635169280,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 118.83268675,
      "owned_rss_bytes": 917061632,
      "owned_process_count": 2,
      "reclaimable_bytes": 15620751360,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 119.059071292,
      "owned_rss_bytes": 917094400,
      "owned_process_count": 2,
      "reclaimable_bytes": 15622766592,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 119.282904792,
      "owned_rss_bytes": 917110784,
      "owned_process_count": 2,
      "reclaimable_bytes": 15546908672,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 119.50889541699999,
      "owned_rss_bytes": 917127168,
      "owned_process_count": 2,
      "reclaimable_bytes": 15543500800,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 119.734117958,
      "owned_rss_bytes": 917176320,
      "owned_process_count": 2,
      "reclaimable_bytes": 15537520640,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 119.960812167,
      "owned_rss_bytes": 917192704,
      "owned_process_count": 2,
      "reclaimable_bytes": 15539257344,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 120.18761875,
      "owned_rss_bytes": 917225472,
      "owned_process_count": 2,
      "reclaimable_bytes": 15542960128,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 120.42037475,
      "owned_rss_bytes": 917241856,
      "owned_process_count": 2,
      "reclaimable_bytes": 15537455104,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 120.646817958,
      "owned_rss_bytes": 917258240,
      "owned_process_count": 2,
      "reclaimable_bytes": 15542468608,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 120.880322833,
      "owned_rss_bytes": 917307392,
      "owned_process_count": 2,
      "reclaimable_bytes": 15540846592,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 121.11487849999999,
      "owned_rss_bytes": 917340160,
      "owned_process_count": 2,
      "reclaimable_bytes": 15540961280,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 121.33969016699999,
      "owned_rss_bytes": 917356544,
      "owned_process_count": 2,
      "reclaimable_bytes": 15539519488,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 121.56597724999999,
      "owned_rss_bytes": 917372928,
      "owned_process_count": 2,
      "reclaimable_bytes": 15534866432,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 121.79929545799999,
      "owned_rss_bytes": 917405696,
      "owned_process_count": 2,
      "reclaimable_bytes": 15532244992,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 122.024632458,
      "owned_rss_bytes": 917438464,
      "owned_process_count": 2,
      "reclaimable_bytes": 15536095232,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 122.2496025,
      "owned_rss_bytes": 917471232,
      "owned_process_count": 2,
      "reclaimable_bytes": 15539044352,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 122.47993791699999,
      "owned_rss_bytes": 917504000,
      "owned_process_count": 2,
      "reclaimable_bytes": 15535767552,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 122.70801437499999,
      "owned_rss_bytes": 917553152,
      "owned_process_count": 2,
      "reclaimable_bytes": 15543173120,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 122.940186458,
      "owned_rss_bytes": 917569536,
      "owned_process_count": 2,
      "reclaimable_bytes": 15526494208,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 123.16622975,
      "owned_rss_bytes": 917602304,
      "owned_process_count": 2,
      "reclaimable_bytes": 15528230912,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 123.39413449999999,
      "owned_rss_bytes": 917618688,
      "owned_process_count": 2,
      "reclaimable_bytes": 15529656320,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 123.61871845799999,
      "owned_rss_bytes": 917651456,
      "owned_process_count": 2,
      "reclaimable_bytes": 15516139520,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 123.84665729199999,
      "owned_rss_bytes": 917667840,
      "owned_process_count": 2,
      "reclaimable_bytes": 15529017344,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 124.07769416699999,
      "owned_rss_bytes": 917700608,
      "owned_process_count": 2,
      "reclaimable_bytes": 15524413440,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 124.31103770799999,
      "owned_rss_bytes": 917716992,
      "owned_process_count": 2,
      "reclaimable_bytes": 15521972224,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 124.537611625,
      "owned_rss_bytes": 917749760,
      "owned_process_count": 2,
      "reclaimable_bytes": 15528968192,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 124.771082833,
      "owned_rss_bytes": 917864448,
      "owned_process_count": 2,
      "reclaimable_bytes": 15599271936,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 125.002522042,
      "owned_rss_bytes": 917864448,
      "owned_process_count": 2,
      "reclaimable_bytes": 15599304704,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 125.237146958,
      "owned_rss_bytes": 917880832,
      "owned_process_count": 2,
      "reclaimable_bytes": 15611199488,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 125.463982417,
      "owned_rss_bytes": 917880832,
      "owned_process_count": 2,
      "reclaimable_bytes": 15611101184,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 125.699704,
      "owned_rss_bytes": 917913600,
      "owned_process_count": 2,
      "reclaimable_bytes": 15522021376,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 125.92592029199999,
      "owned_rss_bytes": 917995520,
      "owned_process_count": 2,
      "reclaimable_bytes": 15527460864,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 126.160359542,
      "owned_rss_bytes": 918011904,
      "owned_process_count": 2,
      "reclaimable_bytes": 15519416320,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 126.394998167,
      "owned_rss_bytes": 918028288,
      "owned_process_count": 2,
      "reclaimable_bytes": 15524986880,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 126.627412458,
      "owned_rss_bytes": 918028288,
      "owned_process_count": 2,
      "reclaimable_bytes": 15526526976,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 126.85788270799999,
      "owned_rss_bytes": 918061056,
      "owned_process_count": 2,
      "reclaimable_bytes": 15524298752,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 127.08081595799999,
      "owned_rss_bytes": 918093824,
      "owned_process_count": 2,
      "reclaimable_bytes": 15526887424,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 127.30382620799999,
      "owned_rss_bytes": 918175744,
      "owned_process_count": 2,
      "reclaimable_bytes": 15526608896,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 127.53662458299999,
      "owned_rss_bytes": 918241280,
      "owned_process_count": 2,
      "reclaimable_bytes": 15527673856,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 127.76689562499999,
      "owned_rss_bytes": 918323200,
      "owned_process_count": 2,
      "reclaimable_bytes": 15527919616,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 127.99150999999999,
      "owned_rss_bytes": 918372352,
      "owned_process_count": 2,
      "reclaimable_bytes": 15518924800,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 128.216261792,
      "owned_rss_bytes": 918454272,
      "owned_process_count": 2,
      "reclaimable_bytes": 15533129728,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 128.449539625,
      "owned_rss_bytes": 918536192,
      "owned_process_count": 2,
      "reclaimable_bytes": 15528722432,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 128.675268208,
      "owned_rss_bytes": 918618112,
      "owned_process_count": 2,
      "reclaimable_bytes": 15527133184,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 128.90675362500002,
      "owned_rss_bytes": 918716416,
      "owned_process_count": 2,
      "reclaimable_bytes": 15523282944,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 129.139516875,
      "owned_rss_bytes": 918749184,
      "owned_process_count": 2,
      "reclaimable_bytes": 15514517504,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 129.363040708,
      "owned_rss_bytes": 918814720,
      "owned_process_count": 2,
      "reclaimable_bytes": 15505915904,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 129.596357417,
      "owned_rss_bytes": 918896640,
      "owned_process_count": 2,
      "reclaimable_bytes": 15484043264,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 129.820449583,
      "owned_rss_bytes": 918962176,
      "owned_process_count": 2,
      "reclaimable_bytes": 15489662976,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 130.053041167,
      "owned_rss_bytes": 919027712,
      "owned_process_count": 2,
      "reclaimable_bytes": 15494053888,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 130.282297833,
      "owned_rss_bytes": 919126016,
      "owned_process_count": 2,
      "reclaimable_bytes": 15488712704,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 130.505815208,
      "owned_rss_bytes": 919191552,
      "owned_process_count": 2,
      "reclaimable_bytes": 15575646208,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 130.73824504200002,
      "owned_rss_bytes": 919257088,
      "owned_process_count": 2,
      "reclaimable_bytes": 15578693632,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 130.970421208,
      "owned_rss_bytes": 919322624,
      "owned_process_count": 2,
      "reclaimable_bytes": 15572451328,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 131.195467208,
      "owned_rss_bytes": 919404544,
      "owned_process_count": 2,
      "reclaimable_bytes": 15583592448,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 131.428244208,
      "owned_rss_bytes": 919273472,
      "owned_process_count": 2,
      "reclaimable_bytes": 15380316160,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 131.656513667,
      "owned_rss_bytes": 919322624,
      "owned_process_count": 2,
      "reclaimable_bytes": 15298871296,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 131.883000375,
      "owned_rss_bytes": 919355392,
      "owned_process_count": 2,
      "reclaimable_bytes": 15277654016,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 132.11694929200002,
      "owned_rss_bytes": 919420928,
      "owned_process_count": 2,
      "reclaimable_bytes": 15267545088,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 132.342925167,
      "owned_rss_bytes": 919470080,
      "owned_process_count": 2,
      "reclaimable_bytes": 15270674432,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 132.566296583,
      "owned_rss_bytes": 919552000,
      "owned_process_count": 2,
      "reclaimable_bytes": 15414673408,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 132.79229516700002,
      "owned_rss_bytes": 919584768,
      "owned_process_count": 2,
      "reclaimable_bytes": 15459287040,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 133.02664545800002,
      "owned_rss_bytes": 919683072,
      "owned_process_count": 2,
      "reclaimable_bytes": 15455076352,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 133.259575708,
      "owned_rss_bytes": 919748608,
      "owned_process_count": 2,
      "reclaimable_bytes": 15452766208,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 133.487481917,
      "owned_rss_bytes": 919797760,
      "owned_process_count": 2,
      "reclaimable_bytes": 15473344512,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 133.71989325,
      "owned_rss_bytes": 919863296,
      "owned_process_count": 2,
      "reclaimable_bytes": 15384838144,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 133.944465583,
      "owned_rss_bytes": 920862720,
      "owned_process_count": 2,
      "reclaimable_bytes": 15370600448,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 134.173726875,
      "owned_rss_bytes": 920895488,
      "owned_process_count": 2,
      "reclaimable_bytes": 15361163264,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 134.408306708,
      "owned_rss_bytes": 920895488,
      "owned_process_count": 2,
      "reclaimable_bytes": 15366029312,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 134.64427320800002,
      "owned_rss_bytes": 920911872,
      "owned_process_count": 2,
      "reclaimable_bytes": 15358001152,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 134.87854437500002,
      "owned_rss_bytes": 920911872,
      "owned_process_count": 2,
      "reclaimable_bytes": 15433023488,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 135.11370712500002,
      "owned_rss_bytes": 920961024,
      "owned_process_count": 2,
      "reclaimable_bytes": 15444967424,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 135.349480583,
      "owned_rss_bytes": 920961024,
      "owned_process_count": 2,
      "reclaimable_bytes": 15445426176,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 135.586895583,
      "owned_rss_bytes": 921042944,
      "owned_process_count": 2,
      "reclaimable_bytes": 15453782016,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 135.82092191700002,
      "owned_rss_bytes": 921092096,
      "owned_process_count": 2,
      "reclaimable_bytes": 15368978432,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 136.055333292,
      "owned_rss_bytes": 921124864,
      "owned_process_count": 2,
      "reclaimable_bytes": 15364079616,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 136.283716625,
      "owned_rss_bytes": 921174016,
      "owned_process_count": 2,
      "reclaimable_bytes": 15375499264,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 136.509558292,
      "owned_rss_bytes": 921223168,
      "owned_process_count": 2,
      "reclaimable_bytes": 15363571712,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 136.73755887500002,
      "owned_rss_bytes": 921255936,
      "owned_process_count": 2,
      "reclaimable_bytes": 15381626880,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 136.964282292,
      "owned_rss_bytes": 921321472,
      "owned_process_count": 2,
      "reclaimable_bytes": 15382986752,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 137.195625167,
      "owned_rss_bytes": 921370624,
      "owned_process_count": 2,
      "reclaimable_bytes": 15441149952,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 137.42163041700002,
      "owned_rss_bytes": 921419776,
      "owned_process_count": 2,
      "reclaimable_bytes": 15462219776,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 137.655802625,
      "owned_rss_bytes": 921436160,
      "owned_process_count": 2,
      "reclaimable_bytes": 15461990400,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 137.88760687500002,
      "owned_rss_bytes": 921485312,
      "owned_process_count": 2,
      "reclaimable_bytes": 15374778368,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 138.117336333,
      "owned_rss_bytes": 921518080,
      "owned_process_count": 2,
      "reclaimable_bytes": 15374696448,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 138.346163417,
      "owned_rss_bytes": 921534464,
      "owned_process_count": 2,
      "reclaimable_bytes": 15371927552,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 138.58032216700002,
      "owned_rss_bytes": 921600000,
      "owned_process_count": 2,
      "reclaimable_bytes": 15370682368,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 138.80655275,
      "owned_rss_bytes": 921649152,
      "owned_process_count": 2,
      "reclaimable_bytes": 15382102016,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 139.040505333,
      "owned_rss_bytes": 921665536,
      "owned_process_count": 2,
      "reclaimable_bytes": 15454699520,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 139.264778708,
      "owned_rss_bytes": 921714688,
      "owned_process_count": 2,
      "reclaimable_bytes": 15451521024,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 139.491812667,
      "owned_rss_bytes": 921780224,
      "owned_process_count": 2,
      "reclaimable_bytes": 15450046464,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 139.717323042,
      "owned_rss_bytes": 921845760,
      "owned_process_count": 2,
      "reclaimable_bytes": 15391424512,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 139.947149083,
      "owned_rss_bytes": 921878528,
      "owned_process_count": 2,
      "reclaimable_bytes": 15362375680,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 140.173193042,
      "owned_rss_bytes": 921927680,
      "owned_process_count": 2,
      "reclaimable_bytes": 15359672320,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 140.397905583,
      "owned_rss_bytes": 921993216,
      "owned_process_count": 2,
      "reclaimable_bytes": 15366553600,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 140.63184237500002,
      "owned_rss_bytes": 922058752,
      "owned_process_count": 2,
      "reclaimable_bytes": 15362539520,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 140.86077825,
      "owned_rss_bytes": 922107904,
      "owned_process_count": 2,
      "reclaimable_bytes": 15387017216,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 141.09312675,
      "owned_rss_bytes": 922157056,
      "owned_process_count": 2,
      "reclaimable_bytes": 15446458368,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 141.328616375,
      "owned_rss_bytes": 922189824,
      "owned_process_count": 2,
      "reclaimable_bytes": 15444951040,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 141.560892792,
      "owned_rss_bytes": 922222592,
      "owned_process_count": 2,
      "reclaimable_bytes": 15457517568,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 141.78446862500002,
      "owned_rss_bytes": 922255360,
      "owned_process_count": 2,
      "reclaimable_bytes": 15378825216,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 142.01775808300002,
      "owned_rss_bytes": 922730496,
      "owned_process_count": 2,
      "reclaimable_bytes": 15370993664,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 142.255660917,
      "owned_rss_bytes": 922730496,
      "owned_process_count": 2,
      "reclaimable_bytes": 15355756544,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 142.4839895,
      "owned_rss_bytes": 922746880,
      "owned_process_count": 2,
      "reclaimable_bytes": 15373942784,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 142.718643875,
      "owned_rss_bytes": 922763264,
      "owned_process_count": 2,
      "reclaimable_bytes": 15365816320,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 142.95326775,
      "owned_rss_bytes": 922763264,
      "owned_process_count": 2,
      "reclaimable_bytes": 15385837568,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 143.179559875,
      "owned_rss_bytes": 922796032,
      "owned_process_count": 2,
      "reclaimable_bytes": 15456305152,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 143.416935333,
      "owned_rss_bytes": 922796032,
      "owned_process_count": 2,
      "reclaimable_bytes": 15462072320,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 143.65085125000002,
      "owned_rss_bytes": 922845184,
      "owned_process_count": 2,
      "reclaimable_bytes": 15460155392,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 143.87487825,
      "owned_rss_bytes": 922877952,
      "owned_process_count": 2,
      "reclaimable_bytes": 15384231936,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 144.099061917,
      "owned_rss_bytes": 922927104,
      "owned_process_count": 2,
      "reclaimable_bytes": 15372206080,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 144.33318920800002,
      "owned_rss_bytes": 922943488,
      "owned_process_count": 2,
      "reclaimable_bytes": 15401336832,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 144.56227375,
      "owned_rss_bytes": 922976256,
      "owned_process_count": 2,
      "reclaimable_bytes": 15193702400,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 144.790005,
      "owned_rss_bytes": 922992640,
      "owned_process_count": 2,
      "reclaimable_bytes": 15192162304,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 145.023371958,
      "owned_rss_bytes": 923025408,
      "owned_process_count": 2,
      "reclaimable_bytes": 15192555520,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 145.258642333,
      "owned_rss_bytes": 923058176,
      "owned_process_count": 2,
      "reclaimable_bytes": 15262760960,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 145.489565542,
      "owned_rss_bytes": 923074560,
      "owned_process_count": 2,
      "reclaimable_bytes": 15265316864,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 145.724325125,
      "owned_rss_bytes": 923090944,
      "owned_process_count": 2,
      "reclaimable_bytes": 15428108288,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 145.95073475,
      "owned_rss_bytes": 923123712,
      "owned_process_count": 2,
      "reclaimable_bytes": 15517843456,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 146.185818583,
      "owned_rss_bytes": 923140096,
      "owned_process_count": 2,
      "reclaimable_bytes": 15520055296,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 146.414465917,
      "owned_rss_bytes": 923156480,
      "owned_process_count": 2,
      "reclaimable_bytes": 15524151296,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 146.63995250000002,
      "owned_rss_bytes": 923189248,
      "owned_process_count": 2,
      "reclaimable_bytes": 15538683904,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 146.86774275000002,
      "owned_rss_bytes": 923222016,
      "owned_process_count": 2,
      "reclaimable_bytes": 15536193536,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 147.09296325,
      "owned_rss_bytes": 923222016,
      "owned_process_count": 2,
      "reclaimable_bytes": 15612526592,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 147.323425917,
      "owned_rss_bytes": 923254784,
      "owned_process_count": 2,
      "reclaimable_bytes": 15611494400,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 147.551557167,
      "owned_rss_bytes": 923287552,
      "owned_process_count": 2,
      "reclaimable_bytes": 15622455296,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 147.778127292,
      "owned_rss_bytes": 923320320,
      "owned_process_count": 2,
      "reclaimable_bytes": 15624568832,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 148.006947625,
      "owned_rss_bytes": 923320320,
      "owned_process_count": 2,
      "reclaimable_bytes": 15533408256,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 148.234857167,
      "owned_rss_bytes": 923353088,
      "owned_process_count": 2,
      "reclaimable_bytes": 15534391296,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 148.46100975000002,
      "owned_rss_bytes": 923385856,
      "owned_process_count": 2,
      "reclaimable_bytes": 15531180032,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 148.68818404200002,
      "owned_rss_bytes": 923418624,
      "owned_process_count": 2,
      "reclaimable_bytes": 15531016192,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 148.91321629200002,
      "owned_rss_bytes": 923435008,
      "owned_process_count": 2,
      "reclaimable_bytes": 15524052992,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 149.13955425,
      "owned_rss_bytes": 923451392,
      "owned_process_count": 2,
      "reclaimable_bytes": 15610576896,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 149.372151417,
      "owned_rss_bytes": 923484160,
      "owned_process_count": 2,
      "reclaimable_bytes": 15616868352,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 149.603897375,
      "owned_rss_bytes": 923500544,
      "owned_process_count": 2,
      "reclaimable_bytes": 15610249216,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 149.83828325000002,
      "owned_rss_bytes": 923533312,
      "owned_process_count": 2,
      "reclaimable_bytes": 15605727232,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 150.06286725,
      "owned_rss_bytes": 923877376,
      "owned_process_count": 2,
      "reclaimable_bytes": 15524724736,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 150.298788875,
      "owned_rss_bytes": 923877376,
      "owned_process_count": 2,
      "reclaimable_bytes": 15521726464,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 150.53350758300002,
      "owned_rss_bytes": 923893760,
      "owned_process_count": 2,
      "reclaimable_bytes": 15512092672,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 150.77077266700002,
      "owned_rss_bytes": 923893760,
      "owned_process_count": 2,
      "reclaimable_bytes": 15515123712,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 150.99727287500002,
      "owned_rss_bytes": 923910144,
      "owned_process_count": 2,
      "reclaimable_bytes": 15509864448,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 151.22549,
      "owned_rss_bytes": 923926528,
      "owned_process_count": 2,
      "reclaimable_bytes": 15587573760,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 151.452584583,
      "owned_rss_bytes": 923926528,
      "owned_process_count": 2,
      "reclaimable_bytes": 15606890496,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 151.68783158300002,
      "owned_rss_bytes": 923959296,
      "owned_process_count": 2,
      "reclaimable_bytes": 15605694464,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 151.914506042,
      "owned_rss_bytes": 923975680,
      "owned_process_count": 2,
      "reclaimable_bytes": 15603482624,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 152.140591,
      "owned_rss_bytes": 924041216,
      "owned_process_count": 2,
      "reclaimable_bytes": 15515041792,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 152.3647055,
      "owned_rss_bytes": 924073984,
      "owned_process_count": 2,
      "reclaimable_bytes": 15507062784,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 152.592742875,
      "owned_rss_bytes": 924139520,
      "owned_process_count": 2,
      "reclaimable_bytes": 15514566656,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 152.816785208,
      "owned_rss_bytes": 924205056,
      "owned_process_count": 2,
      "reclaimable_bytes": 15510142976,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 153.04293975000002,
      "owned_rss_bytes": 924303360,
      "owned_process_count": 2,
      "reclaimable_bytes": 15511355392,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 153.27671475,
      "owned_rss_bytes": 924368896,
      "owned_process_count": 2,
      "reclaimable_bytes": 15598370816,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 153.51099775,
      "owned_rss_bytes": 924434432,
      "owned_process_count": 2,
      "reclaimable_bytes": 15605727232,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 153.744653625,
      "owned_rss_bytes": 924516352,
      "owned_process_count": 2,
      "reclaimable_bytes": 15604695040,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 153.97066187500002,
      "owned_rss_bytes": 924598272,
      "owned_process_count": 2,
      "reclaimable_bytes": 15608201216,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 154.194978292,
      "owned_rss_bytes": 924696576,
      "owned_process_count": 2,
      "reclaimable_bytes": 15519465472,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 154.428566958,
      "owned_rss_bytes": 924729344,
      "owned_process_count": 2,
      "reclaimable_bytes": 15515189248,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 154.657696917,
      "owned_rss_bytes": 924794880,
      "owned_process_count": 2,
      "reclaimable_bytes": 15513206784,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 154.884992417,
      "owned_rss_bytes": 924876800,
      "owned_process_count": 2,
      "reclaimable_bytes": 15518793728,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 155.111356083,
      "owned_rss_bytes": 924925952,
      "owned_process_count": 2,
      "reclaimable_bytes": 15522758656,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 155.340589333,
      "owned_rss_bytes": 924975104,
      "owned_process_count": 2,
      "reclaimable_bytes": 15588753408,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 155.575166833,
      "owned_rss_bytes": 925040640,
      "owned_process_count": 2,
      "reclaimable_bytes": 15606317056,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 155.80522475,
      "owned_rss_bytes": 925089792,
      "owned_process_count": 2,
      "reclaimable_bytes": 15606661120,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 156.03061025,
      "owned_rss_bytes": 925138944,
      "owned_process_count": 2,
      "reclaimable_bytes": 15609610240,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 156.26306075,
      "owned_rss_bytes": 925204480,
      "owned_process_count": 2,
      "reclaimable_bytes": 15520186368,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 156.486021958,
      "owned_rss_bytes": 925253632,
      "owned_process_count": 2,
      "reclaimable_bytes": 15519727616,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 156.71966525000002,
      "owned_rss_bytes": 925286400,
      "owned_process_count": 2,
      "reclaimable_bytes": 15472902144,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 156.947018417,
      "owned_rss_bytes": 925351936,
      "owned_process_count": 2,
      "reclaimable_bytes": 15449751552,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 157.179636208,
      "owned_rss_bytes": 925401088,
      "owned_process_count": 2,
      "reclaimable_bytes": 15528869888,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 157.40690783300002,
      "owned_rss_bytes": 925433856,
      "owned_process_count": 2,
      "reclaimable_bytes": 15534211072,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 157.637454333,
      "owned_rss_bytes": 925466624,
      "owned_process_count": 2,
      "reclaimable_bytes": 15529787392,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 157.865324417,
      "owned_rss_bytes": 925564928,
      "owned_process_count": 2,
      "reclaimable_bytes": 15539077120,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 158.092101958,
      "owned_rss_bytes": 925614080,
      "owned_process_count": 2,
      "reclaimable_bytes": 15462400000,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 158.32646854200001,
      "owned_rss_bytes": 925663232,
      "owned_process_count": 2,
      "reclaimable_bytes": 15450095616,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 158.556952833,
      "owned_rss_bytes": 925728768,
      "owned_process_count": 2,
      "reclaimable_bytes": 15446376448,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 158.783023667,
      "owned_rss_bytes": 925761536,
      "owned_process_count": 2,
      "reclaimable_bytes": 15442116608,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 159.008716792,
      "owned_rss_bytes": 925810688,
      "owned_process_count": 2,
      "reclaimable_bytes": 15447097344,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 159.23267462500002,
      "owned_rss_bytes": 1687126016,
      "owned_process_count": 2,
      "reclaimable_bytes": 15725051904,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 159.472934917,
      "owned_rss_bytes": 1849688064,
      "owned_process_count": 2,
      "reclaimable_bytes": 15520612352,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 159.698154667,
      "owned_rss_bytes": 1833959424,
      "owned_process_count": 2,
      "reclaimable_bytes": 15388131328,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 159.92765075,
      "owned_rss_bytes": 1793425408,
      "owned_process_count": 2,
      "reclaimable_bytes": 15757524992,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 160.181732833,
      "owned_rss_bytes": 1647935488,
      "owned_process_count": 2,
      "reclaimable_bytes": 15835250688,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 160.408897625,
      "owned_rss_bytes": 1508032512,
      "owned_process_count": 2,
      "reclaimable_bytes": 15754706944,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 160.65095433300002,
      "owned_rss_bytes": 1491222528,
      "owned_process_count": 2,
      "reclaimable_bytes": 16122707968,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 160.881218625,
      "owned_rss_bytes": 1461436416,
      "owned_process_count": 2,
      "reclaimable_bytes": 16937828352,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 161.124682458,
      "owned_rss_bytes": 1464893440,
      "owned_process_count": 2,
      "reclaimable_bytes": 17370759168,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 161.360522667,
      "owned_rss_bytes": 1127055360,
      "owned_process_count": 2,
      "reclaimable_bytes": 18013945856,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 161.615644042,
      "owned_rss_bytes": 1139245056,
      "owned_process_count": 2,
      "reclaimable_bytes": 18751913984,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 161.884317333,
      "owned_rss_bytes": 594083840,
      "owned_process_count": 2,
      "reclaimable_bytes": 19283460096,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 162.129381708,
      "owned_rss_bytes": 590233600,
      "owned_process_count": 2,
      "reclaimable_bytes": 19974717440,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 162.43162112500002,
      "owned_rss_bytes": 576880640,
      "owned_process_count": 2,
      "reclaimable_bytes": 20809236480,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 162.74413254200002,
      "owned_rss_bytes": 561233920,
      "owned_process_count": 2,
      "reclaimable_bytes": 21157199872,
      "swapins": 44114265,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 162.995699833,
      "owned_rss_bytes": 552583168,
      "owned_process_count": 2,
      "reclaimable_bytes": 21692743680,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 163.25827162500002,
      "owned_rss_bytes": 577536000,
      "owned_process_count": 2,
      "reclaimable_bytes": 21657878528,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 163.497963375,
      "owned_rss_bytes": 596541440,
      "owned_process_count": 2,
      "reclaimable_bytes": 21795192832,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 163.76224975,
      "owned_rss_bytes": 458358784,
      "owned_process_count": 2,
      "reclaimable_bytes": 22089662464,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 164.001073083,
      "owned_rss_bytes": 475709440,
      "owned_process_count": 2,
      "reclaimable_bytes": 22022209536,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 164.237360625,
      "owned_rss_bytes": 497319936,
      "owned_process_count": 2,
      "reclaimable_bytes": 22084288512,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 164.48526495800002,
      "owned_rss_bytes": 497516544,
      "owned_process_count": 2,
      "reclaimable_bytes": 22093905920,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 164.71602175,
      "owned_rss_bytes": 497631232,
      "owned_process_count": 2,
      "reclaimable_bytes": 22041182208,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 164.953032708,
      "owned_rss_bytes": 497778688,
      "owned_process_count": 2,
      "reclaimable_bytes": 22036922368,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 165.198486667,
      "owned_rss_bytes": 613564416,
      "owned_process_count": 2,
      "reclaimable_bytes": 20493697024,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 165.43147125000002,
      "owned_rss_bytes": 616087552,
      "owned_process_count": 2,
      "reclaimable_bytes": 20383137792,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 165.66730104200002,
      "owned_rss_bytes": 634404864,
      "owned_process_count": 2,
      "reclaimable_bytes": 20326498304,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 165.894545625,
      "owned_rss_bytes": 636944384,
      "owned_process_count": 2,
      "reclaimable_bytes": 20273643520,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 166.127057917,
      "owned_rss_bytes": 638173184,
      "owned_process_count": 2,
      "reclaimable_bytes": 20082081792,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 166.358102417,
      "owned_rss_bytes": 638304256,
      "owned_process_count": 2,
      "reclaimable_bytes": 20059537408,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 166.592607708,
      "owned_rss_bytes": 640811008,
      "owned_process_count": 2,
      "reclaimable_bytes": 20103839744,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 166.82675775,
      "owned_rss_bytes": 641024000,
      "owned_process_count": 2,
      "reclaimable_bytes": 20079886336,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 167.053101333,
      "owned_rss_bytes": 641171456,
      "owned_process_count": 2,
      "reclaimable_bytes": 20032241664,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 167.282447083,
      "owned_rss_bytes": 641187840,
      "owned_process_count": 2,
      "reclaimable_bytes": 19737460736,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 167.509129667,
      "owned_rss_bytes": 641269760,
      "owned_process_count": 2,
      "reclaimable_bytes": 19652345856,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 167.73817925,
      "owned_rss_bytes": 641286144,
      "owned_process_count": 2,
      "reclaimable_bytes": 19598016512,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 167.966405208,
      "owned_rss_bytes": 641302528,
      "owned_process_count": 2,
      "reclaimable_bytes": 19554009088,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 168.204815333,
      "owned_rss_bytes": 641351680,
      "owned_process_count": 2,
      "reclaimable_bytes": 19523862528,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 168.437927417,
      "owned_rss_bytes": 641449984,
      "owned_process_count": 2,
      "reclaimable_bytes": 19619774464,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 168.673178708,
      "owned_rss_bytes": 641548288,
      "owned_process_count": 2,
      "reclaimable_bytes": 19485442048,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 168.911909333,
      "owned_rss_bytes": 641679360,
      "owned_process_count": 2,
      "reclaimable_bytes": 19413925888,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 169.135419458,
      "owned_rss_bytes": 642236416,
      "owned_process_count": 2,
      "reclaimable_bytes": 19476381696,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 169.366454542,
      "owned_rss_bytes": 642351104,
      "owned_process_count": 2,
      "reclaimable_bytes": 19468091392,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 169.59300512500002,
      "owned_rss_bytes": 642416640,
      "owned_process_count": 2,
      "reclaimable_bytes": 19386466304,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 169.828770542,
      "owned_rss_bytes": 642498560,
      "owned_process_count": 2,
      "reclaimable_bytes": 19272744960,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 170.056409792,
      "owned_rss_bytes": 642564096,
      "owned_process_count": 2,
      "reclaimable_bytes": 19263307776,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 170.285484542,
      "owned_rss_bytes": 642629632,
      "owned_process_count": 2,
      "reclaimable_bytes": 19273646080,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 170.514359667,
      "owned_rss_bytes": 642760704,
      "owned_process_count": 2,
      "reclaimable_bytes": 19278086144,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 170.742801792,
      "owned_rss_bytes": 642777088,
      "owned_process_count": 2,
      "reclaimable_bytes": 19280855040,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 170.977016708,
      "owned_rss_bytes": 642793472,
      "owned_process_count": 2,
      "reclaimable_bytes": 19339968512,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 171.20968625,
      "owned_rss_bytes": 642826240,
      "owned_process_count": 2,
      "reclaimable_bytes": 19334430720,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 171.436824875,
      "owned_rss_bytes": 642990080,
      "owned_process_count": 2,
      "reclaimable_bytes": 19329417216,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 171.670999542,
      "owned_rss_bytes": 643121152,
      "owned_process_count": 2,
      "reclaimable_bytes": 19219775488,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 171.898159083,
      "owned_rss_bytes": 646447104,
      "owned_process_count": 2,
      "reclaimable_bytes": 19160678400,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 172.12689416700002,
      "owned_rss_bytes": 646578176,
      "owned_process_count": 2,
      "reclaimable_bytes": 19135266816,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 172.363678875,
      "owned_rss_bytes": 646594560,
      "owned_process_count": 2,
      "reclaimable_bytes": 19117293568,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 172.60239975000002,
      "owned_rss_bytes": 646660096,
      "owned_process_count": 2,
      "reclaimable_bytes": 19091423232,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 172.83930075,
      "owned_rss_bytes": 646676480,
      "owned_process_count": 2,
      "reclaimable_bytes": 19145113600,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 173.070315875,
      "owned_rss_bytes": 646791168,
      "owned_process_count": 2,
      "reclaimable_bytes": 19120455680,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 173.30520445800002,
      "owned_rss_bytes": 646905856,
      "owned_process_count": 2,
      "reclaimable_bytes": 19113820160,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 173.54102220800002,
      "owned_rss_bytes": 646922240,
      "owned_process_count": 2,
      "reclaimable_bytes": 19115868160,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 173.771773792,
      "owned_rss_bytes": 646938624,
      "owned_process_count": 2,
      "reclaimable_bytes": 19032653824,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 174.01070645800002,
      "owned_rss_bytes": 646955008,
      "owned_process_count": 2,
      "reclaimable_bytes": 19022364672,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 174.23925962500002,
      "owned_rss_bytes": 647102464,
      "owned_process_count": 2,
      "reclaimable_bytes": 18761564160,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 174.476114708,
      "owned_rss_bytes": 647168000,
      "owned_process_count": 2,
      "reclaimable_bytes": 18337431552,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 174.714351625,
      "owned_rss_bytes": 647184384,
      "owned_process_count": 2,
      "reclaimable_bytes": 18287263744,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 174.949956958,
      "owned_rss_bytes": 647200768,
      "owned_process_count": 2,
      "reclaimable_bytes": 18357567488,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 175.177184583,
      "owned_rss_bytes": 647217152,
      "owned_process_count": 2,
      "reclaimable_bytes": 18360696832,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 175.410259625,
      "owned_rss_bytes": 647249920,
      "owned_process_count": 2,
      "reclaimable_bytes": 18560385024,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 175.637580417,
      "owned_rss_bytes": 647528448,
      "owned_process_count": 2,
      "reclaimable_bytes": 18711756800,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 175.865560792,
      "owned_rss_bytes": 651329536,
      "owned_process_count": 2,
      "reclaimable_bytes": 22205382656,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 176.104233875,
      "owned_rss_bytes": 13336576,
      "owned_process_count": 2,
      "reclaimable_bytes": 27078213632,
      "swapins": 44114293,
      "swapouts": 77536050
    }
  ],
  "passed": false,
  "classification": "Targeted recovery of the three failed V283 gates, extracted from corrected verify.sh: one actual governor drill, one complete MTP-plus-vision gate, and the exact original long-prompt memory/recall gate. Same native binary and original inner no-VM/absolute-resource criteria. One attempt per gate; preserves prior failed full-suite result; this is not a full-suite pass. VM recorded by outer ownership guard.",
  "child_pid": 32900,
  "exit_code": 64,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 27086110720,
    "swapins": 44114293,
    "swapouts": 77536050,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   528998.\nPages active:                                 684544.\nPages inactive:                               566927.\nPages speculative:                            121032.\nPages throttled:                                   0.\nPages wired down:                             343531.\nPages purgeable:                                9053.\n\"Translation faults\":                    15619564879.\nPages copy-on-write:                       751105364.\nPages zero filled:                       21524155866.\nPages reactivated:                        3526037413.\nPages purged:                               73547260.\nFile-backed pages:                           1115154.\nAnonymous pages:                              257349.\nPages stored in compressor:                  2073102.\nPages occupied by compressor:                 839680.\nDecompressions:                           1188422618.\nCompressions:                             1505689919.\nPageins:                                  7763897171.\nPageouts:                                   11143673.\nSwapins:                                    44114293.\nSwapouts:                                   77536050.\nPages tagged:                                 173877.\nPages tagged resident:                        110021.\nPages tagged compressed:                       63856.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6931.\nPages tag-storage free:                          575.\nPages tag-storage non-tag pageable:            90789.\nPages tag-storage non-tag wired:                   9.\nBytes of compressed tags:                   10220544.\nTagged compressions:                        11466694.\nTagged decompressions:                      10556760.\n"
  },
  "remaining_owned_members": [],
  "owned_groups": [
    32900
  ],
  "remaining_owned_members_after_cleanup": [],
  "elapsed_seconds": 176.39875800000002,
  "child_exit_code": 64,
  "after_cleanup": {
    "page_bytes": 16384,
    "reclaimable_bytes": 27083898880,
    "swapins": 44114293,
    "swapouts": 77536050,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   528852.\nPages active:                                 684972.\nPages inactive:                               566946.\nPages speculative:                            121023.\nPages throttled:                                   0.\nPages wired down:                             343350.\nPages purgeable:                                9053.\n\"Translation faults\":                    15619570595.\nPages copy-on-write:                       751106092.\nPages zero filled:                       21524158983.\nPages reactivated:                        3526037413.\nPages purged:                               73547260.\nFile-backed pages:                           1115165.\nAnonymous pages:                              257776.\nPages stored in compressor:                  2073024.\nPages occupied by compressor:                 839645.\nDecompressions:                           1188422711.\nCompressions:                             1505689919.\nPageins:                                  7763897176.\nPageouts:                                   11143673.\nSwapins:                                    44114293.\nSwapouts:                                   77536050.\nPages tagged:                                 173877.\nPages tagged resident:                        110021.\nPages tagged compressed:                       63856.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6931.\nPages tag-storage free:                          514.\nPages tag-storage non-tag pageable:            90850.\nPages tag-storage non-tag wired:                   9.\nBytes of compressed tags:                   10220544.\nTagged compressions:                        11466694.\nTagged decompressions:                      10556760.\n"
  }
}
````

## /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v287/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v287/stdout.txt

SHA-256 `8a8de8f174ada119a71154de007c882ead19cc47d0ebba81a3045765c73a268b`; 1093 bytes.

````text
== actual governor recovery ==
PASS  ELASTIC DRILL PASS: governor shrank under simulated pressure, honored the grow cooldown, grew back when memory returned, and every generation was byte-identical
== complete MTP including original vision ==
FAIL  speculative decode gates
  info  recording pass vs batched: 0.0000% of spread (top-1 same); rollback state vs plain: ssm 6.50e-02, conv 4.31e-02, ple 0.00e+00 relative (re-chunk control: ssm 1.05e-01, conv 7.06e-02, ple 1.11e-02); one more step: 3.416% vs control 3.312% (bound 9.935%, top-1 same)
PASS  recording verify pass matches the batched pass (<= 0.1% of spread)
PASS  rollback state stays inside 3x the re-chunk band (ssm, conv, ple)
PASS  rollback then one step stays inside the prefill-rechunk band
MTP CHECK MEMORY {"lifetime_rss_peak_bytes":2748153856,"memory_validated":false,"physical_footprint_end_bytes":2330758336,"sampled_peak_bytes":9754399496,"samples":4754,"swapins_after":44114293,"swapins_before":44114265,"swapouts_after":77536050,"swapouts_before":77536050,"target_gb":12}
== original long-prompt memory and recall ==
````

## /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v287/verification/elastic-drill.txt

SHA-256 `2a96e819a935d93e30d55555446caa287bbaa22caa7beff946e3881649b23aed`; 1305 bytes.

````text
engine ready in 0.9s: expert cache ~36/512 per layer (1726 global slots = 4.8 GB), eos [248044, 248046]
  (machine has 30.1 GB reclaimable; drill capped at a 4.8 GB pool)
  start:  1726 slots (~36/layer) -> Nile, Amazon, Yangtze
elastic: availability dropped — cache ~36 → ~17 experts/layer (4.8 → 2.2 GB pool, cold — refills from SSD)
  squeeze: 796 slots (~17/layer) -> Nile, Amazon, Yangtze
  recovery stimulus: 8.5 GB available -> 1726 desired slots (2.6 GB growth)
  cooldown: held at 796 slots, as designed
  waiting out the 60 s grow cooldown...
elastic: memory freed — cache ~17 → ~36 experts/layer (2.2 → 4.8 GB pool, contents kept)
  recover: 1726 slots (~36/layer) -> Nile, Amazon, Yangtze
ELASTIC DRILL MEMORY {"ceiling_gb":13,"complete":true,"lifetime_rss_peak_bytes":3180560384,"output_ids":[[45,448,11,7919,11,23699,83,2891],[45,448,11,7919,11,23699,83,2891],[45,448,11,7919,11,23699,83,2891]],"physical_footprint_end_bytes":10029370704,"sampled_peak_bytes":10457369840,"samples":3644,"swapins_after":44114165,"swapins_before":44114165,"swapouts_after":77536050,"swapouts_before":77536050,"target_gb":12.554587904}
ELASTIC DRILL PASS: governor shrank under simulated pressure, honored the grow cooldown, grew back when memory returned, and every generation was byte-identical
````

## /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v287/verification/longmem.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v287/verification/mtp.txt

SHA-256 `761e88a3cf42bde7b1f6a57b39b68b6920f9c95b03477dcd6a13eabe78b747f5`; 2582 bytes.

````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (25.4 GB reclaimable now), 40.2 GB Metal working set
  target: 12.0 GB total for this process
  cache:  ~23 of 512 experts per layer  (1091 global slots = 3.0 GB pool)
  expect: ~11.0 GB peak, ~5 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  mtp:    draft head on — speculative decode (1.6 GB resident, charged above)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 14829 tokens across 4 conversations (~0.7 GB), so a follow-up turn re-prefills only what is new
engine ready in 1.2s: expert cache ~23/512 per layer (1091 global slots = 3.0 GB), mtp draft head on, eos [248044, 248046]
Error: MTP check lost real headroom, has unavailable observations or observed swap
PASS  determinism p1 (48 tokens)
PASS  speculation ran p1
  info  p1: plain vs spec shared prefix 48/48 (identical)
PASS  determinism p2 (48 tokens)
PASS  speculation ran p2
  info  p2: plain vs spec shared prefix 48/48 (identical)
PASS  determinism p3 (48 tokens)
PASS  speculation ran p3
  info  p3: plain vs spec shared prefix 6/48
  info  vision+mtp prompt: 721 tokens, 1 image(s), placeholder id 248056
FAIL  vision+mtp leg completes
  info  overall accept rate 90.7%
PASS  accept rate is not degenerate (>5%)
  info  recording pass vs batched: 0.0000% of spread (top-1 same); rollback state vs plain: ssm 6.50e-02, conv 4.31e-02, ple 0.00e+00 relative (re-chunk control: ssm 1.05e-01, conv 7.06e-02, ple 1.11e-02); one more step: 3.416% vs control 3.312% (bound 9.935%, top-1 same)
PASS  recording verify pass matches the batched pass (<= 0.1% of spread)
PASS  rollback state stays inside 3x the re-chunk band (ssm, conv, ple)
PASS  rollback then one step stays inside the prefill-rechunk band
MTP CHECK MEMORY {"lifetime_rss_peak_bytes":2748153856,"memory_validated":false,"physical_footprint_end_bytes":2330758336,"sampled_peak_bytes":9754399496,"samples":4754,"swapins_after":44114293,"swapins_before":44114265,"swapouts_after":77536050,"swapouts_before":77536050,"target_gb":12}
````

## /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v289/manifest.json

SHA-256 `f080ee27eb4525c6aebe501df6db80363413a686803d743312ad492e895620a5`; 4850 bytes.

````text
{
  "passed": false,
  "protocol_sha256": "76e1e4f794c2dae76d3a5033256617e5796d20ab7ee4d9282c5e4f1c2e6ca101",
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 24993054720,
    "swapins": 44114293,
    "swapouts": 77536050,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   336898.\nPages active:                                 845442.\nPages inactive:                               648122.\nPages speculative:                            203897.\nPages throttled:                                   0.\nPages wired down:                             331018.\nPages purgeable:                                4030.\n\"Translation faults\":                    15621259679.\nPages copy-on-write:                       751201505.\nPages zero filled:                       21524770974.\nPages reactivated:                        3526038325.\nPages purged:                               73552977.\nFile-backed pages:                           1184527.\nAnonymous pages:                              512934.\nPages stored in compressor:                  1827362.\nPages occupied by compressor:                 715951.\nDecompressions:                           1188659950.\nCompressions:                             1505689919.\nPageins:                                  7763950795.\nPageouts:                                   11143673.\nSwapins:                                    44114293.\nSwapouts:                                   77536050.\nPages tagged:                                 176127.\nPages tagged resident:                        118095.\nPages tagged compressed:                       58032.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6931.\nPages tag-storage free:                         4377.\nPages tag-storage non-tag pageable:            86987.\nPages tag-storage non-tag wired:                   9.\nBytes of compressed tags:                    9009600.\nTagged compressions:                        11466694.\nTagged decompressions:                      10562514.\n"
  },
  "exit_code": 1,
  "summary": [
    [
      "2",
      "1"
    ]
  ],
  "skips": [],
  "failures": [
    "FAIL  --memory-gb 10 sampled footprint and RSS under target on the long prompt without swap (details: /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v289/verification/check-1.txt)"
  ],
  "elapsed_seconds": 336.385824666,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 26273628160,
    "swapins": 44114297,
    "swapouts": 77536098,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   636207.\nPages active:                                 665120.\nPages inactive:                               462205.\nPages speculative:                            203575.\nPages throttled:                                   0.\nPages wired down:                             330748.\nPages purgeable:                                3360.\n\"Translation faults\":                    15631143350.\nPages copy-on-write:                       751932400.\nPages zero filled:                       21536340788.\nPages reactivated:                        3535894930.\nPages purged:                               73726268.\nFile-backed pages:                            964048.\nAnonymous pages:                              366852.\nPages stored in compressor:                  1971329.\nPages occupied by compressor:                 784982.\nDecompressions:                           1191592757.\nCompressions:                             1508836240.\nPageins:                                  7784049356.\nPageouts:                                   11146759.\nSwapins:                                    44114297.\nSwapouts:                                   77536098.\nPages tagged:                                 176544.\nPages tagged resident:                        115058.\nPages tagged compressed:                       61486.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6924.\nPages tag-storage free:                         2910.\nPages tag-storage non-tag pageable:            88462.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9724416.\nTagged compressions:                        11490243.\nTagged decompressions:                      10581267.\n"
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
  "candidate_unchanged": true,
  "drivers_unchanged": true,
  "remaining_jobs": [],
  "model_lock_free": true,
  "within_reservation": true
}
````

## /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v289/memory.json

SHA-256 `dc40d66974867bbba175235a2afed5117eaf5047cb86e12140cd7d0424173f2d`; 315254 bytes.

````text
{
  "command": [
    "bash",
    "/tmp/slotstream-optimization-execution/verification-recovery-v289/checks.sh"
  ],
  "policy": {
    "startup_reclaimable_bytes": 21000000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 17500000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 708,
    "stop_on_new_swapouts": false
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 24993284096,
    "swapins": 44114293,
    "swapouts": 77536050,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   336911.\nPages active:                                 845597.\nPages inactive:                               648122.\nPages speculative:                            203898.\nPages throttled:                                   0.\nPages wired down:                             331018.\nPages purgeable:                                4030.\n\"Translation faults\":                    15621262992.\nPages copy-on-write:                       751202096.\nPages zero filled:                       21524772131.\nPages reactivated:                        3526038325.\nPages purged:                               73552977.\nFile-backed pages:                           1184528.\nAnonymous pages:                              513089.\nPages stored in compressor:                  1827362.\nPages occupied by compressor:                 715951.\nDecompressions:                           1188659950.\nCompressions:                             1505689919.\nPageins:                                  7763950799.\nPageouts:                                   11143673.\nSwapins:                                    44114293.\nSwapouts:                                   77536050.\nPages tagged:                                 176127.\nPages tagged resident:                        118095.\nPages tagged compressed:                       58032.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6931.\nPages tag-storage free:                         4377.\nPages tag-storage non-tag pageable:            86987.\nPages tag-storage non-tag wired:                   9.\nBytes of compressed tags:                    9009600.\nTagged compressions:                        11466694.\nTagged decompressions:                      10562514.\n"
  },
  "samples": [
    {
      "elapsed_seconds": 0.0013448329999999897,
      "owned_rss_bytes": 2244608,
      "owned_process_count": 2,
      "reclaimable_bytes": 24984059904,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 0.23053104100000002,
      "owned_rss_bytes": 143032320,
      "owned_process_count": 2,
      "reclaimable_bytes": 24735907840,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 0.46512158299999995,
      "owned_rss_bytes": 143032320,
      "owned_process_count": 2,
      "reclaimable_bytes": 24768299008,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 0.711111666,
      "owned_rss_bytes": 143032320,
      "owned_process_count": 2,
      "reclaimable_bytes": 25269354496,
      "swapins": 44114293,
      "swapouts": 77536050
    },
    {
      "elapsed_seconds": 1.034517583,
      "owned_rss_bytes": 143032320,
      "owned_process_count": 2,
      "reclaimable_bytes": 25491980288,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 1.272196833,
      "owned_rss_bytes": 142983168,
      "owned_process_count": 2,
      "reclaimable_bytes": 25485754368,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 1.523846791,
      "owned_rss_bytes": 142983168,
      "owned_process_count": 2,
      "reclaimable_bytes": 25482739712,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 1.763643958,
      "owned_rss_bytes": 142983168,
      "owned_process_count": 2,
      "reclaimable_bytes": 25485590528,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 1.9970820409999999,
      "owned_rss_bytes": 142983168,
      "owned_process_count": 2,
      "reclaimable_bytes": 25430573056,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 2.238074833,
      "owned_rss_bytes": 142983168,
      "owned_process_count": 2,
      "reclaimable_bytes": 25383813120,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 2.4689294160000004,
      "owned_rss_bytes": 142983168,
      "owned_process_count": 2,
      "reclaimable_bytes": 25498189824,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 2.7079702500000002,
      "owned_rss_bytes": 142983168,
      "owned_process_count": 2,
      "reclaimable_bytes": 25516097536,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 2.948651916,
      "owned_rss_bytes": 142983168,
      "owned_process_count": 2,
      "reclaimable_bytes": 25481674752,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 3.184922958,
      "owned_rss_bytes": 142983168,
      "owned_process_count": 2,
      "reclaimable_bytes": 25495748608,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 3.4182010000000003,
      "owned_rss_bytes": 142983168,
      "owned_process_count": 2,
      "reclaimable_bytes": 25483837440,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 3.653361416,
      "owned_rss_bytes": 142983168,
      "owned_process_count": 2,
      "reclaimable_bytes": 25466585088,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 3.887790666,
      "owned_rss_bytes": 142983168,
      "owned_process_count": 2,
      "reclaimable_bytes": 25467748352,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 4.124139583,
      "owned_rss_bytes": 142983168,
      "owned_process_count": 2,
      "reclaimable_bytes": 25471107072,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 4.357858416,
      "owned_rss_bytes": 142983168,
      "owned_process_count": 2,
      "reclaimable_bytes": 25473581056,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 4.59286625,
      "owned_rss_bytes": 142983168,
      "owned_process_count": 2,
      "reclaimable_bytes": 25468944384,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 4.8330916660000005,
      "owned_rss_bytes": 142983168,
      "owned_process_count": 2,
      "reclaimable_bytes": 25376161792,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 5.068240291,
      "owned_rss_bytes": 142983168,
      "owned_process_count": 2,
      "reclaimable_bytes": 25364299776,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 5.303579416,
      "owned_rss_bytes": 142819328,
      "owned_process_count": 2,
      "reclaimable_bytes": 25361121280,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 5.53748575,
      "owned_rss_bytes": 142819328,
      "owned_process_count": 2,
      "reclaimable_bytes": 25377374208,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 5.7752046660000005,
      "owned_rss_bytes": 142819328,
      "owned_process_count": 2,
      "reclaimable_bytes": 25363496960,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 6.094427291000001,
      "owned_rss_bytes": 142819328,
      "owned_process_count": 2,
      "reclaimable_bytes": 25392250880,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 6.325307791,
      "owned_rss_bytes": 142819328,
      "owned_process_count": 2,
      "reclaimable_bytes": 25434669056,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 6.555543958,
      "owned_rss_bytes": 142819328,
      "owned_process_count": 2,
      "reclaimable_bytes": 25431097344,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 6.787261583,
      "owned_rss_bytes": 142786560,
      "owned_process_count": 2,
      "reclaimable_bytes": 25441501184,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 7.024598416,
      "owned_rss_bytes": 142786560,
      "owned_process_count": 2,
      "reclaimable_bytes": 25429508096,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 7.265277541000001,
      "owned_rss_bytes": 144490496,
      "owned_process_count": 2,
      "reclaimable_bytes": 25514885120,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 7.4946557910000005,
      "owned_rss_bytes": 144490496,
      "owned_process_count": 2,
      "reclaimable_bytes": 25539936256,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 7.72211925,
      "owned_rss_bytes": 162906112,
      "owned_process_count": 2,
      "reclaimable_bytes": 25525714944,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 7.942287500000001,
      "owned_rss_bytes": 2612871168,
      "owned_process_count": 2,
      "reclaimable_bytes": 22878257152,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 8.177593625,
      "owned_rss_bytes": 2825863168,
      "owned_process_count": 2,
      "reclaimable_bytes": 20044087296,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 8.408184833,
      "owned_rss_bytes": 2857811968,
      "owned_process_count": 2,
      "reclaimable_bytes": 19814187008,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 8.640101666,
      "owned_rss_bytes": 2943238144,
      "owned_process_count": 2,
      "reclaimable_bytes": 19473891328,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 8.868878291,
      "owned_rss_bytes": 3068395520,
      "owned_process_count": 2,
      "reclaimable_bytes": 19022544896,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 9.102313333,
      "owned_rss_bytes": 3087695872,
      "owned_process_count": 2,
      "reclaimable_bytes": 19007356928,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 9.33775175,
      "owned_rss_bytes": 3114745856,
      "owned_process_count": 2,
      "reclaimable_bytes": 19099598848,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 9.582865791,
      "owned_rss_bytes": 2977841152,
      "owned_process_count": 2,
      "reclaimable_bytes": 19440320512,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 9.825123416,
      "owned_rss_bytes": 3005644800,
      "owned_process_count": 2,
      "reclaimable_bytes": 19780665344,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 10.062353625,
      "owned_rss_bytes": 3008430080,
      "owned_process_count": 2,
      "reclaimable_bytes": 20237205504,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 10.292312,
      "owned_rss_bytes": 3005186048,
      "owned_process_count": 2,
      "reclaimable_bytes": 20633010176,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 10.537183083,
      "owned_rss_bytes": 2987573248,
      "owned_process_count": 2,
      "reclaimable_bytes": 21050589184,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 10.774638083000001,
      "owned_rss_bytes": 2997682176,
      "owned_process_count": 2,
      "reclaimable_bytes": 21587918848,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 11.014329666,
      "owned_rss_bytes": 3004727296,
      "owned_process_count": 2,
      "reclaimable_bytes": 21943156736,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 11.25500525,
      "owned_rss_bytes": 2462760960,
      "owned_process_count": 2,
      "reclaimable_bytes": 22085468160,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 11.604010583,
      "owned_rss_bytes": 1398128640,
      "owned_process_count": 2,
      "reclaimable_bytes": 22615359488,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 11.863729791,
      "owned_rss_bytes": 1028866048,
      "owned_process_count": 2,
      "reclaimable_bytes": 23055466496,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 12.108305291,
      "owned_rss_bytes": 749944832,
      "owned_process_count": 2,
      "reclaimable_bytes": 23642046464,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 12.375999375000001,
      "owned_rss_bytes": 624852992,
      "owned_process_count": 2,
      "reclaimable_bytes": 23766728704,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 12.627983416000001,
      "owned_rss_bytes": 457080832,
      "owned_process_count": 2,
      "reclaimable_bytes": 24262950912,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 12.8639665,
      "owned_rss_bytes": 490291200,
      "owned_process_count": 2,
      "reclaimable_bytes": 24460427264,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 13.116582208,
      "owned_rss_bytes": 502611968,
      "owned_process_count": 2,
      "reclaimable_bytes": 24483397632,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 13.344910791,
      "owned_rss_bytes": 502513664,
      "owned_process_count": 2,
      "reclaimable_bytes": 24573018112,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 13.588525166,
      "owned_rss_bytes": 389873664,
      "owned_process_count": 2,
      "reclaimable_bytes": 24792743936,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 13.856638041,
      "owned_rss_bytes": 223461376,
      "owned_process_count": 2,
      "reclaimable_bytes": 24771985408,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 14.128039083,
      "owned_rss_bytes": 226328576,
      "owned_process_count": 2,
      "reclaimable_bytes": 24796856320,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 14.389226541,
      "owned_rss_bytes": 206241792,
      "owned_process_count": 2,
      "reclaimable_bytes": 24772591616,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 14.634772583,
      "owned_rss_bytes": 144801792,
      "owned_process_count": 2,
      "reclaimable_bytes": 24738021376,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 14.873155583,
      "owned_rss_bytes": 270221312,
      "owned_process_count": 2,
      "reclaimable_bytes": 24809013248,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 15.123763833,
      "owned_rss_bytes": 346636288,
      "owned_process_count": 2,
      "reclaimable_bytes": 24781225984,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 15.352279958,
      "owned_rss_bytes": 362397696,
      "owned_process_count": 2,
      "reclaimable_bytes": 24701255680,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 15.592012041,
      "owned_rss_bytes": 384811008,
      "owned_process_count": 2,
      "reclaimable_bytes": 24721473536,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 15.828556916000002,
      "owned_rss_bytes": 392921088,
      "owned_process_count": 2,
      "reclaimable_bytes": 24721997824,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 16.086788165999998,
      "owned_rss_bytes": 363266048,
      "owned_process_count": 2,
      "reclaimable_bytes": 24554323968,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 16.318809791,
      "owned_rss_bytes": 394477568,
      "owned_process_count": 2,
      "reclaimable_bytes": 24562565120,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 16.547933208,
      "owned_rss_bytes": 412778496,
      "owned_process_count": 2,
      "reclaimable_bytes": 24588435456,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 16.77774125,
      "owned_rss_bytes": 414187520,
      "owned_process_count": 2,
      "reclaimable_bytes": 24544395264,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 17.017125749999998,
      "owned_rss_bytes": 436338688,
      "owned_process_count": 2,
      "reclaimable_bytes": 24580800512,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 17.253580624999998,
      "owned_rss_bytes": 441335808,
      "owned_process_count": 2,
      "reclaimable_bytes": 24605556736,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 17.489649957999998,
      "owned_rss_bytes": 349126656,
      "owned_process_count": 2,
      "reclaimable_bytes": 24709955584,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 17.730046165999997,
      "owned_rss_bytes": 365854720,
      "owned_process_count": 2,
      "reclaimable_bytes": 24605327360,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 17.969459208,
      "owned_rss_bytes": 338001920,
      "owned_process_count": 2,
      "reclaimable_bytes": 24633671680,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 18.2100075,
      "owned_rss_bytes": 217497600,
      "owned_process_count": 2,
      "reclaimable_bytes": 24508563456,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 18.453848791,
      "owned_rss_bytes": 357744640,
      "owned_process_count": 2,
      "reclaimable_bytes": 24455479296,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 18.694849124999998,
      "owned_rss_bytes": 367607808,
      "owned_process_count": 2,
      "reclaimable_bytes": 24439767040,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 18.929421332999997,
      "owned_rss_bytes": 369049600,
      "owned_process_count": 2,
      "reclaimable_bytes": 24447434752,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 19.157769582999997,
      "owned_rss_bytes": 407207936,
      "owned_process_count": 2,
      "reclaimable_bytes": 24486936576,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 19.381671916,
      "owned_rss_bytes": 404865024,
      "owned_process_count": 2,
      "reclaimable_bytes": 24200609792,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 19.632355040999997,
      "owned_rss_bytes": 250904576,
      "owned_process_count": 2,
      "reclaimable_bytes": 24259002368,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 19.868317833,
      "owned_rss_bytes": 312279040,
      "owned_process_count": 2,
      "reclaimable_bytes": 24217223168,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 20.105117125,
      "owned_rss_bytes": 342016000,
      "owned_process_count": 2,
      "reclaimable_bytes": 24150654976,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 20.340973833,
      "owned_rss_bytes": 375406592,
      "owned_process_count": 2,
      "reclaimable_bytes": 24111316992,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 20.581592082999997,
      "owned_rss_bytes": 381681664,
      "owned_process_count": 2,
      "reclaimable_bytes": 24235851776,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 20.81705825,
      "owned_rss_bytes": 354975744,
      "owned_process_count": 2,
      "reclaimable_bytes": 24325898240,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 21.065776416,
      "owned_rss_bytes": 345210880,
      "owned_process_count": 2,
      "reclaimable_bytes": 24336957440,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 21.298250333,
      "owned_rss_bytes": 345276416,
      "owned_process_count": 2,
      "reclaimable_bytes": 24430100480,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 21.531982375,
      "owned_rss_bytes": 383713280,
      "owned_process_count": 2,
      "reclaimable_bytes": 24496242688,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 21.765629625,
      "owned_rss_bytes": 404340736,
      "owned_process_count": 2,
      "reclaimable_bytes": 24406409216,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 21.999545916,
      "owned_rss_bytes": 402079744,
      "owned_process_count": 2,
      "reclaimable_bytes": 24420450304,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 22.236433499999997,
      "owned_rss_bytes": 412483584,
      "owned_process_count": 2,
      "reclaimable_bytes": 24459608064,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 22.464857165999998,
      "owned_rss_bytes": 422264832,
      "owned_process_count": 2,
      "reclaimable_bytes": 24459935744,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 22.695996082999997,
      "owned_rss_bytes": 393232384,
      "owned_process_count": 2,
      "reclaimable_bytes": 24351703040,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 22.9374595,
      "owned_rss_bytes": 407814144,
      "owned_process_count": 2,
      "reclaimable_bytes": 24177852416,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 23.170205582999998,
      "owned_rss_bytes": 408764416,
      "owned_process_count": 2,
      "reclaimable_bytes": 24160272384,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 23.410232208,
      "owned_rss_bytes": 430915584,
      "owned_process_count": 2,
      "reclaimable_bytes": 24144314368,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 23.65310675,
      "owned_rss_bytes": 409124864,
      "owned_process_count": 2,
      "reclaimable_bytes": 24181555200,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 23.883113541,
      "owned_rss_bytes": 417906688,
      "owned_process_count": 2,
      "reclaimable_bytes": 24229363712,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 24.124826875,
      "owned_rss_bytes": 418627584,
      "owned_process_count": 2,
      "reclaimable_bytes": 24232837120,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 24.360420040999998,
      "owned_rss_bytes": 418988032,
      "owned_process_count": 2,
      "reclaimable_bytes": 24235687936,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 24.592676583,
      "owned_rss_bytes": 419364864,
      "owned_process_count": 2,
      "reclaimable_bytes": 24204115968,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 24.818261999999997,
      "owned_rss_bytes": 435650560,
      "owned_process_count": 2,
      "reclaimable_bytes": 24160124928,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 25.048126625,
      "owned_rss_bytes": 455753728,
      "owned_process_count": 2,
      "reclaimable_bytes": 24055578624,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 25.289822541,
      "owned_rss_bytes": 422985728,
      "owned_process_count": 2,
      "reclaimable_bytes": 24031789056,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 25.521462582999998,
      "owned_rss_bytes": 444121088,
      "owned_process_count": 2,
      "reclaimable_bytes": 24057823232,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 25.747873665999997,
      "owned_rss_bytes": 430833664,
      "owned_process_count": 2,
      "reclaimable_bytes": 24024973312,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 25.978672166,
      "owned_rss_bytes": 431669248,
      "owned_process_count": 2,
      "reclaimable_bytes": 24015142912,
      "swapins": 44114293,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 26.217017833,
      "owned_rss_bytes": 437010432,
      "owned_process_count": 2,
      "reclaimable_bytes": 24103239680,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 26.452103833,
      "owned_rss_bytes": 437075968,
      "owned_process_count": 2,
      "reclaimable_bytes": 24080924672,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 26.683513249999997,
      "owned_rss_bytes": 430145536,
      "owned_process_count": 2,
      "reclaimable_bytes": 24128487424,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 26.927276083,
      "owned_rss_bytes": 429998080,
      "owned_process_count": 2,
      "reclaimable_bytes": 24137121792,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 27.163357916,
      "owned_rss_bytes": 430080000,
      "owned_process_count": 2,
      "reclaimable_bytes": 24141529088,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 27.394906707999997,
      "owned_rss_bytes": 409583616,
      "owned_process_count": 2,
      "reclaimable_bytes": 23985242112,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 27.675588249999997,
      "owned_rss_bytes": 371474432,
      "owned_process_count": 2,
      "reclaimable_bytes": 24031739904,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 27.906194375,
      "owned_rss_bytes": 371900416,
      "owned_process_count": 2,
      "reclaimable_bytes": 23995662336,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 28.132277207999998,
      "owned_rss_bytes": 377749504,
      "owned_process_count": 2,
      "reclaimable_bytes": 23977639936,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 28.378896958,
      "owned_rss_bytes": 400588800,
      "owned_process_count": 2,
      "reclaimable_bytes": 23989141504,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 28.604152582999998,
      "owned_rss_bytes": 400605184,
      "owned_process_count": 2,
      "reclaimable_bytes": 23980244992,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 28.833320166,
      "owned_rss_bytes": 437485568,
      "owned_process_count": 2,
      "reclaimable_bytes": 24030789632,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 29.065026125,
      "owned_rss_bytes": 445710336,
      "owned_process_count": 2,
      "reclaimable_bytes": 24043749376,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 29.301932583,
      "owned_rss_bytes": 445775872,
      "owned_process_count": 2,
      "reclaimable_bytes": 24039260160,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 29.534256790999997,
      "owned_rss_bytes": 445808640,
      "owned_process_count": 2,
      "reclaimable_bytes": 24055087104,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 29.777824958,
      "owned_rss_bytes": 445841408,
      "owned_process_count": 2,
      "reclaimable_bytes": 23959945216,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 30.025800832999998,
      "owned_rss_bytes": 444776448,
      "owned_process_count": 2,
      "reclaimable_bytes": 24004575232,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 30.265049791,
      "owned_rss_bytes": 445415424,
      "owned_process_count": 2,
      "reclaimable_bytes": 23980457984,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 30.490323874999998,
      "owned_rss_bytes": 445136896,
      "owned_process_count": 2,
      "reclaimable_bytes": 23970119680,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 30.718468290999997,
      "owned_rss_bytes": 445120512,
      "owned_process_count": 2,
      "reclaimable_bytes": 23909171200,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 30.9462935,
      "owned_rss_bytes": 445153280,
      "owned_process_count": 2,
      "reclaimable_bytes": 23914692608,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 31.177970332999998,
      "owned_rss_bytes": 445153280,
      "owned_process_count": 2,
      "reclaimable_bytes": 23979114496,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 31.416505666,
      "owned_rss_bytes": 445186048,
      "owned_process_count": 2,
      "reclaimable_bytes": 23977574400,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 31.646609290999997,
      "owned_rss_bytes": 445251584,
      "owned_process_count": 2,
      "reclaimable_bytes": 23954030592,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 31.886860208,
      "owned_rss_bytes": 445284352,
      "owned_process_count": 2,
      "reclaimable_bytes": 23954817024,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 32.131879291,
      "owned_rss_bytes": 459210752,
      "owned_process_count": 2,
      "reclaimable_bytes": 23830380544,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 32.382023916,
      "owned_rss_bytes": 459063296,
      "owned_process_count": 2,
      "reclaimable_bytes": 23831166976,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 32.616212749999995,
      "owned_rss_bytes": 459063296,
      "owned_process_count": 2,
      "reclaimable_bytes": 23821041664,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 32.845849208,
      "owned_rss_bytes": 461848576,
      "owned_process_count": 2,
      "reclaimable_bytes": 23823859712,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 33.081496166,
      "owned_rss_bytes": 465715200,
      "owned_process_count": 2,
      "reclaimable_bytes": 23780737024,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 33.31066475,
      "owned_rss_bytes": 465747968,
      "owned_process_count": 2,
      "reclaimable_bytes": 23853973504,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 33.544149333,
      "owned_rss_bytes": 466124800,
      "owned_process_count": 2,
      "reclaimable_bytes": 23877419008,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 33.796132666,
      "owned_rss_bytes": 466075648,
      "owned_process_count": 2,
      "reclaimable_bytes": 23927521280,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 34.032397333,
      "owned_rss_bytes": 464961536,
      "owned_process_count": 2,
      "reclaimable_bytes": 23972282368,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 34.27402575,
      "owned_rss_bytes": 456359936,
      "owned_process_count": 2,
      "reclaimable_bytes": 23983931392,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 34.510727958,
      "owned_rss_bytes": 464601088,
      "owned_process_count": 2,
      "reclaimable_bytes": 23879401472,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 34.760296540999995,
      "owned_rss_bytes": 456736768,
      "owned_process_count": 2,
      "reclaimable_bytes": 23890984960,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 35.003248458,
      "owned_rss_bytes": 459505664,
      "owned_process_count": 2,
      "reclaimable_bytes": 23864442880,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 35.241268375,
      "owned_rss_bytes": 459538432,
      "owned_process_count": 2,
      "reclaimable_bytes": 23914135552,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 35.473455458,
      "owned_rss_bytes": 460111872,
      "owned_process_count": 2,
      "reclaimable_bytes": 23896555520,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 35.701392833,
      "owned_rss_bytes": 460308480,
      "owned_process_count": 2,
      "reclaimable_bytes": 23911579648,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 35.932556958,
      "owned_rss_bytes": 463634432,
      "owned_process_count": 2,
      "reclaimable_bytes": 23980212224,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 36.173724625,
      "owned_rss_bytes": 463323136,
      "owned_process_count": 2,
      "reclaimable_bytes": 23954472960,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 36.406319791,
      "owned_rss_bytes": 463814656,
      "owned_process_count": 2,
      "reclaimable_bytes": 23944560640,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 36.642622458,
      "owned_rss_bytes": 465436672,
      "owned_process_count": 2,
      "reclaimable_bytes": 23942856704,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 36.876502916,
      "owned_rss_bytes": 465551360,
      "owned_process_count": 2,
      "reclaimable_bytes": 23849795584,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 37.118226666,
      "owned_rss_bytes": 465551360,
      "owned_process_count": 2,
      "reclaimable_bytes": 23860854784,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 37.359808041,
      "owned_rss_bytes": 465567744,
      "owned_process_count": 2,
      "reclaimable_bytes": 23866228736,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 37.59773025,
      "owned_rss_bytes": 465567744,
      "owned_process_count": 2,
      "reclaimable_bytes": 23845175296,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 37.834621958,
      "owned_rss_bytes": 465616896,
      "owned_process_count": 2,
      "reclaimable_bytes": 23850729472,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 38.065679875,
      "owned_rss_bytes": 465633280,
      "owned_process_count": 2,
      "reclaimable_bytes": 23916118016,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 38.300843625,
      "owned_rss_bytes": 465666048,
      "owned_process_count": 2,
      "reclaimable_bytes": 23890493440,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 38.534286832999996,
      "owned_rss_bytes": 466485248,
      "owned_process_count": 2,
      "reclaimable_bytes": 23602216960,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 38.76917625,
      "owned_rss_bytes": 466534400,
      "owned_process_count": 2,
      "reclaimable_bytes": 23546167296,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 39.012553583,
      "owned_rss_bytes": 466534400,
      "owned_process_count": 2,
      "reclaimable_bytes": 23517200384,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 39.24312775,
      "owned_rss_bytes": 466567168,
      "owned_process_count": 2,
      "reclaimable_bytes": 23512383488,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 39.476748707999995,
      "owned_rss_bytes": 466567168,
      "owned_process_count": 2,
      "reclaimable_bytes": 23500095488,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 39.714939832999995,
      "owned_rss_bytes": 466599936,
      "owned_process_count": 2,
      "reclaimable_bytes": 23688003584,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 39.953440041,
      "owned_rss_bytes": 466599936,
      "owned_process_count": 2,
      "reclaimable_bytes": 23844798464,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 40.195890666,
      "owned_rss_bytes": 466632704,
      "owned_process_count": 2,
      "reclaimable_bytes": 23868555264,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 40.436479,
      "owned_rss_bytes": 466665472,
      "owned_process_count": 2,
      "reclaimable_bytes": 23841193984,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 40.676146708,
      "owned_rss_bytes": 466681856,
      "owned_process_count": 2,
      "reclaimable_bytes": 23853367296,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 40.906302,
      "owned_rss_bytes": 466698240,
      "owned_process_count": 2,
      "reclaimable_bytes": 23856922624,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 41.139615833,
      "owned_rss_bytes": 466747392,
      "owned_process_count": 2,
      "reclaimable_bytes": 23782162432,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 41.375830375,
      "owned_rss_bytes": 466747392,
      "owned_process_count": 2,
      "reclaimable_bytes": 23744856064,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 41.610243208,
      "owned_rss_bytes": 466780160,
      "owned_process_count": 2,
      "reclaimable_bytes": 23739744256,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 41.845223333,
      "owned_rss_bytes": 466780160,
      "owned_process_count": 2,
      "reclaimable_bytes": 23747395584,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 42.086184541,
      "owned_rss_bytes": 466878464,
      "owned_process_count": 2,
      "reclaimable_bytes": 23731863552,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 42.318968665999996,
      "owned_rss_bytes": 466878464,
      "owned_process_count": 2,
      "reclaimable_bytes": 23748689920,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 42.546470125,
      "owned_rss_bytes": 465223680,
      "owned_process_count": 2,
      "reclaimable_bytes": 23869112320,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 42.787166666,
      "owned_rss_bytes": 465190912,
      "owned_process_count": 2,
      "reclaimable_bytes": 23853563904,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 43.032351666,
      "owned_rss_bytes": 466829312,
      "owned_process_count": 2,
      "reclaimable_bytes": 23885463552,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 43.273005624999996,
      "owned_rss_bytes": 469876736,
      "owned_process_count": 2,
      "reclaimable_bytes": 23782178816,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 43.506381665999996,
      "owned_rss_bytes": 467009536,
      "owned_process_count": 2,
      "reclaimable_bytes": 23779655680,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 43.740205916,
      "owned_rss_bytes": 467025920,
      "owned_process_count": 2,
      "reclaimable_bytes": 23752081408,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 43.982807875,
      "owned_rss_bytes": 467058688,
      "owned_process_count": 2,
      "reclaimable_bytes": 23728291840,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 44.220686541,
      "owned_rss_bytes": 467058688,
      "owned_process_count": 2,
      "reclaimable_bytes": 23711563776,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 44.450823125,
      "owned_rss_bytes": 466337792,
      "owned_process_count": 2,
      "reclaimable_bytes": 23750443008,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 44.681865583,
      "owned_rss_bytes": 466337792,
      "owned_process_count": 2,
      "reclaimable_bytes": 23792058368,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 44.922240666,
      "owned_rss_bytes": 466370560,
      "owned_process_count": 2,
      "reclaimable_bytes": 23745232896,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 45.157468208,
      "owned_rss_bytes": 466092032,
      "owned_process_count": 2,
      "reclaimable_bytes": 23766761472,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 45.398846708,
      "owned_rss_bytes": 466173952,
      "owned_process_count": 2,
      "reclaimable_bytes": 23776362496,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 45.635489041,
      "owned_rss_bytes": 466288640,
      "owned_process_count": 2,
      "reclaimable_bytes": 23691706368,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 45.871749333,
      "owned_rss_bytes": 466190336,
      "owned_process_count": 2,
      "reclaimable_bytes": 23706877952,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 46.103399958,
      "owned_rss_bytes": 466305024,
      "owned_process_count": 2,
      "reclaimable_bytes": 23700094976,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 46.340105625,
      "owned_rss_bytes": 466354176,
      "owned_process_count": 2,
      "reclaimable_bytes": 23680450560,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 46.577965082999995,
      "owned_rss_bytes": 466272256,
      "owned_process_count": 2,
      "reclaimable_bytes": 23769743360,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 46.815103582999996,
      "owned_rss_bytes": 466288640,
      "owned_process_count": 2,
      "reclaimable_bytes": 23822696448,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 47.053405708,
      "owned_rss_bytes": 466370560,
      "owned_process_count": 2,
      "reclaimable_bytes": 23834607616,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 47.292470625,
      "owned_rss_bytes": 466501632,
      "owned_process_count": 2,
      "reclaimable_bytes": 23835967488,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 47.526323583,
      "owned_rss_bytes": 466501632,
      "owned_process_count": 2,
      "reclaimable_bytes": 23866245120,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 47.765908290999995,
      "owned_rss_bytes": 466518016,
      "owned_process_count": 2,
      "reclaimable_bytes": 23769415680,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 48.009052,
      "owned_rss_bytes": 466403328,
      "owned_process_count": 2,
      "reclaimable_bytes": 23804592128,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 48.234848875,
      "owned_rss_bytes": 466501632,
      "owned_process_count": 2,
      "reclaimable_bytes": 23809540096,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 48.478908208,
      "owned_rss_bytes": 466485248,
      "owned_process_count": 2,
      "reclaimable_bytes": 23824252928,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 48.712196915999996,
      "owned_rss_bytes": 444514304,
      "owned_process_count": 2,
      "reclaimable_bytes": 23835869184,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 48.94366275,
      "owned_rss_bytes": 466649088,
      "owned_process_count": 2,
      "reclaimable_bytes": 23929438208,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 49.172339333,
      "owned_rss_bytes": 466665472,
      "owned_process_count": 2,
      "reclaimable_bytes": 23919853568,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 49.40519725,
      "owned_rss_bytes": 466698240,
      "owned_process_count": 2,
      "reclaimable_bytes": 23948673024,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 49.636541541,
      "owned_rss_bytes": 466698240,
      "owned_process_count": 2,
      "reclaimable_bytes": 23919460352,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 49.865504458,
      "owned_rss_bytes": 466731008,
      "owned_process_count": 2,
      "reclaimable_bytes": 23914397696,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 50.097292791,
      "owned_rss_bytes": 466747392,
      "owned_process_count": 2,
      "reclaimable_bytes": 23829397504,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 50.33749225,
      "owned_rss_bytes": 466763776,
      "owned_process_count": 2,
      "reclaimable_bytes": 23812734976,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 50.577032541,
      "owned_rss_bytes": 466862080,
      "owned_process_count": 2,
      "reclaimable_bytes": 23780769792,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 50.818868375,
      "owned_rss_bytes": 466862080,
      "owned_process_count": 2,
      "reclaimable_bytes": 23782506496,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 51.061582166,
      "owned_rss_bytes": 466927616,
      "owned_process_count": 2,
      "reclaimable_bytes": 23835230208,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 51.30134475,
      "owned_rss_bytes": 467271680,
      "owned_process_count": 2,
      "reclaimable_bytes": 23787880448,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 51.534480791,
      "owned_rss_bytes": 467173376,
      "owned_process_count": 2,
      "reclaimable_bytes": 23839653888,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 51.773517583,
      "owned_rss_bytes": 467173376,
      "owned_process_count": 2,
      "reclaimable_bytes": 23837982720,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 52.009577332999996,
      "owned_rss_bytes": 467288064,
      "owned_process_count": 2,
      "reclaimable_bytes": 23853400064,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 52.240248916,
      "owned_rss_bytes": 467320832,
      "owned_process_count": 2,
      "reclaimable_bytes": 23765942272,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 52.475706833,
      "owned_rss_bytes": 467353600,
      "owned_process_count": 2,
      "reclaimable_bytes": 23749885952,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 52.707896749999996,
      "owned_rss_bytes": 467369984,
      "owned_process_count": 2,
      "reclaimable_bytes": 23741415424,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 52.949200375,
      "owned_rss_bytes": 467419136,
      "owned_process_count": 2,
      "reclaimable_bytes": 23757619200,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 53.190075582999995,
      "owned_rss_bytes": 467419136,
      "owned_process_count": 2,
      "reclaimable_bytes": 23749705728,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 53.430302499999996,
      "owned_rss_bytes": 467451904,
      "owned_process_count": 2,
      "reclaimable_bytes": 23827218432,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 53.659925041,
      "owned_rss_bytes": 467451904,
      "owned_process_count": 2,
      "reclaimable_bytes": 23819649024,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 53.899404499999996,
      "owned_rss_bytes": 467894272,
      "owned_process_count": 2,
      "reclaimable_bytes": 23812440064,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 54.129081082999996,
      "owned_rss_bytes": 467795968,
      "owned_process_count": 2,
      "reclaimable_bytes": 23825383424,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 54.360659999999996,
      "owned_rss_bytes": 467877888,
      "owned_process_count": 2,
      "reclaimable_bytes": 23750082560,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 54.590675375,
      "owned_rss_bytes": 467877888,
      "owned_process_count": 2,
      "reclaimable_bytes": 23717593088,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 54.82408575,
      "owned_rss_bytes": 467910656,
      "owned_process_count": 2,
      "reclaimable_bytes": 23706189824,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 55.058042958,
      "owned_rss_bytes": 467894272,
      "owned_process_count": 2,
      "reclaimable_bytes": 23706566656,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 55.29065075,
      "owned_rss_bytes": 467927040,
      "owned_process_count": 2,
      "reclaimable_bytes": 23705911296,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 55.521333874999996,
      "owned_rss_bytes": 467943424,
      "owned_process_count": 2,
      "reclaimable_bytes": 23779901440,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 55.757218832999996,
      "owned_rss_bytes": 467976192,
      "owned_process_count": 2,
      "reclaimable_bytes": 23781933056,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 56.001397415999996,
      "owned_rss_bytes": 467976192,
      "owned_process_count": 2,
      "reclaimable_bytes": 23682990080,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 56.236154583,
      "owned_rss_bytes": 468008960,
      "owned_process_count": 2,
      "reclaimable_bytes": 23676698624,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 56.478750208,
      "owned_rss_bytes": 467943424,
      "owned_process_count": 2,
      "reclaimable_bytes": 23588978688,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 56.711787916,
      "owned_rss_bytes": 468025344,
      "owned_process_count": 2,
      "reclaimable_bytes": 23602167808,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 56.941380124999995,
      "owned_rss_bytes": 468090880,
      "owned_process_count": 2,
      "reclaimable_bytes": 23592992768,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 57.168703416,
      "owned_rss_bytes": 468140032,
      "owned_process_count": 2,
      "reclaimable_bytes": 23578034176,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 57.399067416,
      "owned_rss_bytes": 468140032,
      "owned_process_count": 2,
      "reclaimable_bytes": 23604248576,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 57.628620375,
      "owned_rss_bytes": 468172800,
      "owned_process_count": 2,
      "reclaimable_bytes": 23610916864,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 57.857009458,
      "owned_rss_bytes": 468172800,
      "owned_process_count": 2,
      "reclaimable_bytes": 23660167168,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 58.101870416,
      "owned_rss_bytes": 468205568,
      "owned_process_count": 2,
      "reclaimable_bytes": 23588257792,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 58.342747040999996,
      "owned_rss_bytes": 468205568,
      "owned_process_count": 2,
      "reclaimable_bytes": 23592206336,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 58.585753540999995,
      "owned_rss_bytes": 468271104,
      "owned_process_count": 2,
      "reclaimable_bytes": 23605755904,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 58.817825458,
      "owned_rss_bytes": 468107264,
      "owned_process_count": 2,
      "reclaimable_bytes": 23515381760,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 59.051893875,
      "owned_rss_bytes": 468041728,
      "owned_process_count": 2,
      "reclaimable_bytes": 23561142272,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 59.294100457999996,
      "owned_rss_bytes": 468058112,
      "owned_process_count": 2,
      "reclaimable_bytes": 23537041408,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 59.529347416,
      "owned_rss_bytes": 468205568,
      "owned_process_count": 2,
      "reclaimable_bytes": 23546249216,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 59.769643832999996,
      "owned_rss_bytes": 468238336,
      "owned_process_count": 2,
      "reclaimable_bytes": 23552425984,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 60.01251525,
      "owned_rss_bytes": 468271104,
      "owned_process_count": 2,
      "reclaimable_bytes": 23622991872,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 60.252402583,
      "owned_rss_bytes": 468271104,
      "owned_process_count": 2,
      "reclaimable_bytes": 23636213760,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 60.48348525,
      "owned_rss_bytes": 468336640,
      "owned_process_count": 2,
      "reclaimable_bytes": 23623368704,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 60.716025375,
      "owned_rss_bytes": 468336640,
      "owned_process_count": 2,
      "reclaimable_bytes": 23636066304,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 60.949786333,
      "owned_rss_bytes": 468369408,
      "owned_process_count": 2,
      "reclaimable_bytes": 23537696768,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 61.186373499999995,
      "owned_rss_bytes": 468369408,
      "owned_process_count": 2,
      "reclaimable_bytes": 23547707392,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 61.417303415999996,
      "owned_rss_bytes": 468402176,
      "owned_process_count": 2,
      "reclaimable_bytes": 23530110976,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 61.66064875,
      "owned_rss_bytes": 468418560,
      "owned_process_count": 2,
      "reclaimable_bytes": 23539875840,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 61.890747291,
      "owned_rss_bytes": 468451328,
      "owned_process_count": 2,
      "reclaimable_bytes": 23424122880,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 62.127848125,
      "owned_rss_bytes": 468451328,
      "owned_process_count": 2,
      "reclaimable_bytes": 23447928832,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 62.361866416,
      "owned_rss_bytes": 468533248,
      "owned_process_count": 2,
      "reclaimable_bytes": 23446175744,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 62.597398915999996,
      "owned_rss_bytes": 468533248,
      "owned_process_count": 2,
      "reclaimable_bytes": 23458234368,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 62.831851625,
      "owned_rss_bytes": 468566016,
      "owned_process_count": 2,
      "reclaimable_bytes": 23476027392,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 63.066247499999996,
      "owned_rss_bytes": 468566016,
      "owned_process_count": 2,
      "reclaimable_bytes": 23475011584,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 63.299468083,
      "owned_rss_bytes": 468500480,
      "owned_process_count": 2,
      "reclaimable_bytes": 23387635712,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 63.538325625,
      "owned_rss_bytes": 468500480,
      "owned_process_count": 2,
      "reclaimable_bytes": 23351705600,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 63.771306916,
      "owned_rss_bytes": 468500480,
      "owned_process_count": 2,
      "reclaimable_bytes": 23394189312,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 64.0068315,
      "owned_rss_bytes": 468500480,
      "owned_process_count": 2,
      "reclaimable_bytes": 23346937856,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 64.252452625,
      "owned_rss_bytes": 468549632,
      "owned_process_count": 2,
      "reclaimable_bytes": 23443406848,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 64.496158166,
      "owned_rss_bytes": 468582400,
      "owned_process_count": 2,
      "reclaimable_bytes": 23419060224,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 64.737913041,
      "owned_rss_bytes": 468975616,
      "owned_process_count": 2,
      "reclaimable_bytes": 23426695168,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 64.968967458,
      "owned_rss_bytes": 468729856,
      "owned_process_count": 2,
      "reclaimable_bytes": 23433674752,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 65.209370625,
      "owned_rss_bytes": 468762624,
      "owned_process_count": 2,
      "reclaimable_bytes": 23432511488,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 65.441300666,
      "owned_rss_bytes": 468779008,
      "owned_process_count": 2,
      "reclaimable_bytes": 23350099968,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 65.669022708,
      "owned_rss_bytes": 468811776,
      "owned_process_count": 2,
      "reclaimable_bytes": 23342514176,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 65.90897075,
      "owned_rss_bytes": 478773248,
      "owned_process_count": 2,
      "reclaimable_bytes": 23389175808,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 66.147379583,
      "owned_rss_bytes": 478806016,
      "owned_process_count": 2,
      "reclaimable_bytes": 23390666752,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 66.37970225,
      "owned_rss_bytes": 478806016,
      "owned_process_count": 2,
      "reclaimable_bytes": 23392092160,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 66.60840437499999,
      "owned_rss_bytes": 478838784,
      "owned_process_count": 2,
      "reclaimable_bytes": 23472799744,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 66.852245375,
      "owned_rss_bytes": 478855168,
      "owned_process_count": 2,
      "reclaimable_bytes": 23457808384,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 67.091297125,
      "owned_rss_bytes": 478871552,
      "owned_process_count": 2,
      "reclaimable_bytes": 23452008448,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 67.328449208,
      "owned_rss_bytes": 478904320,
      "owned_process_count": 2,
      "reclaimable_bytes": 23438753792,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 67.564660375,
      "owned_rss_bytes": 479182848,
      "owned_process_count": 2,
      "reclaimable_bytes": 23379034112,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 67.791847666,
      "owned_rss_bytes": 478920704,
      "owned_process_count": 2,
      "reclaimable_bytes": 23350640640,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 68.021028708,
      "owned_rss_bytes": 478920704,
      "owned_process_count": 2,
      "reclaimable_bytes": 23333421056,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 68.253932833,
      "owned_rss_bytes": 478937088,
      "owned_process_count": 2,
      "reclaimable_bytes": 23338532864,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 68.491553916,
      "owned_rss_bytes": 479019008,
      "owned_process_count": 2,
      "reclaimable_bytes": 23357636608,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 68.729474083,
      "owned_rss_bytes": 478396416,
      "owned_process_count": 2,
      "reclaimable_bytes": 23244046336,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 68.964334666,
      "owned_rss_bytes": 478248960,
      "owned_process_count": 2,
      "reclaimable_bytes": 23218765824,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 69.20501116599999,
      "owned_rss_bytes": 478281728,
      "owned_process_count": 2,
      "reclaimable_bytes": 23199858688,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 69.452477541,
      "owned_rss_bytes": 478314496,
      "owned_process_count": 2,
      "reclaimable_bytes": 23198973952,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 69.683849958,
      "owned_rss_bytes": 478314496,
      "owned_process_count": 2,
      "reclaimable_bytes": 23331241984,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 69.916732416,
      "owned_rss_bytes": 478347264,
      "owned_process_count": 2,
      "reclaimable_bytes": 23259824128,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 70.15021175,
      "owned_rss_bytes": 478281728,
      "owned_process_count": 2,
      "reclaimable_bytes": 22926917632,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 70.382232833,
      "owned_rss_bytes": 478396416,
      "owned_process_count": 2,
      "reclaimable_bytes": 22918955008,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 70.624050875,
      "owned_rss_bytes": 478412800,
      "owned_process_count": 2,
      "reclaimable_bytes": 22908502016,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 70.857193333,
      "owned_rss_bytes": 478445568,
      "owned_process_count": 2,
      "reclaimable_bytes": 22927917056,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 71.090160541,
      "owned_rss_bytes": 478461952,
      "owned_process_count": 2,
      "reclaimable_bytes": 22916530176,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 71.316709791,
      "owned_rss_bytes": 478478336,
      "owned_process_count": 2,
      "reclaimable_bytes": 22955868160,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 71.559747375,
      "owned_rss_bytes": 478494720,
      "owned_process_count": 2,
      "reclaimable_bytes": 23052632064,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 71.80057975,
      "owned_rss_bytes": 478511104,
      "owned_process_count": 2,
      "reclaimable_bytes": 23045685248,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 72.050234166,
      "owned_rss_bytes": 478511104,
      "owned_process_count": 2,
      "reclaimable_bytes": 23043604480,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 72.286274875,
      "owned_rss_bytes": 478560256,
      "owned_process_count": 2,
      "reclaimable_bytes": 23054712832,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 72.519160375,
      "owned_rss_bytes": 478576640,
      "owned_process_count": 2,
      "reclaimable_bytes": 24285642752,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 72.753243958,
      "owned_rss_bytes": 478560256,
      "owned_process_count": 2,
      "reclaimable_bytes": 24219811840,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 72.983645583,
      "owned_rss_bytes": 478674944,
      "owned_process_count": 2,
      "reclaimable_bytes": 24283693056,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 73.21216725,
      "owned_rss_bytes": 478724096,
      "owned_process_count": 2,
      "reclaimable_bytes": 24283840512,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 73.441532666,
      "owned_rss_bytes": 478724096,
      "owned_process_count": 2,
      "reclaimable_bytes": 24275550208,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 73.67397908299999,
      "owned_rss_bytes": 478756864,
      "owned_process_count": 2,
      "reclaimable_bytes": 24281743360,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 73.910251666,
      "owned_rss_bytes": 478756864,
      "owned_process_count": 2,
      "reclaimable_bytes": 24269340672,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 74.145045916,
      "owned_rss_bytes": 478724096,
      "owned_process_count": 2,
      "reclaimable_bytes": 24265818112,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 74.383549708,
      "owned_rss_bytes": 478724096,
      "owned_process_count": 2,
      "reclaimable_bytes": 24279302144,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 74.61318579099999,
      "owned_rss_bytes": 478756864,
      "owned_process_count": 2,
      "reclaimable_bytes": 24271486976,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 74.85755033299999,
      "owned_rss_bytes": 478412800,
      "owned_process_count": 2,
      "reclaimable_bytes": 24296701952,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 75.091789875,
      "owned_rss_bytes": 476807168,
      "owned_process_count": 2,
      "reclaimable_bytes": 24310300672,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 75.321462541,
      "owned_rss_bytes": 479461376,
      "owned_process_count": 2,
      "reclaimable_bytes": 24274108416,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 75.560325375,
      "owned_rss_bytes": 476987392,
      "owned_process_count": 2,
      "reclaimable_bytes": 24325996544,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 75.799388833,
      "owned_rss_bytes": 476971008,
      "owned_process_count": 2,
      "reclaimable_bytes": 24318918656,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 76.029636333,
      "owned_rss_bytes": 477003776,
      "owned_process_count": 2,
      "reclaimable_bytes": 24295669760,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 76.26079483299999,
      "owned_rss_bytes": 477003776,
      "owned_process_count": 2,
      "reclaimable_bytes": 24289886208,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 76.49162799999999,
      "owned_rss_bytes": 477036544,
      "owned_process_count": 2,
      "reclaimable_bytes": 24283906048,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 76.7250785,
      "owned_rss_bytes": 477036544,
      "owned_process_count": 2,
      "reclaimable_bytes": 24352260096,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 76.95578204099999,
      "owned_rss_bytes": 477069312,
      "owned_process_count": 2,
      "reclaimable_bytes": 24348393472,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 77.193229416,
      "owned_rss_bytes": 477085696,
      "owned_process_count": 2,
      "reclaimable_bytes": 24250793984,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 77.427271875,
      "owned_rss_bytes": 477102080,
      "owned_process_count": 2,
      "reclaimable_bytes": 24237375488,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 77.671525,
      "owned_rss_bytes": 477118464,
      "owned_process_count": 2,
      "reclaimable_bytes": 24193155072,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 77.906914625,
      "owned_rss_bytes": 479690752,
      "owned_process_count": 2,
      "reclaimable_bytes": 24187109376,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 78.14040475,
      "owned_rss_bytes": 477167616,
      "owned_process_count": 2,
      "reclaimable_bytes": 24063590400,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 78.37464849999999,
      "owned_rss_bytes": 477233152,
      "owned_process_count": 2,
      "reclaimable_bytes": 24050057216,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 78.604579458,
      "owned_rss_bytes": 477233152,
      "owned_process_count": 2,
      "reclaimable_bytes": 24053415936,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 78.839542708,
      "owned_rss_bytes": 477265920,
      "owned_process_count": 2,
      "reclaimable_bytes": 24026202112,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 79.077851375,
      "owned_rss_bytes": 477265920,
      "owned_process_count": 2,
      "reclaimable_bytes": 24022188032,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 79.311461,
      "owned_rss_bytes": 477298688,
      "owned_process_count": 2,
      "reclaimable_bytes": 23755964416,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 79.550461291,
      "owned_rss_bytes": 477331456,
      "owned_process_count": 2,
      "reclaimable_bytes": 23742889984,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 79.786526958,
      "owned_rss_bytes": 477298688,
      "owned_process_count": 2,
      "reclaimable_bytes": 23732125696,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 80.025976916,
      "owned_rss_bytes": 477265920,
      "owned_process_count": 2,
      "reclaimable_bytes": 23726915584,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 80.26509616599999,
      "owned_rss_bytes": 477265920,
      "owned_process_count": 2,
      "reclaimable_bytes": 23752409088,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 80.49881325,
      "owned_rss_bytes": 480296960,
      "owned_process_count": 2,
      "reclaimable_bytes": 23874027520,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 80.730654166,
      "owned_rss_bytes": 477396992,
      "owned_process_count": 2,
      "reclaimable_bytes": 23898505216,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 80.958956458,
      "owned_rss_bytes": 477462528,
      "owned_process_count": 2,
      "reclaimable_bytes": 23850745856,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 81.191195083,
      "owned_rss_bytes": 477462528,
      "owned_process_count": 2,
      "reclaimable_bytes": 23883366400,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 81.42441074999999,
      "owned_rss_bytes": 477495296,
      "owned_process_count": 2,
      "reclaimable_bytes": 23987748864,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 81.660596083,
      "owned_rss_bytes": 477511680,
      "owned_process_count": 2,
      "reclaimable_bytes": 24016142336,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 81.893057583,
      "owned_rss_bytes": 477544448,
      "owned_process_count": 2,
      "reclaimable_bytes": 23989092352,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 82.123719291,
      "owned_rss_bytes": 477528064,
      "owned_process_count": 2,
      "reclaimable_bytes": 23987830784,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 82.367140208,
      "owned_rss_bytes": 477577216,
      "owned_process_count": 2,
      "reclaimable_bytes": 23985733632,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 82.602991166,
      "owned_rss_bytes": 477560832,
      "owned_process_count": 2,
      "reclaimable_bytes": 23951851520,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 82.841695125,
      "owned_rss_bytes": 477577216,
      "owned_process_count": 2,
      "reclaimable_bytes": 23952556032,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 83.07623966599999,
      "owned_rss_bytes": 480247808,
      "owned_process_count": 2,
      "reclaimable_bytes": 23853252608,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 83.30513225,
      "owned_rss_bytes": 477790208,
      "owned_process_count": 2,
      "reclaimable_bytes": 23935795200,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 83.53467695799999,
      "owned_rss_bytes": 477822976,
      "owned_process_count": 2,
      "reclaimable_bytes": 23916707840,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 83.764442375,
      "owned_rss_bytes": 477855744,
      "owned_process_count": 2,
      "reclaimable_bytes": 23711088640,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 84.001156166,
      "owned_rss_bytes": 477888512,
      "owned_process_count": 2,
      "reclaimable_bytes": 23690428416,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 84.234422458,
      "owned_rss_bytes": 477921280,
      "owned_process_count": 2,
      "reclaimable_bytes": 23667605504,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 84.470248125,
      "owned_rss_bytes": 477921280,
      "owned_process_count": 2,
      "reclaimable_bytes": 23391010816,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 84.71100945799999,
      "owned_rss_bytes": 477888512,
      "owned_process_count": 2,
      "reclaimable_bytes": 23420616704,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 84.949582333,
      "owned_rss_bytes": 477904896,
      "owned_process_count": 2,
      "reclaimable_bytes": 23460823040,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 85.196617791,
      "owned_rss_bytes": 477921280,
      "owned_process_count": 2,
      "reclaimable_bytes": 23365910528,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 85.436279708,
      "owned_rss_bytes": 477937664,
      "owned_process_count": 2,
      "reclaimable_bytes": 23372201984,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 85.676155833,
      "owned_rss_bytes": 478281728,
      "owned_process_count": 2,
      "reclaimable_bytes": 23525310464,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 85.913629041,
      "owned_rss_bytes": 477986816,
      "owned_process_count": 2,
      "reclaimable_bytes": 23522033664,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 86.144247875,
      "owned_rss_bytes": 478052352,
      "owned_process_count": 2,
      "reclaimable_bytes": 23519313920,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 86.383703875,
      "owned_rss_bytes": 478068736,
      "owned_process_count": 2,
      "reclaimable_bytes": 23524196352,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 86.617975083,
      "owned_rss_bytes": 478101504,
      "owned_process_count": 2,
      "reclaimable_bytes": 23521820672,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 86.848078458,
      "owned_rss_bytes": 478117888,
      "owned_process_count": 2,
      "reclaimable_bytes": 23153868800,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 87.085546208,
      "owned_rss_bytes": 478085120,
      "owned_process_count": 2,
      "reclaimable_bytes": 23146528768,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 87.323569833,
      "owned_rss_bytes": 478101504,
      "owned_process_count": 2,
      "reclaimable_bytes": 23146659840,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 87.55375575,
      "owned_rss_bytes": 478117888,
      "owned_process_count": 2,
      "reclaimable_bytes": 23155638272,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 87.79550191599999,
      "owned_rss_bytes": 478134272,
      "owned_process_count": 2,
      "reclaimable_bytes": 23298965504,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 88.03757424999999,
      "owned_rss_bytes": 478150656,
      "owned_process_count": 2,
      "reclaimable_bytes": 23312531456,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 88.28072374999999,
      "owned_rss_bytes": 478216192,
      "owned_process_count": 2,
      "reclaimable_bytes": 23306862592,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 88.51709137499999,
      "owned_rss_bytes": 478445568,
      "owned_process_count": 2,
      "reclaimable_bytes": 23356440576,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 88.748461083,
      "owned_rss_bytes": 478150656,
      "owned_process_count": 2,
      "reclaimable_bytes": 23322443776,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 88.976097291,
      "owned_rss_bytes": 478183424,
      "owned_process_count": 2,
      "reclaimable_bytes": 23321198592,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 89.212580291,
      "owned_rss_bytes": 478183424,
      "owned_process_count": 2,
      "reclaimable_bytes": 23327096832,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 89.457328666,
      "owned_rss_bytes": 478216192,
      "owned_process_count": 2,
      "reclaimable_bytes": 23316873216,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 89.686884958,
      "owned_rss_bytes": 478248960,
      "owned_process_count": 2,
      "reclaimable_bytes": 23316905984,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 89.93181287499999,
      "owned_rss_bytes": 478248960,
      "owned_process_count": 2,
      "reclaimable_bytes": 23293542400,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 90.16998099999999,
      "owned_rss_bytes": 478281728,
      "owned_process_count": 2,
      "reclaimable_bytes": 23264296960,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 90.402190291,
      "owned_rss_bytes": 478314496,
      "owned_process_count": 2,
      "reclaimable_bytes": 23286284288,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 90.628509666,
      "owned_rss_bytes": 478347264,
      "owned_process_count": 2,
      "reclaimable_bytes": 23273455616,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 90.859871041,
      "owned_rss_bytes": 478363648,
      "owned_process_count": 2,
      "reclaimable_bytes": 23280615424,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 91.09669858299999,
      "owned_rss_bytes": 478707712,
      "owned_process_count": 2,
      "reclaimable_bytes": 23237345280,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 91.333141291,
      "owned_rss_bytes": 478412800,
      "owned_process_count": 2,
      "reclaimable_bytes": 23269523456,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 91.571876916,
      "owned_rss_bytes": 478445568,
      "owned_process_count": 2,
      "reclaimable_bytes": 23263281152,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 91.815282291,
      "owned_rss_bytes": 478445568,
      "owned_process_count": 2,
      "reclaimable_bytes": 23260741632,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 92.045447208,
      "owned_rss_bytes": 478478336,
      "owned_process_count": 2,
      "reclaimable_bytes": 23286857728,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 92.27358687499999,
      "owned_rss_bytes": 478478336,
      "owned_process_count": 2,
      "reclaimable_bytes": 23275012096,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 92.509741083,
      "owned_rss_bytes": 478511104,
      "owned_process_count": 2,
      "reclaimable_bytes": 23263543296,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 92.756793083,
      "owned_rss_bytes": 478576640,
      "owned_process_count": 2,
      "reclaimable_bytes": 23273504768,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 92.994098708,
      "owned_rss_bytes": 478576640,
      "owned_process_count": 2,
      "reclaimable_bytes": 23272521728,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 93.226759125,
      "owned_rss_bytes": 478543872,
      "owned_process_count": 2,
      "reclaimable_bytes": 23253221376,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 93.45700725,
      "owned_rss_bytes": 478642176,
      "owned_process_count": 2,
      "reclaimable_bytes": 23269998592,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 93.688741583,
      "owned_rss_bytes": 745422848,
      "owned_process_count": 2,
      "reclaimable_bytes": 21970976768,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 93.918920833,
      "owned_rss_bytes": 743931904,
      "owned_process_count": 2,
      "reclaimable_bytes": 20586627072,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 94.157832708,
      "owned_rss_bytes": 745177088,
      "owned_process_count": 2,
      "reclaimable_bytes": 20603961344,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 94.39086999999999,
      "owned_rss_bytes": 745226240,
      "owned_process_count": 2,
      "reclaimable_bytes": 20616413184,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 94.622123125,
      "owned_rss_bytes": 745308160,
      "owned_process_count": 2,
      "reclaimable_bytes": 20615380992,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 94.852684583,
      "owned_rss_bytes": 745308160,
      "owned_process_count": 2,
      "reclaimable_bytes": 20609007616,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 95.089927375,
      "owned_rss_bytes": 745979904,
      "owned_process_count": 2,
      "reclaimable_bytes": 20631486464,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 95.32334937499999,
      "owned_rss_bytes": 745963520,
      "owned_process_count": 2,
      "reclaimable_bytes": 20651180032,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 95.55735433299999,
      "owned_rss_bytes": 746258432,
      "owned_process_count": 2,
      "reclaimable_bytes": 20671397888,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 95.794065125,
      "owned_rss_bytes": 746323968,
      "owned_process_count": 2,
      "reclaimable_bytes": 20697022464,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 96.037090375,
      "owned_rss_bytes": 747438080,
      "owned_process_count": 2,
      "reclaimable_bytes": 20708737024,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 96.27255075,
      "owned_rss_bytes": 748486656,
      "owned_process_count": 2,
      "reclaimable_bytes": 20706590720,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 96.506255583,
      "owned_rss_bytes": 748830720,
      "owned_process_count": 2,
      "reclaimable_bytes": 20703182848,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 96.740492833,
      "owned_rss_bytes": 790233088,
      "owned_process_count": 2,
      "reclaimable_bytes": 22274228224,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 96.978416541,
      "owned_rss_bytes": 16384000,
      "owned_process_count": 2,
      "reclaimable_bytes": 27783053312,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 97.211164458,
      "owned_rss_bytes": 16384000,
      "owned_process_count": 2,
      "reclaimable_bytes": 27780988928,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 97.459912666,
      "owned_rss_bytes": 16384000,
      "owned_process_count": 2,
      "reclaimable_bytes": 27786690560,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 97.706915208,
      "owned_rss_bytes": 16384000,
      "owned_process_count": 2,
      "reclaimable_bytes": 27784937472,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 97.950288916,
      "owned_rss_bytes": 16384000,
      "owned_process_count": 2,
      "reclaimable_bytes": 27776647168,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 98.182807791,
      "owned_rss_bytes": 16384000,
      "owned_process_count": 2,
      "reclaimable_bytes": 27773091840,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 98.428025291,
      "owned_rss_bytes": 16384000,
      "owned_process_count": 2,
      "reclaimable_bytes": 27772764160,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 98.67477233299999,
      "owned_rss_bytes": 16384000,
      "owned_process_count": 2,
      "reclaimable_bytes": 27573944320,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 98.92045691599999,
      "owned_rss_bytes": 16449536,
      "owned_process_count": 2,
      "reclaimable_bytes": 27573665792,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 99.166139291,
      "owned_rss_bytes": 16449536,
      "owned_process_count": 2,
      "reclaimable_bytes": 27577565184,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 99.411934125,
      "owned_rss_bytes": 16449536,
      "owned_process_count": 2,
      "reclaimable_bytes": 27570159616,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 99.65951825,
      "owned_rss_bytes": 16449536,
      "owned_process_count": 2,
      "reclaimable_bytes": 27735588864,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 99.90699975,
      "owned_rss_bytes": 16449536,
      "owned_process_count": 2,
      "reclaimable_bytes": 27728035840,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 100.15273675,
      "owned_rss_bytes": 16449536,
      "owned_process_count": 2,
      "reclaimable_bytes": 27719925760,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 100.398537333,
      "owned_rss_bytes": 16449536,
      "owned_process_count": 2,
      "reclaimable_bytes": 27836792832,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 100.644297208,
      "owned_rss_bytes": 16449536,
      "owned_process_count": 2,
      "reclaimable_bytes": 27835252736,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 100.892228875,
      "owned_rss_bytes": 16449536,
      "owned_process_count": 2,
      "reclaimable_bytes": 27837038592,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 101.137895375,
      "owned_rss_bytes": 16465920,
      "owned_process_count": 2,
      "reclaimable_bytes": 27805974528,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 101.38597470799999,
      "owned_rss_bytes": 16465920,
      "owned_process_count": 2,
      "reclaimable_bytes": 27806433280,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 101.63192354099999,
      "owned_rss_bytes": 16465920,
      "owned_process_count": 2,
      "reclaimable_bytes": 27802910720,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 101.8776455,
      "owned_rss_bytes": 16465920,
      "owned_process_count": 2,
      "reclaimable_bytes": 27790721024,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 102.126415166,
      "owned_rss_bytes": 16465920,
      "owned_process_count": 2,
      "reclaimable_bytes": 27789328384,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 102.375115083,
      "owned_rss_bytes": 16465920,
      "owned_process_count": 2,
      "reclaimable_bytes": 27788820480,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 102.62260254099999,
      "owned_rss_bytes": 16465920,
      "owned_process_count": 2,
      "reclaimable_bytes": 27786133504,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 102.868777916,
      "owned_rss_bytes": 16465920,
      "owned_process_count": 2,
      "reclaimable_bytes": 27788181504,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 103.11676425,
      "owned_rss_bytes": 16482304,
      "owned_process_count": 2,
      "reclaimable_bytes": 27784085504,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 103.36671529099999,
      "owned_rss_bytes": 16482304,
      "owned_process_count": 2,
      "reclaimable_bytes": 27783479296,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 103.614320833,
      "owned_rss_bytes": 16482304,
      "owned_process_count": 2,
      "reclaimable_bytes": 27782430720,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 103.861015083,
      "owned_rss_bytes": 16482304,
      "owned_process_count": 2,
      "reclaimable_bytes": 27773665280,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 104.109341625,
      "owned_rss_bytes": 16482304,
      "owned_process_count": 2,
      "reclaimable_bytes": 27786690560,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 104.359591916,
      "owned_rss_bytes": 16482304,
      "owned_process_count": 2,
      "reclaimable_bytes": 27784708096,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 104.608981333,
      "owned_rss_bytes": 16482304,
      "owned_process_count": 2,
      "reclaimable_bytes": 27772125184,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 104.855261666,
      "owned_rss_bytes": 16482304,
      "owned_process_count": 2,
      "reclaimable_bytes": 27753562112,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 105.104130208,
      "owned_rss_bytes": 16482304,
      "owned_process_count": 2,
      "reclaimable_bytes": 27748548608,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 105.35102229099999,
      "owned_rss_bytes": 16482304,
      "owned_process_count": 2,
      "reclaimable_bytes": 27748794368,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 105.598310666,
      "owned_rss_bytes": 16482304,
      "owned_process_count": 2,
      "reclaimable_bytes": 27748368384,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 105.843742791,
      "owned_rss_bytes": 16482304,
      "owned_process_count": 2,
      "reclaimable_bytes": 27744960512,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 106.08957979099999,
      "owned_rss_bytes": 16482304,
      "owned_process_count": 2,
      "reclaimable_bytes": 27745681408,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 106.336190583,
      "owned_rss_bytes": 16482304,
      "owned_process_count": 2,
      "reclaimable_bytes": 27747188736,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 106.569196458,
      "owned_rss_bytes": 16482304,
      "owned_process_count": 2,
      "reclaimable_bytes": 27743928320,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 106.8153925,
      "owned_rss_bytes": 16482304,
      "owned_process_count": 2,
      "reclaimable_bytes": 27742224384,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 107.062338541,
      "owned_rss_bytes": 16498688,
      "owned_process_count": 2,
      "reclaimable_bytes": 27744944128,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 107.309146333,
      "owned_rss_bytes": 16498688,
      "owned_process_count": 2,
      "reclaimable_bytes": 27736522752,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 107.557485916,
      "owned_rss_bytes": 16498688,
      "owned_process_count": 2,
      "reclaimable_bytes": 27740815360,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 107.804606625,
      "owned_rss_bytes": 16498688,
      "owned_process_count": 2,
      "reclaimable_bytes": 27734523904,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 108.046126208,
      "owned_rss_bytes": 16498688,
      "owned_process_count": 2,
      "reclaimable_bytes": 27721498624,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 108.292096833,
      "owned_rss_bytes": 16498688,
      "owned_process_count": 2,
      "reclaimable_bytes": 27725201408,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 108.538366375,
      "owned_rss_bytes": 16498688,
      "owned_process_count": 2,
      "reclaimable_bytes": 27719942144,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 108.780080625,
      "owned_rss_bytes": 16498688,
      "owned_process_count": 2,
      "reclaimable_bytes": 27729625088,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 109.02479825,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27720318976,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 109.267073541,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27724136448,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 109.513982,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27721908224,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 109.761687125,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27726430208,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 110.00259479099999,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27696332800,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 110.249438,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27697528832,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 110.495608208,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27694710784,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 110.74619945799999,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27687862272,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 110.993191791,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27688878080,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 111.243086041,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27685371904,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 111.489984458,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27688878080,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 111.735780291,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27688878080,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 111.98292587499999,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27687452672,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 112.22928925,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27690303488,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 112.47624975,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27690500096,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 112.723663375,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27688091648,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 112.971390833,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27686387712,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 113.217091458,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27689746432,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 113.4633155,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27679506432,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 113.70671066599999,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27660615680,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 113.954973833,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27660648448,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 114.202001958,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27659386880,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 114.447881166,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27655323648,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 114.695271041,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27654537216,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 114.943225916,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27660894208,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 115.18931158299999,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27653423104,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 115.436569041,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27657584640,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 115.683431833,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27647934464,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 115.929920458,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27650506752,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 116.177344041,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27650342912,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 116.41581675,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27654373376,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 116.662701458,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27651424256,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 116.909812666,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27625717760,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 117.154104833,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27619311616,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 117.401073666,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27621900288,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 117.647287625,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27618099200,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 117.895539,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27622195200,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 118.142992291,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27624128512,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 118.39069854099999,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27620671488,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 118.636379333,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27626012672,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 118.883295416,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27622490112,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 119.130360708,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27616215040,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 119.375496125,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27576221696,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 119.621487458,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27580760064,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 119.870503375,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27575386112,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 120.11981125,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27578155008,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 120.366369791,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27567194112,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 120.603909541,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27576139776,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 120.836534041,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27570749440,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 121.083873875,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27574976512,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 121.33206824999999,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27571519488,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 121.57917524999999,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27559510016,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 121.826139125,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27544403968,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 122.073764583,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27462369280,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 122.31981154099999,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27460157440,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 122.5677765,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27469266944,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 122.814441208,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27461304320,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 123.064160333,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27469316096,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 123.313737708,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27467612160,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 123.560855375,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27465007104,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 123.807097833,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27272232960,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 124.056239916,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27286290432,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 124.303858666,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27286667264,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 124.549536,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27277262848,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 124.797238166,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27279982592,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 125.04455525,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27438563328,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 125.292613416,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27451195392,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 125.539007166,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27450572800,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 125.784304375,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27446804480,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 126.034760416,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27443052544,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 126.273596541,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27427782656,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 126.520579708,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27428110336,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 126.76771725,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27430944768,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 127.01521858299999,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27425832960,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 127.263371083,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27421605888,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 127.510675625,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27424096256,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 127.757371541,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27429404672,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 128.006079416,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27413544960,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 128.25215275000002,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27412021248,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 128.500029541,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27415183360,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 128.745223291,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27225014272,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 128.99112391600002,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27212480512,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 129.239004666,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27217887232,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 129.486496791,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27216969728,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 129.734529541,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27222048768,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 129.98073566600002,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27378450432,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 130.23034545800002,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27384856576,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 130.47920325,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27252604928,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 130.716995333,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27053080576,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 130.96393991600002,
      "owned_rss_bytes": 16515072,
      "owned_process_count": 2,
      "reclaimable_bytes": 27045658624,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 131.210769333,
      "owned_rss_bytes": 17301504,
      "owned_process_count": 3,
      "reclaimable_bytes": 27053932544,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 131.451004583,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27050754048,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 131.697571833,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27217739776,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 131.943564291,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27213185024,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 132.189366333,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27209596928,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 132.43743075,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27229831168,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 132.68477570800002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27226931200,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 132.93094075000002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27227209728,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 133.17599512500001,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27227373568,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 133.4241555,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27224047616,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 133.67292320800001,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27226193920,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 133.91849512500002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27224981504,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 134.164683708,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27232862208,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 134.41286812500002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27234549760,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 134.66094425,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27228454912,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 134.907148166,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27232206848,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 135.15335175,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27225243648,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 135.40281879100002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27237072896,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 135.64066004100002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27238465536,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 135.886041083,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27199209472,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 136.12911591600002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27195998208,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 136.37619683300002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27192000512,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 136.624121833,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27192541184,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 136.87244866600003,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27215642624,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 137.120449833,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27216904192,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 137.36008187500002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27221639168,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 137.61019512500002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27225964544,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 137.86085466600002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27231502336,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 138.107130041,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27228717056,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 138.351298208,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27075379200,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 138.58046975000002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27077853184,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 138.823312541,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27076214784,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 139.069873,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27067940864,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 139.311228125,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 26890289152,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 139.556710083,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 26911277056,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 139.80501345800002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 26904526848,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 140.05139608300001,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 26905804800,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 140.29978995800002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 26904838144,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 140.54784675000002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27080130560,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 140.79349695800002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27072086016,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 141.03977533300002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27082997760,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 141.28137816600002,
      "owned_rss_bytes": 18038784,
      "owned_process_count": 3,
      "reclaimable_bytes": 27081015296,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 141.529521625,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27195375616,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 141.77807804100001,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27190018048,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 142.026536125,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27203141632,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 142.273851541,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27192524800,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 142.52437429100002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27199963136,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 142.773631916,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27202355200,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 143.02141475000002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27199602688,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 143.267948208,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27196981248,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 143.517976666,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27200405504,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 143.76678725000002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27193098240,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 144.013190041,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27191754752,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 144.26005237500001,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27197128704,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 144.50857358300001,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27194277888,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 144.75729037500003,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27196375040,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 145.003034958,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27191164928,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 145.250193458,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27194818560,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 145.496882833,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27193393152,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 145.74819233300002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27214430208,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 145.99710445800002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27217002496,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 146.244508125,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27211235328,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 146.493339041,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27215478784,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 146.739193833,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27219279872,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 146.988483583,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27214610432,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 147.23768220800002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27214807040,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 147.48625475,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27213758464,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 147.7341015,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27219116032,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 147.98025479100002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27212382208,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 148.229936333,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27215626240,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 148.47726075,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27211923456,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 148.72528466600002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27209809920,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 148.97152333300002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27208826880,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 149.22078820800002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27209728000,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 149.469012625,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27209007104,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 149.711680833,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27206598656,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 149.957967666,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27207155712,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 150.197666833,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27213774848,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 150.4461555,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27213578240,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 150.69257312500002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27212021760,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 150.932196416,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27211972608,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 151.178780708,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27214462976,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 151.426914583,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27209646080,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 151.673882375,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27214856192,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 151.921658833,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27236679680,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 152.16821454100003,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27235958784,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 152.41471008300002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27235303424,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 152.66214945800002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27237253120,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 152.90975170800002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27235696640,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 153.15714341600003,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27242135552,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 153.40388562500002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27239104512,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 153.6495375,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27238612992,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 153.89812400000002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27238219776,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 154.14411916600002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27233239040,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 154.392423791,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27230961664,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 154.639920041,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27225899008,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 154.8892175,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27226341376,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 155.135966208,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27222065152,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 155.38438275000001,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27226800128,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 155.63047625000002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27221442560,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 155.87868350000002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27220426752,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 156.125109541,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27224260608,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 156.37332766600002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27219017728,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 156.621522125,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27224866816,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 156.870228375,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27218460672,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 157.12823104100002,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27222573056,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 157.37745070800003,
      "owned_rss_bytes": 16531456,
      "owned_process_count": 2,
      "reclaimable_bytes": 27216560128,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 157.62474350000002,
      "owned_rss_bytes": 142868480,
      "owned_process_count": 2,
      "reclaimable_bytes": 26989740032,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 157.86540108300002,
      "owned_rss_bytes": 142868480,
      "owned_process_count": 2,
      "reclaimable_bytes": 26976157696,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 158.098977625,
      "owned_rss_bytes": 142868480,
      "owned_process_count": 2,
      "reclaimable_bytes": 27431960576,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 158.427392416,
      "owned_rss_bytes": 142868480,
      "owned_process_count": 2,
      "reclaimable_bytes": 27474247680,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 158.67032533300002,
      "owned_rss_bytes": 140820480,
      "owned_process_count": 2,
      "reclaimable_bytes": 27534983168,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 158.90659191600002,
      "owned_rss_bytes": 140820480,
      "owned_process_count": 2,
      "reclaimable_bytes": 27566718976,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 159.13841570800003,
      "owned_rss_bytes": 140820480,
      "owned_process_count": 2,
      "reclaimable_bytes": 27558576128,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 159.374253208,
      "owned_rss_bytes": 140820480,
      "owned_process_count": 2,
      "reclaimable_bytes": 27374469120,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 159.61004904100002,
      "owned_rss_bytes": 140820480,
      "owned_process_count": 2,
      "reclaimable_bytes": 27365097472,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 159.84787795800003,
      "owned_rss_bytes": 140820480,
      "owned_process_count": 2,
      "reclaimable_bytes": 27371913216,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 160.08859387500002,
      "owned_rss_bytes": 140820480,
      "owned_process_count": 2,
      "reclaimable_bytes": 27413823488,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 160.327890625,
      "owned_rss_bytes": 140820480,
      "owned_process_count": 2,
      "reclaimable_bytes": 27452030976,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 160.56008845800002,
      "owned_rss_bytes": 140820480,
      "owned_process_count": 2,
      "reclaimable_bytes": 27623047168,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 160.801233375,
      "owned_rss_bytes": 140820480,
      "owned_process_count": 2,
      "reclaimable_bytes": 27749761024,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 161.03242145800002,
      "owned_rss_bytes": 140820480,
      "owned_process_count": 2,
      "reclaimable_bytes": 27748089856,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 161.263664833,
      "owned_rss_bytes": 140820480,
      "owned_process_count": 2,
      "reclaimable_bytes": 27755429888,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 161.50360145800002,
      "owned_rss_bytes": 140820480,
      "owned_process_count": 2,
      "reclaimable_bytes": 27775287296,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 161.737270208,
      "owned_rss_bytes": 140820480,
      "owned_process_count": 2,
      "reclaimable_bytes": 27805679616,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 161.97799429100002,
      "owned_rss_bytes": 140820480,
      "owned_process_count": 2,
      "reclaimable_bytes": 27768225792,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 162.21017300000003,
      "owned_rss_bytes": 140820480,
      "owned_process_count": 2,
      "reclaimable_bytes": 27769978880,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 162.441903958,
      "owned_rss_bytes": 140820480,
      "owned_process_count": 2,
      "reclaimable_bytes": 27691384832,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 162.672506916,
      "owned_rss_bytes": 140656640,
      "owned_process_count": 2,
      "reclaimable_bytes": 27694235648,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 162.91093983300001,
      "owned_rss_bytes": 140656640,
      "owned_process_count": 2,
      "reclaimable_bytes": 27691548672,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 163.196257333,
      "owned_rss_bytes": 140656640,
      "owned_process_count": 2,
      "reclaimable_bytes": 27695104000,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 163.449083875,
      "owned_rss_bytes": 140656640,
      "owned_process_count": 2,
      "reclaimable_bytes": 27682570240,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 163.679837291,
      "owned_rss_bytes": 140656640,
      "owned_process_count": 2,
      "reclaimable_bytes": 27685928960,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 163.915557916,
      "owned_rss_bytes": 140656640,
      "owned_process_count": 2,
      "reclaimable_bytes": 27440365568,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 164.151401291,
      "owned_rss_bytes": 140623872,
      "owned_process_count": 2,
      "reclaimable_bytes": 27407187968,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 164.393365291,
      "owned_rss_bytes": 140623872,
      "owned_process_count": 2,
      "reclaimable_bytes": 27394490368,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 164.62790554100002,
      "owned_rss_bytes": 141869056,
      "owned_process_count": 2,
      "reclaimable_bytes": 27515011072,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 164.86405537500002,
      "owned_rss_bytes": 148045824,
      "owned_process_count": 2,
      "reclaimable_bytes": 27500593152,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 165.08545500000002,
      "owned_rss_bytes": 1695531008,
      "owned_process_count": 2,
      "reclaimable_bytes": 25757073408,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 165.31590408300002,
      "owned_rss_bytes": 3299786752,
      "owned_process_count": 2,
      "reclaimable_bytes": 21118992384,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 165.55020725,
      "owned_rss_bytes": 4302798848,
      "owned_process_count": 2,
      "reclaimable_bytes": 20426899456,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 165.77987770800001,
      "owned_rss_bytes": 4368334848,
      "owned_process_count": 2,
      "reclaimable_bytes": 20357627904,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 166.00047429100002,
      "owned_rss_bytes": 4679680000,
      "owned_process_count": 2,
      "reclaimable_bytes": 19994263552,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 166.22932508300002,
      "owned_rss_bytes": 4732223488,
      "owned_process_count": 2,
      "reclaimable_bytes": 19907592192,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 166.454104583,
      "owned_rss_bytes": 4741595136,
      "owned_process_count": 2,
      "reclaimable_bytes": 19873562624,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 166.682286416,
      "owned_rss_bytes": 4767612928,
      "owned_process_count": 2,
      "reclaimable_bytes": 19821117440,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 166.915445,
      "owned_rss_bytes": 4768579584,
      "owned_process_count": 2,
      "reclaimable_bytes": 19774603264,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 167.14220200000003,
      "owned_rss_bytes": 4770201600,
      "owned_process_count": 2,
      "reclaimable_bytes": 19733823488,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 167.377037,
      "owned_rss_bytes": 4771119104,
      "owned_process_count": 2,
      "reclaimable_bytes": 19704365056,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 167.60118862500002,
      "owned_rss_bytes": 4771577856,
      "owned_process_count": 2,
      "reclaimable_bytes": 19545620480,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 167.831750916,
      "owned_rss_bytes": 4771889152,
      "owned_process_count": 2,
      "reclaimable_bytes": 19442106368,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 168.058343333,
      "owned_rss_bytes": 4772200448,
      "owned_process_count": 2,
      "reclaimable_bytes": 19324764160,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 168.28270270800002,
      "owned_rss_bytes": 4772413440,
      "owned_process_count": 2,
      "reclaimable_bytes": 19319619584,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 168.51404645800002,
      "owned_rss_bytes": 4772642816,
      "owned_process_count": 2,
      "reclaimable_bytes": 19318734848,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 168.74489775,
      "owned_rss_bytes": 4772806656,
      "owned_process_count": 2,
      "reclaimable_bytes": 19321733120,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 168.972948416,
      "owned_rss_bytes": 4773019648,
      "owned_process_count": 2,
      "reclaimable_bytes": 19311132672,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 169.205840208,
      "owned_rss_bytes": 4773134336,
      "owned_process_count": 2,
      "reclaimable_bytes": 19310936064,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 169.43516770800002,
      "owned_rss_bytes": 4773281792,
      "owned_process_count": 2,
      "reclaimable_bytes": 19321372672,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 169.661447333,
      "owned_rss_bytes": 4773560320,
      "owned_process_count": 2,
      "reclaimable_bytes": 19317030912,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 169.887713208,
      "owned_rss_bytes": 4773789696,
      "owned_process_count": 2,
      "reclaimable_bytes": 19318898688,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 170.120704041,
      "owned_rss_bytes": 4773904384,
      "owned_process_count": 2,
      "reclaimable_bytes": 19303858176,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 170.34991537500002,
      "owned_rss_bytes": 4774019072,
      "owned_process_count": 2,
      "reclaimable_bytes": 19318489088,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 170.576238041,
      "owned_rss_bytes": 4774215680,
      "owned_process_count": 2,
      "reclaimable_bytes": 19315507200,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 170.806787291,
      "owned_rss_bytes": 4774461440,
      "owned_process_count": 2,
      "reclaimable_bytes": 19313901568,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 171.035091625,
      "owned_rss_bytes": 4774658048,
      "owned_process_count": 2,
      "reclaimable_bytes": 19249217536,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 171.261709333,
      "owned_rss_bytes": 4774887424,
      "owned_process_count": 2,
      "reclaimable_bytes": 19246956544,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 171.488022375,
      "owned_rss_bytes": 4774936576,
      "owned_process_count": 2,
      "reclaimable_bytes": 19240173568,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 171.716547208,
      "owned_rss_bytes": 4775133184,
      "owned_process_count": 2,
      "reclaimable_bytes": 19238371328,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 171.94992337500003,
      "owned_rss_bytes": 4775346176,
      "owned_process_count": 2,
      "reclaimable_bytes": 19239567360,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 172.182749,
      "owned_rss_bytes": 4775526400,
      "owned_process_count": 2,
      "reclaimable_bytes": 19235831808,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 172.412186375,
      "owned_rss_bytes": 4775657472,
      "owned_process_count": 2,
      "reclaimable_bytes": 19234488320,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 172.63548937500002,
      "owned_rss_bytes": 4775821312,
      "owned_process_count": 2,
      "reclaimable_bytes": 19239305216,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 172.859880583,
      "owned_rss_bytes": 4775952384,
      "owned_process_count": 2,
      "reclaimable_bytes": 19235028992,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 173.093056208,
      "owned_rss_bytes": 4776181760,
      "owned_process_count": 2,
      "reclaimable_bytes": 19257245696,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 173.325976166,
      "owned_rss_bytes": 4776296448,
      "owned_process_count": 2,
      "reclaimable_bytes": 19251331072,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 173.55083604100003,
      "owned_rss_bytes": 4776427520,
      "owned_process_count": 2,
      "reclaimable_bytes": 19257966592,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 173.782280458,
      "owned_rss_bytes": 4776443904,
      "owned_process_count": 2,
      "reclaimable_bytes": 19265257472,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 174.009744958,
      "owned_rss_bytes": 4776460288,
      "owned_process_count": 2,
      "reclaimable_bytes": 19344687104,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 174.244497916,
      "owned_rss_bytes": 4776476672,
      "owned_process_count": 2,
      "reclaimable_bytes": 19343097856,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 174.470710875,
      "owned_rss_bytes": 4776624128,
      "owned_process_count": 2,
      "reclaimable_bytes": 19253149696,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 174.69575787500003,
      "owned_rss_bytes": 4776706048,
      "owned_process_count": 2,
      "reclaimable_bytes": 19252658176,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 174.927146291,
      "owned_rss_bytes": 4776787968,
      "owned_process_count": 2,
      "reclaimable_bytes": 19250675712,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 175.160186291,
      "owned_rss_bytes": 4776869888,
      "owned_process_count": 2,
      "reclaimable_bytes": 18894684160,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 175.417856166,
      "owned_rss_bytes": 4776919040,
      "owned_process_count": 2,
      "reclaimable_bytes": 18410962944,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 175.64408737500003,
      "owned_rss_bytes": 4776951808,
      "owned_process_count": 2,
      "reclaimable_bytes": 18147344384,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 175.87247870800002,
      "owned_rss_bytes": 4776968192,
      "owned_process_count": 2,
      "reclaimable_bytes": 18067898368,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 176.096630583,
      "owned_rss_bytes": 4777000960,
      "owned_process_count": 2,
      "reclaimable_bytes": 18063081472,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 176.32993287500003,
      "owned_rss_bytes": 4777050112,
      "owned_process_count": 2,
      "reclaimable_bytes": 18063065088,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 176.56097350000002,
      "owned_rss_bytes": 4777066496,
      "owned_process_count": 2,
      "reclaimable_bytes": 18068193280,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 176.791537583,
      "owned_rss_bytes": 4777082880,
      "owned_process_count": 2,
      "reclaimable_bytes": 18062295040,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 177.018360583,
      "owned_rss_bytes": 4777115648,
      "owned_process_count": 2,
      "reclaimable_bytes": 18064818176,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 177.251769083,
      "owned_rss_bytes": 4777181184,
      "owned_process_count": 2,
      "reclaimable_bytes": 18053496832,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 177.476581041,
      "owned_rss_bytes": 4777213952,
      "owned_process_count": 2,
      "reclaimable_bytes": 18048172032,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 177.704096416,
      "owned_rss_bytes": 4777246720,
      "owned_process_count": 2,
      "reclaimable_bytes": 17940955136,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 177.92981025,
      "owned_rss_bytes": 4777279488,
      "owned_process_count": 2,
      "reclaimable_bytes": 17938808832,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 178.15662833300001,
      "owned_rss_bytes": 4777295872,
      "owned_process_count": 2,
      "reclaimable_bytes": 17940054016,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 178.38917658300002,
      "owned_rss_bytes": 4777312256,
      "owned_process_count": 2,
      "reclaimable_bytes": 17925242880,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 178.621675833,
      "owned_rss_bytes": 4777361408,
      "owned_process_count": 2,
      "reclaimable_bytes": 17932582912,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 178.848165666,
      "owned_rss_bytes": 4777394176,
      "owned_process_count": 2,
      "reclaimable_bytes": 17933254656,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 179.073814125,
      "owned_rss_bytes": 4777426944,
      "owned_process_count": 2,
      "reclaimable_bytes": 17929404416,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 179.30079479100002,
      "owned_rss_bytes": 4777459712,
      "owned_process_count": 2,
      "reclaimable_bytes": 18004459520,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 179.53015387500002,
      "owned_rss_bytes": 4777459712,
      "owned_process_count": 2,
      "reclaimable_bytes": 18015649792,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 179.754586958,
      "owned_rss_bytes": 4777492480,
      "owned_process_count": 2,
      "reclaimable_bytes": 18030100480,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 179.97899966600002,
      "owned_rss_bytes": 4777525248,
      "owned_process_count": 2,
      "reclaimable_bytes": 18019696640,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 180.20299633300002,
      "owned_rss_bytes": 4777558016,
      "owned_process_count": 2,
      "reclaimable_bytes": 17934008320,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 180.432123708,
      "owned_rss_bytes": 4777590784,
      "owned_process_count": 2,
      "reclaimable_bytes": 17935007744,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 180.656262333,
      "owned_rss_bytes": 4777639936,
      "owned_process_count": 2,
      "reclaimable_bytes": 17932550144,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 180.88360416600003,
      "owned_rss_bytes": 4777656320,
      "owned_process_count": 2,
      "reclaimable_bytes": 17927569408,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 181.107710166,
      "owned_rss_bytes": 4777689088,
      "owned_process_count": 2,
      "reclaimable_bytes": 17935990784,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 181.34244262500002,
      "owned_rss_bytes": 4777705472,
      "owned_process_count": 2,
      "reclaimable_bytes": 18012618752,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 181.576623208,
      "owned_rss_bytes": 4777738240,
      "owned_process_count": 2,
      "reclaimable_bytes": 18010783744,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 181.81106591600002,
      "owned_rss_bytes": 4777738240,
      "owned_process_count": 2,
      "reclaimable_bytes": 18016403456,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 182.040832166,
      "owned_rss_bytes": 4777754624,
      "owned_process_count": 2,
      "reclaimable_bytes": 18004279296,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 182.27597175000002,
      "owned_rss_bytes": 4777836544,
      "owned_process_count": 2,
      "reclaimable_bytes": 18004951040,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 182.503090458,
      "owned_rss_bytes": 4777902080,
      "owned_process_count": 2,
      "reclaimable_bytes": 17926520832,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 182.729483708,
      "owned_rss_bytes": 4777951232,
      "owned_process_count": 2,
      "reclaimable_bytes": 17923489792,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 182.95865304100002,
      "owned_rss_bytes": 4778016768,
      "owned_process_count": 2,
      "reclaimable_bytes": 17915740160,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 183.19130033300002,
      "owned_rss_bytes": 4778115072,
      "owned_process_count": 2,
      "reclaimable_bytes": 17910988800,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 183.416274875,
      "owned_rss_bytes": 4778213376,
      "owned_process_count": 2,
      "reclaimable_bytes": 17911545856,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 183.64258016600002,
      "owned_rss_bytes": 4778344448,
      "owned_process_count": 2,
      "reclaimable_bytes": 17993924608,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 183.86592420800002,
      "owned_rss_bytes": 4778459136,
      "owned_process_count": 2,
      "reclaimable_bytes": 17983913984,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 184.09077033300002,
      "owned_rss_bytes": 4778508288,
      "owned_process_count": 2,
      "reclaimable_bytes": 17974525952,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 184.31650875000003,
      "owned_rss_bytes": 4778655744,
      "owned_process_count": 2,
      "reclaimable_bytes": 17972527104,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 184.54200666600002,
      "owned_rss_bytes": 4778704896,
      "owned_process_count": 2,
      "reclaimable_bytes": 17985159168,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 184.770749625,
      "owned_rss_bytes": 4778786816,
      "owned_process_count": 2,
      "reclaimable_bytes": 17907351552,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 184.99678012500002,
      "owned_rss_bytes": 4778868736,
      "owned_process_count": 2,
      "reclaimable_bytes": 17901912064,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 185.22477320800002,
      "owned_rss_bytes": 4778983424,
      "owned_process_count": 2,
      "reclaimable_bytes": 17894752256,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 185.457605166,
      "owned_rss_bytes": 4779114496,
      "owned_process_count": 2,
      "reclaimable_bytes": 17885675520,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 185.686776,
      "owned_rss_bytes": 4779163648,
      "owned_process_count": 2,
      "reclaimable_bytes": 17888591872,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 185.91252375000002,
      "owned_rss_bytes": 4779212800,
      "owned_process_count": 2,
      "reclaimable_bytes": 17965580288,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 186.13627183300002,
      "owned_rss_bytes": 4779278336,
      "owned_process_count": 2,
      "reclaimable_bytes": 17961107456,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 186.360304708,
      "owned_rss_bytes": 4779376640,
      "owned_process_count": 2,
      "reclaimable_bytes": 17959206912,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 186.58628287500002,
      "owned_rss_bytes": 4779507712,
      "owned_process_count": 2,
      "reclaimable_bytes": 17976262656,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 186.81438566600002,
      "owned_rss_bytes": 4779769856,
      "owned_process_count": 2,
      "reclaimable_bytes": 17973133312,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 187.040241583,
      "owned_rss_bytes": 4780015616,
      "owned_process_count": 2,
      "reclaimable_bytes": 17884430336,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 187.26561087500002,
      "owned_rss_bytes": 4780130304,
      "owned_process_count": 2,
      "reclaimable_bytes": 17877008384,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 187.49358825000002,
      "owned_rss_bytes": 4780376064,
      "owned_process_count": 2,
      "reclaimable_bytes": 17871978496,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 187.71809570800002,
      "owned_rss_bytes": 4780556288,
      "owned_process_count": 2,
      "reclaimable_bytes": 17874436096,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 187.95120662500003,
      "owned_rss_bytes": 4780769280,
      "owned_process_count": 2,
      "reclaimable_bytes": 17884839936,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 188.17720425000002,
      "owned_rss_bytes": 4780933120,
      "owned_process_count": 2,
      "reclaimable_bytes": 17952243712,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 188.40179145800002,
      "owned_rss_bytes": 4781195264,
      "owned_process_count": 2,
      "reclaimable_bytes": 17969938432,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 188.62602337500002,
      "owned_rss_bytes": 4781359104,
      "owned_process_count": 2,
      "reclaimable_bytes": 17966399488,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 188.85060941600003,
      "owned_rss_bytes": 4781572096,
      "owned_process_count": 2,
      "reclaimable_bytes": 17965858816,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 189.076403375,
      "owned_rss_bytes": 4781883392,
      "owned_process_count": 2,
      "reclaimable_bytes": 17864687616,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 189.30241429100002,
      "owned_rss_bytes": 4951556096,
      "owned_process_count": 2,
      "reclaimable_bytes": 17660887040,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 189.537679958,
      "owned_rss_bytes": 4961599488,
      "owned_process_count": 2,
      "reclaimable_bytes": 17450909696,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 189.764457666,
      "owned_rss_bytes": 4961878016,
      "owned_process_count": 2,
      "reclaimable_bytes": 17448878080,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 190.000323541,
      "owned_rss_bytes": 4962074624,
      "owned_process_count": 2,
      "reclaimable_bytes": 17453580288,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 190.236323375,
      "owned_rss_bytes": 4962107392,
      "owned_process_count": 2,
      "reclaimable_bytes": 17524686848,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 190.464429458,
      "owned_rss_bytes": 4962123776,
      "owned_process_count": 2,
      "reclaimable_bytes": 17530159104,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 190.70164275000002,
      "owned_rss_bytes": 4962140160,
      "owned_process_count": 2,
      "reclaimable_bytes": 17672699904,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 190.930986708,
      "owned_rss_bytes": 4962238464,
      "owned_process_count": 2,
      "reclaimable_bytes": 17427234816,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 191.179802708,
      "owned_rss_bytes": 4982259712,
      "owned_process_count": 2,
      "reclaimable_bytes": 17155194880,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 191.41009216600003,
      "owned_rss_bytes": 4982276096,
      "owned_process_count": 2,
      "reclaimable_bytes": 17184161792,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 191.643883208,
      "owned_rss_bytes": 4982374400,
      "owned_process_count": 2,
      "reclaimable_bytes": 17181687808,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 191.869917375,
      "owned_rss_bytes": 4982407168,
      "owned_process_count": 2,
      "reclaimable_bytes": 17182081024,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 192.11722379100001,
      "owned_rss_bytes": 4982472704,
      "owned_process_count": 2,
      "reclaimable_bytes": 17229529088,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 192.344168458,
      "owned_rss_bytes": 4982521856,
      "owned_process_count": 2,
      "reclaimable_bytes": 17404592128,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 192.573764041,
      "owned_rss_bytes": 4982587392,
      "owned_process_count": 2,
      "reclaimable_bytes": 17428922368,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 192.810575375,
      "owned_rss_bytes": 4982652928,
      "owned_process_count": 2,
      "reclaimable_bytes": 17427382272,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 193.03939208300002,
      "owned_rss_bytes": 4982718464,
      "owned_process_count": 2,
      "reclaimable_bytes": 17233641472,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 193.27083525,
      "owned_rss_bytes": 4982767616,
      "owned_process_count": 2,
      "reclaimable_bytes": 17216487424,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 193.49993037500002,
      "owned_rss_bytes": 4982816768,
      "owned_process_count": 2,
      "reclaimable_bytes": 17221337088,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 193.72710395800001,
      "owned_rss_bytes": 4982865920,
      "owned_process_count": 2,
      "reclaimable_bytes": 17226842112,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 193.954093625,
      "owned_rss_bytes": 4982915072,
      "owned_process_count": 2,
      "reclaimable_bytes": 17223467008,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 194.18595216600002,
      "owned_rss_bytes": 4982964224,
      "owned_process_count": 2,
      "reclaimable_bytes": 17334829056,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 194.41709304100002,
      "owned_rss_bytes": 4982980608,
      "owned_process_count": 2,
      "reclaimable_bytes": 17418027008,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 194.64187304100003,
      "owned_rss_bytes": 4983013376,
      "owned_process_count": 2,
      "reclaimable_bytes": 17416306688,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 194.87630537500002,
      "owned_rss_bytes": 4983029760,
      "owned_process_count": 2,
      "reclaimable_bytes": 17408917504,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 195.100642625,
      "owned_rss_bytes": 4983062528,
      "owned_process_count": 2,
      "reclaimable_bytes": 17328898048,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 195.331900458,
      "owned_rss_bytes": 4983111680,
      "owned_process_count": 2,
      "reclaimable_bytes": 17318051840,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 195.565158666,
      "owned_rss_bytes": 4983144448,
      "owned_process_count": 2,
      "reclaimable_bytes": 17320968192,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 195.799525375,
      "owned_rss_bytes": 4983144448,
      "owned_process_count": 2,
      "reclaimable_bytes": 17321672704,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 196.03311083300002,
      "owned_rss_bytes": 4983193600,
      "owned_process_count": 2,
      "reclaimable_bytes": 17316151296,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 196.25714387500003,
      "owned_rss_bytes": 4983259136,
      "owned_process_count": 2,
      "reclaimable_bytes": 17338236928,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 196.48409716600003,
      "owned_rss_bytes": 4983324672,
      "owned_process_count": 2,
      "reclaimable_bytes": 17401790464,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 196.70867262500002,
      "owned_rss_bytes": 4983373824,
      "owned_process_count": 2,
      "reclaimable_bytes": 17407148032,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 196.933967458,
      "owned_rss_bytes": 4983455744,
      "owned_process_count": 2,
      "reclaimable_bytes": 17406459904,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 197.16776066600002,
      "owned_rss_bytes": 4983537664,
      "owned_process_count": 2,
      "reclaimable_bytes": 17325490176,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 197.401149,
      "owned_rss_bytes": 4983586816,
      "owned_process_count": 2,
      "reclaimable_bytes": 17323524096,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 197.63379204100002,
      "owned_rss_bytes": 4988059648,
      "owned_process_count": 2,
      "reclaimable_bytes": 17319837696,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 197.85900425000003,
      "owned_rss_bytes": 4991238144,
      "owned_process_count": 2,
      "reclaimable_bytes": 17307860992,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 198.09359887500003,
      "owned_rss_bytes": 4991500288,
      "owned_process_count": 2,
      "reclaimable_bytes": 17316118528,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 198.323746916,
      "owned_rss_bytes": 4991516672,
      "owned_process_count": 2,
      "reclaimable_bytes": 17181868032,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 198.55461954100002,
      "owned_rss_bytes": 4991549440,
      "owned_process_count": 2,
      "reclaimable_bytes": 17274683392,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 198.784727666,
      "owned_rss_bytes": 4991909888,
      "owned_process_count": 2,
      "reclaimable_bytes": 17273536512,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 199.01493495800003,
      "owned_rss_bytes": 4991909888,
      "owned_process_count": 2,
      "reclaimable_bytes": 17258070016,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 199.242666541,
      "owned_rss_bytes": 4991926272,
      "owned_process_count": 2,
      "reclaimable_bytes": 17025351680,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 199.48279925,
      "owned_rss_bytes": 4991991808,
      "owned_process_count": 2,
      "reclaimable_bytes": 17031413760,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 199.7089525,
      "owned_rss_bytes": 4991991808,
      "owned_process_count": 2,
      "reclaimable_bytes": 17024401408,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 199.93869041600001,
      "owned_rss_bytes": 4992057344,
      "owned_process_count": 2,
      "reclaimable_bytes": 17015078912,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 200.166896041,
      "owned_rss_bytes": 4992073728,
      "owned_process_count": 2,
      "reclaimable_bytes": 17010982912,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 200.39727341600002,
      "owned_rss_bytes": 4992090112,
      "owned_process_count": 2,
      "reclaimable_bytes": 17028415488,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 200.62680625000002,
      "owned_rss_bytes": 4992122880,
      "owned_process_count": 2,
      "reclaimable_bytes": 17276223488,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 200.8530665,
      "owned_rss_bytes": 4992155648,
      "owned_process_count": 2,
      "reclaimable_bytes": 17282908160,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 201.0779565,
      "owned_rss_bytes": 4992188416,
      "owned_process_count": 2,
      "reclaimable_bytes": 17274421248,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 201.30859404100002,
      "owned_rss_bytes": 4992221184,
      "owned_process_count": 2,
      "reclaimable_bytes": 17389158400,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 201.538803583,
      "owned_rss_bytes": 4992237568,
      "owned_process_count": 2,
      "reclaimable_bytes": 17314103296,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 201.76814345800003,
      "owned_rss_bytes": 4992253952,
      "owned_process_count": 2,
      "reclaimable_bytes": 17235279872,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 202.01800516600002,
      "owned_rss_bytes": 4992286720,
      "owned_process_count": 2,
      "reclaimable_bytes": 17226022912,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 202.246953625,
      "owned_rss_bytes": 4992319488,
      "owned_process_count": 2,
      "reclaimable_bytes": 17227431936,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 202.47152200000002,
      "owned_rss_bytes": 4992352256,
      "owned_process_count": 2,
      "reclaimable_bytes": 17299619840,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 202.70074275000002,
      "owned_rss_bytes": 4992368640,
      "owned_process_count": 2,
      "reclaimable_bytes": 17306714112,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 202.93509087500001,
      "owned_rss_bytes": 4992401408,
      "owned_process_count": 2,
      "reclaimable_bytes": 17248059392,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 203.171427666,
      "owned_rss_bytes": 4992434176,
      "owned_process_count": 2,
      "reclaimable_bytes": 17249042432,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 203.399350583,
      "owned_rss_bytes": 4992450560,
      "owned_process_count": 2,
      "reclaimable_bytes": 17177214976,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 203.62630595800002,
      "owned_rss_bytes": 4992499712,
      "owned_process_count": 2,
      "reclaimable_bytes": 17175330816,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 203.854907916,
      "owned_rss_bytes": 4992516096,
      "owned_process_count": 2,
      "reclaimable_bytes": 17172398080,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 204.085233541,
      "owned_rss_bytes": 4992548864,
      "owned_process_count": 2,
      "reclaimable_bytes": 17172021248,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 204.312169541,
      "owned_rss_bytes": 4992548864,
      "owned_process_count": 2,
      "reclaimable_bytes": 17174609920,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 204.538387416,
      "owned_rss_bytes": 4992581632,
      "owned_process_count": 2,
      "reclaimable_bytes": 17173151744,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 204.765074375,
      "owned_rss_bytes": 4992614400,
      "owned_process_count": 2,
      "reclaimable_bytes": 17250205696,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 204.993473458,
      "owned_rss_bytes": 4992647168,
      "owned_process_count": 2,
      "reclaimable_bytes": 17247748096,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 205.219022375,
      "owned_rss_bytes": 4992712704,
      "owned_process_count": 2,
      "reclaimable_bytes": 17250385920,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 205.45063000000002,
      "owned_rss_bytes": 4992729088,
      "owned_process_count": 2,
      "reclaimable_bytes": 17180966912,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 205.676388083,
      "owned_rss_bytes": 4992745472,
      "owned_process_count": 2,
      "reclaimable_bytes": 17169121280,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 205.90521141600001,
      "owned_rss_bytes": 4992860160,
      "owned_process_count": 2,
      "reclaimable_bytes": 17163599872,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 206.135179875,
      "owned_rss_bytes": 4992860160,
      "owned_process_count": 2,
      "reclaimable_bytes": 17162960896,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 206.36358579100002,
      "owned_rss_bytes": 4992974848,
      "owned_process_count": 2,
      "reclaimable_bytes": 17162305536,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 206.59103825000003,
      "owned_rss_bytes": 4992991232,
      "owned_process_count": 2,
      "reclaimable_bytes": 16934076416,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 206.83271366600002,
      "owned_rss_bytes": 4993089536,
      "owned_process_count": 2,
      "reclaimable_bytes": 17001070592,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 207.071800416,
      "owned_rss_bytes": 4993105920,
      "owned_process_count": 2,
      "reclaimable_bytes": 16989814784,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 207.302776125,
      "owned_rss_bytes": 4993105920,
      "owned_process_count": 2,
      "reclaimable_bytes": 16992337920,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 207.53239116600002,
      "owned_rss_bytes": 4993122304,
      "owned_process_count": 2,
      "reclaimable_bytes": 17010606080,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 207.76193575000002,
      "owned_rss_bytes": 4993171456,
      "owned_process_count": 2,
      "reclaimable_bytes": 17088544768,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 207.98701000000003,
      "owned_rss_bytes": 4993204224,
      "owned_process_count": 2,
      "reclaimable_bytes": 17081958400,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 208.21614250000002,
      "owned_rss_bytes": 4993236992,
      "owned_process_count": 2,
      "reclaimable_bytes": 17093722112,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 208.44947158300002,
      "owned_rss_bytes": 4993335296,
      "owned_process_count": 2,
      "reclaimable_bytes": 17114005504,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 208.68215162500002,
      "owned_rss_bytes": 4993400832,
      "owned_process_count": 2,
      "reclaimable_bytes": 17111269376,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 208.9080805,
      "owned_rss_bytes": 4993449984,
      "owned_process_count": 2,
      "reclaimable_bytes": 17179426816,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 209.13454337500002,
      "owned_rss_bytes": 4993531904,
      "owned_process_count": 2,
      "reclaimable_bytes": 17185226752,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 209.364478291,
      "owned_rss_bytes": 4993613824,
      "owned_process_count": 2,
      "reclaimable_bytes": 17180016640,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 209.59205737500002,
      "owned_rss_bytes": 4993695744,
      "owned_process_count": 2,
      "reclaimable_bytes": 17200742400,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 209.82128054100002,
      "owned_rss_bytes": 4993777664,
      "owned_process_count": 2,
      "reclaimable_bytes": 17112580096,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 210.054910166,
      "owned_rss_bytes": 4993859584,
      "owned_process_count": 2,
      "reclaimable_bytes": 17110597632,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 210.28389387500002,
      "owned_rss_bytes": 4993908736,
      "owned_process_count": 2,
      "reclaimable_bytes": 17107140608,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 210.517132916,
      "owned_rss_bytes": 4993957888,
      "owned_process_count": 2,
      "reclaimable_bytes": 17110712320,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 210.75215954100003,
      "owned_rss_bytes": 4994023424,
      "owned_process_count": 2,
      "reclaimable_bytes": 17181376512,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 210.97931250000002,
      "owned_rss_bytes": 4994105344,
      "owned_process_count": 2,
      "reclaimable_bytes": 17186521088,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 211.20815875000002,
      "owned_rss_bytes": 4994170880,
      "owned_process_count": 2,
      "reclaimable_bytes": 17195171840,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 211.43792712500002,
      "owned_rss_bytes": 4994252800,
      "owned_process_count": 2,
      "reclaimable_bytes": 16993828864,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 211.66189120800001,
      "owned_rss_bytes": 4994318336,
      "owned_process_count": 2,
      "reclaimable_bytes": 16916037632,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 211.89007504100002,
      "owned_rss_bytes": 4994383872,
      "owned_process_count": 2,
      "reclaimable_bytes": 16889315328,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 212.11812775,
      "owned_rss_bytes": 4994433024,
      "owned_process_count": 2,
      "reclaimable_bytes": 16885989376,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 212.34305429100002,
      "owned_rss_bytes": 4994531328,
      "owned_process_count": 2,
      "reclaimable_bytes": 16885628928,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 212.574201041,
      "owned_rss_bytes": 4994580480,
      "owned_process_count": 2,
      "reclaimable_bytes": 17068015616,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 212.80003437500002,
      "owned_rss_bytes": 4994629632,
      "owned_process_count": 2,
      "reclaimable_bytes": 17150525440,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 213.029092125,
      "owned_rss_bytes": 4994711552,
      "owned_process_count": 2,
      "reclaimable_bytes": 17141432320,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 213.264048583,
      "owned_rss_bytes": 4994777088,
      "owned_process_count": 2,
      "reclaimable_bytes": 17146068992,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 213.49442108300002,
      "owned_rss_bytes": 4994842624,
      "owned_process_count": 2,
      "reclaimable_bytes": 17145217024,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 213.71959841600003,
      "owned_rss_bytes": 4994908160,
      "owned_process_count": 2,
      "reclaimable_bytes": 17069735936,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 213.94631525000003,
      "owned_rss_bytes": 4994957312,
      "owned_process_count": 2,
      "reclaimable_bytes": 17075798016,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 214.170597125,
      "owned_rss_bytes": 4995039232,
      "owned_process_count": 2,
      "reclaimable_bytes": 17069670400,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 214.398249291,
      "owned_rss_bytes": 4995137536,
      "owned_process_count": 2,
      "reclaimable_bytes": 17050714112,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 214.624366041,
      "owned_rss_bytes": 4995203072,
      "owned_process_count": 2,
      "reclaimable_bytes": 17018142720,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 214.853949416,
      "owned_rss_bytes": 4995858432,
      "owned_process_count": 2,
      "reclaimable_bytes": 17023959040,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 215.087264083,
      "owned_rss_bytes": 4995858432,
      "owned_process_count": 2,
      "reclaimable_bytes": 17091772416,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 215.31640604100002,
      "owned_rss_bytes": 4995858432,
      "owned_process_count": 2,
      "reclaimable_bytes": 17086709760,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 215.54950562500002,
      "owned_rss_bytes": 4995874816,
      "owned_process_count": 2,
      "reclaimable_bytes": 17095835648,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 215.77410275000003,
      "owned_rss_bytes": 4995891200,
      "owned_process_count": 2,
      "reclaimable_bytes": 17020911616,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 216.00269012500002,
      "owned_rss_bytes": 4995907584,
      "owned_process_count": 2,
      "reclaimable_bytes": 17014161408,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 216.23885475,
      "owned_rss_bytes": 4995923968,
      "owned_process_count": 2,
      "reclaimable_bytes": 17003085824,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 216.464239875,
      "owned_rss_bytes": 4995956736,
      "owned_process_count": 2,
      "reclaimable_bytes": 17001873408,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 216.69470375,
      "owned_rss_bytes": 4996022272,
      "owned_process_count": 2,
      "reclaimable_bytes": 16992944128,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 216.918995458,
      "owned_rss_bytes": 4996071424,
      "owned_process_count": 2,
      "reclaimable_bytes": 17012146176,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 217.151781666,
      "owned_rss_bytes": 4996104192,
      "owned_process_count": 2,
      "reclaimable_bytes": 17078239232,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 217.37801375,
      "owned_rss_bytes": 4996153344,
      "owned_process_count": 2,
      "reclaimable_bytes": 17067540480,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 217.608349333,
      "owned_rss_bytes": 4996218880,
      "owned_process_count": 2,
      "reclaimable_bytes": 17084628992,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 217.83725395800002,
      "owned_rss_bytes": 4996235264,
      "owned_process_count": 2,
      "reclaimable_bytes": 17010704384,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 218.06578745800002,
      "owned_rss_bytes": 4996333568,
      "owned_process_count": 2,
      "reclaimable_bytes": 17005182976,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 218.29332487500002,
      "owned_rss_bytes": 4996333568,
      "owned_process_count": 2,
      "reclaimable_bytes": 16992468992,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 218.527386083,
      "owned_rss_bytes": 4996382720,
      "owned_process_count": 2,
      "reclaimable_bytes": 16979378176,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 218.757611583,
      "owned_rss_bytes": 4996415488,
      "owned_process_count": 2,
      "reclaimable_bytes": 16986537984,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 218.98813629100002,
      "owned_rss_bytes": 4996448256,
      "owned_process_count": 2,
      "reclaimable_bytes": 16986718208,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 219.213617,
      "owned_rss_bytes": 4996497408,
      "owned_process_count": 2,
      "reclaimable_bytes": 17057808384,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 219.443252583,
      "owned_rss_bytes": 4996546560,
      "owned_process_count": 2,
      "reclaimable_bytes": 17072259072,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 219.67857733300002,
      "owned_rss_bytes": 4996612096,
      "owned_process_count": 2,
      "reclaimable_bytes": 16898408448,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 219.9061585,
      "owned_rss_bytes": 4996628480,
      "owned_process_count": 2,
      "reclaimable_bytes": 16894951424,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 220.13388625000002,
      "owned_rss_bytes": 4996694016,
      "owned_process_count": 2,
      "reclaimable_bytes": 16816898048,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 220.36697375,
      "owned_rss_bytes": 4996743168,
      "owned_process_count": 2,
      "reclaimable_bytes": 16822910976,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 220.592254375,
      "owned_rss_bytes": 4996775936,
      "owned_process_count": 2,
      "reclaimable_bytes": 16987586560,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 220.82183912500003,
      "owned_rss_bytes": 4996841472,
      "owned_process_count": 2,
      "reclaimable_bytes": 16982392832,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 221.05399483300002,
      "owned_rss_bytes": 4996907008,
      "owned_process_count": 2,
      "reclaimable_bytes": 16993714176,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 221.27941008300002,
      "owned_rss_bytes": 4996956160,
      "owned_process_count": 2,
      "reclaimable_bytes": 17228431360,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 221.514470375,
      "owned_rss_bytes": 4997005312,
      "owned_process_count": 2,
      "reclaimable_bytes": 17253924864,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 221.74891466600002,
      "owned_rss_bytes": 4997054464,
      "owned_process_count": 2,
      "reclaimable_bytes": 17251713024,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 221.98276700000002,
      "owned_rss_bytes": 4997103616,
      "owned_process_count": 2,
      "reclaimable_bytes": 17175494656,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 222.21338,
      "owned_rss_bytes": 4997152768,
      "owned_process_count": 2,
      "reclaimable_bytes": 17153703936,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 222.44063962500002,
      "owned_rss_bytes": 4997464064,
      "owned_process_count": 2,
      "reclaimable_bytes": 17154850816,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 222.668978583,
      "owned_rss_bytes": 4997464064,
      "owned_process_count": 2,
      "reclaimable_bytes": 17149313024,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 222.900527791,
      "owned_rss_bytes": 4997480448,
      "owned_process_count": 2,
      "reclaimable_bytes": 17147379712,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 223.12672295800002,
      "owned_rss_bytes": 4997496832,
      "owned_process_count": 2,
      "reclaimable_bytes": 17160945664,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 223.3539585,
      "owned_rss_bytes": 4997513216,
      "owned_process_count": 2,
      "reclaimable_bytes": 17220190208,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 223.59174570800002,
      "owned_rss_bytes": 4997529600,
      "owned_process_count": 2,
      "reclaimable_bytes": 17240309760,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 223.82586700000002,
      "owned_rss_bytes": 4997545984,
      "owned_process_count": 2,
      "reclaimable_bytes": 17232281600,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 224.066650833,
      "owned_rss_bytes": 4997578752,
      "owned_process_count": 2,
      "reclaimable_bytes": 17228660736,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 224.298018208,
      "owned_rss_bytes": 4997611520,
      "owned_process_count": 2,
      "reclaimable_bytes": 17139204096,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 224.528122666,
      "owned_rss_bytes": 4997644288,
      "owned_process_count": 2,
      "reclaimable_bytes": 17124081664,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 224.75701791600002,
      "owned_rss_bytes": 4997660672,
      "owned_process_count": 2,
      "reclaimable_bytes": 17117151232,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 224.98798283300002,
      "owned_rss_bytes": 4997677056,
      "owned_process_count": 2,
      "reclaimable_bytes": 17122017280,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 225.2223475,
      "owned_rss_bytes": 4997709824,
      "owned_process_count": 2,
      "reclaimable_bytes": 17123606528,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 225.45726820800002,
      "owned_rss_bytes": 4997742592,
      "owned_process_count": 2,
      "reclaimable_bytes": 17212178432,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 225.6927215,
      "owned_rss_bytes": 4997775360,
      "owned_process_count": 2,
      "reclaimable_bytes": 17204805632,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 225.922646958,
      "owned_rss_bytes": 4997791744,
      "owned_process_count": 2,
      "reclaimable_bytes": 17212375040,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 226.15748870800002,
      "owned_rss_bytes": 4997808128,
      "owned_process_count": 2,
      "reclaimable_bytes": 17208311808,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 226.38634091600002,
      "owned_rss_bytes": 4997840896,
      "owned_process_count": 2,
      "reclaimable_bytes": 17208868864,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 226.61160775000002,
      "owned_rss_bytes": 4997857280,
      "owned_process_count": 2,
      "reclaimable_bytes": 17118887936,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 226.84355283300002,
      "owned_rss_bytes": 4997890048,
      "owned_process_count": 2,
      "reclaimable_bytes": 17120919552,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 227.0762185,
      "owned_rss_bytes": 4997906432,
      "owned_process_count": 2,
      "reclaimable_bytes": 17121099776,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 227.30287125,
      "owned_rss_bytes": 4997939200,
      "owned_process_count": 2,
      "reclaimable_bytes": 17125064704,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 227.536349833,
      "owned_rss_bytes": 4997955584,
      "owned_process_count": 2,
      "reclaimable_bytes": 17125588992,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 227.764744833,
      "owned_rss_bytes": 4997988352,
      "owned_process_count": 2,
      "reclaimable_bytes": 17204330496,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 227.993877416,
      "owned_rss_bytes": 4998021120,
      "owned_process_count": 2,
      "reclaimable_bytes": 17195909120,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 228.22237345800002,
      "owned_rss_bytes": 4998037504,
      "owned_process_count": 2,
      "reclaimable_bytes": 17200807936,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 228.44998733300002,
      "owned_rss_bytes": 4998053888,
      "owned_process_count": 2,
      "reclaimable_bytes": 17194369024,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 228.67964750000002,
      "owned_rss_bytes": 4998086656,
      "owned_process_count": 2,
      "reclaimable_bytes": 17132666880,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 228.913617041,
      "owned_rss_bytes": 4998119424,
      "owned_process_count": 2,
      "reclaimable_bytes": 17119150080,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 229.147144708,
      "owned_rss_bytes": 4998152192,
      "owned_process_count": 2,
      "reclaimable_bytes": 17118396416,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 229.37578516600001,
      "owned_rss_bytes": 4998168576,
      "owned_process_count": 2,
      "reclaimable_bytes": 17116626944,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 229.608875,
      "owned_rss_bytes": 4998184960,
      "owned_process_count": 2,
      "reclaimable_bytes": 17113530368,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 229.83527758300002,
      "owned_rss_bytes": 4998217728,
      "owned_process_count": 2,
      "reclaimable_bytes": 17115987968,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 230.068817083,
      "owned_rss_bytes": 4998578176,
      "owned_process_count": 2,
      "reclaimable_bytes": 17191616512,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 230.302191458,
      "owned_rss_bytes": 4998610944,
      "owned_process_count": 2,
      "reclaimable_bytes": 17198039040,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 230.52771925000002,
      "owned_rss_bytes": 4998643712,
      "owned_process_count": 2,
      "reclaimable_bytes": 17195335680,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 230.76441762500002,
      "owned_rss_bytes": 4998643712,
      "owned_process_count": 2,
      "reclaimable_bytes": 17188438016,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 230.997929583,
      "owned_rss_bytes": 4998660096,
      "owned_process_count": 2,
      "reclaimable_bytes": 17193877504,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 231.225693416,
      "owned_rss_bytes": 4998676480,
      "owned_process_count": 2,
      "reclaimable_bytes": 17098178560,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 231.451705083,
      "owned_rss_bytes": 4998692864,
      "owned_process_count": 2,
      "reclaimable_bytes": 17100144640,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 231.67900400000002,
      "owned_rss_bytes": 4998725632,
      "owned_process_count": 2,
      "reclaimable_bytes": 17095999488,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 231.903766875,
      "owned_rss_bytes": 4998758400,
      "owned_process_count": 2,
      "reclaimable_bytes": 17100374016,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 232.12913875,
      "owned_rss_bytes": 4998791168,
      "owned_process_count": 2,
      "reclaimable_bytes": 17085710336,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 232.35885316600002,
      "owned_rss_bytes": 4998856704,
      "owned_process_count": 2,
      "reclaimable_bytes": 17166942208,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 232.585792416,
      "owned_rss_bytes": 4998938624,
      "owned_process_count": 2,
      "reclaimable_bytes": 17177968640,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 232.816764333,
      "owned_rss_bytes": 4999004160,
      "owned_process_count": 2,
      "reclaimable_bytes": 17178198016,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 233.043938416,
      "owned_rss_bytes": 4999036928,
      "owned_process_count": 2,
      "reclaimable_bytes": 17172611072,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 233.27023075000002,
      "owned_rss_bytes": 4999102464,
      "owned_process_count": 2,
      "reclaimable_bytes": 17167695872,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 233.50088804100002,
      "owned_rss_bytes": 4999151616,
      "owned_process_count": 2,
      "reclaimable_bytes": 17091133440,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 233.73343825,
      "owned_rss_bytes": 4999217152,
      "owned_process_count": 2,
      "reclaimable_bytes": 17085267968,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 233.959423041,
      "owned_rss_bytes": 4999299072,
      "owned_process_count": 2,
      "reclaimable_bytes": 17085497344,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 234.184066583,
      "owned_rss_bytes": 4999348224,
      "owned_process_count": 2,
      "reclaimable_bytes": 17073913856,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 234.41068025,
      "owned_rss_bytes": 4999380992,
      "owned_process_count": 2,
      "reclaimable_bytes": 17111941120,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 234.64303062500002,
      "owned_rss_bytes": 4999446528,
      "owned_process_count": 2,
      "reclaimable_bytes": 17187225600,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 234.87722620800002,
      "owned_rss_bytes": 4999512064,
      "owned_process_count": 2,
      "reclaimable_bytes": 17190043648,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 235.10276604100002,
      "owned_rss_bytes": 4999561216,
      "owned_process_count": 2,
      "reclaimable_bytes": 17193779200,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 235.328011833,
      "owned_rss_bytes": 4999593984,
      "owned_process_count": 2,
      "reclaimable_bytes": 17194270720,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 235.56114820800002,
      "owned_rss_bytes": 4999659520,
      "owned_process_count": 2,
      "reclaimable_bytes": 17197154304,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 235.787499208,
      "owned_rss_bytes": 4999725056,
      "owned_process_count": 2,
      "reclaimable_bytes": 17114955776,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 236.016832875,
      "owned_rss_bytes": 4999790592,
      "owned_process_count": 2,
      "reclaimable_bytes": 17109663744,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 236.2420165,
      "owned_rss_bytes": 4999839744,
      "owned_process_count": 2,
      "reclaimable_bytes": 17099997184,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 236.466655333,
      "owned_rss_bytes": 4999921664,
      "owned_process_count": 2,
      "reclaimable_bytes": 17100259328,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 236.693312625,
      "owned_rss_bytes": 5000003584,
      "owned_process_count": 2,
      "reclaimable_bytes": 17110040576,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 236.92188454100003,
      "owned_rss_bytes": 5000069120,
      "owned_process_count": 2,
      "reclaimable_bytes": 17180606464,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 237.14844662500002,
      "owned_rss_bytes": 5000134656,
      "owned_process_count": 2,
      "reclaimable_bytes": 17180442624,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 237.37740562500002,
      "owned_rss_bytes": 5000183808,
      "owned_process_count": 2,
      "reclaimable_bytes": 17181818880,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 237.606466041,
      "owned_rss_bytes": 5000232960,
      "owned_process_count": 2,
      "reclaimable_bytes": 17185488896,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 237.833385458,
      "owned_rss_bytes": 5000298496,
      "owned_process_count": 2,
      "reclaimable_bytes": 17190010880,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 238.064044666,
      "owned_rss_bytes": 5000347648,
      "owned_process_count": 2,
      "reclaimable_bytes": 17105108992,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 238.28803058300002,
      "owned_rss_bytes": 5000413184,
      "owned_process_count": 2,
      "reclaimable_bytes": 17098342400,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 238.51251362500003,
      "owned_rss_bytes": 5000462336,
      "owned_process_count": 2,
      "reclaimable_bytes": 17102340096,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 238.744051458,
      "owned_rss_bytes": 5000855552,
      "owned_process_count": 2,
      "reclaimable_bytes": 16160833536,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 238.992508208,
      "owned_rss_bytes": 4586668032,
      "owned_process_count": 2,
      "reclaimable_bytes": 17095131136,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 239.229589583,
      "owned_rss_bytes": 4586668032,
      "owned_process_count": 2,
      "reclaimable_bytes": 17253597184,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 239.456954125,
      "owned_rss_bytes": 4795269120,
      "owned_process_count": 2,
      "reclaimable_bytes": 17134698496,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 239.68543691600001,
      "owned_rss_bytes": 4799217664,
      "owned_process_count": 2,
      "reclaimable_bytes": 17382375424,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 239.92259629100002,
      "owned_rss_bytes": 4396498944,
      "owned_process_count": 2,
      "reclaimable_bytes": 17339990016,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 240.174123583,
      "owned_rss_bytes": 3414736896,
      "owned_process_count": 2,
      "reclaimable_bytes": 17303601152,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 240.430393583,
      "owned_rss_bytes": 2428977152,
      "owned_process_count": 2,
      "reclaimable_bytes": 17432559616,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 240.660590458,
      "owned_rss_bytes": 2506080256,
      "owned_process_count": 2,
      "reclaimable_bytes": 18153062400,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 240.916275708,
      "owned_rss_bytes": 2525609984,
      "owned_process_count": 2,
      "reclaimable_bytes": 18980077568,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 241.14457900000002,
      "owned_rss_bytes": 1497595904,
      "owned_process_count": 2,
      "reclaimable_bytes": 19594674176,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 241.53015675,
      "owned_rss_bytes": 1065975808,
      "owned_process_count": 2,
      "reclaimable_bytes": 20293746688,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 241.812800833,
      "owned_rss_bytes": 729202688,
      "owned_process_count": 2,
      "reclaimable_bytes": 20807172096,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 242.147586291,
      "owned_rss_bytes": 567689216,
      "owned_process_count": 2,
      "reclaimable_bytes": 21444673536,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 242.45002645800002,
      "owned_rss_bytes": 497516544,
      "owned_process_count": 2,
      "reclaimable_bytes": 21295038464,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 242.69960104100002,
      "owned_rss_bytes": 524124160,
      "owned_process_count": 2,
      "reclaimable_bytes": 21262385152,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 242.96741975,
      "owned_rss_bytes": 525598720,
      "owned_process_count": 2,
      "reclaimable_bytes": 21601353728,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 243.243382208,
      "owned_rss_bytes": 514818048,
      "owned_process_count": 2,
      "reclaimable_bytes": 21587771392,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 243.492246125,
      "owned_rss_bytes": 514932736,
      "owned_process_count": 2,
      "reclaimable_bytes": 21414330368,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 243.72538816600002,
      "owned_rss_bytes": 518455296,
      "owned_process_count": 2,
      "reclaimable_bytes": 21342765056,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 243.96229779100003,
      "owned_rss_bytes": 519847936,
      "owned_process_count": 2,
      "reclaimable_bytes": 21296300032,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 244.19905816600001,
      "owned_rss_bytes": 519929856,
      "owned_process_count": 2,
      "reclaimable_bytes": 21286633472,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 244.445547333,
      "owned_rss_bytes": 520192000,
      "owned_process_count": 2,
      "reclaimable_bytes": 21222260736,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 244.67715958300002,
      "owned_rss_bytes": 536363008,
      "owned_process_count": 2,
      "reclaimable_bytes": 21180284928,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 244.90290512500002,
      "owned_rss_bytes": 536608768,
      "owned_process_count": 2,
      "reclaimable_bytes": 21261877248,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 245.156359083,
      "owned_rss_bytes": 543637504,
      "owned_process_count": 2,
      "reclaimable_bytes": 21273001984,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 245.405595333,
      "owned_rss_bytes": 544505856,
      "owned_process_count": 2,
      "reclaimable_bytes": 21275836416,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 245.641939833,
      "owned_rss_bytes": 544522240,
      "owned_process_count": 2,
      "reclaimable_bytes": 21254815744,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 245.916791958,
      "owned_rss_bytes": 544587776,
      "owned_process_count": 2,
      "reclaimable_bytes": 21224538112,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 246.15337687500002,
      "owned_rss_bytes": 544030720,
      "owned_process_count": 2,
      "reclaimable_bytes": 21264826368,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 246.40442495800002,
      "owned_rss_bytes": 543932416,
      "owned_process_count": 2,
      "reclaimable_bytes": 21396176896,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 246.64920500000002,
      "owned_rss_bytes": 543948800,
      "owned_process_count": 2,
      "reclaimable_bytes": 21375565824,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 246.89186600000002,
      "owned_rss_bytes": 544063488,
      "owned_process_count": 2,
      "reclaimable_bytes": 21343027200,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 247.133807458,
      "owned_rss_bytes": 544063488,
      "owned_process_count": 2,
      "reclaimable_bytes": 21323612160,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 247.368792458,
      "owned_rss_bytes": 544079872,
      "owned_process_count": 2,
      "reclaimable_bytes": 21375074304,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 247.60349525,
      "owned_rss_bytes": 544260096,
      "owned_process_count": 2,
      "reclaimable_bytes": 21371863040,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 247.83967137500002,
      "owned_rss_bytes": 544276480,
      "owned_process_count": 2,
      "reclaimable_bytes": 21331820544,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 248.078328083,
      "owned_rss_bytes": 544227328,
      "owned_process_count": 2,
      "reclaimable_bytes": 21329199104,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 248.329053875,
      "owned_rss_bytes": 544227328,
      "owned_process_count": 2,
      "reclaimable_bytes": 21298544640,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 248.558824708,
      "owned_rss_bytes": 544276480,
      "owned_process_count": 2,
      "reclaimable_bytes": 21239758848,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 248.79806191600002,
      "owned_rss_bytes": 544309248,
      "owned_process_count": 2,
      "reclaimable_bytes": 21178499072,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 249.04092250000002,
      "owned_rss_bytes": 1081671680,
      "owned_process_count": 2,
      "reclaimable_bytes": 19336151040,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 249.27155058300002,
      "owned_rss_bytes": 1085784064,
      "owned_process_count": 2,
      "reclaimable_bytes": 18570772480,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 249.50664350000002,
      "owned_rss_bytes": 1087078400,
      "owned_process_count": 2,
      "reclaimable_bytes": 18612289536,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 249.73498325,
      "owned_rss_bytes": 1088536576,
      "owned_process_count": 2,
      "reclaimable_bytes": 18388828160,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 249.97022604100002,
      "owned_rss_bytes": 1170161664,
      "owned_process_count": 2,
      "reclaimable_bytes": 18289639424,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 250.20627133300002,
      "owned_rss_bytes": 1171849216,
      "owned_process_count": 2,
      "reclaimable_bytes": 18273402880,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 250.438549916,
      "owned_rss_bytes": 1171898368,
      "owned_process_count": 2,
      "reclaimable_bytes": 18265096192,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 250.675898958,
      "owned_rss_bytes": 1171914752,
      "owned_process_count": 2,
      "reclaimable_bytes": 18271518720,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 250.90882512500002,
      "owned_rss_bytes": 1176600576,
      "owned_process_count": 2,
      "reclaimable_bytes": 18368167936,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 251.149744625,
      "owned_rss_bytes": 1176453120,
      "owned_process_count": 2,
      "reclaimable_bytes": 18353061888,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 251.38074866600002,
      "owned_rss_bytes": 1176502272,
      "owned_process_count": 2,
      "reclaimable_bytes": 18257149952,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 251.61078129100002,
      "owned_rss_bytes": 1152204800,
      "owned_process_count": 2,
      "reclaimable_bytes": 17991172096,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 251.86182637500002,
      "owned_rss_bytes": 1156005888,
      "owned_process_count": 2,
      "reclaimable_bytes": 17850597376,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 252.101485166,
      "owned_rss_bytes": 1156562944,
      "owned_process_count": 2,
      "reclaimable_bytes": 17927012352,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 252.33426845800003,
      "owned_rss_bytes": 1156562944,
      "owned_process_count": 2,
      "reclaimable_bytes": 17920589824,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 252.57408345800002,
      "owned_rss_bytes": 1157677056,
      "owned_process_count": 2,
      "reclaimable_bytes": 17918033920,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 252.80880266600002,
      "owned_rss_bytes": 1160560640,
      "owned_process_count": 2,
      "reclaimable_bytes": 17917591552,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 253.046966666,
      "owned_rss_bytes": 1160577024,
      "owned_process_count": 2,
      "reclaimable_bytes": 17999298560,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 253.290697208,
      "owned_rss_bytes": 1161412608,
      "owned_process_count": 2,
      "reclaimable_bytes": 17988567040,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 253.526661958,
      "owned_rss_bytes": 1161412608,
      "owned_process_count": 2,
      "reclaimable_bytes": 17923407872,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 253.76939700000003,
      "owned_rss_bytes": 1162379264,
      "owned_process_count": 2,
      "reclaimable_bytes": 17863557120,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 254.005953333,
      "owned_rss_bytes": 1162788864,
      "owned_process_count": 2,
      "reclaimable_bytes": 17892605952,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 254.228827208,
      "owned_rss_bytes": 1164247040,
      "owned_process_count": 2,
      "reclaimable_bytes": 17846468608,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 254.46642366600003,
      "owned_rss_bytes": 1164345344,
      "owned_process_count": 2,
      "reclaimable_bytes": 17721933824,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 254.70077054100003,
      "owned_rss_bytes": 1164541952,
      "owned_process_count": 2,
      "reclaimable_bytes": 17725931520,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 254.92856558300002,
      "owned_rss_bytes": 1164902400,
      "owned_process_count": 2,
      "reclaimable_bytes": 17599365120,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 255.15790237500002,
      "owned_rss_bytes": 1165197312,
      "owned_process_count": 2,
      "reclaimable_bytes": 17600217088,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 255.38725458300001,
      "owned_rss_bytes": 1165410304,
      "owned_process_count": 2,
      "reclaimable_bytes": 17593778176,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 255.612983041,
      "owned_rss_bytes": 1165557760,
      "owned_process_count": 2,
      "reclaimable_bytes": 17605591040,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 255.84697304100004,
      "owned_rss_bytes": 1165819904,
      "owned_process_count": 2,
      "reclaimable_bytes": 17531715584,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 256.07782295799996,
      "owned_rss_bytes": 1166098432,
      "owned_process_count": 2,
      "reclaimable_bytes": 17509072896,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 256.30536037499996,
      "owned_rss_bytes": 1166376960,
      "owned_process_count": 2,
      "reclaimable_bytes": 17497276416,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 256.53679158299997,
      "owned_rss_bytes": 1166540800,
      "owned_process_count": 2,
      "reclaimable_bytes": 17497554944,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 256.76395216599997,
      "owned_rss_bytes": 1166737408,
      "owned_process_count": 2,
      "reclaimable_bytes": 17497505792,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 256.990323833,
      "owned_rss_bytes": 1166966784,
      "owned_process_count": 2,
      "reclaimable_bytes": 17508319232,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 257.219275833,
      "owned_rss_bytes": 1167163392,
      "owned_process_count": 2,
      "reclaimable_bytes": 17570922496,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 257.455873125,
      "owned_rss_bytes": 1167376384,
      "owned_process_count": 2,
      "reclaimable_bytes": 17566679040,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 257.68954049999996,
      "owned_rss_bytes": 1167589376,
      "owned_process_count": 2,
      "reclaimable_bytes": 17578180608,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 257.91851566599996,
      "owned_rss_bytes": 1167818752,
      "owned_process_count": 2,
      "reclaimable_bytes": 17576820736,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 258.1490315,
      "owned_rss_bytes": 1167687680,
      "owned_process_count": 2,
      "reclaimable_bytes": 17424547840,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 258.374403041,
      "owned_rss_bytes": 1167867904,
      "owned_process_count": 2,
      "reclaimable_bytes": 17327046656,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 258.601196125,
      "owned_rss_bytes": 1168015360,
      "owned_process_count": 2,
      "reclaimable_bytes": 17321394176,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 258.826886291,
      "owned_rss_bytes": 1168211968,
      "owned_process_count": 2,
      "reclaimable_bytes": 17330601984,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 259.057267125,
      "owned_rss_bytes": 1168474112,
      "owned_process_count": 2,
      "reclaimable_bytes": 17320427520,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 259.2916395,
      "owned_rss_bytes": 1168703488,
      "owned_process_count": 2,
      "reclaimable_bytes": 17055973376,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 259.521017083,
      "owned_rss_bytes": 1168982016,
      "owned_process_count": 2,
      "reclaimable_bytes": 17132830720,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 259.752877958,
      "owned_rss_bytes": 1169195008,
      "owned_process_count": 2,
      "reclaimable_bytes": 17132847104,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 259.989414416,
      "owned_rss_bytes": 1169440768,
      "owned_process_count": 2,
      "reclaimable_bytes": 17129783296,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 260.21666779099996,
      "owned_rss_bytes": 1169670144,
      "owned_process_count": 2,
      "reclaimable_bytes": 17122639872,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 260.443136,
      "owned_rss_bytes": 1169784832,
      "owned_process_count": 2,
      "reclaimable_bytes": 17273470976,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 260.668831208,
      "owned_rss_bytes": 1169883136,
      "owned_process_count": 2,
      "reclaimable_bytes": 17199087616,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 260.896853541,
      "owned_rss_bytes": 1169965056,
      "owned_process_count": 2,
      "reclaimable_bytes": 17179246592,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 261.127668041,
      "owned_rss_bytes": 1170063360,
      "owned_process_count": 2,
      "reclaimable_bytes": 17180278784,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 261.357732083,
      "owned_rss_bytes": 1170161664,
      "owned_process_count": 2,
      "reclaimable_bytes": 17268654080,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 261.585800583,
      "owned_rss_bytes": 1170292736,
      "owned_process_count": 2,
      "reclaimable_bytes": 17282891776,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 261.810993416,
      "owned_rss_bytes": 1170407424,
      "owned_process_count": 2,
      "reclaimable_bytes": 17358995456,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 262.047771,
      "owned_rss_bytes": 1175371776,
      "owned_process_count": 2,
      "reclaimable_bytes": 17923915776,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 262.283398041,
      "owned_rss_bytes": 1192525824,
      "owned_process_count": 2,
      "reclaimable_bytes": 17917788160,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 262.52110258299996,
      "owned_rss_bytes": 1175322624,
      "owned_process_count": 2,
      "reclaimable_bytes": 17932779520,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 262.748044458,
      "owned_rss_bytes": 1177911296,
      "owned_process_count": 2,
      "reclaimable_bytes": 18028462080,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 262.977893333,
      "owned_rss_bytes": 1178353664,
      "owned_process_count": 2,
      "reclaimable_bytes": 17899831296,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 263.211232,
      "owned_rss_bytes": 1178501120,
      "owned_process_count": 2,
      "reclaimable_bytes": 17885675520,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 263.463361958,
      "owned_rss_bytes": 1178517504,
      "owned_process_count": 2,
      "reclaimable_bytes": 18043437056,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 263.736286291,
      "owned_rss_bytes": 1175404544,
      "owned_process_count": 2,
      "reclaimable_bytes": 17946345472,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 263.9738885,
      "owned_rss_bytes": 1175420928,
      "owned_process_count": 2,
      "reclaimable_bytes": 17934352384,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 264.223443166,
      "owned_rss_bytes": 1175437312,
      "owned_process_count": 2,
      "reclaimable_bytes": 17995808768,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 264.455325958,
      "owned_rss_bytes": 1175453696,
      "owned_process_count": 2,
      "reclaimable_bytes": 17982799872,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 264.70015574999996,
      "owned_rss_bytes": 1175453696,
      "owned_process_count": 2,
      "reclaimable_bytes": 17992384512,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 264.93370875,
      "owned_rss_bytes": 1175486464,
      "owned_process_count": 2,
      "reclaimable_bytes": 17931894784,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 265.17058129099996,
      "owned_rss_bytes": 1175486464,
      "owned_process_count": 2,
      "reclaimable_bytes": 18113888256,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 265.405289041,
      "owned_rss_bytes": 1175552000,
      "owned_process_count": 2,
      "reclaimable_bytes": 18113232896,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 265.65366541599997,
      "owned_rss_bytes": 1175224320,
      "owned_process_count": 2,
      "reclaimable_bytes": 18043355136,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 265.886428875,
      "owned_rss_bytes": 1175224320,
      "owned_process_count": 2,
      "reclaimable_bytes": 18031017984,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 266.118366083,
      "owned_rss_bytes": 1175257088,
      "owned_process_count": 2,
      "reclaimable_bytes": 18037669888,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 266.384935791,
      "owned_rss_bytes": 632389632,
      "owned_process_count": 2,
      "reclaimable_bytes": 18335809536,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 266.655291916,
      "owned_rss_bytes": 537772032,
      "owned_process_count": 2,
      "reclaimable_bytes": 18370428928,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 266.890772166,
      "owned_rss_bytes": 537788416,
      "owned_process_count": 2,
      "reclaimable_bytes": 18399019008,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 267.14226974999997,
      "owned_rss_bytes": 540983296,
      "owned_process_count": 2,
      "reclaimable_bytes": 18414321664,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 267.393489208,
      "owned_rss_bytes": 538066944,
      "owned_process_count": 2,
      "reclaimable_bytes": 18440339456,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 267.648204083,
      "owned_rss_bytes": 537952256,
      "owned_process_count": 2,
      "reclaimable_bytes": 18415697920,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 267.89061899999996,
      "owned_rss_bytes": 537985024,
      "owned_process_count": 2,
      "reclaimable_bytes": 18425856000,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 268.133969375,
      "owned_rss_bytes": 536854528,
      "owned_process_count": 2,
      "reclaimable_bytes": 18322571264,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 268.37923187499996,
      "owned_rss_bytes": 537001984,
      "owned_process_count": 2,
      "reclaimable_bytes": 18301485056,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 268.621114208,
      "owned_rss_bytes": 537116672,
      "owned_process_count": 2,
      "reclaimable_bytes": 18294751232,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 268.85798154099996,
      "owned_rss_bytes": 537149440,
      "owned_process_count": 2,
      "reclaimable_bytes": 18272124928,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 269.099845541,
      "owned_rss_bytes": 537280512,
      "owned_process_count": 2,
      "reclaimable_bytes": 18230001664,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 269.34216666599997,
      "owned_rss_bytes": 537329664,
      "owned_process_count": 2,
      "reclaimable_bytes": 18322915328,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 269.57557283299997,
      "owned_rss_bytes": 537296896,
      "owned_process_count": 2,
      "reclaimable_bytes": 18292572160,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 269.81767287499997,
      "owned_rss_bytes": 537198592,
      "owned_process_count": 2,
      "reclaimable_bytes": 18301304832,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 270.049068333,
      "owned_rss_bytes": 537165824,
      "owned_process_count": 2,
      "reclaimable_bytes": 18221793280,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 270.28789558299997,
      "owned_rss_bytes": 537427968,
      "owned_process_count": 2,
      "reclaimable_bytes": 18227822592,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 270.536812458,
      "owned_rss_bytes": 537460736,
      "owned_process_count": 2,
      "reclaimable_bytes": 18172411904,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 270.776403708,
      "owned_rss_bytes": 537460736,
      "owned_process_count": 2,
      "reclaimable_bytes": 18099978240,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 271.01015370799996,
      "owned_rss_bytes": 538279936,
      "owned_process_count": 2,
      "reclaimable_bytes": 18131648512,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 271.24310199999996,
      "owned_rss_bytes": 1075298304,
      "owned_process_count": 2,
      "reclaimable_bytes": 18084134912,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 271.474760666,
      "owned_rss_bytes": 1076494336,
      "owned_process_count": 2,
      "reclaimable_bytes": 18147835904,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 271.713198166,
      "owned_rss_bytes": 1163116544,
      "owned_process_count": 2,
      "reclaimable_bytes": 18151276544,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 271.950262291,
      "owned_rss_bytes": 1165639680,
      "owned_process_count": 2,
      "reclaimable_bytes": 18219352064,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 272.181442125,
      "owned_rss_bytes": 1165656064,
      "owned_process_count": 2,
      "reclaimable_bytes": 18221727744,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 272.413552708,
      "owned_rss_bytes": 1165672448,
      "owned_process_count": 2,
      "reclaimable_bytes": 18214699008,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 272.640091833,
      "owned_rss_bytes": 1166000128,
      "owned_process_count": 2,
      "reclaimable_bytes": 18226053120,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 272.87836329099997,
      "owned_rss_bytes": 1169096704,
      "owned_process_count": 2,
      "reclaimable_bytes": 18220367872,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 273.104034208,
      "owned_rss_bytes": 1169145856,
      "owned_process_count": 2,
      "reclaimable_bytes": 18144493568,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 273.339704666,
      "owned_rss_bytes": 1171406848,
      "owned_process_count": 2,
      "reclaimable_bytes": 18147131392,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 273.564208958,
      "owned_rss_bytes": 1172029440,
      "owned_process_count": 2,
      "reclaimable_bytes": 18140233728,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 273.80064779099996,
      "owned_rss_bytes": 1172602880,
      "owned_process_count": 2,
      "reclaimable_bytes": 18135760896,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 274.02884925,
      "owned_rss_bytes": 1172635648,
      "owned_process_count": 2,
      "reclaimable_bytes": 18135990272,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 274.262167083,
      "owned_rss_bytes": 1172930560,
      "owned_process_count": 2,
      "reclaimable_bytes": 18138480640,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 274.49887824999996,
      "owned_rss_bytes": 1173667840,
      "owned_process_count": 2,
      "reclaimable_bytes": 18213486592,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 274.732656125,
      "owned_rss_bytes": 1173684224,
      "owned_process_count": 2,
      "reclaimable_bytes": 18224726016,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 274.96835074999996,
      "owned_rss_bytes": 1174503424,
      "owned_process_count": 2,
      "reclaimable_bytes": 18223497216,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 275.202795,
      "owned_rss_bytes": 1175175168,
      "owned_process_count": 2,
      "reclaimable_bytes": 18228428800,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 275.427755708,
      "owned_rss_bytes": 1175896064,
      "owned_process_count": 2,
      "reclaimable_bytes": 18186928128,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 275.667427041,
      "owned_rss_bytes": 1175633920,
      "owned_process_count": 2,
      "reclaimable_bytes": 18159108096,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 275.89018916599997,
      "owned_rss_bytes": 1175732224,
      "owned_process_count": 2,
      "reclaimable_bytes": 18025152512,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 276.123739625,
      "owned_rss_bytes": 1175764992,
      "owned_process_count": 2,
      "reclaimable_bytes": 17992155136,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 276.34975525,
      "owned_rss_bytes": 1175846912,
      "owned_process_count": 2,
      "reclaimable_bytes": 17875288064,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 276.578562916,
      "owned_rss_bytes": 1175863296,
      "owned_process_count": 2,
      "reclaimable_bytes": 17918345216,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 276.813210125,
      "owned_rss_bytes": 1175928832,
      "owned_process_count": 2,
      "reclaimable_bytes": 17948557312,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 277.050128666,
      "owned_rss_bytes": 1176010752,
      "owned_process_count": 2,
      "reclaimable_bytes": 17940905984,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 277.28424237499996,
      "owned_rss_bytes": 1176076288,
      "owned_process_count": 2,
      "reclaimable_bytes": 17942724608,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 277.515321333,
      "owned_rss_bytes": 1176141824,
      "owned_process_count": 2,
      "reclaimable_bytes": 17943379968,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 277.745961875,
      "owned_rss_bytes": 1176207360,
      "owned_process_count": 2,
      "reclaimable_bytes": 17951064064,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 277.971620416,
      "owned_rss_bytes": 1176223744,
      "owned_process_count": 2,
      "reclaimable_bytes": 17867259904,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 278.204811791,
      "owned_rss_bytes": 1176305664,
      "owned_process_count": 2,
      "reclaimable_bytes": 17865998336,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 278.435495083,
      "owned_rss_bytes": 1176354816,
      "owned_process_count": 2,
      "reclaimable_bytes": 17863376896,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 278.65937616599996,
      "owned_rss_bytes": 1176387584,
      "owned_process_count": 2,
      "reclaimable_bytes": 17839357952,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 278.88892112499997,
      "owned_rss_bytes": 1176403968,
      "owned_process_count": 2,
      "reclaimable_bytes": 17841307648,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 279.119227208,
      "owned_rss_bytes": 1176420352,
      "owned_process_count": 2,
      "reclaimable_bytes": 17897390080,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 279.35123779099996,
      "owned_rss_bytes": 1176453120,
      "owned_process_count": 2,
      "reclaimable_bytes": 17920901120,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 279.581866625,
      "owned_rss_bytes": 1176469504,
      "owned_process_count": 2,
      "reclaimable_bytes": 17935237120,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 279.81830149999996,
      "owned_rss_bytes": 1176502272,
      "owned_process_count": 2,
      "reclaimable_bytes": 17725358080,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 280.049134833,
      "owned_rss_bytes": 1176518656,
      "owned_process_count": 2,
      "reclaimable_bytes": 17725521920,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 280.280298416,
      "owned_rss_bytes": 1176551424,
      "owned_process_count": 2,
      "reclaimable_bytes": 17637097472,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 280.50943504099996,
      "owned_rss_bytes": 1176584192,
      "owned_process_count": 2,
      "reclaimable_bytes": 17628119040,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 280.74053179099997,
      "owned_rss_bytes": 1176600576,
      "owned_process_count": 2,
      "reclaimable_bytes": 17624662016,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 280.975750833,
      "owned_rss_bytes": 1176403968,
      "owned_process_count": 2,
      "reclaimable_bytes": 17790320640,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 281.203705416,
      "owned_rss_bytes": 1176453120,
      "owned_process_count": 2,
      "reclaimable_bytes": 17797758976,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 281.42839749999996,
      "owned_rss_bytes": 1176485888,
      "owned_process_count": 2,
      "reclaimable_bytes": 17864851456,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 281.66051008299996,
      "owned_rss_bytes": 1176502272,
      "owned_process_count": 2,
      "reclaimable_bytes": 17896095744,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 281.889434333,
      "owned_rss_bytes": 1176551424,
      "owned_process_count": 2,
      "reclaimable_bytes": 18006392832,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 282.117686458,
      "owned_rss_bytes": 1176567808,
      "owned_process_count": 2,
      "reclaimable_bytes": 17996906496,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 282.344271708,
      "owned_rss_bytes": 1176600576,
      "owned_process_count": 2,
      "reclaimable_bytes": 17917378560,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 282.56816983299996,
      "owned_rss_bytes": 1176649728,
      "owned_process_count": 2,
      "reclaimable_bytes": 17916133376,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 282.793351375,
      "owned_rss_bytes": 1176666112,
      "owned_process_count": 2,
      "reclaimable_bytes": 17911939072,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 283.02173345799997,
      "owned_rss_bytes": 1176698880,
      "owned_process_count": 2,
      "reclaimable_bytes": 17913331712,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 283.24957075,
      "owned_rss_bytes": 1176748032,
      "owned_process_count": 2,
      "reclaimable_bytes": 17909366784,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 283.474232833,
      "owned_rss_bytes": 1176797184,
      "owned_process_count": 2,
      "reclaimable_bytes": 17986748416,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 283.709276666,
      "owned_rss_bytes": 1193771008,
      "owned_process_count": 2,
      "reclaimable_bytes": 18279202816,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 283.946046583,
      "owned_rss_bytes": 1193738240,
      "owned_process_count": 2,
      "reclaimable_bytes": 18583322624,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 284.173913541,
      "owned_rss_bytes": 1179549696,
      "owned_process_count": 2,
      "reclaimable_bytes": 18509840384,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 284.40837395799997,
      "owned_rss_bytes": 1176928256,
      "owned_process_count": 2,
      "reclaimable_bytes": 18562940928,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 284.650331791,
      "owned_rss_bytes": 1177075712,
      "owned_process_count": 2,
      "reclaimable_bytes": 18462621696,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 284.889026791,
      "owned_rss_bytes": 1177092096,
      "owned_process_count": 2,
      "reclaimable_bytes": 18457460736,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 285.13076704099996,
      "owned_rss_bytes": 1177092096,
      "owned_process_count": 2,
      "reclaimable_bytes": 18517344256,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 285.377551375,
      "owned_rss_bytes": 1176387584,
      "owned_process_count": 2,
      "reclaimable_bytes": 18539823104,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 285.617581916,
      "owned_rss_bytes": 1176272896,
      "owned_process_count": 2,
      "reclaimable_bytes": 18582945792,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 285.852220625,
      "owned_rss_bytes": 1176272896,
      "owned_process_count": 2,
      "reclaimable_bytes": 18597888000,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 286.08458974999996,
      "owned_rss_bytes": 1176207360,
      "owned_process_count": 2,
      "reclaimable_bytes": 18641321984,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 286.31964849999997,
      "owned_rss_bytes": 1176207360,
      "owned_process_count": 2,
      "reclaimable_bytes": 18650611712,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 286.56174091599996,
      "owned_rss_bytes": 1175764992,
      "owned_process_count": 2,
      "reclaimable_bytes": 18592727040,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 286.800218333,
      "owned_rss_bytes": 1175830528,
      "owned_process_count": 2,
      "reclaimable_bytes": 18654429184,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 287.031374541,
      "owned_rss_bytes": 1175044096,
      "owned_process_count": 2,
      "reclaimable_bytes": 18642698240,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 287.272642125,
      "owned_rss_bytes": 1175076864,
      "owned_process_count": 2,
      "reclaimable_bytes": 18544410624,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 287.51328170799997,
      "owned_rss_bytes": 1175076864,
      "owned_process_count": 2,
      "reclaimable_bytes": 18525093888,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 287.756933083,
      "owned_rss_bytes": 1175093248,
      "owned_process_count": 2,
      "reclaimable_bytes": 18506285056,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 287.984902708,
      "owned_rss_bytes": 1177862144,
      "owned_process_count": 2,
      "reclaimable_bytes": 18541166592,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 288.21801862499996,
      "owned_rss_bytes": 1175257088,
      "owned_process_count": 2,
      "reclaimable_bytes": 18491604992,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 288.45780420799997,
      "owned_rss_bytes": 1175273472,
      "owned_process_count": 2,
      "reclaimable_bytes": 18464800768,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 288.69302562499996,
      "owned_rss_bytes": 1175273472,
      "owned_process_count": 2,
      "reclaimable_bytes": 18493489152,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 288.96149366599997,
      "owned_rss_bytes": 1175306240,
      "owned_process_count": 2,
      "reclaimable_bytes": 18547998720,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 289.20263979099997,
      "owned_rss_bytes": 1175322624,
      "owned_process_count": 2,
      "reclaimable_bytes": 18518310912,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 289.437548333,
      "owned_rss_bytes": 1175339008,
      "owned_process_count": 2,
      "reclaimable_bytes": 18504564736,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 289.672925041,
      "owned_rss_bytes": 1175339008,
      "owned_process_count": 2,
      "reclaimable_bytes": 18491047936,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 289.906720583,
      "owned_rss_bytes": 1175404544,
      "owned_process_count": 2,
      "reclaimable_bytes": 18576736256,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 290.155502583,
      "owned_rss_bytes": 1175404544,
      "owned_process_count": 2,
      "reclaimable_bytes": 18549211136,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 290.39016766599997,
      "owned_rss_bytes": 1175240704,
      "owned_process_count": 2,
      "reclaimable_bytes": 18439159808,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 290.638001875,
      "owned_rss_bytes": 1175240704,
      "owned_process_count": 2,
      "reclaimable_bytes": 18429591552,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 290.875324166,
      "owned_rss_bytes": 1175273472,
      "owned_process_count": 2,
      "reclaimable_bytes": 18392088576,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 291.117741625,
      "owned_rss_bytes": 1175339008,
      "owned_process_count": 2,
      "reclaimable_bytes": 18417303552,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 291.355651625,
      "owned_rss_bytes": 1175371776,
      "owned_process_count": 2,
      "reclaimable_bytes": 18409373696,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 291.592339166,
      "owned_rss_bytes": 1175371776,
      "owned_process_count": 2,
      "reclaimable_bytes": 18499141632,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 291.835228916,
      "owned_rss_bytes": 1178271744,
      "owned_process_count": 2,
      "reclaimable_bytes": 18489098240,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 292.079655666,
      "owned_rss_bytes": 1176174592,
      "owned_process_count": 2,
      "reclaimable_bytes": 18484789248,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 292.314226208,
      "owned_rss_bytes": 1176190976,
      "owned_process_count": 2,
      "reclaimable_bytes": 18482233344,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 292.551124041,
      "owned_rss_bytes": 1176223744,
      "owned_process_count": 2,
      "reclaimable_bytes": 18489917440,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 292.784668458,
      "owned_rss_bytes": 1176256512,
      "owned_process_count": 2,
      "reclaimable_bytes": 18421481472,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 293.018645875,
      "owned_rss_bytes": 1176305664,
      "owned_process_count": 2,
      "reclaimable_bytes": 18404392960,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 293.25452187499997,
      "owned_rss_bytes": 1176322048,
      "owned_process_count": 2,
      "reclaimable_bytes": 18404868096,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 293.487588625,
      "owned_rss_bytes": 1176338432,
      "owned_process_count": 2,
      "reclaimable_bytes": 18406408192,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 293.721094166,
      "owned_rss_bytes": 1176354816,
      "owned_process_count": 2,
      "reclaimable_bytes": 18407702528,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 293.961444083,
      "owned_rss_bytes": 1176879104,
      "owned_process_count": 2,
      "reclaimable_bytes": 18409783296,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 294.196534333,
      "owned_rss_bytes": 1177026560,
      "owned_process_count": 2,
      "reclaimable_bytes": 18476646400,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 294.437592333,
      "owned_rss_bytes": 1177059328,
      "owned_process_count": 2,
      "reclaimable_bytes": 18478563328,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 294.667149291,
      "owned_rss_bytes": 1177075712,
      "owned_process_count": 2,
      "reclaimable_bytes": 18484133888,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 294.89773716599996,
      "owned_rss_bytes": 1177075712,
      "owned_process_count": 2,
      "reclaimable_bytes": 18484215808,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 295.13022125,
      "owned_rss_bytes": 1177141248,
      "owned_process_count": 2,
      "reclaimable_bytes": 18478497792,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 295.36107699999997,
      "owned_rss_bytes": 1176961024,
      "owned_process_count": 2,
      "reclaimable_bytes": 18395201536,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 295.591357916,
      "owned_rss_bytes": 1176961024,
      "owned_process_count": 2,
      "reclaimable_bytes": 18382635008,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 295.82908479099996,
      "owned_rss_bytes": 1177010176,
      "owned_process_count": 2,
      "reclaimable_bytes": 18388664320,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 296.068976875,
      "owned_rss_bytes": 1177092096,
      "owned_process_count": 2,
      "reclaimable_bytes": 18388434944,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 296.29962558299997,
      "owned_rss_bytes": 1177157632,
      "owned_process_count": 2,
      "reclaimable_bytes": 18398314496,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 296.5315005,
      "owned_rss_bytes": 1177354240,
      "owned_process_count": 2,
      "reclaimable_bytes": 18453069824,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 296.759641208,
      "owned_rss_bytes": 1177387008,
      "owned_process_count": 2,
      "reclaimable_bytes": 18364284928,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 296.98681224999996,
      "owned_rss_bytes": 1177419776,
      "owned_process_count": 2,
      "reclaimable_bytes": 18361122816,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 297.21388049999996,
      "owned_rss_bytes": 1177452544,
      "owned_process_count": 2,
      "reclaimable_bytes": 18356289536,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 297.44124208299996,
      "owned_rss_bytes": 1177485312,
      "owned_process_count": 2,
      "reclaimable_bytes": 18275188736,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 297.66727283299997,
      "owned_rss_bytes": 1177534464,
      "owned_process_count": 2,
      "reclaimable_bytes": 18270928896,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 297.89278670799996,
      "owned_rss_bytes": 1177583616,
      "owned_process_count": 2,
      "reclaimable_bytes": 18239225856,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 298.120240458,
      "owned_rss_bytes": 1177616384,
      "owned_process_count": 2,
      "reclaimable_bytes": 18234589184,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 298.34439625,
      "owned_rss_bytes": 1177649152,
      "owned_process_count": 2,
      "reclaimable_bytes": 18236145664,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 298.578769916,
      "owned_rss_bytes": 1177681920,
      "owned_process_count": 2,
      "reclaimable_bytes": 18317852672,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 298.811063833,
      "owned_rss_bytes": 1177747456,
      "owned_process_count": 2,
      "reclaimable_bytes": 18312806400,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 299.047131,
      "owned_rss_bytes": 1177780224,
      "owned_process_count": 2,
      "reclaimable_bytes": 18317721600,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 299.273468333,
      "owned_rss_bytes": 1177812992,
      "owned_process_count": 2,
      "reclaimable_bytes": 18313166848,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 299.502785791,
      "owned_rss_bytes": 1177845760,
      "owned_process_count": 2,
      "reclaimable_bytes": 18226905088,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 299.73121649999996,
      "owned_rss_bytes": 1177878528,
      "owned_process_count": 2,
      "reclaimable_bytes": 18225070080,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 299.963414083,
      "owned_rss_bytes": 1177911296,
      "owned_process_count": 2,
      "reclaimable_bytes": 18220630016,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 300.19704874999996,
      "owned_rss_bytes": 1177960448,
      "owned_process_count": 2,
      "reclaimable_bytes": 18218827776,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 300.424748875,
      "owned_rss_bytes": 1178009600,
      "owned_process_count": 2,
      "reclaimable_bytes": 18219024384,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 300.65840366599997,
      "owned_rss_bytes": 1178042368,
      "owned_process_count": 2,
      "reclaimable_bytes": 18232197120,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 300.884669333,
      "owned_rss_bytes": 1178075136,
      "owned_process_count": 2,
      "reclaimable_bytes": 18302795776,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 301.113539916,
      "owned_rss_bytes": 1178107904,
      "owned_process_count": 2,
      "reclaimable_bytes": 18304253952,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 301.34102570799996,
      "owned_rss_bytes": 1178157056,
      "owned_process_count": 2,
      "reclaimable_bytes": 18310758400,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 301.570444125,
      "owned_rss_bytes": 1178206208,
      "owned_process_count": 2,
      "reclaimable_bytes": 18227871744,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 301.795746041,
      "owned_rss_bytes": 1178304512,
      "owned_process_count": 2,
      "reclaimable_bytes": 18213683200,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 302.025484,
      "owned_rss_bytes": 1178435584,
      "owned_process_count": 2,
      "reclaimable_bytes": 18090541056,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 302.257676958,
      "owned_rss_bytes": 1178599424,
      "owned_process_count": 2,
      "reclaimable_bytes": 18088755200,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 302.484650833,
      "owned_rss_bytes": 1178681344,
      "owned_process_count": 2,
      "reclaimable_bytes": 18081021952,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 302.715554833,
      "owned_rss_bytes": 1178877952,
      "owned_process_count": 2,
      "reclaimable_bytes": 18093572096,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 302.942357083,
      "owned_rss_bytes": 1178992640,
      "owned_process_count": 2,
      "reclaimable_bytes": 18166317056,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 303.17709083299997,
      "owned_rss_bytes": 1179140096,
      "owned_process_count": 2,
      "reclaimable_bytes": 18159796224,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 303.403319958,
      "owned_rss_bytes": 1179435008,
      "owned_process_count": 2,
      "reclaimable_bytes": 18164776960,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 303.62903962499996,
      "owned_rss_bytes": 1179549696,
      "owned_process_count": 2,
      "reclaimable_bytes": 18099634176,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 303.856360416,
      "owned_rss_bytes": 1179533312,
      "owned_process_count": 2,
      "reclaimable_bytes": 17844453376,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 304.09130425,
      "owned_rss_bytes": 1179680768,
      "owned_process_count": 2,
      "reclaimable_bytes": 17841471488,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 304.32414895799997,
      "owned_rss_bytes": 1185234944,
      "owned_process_count": 2,
      "reclaimable_bytes": 17781047296,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 304.552011791,
      "owned_rss_bytes": 1185300480,
      "owned_process_count": 2,
      "reclaimable_bytes": 17749180416,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 304.783912791,
      "owned_rss_bytes": 1185398784,
      "owned_process_count": 2,
      "reclaimable_bytes": 17719967744,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 305.015725208,
      "owned_rss_bytes": 1185431552,
      "owned_process_count": 2,
      "reclaimable_bytes": 17928159232,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 305.253386333,
      "owned_rss_bytes": 1185464320,
      "owned_process_count": 2,
      "reclaimable_bytes": 17900503040,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 305.480743125,
      "owned_rss_bytes": 1185529856,
      "owned_process_count": 2,
      "reclaimable_bytes": 17886969856,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 305.71372249999996,
      "owned_rss_bytes": 1185660928,
      "owned_process_count": 2,
      "reclaimable_bytes": 17836146688,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 305.948876,
      "owned_rss_bytes": 1185873920,
      "owned_process_count": 2,
      "reclaimable_bytes": 17811193856,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 306.17635170799997,
      "owned_rss_bytes": 1185890304,
      "owned_process_count": 2,
      "reclaimable_bytes": 17780965376,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 306.405251625,
      "owned_rss_bytes": 1185955840,
      "owned_process_count": 2,
      "reclaimable_bytes": 17747394560,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 306.63988458299997,
      "owned_rss_bytes": 1186037760,
      "owned_process_count": 2,
      "reclaimable_bytes": 17731944448,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 306.876953041,
      "owned_rss_bytes": 1186086912,
      "owned_process_count": 2,
      "reclaimable_bytes": 17717100544,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 307.11177475,
      "owned_rss_bytes": 1186119680,
      "owned_process_count": 2,
      "reclaimable_bytes": 17766400000,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 307.34620691599997,
      "owned_rss_bytes": 1186168832,
      "owned_process_count": 2,
      "reclaimable_bytes": 17721671680,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 307.583110916,
      "owned_rss_bytes": 1186332672,
      "owned_process_count": 2,
      "reclaimable_bytes": 17656758272,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 307.81896591599997,
      "owned_rss_bytes": 1186512896,
      "owned_process_count": 2,
      "reclaimable_bytes": 17500192768,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 308.04111458299997,
      "owned_rss_bytes": 1187184640,
      "owned_process_count": 2,
      "reclaimable_bytes": 17275027456,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 308.270357458,
      "owned_rss_bytes": 1187217408,
      "owned_process_count": 2,
      "reclaimable_bytes": 17262198784,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 308.497608416,
      "owned_rss_bytes": 1187266560,
      "owned_process_count": 2,
      "reclaimable_bytes": 17246928896,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 308.72892620799996,
      "owned_rss_bytes": 1187414016,
      "owned_process_count": 2,
      "reclaimable_bytes": 17226301440,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 308.95789537499996,
      "owned_rss_bytes": 1187446784,
      "owned_process_count": 2,
      "reclaimable_bytes": 17216536576,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 309.18654312499996,
      "owned_rss_bytes": 1187463168,
      "owned_process_count": 2,
      "reclaimable_bytes": 17298194432,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 309.420233916,
      "owned_rss_bytes": 1187643392,
      "owned_process_count": 2,
      "reclaimable_bytes": 17302110208,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 309.64751504099996,
      "owned_rss_bytes": 1187643392,
      "owned_process_count": 2,
      "reclaimable_bytes": 17310498816,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 309.877897916,
      "owned_rss_bytes": 1187790848,
      "owned_process_count": 2,
      "reclaimable_bytes": 17122639872,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 310.10639616599997,
      "owned_rss_bytes": 1187840000,
      "owned_process_count": 2,
      "reclaimable_bytes": 17040949248,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 310.332241791,
      "owned_rss_bytes": 1188003840,
      "owned_process_count": 2,
      "reclaimable_bytes": 17032937472,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 310.559123458,
      "owned_rss_bytes": 1188167680,
      "owned_process_count": 2,
      "reclaimable_bytes": 17025826816,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 310.786487583,
      "owned_rss_bytes": 1191608320,
      "owned_process_count": 2,
      "reclaimable_bytes": 16974741504,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 311.017993,
      "owned_rss_bytes": 1191575552,
      "owned_process_count": 2,
      "reclaimable_bytes": 17122770944,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 311.24736670799996,
      "owned_rss_bytes": 1191690240,
      "owned_process_count": 2,
      "reclaimable_bytes": 17168547840,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 311.478082875,
      "owned_rss_bytes": 1191706624,
      "owned_process_count": 2,
      "reclaimable_bytes": 17155457024,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 311.716718416,
      "owned_rss_bytes": 1191772160,
      "owned_process_count": 2,
      "reclaimable_bytes": 17154441216,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 311.9552865,
      "owned_rss_bytes": 1191870464,
      "owned_process_count": 2,
      "reclaimable_bytes": 17061724160,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 312.193310666,
      "owned_rss_bytes": 1191919616,
      "owned_process_count": 2,
      "reclaimable_bytes": 16634920960,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 312.43314549999997,
      "owned_rss_bytes": 1192116224,
      "owned_process_count": 2,
      "reclaimable_bytes": 16642981888,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 312.667837041,
      "owned_rss_bytes": 1192132608,
      "owned_process_count": 2,
      "reclaimable_bytes": 16643407872,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 312.89492604099996,
      "owned_rss_bytes": 1192165376,
      "owned_process_count": 2,
      "reclaimable_bytes": 16646062080,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 313.131036333,
      "owned_rss_bytes": 1192296448,
      "owned_process_count": 2,
      "reclaimable_bytes": 16648814592,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 313.357330541,
      "owned_rss_bytes": 1192329216,
      "owned_process_count": 2,
      "reclaimable_bytes": 16647618560,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 313.588399833,
      "owned_rss_bytes": 1192345600,
      "owned_process_count": 2,
      "reclaimable_bytes": 16801218560,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 313.824134625,
      "owned_rss_bytes": 1192394752,
      "owned_process_count": 2,
      "reclaimable_bytes": 16826744832,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 314.05175954099997,
      "owned_rss_bytes": 1192509440,
      "owned_process_count": 2,
      "reclaimable_bytes": 16831528960,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 314.282762291,
      "owned_rss_bytes": 1192558592,
      "owned_process_count": 2,
      "reclaimable_bytes": 16752459776,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 314.510129833,
      "owned_rss_bytes": 1192591360,
      "owned_process_count": 2,
      "reclaimable_bytes": 16722575360,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 314.744768875,
      "owned_rss_bytes": 1192853504,
      "owned_process_count": 2,
      "reclaimable_bytes": 16721543168,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 314.968556166,
      "owned_rss_bytes": 1194622976,
      "owned_process_count": 2,
      "reclaimable_bytes": 16691101696,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 315.197954875,
      "owned_rss_bytes": 1194704896,
      "owned_process_count": 2,
      "reclaimable_bytes": 16692461568,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 315.434033166,
      "owned_rss_bytes": 1194704896,
      "owned_process_count": 2,
      "reclaimable_bytes": 16765517824,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 315.67048524999996,
      "owned_rss_bytes": 1194737664,
      "owned_process_count": 2,
      "reclaimable_bytes": 16768696320,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 315.906571041,
      "owned_rss_bytes": 1194754048,
      "owned_process_count": 2,
      "reclaimable_bytes": 16743186432,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 316.142393916,
      "owned_rss_bytes": 1194754048,
      "owned_process_count": 2,
      "reclaimable_bytes": 16694919168,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 316.3758875,
      "owned_rss_bytes": 1194917888,
      "owned_process_count": 2,
      "reclaimable_bytes": 16694919168,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 316.611754541,
      "owned_rss_bytes": 1194983424,
      "owned_process_count": 2,
      "reclaimable_bytes": 16592125952,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 316.842858041,
      "owned_rss_bytes": 1194999808,
      "owned_process_count": 2,
      "reclaimable_bytes": 16593240064,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 317.069815083,
      "owned_rss_bytes": 1195048960,
      "owned_process_count": 2,
      "reclaimable_bytes": 16584507392,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 317.300846375,
      "owned_rss_bytes": 1195163648,
      "owned_process_count": 2,
      "reclaimable_bytes": 16581591040,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 317.53271,
      "owned_rss_bytes": 1195212800,
      "owned_process_count": 2,
      "reclaimable_bytes": 16599564288,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 317.76598370799996,
      "owned_rss_bytes": 1195245568,
      "owned_process_count": 2,
      "reclaimable_bytes": 16671801344,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 318.000846916,
      "owned_rss_bytes": 1195327488,
      "owned_process_count": 2,
      "reclaimable_bytes": 16674242560,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 318.234913291,
      "owned_rss_bytes": 1195114496,
      "owned_process_count": 2,
      "reclaimable_bytes": 16537387008,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 318.46284837499996,
      "owned_rss_bytes": 1195196416,
      "owned_process_count": 2,
      "reclaimable_bytes": 16546758656,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 318.691745625,
      "owned_rss_bytes": 1195311104,
      "owned_process_count": 2,
      "reclaimable_bytes": 16463413248,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 318.91852408299997,
      "owned_rss_bytes": 1195327488,
      "owned_process_count": 2,
      "reclaimable_bytes": 16441212928,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 319.142857791,
      "owned_rss_bytes": 1195393024,
      "owned_process_count": 2,
      "reclaimable_bytes": 16431923200,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 319.37789649999996,
      "owned_rss_bytes": 1195507712,
      "owned_process_count": 2,
      "reclaimable_bytes": 16200515584,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 319.605525666,
      "owned_rss_bytes": 1195556864,
      "owned_process_count": 2,
      "reclaimable_bytes": 16205512704,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 319.839994666,
      "owned_rss_bytes": 1195573248,
      "owned_process_count": 2,
      "reclaimable_bytes": 16287727616,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 320.069295625,
      "owned_rss_bytes": 1195622400,
      "owned_process_count": 2,
      "reclaimable_bytes": 16290250752,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 320.29704212499996,
      "owned_rss_bytes": 1195687936,
      "owned_process_count": 2,
      "reclaimable_bytes": 16292544512,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 320.522434208,
      "owned_rss_bytes": 1195786240,
      "owned_process_count": 2,
      "reclaimable_bytes": 16445095936,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 320.752135833,
      "owned_rss_bytes": 1195802624,
      "owned_process_count": 2,
      "reclaimable_bytes": 16369827840,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 320.98635049999996,
      "owned_rss_bytes": 1195900928,
      "owned_process_count": 2,
      "reclaimable_bytes": 16371810304,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 321.212328541,
      "owned_rss_bytes": 1195950080,
      "owned_process_count": 2,
      "reclaimable_bytes": 16473047040,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 321.446774666,
      "owned_rss_bytes": 1196048384,
      "owned_process_count": 2,
      "reclaimable_bytes": 16466690048,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 321.672280583,
      "owned_rss_bytes": 1196097536,
      "owned_process_count": 2,
      "reclaimable_bytes": 16481271808,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 321.901164125,
      "owned_rss_bytes": 1196163072,
      "owned_process_count": 2,
      "reclaimable_bytes": 16546643968,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 322.12907320799997,
      "owned_rss_bytes": 1196179456,
      "owned_process_count": 2,
      "reclaimable_bytes": 16549232640,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 322.35637716599996,
      "owned_rss_bytes": 1196277760,
      "owned_process_count": 2,
      "reclaimable_bytes": 16557326336,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 322.58149279099996,
      "owned_rss_bytes": 1196359680,
      "owned_process_count": 2,
      "reclaimable_bytes": 16556310528,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 322.808404,
      "owned_rss_bytes": 1196392448,
      "owned_process_count": 2,
      "reclaimable_bytes": 16477208576,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 323.031666,
      "owned_rss_bytes": 1196474368,
      "owned_process_count": 2,
      "reclaimable_bytes": 16468197376,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 323.264412875,
      "owned_rss_bytes": 1196507136,
      "owned_process_count": 2,
      "reclaimable_bytes": 16474406912,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 323.488862,
      "owned_rss_bytes": 1196605440,
      "owned_process_count": 2,
      "reclaimable_bytes": 16394846208,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 323.719332583,
      "owned_rss_bytes": 1207500800,
      "owned_process_count": 2,
      "reclaimable_bytes": 16389652480,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 323.954240166,
      "owned_rss_bytes": 1207533568,
      "owned_process_count": 2,
      "reclaimable_bytes": 16382459904,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 324.187416291,
      "owned_rss_bytes": 1210056704,
      "owned_process_count": 2,
      "reclaimable_bytes": 16457744384,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 324.42090187499997,
      "owned_rss_bytes": 1210056704,
      "owned_process_count": 2,
      "reclaimable_bytes": 16454336512,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 324.654094833,
      "owned_rss_bytes": 1210089472,
      "owned_process_count": 2,
      "reclaimable_bytes": 16464723968,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 324.882720666,
      "owned_rss_bytes": 1211383808,
      "owned_process_count": 2,
      "reclaimable_bytes": 16337092608,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 325.119443375,
      "owned_rss_bytes": 1212317696,
      "owned_process_count": 2,
      "reclaimable_bytes": 16286334976,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 325.346379291,
      "owned_rss_bytes": 1212612608,
      "owned_process_count": 2,
      "reclaimable_bytes": 16283041792,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 325.58667816599996,
      "owned_rss_bytes": 1212612608,
      "owned_process_count": 2,
      "reclaimable_bytes": 16277356544,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 325.815168166,
      "owned_rss_bytes": 1212661760,
      "owned_process_count": 2,
      "reclaimable_bytes": 16273932288,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 326.050911375,
      "owned_rss_bytes": 1212661760,
      "owned_process_count": 2,
      "reclaimable_bytes": 16352886784,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 326.284530958,
      "owned_rss_bytes": 1212678144,
      "owned_process_count": 2,
      "reclaimable_bytes": 16360243200,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 326.524302375,
      "owned_rss_bytes": 1212710912,
      "owned_process_count": 2,
      "reclaimable_bytes": 16345792512,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 326.76163216599997,
      "owned_rss_bytes": 1212710912,
      "owned_process_count": 2,
      "reclaimable_bytes": 16350412800,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 326.998175416,
      "owned_rss_bytes": 1212547072,
      "owned_process_count": 2,
      "reclaimable_bytes": 15925035008,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 327.22486683299996,
      "owned_rss_bytes": 1212547072,
      "owned_process_count": 2,
      "reclaimable_bytes": 15930933248,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 327.46342899999996,
      "owned_rss_bytes": 1212563456,
      "owned_process_count": 2,
      "reclaimable_bytes": 15920971776,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 327.6947605,
      "owned_rss_bytes": 1212596224,
      "owned_process_count": 2,
      "reclaimable_bytes": 15911026688,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 327.928022916,
      "owned_rss_bytes": 1213759488,
      "owned_process_count": 2,
      "reclaimable_bytes": 15914450944,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 328.157402833,
      "owned_rss_bytes": 1213808640,
      "owned_process_count": 2,
      "reclaimable_bytes": 16162537472,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 328.394925416,
      "owned_rss_bytes": 1213808640,
      "owned_process_count": 2,
      "reclaimable_bytes": 16159604736,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 328.63319237499996,
      "owned_rss_bytes": 1217150976,
      "owned_process_count": 2,
      "reclaimable_bytes": 16181166080,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 328.86618445799996,
      "owned_rss_bytes": 1217282048,
      "owned_process_count": 2,
      "reclaimable_bytes": 16182476800,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 329.101390083,
      "owned_rss_bytes": 1217298432,
      "owned_process_count": 2,
      "reclaimable_bytes": 16065937408,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 329.331754666,
      "owned_rss_bytes": 1217314816,
      "owned_process_count": 2,
      "reclaimable_bytes": 16026353664,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 329.561670625,
      "owned_rss_bytes": 1217429504,
      "owned_process_count": 2,
      "reclaimable_bytes": 16022568960,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 329.78766587499996,
      "owned_rss_bytes": 1217445888,
      "owned_process_count": 2,
      "reclaimable_bytes": 16011378688,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 330.016446708,
      "owned_rss_bytes": 1217462272,
      "owned_process_count": 2,
      "reclaimable_bytes": 16028532736,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 330.25061745799997,
      "owned_rss_bytes": 1217478656,
      "owned_process_count": 2,
      "reclaimable_bytes": 16034791424,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 330.486140833,
      "owned_rss_bytes": 1217593344,
      "owned_process_count": 2,
      "reclaimable_bytes": 16103276544,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 330.72173599999996,
      "owned_rss_bytes": 1217609728,
      "owned_process_count": 2,
      "reclaimable_bytes": 16106651648,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 330.953612125,
      "owned_rss_bytes": 1217626112,
      "owned_process_count": 2,
      "reclaimable_bytes": 16102277120,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 331.181995583,
      "owned_rss_bytes": 1217724416,
      "owned_process_count": 2,
      "reclaimable_bytes": 16105750528,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 331.414704416,
      "owned_rss_bytes": 1217724416,
      "owned_process_count": 2,
      "reclaimable_bytes": 16011935744,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 331.648214833,
      "owned_rss_bytes": 1217740800,
      "owned_process_count": 2,
      "reclaimable_bytes": 16013836288,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 331.88470654099996,
      "owned_rss_bytes": 1217757184,
      "owned_process_count": 2,
      "reclaimable_bytes": 16011476992,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 332.111045041,
      "owned_rss_bytes": 1217855488,
      "owned_process_count": 2,
      "reclaimable_bytes": 16012328960,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 332.345541166,
      "owned_rss_bytes": 1217871872,
      "owned_process_count": 2,
      "reclaimable_bytes": 16022716416,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 332.577053916,
      "owned_rss_bytes": 1217888256,
      "owned_process_count": 2,
      "reclaimable_bytes": 16090136576,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 332.8079505,
      "owned_rss_bytes": 1217904640,
      "owned_process_count": 2,
      "reclaimable_bytes": 16105472000,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 333.037847375,
      "owned_rss_bytes": 1217921024,
      "owned_process_count": 2,
      "reclaimable_bytes": 16100196352,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 333.267066,
      "owned_rss_bytes": 1217937408,
      "owned_process_count": 2,
      "reclaimable_bytes": 16102801408,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 333.494362958,
      "owned_rss_bytes": 1218035712,
      "owned_process_count": 2,
      "reclaimable_bytes": 16020357120,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 333.72126725,
      "owned_rss_bytes": 1218052096,
      "owned_process_count": 2,
      "reclaimable_bytes": 16008806400,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 333.957534458,
      "owned_rss_bytes": 1218068480,
      "owned_process_count": 2,
      "reclaimable_bytes": 16009576448,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 334.191576833,
      "owned_rss_bytes": 1218150400,
      "owned_process_count": 2,
      "reclaimable_bytes": 15997239296,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 334.41954683299997,
      "owned_rss_bytes": 1218183168,
      "owned_process_count": 2,
      "reclaimable_bytes": 16004726784,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 334.649698,
      "owned_rss_bytes": 1218183168,
      "owned_process_count": 2,
      "reclaimable_bytes": 16100966400,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 334.884038875,
      "owned_rss_bytes": 1218215936,
      "owned_process_count": 2,
      "reclaimable_bytes": 16093741056,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 335.11305141599996,
      "owned_rss_bytes": 1218314240,
      "owned_process_count": 2,
      "reclaimable_bytes": 16086941696,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 335.34517074999997,
      "owned_rss_bytes": 1218330624,
      "owned_process_count": 2,
      "reclaimable_bytes": 16085467136,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 335.57354866599997,
      "owned_rss_bytes": 1218347008,
      "owned_process_count": 2,
      "reclaimable_bytes": 16015327232,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 335.810721166,
      "owned_rss_bytes": 1218396160,
      "owned_process_count": 2,
      "reclaimable_bytes": 15995289600,
      "swapins": 44114297,
      "swapouts": 77536098
    },
    {
      "elapsed_seconds": 336.044588541,
      "owned_rss_bytes": 1218478080,
      "owned_process_count": 2,
      "reclaimable_bytes": 19635732480,
      "swapins": 44114297,
      "swapouts": 77536098
    }
  ],
  "passed": false,
  "classification": "One exact original long request with explicit source constants, then at most one complete MTP-plus-vision attempt after a successful 60-second no-VM preflight. V287 omitted BIG_MEMORY from its extracted shell header: long request failed argument parsing with exit64 and did not load a model; that attempt and its MTP swap-in failure are preserved. Same original native binary, workloads, original no-VM and absolute-resource criteria. Governor is already actually passed and not repeated. This is not a full-suite pass.",
  "child_pid": 37282,
  "exit_code": 1,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 26274168832,
    "swapins": 44114297,
    "swapouts": 77536098,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   636274.\nPages active:                                 664965.\nPages inactive:                               462197.\nPages speculative:                            203556.\nPages throttled:                                   0.\nPages wired down:                             330747.\nPages purgeable:                                3360.\n\"Translation faults\":                    15631136282.\nPages copy-on-write:                       751931357.\nPages zero filled:                       21536337607.\nPages reactivated:                        3535894930.\nPages purged:                               73726268.\nFile-backed pages:                            964014.\nAnonymous pages:                              366704.\nPages stored in compressor:                  1971442.\nPages occupied by compressor:                 785032.\nDecompressions:                           1191592623.\nCompressions:                             1508836240.\nPageins:                                  7784049349.\nPageouts:                                   11146759.\nSwapins:                                    44114297.\nSwapouts:                                   77536098.\nPages tagged:                                 176544.\nPages tagged resident:                        115058.\nPages tagged compressed:                       61486.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6924.\nPages tag-storage free:                         3068.\nPages tag-storage non-tag pageable:            88304.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9724416.\nTagged compressions:                        11490243.\nTagged decompressions:                      10581267.\n"
  },
  "remaining_owned_members": [],
  "owned_groups": [
    37282
  ],
  "remaining_owned_members_after_cleanup": [],
  "elapsed_seconds": 336.342164416,
  "child_exit_code": 1,
  "after_cleanup": {
    "page_bytes": 16384,
    "reclaimable_bytes": 26273857536,
    "swapins": 44114297,
    "swapouts": 77536098,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   636222.\nPages active:                                 665085.\nPages inactive:                               462206.\nPages speculative:                            203575.\nPages throttled:                                   0.\nPages wired down:                             330748.\nPages purgeable:                                3360.\n\"Translation faults\":                    15631141949.\nPages copy-on-write:                       751932105.\nPages zero filled:                       21536340638.\nPages reactivated:                        3535894930.\nPages purged:                               73726268.\nFile-backed pages:                            964047.\nAnonymous pages:                              366819.\nPages stored in compressor:                  1971361.\nPages occupied by compressor:                 784989.\nDecompressions:                           1191592719.\nCompressions:                             1508836240.\nPageins:                                  7784049354.\nPageouts:                                   11146759.\nSwapins:                                    44114297.\nSwapouts:                                   77536098.\nPages tagged:                                 176544.\nPages tagged resident:                        115058.\nPages tagged compressed:                       61486.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6924.\nPages tag-storage free:                         2938.\nPages tag-storage non-tag pageable:            88434.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9724416.\nTagged compressions:                        11490243.\nTagged decompressions:                      10581267.\n"
  }
}
````

## /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v289/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v289/stdout.txt

SHA-256 `8210bf8de5b085cf8fa4495855bff6e3d1df1511e457b30f47f1c2a1eccf9b05`; 527 bytes.

````text
== exact original long prompt and 10 GB memory gate ==
FAIL  --memory-gb 10 sampled footprint and RSS under target on the long prompt without swap (details: /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v289/verification/check-1.txt)
PASS  long-context answer still correct (sparse indexer active)
== whole MTP: fresh quiet preflight ==
PASS pre-launch 60-second no-VM observation (not an MTP result)
PASS  speculative decode gates (determinism, state integrity, accept sanity)
passed 2, failed 1
````

## /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v289/verification/check-1.txt

SHA-256 `58093046872b74fec69a5f95a999dd9e47d3bb514e004a9eeb9a79df7b682587`; 306 bytes.

````text
--memory-gb 10 sampled footprint and RSS under target on the long prompt without swap
python3 Tools/memory_gate.py /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v289/verification/longmem.json --limit-gb 10
{"passed": false, "error": "swap activity during generator interval"}
````

## /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v289/verification/check-2.txt

SHA-256 `72e7f5743736b6fdce00b193cc8ec1d5c2626b6aee37e345919046d051874a56`; 462 bytes.

````text
long-context answer still correct (sparse indexer active)
python3 Tools/long_context_gate.py /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v289/verification/longmem.json /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v289/verification/longmem.txt --expected SEVENTEEN --minimum-prompt-tokens 7000 --maximum-output-tokens 16
{"passed": true, "prompt_tokens": 7972, "output_tokens": 4, "completed": true}
````

## /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v289/verification/longmem.json

SHA-256 `84aedfb1c8e331736b35b47e5699b1e40ddee8877e36e2c42a380f16907b4f7a`; 47816 bytes.

````text
{"effective_expected_peak_gb":8.9994969600000001,"effective_mtp":false,"effective_pool_slots":961,"effective_prefill_chunk":256,"effective_prefill_cost_gb":0.33279999999999998,"encode_seconds":0.038628958999999997,"experimental_memory_family":false,"extra_expert_workspace_gb":0,"extra_read_scope_allowance_gb":0,"extra_router_cache_gb":0,"launch_seconds":96.650128249999995,"load_seconds":8.4700264579999995,"optimizations":{"adaptiveSpeculation":false,"boundedDraftTail":false,"boundedIndexer":false,"boundedOutputQueue":true,"boundedPLE":false,"boundedSweepRows":false,"cachedRouterWeights":false,"compactIndexerRaw":false,"compactMTPRow":true,"compactNgramRows":false,"compactScopeFrontier":false,"compactStateWindows":true,"compiledNormFinish":false,"completePromptCheckpoint":true,"contiguousSlotWrites":false,"cpuSlotWrites":false,"deduplicateImages":false,"demandedPrefillOutput":false,"denseExpertLookup":false,"denseIndexerBypass":false,"deviceSamplerDraw":true,"directReadHandles":false,"disjointSweepOutput":false,"fusedGDNProjection":false,"fusedGDNRecording":false,"fusedRoPE":true,"incrementalIndexer":false,"indexerBlockTopK":false,"layerExpertWorkspace":false,"layerLocalFloorCache":false,"ngramLookahead":false,"ngramRingOrder":false,"overlapResidentExperts":false,"overlapSharedExpert":false,"prefixCheckpointTokens":256,"readScopeTokens":0,"resolvedRuntimeBudget":false,"responsiveGovernor":true,"reuseFirstMTPEntry":false,"routerTopK":false,"selectedTextAttention":false,"sharedRoPE":true,"skipUnusedFinalForward":true,"sparsePoolPins":false,"tailAwarePrefill":false,"terminalLastQuery":false,"terminalPrefillPruning":false,"valueOnlySamplerThreshold":true,"visionAttentionPadding":0,"visionQueryTile":0,"wordSlotWrites":false,"workspacePiecewiseWrites":false,"workspaceTokenTile":256},"output_ids":[896,6571,36,923],"plan":{"availability_clamped":false,"context_qualification":false,"device_available_gb":25.600000000000001,"device_ram_gb":51.5,"device_working_set_gb":40.200000000000003,"est_prefill_s_at_max_context":385.50588235294038,"est_prefill_tok_s":85,"est_warm_tok_s":4.0041666666666664,"expected_peak_gb":9,"experts_per_layer_cached":20,"fully_resident":false,"implementation_context_limit":65536,"max_context_tokens":32768,"max_prefill_wait_minutes":30,"max_ram_percent":70,"memory_ledger":{"active_capacity_bytes":905969664,"additional_active_bytes":0,"expected_peak_bytes":8999496960,"fixed_bytes":5300000000,"long_context_reserve_bytes":0,"mtp_resident_bytes":0,"planning_margin_bytes":1000000000,"pool_bytes":2656972800,"prefill_bytes":332800000,"retained_capacity_bytes":369985536,"retained_recurrent_bytes":339738624,"version":1,"vision_resident_bytes":0},"model_context_limit":262144,"mtp":false,"mtp_context_limit":65536,"pool_gb":2.7000000000000002,"pool_slots":961,"prefill_chunk":256,"prefill_wait_scope":"accepted_request_to_first_model_token","prefix_cache_max_tokens":13382,"runtime_prefix_cache_enabled":true,"source":"--memory-gb","target_gb":10,"vision":true,"vision_charged_gb":0,"vision_context_limit":65536,"vision_resident_gb":0.90000000000000002,"vision_resident_reserved":false},"prompt_ids":[248045,846,198,760,17593,7189,421,279,33439,10286,369,4890,6571,36,923,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,4558,14162,25,1092,369,279,33439,10286,30,21134,440,799,3299,13,248046,198,248045,74455,198,248068,271,248069,271],"sampling":{"greedy":true,"requested_max_tokens":"16","seed":"default"},"schema_version":1,"stats":{"abortedReadScopes":0,"acceptedDrafts":0,"adaptiveDraftDepths":[],"adaptivePlainTokens":0,"allocatedSequenceBytes":226492416,"cachedRouterBytes":0,"completePromptHits":0,"completePromptStores":0,"contextArithmetic":"standard","decodeForwardPasses":4,"decodeIOSeconds":0.29937378700000006,"decodeLocalVictims":0,"decodeModelTokens":4,"decodeReadBytes":3359232000,"decodeRecords":1215,"decodeScatterSeconds":0.003655160999999998,"decodeSeconds":0.69427945800000002,"decodeSlotCPUBatches":0,"decodeSlotScatterBatches":192,"decodeSlotSliceBatches":0,"decodeSlotSliceRuns":0,"decodeSlotWordBatches":0,"decodeSlotWordBuffers":0,"decodeTokens":4,"draftedTokens":0,"draftSeconds":0,"embeddingCachedPayloadBytes":84960,"embeddingCachedRows":59,"embeddingRowHits":920,"embeddingRowMisses":59,"embeddingRowsEnabled":true,"encodedImages":0,"expertHitRate":0.3671875,"finishReason":"stop","firstTextSeconds":87.447422375000002,"firstTokenSeconds":87.447215584000006,"fusedGDNProjectionsScheduled":0,"fusedRoPERotationsScheduled":1536,"generatorSystemAfter":{"lowPowerModeEnabled":false,"thermalState":"nominal"},"generatorSystemBefore":{"lowPowerModeEnabled":false,"thermalState":"nominal"},"generatorVMAfter":{"reclaimableBytes":21703737344,"swapins":44114297,"swapouts":77536098},"generatorVMBefore":{"reclaimableBytes":20295286784,"swapins":44114293,"swapouts":77536098},"imageEncodeSeconds":1.67e-07,"interTokenSeconds":[0.24938845900000001,0.164094875,0.14644758399999999],"lifetimeRSSPeakBytes":3112632320,"memoryPressureCancelled":false,"mlxActiveEndBytes":5722671768,"mlxCacheEndBytes":537366943,"mlxPeakMemoryGB":6.2833759359999997,"ngramCachedRows":1192,"ngramCachePayloadBytes":762880,"ngramLookaheadDiscarded":0,"ngramLookaheadRows":0,"ngramLookaheadWaitSeconds":0,"ngramPrefetchSeconds":0.023520331000000005,"ngramRowHits":24,"ngramRowMisses":40,"packedGDNProjectionLayers":0,"packedGDNProjectionPayloadBytes":0,"peakMemoryGB":7.1703301039999996,"physicalFootprintEndBytes":7170330104,"prefillComputeKeyExtents":[256,512,768,1024,1280,1536,1792,2048,2304,2560,2816,3072,3328,3584,3840,4096,4352,4608,4864,5120,5376,5632,5888,6144,6400,6656,6912,7168,7424,7680,7936,7972],"prefillComputePasses":[256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,36],"prefillComputeQueryRows":[256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,36],"prefillGPUWaitSeconds":7.991926872000028,"prefillIOSeconds":57.042525114999968,"prefillLocalVictims":0,"prefillMLXActiveBytes":5722067096,"prefillMLXCacheBytes":534818886,"prefillPasses":[256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,36],"prefillPhysicalFootprintBytes":7166381560,"prefillReadBytes":830955110400,"prefillRecords":300548,"prefillRowSortSeconds":0.049846767000000083,"prefillScatterSeconds":0.0071924609999999998,"prefillSeconds":87.440820583999994,"prefillSlotCPUBatches":0,"prefillSlotSliceBatches":0,"prefillSlotWordBatches":0,"prefillTokens":7972,"prefixCheckpointErrors":0,"prefixCheckpointForks":0,"prefixCheckpointRefusals":1,"prefixCheckpointStores":1,"prefixSkippedImages":0,"preparationSeconds":0.038660874999999997,"promptTokens":7972,"queueSeconds":4.1250000000000003e-06,"reconciledHeadTokens":0,"reconciliationSeconds":0,"requestSeconds":88.179624541999999,"residentExpertJoins":0,"residentExpertJoinSeconds":0,"residentExpertPrelaunches":0,"reusedHeadTokens":0,"reusedImageFeatures":0,"reusedPrefixTokens":0,"ropeTableBuilds":61,"ropeTableHits":1043,"sampledFootprint":{"intervalMilliseconds":20,"peakBytes":7184993784,"samples":4408},"sampleSeconds":0.0015476660000000001,"sharedExpertPrelaunches":0,"smallPrefillSweeps":0,"terminalMoERowsSkipped":0,"terminalQueryRowsSkipped":0,"tokenCallbackSeconds":0.00040645900000000002,"verifyPasses":0,"verifySeconds":0,"visionQueryTile":0,"visionQueryTileCalls":0},"text":"SEVENTEEN"}
````

## /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v289/verification/longmem.txt

SHA-256 `2e9fad2e271de488677d33bde2dd661601317f58b374941e44c1d077da46ebe3`; 10 bytes.

````text
SEVENTEEN
````

## /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v289/verification/mtp.txt

SHA-256 `be61d75814cba9a1df154dc04ac9b2fdbb841e101ed0f91ae7808b7869003692`; 3052 bytes.

````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (27.7 GB reclaimable now), 40.2 GB Metal working set
  target: 12.0 GB total for this process
  cache:  ~23 of 512 experts per layer  (1091 global slots = 3.0 GB pool)
  expect: ~11.0 GB peak, ~5 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  mtp:    draft head on — speculative decode (1.6 GB resident, charged above)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 14829 tokens across 4 conversations (~0.7 GB), so a follow-up turn re-prefills only what is new
engine ready in 0.9s: expert cache ~23/512 per layer (1091 global slots = 3.0 GB), mtp draft head on, eos [248044, 248046]
PASS  determinism p1 (48 tokens)
PASS  speculation ran p1
  info  p1: plain vs spec shared prefix 48/48 (identical)
PASS  determinism p2 (48 tokens)
PASS  speculation ran p2
  info  p2: plain vs spec shared prefix 48/48 (identical)
PASS  determinism p3 (48 tokens)
PASS  speculation ran p3
  info  p3: plain vs spec shared prefix 6/48
  info  vision+mtp prompt: 721 tokens, 1 image(s), placeholder id 248056
PASS  vision speculation deterministic (48 tokens)
PASS  vision speculation ran
  info  vision plain vs spec shared prefix 40/48
  info  overall accept rate 85.4%
PASS  accept rate is not degenerate (>5%)
  info  recording pass vs batched: 0.0000% of spread (top-1 same); rollback state vs plain: ssm 6.50e-02, conv 4.31e-02, ple 0.00e+00 relative (re-chunk control: ssm 1.05e-01, conv 7.06e-02, ple 1.11e-02); one more step: 3.416% vs control 3.312% (bound 9.935%, top-1 same)
PASS  recording verify pass matches the batched pass (<= 0.1% of spread)
PASS  rollback state stays inside 3x the re-chunk band (ssm, conv, ple)
PASS  rollback then one step stays inside the prefill-rechunk band
PASS  turn-2 reused the speculative turn-1 state
  info  turn-2 logits from the reused speculative state: 2.225% of spread vs a cold rebuild (prefill-rechunk control 3.044%, bound 9.133%), top-1 same; reused 64 of 71 tokens after a 48-token turn 1 (26 verify passes)
PASS  reused speculative state stays inside the prefill-rechunk band
PASS  turn-1 speculation ran
PASS  whole MTP check memory interval fits the priced target without swap
MTP CHECK PASS
MTP CHECK MEMORY {"lifetime_rss_peak_bytes":5263081472,"memory_validated":true,"physical_footprint_end_bytes":10332854032,"sampled_peak_bytes":10333721952,"samples":8557,"swapins_after":44114297,"swapins_before":44114297,"swapouts_after":77536098,"swapouts_before":77536098,"target_gb":12}
````

## /tmp/slotstream-optimization-execution/candidate-consumer-v288/launch-refusal.json

SHA-256 `c1b18fe8807dc9803f442317cc4c4c264f2ba7a66d3b3394d98e044c78243615`; 310 bytes.

````text
{
  "captured_at": "2026-09-07T09:54:28.557353+00:00",
  "launched": false,
  "protocol_created": false,
  "reason": "Remaining interval minus30second cleanup was below the already declared360second minimum; wrapper raised before preflight/lock or compiler launch. Original unrun protocol/source preserved."
}
````

## /tmp/slotstream-optimization-execution/long-memory-recovery-v290/checks.sh

SHA-256 `ba6289051a8845cb7bdedeffa360c306df6d092fc85b8c8b37344738d59356ec`; 3513 bytes.

````text
#!/bin/bash
set -euo pipefail
BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
VERIFY_OUT=${SLOTSTREAM_VERIFY_OUT:-.build/verification-$(date +%Y%m%d-%H%M%S)}
mkdir -p "$VERIFY_OUT"
export BIN SLOTSTREAM_TEST_BINARY="$BIN"
CHECK_INDEX=0
safety_before() {
  python3 - "$1" <<'PYSAFE'
import sys
sys.path.insert(0, 'Tools')
from prefill_bench import preflight
preflight(float(sys.argv[1]))
PYSAFE
}
run_model() { safety_before 13 || return 2; "$@"; }
# Keep the selected path out of evaluated snippets, including substitutions.
run_binary() { "$BIN" "$@"; }
PASS=0; FAIL=0
check() {
  CHECK_INDEX=$((CHECK_INDEX+1))
  local record="$VERIFY_OUT/check-$CHECK_INDEX.txt"
  printf '%s\n%s\n' "$1" "$2" > "$record"
  if [[ "$2" == "run_binary "* ]]; then safety_before 13 || return 2; fi
  if eval "$2" >>"$record" 2>&1; then echo "PASS  $1"; PASS=$((PASS+1))
  else echo "FAIL  $1 (details: $record)"; FAIL=$((FAIL+1)); fi
}

SMALL_MEMORY=8.1
BIG_MEMORY=10
ECBIG=960


python3 - <<'QUIET'
import sys,time
sys.path.insert(0,'Tools')
from prefill_bench import vm_snapshot
from optimization_readiness import pressure_snapshot,require_normal
start=vm_snapshot()
for _ in range(30):
 time.sleep(2);now=vm_snapshot();require_normal(pressure_snapshot())
 if now['swapins']!=start['swapins'] or now['swapouts']!=start['swapouts']:
  raise SystemExit('long-memory pre-launch quiet interval had VM activity; long-memory request not launched')
print('PASS pre-launch 60-second no-VM observation (not a generation result)')
QUIET

python3 - <<'PYEOF' > /Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v290/verification/long.txt
f = ["Routine maintenance was performed on the north corridor lighting system. ",
     "Inventory counts were reconciled against the quarterly ledger totals. ",
     "The east wing humidity sensors reported nominal values throughout the day. "]
b = "The archive records that the vault combination is SEVENTEEN. "
for i in range(700):
    b += f[i % 3]
print(b + "\n\nQuestion: what is the vault combination? Answer with one word.")
PYEOF
# Use the normal non-thinking chat template. A bare raw prompt can spend the
# entire output allowance in reasoning, which is invalid recall evidence.
run_model "$BIN" run --prompt-file /Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v290/verification/long.txt --max-tokens 16 --greedy --memory-gb $BIG_MEMORY \
  --sample-footprint --stats-json /Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v290/verification/longmem.json \
  2>/Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v290/verification/longmem.err > /Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v290/verification/longmem.txt
check "--memory-gb $BIG_MEMORY sampled footprint and RSS under target on the long prompt without swap" \
      "python3 Tools/memory_gate.py /Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v290/verification/longmem.json --limit-gb $BIG_MEMORY"
check "long-context answer still correct (sparse indexer active)" \
      "python3 Tools/long_context_gate.py /Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v290/verification/longmem.json /Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v290/verification/longmem.txt --expected SEVENTEEN --minimum-prompt-tokens 7000 --maximum-output-tokens 16"



echo "passed $PASS, failed $FAIL"
[ "$FAIL" -eq 0 ]
````

## /tmp/slotstream-optimization-execution/long-memory-recovery-v290/protocol.json

SHA-256 `80bfa62a4f94ac5b81d5e6b59843460eca5c2507807ccaf11d2239c3e32d8cc7`; 37849 bytes.

````text
{
  "classification": "One exact original 7972-token long request after a successful 60-second no-VM preflight. Same V280 native binary, original generated prompt, 16-token allowance, 10 GB target, no-VM and physical/RSS criteria. V283 and V289 swap-excluded long attempts remain preserved. MTP and governor have actual successful independent checks and are not repeated. No consumer compilation launched because its six-minute time preflight refused. This is not a full-suite pass.",
  "frozen_at": "2026-09-07T09:54:28.919616+00:00",
  "deadline_utc": "2026-09-07T10:00:00Z",
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/read-failure-candidate-build-v280/candidate/slotstream",
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
        "Sources/Slotstream/Context.swift": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0",
        "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
        "Sources/Slotstream/ContextMemory.swift": "c59d3ea2700eef685182b374934aa10e997f8c045990bd7439d6dd3314f46865",
        "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
        "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
        "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
        "Sources/Slotstream/Engine.swift": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
        "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
        "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
        "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
        "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
        "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "7036e275990695568a948e279505cc03495da21d8b5f81a5f9160843d59c0c0d",
        "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
        "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
        "Sources/Slotstream/Layers.swift": "1522eb6f8ca71a0712ed9d918696b2175f96fe8a48b8447289a2a1966cd6b120",
        "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
        "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
        "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
        "Sources/Slotstream/Model.swift": "a4cea913e0f438a69e72672d42046bf904717700d8753c1449e5e48b419033a6",
        "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
        "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
        "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
        "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
        "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
        "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
        "Sources/Slotstream/Optimizations.swift": "450d07494a5cc12568c82cb1a330ce1613e30a0e93efdc97597d687c36d8fc95",
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
        "Sources/Slotstream/RequestControl.swift": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "7363b347ae2df47ff005cb414722434d8d67783ea85a228d68f3b829153f5f8e",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "7f56163e8e1883da54874917ca11c239f65806586b8409a9f39a5f9516f2df98",
        "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
        "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "f4b9c59e6abc340e8f15b2d523296ab74fcd269cc39c67f514cb18f41a1f6a96",
        "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
        "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
        "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "71b49d3edc91c35572e0e40937860f8112c5ac56b9816ce870e189d4223d641c",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3c61121e89651dd6bb0ca41cef832612a2f1601e55cab3adebb4e0489a3da1a6",
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
      "source_archive_sha256": "56c60764434a75913ddb46d91ed7b38c66a6969ea46d5c1a6159ea55dd8143b4",
      "binary_sha256": "eba9ee894aba4722d082fda7d39192339d0299fe7af264a624dd4209d1e648cf",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "native_prerequisites": [
    {
      "stage": "native/combined-plain",
      "status": "passed",
      "assertions": 242
    },
    {
      "stage": "native/combined-mtp",
      "status": "passed",
      "assertions": 256
    },
    {
      "stage": "native/read-failure-serving",
      "status": "passed",
      "assertions": 522
    }
  ],
  "native_contract_sha256": "15333ded4180d6b19a50a7b8bb7d3d1e33cfa95dcdce7fbf1e7c755a318ab9da",
  "wrapper_sha256": "a657341d566c46b3e587b704705e27ba08b5803cd15c2b017e2d34743acfd32d",
  "policy": {
    "startup_reclaimable_bytes": 21000000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 17500000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 301,
    "stop_on_new_swapouts": false
  },
  "environment": {
    "SLOTSTREAM_TEST_BINARY": "/Users/carlos/Projects/slotstream/.build/optimization/read-failure-candidate-build-v280/candidate/slotstream",
    "SLOTSTREAM_VERIFY_OUT": "/Users/carlos/Projects/slotstream/.build/optimization/long-memory-recovery-v290/verification"
  },
  "command": [
    "bash",
    "/tmp/slotstream-optimization-execution/long-memory-recovery-v290/checks.sh"
  ],
  "extracted_script_sha256": "ba6289051a8845cb7bdedeffa360c306df6d092fc85b8c8b37344738d59356ec",
  "source_verification_sha256": "ed2485271adf39581150a38fd56b117e9c82dba7b8e1bed857f7fbeb39991065",
  "historical_counterexample": "/Users/carlos/Projects/slotstream/.build/optimization/full-verification-v283/manifest.json",
  "drivers": {
    "Tools/all_hit_replay.py": "24401912f3fd8b2e70105c5095c993c131b6ffbe27add38f9268c9e1dc0ed9a1",
    "Tools/api_generation.py": "cdb5b81e785b5e96e4f81e4fa5e2fe48a3b32f20b149952a9ee7f9a5c68b2eaf",
    "Tools/api_generation_test.py": "d2bd5494d9a73ec76806f6aad9344e76554fa8777721f4dd525f9478fe4f535b",
    "Tools/api_robustness.sh": "a7397ac2f5df3a7eb8f7e1578daef51124c1c7fdabd0526c13518b8048984a96",
    "Tools/api_test.sh": "77bd216be56f3a309cff380c649af47edaff2d1d17e9dd9ad4f10fd489664c11",
    "Tools/brain_gates.sh": "7f32151567f0e64f8ed9619e5551bc7716aaf24be6b19fc0c62496b1dd44df2b",
    "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
    "Tools/build_identity_test.py": "04facecff6ee3b65c261678131e5c3b4e64e5aff630b7df00c7414439e2776ec",
    "Tools/cache_policy_confirmation.py": "a2d0108f30b64b4838064ba0d450e49a28c8aca43ad0a41dcd1c30760e475748",
    "Tools/cache_policy_probe.py": "93ce0ec7cb98cd16cca46509089864d6267c3e080a2172615beadd3f69632a81",
    "Tools/cachesim.py": "0f6c304c69f88d49b1e3e699a0230d4c90de937baffc02aec52bf38429004f38",
    "Tools/claims_gate.py": "12a76b03bdf78ca0d71ea00a757684d19a137582b432875d10a670f583dcbced",
    "Tools/compute_islands.py": "9c25400b28ad425bba9e752138a967882d573432e6093d4b898da6dca266b985",
    "Tools/consumer_smoke.sh": "5e039b3f03844f26df5ccd223edf5bee4320cd670b60dcd1b62a2953c18a7c70",
    "Tools/consumer_smoke_test.py": "0fd6aea920c671d3bece420013a9ebc526ed9dd48d55bcdb8f83f6e7badc6bf1",
    "Tools/context_acceptance.py": "6791b61a99763d5b0ecfc510aef669fac982fb7cd5ff6dfc78fe61b5ea7864ba",
    "Tools/context_acceptance_test.py": "9a57bf61a50f2a3187ecc887110c77b3a7d161eea9dc7b7a8abe368fbee21aeb",
    "Tools/context_contracts_test.py": "635c6dcfabd89a0868ceacf00fe305d165fa8720ebf71b8fd147c70838ccbc1c",
    "Tools/context_gates.py": "712a328c906011b2cd07dff0b5225e5b45089b6c6effd4b1a151c90db3d587e4",
    "Tools/context_overflow_probe.py": "3bf2633e583898d2c60ed8630409ccf314d352352ecf342bcb72d0705fde52c8",
    "Tools/context_proxy.py": "825f99c7a16677398bc8c04f3ace63dc98f18fa98c17b9265ac1b79a35b11203",
    "Tools/context_proxy.swift": "360731036283558552032b2fc28ad2956d94b0683fb4f1a2dfec40ac5e11bea8",
    "Tools/context_qualification.py": "094b567ccc21613444cfd0edf098967bb758af42652be8ba70762ae313cbbf34",
    "Tools/context_qualification_checks.py": "4f26ef66a0444d5d7f13b37464bcc25f21ceb9c0e3c71f0bc038f128667583d9",
    "Tools/context_resource_gates.py": "b1fb297f645d231250915ce7467856c36221c31885fd9426364637597d57b003",
    "Tools/context_window_matrix.py": "b24e904c0d64b61e08ad33779505445c51f2a00de8e556f14167042390495104",
    "Tools/context_window_matrix_test.py": "37f59dd7674175cf53e87f2bb2663a27c732eed5f9382508b578e96fa9cdef52",
    "Tools/coverage-floor.json": "6eca5d16f69f3bb1a4cd88d1036fa074d1232ed8d8d630cda80c91c309c0b828",
    "Tools/coverage.sh": "bc52a65b95dadbd15391f9a636287611f1117e8decf56e14e189da2d7abd90b6",
    "Tools/coverage_ratchet.py": "9bf8c570b83d6a89acd1b005d1ed051bb8125c5281424c0b294d3b46cd753a06",
    "Tools/coverage_ratchet_test.py": "ed632f76757cc7dfb346de92d1c8b00fcbd6596b4363d093beebbfc67af43a93",
    "Tools/dbmd_install.sh": "8b892df4f2232db0fac42b8bf1585371e652d13c9cd9094c8190e3f957e58e1e",
    "Tools/debug0_ref.py": "930d258ed12c6d60e7db4506a25677e4fe60e8da07cddb244c7740ebb66ca6f1",
    "Tools/e2e_release.sh": "b4762272eca921614d46ec6a4d4bcc28e939bcd22639f7e9bbf5fca0ceaedca7",
    "Tools/e2e_release_test.py": "acc7930f33ce45c93ef89f7568e8c380e4a6cfc453a64fcc93a2c84287b84152",
    "Tools/expert_layout_probe.py": "a76bcba5750c58d8aad0188569c3c53e9721476009034c802a7f21f9d35d3ec2",
    "Tools/expert_layout_probe_test.py": "e6e9363cc3afc9081cb9f00ff7adc6fc77fc1c1a12b9580b32f0cd27c1b32f9d",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860",
    "Tools/fixtures/context-acceptance-v1.json": "7bca4c4ad9a8ea9d0b7496e83e769c92eac901d8d11fc4ce059b07b83c256e55",
    "Tools/fixtures/context-default-v1.json": "c6e55a5b0ab8a4f143b99c8ec0691d528cf3b3f9b5a21d14ab493c886b053558",
    "Tools/fixtures/optimization/acceptance.txt": "32e15bd0df7b057f31b74f94a24c179d4374c19ddc54b77d590e330710fc8f78",
    "Tools/fixtures/optimization/code-brief-development.txt": "722e4b8140be24e5345e37aa4ca2ad6c15c04a984cf132848557d8261ba969c2",
    "Tools/fixtures/optimization/code.txt": "bc0fc77db83ec16a8100b57d5d06d68ddd7aecf3ceedc8a410699418086124c8",
    "Tools/fixtures/optimization/floor-cache-confirmation.txt": "3f9ff23888e4e55e84e79ecf17f9ba347d32e58840a5fadbad291ed782203668",
    "Tools/fixtures/optimization/indexer-code-development.txt": "ae15397152799641172b585529c10fda7faa313875b504e34858e69472b95c68",
    "Tools/fixtures/optimization/prose-distinct-tail.txt": "d13b427927e9266ae8a9949b85a704ff6439df50aea54bfd7b5bf46f12b7c784",
    "Tools/fixtures/optimization/prose.txt": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b",
    "Tools/fixtures/optimization/qualification/actual-default-one-token.json": "8481bffb4721fbd594eca609506308480e7979a486c327732cba6ff138daf26b",
    "Tools/fixtures/optimization/qualification/complete-repeat.json": "9b8308d23621b55ae70dfb34258571ed00a97c9ea2932127aa787d438085ba6e",
    "Tools/fixtures/optimization/qualification/distinct-tail.json": "7d80ab65e1ed821e24922c050afc4ff24b83f9e3a2b560383efd4e7868aad59e",
    "Tools/fixtures/optimization/qualification/mtp-resource.json": "5a0c57424e2097b5ec7b4199dd9ae28d40e24f6c4eef24d13098f3ce8d652613",
    "Tools/fixtures/optimization/qualification/sampled-short.json": "ec97a77e98417def8f7489b5fd58ded65790659e15ebe6f4d2328c8688d76a7a",
    "Tools/fixtures/optimization/qualification/short-one.json": "5c736b2eec31378f0b3d2beb64d20561569ce8dfd765e363afde72b0755278a9",
    "Tools/fixtures/optimization/qualification/soak.json": "0b79f271e4dbaabe77802a54a125c371ee4519848c2e01e5019bd5d8a36a065b",
    "Tools/fixtures/optimization/qualification/unique-prose.json": "6831b8f47138d175f28ac9716bacaa8c937515a970df709393004bff84a45c35",
    "Tools/fixtures/optimization/qualification/unique-with-retention.json": "0b2593dab6a12e10226dd94d60c43d40b085160b2c23680b79545d7fe41dbb2d",
    "Tools/fixtures/optimization/runtime-budget-confirmation.txt": "055164841f47a5aa6185d82f09611bea5f7723d37298d9bd371de15452e29dda",
    "Tools/fixtures/optimization/short.txt": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
    "Tools/fixtures/optimization/vision/prompt.txt": "ea487dbfa3274ba2ed440cc62cd740d05c8219de8b4588856d8f16413d1bbd09",
    "Tools/fx_gates.sh": "035f425d0becb017f9c8e2fd71bdabb52e61f17d69c10ef5194688bb8f20a20e",
    "Tools/fx_scenarios.py": "f8418efaac463b0969f9518f909aafcfb30c9732606b4bcfc811b45a49a66d3e",
    "Tools/gateway_client_gate.mjs": "7a5b605d18d6044fa4d038d169ace4b6541222a3d98977f2b773e204c34864dd",
    "Tools/gdn_profile.py": "f4483f1c78ffc9f70439688f3336abd41768458a87117950fc1b4f3e2879923e",
    "Tools/hermes_integration_gate.py": "517c4b7fbdc5a24bedb7924cb57051ec65b58d44d0c0df40e7119ab44e54b0f6",
    "Tools/indexer_score_probe.py": "b51796a075f6391b301cbe78eda3e82ac9378e16823e9ca48f0f1f97b166e8b0",
    "Tools/indexer_score_probe_test.py": "1cf32f1db801a0813c634888e0a942f6c3dc9abe92fbc538ce7772eb7891df1d",
    "Tools/installer_gates.sh": "ffcb88381decda386da186d82365b635a32fc2e01b8973fbddd6e39464154936",
    "Tools/installer_gates_binary_test.py": "a0017f16f6676bc0098e4cf01508d658611cbd0ffa6baf0ad490d7b90a2839d1",
    "Tools/llms_full.sh": "3f2c9694f274697a2eb63288e1ea7b0e774e82ffad1a9a9483f4ef2c9e7cbcef",
    "Tools/long_context_gate.py": "b7422f009eaf24b079c87cc3ed847840ea941e4a141d5357fc240ad5945a54ee",
    "Tools/memory_gate.py": "9d09d3aade7b1e1f9180f3779a651480f2d7b6ab194065820831c136c3c6cc9c",
    "Tools/monotonic_plan.py": "3ab76df40092ccab549a92ae2ef5ae457f7ad3ab8adc8512ee749ef1c05355bd",
    "Tools/mtp_convert.py": "22f58712346b67a35cdc0d7a4da45a665335ae9382e104156aff16e91b7b053d",
    "Tools/ngram_cache_probe.py": "01e295b269d94350730c46a59edf7a62b562c9c45f6456c2d9947862835a57e7",
    "Tools/ngram_cache_probe_test.py": "05141ddb547bdd870fbc2e4d971caa2e1a84e121b9416b0da87ca84c739d9bb3",
    "Tools/ngram_lookahead_bench.py": "9492467ff3a03154da642f51848a9cbaedc02509f76ae78d3533868bbfd1d02f",
    "Tools/openai_tools_gate.py": "28f571e0f774f9717d6469a926083b17b3ec6b607cea1d72ec84d76912832357",
    "Tools/optimization_build.py": "dee7d43c4fd70aac9145cfe33ea9d3d446e803fbca5dbf54e07d577d27deca6f",
    "Tools/optimization_build_test.py": "cfa7367792c17d4d8617ac2e16161043471714297355bfa0b0de508defea3c95",
    "Tools/optimization_campaign.py": "ae49f185713b26f0999b77126df0c480dda017f09f9b315a020b1693bf52d1c4",
    "Tools/optimization_campaign_test.py": "7d35ef74a8184224b2ec8aabb29f94c4f416c27bdae2d51ee7c794404e36745d",
    "Tools/optimization_check.py": "61d050207c1074131de4f5917bcfcc50373f9d105688ba0185c19febaa6f1462",
    "Tools/optimization_component.py": "cbdab6f194dbb8acdee13d5efc484aae4dd7aa3d8431d9033d77f1bd9785904a",
    "Tools/optimization_prerequisites_test.py": "215ab0cead0daafd4d95f469254870159c66b9d719997410838cea83c151d41b",
    "Tools/optimization_readiness.py": "56a654ab367b7eca3ee6ab0270641fb2af70ce2bd4a242b8036da506229f283c",
    "Tools/optimization_readiness_test.py": "6c963a9aec3be52975da24328a965b3778259a6372c691b3e6c9f32b92e63016",
    "Tools/optimization_results.py": "d4b9b0d6e82dd5d38f043c1b681cede8cfc2c764bcf80b9031e8438b51fece9c",
    "Tools/optimization_results_test.py": "7cc829aa16726312d115dad41692010a19c5637f6206bc481fd721eae99c15e1",
    "Tools/optimization_serial_build.py": "f33cba39a2a427b76353c57075128a9278a7cb3f22d3f086d7be8c25179bf6cf",
    "Tools/optimization_serial_build_test.py": "b6b21d18f2a96522f034b246aa4be3b43f19f11cc178ea401992c54c519bc54a",
    "Tools/optimization_soak.py": "61ea2ddff2c8bb72ea6bdb226c96cdfe69ae086ab9bf8384f06f2a80f3907f0e",
    "Tools/optimization_soak_test.py": "3b61d9e63a6c5fbe79b618324b283826d51ab3085582200df4e276cb1befd0be",
    "Tools/packed_layout_build.py": "2f780a584bd0d5b461cfbf3cfc32b992ebc3480afb6bf78cb167af9ca8fba8ab",
    "Tools/parity_ref.py": "cb938f6215f1433bbc6eef2b8cc04a8a9cf9d5953f487347649637fa911abab6",
    "Tools/planner_gates.sh": "f869506fa2c7c4aa73ecf279a52b84103227a451a7a2e319d489eff30b150b29",
    "Tools/prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "Tools/prefill_bench.sh": "68a6695ab67766626394637dcdaaee1db53fc06077a4ed7310e8a006bfa5de66",
    "Tools/prefill_bench_test.py": "fa263527173e3d139e868b12e19f9417478380466094b35e0726381cbe5245b7",
    "Tools/process_cleanup_checks.py": "2de6d823a4850662fda621cbe2df43aa869731e40530e7f286c9a2f289e6a982",
    "Tools/projections.py": "90a02090829c0dae88d69846f8a0f55bd2b039e3f12c549aa58b175f4e842355",
    "Tools/pull-bench-linux/Package.swift": "b6e6c707ff0c8d57fbece8e0b553283dfe06ec7449ff327141e96cd21262d06e",
    "Tools/pull-bench-linux/main.swift": "a296bb751261010d46b1d44532f736fac3a22adb7b80be897d547a4809d74c95",
    "Tools/pull_bench_linux.sh": "2062f832627a33edc8103559c74e647b6aeb1145e0043d3ab310c2205de304eb",
    "Tools/quality_probe.sh": "cfa2ae2995acd9dd0d416ff2d9e71ec538ab0b259ebbb30324c4ad28c6fca3ba",
    "Tools/reference/config.json": "0da22a8ed4323fbe969bf982aeb054743b315206791f28ef74a309c707080ba5",
    "Tools/reference/generation_config.json": "e70c136c1b78ddc1fb0905bac8e733a4dc448d4f852a5dd75143fffc70be550e",
    "Tools/reference/make_mtp_fixture.py": "7d54481d25ffdacb7ef52b3ef345a817d4c0783e6340224edebe587a9d8f0d52",
    "Tools/reference/model.safetensors.index.json": "072cc2c60b8af6cce82a387f62e39ca88754c3a6fccae0816dd21bb89d27470d",
    "Tools/reference/mtp_ref.py": "f28827ac0409fe58b9c255f16add5ecb00b17a2310a3521d75a677f2d4a84f24",
    "Tools/reference/qwen4_exp.py": "6fae4ec0decbf77ca4a4571de683bc5580ec75e84325ecb432dfcd2fc81df75e",
    "Tools/reference/tensor_shapes.json": "302d9926b8d1770c1a11f1fdd9d199b136865117f427dcb29e512c7d6dd4c780",
    "Tools/rope_component.py": "f8e56f6d33c98cc50a64efe67b5c184bb0a4ebdff26ca4aa3e34f5434fb202ca",
    "Tools/run_model.py": "00ea3727aed92fcc17df1e16f4284f8840145558cf776e08429eb1884eb7b8c0",
    "Tools/sampler_gates.sh": "7e781d7593224973597906e7031c7ab143ab4dff540dd4bf86542e52cb7ed144",
    "Tools/sampler_gates_test.py": "89f1a34df9dbb37e904c1b32e15e72cd9fc5c01a955097abaeb2ef6c2d435fc7",
    "Tools/sampler_ref.py": "faa87e6db26853b275322d18cab1994430315e19783b984ac28e1cdaf34395c3",
    "Tools/selected_attention_probe.py": "e4e5a4a4980f4f20dddca7c8a7633c3d4b66dfc2034a4a83f1b791e3f5497328",
    "Tools/serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
    "Tools/slotbench.py": "d27b4d18f75f423443f1b4a8dd4da50965fa1885d531029f0c7f0baecdf24262",
    "Tools/slotbench2.py": "0d38017db9e74141df23664083a0c520458e3a531d5d865ad19ab6e23bdd2711",
    "Tools/slotbench3.py": "7518329fcb4217760689f5c8bc5cbd268c5220ca0a38f2289af9c7d84c8e2e05",
    "Tools/slotpack/DownloadHarness.swift": "16a1d1e76139fa3dc7ca0a29716f9d866b0085b0238eaa7a16b361af38682901",
    "Tools/slotpack/ManifestChecks.swift": "5aafa4ccc88f314ca53df842d3b81b67074a8bb2c4e89d2d55a9617aaf285166",
    "Tools/slotpack/TransferProbe.swift": "5714c073ab24581c412bae3c131cb04bbd84c899281c350117e3cbfa4a6e4031",
    "Tools/slotpack/checks.py": "59a598a3d77b9fa38117e4437fd11aa52982fcb833000a62c25b2e990d4165b3",
    "Tools/slotpack/cli_checks.py": "a67f5d06d09a713051fea673562a95367e76f8cfb4ac8fe3b1592781c39470d7",
    "Tools/slotpack/coverage.py": "c53cb1fd611ab6fc690db0fc1db1b816e4d0e5379420874545b8760bfd9fe644",
    "Tools/slotpack/download_checks.py": "7958ef42e29b4885319186a4bccd6e5dd3e2b20cbea9cbbf971554bf353657ef",
    "Tools/slotpack/embed.py": "9c0d98858b54353584ab92abd45b85ed3894e0004e38f1e2945d8ab6d6ee8c94",
    "Tools/slotpack/fetch_build_inputs.py": "a6f5b52aad619d6aef58e527ca42d7743e1e45c568dd2287c7f80800c18c31c1",
    "Tools/slotpack/full_pull.py": "b925415dae87b6f240d875e67fe5a9684534e6d96dd953424082fe80c54ecb96",
    "Tools/slotpack/memory_checks.py": "e0494906ac1a8673ee41ec0f60e5971626afc958e4caa49dc29090187e1447f0",
    "Tools/slotpack/pack.py": "1bdaef49bb324f37bb64c7c453f9ec724c9f96c3d1f579ff6f3e9417e1d510cd",
    "Tools/slotpack/public_probe.py": "33dc5a003b4f59356e208f4330370c905a51fb515ddccf27a9dae471cd76d10a",
    "Tools/slotpack/publish_hf.py": "e9a7a07198bd3eddc1dadd94d8dd8729b8528282992c049eb00dcbcf93cf190e",
    "Tools/slotpack/publish_hf_checks.py": "76a3f41abe9b16239a9d32e6fb4b50f4f8e323076d04803a31f02f4162aa587c",
    "Tools/slotpack/publish_r2.py": "cdd39ae06637800dc02e84c948c5b2c50c2c9abec71673f299dfb8d1112b9684",
    "Tools/slotpack/raw_checks.py": "772f4132088582fa9642f3dd86f800be3c8f005e9145c827b6692ee4f6386d94",
    "Tools/star_history.py": "58801509a122439429f675295041e35aae89504a638ff31eb76fe97979d7152f",
    "Tools/static_gates.sh": "e82bf5d6b35bf63a75506fbab3e5282e09b4efe86541ebd5bdf9c5d8eb7ce0b7",
    "Tools/static_gates_binary_test.py": "aa07dfd295130d52aaca72810ac7ce65bd701940c06c844a6b7dd7c82f4a9b33",
    "Tools/trace_convert.py": "8ea22dda841860f0f829203c4ece5f68c515c13a39f2c6122bc309a2150f0079",
    "Tools/trace_routers.py": "32ff38f4f0f02d9679dcd16fc57f64694836416baf666075151e9f208be23da6",
    "Tools/verify.sh": "ed2485271adf39581150a38fd56b117e9c82dba7b8e1bed857f7fbeb39991065",
    "Tools/verify_binary_test.py": "739bf1d03823ad77f0f7663af5b223474c5518148a1e51065d168a7109b50762",
    "Tools/verify_corrections.py": "2cf6f0818a3ab39aac948ba78b5f5e3ac5dfc1b8037bb7f48caa7c16fa198a0b",
    "Tools/vision_attention_probe.py": "1575d36927dba5f4ff52d1549a96d93e7c6c190c2c5e8d94644628c672fbe346",
    "Tools/vision_capacity_gate.py": "851a598f05d34cbaf597e56a593de3bf2a9f492a069d77d93ba6f5a7e0a42040",
    "Tools/vision_capacity_gate_test.py": "4cb266cbc6859ba053529f0ddb792199dc2a4e35af798a4d9cd636a123122412",
    "Tools/vision_qualification.py": "5deff2ad8469d8a54b477262d701a8b386395d265df029c37bd7ee6b8812b165",
    "Tools/vision_ref.py": "fa62575c947392f990841e6ac90656737eb67edb000ab369d7b7a0f66a05ef29",
    "Tools/vision_serving.py": "6afd42ebefd87619d3ccb6dc96172366483ea94f7e86ecc0215a7bdf3c6b76fb"
  },
  "limits": "No build, app closure, default activation or paid service. Existing verified local model only. Source/binary/Metal pinned; files saved before exit."
}
````

## /tmp/slotstream-optimization-execution/long-memory-recovery-v290/run.py

SHA-256 `a657341d566c46b3e587b704705e27ba08b5803cd15c2b017e2d34743acfd32d`; 5908 bytes.

````text
from pathlib import Path
import datetime,json,os,re,signal,sys,time
ROOT=Path('/Users/carlos/Projects/slotstream');P=Path(__file__).parent
sys.path.insert(0,str(ROOT/'Tools'))
from prefill_bench import digest,preflight,vm_snapshot
from serve_bench import competing_jobs,verified_build
from optimization_readiness import pressure_snapshot,require_normal
from optimization_serial_build import guarded_run
import optimization_campaign as campaign
B=ROOT/'.build/optimization/read-failure-candidate-build-v280/candidate/slotstream'
OUT=ROOT/'.build/optimization/long-memory-recovery-v290'
# The reservation must be granted by the peer before invocation; the argument
# binds a concrete handback deadline and never authorizes extending it.
DEADLINE=datetime.datetime.fromisoformat(sys.argv[1].replace('Z','+00:00')).timestamp()
remaining=int(DEADLINE-time.time()-30)
if remaining<240:raise RuntimeError('exact long-memory recovery requires at least four reserved minutes')
POLICY={'startup_reclaimable_bytes':21_000_000_000,'minimum_live_reclaimable_bytes':3_000_000_000,
 'maximum_owned_rss_bytes':17_500_000_000,'sample_interval_seconds':.2,
 'maximum_build_seconds':min(3600,remaining),'stop_on_new_swapouts':False}
NATIVE_PACKET=ROOT/'.build/optimization/read-failure-candidate-campaign-v281'
native=campaign.status(NATIVE_PACKET)['stages'][:3]
assert [r['stage'] for r in native]==['native/'+n for n in campaign.NATIVE] and all(r['status']=='passed' for r in native)
S={'classification':'One exact original 7972-token long request after a successful 60-second no-VM preflight. Same V280 native binary, original generated prompt, 16-token allowance, 10 GB target, no-VM and physical/RSS criteria. V283 and V289 swap-excluded long attempts remain preserved. MTP and governor have actual successful independent checks and are not repeated. No consumer compilation launched because its six-minute time preflight refused. This is not a full-suite pass.',
 'frozen_at':datetime.datetime.now(datetime.timezone.utc).isoformat(),'deadline_utc':sys.argv[1],
 'build':verified_build(B),'native_prerequisites':native,'native_contract_sha256':digest(NATIVE_PACKET/'qualification-contract.json'),'wrapper_sha256':digest(Path(__file__)),'policy':POLICY,
 'environment':{'SLOTSTREAM_TEST_BINARY':str(B),'SLOTSTREAM_VERIFY_OUT':str(OUT/'verification')},
 'command':['bash',str(P/'checks.sh')],
 'extracted_script_sha256':digest(P/'checks.sh'),
 'source_verification_sha256':digest(ROOT/'Tools/verify.sh'),
 'historical_counterexample':str(ROOT/'.build/optimization/full-verification-v283/manifest.json'),
 'drivers':{str(f.relative_to(ROOT)):digest(f) for f in sorted((ROOT/'Tools').rglob('*')) if f.is_file() and f.suffix in ['.sh','.py','.mjs','.json','.swift','.txt'] and '__pycache__' not in f.parts},
 'limits':'No build, app closure, default activation or paid service. Existing verified local model only. Source/binary/Metal pinned; files saved before exit.'}
P.joinpath('protocol.json').write_text(json.dumps(S,indent=2)+'\n')
OUT.mkdir(exist_ok=False);started=time.monotonic();r={'passed':False,'protocol_sha256':digest(P/'protocol.json')}
def interrupted(number,_frame):raise KeyboardInterrupt(f'full qualification interrupted by signal{number}')
signal.signal(signal.SIGINT,interrupted);signal.signal(signal.SIGTERM,interrupted)
saved={k:v for k,v in os.environ.items() if k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
with (OUT/'pressure.samples.jsonl').open('x') as observations:
 def snapshot():
  state=vm_snapshot();pressure=pressure_snapshot();observations.write(json.dumps({'seconds':time.monotonic()-started,'vm':state,'pressure':pressure})+'\n');observations.flush();require_normal(pressure);return state
 try:
  r['before']=preflight(21);snapshot();assert not competing_jobs()
  assert (ROOT/'.venv31/bin/python').exists()
  for k in saved:os.environ.pop(k,None)
  os.environ.update(S['environment'])
  with (OUT/'stdout.txt').open('w') as stdout,(OUT/'stderr.txt').open('w') as stderr:
   result=guarded_run(S['command'],cwd=ROOT,stdout=stdout,stderr=stderr,record_path=OUT/'memory.json',snapshot=snapshot,policy=POLICY,classification=S['classification'])
  r['exit_code']=result.returncode
  report=(OUT/'stdout.txt').read_text();summary=re.findall(r'^passed (\d+), failed (\d+)$',report,re.M)
  r['summary']=summary;r['skips']=re.findall(r'^SKIP.*$',report,re.M);r['failures']=re.findall(r'^FAIL.*$',report,re.M)
  r['passed']=result.returncode==0 and len(summary)==1 and int(summary[0][0])>0 and summary[0][1]=='0' and not r['skips'] and not r['failures']
 except BaseException as e:r['error']=f'{type(e).__name__}: {e}'
 finally:
  for k in list(os.environ):
   if k.startswith(('SLOTSTREAM_','SS_DEBUG')):os.environ.pop(k,None)
  os.environ.update(saved)
  r['elapsed_seconds']=time.monotonic()-started
  # Primary result is durable before independent restoration checks.
  (OUT/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
  for n,f in {'after':vm_snapshot,'pressure':pressure_snapshot,'candidate_unchanged':lambda:verified_build(B)==S['build'],
   'drivers_unchanged':lambda:all(digest(ROOT/n)==h for n,h in S['drivers'].items()) and digest(P/'checks.sh')==S['extracted_script_sha256'],
   'remaining_jobs':competing_jobs,'model_lock_free':lambda:bool(preflight(0))}.items():
   try:r[n]=f()
   except BaseException as e:r.setdefault('cleanup_errors',{})[n]=f'{type(e).__name__}: {e}'
  r['within_reservation']=time.time()<=DEADLINE
  r['passed']=bool(r['passed'] and not r.get('cleanup_errors') and r.get('candidate_unchanged') and r.get('drivers_unchanged')
   and not r.get('remaining_jobs') and r.get('model_lock_free') and r.get('pressure',{}).get('level')==1 and r['within_reservation'])
  (OUT/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({k:v for k,v in r.items() if k not in ['before','after']}),flush=True)
raise SystemExit(0 if r['passed'] else 1)
````

## /tmp/slotstream-optimization-execution/verification-recovery-v287/checks.sh

SHA-256 `272f013f31c2f463e9080f7340942d6b0db67d55557573bd8d372e20213d904c`; 4708 bytes.

````text
#!/bin/bash
set -eo pipefail
BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
VERIFY_OUT=${SLOTSTREAM_VERIFY_OUT:-.build/verification-$(date +%Y%m%d-%H%M%S)}
mkdir -p "$VERIFY_OUT"
export BIN SLOTSTREAM_TEST_BINARY="$BIN"
CHECK_INDEX=0
safety_before() {
  python3 - "$1" <<'PYSAFE'
import sys
sys.path.insert(0, 'Tools')
from prefill_bench import preflight
preflight(float(sys.argv[1]))
PYSAFE
}
run_model() { safety_before 13 || return 2; "$@"; }
# Keep the selected path out of evaluated snippets, including substitutions.
run_binary() { "$BIN" "$@"; }
PASS=0; FAIL=0
check() {
  CHECK_INDEX=$((CHECK_INDEX+1))
  local record="$VERIFY_OUT/check-$CHECK_INDEX.txt"
  printf '%s\n%s\n' "$1" "$2" > "$record"
  if [[ "$2" == "run_binary "* ]]; then safety_before 13 || return 2; fi
  if eval "$2" >>"$record" 2>&1; then echo "PASS  $1"; PASS=$((PASS+1))
  else echo "FAIL  $1 (details: $record)"; FAIL=$((FAIL+1)); fi
}

echo "== actual governor recovery =="
safety_before 16
DRILL_LOG="$VERIFY_OUT/elastic-drill.txt"
DRILL_STATUS=0
"$BIN" elastic-drill --slots 1000 --max-memory-gb 13 >"$DRILL_LOG" 2>&1 || DRILL_STATUS=$?
DRILL=$(sed -nE '/^ELASTIC DRILL (PASS|FAIL|SKIP)(:|$)/p' "$DRILL_LOG")
if [ "$DRILL_STATUS" -ne 0 ]; then
  DRILL="ELASTIC DRILL FAIL: exit $DRILL_STATUS (details: $DRILL_LOG)"
elif [[ "$DRILL" == *$'\n'* ]]; then
  DRILL="ELASTIC DRILL FAIL: multiple final statuses (details: $DRILL_LOG)"
elif [ -z "$DRILL" ]; then
  DRILL="ELASTIC DRILL FAIL: missing final status (details: $DRILL_LOG)"
fi
case "$DRILL" in
  "ELASTIC DRILL PASS:"*) echo "PASS  $DRILL"; PASS=$((PASS+1)) ;;
  "ELASTIC DRILL SKIP:"*) echo "FAIL  required full gate skipped: $DRILL"; FAIL=$((FAIL+1)) ;;
  *)      echo "FAIL  $DRILL"; FAIL=$((FAIL+1)) ;;
esac
echo "== complete MTP including original vision =="
  safety_before 15
  if "$BIN" mtp-check --memory-gb 12 --mtp on --vision on --image Tools/assets/vision_test/secret1.jpg >"$VERIFY_OUT/mtp.txt" 2>&1 \
      && python3 - "$VERIFY_OUT/mtp.txt" <<'PYMTP'
import json,sys
from pathlib import Path
text=Path(sys.argv[1]).read_text()
assert 'PASS  vision speculation deterministic' in text
assert 'PASS  vision speculation ran' in text
assert 'SKIP' not in text and 'MTP CHECK PASS' in text
rows=[json.loads(line.removeprefix('MTP CHECK MEMORY ')) for line in text.splitlines() if line.startswith('MTP CHECK MEMORY ')]
assert len(rows)==1 and rows[0]['memory_validated'] is True
PYMTP
  then
    echo "PASS  speculative decode gates (determinism, state integrity, accept sanity)"; PASS=$((PASS+1))
  else
    echo "FAIL  speculative decode gates"; tail -5 "$VERIFY_OUT/mtp.txt"; FAIL=$((FAIL+1))
  fi
echo "== original long-prompt memory and recall =="
python3 - <<'PYEOF' > /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v287/verification/long.txt
f = ["Routine maintenance was performed on the north corridor lighting system. ",
     "Inventory counts were reconciled against the quarterly ledger totals. ",
     "The east wing humidity sensors reported nominal values throughout the day. "]
b = "The archive records that the vault combination is SEVENTEEN. "
for i in range(700):
    b += f[i % 3]
print(b + "\n\nQuestion: what is the vault combination? Answer with one word.")
PYEOF
# Use the normal non-thinking chat template. A bare raw prompt can spend the
# entire output allowance in reasoning, which is invalid recall evidence.
run_model "$BIN" run --prompt-file /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v287/verification/long.txt --max-tokens 16 --greedy --memory-gb $BIG_MEMORY \
  --sample-footprint --stats-json /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v287/verification/longmem.json \
  2>/Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v287/verification/longmem.err > /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v287/verification/longmem.txt
check "--memory-gb $BIG_MEMORY sampled footprint and RSS under target on the long prompt without swap" \
      "python3 Tools/memory_gate.py /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v287/verification/longmem.json --limit-gb $BIG_MEMORY"
check "long-context answer still correct (sparse indexer active)" \
      "python3 Tools/long_context_gate.py /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v287/verification/longmem.json /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v287/verification/longmem.txt --expected SEVENTEEN --minimum-prompt-tokens 7000 --maximum-output-tokens 16"


echo "passed $PASS, failed $FAIL"
[ "$FAIL" -eq 0 ]
````

## /tmp/slotstream-optimization-execution/verification-recovery-v287/extraction-correction.json

SHA-256 `ffcea0f6543d7ce2305b5e02446989d66ce6ea36f3b064ba45a7213d6238f6f0`; 373 bytes.

````text
{
  "long_gate_launched": false,
  "long_cli_exit": 64,
  "cause": "Extracted header omitted original BIG_MEMORY=10, leaving --memory-gb with no value. MTP and governor use literals and retain their separate actual results. V289 copies the source constants exactly and enables nounset.",
  "successor": "/tmp/slotstream-optimization-execution/verification-recovery-v289"
}
````

## /tmp/slotstream-optimization-execution/verification-recovery-v287/protocol.json

SHA-256 `91ccfcbfc3320f39ad113f922883cafa83f56178387d25d9366da5adc3fc587b`; 37800 bytes.

````text
{
  "classification": "Targeted recovery of the three failed V283 gates, extracted from corrected verify.sh: one actual governor drill, one complete MTP-plus-vision gate, and the exact original long-prompt memory/recall gate. Same native binary and original inner no-VM/absolute-resource criteria. One attempt per gate; preserves prior failed full-suite result; this is not a full-suite pass. VM recorded by outer ownership guard.",
  "frozen_at": "2026-09-07T09:42:13.929811+00:00",
  "deadline_utc": "2026-09-07T10:00:00Z",
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/read-failure-candidate-build-v280/candidate/slotstream",
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
        "Sources/Slotstream/Context.swift": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0",
        "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
        "Sources/Slotstream/ContextMemory.swift": "c59d3ea2700eef685182b374934aa10e997f8c045990bd7439d6dd3314f46865",
        "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
        "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
        "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
        "Sources/Slotstream/Engine.swift": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
        "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
        "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
        "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
        "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
        "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "7036e275990695568a948e279505cc03495da21d8b5f81a5f9160843d59c0c0d",
        "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
        "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
        "Sources/Slotstream/Layers.swift": "1522eb6f8ca71a0712ed9d918696b2175f96fe8a48b8447289a2a1966cd6b120",
        "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
        "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
        "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
        "Sources/Slotstream/Model.swift": "a4cea913e0f438a69e72672d42046bf904717700d8753c1449e5e48b419033a6",
        "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
        "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
        "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
        "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
        "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
        "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
        "Sources/Slotstream/Optimizations.swift": "450d07494a5cc12568c82cb1a330ce1613e30a0e93efdc97597d687c36d8fc95",
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
        "Sources/Slotstream/RequestControl.swift": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "7363b347ae2df47ff005cb414722434d8d67783ea85a228d68f3b829153f5f8e",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "7f56163e8e1883da54874917ca11c239f65806586b8409a9f39a5f9516f2df98",
        "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
        "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "f4b9c59e6abc340e8f15b2d523296ab74fcd269cc39c67f514cb18f41a1f6a96",
        "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
        "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
        "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "71b49d3edc91c35572e0e40937860f8112c5ac56b9816ce870e189d4223d641c",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3c61121e89651dd6bb0ca41cef832612a2f1601e55cab3adebb4e0489a3da1a6",
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
      "source_archive_sha256": "56c60764434a75913ddb46d91ed7b38c66a6969ea46d5c1a6159ea55dd8143b4",
      "binary_sha256": "eba9ee894aba4722d082fda7d39192339d0299fe7af264a624dd4209d1e648cf",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "native_prerequisites": [
    {
      "stage": "native/combined-plain",
      "status": "passed",
      "assertions": 242
    },
    {
      "stage": "native/combined-mtp",
      "status": "passed",
      "assertions": 256
    },
    {
      "stage": "native/read-failure-serving",
      "status": "passed",
      "assertions": 522
    }
  ],
  "native_contract_sha256": "15333ded4180d6b19a50a7b8bb7d3d1e33cfa95dcdce7fbf1e7c755a318ab9da",
  "wrapper_sha256": "1b3674da8ecb034f58e8e2a1adcbe4c6da2eac5e3daf345a11100aa225d7d41e",
  "policy": {
    "startup_reclaimable_bytes": 21000000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 17500000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 1036,
    "stop_on_new_swapouts": false
  },
  "environment": {
    "SLOTSTREAM_TEST_BINARY": "/Users/carlos/Projects/slotstream/.build/optimization/read-failure-candidate-build-v280/candidate/slotstream",
    "SLOTSTREAM_VERIFY_OUT": "/Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v287/verification"
  },
  "command": [
    "bash",
    "/tmp/slotstream-optimization-execution/verification-recovery-v287/checks.sh"
  ],
  "extracted_script_sha256": "272f013f31c2f463e9080f7340942d6b0db67d55557573bd8d372e20213d904c",
  "source_verification_sha256": "ed2485271adf39581150a38fd56b117e9c82dba7b8e1bed857f7fbeb39991065",
  "historical_counterexample": "/Users/carlos/Projects/slotstream/.build/optimization/full-verification-v283/manifest.json",
  "drivers": {
    "Tools/all_hit_replay.py": "24401912f3fd8b2e70105c5095c993c131b6ffbe27add38f9268c9e1dc0ed9a1",
    "Tools/api_generation.py": "cdb5b81e785b5e96e4f81e4fa5e2fe48a3b32f20b149952a9ee7f9a5c68b2eaf",
    "Tools/api_generation_test.py": "d2bd5494d9a73ec76806f6aad9344e76554fa8777721f4dd525f9478fe4f535b",
    "Tools/api_robustness.sh": "a7397ac2f5df3a7eb8f7e1578daef51124c1c7fdabd0526c13518b8048984a96",
    "Tools/api_test.sh": "77bd216be56f3a309cff380c649af47edaff2d1d17e9dd9ad4f10fd489664c11",
    "Tools/brain_gates.sh": "7f32151567f0e64f8ed9619e5551bc7716aaf24be6b19fc0c62496b1dd44df2b",
    "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
    "Tools/build_identity_test.py": "04facecff6ee3b65c261678131e5c3b4e64e5aff630b7df00c7414439e2776ec",
    "Tools/cache_policy_confirmation.py": "a2d0108f30b64b4838064ba0d450e49a28c8aca43ad0a41dcd1c30760e475748",
    "Tools/cache_policy_probe.py": "93ce0ec7cb98cd16cca46509089864d6267c3e080a2172615beadd3f69632a81",
    "Tools/cachesim.py": "0f6c304c69f88d49b1e3e699a0230d4c90de937baffc02aec52bf38429004f38",
    "Tools/claims_gate.py": "12a76b03bdf78ca0d71ea00a757684d19a137582b432875d10a670f583dcbced",
    "Tools/compute_islands.py": "9c25400b28ad425bba9e752138a967882d573432e6093d4b898da6dca266b985",
    "Tools/consumer_smoke.sh": "5e039b3f03844f26df5ccd223edf5bee4320cd670b60dcd1b62a2953c18a7c70",
    "Tools/consumer_smoke_test.py": "0fd6aea920c671d3bece420013a9ebc526ed9dd48d55bcdb8f83f6e7badc6bf1",
    "Tools/context_acceptance.py": "6791b61a99763d5b0ecfc510aef669fac982fb7cd5ff6dfc78fe61b5ea7864ba",
    "Tools/context_acceptance_test.py": "9a57bf61a50f2a3187ecc887110c77b3a7d161eea9dc7b7a8abe368fbee21aeb",
    "Tools/context_contracts_test.py": "635c6dcfabd89a0868ceacf00fe305d165fa8720ebf71b8fd147c70838ccbc1c",
    "Tools/context_gates.py": "712a328c906011b2cd07dff0b5225e5b45089b6c6effd4b1a151c90db3d587e4",
    "Tools/context_overflow_probe.py": "3bf2633e583898d2c60ed8630409ccf314d352352ecf342bcb72d0705fde52c8",
    "Tools/context_proxy.py": "825f99c7a16677398bc8c04f3ace63dc98f18fa98c17b9265ac1b79a35b11203",
    "Tools/context_proxy.swift": "360731036283558552032b2fc28ad2956d94b0683fb4f1a2dfec40ac5e11bea8",
    "Tools/context_qualification.py": "094b567ccc21613444cfd0edf098967bb758af42652be8ba70762ae313cbbf34",
    "Tools/context_qualification_checks.py": "4f26ef66a0444d5d7f13b37464bcc25f21ceb9c0e3c71f0bc038f128667583d9",
    "Tools/context_resource_gates.py": "b1fb297f645d231250915ce7467856c36221c31885fd9426364637597d57b003",
    "Tools/context_window_matrix.py": "b24e904c0d64b61e08ad33779505445c51f2a00de8e556f14167042390495104",
    "Tools/context_window_matrix_test.py": "37f59dd7674175cf53e87f2bb2663a27c732eed5f9382508b578e96fa9cdef52",
    "Tools/coverage-floor.json": "6eca5d16f69f3bb1a4cd88d1036fa074d1232ed8d8d630cda80c91c309c0b828",
    "Tools/coverage.sh": "bc52a65b95dadbd15391f9a636287611f1117e8decf56e14e189da2d7abd90b6",
    "Tools/coverage_ratchet.py": "9bf8c570b83d6a89acd1b005d1ed051bb8125c5281424c0b294d3b46cd753a06",
    "Tools/coverage_ratchet_test.py": "ed632f76757cc7dfb346de92d1c8b00fcbd6596b4363d093beebbfc67af43a93",
    "Tools/dbmd_install.sh": "8b892df4f2232db0fac42b8bf1585371e652d13c9cd9094c8190e3f957e58e1e",
    "Tools/debug0_ref.py": "930d258ed12c6d60e7db4506a25677e4fe60e8da07cddb244c7740ebb66ca6f1",
    "Tools/e2e_release.sh": "b4762272eca921614d46ec6a4d4bcc28e939bcd22639f7e9bbf5fca0ceaedca7",
    "Tools/e2e_release_test.py": "acc7930f33ce45c93ef89f7568e8c380e4a6cfc453a64fcc93a2c84287b84152",
    "Tools/expert_layout_probe.py": "a76bcba5750c58d8aad0188569c3c53e9721476009034c802a7f21f9d35d3ec2",
    "Tools/expert_layout_probe_test.py": "e6e9363cc3afc9081cb9f00ff7adc6fc77fc1c1a12b9580b32f0cd27c1b32f9d",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860",
    "Tools/fixtures/context-acceptance-v1.json": "7bca4c4ad9a8ea9d0b7496e83e769c92eac901d8d11fc4ce059b07b83c256e55",
    "Tools/fixtures/context-default-v1.json": "c6e55a5b0ab8a4f143b99c8ec0691d528cf3b3f9b5a21d14ab493c886b053558",
    "Tools/fixtures/optimization/acceptance.txt": "32e15bd0df7b057f31b74f94a24c179d4374c19ddc54b77d590e330710fc8f78",
    "Tools/fixtures/optimization/code-brief-development.txt": "722e4b8140be24e5345e37aa4ca2ad6c15c04a984cf132848557d8261ba969c2",
    "Tools/fixtures/optimization/code.txt": "bc0fc77db83ec16a8100b57d5d06d68ddd7aecf3ceedc8a410699418086124c8",
    "Tools/fixtures/optimization/floor-cache-confirmation.txt": "3f9ff23888e4e55e84e79ecf17f9ba347d32e58840a5fadbad291ed782203668",
    "Tools/fixtures/optimization/indexer-code-development.txt": "ae15397152799641172b585529c10fda7faa313875b504e34858e69472b95c68",
    "Tools/fixtures/optimization/prose-distinct-tail.txt": "d13b427927e9266ae8a9949b85a704ff6439df50aea54bfd7b5bf46f12b7c784",
    "Tools/fixtures/optimization/prose.txt": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b",
    "Tools/fixtures/optimization/qualification/actual-default-one-token.json": "8481bffb4721fbd594eca609506308480e7979a486c327732cba6ff138daf26b",
    "Tools/fixtures/optimization/qualification/complete-repeat.json": "9b8308d23621b55ae70dfb34258571ed00a97c9ea2932127aa787d438085ba6e",
    "Tools/fixtures/optimization/qualification/distinct-tail.json": "7d80ab65e1ed821e24922c050afc4ff24b83f9e3a2b560383efd4e7868aad59e",
    "Tools/fixtures/optimization/qualification/mtp-resource.json": "5a0c57424e2097b5ec7b4199dd9ae28d40e24f6c4eef24d13098f3ce8d652613",
    "Tools/fixtures/optimization/qualification/sampled-short.json": "ec97a77e98417def8f7489b5fd58ded65790659e15ebe6f4d2328c8688d76a7a",
    "Tools/fixtures/optimization/qualification/short-one.json": "5c736b2eec31378f0b3d2beb64d20561569ce8dfd765e363afde72b0755278a9",
    "Tools/fixtures/optimization/qualification/soak.json": "0b79f271e4dbaabe77802a54a125c371ee4519848c2e01e5019bd5d8a36a065b",
    "Tools/fixtures/optimization/qualification/unique-prose.json": "6831b8f47138d175f28ac9716bacaa8c937515a970df709393004bff84a45c35",
    "Tools/fixtures/optimization/qualification/unique-with-retention.json": "0b2593dab6a12e10226dd94d60c43d40b085160b2c23680b79545d7fe41dbb2d",
    "Tools/fixtures/optimization/runtime-budget-confirmation.txt": "055164841f47a5aa6185d82f09611bea5f7723d37298d9bd371de15452e29dda",
    "Tools/fixtures/optimization/short.txt": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
    "Tools/fixtures/optimization/vision/prompt.txt": "ea487dbfa3274ba2ed440cc62cd740d05c8219de8b4588856d8f16413d1bbd09",
    "Tools/fx_gates.sh": "035f425d0becb017f9c8e2fd71bdabb52e61f17d69c10ef5194688bb8f20a20e",
    "Tools/fx_scenarios.py": "f8418efaac463b0969f9518f909aafcfb30c9732606b4bcfc811b45a49a66d3e",
    "Tools/gateway_client_gate.mjs": "7a5b605d18d6044fa4d038d169ace4b6541222a3d98977f2b773e204c34864dd",
    "Tools/gdn_profile.py": "f4483f1c78ffc9f70439688f3336abd41768458a87117950fc1b4f3e2879923e",
    "Tools/hermes_integration_gate.py": "517c4b7fbdc5a24bedb7924cb57051ec65b58d44d0c0df40e7119ab44e54b0f6",
    "Tools/indexer_score_probe.py": "b51796a075f6391b301cbe78eda3e82ac9378e16823e9ca48f0f1f97b166e8b0",
    "Tools/indexer_score_probe_test.py": "1cf32f1db801a0813c634888e0a942f6c3dc9abe92fbc538ce7772eb7891df1d",
    "Tools/installer_gates.sh": "ffcb88381decda386da186d82365b635a32fc2e01b8973fbddd6e39464154936",
    "Tools/installer_gates_binary_test.py": "a0017f16f6676bc0098e4cf01508d658611cbd0ffa6baf0ad490d7b90a2839d1",
    "Tools/llms_full.sh": "3f2c9694f274697a2eb63288e1ea7b0e774e82ffad1a9a9483f4ef2c9e7cbcef",
    "Tools/long_context_gate.py": "b7422f009eaf24b079c87cc3ed847840ea941e4a141d5357fc240ad5945a54ee",
    "Tools/memory_gate.py": "9d09d3aade7b1e1f9180f3779a651480f2d7b6ab194065820831c136c3c6cc9c",
    "Tools/monotonic_plan.py": "3ab76df40092ccab549a92ae2ef5ae457f7ad3ab8adc8512ee749ef1c05355bd",
    "Tools/mtp_convert.py": "22f58712346b67a35cdc0d7a4da45a665335ae9382e104156aff16e91b7b053d",
    "Tools/ngram_cache_probe.py": "01e295b269d94350730c46a59edf7a62b562c9c45f6456c2d9947862835a57e7",
    "Tools/ngram_cache_probe_test.py": "05141ddb547bdd870fbc2e4d971caa2e1a84e121b9416b0da87ca84c739d9bb3",
    "Tools/ngram_lookahead_bench.py": "9492467ff3a03154da642f51848a9cbaedc02509f76ae78d3533868bbfd1d02f",
    "Tools/openai_tools_gate.py": "28f571e0f774f9717d6469a926083b17b3ec6b607cea1d72ec84d76912832357",
    "Tools/optimization_build.py": "dee7d43c4fd70aac9145cfe33ea9d3d446e803fbca5dbf54e07d577d27deca6f",
    "Tools/optimization_build_test.py": "cfa7367792c17d4d8617ac2e16161043471714297355bfa0b0de508defea3c95",
    "Tools/optimization_campaign.py": "ae49f185713b26f0999b77126df0c480dda017f09f9b315a020b1693bf52d1c4",
    "Tools/optimization_campaign_test.py": "7d35ef74a8184224b2ec8aabb29f94c4f416c27bdae2d51ee7c794404e36745d",
    "Tools/optimization_check.py": "61d050207c1074131de4f5917bcfcc50373f9d105688ba0185c19febaa6f1462",
    "Tools/optimization_component.py": "cbdab6f194dbb8acdee13d5efc484aae4dd7aa3d8431d9033d77f1bd9785904a",
    "Tools/optimization_prerequisites_test.py": "215ab0cead0daafd4d95f469254870159c66b9d719997410838cea83c151d41b",
    "Tools/optimization_readiness.py": "56a654ab367b7eca3ee6ab0270641fb2af70ce2bd4a242b8036da506229f283c",
    "Tools/optimization_readiness_test.py": "6c963a9aec3be52975da24328a965b3778259a6372c691b3e6c9f32b92e63016",
    "Tools/optimization_results.py": "d4b9b0d6e82dd5d38f043c1b681cede8cfc2c764bcf80b9031e8438b51fece9c",
    "Tools/optimization_results_test.py": "7cc829aa16726312d115dad41692010a19c5637f6206bc481fd721eae99c15e1",
    "Tools/optimization_serial_build.py": "f33cba39a2a427b76353c57075128a9278a7cb3f22d3f086d7be8c25179bf6cf",
    "Tools/optimization_serial_build_test.py": "b6b21d18f2a96522f034b246aa4be3b43f19f11cc178ea401992c54c519bc54a",
    "Tools/optimization_soak.py": "61ea2ddff2c8bb72ea6bdb226c96cdfe69ae086ab9bf8384f06f2a80f3907f0e",
    "Tools/optimization_soak_test.py": "3b61d9e63a6c5fbe79b618324b283826d51ab3085582200df4e276cb1befd0be",
    "Tools/packed_layout_build.py": "2f780a584bd0d5b461cfbf3cfc32b992ebc3480afb6bf78cb167af9ca8fba8ab",
    "Tools/parity_ref.py": "cb938f6215f1433bbc6eef2b8cc04a8a9cf9d5953f487347649637fa911abab6",
    "Tools/planner_gates.sh": "f869506fa2c7c4aa73ecf279a52b84103227a451a7a2e319d489eff30b150b29",
    "Tools/prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "Tools/prefill_bench.sh": "68a6695ab67766626394637dcdaaee1db53fc06077a4ed7310e8a006bfa5de66",
    "Tools/prefill_bench_test.py": "fa263527173e3d139e868b12e19f9417478380466094b35e0726381cbe5245b7",
    "Tools/process_cleanup_checks.py": "2de6d823a4850662fda621cbe2df43aa869731e40530e7f286c9a2f289e6a982",
    "Tools/projections.py": "90a02090829c0dae88d69846f8a0f55bd2b039e3f12c549aa58b175f4e842355",
    "Tools/pull-bench-linux/Package.swift": "b6e6c707ff0c8d57fbece8e0b553283dfe06ec7449ff327141e96cd21262d06e",
    "Tools/pull-bench-linux/main.swift": "a296bb751261010d46b1d44532f736fac3a22adb7b80be897d547a4809d74c95",
    "Tools/pull_bench_linux.sh": "2062f832627a33edc8103559c74e647b6aeb1145e0043d3ab310c2205de304eb",
    "Tools/quality_probe.sh": "cfa2ae2995acd9dd0d416ff2d9e71ec538ab0b259ebbb30324c4ad28c6fca3ba",
    "Tools/reference/config.json": "0da22a8ed4323fbe969bf982aeb054743b315206791f28ef74a309c707080ba5",
    "Tools/reference/generation_config.json": "e70c136c1b78ddc1fb0905bac8e733a4dc448d4f852a5dd75143fffc70be550e",
    "Tools/reference/make_mtp_fixture.py": "7d54481d25ffdacb7ef52b3ef345a817d4c0783e6340224edebe587a9d8f0d52",
    "Tools/reference/model.safetensors.index.json": "072cc2c60b8af6cce82a387f62e39ca88754c3a6fccae0816dd21bb89d27470d",
    "Tools/reference/mtp_ref.py": "f28827ac0409fe58b9c255f16add5ecb00b17a2310a3521d75a677f2d4a84f24",
    "Tools/reference/qwen4_exp.py": "6fae4ec0decbf77ca4a4571de683bc5580ec75e84325ecb432dfcd2fc81df75e",
    "Tools/reference/tensor_shapes.json": "302d9926b8d1770c1a11f1fdd9d199b136865117f427dcb29e512c7d6dd4c780",
    "Tools/rope_component.py": "f8e56f6d33c98cc50a64efe67b5c184bb0a4ebdff26ca4aa3e34f5434fb202ca",
    "Tools/run_model.py": "00ea3727aed92fcc17df1e16f4284f8840145558cf776e08429eb1884eb7b8c0",
    "Tools/sampler_gates.sh": "7e781d7593224973597906e7031c7ab143ab4dff540dd4bf86542e52cb7ed144",
    "Tools/sampler_gates_test.py": "89f1a34df9dbb37e904c1b32e15e72cd9fc5c01a955097abaeb2ef6c2d435fc7",
    "Tools/sampler_ref.py": "faa87e6db26853b275322d18cab1994430315e19783b984ac28e1cdaf34395c3",
    "Tools/selected_attention_probe.py": "e4e5a4a4980f4f20dddca7c8a7633c3d4b66dfc2034a4a83f1b791e3f5497328",
    "Tools/serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
    "Tools/slotbench.py": "d27b4d18f75f423443f1b4a8dd4da50965fa1885d531029f0c7f0baecdf24262",
    "Tools/slotbench2.py": "0d38017db9e74141df23664083a0c520458e3a531d5d865ad19ab6e23bdd2711",
    "Tools/slotbench3.py": "7518329fcb4217760689f5c8bc5cbd268c5220ca0a38f2289af9c7d84c8e2e05",
    "Tools/slotpack/DownloadHarness.swift": "16a1d1e76139fa3dc7ca0a29716f9d866b0085b0238eaa7a16b361af38682901",
    "Tools/slotpack/ManifestChecks.swift": "5aafa4ccc88f314ca53df842d3b81b67074a8bb2c4e89d2d55a9617aaf285166",
    "Tools/slotpack/TransferProbe.swift": "5714c073ab24581c412bae3c131cb04bbd84c899281c350117e3cbfa4a6e4031",
    "Tools/slotpack/checks.py": "59a598a3d77b9fa38117e4437fd11aa52982fcb833000a62c25b2e990d4165b3",
    "Tools/slotpack/cli_checks.py": "a67f5d06d09a713051fea673562a95367e76f8cfb4ac8fe3b1592781c39470d7",
    "Tools/slotpack/coverage.py": "c53cb1fd611ab6fc690db0fc1db1b816e4d0e5379420874545b8760bfd9fe644",
    "Tools/slotpack/download_checks.py": "7958ef42e29b4885319186a4bccd6e5dd3e2b20cbea9cbbf971554bf353657ef",
    "Tools/slotpack/embed.py": "9c0d98858b54353584ab92abd45b85ed3894e0004e38f1e2945d8ab6d6ee8c94",
    "Tools/slotpack/fetch_build_inputs.py": "a6f5b52aad619d6aef58e527ca42d7743e1e45c568dd2287c7f80800c18c31c1",
    "Tools/slotpack/full_pull.py": "b925415dae87b6f240d875e67fe5a9684534e6d96dd953424082fe80c54ecb96",
    "Tools/slotpack/memory_checks.py": "e0494906ac1a8673ee41ec0f60e5971626afc958e4caa49dc29090187e1447f0",
    "Tools/slotpack/pack.py": "1bdaef49bb324f37bb64c7c453f9ec724c9f96c3d1f579ff6f3e9417e1d510cd",
    "Tools/slotpack/public_probe.py": "33dc5a003b4f59356e208f4330370c905a51fb515ddccf27a9dae471cd76d10a",
    "Tools/slotpack/publish_hf.py": "e9a7a07198bd3eddc1dadd94d8dd8729b8528282992c049eb00dcbcf93cf190e",
    "Tools/slotpack/publish_hf_checks.py": "76a3f41abe9b16239a9d32e6fb4b50f4f8e323076d04803a31f02f4162aa587c",
    "Tools/slotpack/publish_r2.py": "cdd39ae06637800dc02e84c948c5b2c50c2c9abec71673f299dfb8d1112b9684",
    "Tools/slotpack/raw_checks.py": "772f4132088582fa9642f3dd86f800be3c8f005e9145c827b6692ee4f6386d94",
    "Tools/star_history.py": "58801509a122439429f675295041e35aae89504a638ff31eb76fe97979d7152f",
    "Tools/static_gates.sh": "e82bf5d6b35bf63a75506fbab3e5282e09b4efe86541ebd5bdf9c5d8eb7ce0b7",
    "Tools/static_gates_binary_test.py": "aa07dfd295130d52aaca72810ac7ce65bd701940c06c844a6b7dd7c82f4a9b33",
    "Tools/trace_convert.py": "8ea22dda841860f0f829203c4ece5f68c515c13a39f2c6122bc309a2150f0079",
    "Tools/trace_routers.py": "32ff38f4f0f02d9679dcd16fc57f64694836416baf666075151e9f208be23da6",
    "Tools/verify.sh": "ed2485271adf39581150a38fd56b117e9c82dba7b8e1bed857f7fbeb39991065",
    "Tools/verify_binary_test.py": "739bf1d03823ad77f0f7663af5b223474c5518148a1e51065d168a7109b50762",
    "Tools/verify_corrections.py": "2cf6f0818a3ab39aac948ba78b5f5e3ac5dfc1b8037bb7f48caa7c16fa198a0b",
    "Tools/vision_attention_probe.py": "1575d36927dba5f4ff52d1549a96d93e7c6c190c2c5e8d94644628c672fbe346",
    "Tools/vision_capacity_gate.py": "851a598f05d34cbaf597e56a593de3bf2a9f492a069d77d93ba6f5a7e0a42040",
    "Tools/vision_capacity_gate_test.py": "4cb266cbc6859ba053529f0ddb792199dc2a4e35af798a4d9cd636a123122412",
    "Tools/vision_qualification.py": "5deff2ad8469d8a54b477262d701a8b386395d265df029c37bd7ee6b8812b165",
    "Tools/vision_ref.py": "fa62575c947392f990841e6ac90656737eb67edb000ab369d7b7a0f66a05ef29",
    "Tools/vision_serving.py": "6afd42ebefd87619d3ccb6dc96172366483ea94f7e86ecc0215a7bdf3c6b76fb"
  },
  "limits": "No build, app closure, default activation or paid service. Existing verified local model only. Source/binary/Metal pinned; files saved before exit."
}
````

## /tmp/slotstream-optimization-execution/verification-recovery-v287/run.py

SHA-256 `1b3674da8ecb034f58e8e2a1adcbe4c6da2eac5e3daf345a11100aa225d7d41e`; 5863 bytes.

````text
from pathlib import Path
import datetime,json,os,re,signal,sys,time
ROOT=Path('/Users/carlos/Projects/slotstream');P=Path(__file__).parent
sys.path.insert(0,str(ROOT/'Tools'))
from prefill_bench import digest,preflight,vm_snapshot
from serve_bench import competing_jobs,verified_build
from optimization_readiness import pressure_snapshot,require_normal
from optimization_serial_build import guarded_run
import optimization_campaign as campaign
B=ROOT/'.build/optimization/read-failure-candidate-build-v280/candidate/slotstream'
OUT=ROOT/'.build/optimization/verification-recovery-v287'
# The reservation must be granted by the peer before invocation; the argument
# binds a concrete handback deadline and never authorizes extending it.
DEADLINE=datetime.datetime.fromisoformat(sys.argv[1].replace('Z','+00:00')).timestamp()
remaining=int(DEADLINE-time.time()-30)
if remaining<600:raise RuntimeError('targeted recovery requires at least10minutes within the granted interval')
POLICY={'startup_reclaimable_bytes':21_000_000_000,'minimum_live_reclaimable_bytes':3_000_000_000,
 'maximum_owned_rss_bytes':17_500_000_000,'sample_interval_seconds':.2,
 'maximum_build_seconds':min(3600,remaining),'stop_on_new_swapouts':False}
NATIVE_PACKET=ROOT/'.build/optimization/read-failure-candidate-campaign-v281'
native=campaign.status(NATIVE_PACKET)['stages'][:3]
assert [r['stage'] for r in native]==['native/'+n for n in campaign.NATIVE] and all(r['status']=='passed' for r in native)
S={'classification':'Targeted recovery of the three failed V283 gates, extracted from corrected verify.sh: one actual governor drill, one complete MTP-plus-vision gate, and the exact original long-prompt memory/recall gate. Same native binary and original inner no-VM/absolute-resource criteria. One attempt per gate; preserves prior failed full-suite result; this is not a full-suite pass. VM recorded by outer ownership guard.',
 'frozen_at':datetime.datetime.now(datetime.timezone.utc).isoformat(),'deadline_utc':sys.argv[1],
 'build':verified_build(B),'native_prerequisites':native,'native_contract_sha256':digest(NATIVE_PACKET/'qualification-contract.json'),'wrapper_sha256':digest(Path(__file__)),'policy':POLICY,
 'environment':{'SLOTSTREAM_TEST_BINARY':str(B),'SLOTSTREAM_VERIFY_OUT':str(OUT/'verification')},
 'command':['bash',str(P/'checks.sh')],
 'extracted_script_sha256':digest(P/'checks.sh'),
 'source_verification_sha256':digest(ROOT/'Tools/verify.sh'),
 'historical_counterexample':str(ROOT/'.build/optimization/full-verification-v283/manifest.json'),
 'drivers':{str(f.relative_to(ROOT)):digest(f) for f in sorted((ROOT/'Tools').rglob('*')) if f.is_file() and f.suffix in ['.sh','.py','.mjs','.json','.swift','.txt'] and '__pycache__' not in f.parts},
 'limits':'No build, app closure, default activation or paid service. Existing verified local model only. Source/binary/Metal pinned; files saved before exit.'}
P.joinpath('protocol.json').write_text(json.dumps(S,indent=2)+'\n')
OUT.mkdir(exist_ok=False);started=time.monotonic();r={'passed':False,'protocol_sha256':digest(P/'protocol.json')}
def interrupted(number,_frame):raise KeyboardInterrupt(f'full qualification interrupted by signal{number}')
signal.signal(signal.SIGINT,interrupted);signal.signal(signal.SIGTERM,interrupted)
saved={k:v for k,v in os.environ.items() if k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
with (OUT/'pressure.samples.jsonl').open('x') as observations:
 def snapshot():
  state=vm_snapshot();pressure=pressure_snapshot();observations.write(json.dumps({'seconds':time.monotonic()-started,'vm':state,'pressure':pressure})+'\n');observations.flush();require_normal(pressure);return state
 try:
  r['before']=preflight(21);snapshot();assert not competing_jobs()
  assert (ROOT/'.venv31/bin/python').exists()
  for k in saved:os.environ.pop(k,None)
  os.environ.update(S['environment'])
  with (OUT/'stdout.txt').open('w') as stdout,(OUT/'stderr.txt').open('w') as stderr:
   result=guarded_run(S['command'],cwd=ROOT,stdout=stdout,stderr=stderr,record_path=OUT/'memory.json',snapshot=snapshot,policy=POLICY,classification=S['classification'])
  r['exit_code']=result.returncode
  report=(OUT/'stdout.txt').read_text();summary=re.findall(r'^passed (\d+), failed (\d+)$',report,re.M)
  r['summary']=summary;r['skips']=re.findall(r'^SKIP.*$',report,re.M);r['failures']=re.findall(r'^FAIL.*$',report,re.M)
  r['passed']=result.returncode==0 and len(summary)==1 and int(summary[0][0])>0 and summary[0][1]=='0' and not r['skips'] and not r['failures']
 except BaseException as e:r['error']=f'{type(e).__name__}: {e}'
 finally:
  for k in list(os.environ):
   if k.startswith(('SLOTSTREAM_','SS_DEBUG')):os.environ.pop(k,None)
  os.environ.update(saved)
  r['elapsed_seconds']=time.monotonic()-started
  # Primary result is durable before independent restoration checks.
  (OUT/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
  for n,f in {'after':vm_snapshot,'pressure':pressure_snapshot,'candidate_unchanged':lambda:verified_build(B)==S['build'],
   'drivers_unchanged':lambda:all(digest(ROOT/n)==h for n,h in S['drivers'].items()) and digest(P/'checks.sh')==S['extracted_script_sha256'],
   'remaining_jobs':competing_jobs,'model_lock_free':lambda:bool(preflight(0))}.items():
   try:r[n]=f()
   except BaseException as e:r.setdefault('cleanup_errors',{})[n]=f'{type(e).__name__}: {e}'
  r['within_reservation']=time.time()<=DEADLINE
  r['passed']=bool(r['passed'] and not r.get('cleanup_errors') and r.get('candidate_unchanged') and r.get('drivers_unchanged')
   and not r.get('remaining_jobs') and r.get('model_lock_free') and r.get('pressure',{}).get('level')==1 and r['within_reservation'])
  (OUT/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({k:v for k,v in r.items() if k not in ['before','after']}),flush=True)
raise SystemExit(0 if r['passed'] else 1)
````

## /tmp/slotstream-optimization-execution/verification-recovery-v289/checks.sh

SHA-256 `364198374bd57fbf39959f37332cb76085043eca925ab3a6ba62e7c6664cf366`; 4457 bytes.

````text
#!/bin/bash
set -euo pipefail
BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
VERIFY_OUT=${SLOTSTREAM_VERIFY_OUT:-.build/verification-$(date +%Y%m%d-%H%M%S)}
mkdir -p "$VERIFY_OUT"
export BIN SLOTSTREAM_TEST_BINARY="$BIN"
CHECK_INDEX=0
safety_before() {
  python3 - "$1" <<'PYSAFE'
import sys
sys.path.insert(0, 'Tools')
from prefill_bench import preflight
preflight(float(sys.argv[1]))
PYSAFE
}
run_model() { safety_before 13 || return 2; "$@"; }
# Keep the selected path out of evaluated snippets, including substitutions.
run_binary() { "$BIN" "$@"; }
PASS=0; FAIL=0
check() {
  CHECK_INDEX=$((CHECK_INDEX+1))
  local record="$VERIFY_OUT/check-$CHECK_INDEX.txt"
  printf '%s\n%s\n' "$1" "$2" > "$record"
  if [[ "$2" == "run_binary "* ]]; then safety_before 13 || return 2; fi
  if eval "$2" >>"$record" 2>&1; then echo "PASS  $1"; PASS=$((PASS+1))
  else echo "FAIL  $1 (details: $record)"; FAIL=$((FAIL+1)); fi
}

SMALL_MEMORY=8.1
BIG_MEMORY=10
ECBIG=960

echo "== exact original long prompt and 10 GB memory gate =="
python3 - <<'PYEOF' > /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v289/verification/long.txt
f = ["Routine maintenance was performed on the north corridor lighting system. ",
     "Inventory counts were reconciled against the quarterly ledger totals. ",
     "The east wing humidity sensors reported nominal values throughout the day. "]
b = "The archive records that the vault combination is SEVENTEEN. "
for i in range(700):
    b += f[i % 3]
print(b + "\n\nQuestion: what is the vault combination? Answer with one word.")
PYEOF
# Use the normal non-thinking chat template. A bare raw prompt can spend the
# entire output allowance in reasoning, which is invalid recall evidence.
run_model "$BIN" run --prompt-file /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v289/verification/long.txt --max-tokens 16 --greedy --memory-gb $BIG_MEMORY \
  --sample-footprint --stats-json /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v289/verification/longmem.json \
  2>/Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v289/verification/longmem.err > /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v289/verification/longmem.txt
check "--memory-gb $BIG_MEMORY sampled footprint and RSS under target on the long prompt without swap" \
      "python3 Tools/memory_gate.py /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v289/verification/longmem.json --limit-gb $BIG_MEMORY"
check "long-context answer still correct (sparse indexer active)" \
      "python3 Tools/long_context_gate.py /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v289/verification/longmem.json /Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v289/verification/longmem.txt --expected SEVENTEEN --minimum-prompt-tokens 7000 --maximum-output-tokens 16"


echo "== whole MTP: fresh quiet preflight =="
python3 - <<'QUIET'
import sys,time
sys.path.insert(0,'Tools')
from prefill_bench import vm_snapshot
from optimization_readiness import pressure_snapshot,require_normal
start=vm_snapshot()
for _ in range(30):
 time.sleep(2);now=vm_snapshot();require_normal(pressure_snapshot())
 if now['swapins']!=start['swapins'] or now['swapouts']!=start['swapouts']:
  raise SystemExit('MTP pre-launch quiet interval had VM activity; whole MTP attempt not launched')
print('PASS pre-launch 60-second no-VM observation (not an MTP result)')
QUIET

  safety_before 15
  if "$BIN" mtp-check --memory-gb 12 --mtp on --vision on --image Tools/assets/vision_test/secret1.jpg >"$VERIFY_OUT/mtp.txt" 2>&1 \
      && python3 - "$VERIFY_OUT/mtp.txt" <<'PYMTP'
import json,sys
from pathlib import Path
text=Path(sys.argv[1]).read_text()
assert 'PASS  vision speculation deterministic' in text
assert 'PASS  vision speculation ran' in text
assert 'SKIP' not in text and 'MTP CHECK PASS' in text
rows=[json.loads(line.removeprefix('MTP CHECK MEMORY ')) for line in text.splitlines() if line.startswith('MTP CHECK MEMORY ')]
assert len(rows)==1 and rows[0]['memory_validated'] is True
PYMTP
  then
    echo "PASS  speculative decode gates (determinism, state integrity, accept sanity)"; PASS=$((PASS+1))
  else
    echo "FAIL  speculative decode gates"; tail -5 "$VERIFY_OUT/mtp.txt"; FAIL=$((FAIL+1))
  fi
echo "passed $PASS, failed $FAIL"
[ "$FAIL" -eq 0 ]
````

## /tmp/slotstream-optimization-execution/verification-recovery-v289/protocol.json

SHA-256 `76e1e4f794c2dae76d3a5033256617e5796d20ab7ee4d9282c5e4f1c2e6ca101`; 37911 bytes.

````text
{
  "classification": "One exact original long request with explicit source constants, then at most one complete MTP-plus-vision attempt after a successful 60-second no-VM preflight. V287 omitted BIG_MEMORY from its extracted shell header: long request failed argument parsing with exit64 and did not load a model; that attempt and its MTP swap-in failure are preserved. Same original native binary, workloads, original no-VM and absolute-resource criteria. Governor is already actually passed and not repeated. This is not a full-suite pass.",
  "frozen_at": "2026-09-07T09:47:41.744788+00:00",
  "deadline_utc": "2026-09-07T10:00:00Z",
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/read-failure-candidate-build-v280/candidate/slotstream",
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
        "Sources/Slotstream/Context.swift": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0",
        "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
        "Sources/Slotstream/ContextMemory.swift": "c59d3ea2700eef685182b374934aa10e997f8c045990bd7439d6dd3314f46865",
        "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
        "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
        "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
        "Sources/Slotstream/Engine.swift": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
        "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
        "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
        "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
        "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
        "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "7036e275990695568a948e279505cc03495da21d8b5f81a5f9160843d59c0c0d",
        "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
        "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
        "Sources/Slotstream/Layers.swift": "1522eb6f8ca71a0712ed9d918696b2175f96fe8a48b8447289a2a1966cd6b120",
        "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
        "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
        "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
        "Sources/Slotstream/Model.swift": "a4cea913e0f438a69e72672d42046bf904717700d8753c1449e5e48b419033a6",
        "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
        "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
        "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
        "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
        "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
        "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
        "Sources/Slotstream/Optimizations.swift": "450d07494a5cc12568c82cb1a330ce1613e30a0e93efdc97597d687c36d8fc95",
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
        "Sources/Slotstream/RequestControl.swift": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "7363b347ae2df47ff005cb414722434d8d67783ea85a228d68f3b829153f5f8e",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "7f56163e8e1883da54874917ca11c239f65806586b8409a9f39a5f9516f2df98",
        "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
        "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "f4b9c59e6abc340e8f15b2d523296ab74fcd269cc39c67f514cb18f41a1f6a96",
        "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
        "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
        "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "71b49d3edc91c35572e0e40937860f8112c5ac56b9816ce870e189d4223d641c",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3c61121e89651dd6bb0ca41cef832612a2f1601e55cab3adebb4e0489a3da1a6",
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
      "source_archive_sha256": "56c60764434a75913ddb46d91ed7b38c66a6969ea46d5c1a6159ea55dd8143b4",
      "binary_sha256": "eba9ee894aba4722d082fda7d39192339d0299fe7af264a624dd4209d1e648cf",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "native_prerequisites": [
    {
      "stage": "native/combined-plain",
      "status": "passed",
      "assertions": 242
    },
    {
      "stage": "native/combined-mtp",
      "status": "passed",
      "assertions": 256
    },
    {
      "stage": "native/read-failure-serving",
      "status": "passed",
      "assertions": 522
    }
  ],
  "native_contract_sha256": "15333ded4180d6b19a50a7b8bb7d3d1e33cfa95dcdce7fbf1e7c755a318ab9da",
  "wrapper_sha256": "f9aaa4f594a1f8f8206fb5dd3ed5b5c201385aa2699dd415d2a8dc3b830d3203",
  "policy": {
    "startup_reclaimable_bytes": 21000000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 17500000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 708,
    "stop_on_new_swapouts": false
  },
  "environment": {
    "SLOTSTREAM_TEST_BINARY": "/Users/carlos/Projects/slotstream/.build/optimization/read-failure-candidate-build-v280/candidate/slotstream",
    "SLOTSTREAM_VERIFY_OUT": "/Users/carlos/Projects/slotstream/.build/optimization/verification-recovery-v289/verification"
  },
  "command": [
    "bash",
    "/tmp/slotstream-optimization-execution/verification-recovery-v289/checks.sh"
  ],
  "extracted_script_sha256": "364198374bd57fbf39959f37332cb76085043eca925ab3a6ba62e7c6664cf366",
  "source_verification_sha256": "ed2485271adf39581150a38fd56b117e9c82dba7b8e1bed857f7fbeb39991065",
  "historical_counterexample": "/Users/carlos/Projects/slotstream/.build/optimization/full-verification-v283/manifest.json",
  "drivers": {
    "Tools/all_hit_replay.py": "24401912f3fd8b2e70105c5095c993c131b6ffbe27add38f9268c9e1dc0ed9a1",
    "Tools/api_generation.py": "cdb5b81e785b5e96e4f81e4fa5e2fe48a3b32f20b149952a9ee7f9a5c68b2eaf",
    "Tools/api_generation_test.py": "d2bd5494d9a73ec76806f6aad9344e76554fa8777721f4dd525f9478fe4f535b",
    "Tools/api_robustness.sh": "a7397ac2f5df3a7eb8f7e1578daef51124c1c7fdabd0526c13518b8048984a96",
    "Tools/api_test.sh": "77bd216be56f3a309cff380c649af47edaff2d1d17e9dd9ad4f10fd489664c11",
    "Tools/brain_gates.sh": "7f32151567f0e64f8ed9619e5551bc7716aaf24be6b19fc0c62496b1dd44df2b",
    "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
    "Tools/build_identity_test.py": "04facecff6ee3b65c261678131e5c3b4e64e5aff630b7df00c7414439e2776ec",
    "Tools/cache_policy_confirmation.py": "a2d0108f30b64b4838064ba0d450e49a28c8aca43ad0a41dcd1c30760e475748",
    "Tools/cache_policy_probe.py": "93ce0ec7cb98cd16cca46509089864d6267c3e080a2172615beadd3f69632a81",
    "Tools/cachesim.py": "0f6c304c69f88d49b1e3e699a0230d4c90de937baffc02aec52bf38429004f38",
    "Tools/claims_gate.py": "12a76b03bdf78ca0d71ea00a757684d19a137582b432875d10a670f583dcbced",
    "Tools/compute_islands.py": "9c25400b28ad425bba9e752138a967882d573432e6093d4b898da6dca266b985",
    "Tools/consumer_smoke.sh": "5e039b3f03844f26df5ccd223edf5bee4320cd670b60dcd1b62a2953c18a7c70",
    "Tools/consumer_smoke_test.py": "0fd6aea920c671d3bece420013a9ebc526ed9dd48d55bcdb8f83f6e7badc6bf1",
    "Tools/context_acceptance.py": "6791b61a99763d5b0ecfc510aef669fac982fb7cd5ff6dfc78fe61b5ea7864ba",
    "Tools/context_acceptance_test.py": "9a57bf61a50f2a3187ecc887110c77b3a7d161eea9dc7b7a8abe368fbee21aeb",
    "Tools/context_contracts_test.py": "635c6dcfabd89a0868ceacf00fe305d165fa8720ebf71b8fd147c70838ccbc1c",
    "Tools/context_gates.py": "712a328c906011b2cd07dff0b5225e5b45089b6c6effd4b1a151c90db3d587e4",
    "Tools/context_overflow_probe.py": "3bf2633e583898d2c60ed8630409ccf314d352352ecf342bcb72d0705fde52c8",
    "Tools/context_proxy.py": "825f99c7a16677398bc8c04f3ace63dc98f18fa98c17b9265ac1b79a35b11203",
    "Tools/context_proxy.swift": "360731036283558552032b2fc28ad2956d94b0683fb4f1a2dfec40ac5e11bea8",
    "Tools/context_qualification.py": "094b567ccc21613444cfd0edf098967bb758af42652be8ba70762ae313cbbf34",
    "Tools/context_qualification_checks.py": "4f26ef66a0444d5d7f13b37464bcc25f21ceb9c0e3c71f0bc038f128667583d9",
    "Tools/context_resource_gates.py": "b1fb297f645d231250915ce7467856c36221c31885fd9426364637597d57b003",
    "Tools/context_window_matrix.py": "b24e904c0d64b61e08ad33779505445c51f2a00de8e556f14167042390495104",
    "Tools/context_window_matrix_test.py": "37f59dd7674175cf53e87f2bb2663a27c732eed5f9382508b578e96fa9cdef52",
    "Tools/coverage-floor.json": "6eca5d16f69f3bb1a4cd88d1036fa074d1232ed8d8d630cda80c91c309c0b828",
    "Tools/coverage.sh": "bc52a65b95dadbd15391f9a636287611f1117e8decf56e14e189da2d7abd90b6",
    "Tools/coverage_ratchet.py": "9bf8c570b83d6a89acd1b005d1ed051bb8125c5281424c0b294d3b46cd753a06",
    "Tools/coverage_ratchet_test.py": "ed632f76757cc7dfb346de92d1c8b00fcbd6596b4363d093beebbfc67af43a93",
    "Tools/dbmd_install.sh": "8b892df4f2232db0fac42b8bf1585371e652d13c9cd9094c8190e3f957e58e1e",
    "Tools/debug0_ref.py": "930d258ed12c6d60e7db4506a25677e4fe60e8da07cddb244c7740ebb66ca6f1",
    "Tools/e2e_release.sh": "b4762272eca921614d46ec6a4d4bcc28e939bcd22639f7e9bbf5fca0ceaedca7",
    "Tools/e2e_release_test.py": "acc7930f33ce45c93ef89f7568e8c380e4a6cfc453a64fcc93a2c84287b84152",
    "Tools/expert_layout_probe.py": "a76bcba5750c58d8aad0188569c3c53e9721476009034c802a7f21f9d35d3ec2",
    "Tools/expert_layout_probe_test.py": "e6e9363cc3afc9081cb9f00ff7adc6fc77fc1c1a12b9580b32f0cd27c1b32f9d",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860",
    "Tools/fixtures/context-acceptance-v1.json": "7bca4c4ad9a8ea9d0b7496e83e769c92eac901d8d11fc4ce059b07b83c256e55",
    "Tools/fixtures/context-default-v1.json": "c6e55a5b0ab8a4f143b99c8ec0691d528cf3b3f9b5a21d14ab493c886b053558",
    "Tools/fixtures/optimization/acceptance.txt": "32e15bd0df7b057f31b74f94a24c179d4374c19ddc54b77d590e330710fc8f78",
    "Tools/fixtures/optimization/code-brief-development.txt": "722e4b8140be24e5345e37aa4ca2ad6c15c04a984cf132848557d8261ba969c2",
    "Tools/fixtures/optimization/code.txt": "bc0fc77db83ec16a8100b57d5d06d68ddd7aecf3ceedc8a410699418086124c8",
    "Tools/fixtures/optimization/floor-cache-confirmation.txt": "3f9ff23888e4e55e84e79ecf17f9ba347d32e58840a5fadbad291ed782203668",
    "Tools/fixtures/optimization/indexer-code-development.txt": "ae15397152799641172b585529c10fda7faa313875b504e34858e69472b95c68",
    "Tools/fixtures/optimization/prose-distinct-tail.txt": "d13b427927e9266ae8a9949b85a704ff6439df50aea54bfd7b5bf46f12b7c784",
    "Tools/fixtures/optimization/prose.txt": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b",
    "Tools/fixtures/optimization/qualification/actual-default-one-token.json": "8481bffb4721fbd594eca609506308480e7979a486c327732cba6ff138daf26b",
    "Tools/fixtures/optimization/qualification/complete-repeat.json": "9b8308d23621b55ae70dfb34258571ed00a97c9ea2932127aa787d438085ba6e",
    "Tools/fixtures/optimization/qualification/distinct-tail.json": "7d80ab65e1ed821e24922c050afc4ff24b83f9e3a2b560383efd4e7868aad59e",
    "Tools/fixtures/optimization/qualification/mtp-resource.json": "5a0c57424e2097b5ec7b4199dd9ae28d40e24f6c4eef24d13098f3ce8d652613",
    "Tools/fixtures/optimization/qualification/sampled-short.json": "ec97a77e98417def8f7489b5fd58ded65790659e15ebe6f4d2328c8688d76a7a",
    "Tools/fixtures/optimization/qualification/short-one.json": "5c736b2eec31378f0b3d2beb64d20561569ce8dfd765e363afde72b0755278a9",
    "Tools/fixtures/optimization/qualification/soak.json": "0b79f271e4dbaabe77802a54a125c371ee4519848c2e01e5019bd5d8a36a065b",
    "Tools/fixtures/optimization/qualification/unique-prose.json": "6831b8f47138d175f28ac9716bacaa8c937515a970df709393004bff84a45c35",
    "Tools/fixtures/optimization/qualification/unique-with-retention.json": "0b2593dab6a12e10226dd94d60c43d40b085160b2c23680b79545d7fe41dbb2d",
    "Tools/fixtures/optimization/runtime-budget-confirmation.txt": "055164841f47a5aa6185d82f09611bea5f7723d37298d9bd371de15452e29dda",
    "Tools/fixtures/optimization/short.txt": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
    "Tools/fixtures/optimization/vision/prompt.txt": "ea487dbfa3274ba2ed440cc62cd740d05c8219de8b4588856d8f16413d1bbd09",
    "Tools/fx_gates.sh": "035f425d0becb017f9c8e2fd71bdabb52e61f17d69c10ef5194688bb8f20a20e",
    "Tools/fx_scenarios.py": "f8418efaac463b0969f9518f909aafcfb30c9732606b4bcfc811b45a49a66d3e",
    "Tools/gateway_client_gate.mjs": "7a5b605d18d6044fa4d038d169ace4b6541222a3d98977f2b773e204c34864dd",
    "Tools/gdn_profile.py": "f4483f1c78ffc9f70439688f3336abd41768458a87117950fc1b4f3e2879923e",
    "Tools/hermes_integration_gate.py": "517c4b7fbdc5a24bedb7924cb57051ec65b58d44d0c0df40e7119ab44e54b0f6",
    "Tools/indexer_score_probe.py": "b51796a075f6391b301cbe78eda3e82ac9378e16823e9ca48f0f1f97b166e8b0",
    "Tools/indexer_score_probe_test.py": "1cf32f1db801a0813c634888e0a942f6c3dc9abe92fbc538ce7772eb7891df1d",
    "Tools/installer_gates.sh": "ffcb88381decda386da186d82365b635a32fc2e01b8973fbddd6e39464154936",
    "Tools/installer_gates_binary_test.py": "a0017f16f6676bc0098e4cf01508d658611cbd0ffa6baf0ad490d7b90a2839d1",
    "Tools/llms_full.sh": "3f2c9694f274697a2eb63288e1ea7b0e774e82ffad1a9a9483f4ef2c9e7cbcef",
    "Tools/long_context_gate.py": "b7422f009eaf24b079c87cc3ed847840ea941e4a141d5357fc240ad5945a54ee",
    "Tools/memory_gate.py": "9d09d3aade7b1e1f9180f3779a651480f2d7b6ab194065820831c136c3c6cc9c",
    "Tools/monotonic_plan.py": "3ab76df40092ccab549a92ae2ef5ae457f7ad3ab8adc8512ee749ef1c05355bd",
    "Tools/mtp_convert.py": "22f58712346b67a35cdc0d7a4da45a665335ae9382e104156aff16e91b7b053d",
    "Tools/ngram_cache_probe.py": "01e295b269d94350730c46a59edf7a62b562c9c45f6456c2d9947862835a57e7",
    "Tools/ngram_cache_probe_test.py": "05141ddb547bdd870fbc2e4d971caa2e1a84e121b9416b0da87ca84c739d9bb3",
    "Tools/ngram_lookahead_bench.py": "9492467ff3a03154da642f51848a9cbaedc02509f76ae78d3533868bbfd1d02f",
    "Tools/openai_tools_gate.py": "28f571e0f774f9717d6469a926083b17b3ec6b607cea1d72ec84d76912832357",
    "Tools/optimization_build.py": "dee7d43c4fd70aac9145cfe33ea9d3d446e803fbca5dbf54e07d577d27deca6f",
    "Tools/optimization_build_test.py": "cfa7367792c17d4d8617ac2e16161043471714297355bfa0b0de508defea3c95",
    "Tools/optimization_campaign.py": "ae49f185713b26f0999b77126df0c480dda017f09f9b315a020b1693bf52d1c4",
    "Tools/optimization_campaign_test.py": "7d35ef74a8184224b2ec8aabb29f94c4f416c27bdae2d51ee7c794404e36745d",
    "Tools/optimization_check.py": "61d050207c1074131de4f5917bcfcc50373f9d105688ba0185c19febaa6f1462",
    "Tools/optimization_component.py": "cbdab6f194dbb8acdee13d5efc484aae4dd7aa3d8431d9033d77f1bd9785904a",
    "Tools/optimization_prerequisites_test.py": "215ab0cead0daafd4d95f469254870159c66b9d719997410838cea83c151d41b",
    "Tools/optimization_readiness.py": "56a654ab367b7eca3ee6ab0270641fb2af70ce2bd4a242b8036da506229f283c",
    "Tools/optimization_readiness_test.py": "6c963a9aec3be52975da24328a965b3778259a6372c691b3e6c9f32b92e63016",
    "Tools/optimization_results.py": "d4b9b0d6e82dd5d38f043c1b681cede8cfc2c764bcf80b9031e8438b51fece9c",
    "Tools/optimization_results_test.py": "7cc829aa16726312d115dad41692010a19c5637f6206bc481fd721eae99c15e1",
    "Tools/optimization_serial_build.py": "f33cba39a2a427b76353c57075128a9278a7cb3f22d3f086d7be8c25179bf6cf",
    "Tools/optimization_serial_build_test.py": "b6b21d18f2a96522f034b246aa4be3b43f19f11cc178ea401992c54c519bc54a",
    "Tools/optimization_soak.py": "61ea2ddff2c8bb72ea6bdb226c96cdfe69ae086ab9bf8384f06f2a80f3907f0e",
    "Tools/optimization_soak_test.py": "3b61d9e63a6c5fbe79b618324b283826d51ab3085582200df4e276cb1befd0be",
    "Tools/packed_layout_build.py": "2f780a584bd0d5b461cfbf3cfc32b992ebc3480afb6bf78cb167af9ca8fba8ab",
    "Tools/parity_ref.py": "cb938f6215f1433bbc6eef2b8cc04a8a9cf9d5953f487347649637fa911abab6",
    "Tools/planner_gates.sh": "f869506fa2c7c4aa73ecf279a52b84103227a451a7a2e319d489eff30b150b29",
    "Tools/prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "Tools/prefill_bench.sh": "68a6695ab67766626394637dcdaaee1db53fc06077a4ed7310e8a006bfa5de66",
    "Tools/prefill_bench_test.py": "fa263527173e3d139e868b12e19f9417478380466094b35e0726381cbe5245b7",
    "Tools/process_cleanup_checks.py": "2de6d823a4850662fda621cbe2df43aa869731e40530e7f286c9a2f289e6a982",
    "Tools/projections.py": "90a02090829c0dae88d69846f8a0f55bd2b039e3f12c549aa58b175f4e842355",
    "Tools/pull-bench-linux/Package.swift": "b6e6c707ff0c8d57fbece8e0b553283dfe06ec7449ff327141e96cd21262d06e",
    "Tools/pull-bench-linux/main.swift": "a296bb751261010d46b1d44532f736fac3a22adb7b80be897d547a4809d74c95",
    "Tools/pull_bench_linux.sh": "2062f832627a33edc8103559c74e647b6aeb1145e0043d3ab310c2205de304eb",
    "Tools/quality_probe.sh": "cfa2ae2995acd9dd0d416ff2d9e71ec538ab0b259ebbb30324c4ad28c6fca3ba",
    "Tools/reference/config.json": "0da22a8ed4323fbe969bf982aeb054743b315206791f28ef74a309c707080ba5",
    "Tools/reference/generation_config.json": "e70c136c1b78ddc1fb0905bac8e733a4dc448d4f852a5dd75143fffc70be550e",
    "Tools/reference/make_mtp_fixture.py": "7d54481d25ffdacb7ef52b3ef345a817d4c0783e6340224edebe587a9d8f0d52",
    "Tools/reference/model.safetensors.index.json": "072cc2c60b8af6cce82a387f62e39ca88754c3a6fccae0816dd21bb89d27470d",
    "Tools/reference/mtp_ref.py": "f28827ac0409fe58b9c255f16add5ecb00b17a2310a3521d75a677f2d4a84f24",
    "Tools/reference/qwen4_exp.py": "6fae4ec0decbf77ca4a4571de683bc5580ec75e84325ecb432dfcd2fc81df75e",
    "Tools/reference/tensor_shapes.json": "302d9926b8d1770c1a11f1fdd9d199b136865117f427dcb29e512c7d6dd4c780",
    "Tools/rope_component.py": "f8e56f6d33c98cc50a64efe67b5c184bb0a4ebdff26ca4aa3e34f5434fb202ca",
    "Tools/run_model.py": "00ea3727aed92fcc17df1e16f4284f8840145558cf776e08429eb1884eb7b8c0",
    "Tools/sampler_gates.sh": "7e781d7593224973597906e7031c7ab143ab4dff540dd4bf86542e52cb7ed144",
    "Tools/sampler_gates_test.py": "89f1a34df9dbb37e904c1b32e15e72cd9fc5c01a955097abaeb2ef6c2d435fc7",
    "Tools/sampler_ref.py": "faa87e6db26853b275322d18cab1994430315e19783b984ac28e1cdaf34395c3",
    "Tools/selected_attention_probe.py": "e4e5a4a4980f4f20dddca7c8a7633c3d4b66dfc2034a4a83f1b791e3f5497328",
    "Tools/serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
    "Tools/slotbench.py": "d27b4d18f75f423443f1b4a8dd4da50965fa1885d531029f0c7f0baecdf24262",
    "Tools/slotbench2.py": "0d38017db9e74141df23664083a0c520458e3a531d5d865ad19ab6e23bdd2711",
    "Tools/slotbench3.py": "7518329fcb4217760689f5c8bc5cbd268c5220ca0a38f2289af9c7d84c8e2e05",
    "Tools/slotpack/DownloadHarness.swift": "16a1d1e76139fa3dc7ca0a29716f9d866b0085b0238eaa7a16b361af38682901",
    "Tools/slotpack/ManifestChecks.swift": "5aafa4ccc88f314ca53df842d3b81b67074a8bb2c4e89d2d55a9617aaf285166",
    "Tools/slotpack/TransferProbe.swift": "5714c073ab24581c412bae3c131cb04bbd84c899281c350117e3cbfa4a6e4031",
    "Tools/slotpack/checks.py": "59a598a3d77b9fa38117e4437fd11aa52982fcb833000a62c25b2e990d4165b3",
    "Tools/slotpack/cli_checks.py": "a67f5d06d09a713051fea673562a95367e76f8cfb4ac8fe3b1592781c39470d7",
    "Tools/slotpack/coverage.py": "c53cb1fd611ab6fc690db0fc1db1b816e4d0e5379420874545b8760bfd9fe644",
    "Tools/slotpack/download_checks.py": "7958ef42e29b4885319186a4bccd6e5dd3e2b20cbea9cbbf971554bf353657ef",
    "Tools/slotpack/embed.py": "9c0d98858b54353584ab92abd45b85ed3894e0004e38f1e2945d8ab6d6ee8c94",
    "Tools/slotpack/fetch_build_inputs.py": "a6f5b52aad619d6aef58e527ca42d7743e1e45c568dd2287c7f80800c18c31c1",
    "Tools/slotpack/full_pull.py": "b925415dae87b6f240d875e67fe5a9684534e6d96dd953424082fe80c54ecb96",
    "Tools/slotpack/memory_checks.py": "e0494906ac1a8673ee41ec0f60e5971626afc958e4caa49dc29090187e1447f0",
    "Tools/slotpack/pack.py": "1bdaef49bb324f37bb64c7c453f9ec724c9f96c3d1f579ff6f3e9417e1d510cd",
    "Tools/slotpack/public_probe.py": "33dc5a003b4f59356e208f4330370c905a51fb515ddccf27a9dae471cd76d10a",
    "Tools/slotpack/publish_hf.py": "e9a7a07198bd3eddc1dadd94d8dd8729b8528282992c049eb00dcbcf93cf190e",
    "Tools/slotpack/publish_hf_checks.py": "76a3f41abe9b16239a9d32e6fb4b50f4f8e323076d04803a31f02f4162aa587c",
    "Tools/slotpack/publish_r2.py": "cdd39ae06637800dc02e84c948c5b2c50c2c9abec71673f299dfb8d1112b9684",
    "Tools/slotpack/raw_checks.py": "772f4132088582fa9642f3dd86f800be3c8f005e9145c827b6692ee4f6386d94",
    "Tools/star_history.py": "58801509a122439429f675295041e35aae89504a638ff31eb76fe97979d7152f",
    "Tools/static_gates.sh": "e82bf5d6b35bf63a75506fbab3e5282e09b4efe86541ebd5bdf9c5d8eb7ce0b7",
    "Tools/static_gates_binary_test.py": "aa07dfd295130d52aaca72810ac7ce65bd701940c06c844a6b7dd7c82f4a9b33",
    "Tools/trace_convert.py": "8ea22dda841860f0f829203c4ece5f68c515c13a39f2c6122bc309a2150f0079",
    "Tools/trace_routers.py": "32ff38f4f0f02d9679dcd16fc57f64694836416baf666075151e9f208be23da6",
    "Tools/verify.sh": "ed2485271adf39581150a38fd56b117e9c82dba7b8e1bed857f7fbeb39991065",
    "Tools/verify_binary_test.py": "739bf1d03823ad77f0f7663af5b223474c5518148a1e51065d168a7109b50762",
    "Tools/verify_corrections.py": "2cf6f0818a3ab39aac948ba78b5f5e3ac5dfc1b8037bb7f48caa7c16fa198a0b",
    "Tools/vision_attention_probe.py": "1575d36927dba5f4ff52d1549a96d93e7c6c190c2c5e8d94644628c672fbe346",
    "Tools/vision_capacity_gate.py": "851a598f05d34cbaf597e56a593de3bf2a9f492a069d77d93ba6f5a7e0a42040",
    "Tools/vision_capacity_gate_test.py": "4cb266cbc6859ba053529f0ddb792199dc2a4e35af798a4d9cd636a123122412",
    "Tools/vision_qualification.py": "5deff2ad8469d8a54b477262d701a8b386395d265df029c37bd7ee6b8812b165",
    "Tools/vision_ref.py": "fa62575c947392f990841e6ac90656737eb67edb000ab369d7b7a0f66a05ef29",
    "Tools/vision_serving.py": "6afd42ebefd87619d3ccb6dc96172366483ea94f7e86ecc0215a7bdf3c6b76fb"
  },
  "limits": "No build, app closure, default activation or paid service. Existing verified local model only. Source/binary/Metal pinned; files saved before exit."
}
````

## /tmp/slotstream-optimization-execution/verification-recovery-v289/run.py

SHA-256 `f9aaa4f594a1f8f8206fb5dd3ed5b5c201385aa2699dd415d2a8dc3b830d3203`; 5975 bytes.

````text
from pathlib import Path
import datetime,json,os,re,signal,sys,time
ROOT=Path('/Users/carlos/Projects/slotstream');P=Path(__file__).parent
sys.path.insert(0,str(ROOT/'Tools'))
from prefill_bench import digest,preflight,vm_snapshot
from serve_bench import competing_jobs,verified_build
from optimization_readiness import pressure_snapshot,require_normal
from optimization_serial_build import guarded_run
import optimization_campaign as campaign
B=ROOT/'.build/optimization/read-failure-candidate-build-v280/candidate/slotstream'
OUT=ROOT/'.build/optimization/verification-recovery-v289'
# The reservation must be granted by the peer before invocation; the argument
# binds a concrete handback deadline and never authorizes extending it.
DEADLINE=datetime.datetime.fromisoformat(sys.argv[1].replace('Z','+00:00')).timestamp()
remaining=int(DEADLINE-time.time()-30)
if remaining<600:raise RuntimeError('targeted recovery requires at least10minutes within the granted interval')
POLICY={'startup_reclaimable_bytes':21_000_000_000,'minimum_live_reclaimable_bytes':3_000_000_000,
 'maximum_owned_rss_bytes':17_500_000_000,'sample_interval_seconds':.2,
 'maximum_build_seconds':min(3600,remaining),'stop_on_new_swapouts':False}
NATIVE_PACKET=ROOT/'.build/optimization/read-failure-candidate-campaign-v281'
native=campaign.status(NATIVE_PACKET)['stages'][:3]
assert [r['stage'] for r in native]==['native/'+n for n in campaign.NATIVE] and all(r['status']=='passed' for r in native)
S={'classification':'One exact original long request with explicit source constants, then at most one complete MTP-plus-vision attempt after a successful 60-second no-VM preflight. V287 omitted BIG_MEMORY from its extracted shell header: long request failed argument parsing with exit64 and did not load a model; that attempt and its MTP swap-in failure are preserved. Same original native binary, workloads, original no-VM and absolute-resource criteria. Governor is already actually passed and not repeated. This is not a full-suite pass.',
 'frozen_at':datetime.datetime.now(datetime.timezone.utc).isoformat(),'deadline_utc':sys.argv[1],
 'build':verified_build(B),'native_prerequisites':native,'native_contract_sha256':digest(NATIVE_PACKET/'qualification-contract.json'),'wrapper_sha256':digest(Path(__file__)),'policy':POLICY,
 'environment':{'SLOTSTREAM_TEST_BINARY':str(B),'SLOTSTREAM_VERIFY_OUT':str(OUT/'verification')},
 'command':['bash',str(P/'checks.sh')],
 'extracted_script_sha256':digest(P/'checks.sh'),
 'source_verification_sha256':digest(ROOT/'Tools/verify.sh'),
 'historical_counterexample':str(ROOT/'.build/optimization/full-verification-v283/manifest.json'),
 'drivers':{str(f.relative_to(ROOT)):digest(f) for f in sorted((ROOT/'Tools').rglob('*')) if f.is_file() and f.suffix in ['.sh','.py','.mjs','.json','.swift','.txt'] and '__pycache__' not in f.parts},
 'limits':'No build, app closure, default activation or paid service. Existing verified local model only. Source/binary/Metal pinned; files saved before exit.'}
P.joinpath('protocol.json').write_text(json.dumps(S,indent=2)+'\n')
OUT.mkdir(exist_ok=False);started=time.monotonic();r={'passed':False,'protocol_sha256':digest(P/'protocol.json')}
def interrupted(number,_frame):raise KeyboardInterrupt(f'full qualification interrupted by signal{number}')
signal.signal(signal.SIGINT,interrupted);signal.signal(signal.SIGTERM,interrupted)
saved={k:v for k,v in os.environ.items() if k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
with (OUT/'pressure.samples.jsonl').open('x') as observations:
 def snapshot():
  state=vm_snapshot();pressure=pressure_snapshot();observations.write(json.dumps({'seconds':time.monotonic()-started,'vm':state,'pressure':pressure})+'\n');observations.flush();require_normal(pressure);return state
 try:
  r['before']=preflight(21);snapshot();assert not competing_jobs()
  assert (ROOT/'.venv31/bin/python').exists()
  for k in saved:os.environ.pop(k,None)
  os.environ.update(S['environment'])
  with (OUT/'stdout.txt').open('w') as stdout,(OUT/'stderr.txt').open('w') as stderr:
   result=guarded_run(S['command'],cwd=ROOT,stdout=stdout,stderr=stderr,record_path=OUT/'memory.json',snapshot=snapshot,policy=POLICY,classification=S['classification'])
  r['exit_code']=result.returncode
  report=(OUT/'stdout.txt').read_text();summary=re.findall(r'^passed (\d+), failed (\d+)$',report,re.M)
  r['summary']=summary;r['skips']=re.findall(r'^SKIP.*$',report,re.M);r['failures']=re.findall(r'^FAIL.*$',report,re.M)
  r['passed']=result.returncode==0 and len(summary)==1 and int(summary[0][0])>0 and summary[0][1]=='0' and not r['skips'] and not r['failures']
 except BaseException as e:r['error']=f'{type(e).__name__}: {e}'
 finally:
  for k in list(os.environ):
   if k.startswith(('SLOTSTREAM_','SS_DEBUG')):os.environ.pop(k,None)
  os.environ.update(saved)
  r['elapsed_seconds']=time.monotonic()-started
  # Primary result is durable before independent restoration checks.
  (OUT/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
  for n,f in {'after':vm_snapshot,'pressure':pressure_snapshot,'candidate_unchanged':lambda:verified_build(B)==S['build'],
   'drivers_unchanged':lambda:all(digest(ROOT/n)==h for n,h in S['drivers'].items()) and digest(P/'checks.sh')==S['extracted_script_sha256'],
   'remaining_jobs':competing_jobs,'model_lock_free':lambda:bool(preflight(0))}.items():
   try:r[n]=f()
   except BaseException as e:r.setdefault('cleanup_errors',{})[n]=f'{type(e).__name__}: {e}'
  r['within_reservation']=time.time()<=DEADLINE
  r['passed']=bool(r['passed'] and not r.get('cleanup_errors') and r.get('candidate_unchanged') and r.get('drivers_unchanged')
   and not r.get('remaining_jobs') and r.get('model_lock_free') and r.get('pressure',{}).get('level')==1 and r['within_reservation'])
  (OUT/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({k:v for k,v in r.items() if k not in ['before','after']}),flush=True)
raise SystemExit(0 if r['passed'] else 1)
````

## /tmp/slotstream-optimization-execution/verify-governor-parser-v286/actual-elastic-drill.txt

SHA-256 `3de2c49e3c36b620c012d5157a04a991640665864d9f9701b93afd83207c9cce`; 1304 bytes.

````text
engine ready in 0.7s: expert cache ~36/512 per layer (1726 global slots = 4.8 GB), eos [248044, 248046]
  (machine has 17.3 GB reclaimable; drill capped at a 4.8 GB pool)
  start:  1726 slots (~36/layer) -> Nile, Amazon, Yangtze
elastic: availability dropped — cache ~36 → ~17 experts/layer (4.8 → 2.2 GB pool, cold — refills from SSD)
  squeeze: 796 slots (~17/layer) -> Nile, Amazon, Yangtze
  recovery stimulus: 8.5 GB available -> 1726 desired slots (2.6 GB growth)
  cooldown: held at 796 slots, as designed
  waiting out the 60 s grow cooldown...
elastic: memory freed — cache ~17 → ~36 experts/layer (2.2 → 4.8 GB pool, contents kept)
  recover: 1726 slots (~36/layer) -> Nile, Amazon, Yangtze
ELASTIC DRILL MEMORY {"ceiling_gb":13,"complete":true,"lifetime_rss_peak_bytes":3169255424,"output_ids":[[45,448,11,7919,11,23699,83,2891],[45,448,11,7919,11,23699,83,2891],[45,448,11,7919,11,23699,83,2891]],"physical_footprint_end_bytes":9999158536,"sampled_peak_bytes":10388573376,"samples":3643,"swapins_after":44114129,"swapins_before":44114129,"swapouts_after":77535166,"swapouts_before":77535166,"target_gb":12.554587904}
ELASTIC DRILL PASS: governor shrank under simulated pressure, honored the grow cooldown, grew back when memory returned, and every generation was byte-identical
````

## /tmp/slotstream-optimization-execution/verify-governor-parser-v286/actual-parser-counterexample.json

SHA-256 `60579d02035177614b636d9eb87b3676adc1869ef3e4ba50d4544e91c613f449`; 534 bytes.

````text
[
  {
    "name": "original",
    "command": [
      "sed",
      "-n",
      "/^ELASTIC DRILL \\(PASS\\|FAIL\\|SKIP\\)/p"
    ],
    "exit_code": 0,
    "stdout": "",
    "stderr": ""
  },
  {
    "name": "portable",
    "command": [
      "sed",
      "-nE",
      "/^ELASTIC DRILL (PASS|FAIL|SKIP)/p"
    ],
    "exit_code": 0,
    "stdout": "ELASTIC DRILL PASS: governor shrank under simulated pressure, honored the grow cooldown, grew back when memory returned, and every generation was byte-identical\n",
    "stderr": ""
  }
]
````

## /tmp/slotstream-optimization-execution/verify-governor-parser-v286/after/verify.sh

SHA-256 `ed2485271adf39581150a38fd56b117e9c82dba7b8e1bed857f7fbeb39991065`; 15437 bytes.

````text
#!/bin/bash
# slotstream verification battery. Runs every correctness gate end to end.
# (SPM unit tests require Xcode; this machine has CLT only — the goldens below
# are the actual acceptance tests and run against the real checkpoint.)
set -eo pipefail
cd "$(dirname "$0")/.."
BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
VERIFY_OUT=${SLOTSTREAM_VERIFY_OUT:-.build/verification-$(date +%Y%m%d-%H%M%S)}
mkdir -p "$VERIFY_OUT"
export BIN SLOTSTREAM_TEST_BINARY="$BIN"
CHECK_INDEX=0
safety_before() {
  python3 - "$1" <<'PYSAFE'
import sys
sys.path.insert(0, 'Tools')
from prefill_bench import preflight
preflight(float(sys.argv[1]))
PYSAFE
}
run_model() { safety_before 13 || return 2; "$@"; }
# Keep the selected path out of evaluated snippets, including substitutions.
run_binary() { "$BIN" "$@"; }
PASS=0; FAIL=0
check() {
  CHECK_INDEX=$((CHECK_INDEX+1))
  local record="$VERIFY_OUT/check-$CHECK_INDEX.txt"
  printf '%s\n%s\n' "$1" "$2" > "$record"
  if [[ "$2" == "run_binary "* ]]; then safety_before 13 || return 2; fi
  if eval "$2" >>"$record" 2>&1; then echo "PASS  $1"; PASS=$((PASS+1))
  else echo "FAIL  $1 (details: $record)"; FAIL=$((FAIL+1)); fi
}
QPID=""
cleanup() {
  if [ -n "$QPID" ]; then
    kill "$QPID" 2>/dev/null || true
    wait "$QPID" 2>/dev/null || true
  fi
}
trap cleanup EXIT INT TERM

# Use a reconstructible frozen binary when supplied; otherwise build normally.
# Check the real process lock and reclaimable memory before heavy work.
safety_before 13
if [ -n "${SLOTSTREAM_TEST_BINARY:-}" ] && [ "$BIN" != .build/release/slotstream ]; then
  python3 - "$BIN" <<'PYBUILD'
import sys
sys.path.insert(0, 'Tools')
from serve_bench import verified_build
verified_build(sys.argv[1])
PYBUILD
  echo "== frozen build: $BIN =="
else
  echo "== build =="
  safety_before 7
  make build >"$VERIFY_OUT/build.txt" 2>&1
fi

# Ordinary equality gates use 8–10 GB. The live governor drill separately
# declares a 13 GB ceiling: its unchanged 1/2 GB deadbands require a larger
# starting arena. It checks its derived target and real headroom before load,
# every explicit poll and generation, and samples its whole memory interval.
SMALL_MEMORY=8.1
BIG_MEMORY=10
ECBIG=960

echo "== weights provenance (hashes all 105.3 GB vs the pinned revisions; the draft head is optional) =="
if python3 - "$BIN" "$VERIFY_OUT/model-verification" <<'PYVERIFY'
import os,sys
from pathlib import Path
sys.path.insert(0, 'Tools')
from context_qualification import quiet_preflight, verification_lock
from prefill_bench import run_child
out=Path(sys.argv[2]);out.mkdir(exist_ok=False)
quiet_preflight(13)
with verification_lock():
    code=run_child([sys.argv[1], 'pull', '--verify'], os.environ.copy(), out, 600)
raise SystemExit(code)
PYVERIFY
then
  echo "PASS  pull --verify: every pinned file matches"; PASS=$((PASS+1))
else
  echo "FAIL  pull --verify (details: $VERIFY_OUT/model-verification)"; FAIL=$((FAIL+1))
  exit 1
fi

echo "== goldens (need bench/parity31 from Tools/parity_ref.py under mlx==0.31.1) =="
run_model "$BIN" ngram-golden --tokens "9707,11,1246,525,498,30" 2>/dev/null | sed 's/^pos[0-9]*: //' > /tmp/ssv_ngram.txt
check "ngram row ids == python reference"  "diff /tmp/ssv_ngram.txt bench/parity31/ngram_ids.txt"
check "chat template == transformers"      "[ \"\$(run_binary template-check 2>/dev/null)\" = '248045,8678,198,2523,513,10631,13,248046,198,248045,846,198,12675,1017,248046,198,248045,74455,198,248068,271,248069,271' ]"
check "layer parity (0-1 bit-exact gate)"  "run_binary parity --tokens '9707,11,1246,525,498,30' --layers 2 --compare bench/parity31"

echo "== planner: right thing across machine setups (simulated, no model needed) =="
if Tools/planner_gates.sh; then
  echo "PASS  planner gates"; PASS=$((PASS+1))
else
  echo "FAIL  planner gates"; FAIL=$((FAIL+1))
fi

echo "== sampler vs numpy reference + elastic governor policy (no weights needed) =="
if Tools/sampler_gates.sh; then
  echo "PASS  sampler + governor gates"; PASS=$((PASS+1))
else
  echo "FAIL  sampler + governor gates"; FAIL=$((FAIL+1))
fi

echo "== golden equivalence: streaming must not change the math =="
run_model "$BIN" run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --memory-gb $BIG_MEMORY 2>/dev/null > /tmp/ssv_big.txt
run_model "$BIN" run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --memory-gb $SMALL_MEMORY 2>/dev/null > /tmp/ssv_small.txt
check "$SMALL_MEMORY GB cache output == $BIG_MEMORY GB cache output" "diff /tmp/ssv_big.txt /tmp/ssv_small.txt"

echo "== elastic pool: live resizes must not change the math =="
check "grow/shrink/regrow byte-identical (elastic-check)" "run_binary elastic-check --big-slots $ECBIG"

# Prefix reuse is deliberately NOT gated on byte-equality with a cold rebuild:
# re-batching the same tokens re-associates their sums, and measured here that
# moves logits LESS than re-chunking a plain prefill already does. The gate is
# that bound plus determinism of the cached path. See MEASUREMENTS.md.
# Drives the governor itself — poll, decide, lock, resize, log — not just its
# policy function, using the availability seam so no real pressure is needed.
# This required full gate fails acceptance when it cannot run with headroom;
# a diagnostic SKIP is not a passing shrink/cooldown/growth result.
echo "== elastic governor: shrinks, honors the cooldown, grows back =="
safety_before 16
DRILL_LOG="$VERIFY_OUT/elastic-drill.txt"
DRILL_STATUS=0
"$BIN" elastic-drill --slots 1000 --max-memory-gb 13 >"$DRILL_LOG" 2>&1 || DRILL_STATUS=$?
DRILL=$(sed -nE '/^ELASTIC DRILL (PASS|FAIL|SKIP)(:|$)/p' "$DRILL_LOG")
if [ "$DRILL_STATUS" -ne 0 ]; then
  DRILL="ELASTIC DRILL FAIL: exit $DRILL_STATUS (details: $DRILL_LOG)"
elif [[ "$DRILL" == *$'\n'* ]]; then
  DRILL="ELASTIC DRILL FAIL: multiple final statuses (details: $DRILL_LOG)"
elif [ -z "$DRILL" ]; then
  DRILL="ELASTIC DRILL FAIL: missing final status (details: $DRILL_LOG)"
fi
case "$DRILL" in
  "ELASTIC DRILL PASS:"*) echo "PASS  $DRILL"; PASS=$((PASS+1)) ;;
  "ELASTIC DRILL SKIP:"*) echo "FAIL  required full gate skipped: $DRILL"; FAIL=$((FAIL+1)) ;;
  *)      echo "FAIL  $DRILL"; FAIL=$((FAIL+1)) ;;
esac

echo "== conversation prefix cache: bounded, flat with depth, deterministic =="
check "prefix reuse within the prefill-rechunk control (prefix-check)" "run_binary prefix-check"

echo "== prefill sweep: matches the pool path, deterministic, blind to the pool =="
check "sweep within the prefill-rechunk control, identical cold and warm (sweep-check)" "run_binary sweep-check"

# The MTP draft head is a separately converted artifact (Tools/mtp_convert.py),
# not part of `pull` — a fresh install legitimately lacks it, so these SKIP
# rather than fail when it is absent.
echo "== MTP draft head: parity with the Python reference + speculative gates =="
MTPFILE="$HOME/.slotstream/models/qwen38-flash-next-mlx-4bit/mtp.safetensors"
if [ -f "$MTPFILE" ]; then
  check "mtp head bit-parity vs Python reference (mtp-parity)" "run_binary mtp-parity"
  # MTP is priced at startup; the combined vision leg needs its own explicit
  # 12 GB target. It must not add a draft head outside an MTP-off plan.
  safety_before 15
  if "$BIN" mtp-check --memory-gb 12 --mtp on --vision on --image Tools/assets/vision_test/secret1.jpg >"$VERIFY_OUT/mtp.txt" 2>&1 \
      && python3 - "$VERIFY_OUT/mtp.txt" <<'PYMTP'
import json,sys
from pathlib import Path
text=Path(sys.argv[1]).read_text()
assert 'PASS  vision speculation deterministic' in text
assert 'PASS  vision speculation ran' in text
assert 'SKIP' not in text and 'MTP CHECK PASS' in text
rows=[json.loads(line.removeprefix('MTP CHECK MEMORY ')) for line in text.splitlines() if line.startswith('MTP CHECK MEMORY ')]
assert len(rows)==1 and rows[0]['memory_validated'] is True
PYMTP
  then
    echo "PASS  speculative decode gates (determinism, state integrity, accept sanity)"; PASS=$((PASS+1))
  else
    echo "FAIL  speculative decode gates"; tail -5 "$VERIFY_OUT/mtp.txt"; FAIL=$((FAIL+1))
  fi
else
  echo "SKIP  mtp gates (no mtp.safetensors — convert with Tools/mtp_convert.py)"
fi

echo "== memory target keeps its promise =="
run_model "$BIN" run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --memory-gb $BIG_MEMORY --sample-footprint --stats-json /tmp/ssv_mem.json 2>/tmp/ssv_mem.err > /tmp/ssv_mem.txt
check "--memory-gb $BIG_MEMORY sampled footprint and RSS stay under target without swap" \
      "python3 Tools/memory_gate.py /tmp/ssv_mem.json --limit-gb $BIG_MEMORY"
check "--memory-gb $BIG_MEMORY output is stable" "diff /tmp/ssv_mem.txt /tmp/ssv_big.txt"

# The short-prompt gate above cannot see KV/indexer growth, which is what made
# the promise hold by 0.1 GB on a long prompt before the prefill pass was
# budgeted. Re-check it where the pressure actually is.
python3 - <<'PYEOF' > /tmp/ssv_long.txt
f = ["Routine maintenance was performed on the north corridor lighting system. ",
     "Inventory counts were reconciled against the quarterly ledger totals. ",
     "The east wing humidity sensors reported nominal values throughout the day. "]
b = "The archive records that the vault combination is SEVENTEEN. "
for i in range(700):
    b += f[i % 3]
print(b + "\n\nQuestion: what is the vault combination? Answer with one word.")
PYEOF
# Use the normal non-thinking chat template. A bare raw prompt can spend the
# entire output allowance in reasoning, which is invalid recall evidence.
run_model "$BIN" run --prompt-file /tmp/ssv_long.txt --max-tokens 16 --greedy --memory-gb $BIG_MEMORY \
  --sample-footprint --stats-json /tmp/ssv_longmem.json \
  2>/tmp/ssv_longmem.err > /tmp/ssv_longmem.txt
check "--memory-gb $BIG_MEMORY sampled footprint and RSS under target on the long prompt without swap" \
      "python3 Tools/memory_gate.py /tmp/ssv_longmem.json --limit-gb $BIG_MEMORY"
check "long-context answer still correct (sparse indexer active)" \
      "python3 Tools/long_context_gate.py /tmp/ssv_longmem.json /tmp/ssv_longmem.txt --expected SEVENTEEN --minimum-prompt-tokens 7000 --maximum-output-tokens 16"

# context-check is the tool that earns any future move of the 32k ceiling; the
# battery runs one small rung so the command itself stays proven (a 2k prompt
# at the small target reads in about a minute).
run_model "$BIN" context-check --tokens 2048 --memory-gb $BIG_MEMORY --sample-footprint --json 2>/dev/null > /tmp/ssv_ctx.json
check "context-check: 2k rung reads inside the plan and reports it" \
      "python3 -c 'import json; d=json.loads(open(\"/tmp/ssv_ctx.json\").read().strip().splitlines()[-1]); assert d[\"fits\"] and d[\"aborted\"] is None and d[\"prefill_tokens\"]==2048, d'"

check "context-check: sampled memory remains under target without swap" \
      "python3 Tools/memory_gate.py /tmp/ssv_ctx.json --limit-gb $BIG_MEMORY"

echo "== serving robustness (inputs that used to crash or corrupt output) =="
echo "== behavioural sanity: has the conversion lost anything obvious? =="
# NOT the FP8 comparison the plan calls for (see N4) — that needs an inference
# credential for Qwen3.8-Flash-Next FP8, which is not provisioned. This catches
# gross quantization or architecture damage and gates future re-quantization.
# `set -e` is on, so every step here has to be failure-tolerant on purpose:
# a `kill` of an already-dead server, and a `wait` on a killed one (which
# returns 143), both abort the whole battery otherwise. That is exactly how an
# earlier version of this block silently truncated the run after this gate.
safety_before 13
"$BIN" serve --port 11467 --memory-gb $BIG_MEMORY >/tmp/ssv_q.log 2>&1 &
QPID=$!
for _ in $(seq 1 120); do
  if curl -s --max-time 3 http://127.0.0.1:11467/api/version >/dev/null 2>&1; then break; fi
  sleep 2
done
if Tools/quality_probe.sh 11467; then
  echo "PASS  behavioural quality probe (15 items)"; PASS=$((PASS+1))
else
  echo "FAIL  behavioural quality probe"; FAIL=$((FAIL+1))
fi
kill $QPID 2>/dev/null || true
wait $QPID 2>/dev/null || true
QPID=""

echo "== weights behind a symlink (Foundation will not list a symlinked dir) =="
MODEL_DIR=models/qwen38-flash-next-mlx-4bit
[ -d "$MODEL_DIR" ] || MODEL_DIR="$HOME/.slotstream/models/qwen38-flash-next-mlx-4bit"
SYM=/tmp/ssv_symlink_model
rm -f "$SYM"; ln -s "$(cd "$MODEL_DIR" && pwd)" "$SYM"
check "run through a symlinked model dir"  "run_binary run --model \"\$SYM\" --memory-gb $SMALL_MEMORY --max-tokens 1 --greedy --prompt hi"
rm -f "$SYM"

safety_before 13
if Tools/api_robustness.sh 11466 13; then
  echo "PASS  serving robustness suite"; PASS=$((PASS+1))
else
  echo "FAIL  serving robustness suite"; FAIL=$((FAIL+1))
fi

echo "== vision =="
# The tower against an independent implementation. It loads 0.9 GB of vision
# tensors and none of the 105 GB trunk, so it is cheap and can run anywhere the
# weights are. mlx 0.31.1 for the same reason the parity goldens use it.
VP="$VERIFY_OUT/vision-parity"
if [ -x .venv31/bin/python ]; then
  check "vision tower dumps its pixels and embeddings" \
    'run_binary vision-parity --out "$VP"'
  safety_before 7
  if .venv31/bin/python Tools/vision_ref.py "$VP" | tail -8; then
    echo "PASS  vision tower matches the float32 reference within the bf16 band"
    PASS=$((PASS+1))
  else
    echo "FAIL  vision tower parity"; FAIL=$((FAIL+1))
  fi
else
  echo "SKIP  vision parity (no .venv31; see CLAUDE.md for the mlx 0.31.1 venv)"
  FAIL=$((FAIL+1)) # Required full vision acceptance did not run.
fi

# Every serving surface, with a real picture, against a real server. The model
# has to name what is in the photograph: a tower wired to the wrong positions
# still answers fluently, and nothing cheaper than this notices.
#
# Full original photographs require a 3.99 GB attention workspace reservation.
# Keep this explicit profile local to this server: ordinary equality/quality
# gates still use BIG_MEMORY. The 10 GB predecessor now correctly refuses the
# larger image before dispatch, and that counterexample remains in db/.
VISION_MEMORY=14.5
VISION_PREFILL=3072
NEED_GB=$(awk "BEGIN{print $VISION_MEMORY + 6}")
AVAIL_GB=$("$BIN" doctor --json 2>/dev/null | python3 -c 'import json,sys; print(json.load(sys.stdin).get("device_available_gb", 0))' 2>/dev/null || echo 0)
if [ "$(awk "BEGIN{print ($AVAIL_GB < $NEED_GB)}")" = "1" ]; then
  echo "SKIP  vision serving suite (only ${AVAIL_GB} GB reclaimable, needs ${NEED_GB})"
  FAIL=$((FAIL+1)) # Required full vision acceptance did not run.
  echo "      re-run after preflight: SLOTSTREAM_PREFILL_CHUNK=$VISION_PREFILL SLOTSTREAM_BENCH_DETAILS=1 $BIN serve --memory-gb $VISION_MEMORY --mtp off --vision on --max-context 32768 --max-prefill-wait 0 --no-elastic --port 11468"
  echo "      then: python3 Tools/vision_serving.py 11468"
else
safety_before "$NEED_GB"
SLOTSTREAM_PREFILL_CHUNK="$VISION_PREFILL" SLOTSTREAM_BENCH_DETAILS=1 "$BIN" serve --memory-gb "$VISION_MEMORY" --mtp off --vision on --max-context 32768 --max-prefill-wait 0 --no-elastic --port 11468 > /tmp/ssv-vision-serve.log 2>&1 &
QPID=$!
for _ in $(seq 1 120); do
  if grep -q "listening on" /tmp/ssv-vision-serve.log 2>/dev/null; then break; fi
  sleep 1
done
if python3 Tools/vision_serving.py 11468; then
  echo "PASS  vision serving suite"; PASS=$((PASS+1))
else
  echo "FAIL  vision serving suite"; FAIL=$((FAIL+1))
fi
kill "$QPID" 2>/dev/null || true
wait "$QPID" 2>/dev/null || true
QPID=""
fi

echo
echo "passed $PASS, failed $FAIL"
[ $FAIL -eq 0 ]
````

## /tmp/slotstream-optimization-execution/verify-governor-parser-v286/after/verify_binary_test.py

SHA-256 `739bf1d03823ad77f0f7663af5b223474c5518148a1e51065d168a7109b50762`; 9664 bytes.

````text
"""Exercise verify.sh's real dispatch/check functions without model or build work."""
import json
import os
from pathlib import Path
import subprocess
import tempfile
import unittest


SCRIPT = Path(__file__).with_name('verify.sh').read_text()


class VerifyBinarySelection(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='slotstream-verify-selection-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.trace = self.root/'trace.jsonl'
        self.safety = self.root/'safety.txt'
        self.paths = {}
        for name, relative in [('release', '.build/release/slotstream'),
                               ('legacy', 'legacy/slotstream'),
                               ('frozen', "frozen space's; $(touch injected)/selected")]:
            path = self.root/relative
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text('''#!/usr/bin/env python3
import json, os, sys
with open(os.environ['VERIFY_FIXTURE_TRACE'], 'a') as output:
    output.write(json.dumps({'binary': __file__, 'arguments': sys.argv[1:]})+'\\n')
if sys.argv[1:] == ['template-check']:
    print('248045,8678,198,2523,513,10631,13,248046,198,248045,846,198,12675,1017,248046,198,248045,74455,198,248068,271,248069,271')
raise SystemExit(int(os.environ.get('VERIFY_FIXTURE_EXIT', '0')))
''')
            path.chmod(0o755)
            self.paths[name] = path

    def run_check(self, changes=None, *, template=False, vision=False):
        # Extract the actual header, check function and one real call site.
        # Replace only the external preflight observation; full verify.sh,
        # its compiler/weight reads and its model battery are never launched.
        header = SCRIPT[SCRIPT.index('BIN='):SCRIPT.index('QPID=""')]
        needle = ('check "vision tower dumps' if vision else
                  'check "chat template ==' if template else 'check "layer parity (')
        lines = SCRIPT.splitlines()
        index = next(i for i, line in enumerate(lines) if line.lstrip().startswith(needle))
        call = lines[index]
        while call.endswith('\\'):
            index += 1
            call += '\n'+lines[index]
        script = 'set -eo pipefail\n'+header+'''
safety_before() {
  printf '%s\\n' "$1" >> "$VERIFY_FIXTURE_SAFETY"
  return "${VERIFY_FIXTURE_PREFLIGHT_EXIT:-0}"
}
'''+call+'\n[ "$FAIL" -eq 0 ]\n'
        env = {k:v for k,v in os.environ.items()
               if k != 'BIN' and not k.startswith(('SLOTSTREAM_', 'SS_DEBUG', 'VERIFY_FIXTURE_'))}
        env.update(SLOTSTREAM_VERIFY_OUT=str(self.root/"results space's"),
                   VP=str(self.root/"vision output's; $(touch injected)"),
                   VERIFY_FIXTURE_TRACE=str(self.trace), VERIFY_FIXTURE_SAFETY=str(self.safety))
        env.update(changes or {})
        p = subprocess.run(['bash', '-c', script], cwd=self.root, env=env,
                           text=True, capture_output=True, timeout=10)
        rows = [json.loads(line) for line in self.trace.read_text().splitlines()] if self.trace.exists() else []
        self.assertFalse((self.root/'injected').exists(), p.stdout+p.stderr)
        return p, rows

    def selected(self, env, name, *, template=False, vision=False):
        p, rows = self.run_check(env, template=template, vision=vision)
        self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(len(rows), 1)
        self.assertEqual(Path(rows[0]['binary']).resolve(), self.paths[name].resolve())
        self.assertEqual(rows[0]['arguments'],
                         ['vision-parity', '--out', str(self.root/"vision output's; $(touch injected)")] if vision else
                         ['template-check'] if template else
                         ['parity', '--tokens', '9707,11,1246,525,498,30', '--layers', '2', '--compare', 'bench/parity31'])
        if not template:
            self.assertEqual(self.safety.read_text(), '13\n')

    def test_default_release(self):
        self.selected({}, 'release')

    def test_legacy_bin(self):
        self.selected({'BIN': str(self.paths['legacy'])}, 'legacy')

    def test_selected_path_preserves_spaces_quotes_and_shell_metacharacters(self):
        self.selected({'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen')

    def test_explicit_selection_has_precedence(self):
        self.selected({'BIN': str(self.paths['legacy']), 'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen')

    def test_template_substitution_uses_selected_path(self):
        self.selected({'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen', template=True)

    def test_vision_output_path_is_passed_as_one_literal_argument(self):
        self.selected({'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen', vision=True)

    def test_missing_selected_file_does_not_fall_back(self):
        p, rows = self.run_check({'SLOTSTREAM_TEST_BINARY': str(self.root/'missing')})
        self.assertNotEqual(p.returncode, 0)
        self.assertEqual(rows, [])

    def test_selected_failure_fails_gate(self):
        p, rows = self.run_check({'SLOTSTREAM_TEST_BINARY': str(self.paths['legacy']), 'VERIFY_FIXTURE_EXIT': '23'})
        self.assertNotEqual(p.returncode, 0)
        self.assertEqual(len(rows), 1)

    def test_failed_preflight_prevents_launch(self):
        p, rows = self.run_check({'SLOTSTREAM_TEST_BINARY': str(self.paths['legacy']), 'VERIFY_FIXTURE_PREFLIGHT_EXIT': '2'})
        self.assertEqual(p.returncode, 2)
        self.assertEqual(rows, [])


class VerifyGovernorStatus(unittest.TestCase):
    def run_status(self, text, status=0):
        with tempfile.TemporaryDirectory(prefix='slotstream-governor-status-') as directory:
            root = Path(directory)
            result = root/"results PASS; $(touch injected)"
            result.mkdir()
            fixture = root/"selected binary's path"
            fixture.write_text("#!/usr/bin/env python3\nimport os,sys\n"
                               "assert sys.argv[1:] == ['elastic-drill','--slots','1000','--max-memory-gb','13']\n"
                               "sys.stdout.write(os.environ['VERIFY_DRILL_TEXT'])\n"
                               "raise SystemExit(int(os.environ['VERIFY_DRILL_STATUS']))\n")
            fixture.chmod(0o755)
            # Execute the actual verification block with the real system sed.
            # Only the native model-producing command is replaced by a fixture.
            start = SCRIPT.index('DRILL_LOG=')
            end = SCRIPT.index('\nesac', start)+len('\nesac')
            block = 'set -eo pipefail\nPASS=0; FAIL=0\n'+SCRIPT[start:end]+'''
printf 'COUNTS %s %s\\n' "$PASS" "$FAIL"
[ "$FAIL" -eq 0 ]
'''
            env = dict(os.environ, BIN=str(fixture), VERIFY_OUT=str(result),
                       VERIFY_DRILL_TEXT=text, VERIFY_DRILL_STATUS=str(status))
            process = subprocess.run(['bash','-c',block], cwd=root, env=env,
                                     text=True, capture_output=True, timeout=10)
            self.assertFalse((root/'injected').exists(), process.stdout+process.stderr)
            self.assertEqual((result/'elastic-drill.txt').read_text(), text)
            return process

    def test_real_status_shape_passes_with_progress_and_memory_record(self):
        process = self.run_status('progress\nELASTIC DRILL MEMORY {"complete":true}\n'
                                  'ELASTIC DRILL PASS: exact recovery\n')
        self.assertEqual(process.returncode, 0, process.stdout+process.stderr)
        self.assertIn('COUNTS 1 0', process.stdout)

    def test_success_without_final_newline_passes(self):
        process = self.run_status('ELASTIC DRILL PASS: exact recovery')
        self.assertEqual(process.returncode, 0, process.stdout+process.stderr)
        self.assertIn('COUNTS 1 0', process.stdout)

    def test_failure_and_skip_cannot_pass_from_words_in_their_details(self):
        for text in ['ELASTIC DRILL FAIL: expected PASS\n',
                     'ELASTIC DRILL SKIP: unable to run PASS case\n']:
            with self.subTest(text=text):
                process = self.run_status(text)
                self.assertNotEqual(process.returncode, 0, process.stdout+process.stderr)
                self.assertIn('COUNTS 0 1', process.stdout)

    def test_process_failure_overrides_success_even_with_pass_in_log_path(self):
        process = self.run_status('ELASTIC DRILL PASS: complete\n', status=23)
        self.assertNotEqual(process.returncode, 0, process.stdout+process.stderr)
        self.assertIn('COUNTS 0 1', process.stdout)

    def test_missing_or_malformed_final_status_fails_closed(self):
        for text in ['', 'other PASS output\n', 'ELASTIC DRILL PASSED: no\n',
                     'ELASTIC DRILL PASS\n', 'ELASTIC DRILL PASSIVE: no\n']:
            with self.subTest(text=text):
                process = self.run_status(text)
                self.assertNotEqual(process.returncode, 0, process.stdout+process.stderr)
                self.assertIn('COUNTS 0 1', process.stdout)

    def test_duplicate_or_conflicting_final_statuses_fail_closed(self):
        for text in ['ELASTIC DRILL PASS: a\nELASTIC DRILL PASS: b\n',
                     'ELASTIC DRILL FAIL: a\nELASTIC DRILL PASS: b\n',
                     'ELASTIC DRILL PASS: a\nELASTIC DRILL FAIL: b\n']:
            with self.subTest(text=text):
                process = self.run_status(text)
                self.assertNotEqual(process.returncode, 0, process.stdout+process.stderr)
                self.assertIn('COUNTS 0 1', process.stdout)


if __name__ == '__main__':
    unittest.main()
````

## /tmp/slotstream-optimization-execution/verify-governor-parser-v286/after-test.py

SHA-256 `739bf1d03823ad77f0f7663af5b223474c5518148a1e51065d168a7109b50762`; 9664 bytes.

````text
"""Exercise verify.sh's real dispatch/check functions without model or build work."""
import json
import os
from pathlib import Path
import subprocess
import tempfile
import unittest


SCRIPT = Path(__file__).with_name('verify.sh').read_text()


class VerifyBinarySelection(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='slotstream-verify-selection-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.trace = self.root/'trace.jsonl'
        self.safety = self.root/'safety.txt'
        self.paths = {}
        for name, relative in [('release', '.build/release/slotstream'),
                               ('legacy', 'legacy/slotstream'),
                               ('frozen', "frozen space's; $(touch injected)/selected")]:
            path = self.root/relative
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text('''#!/usr/bin/env python3
import json, os, sys
with open(os.environ['VERIFY_FIXTURE_TRACE'], 'a') as output:
    output.write(json.dumps({'binary': __file__, 'arguments': sys.argv[1:]})+'\\n')
if sys.argv[1:] == ['template-check']:
    print('248045,8678,198,2523,513,10631,13,248046,198,248045,846,198,12675,1017,248046,198,248045,74455,198,248068,271,248069,271')
raise SystemExit(int(os.environ.get('VERIFY_FIXTURE_EXIT', '0')))
''')
            path.chmod(0o755)
            self.paths[name] = path

    def run_check(self, changes=None, *, template=False, vision=False):
        # Extract the actual header, check function and one real call site.
        # Replace only the external preflight observation; full verify.sh,
        # its compiler/weight reads and its model battery are never launched.
        header = SCRIPT[SCRIPT.index('BIN='):SCRIPT.index('QPID=""')]
        needle = ('check "vision tower dumps' if vision else
                  'check "chat template ==' if template else 'check "layer parity (')
        lines = SCRIPT.splitlines()
        index = next(i for i, line in enumerate(lines) if line.lstrip().startswith(needle))
        call = lines[index]
        while call.endswith('\\'):
            index += 1
            call += '\n'+lines[index]
        script = 'set -eo pipefail\n'+header+'''
safety_before() {
  printf '%s\\n' "$1" >> "$VERIFY_FIXTURE_SAFETY"
  return "${VERIFY_FIXTURE_PREFLIGHT_EXIT:-0}"
}
'''+call+'\n[ "$FAIL" -eq 0 ]\n'
        env = {k:v for k,v in os.environ.items()
               if k != 'BIN' and not k.startswith(('SLOTSTREAM_', 'SS_DEBUG', 'VERIFY_FIXTURE_'))}
        env.update(SLOTSTREAM_VERIFY_OUT=str(self.root/"results space's"),
                   VP=str(self.root/"vision output's; $(touch injected)"),
                   VERIFY_FIXTURE_TRACE=str(self.trace), VERIFY_FIXTURE_SAFETY=str(self.safety))
        env.update(changes or {})
        p = subprocess.run(['bash', '-c', script], cwd=self.root, env=env,
                           text=True, capture_output=True, timeout=10)
        rows = [json.loads(line) for line in self.trace.read_text().splitlines()] if self.trace.exists() else []
        self.assertFalse((self.root/'injected').exists(), p.stdout+p.stderr)
        return p, rows

    def selected(self, env, name, *, template=False, vision=False):
        p, rows = self.run_check(env, template=template, vision=vision)
        self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(len(rows), 1)
        self.assertEqual(Path(rows[0]['binary']).resolve(), self.paths[name].resolve())
        self.assertEqual(rows[0]['arguments'],
                         ['vision-parity', '--out', str(self.root/"vision output's; $(touch injected)")] if vision else
                         ['template-check'] if template else
                         ['parity', '--tokens', '9707,11,1246,525,498,30', '--layers', '2', '--compare', 'bench/parity31'])
        if not template:
            self.assertEqual(self.safety.read_text(), '13\n')

    def test_default_release(self):
        self.selected({}, 'release')

    def test_legacy_bin(self):
        self.selected({'BIN': str(self.paths['legacy'])}, 'legacy')

    def test_selected_path_preserves_spaces_quotes_and_shell_metacharacters(self):
        self.selected({'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen')

    def test_explicit_selection_has_precedence(self):
        self.selected({'BIN': str(self.paths['legacy']), 'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen')

    def test_template_substitution_uses_selected_path(self):
        self.selected({'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen', template=True)

    def test_vision_output_path_is_passed_as_one_literal_argument(self):
        self.selected({'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen', vision=True)

    def test_missing_selected_file_does_not_fall_back(self):
        p, rows = self.run_check({'SLOTSTREAM_TEST_BINARY': str(self.root/'missing')})
        self.assertNotEqual(p.returncode, 0)
        self.assertEqual(rows, [])

    def test_selected_failure_fails_gate(self):
        p, rows = self.run_check({'SLOTSTREAM_TEST_BINARY': str(self.paths['legacy']), 'VERIFY_FIXTURE_EXIT': '23'})
        self.assertNotEqual(p.returncode, 0)
        self.assertEqual(len(rows), 1)

    def test_failed_preflight_prevents_launch(self):
        p, rows = self.run_check({'SLOTSTREAM_TEST_BINARY': str(self.paths['legacy']), 'VERIFY_FIXTURE_PREFLIGHT_EXIT': '2'})
        self.assertEqual(p.returncode, 2)
        self.assertEqual(rows, [])


class VerifyGovernorStatus(unittest.TestCase):
    def run_status(self, text, status=0):
        with tempfile.TemporaryDirectory(prefix='slotstream-governor-status-') as directory:
            root = Path(directory)
            result = root/"results PASS; $(touch injected)"
            result.mkdir()
            fixture = root/"selected binary's path"
            fixture.write_text("#!/usr/bin/env python3\nimport os,sys\n"
                               "assert sys.argv[1:] == ['elastic-drill','--slots','1000','--max-memory-gb','13']\n"
                               "sys.stdout.write(os.environ['VERIFY_DRILL_TEXT'])\n"
                               "raise SystemExit(int(os.environ['VERIFY_DRILL_STATUS']))\n")
            fixture.chmod(0o755)
            # Execute the actual verification block with the real system sed.
            # Only the native model-producing command is replaced by a fixture.
            start = SCRIPT.index('DRILL_LOG=')
            end = SCRIPT.index('\nesac', start)+len('\nesac')
            block = 'set -eo pipefail\nPASS=0; FAIL=0\n'+SCRIPT[start:end]+'''
printf 'COUNTS %s %s\\n' "$PASS" "$FAIL"
[ "$FAIL" -eq 0 ]
'''
            env = dict(os.environ, BIN=str(fixture), VERIFY_OUT=str(result),
                       VERIFY_DRILL_TEXT=text, VERIFY_DRILL_STATUS=str(status))
            process = subprocess.run(['bash','-c',block], cwd=root, env=env,
                                     text=True, capture_output=True, timeout=10)
            self.assertFalse((root/'injected').exists(), process.stdout+process.stderr)
            self.assertEqual((result/'elastic-drill.txt').read_text(), text)
            return process

    def test_real_status_shape_passes_with_progress_and_memory_record(self):
        process = self.run_status('progress\nELASTIC DRILL MEMORY {"complete":true}\n'
                                  'ELASTIC DRILL PASS: exact recovery\n')
        self.assertEqual(process.returncode, 0, process.stdout+process.stderr)
        self.assertIn('COUNTS 1 0', process.stdout)

    def test_success_without_final_newline_passes(self):
        process = self.run_status('ELASTIC DRILL PASS: exact recovery')
        self.assertEqual(process.returncode, 0, process.stdout+process.stderr)
        self.assertIn('COUNTS 1 0', process.stdout)

    def test_failure_and_skip_cannot_pass_from_words_in_their_details(self):
        for text in ['ELASTIC DRILL FAIL: expected PASS\n',
                     'ELASTIC DRILL SKIP: unable to run PASS case\n']:
            with self.subTest(text=text):
                process = self.run_status(text)
                self.assertNotEqual(process.returncode, 0, process.stdout+process.stderr)
                self.assertIn('COUNTS 0 1', process.stdout)

    def test_process_failure_overrides_success_even_with_pass_in_log_path(self):
        process = self.run_status('ELASTIC DRILL PASS: complete\n', status=23)
        self.assertNotEqual(process.returncode, 0, process.stdout+process.stderr)
        self.assertIn('COUNTS 0 1', process.stdout)

    def test_missing_or_malformed_final_status_fails_closed(self):
        for text in ['', 'other PASS output\n', 'ELASTIC DRILL PASSED: no\n',
                     'ELASTIC DRILL PASS\n', 'ELASTIC DRILL PASSIVE: no\n']:
            with self.subTest(text=text):
                process = self.run_status(text)
                self.assertNotEqual(process.returncode, 0, process.stdout+process.stderr)
                self.assertIn('COUNTS 0 1', process.stdout)

    def test_duplicate_or_conflicting_final_statuses_fail_closed(self):
        for text in ['ELASTIC DRILL PASS: a\nELASTIC DRILL PASS: b\n',
                     'ELASTIC DRILL FAIL: a\nELASTIC DRILL PASS: b\n',
                     'ELASTIC DRILL PASS: a\nELASTIC DRILL FAIL: b\n']:
            with self.subTest(text=text):
                process = self.run_status(text)
                self.assertNotEqual(process.returncode, 0, process.stdout+process.stderr)
                self.assertIn('COUNTS 0 1', process.stdout)


if __name__ == '__main__':
    unittest.main()
````

## /tmp/slotstream-optimization-execution/verify-governor-parser-v286/after-tests.stderr

SHA-256 `4d5a5ac40e0b4d0255fe857f25b79524eff313a43ec0fa9602ad7ef1dbbd489a`; 114 bytes.

````text
...............
----------------------------------------------------------------------
Ran 15 tests in 6.350s

OK
````

## /tmp/slotstream-optimization-execution/verify-governor-parser-v286/after-tests.stdout

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/verify-governor-parser-v286/after-verify.sh

SHA-256 `ed2485271adf39581150a38fd56b117e9c82dba7b8e1bed857f7fbeb39991065`; 15437 bytes.

````text
#!/bin/bash
# slotstream verification battery. Runs every correctness gate end to end.
# (SPM unit tests require Xcode; this machine has CLT only — the goldens below
# are the actual acceptance tests and run against the real checkpoint.)
set -eo pipefail
cd "$(dirname "$0")/.."
BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
VERIFY_OUT=${SLOTSTREAM_VERIFY_OUT:-.build/verification-$(date +%Y%m%d-%H%M%S)}
mkdir -p "$VERIFY_OUT"
export BIN SLOTSTREAM_TEST_BINARY="$BIN"
CHECK_INDEX=0
safety_before() {
  python3 - "$1" <<'PYSAFE'
import sys
sys.path.insert(0, 'Tools')
from prefill_bench import preflight
preflight(float(sys.argv[1]))
PYSAFE
}
run_model() { safety_before 13 || return 2; "$@"; }
# Keep the selected path out of evaluated snippets, including substitutions.
run_binary() { "$BIN" "$@"; }
PASS=0; FAIL=0
check() {
  CHECK_INDEX=$((CHECK_INDEX+1))
  local record="$VERIFY_OUT/check-$CHECK_INDEX.txt"
  printf '%s\n%s\n' "$1" "$2" > "$record"
  if [[ "$2" == "run_binary "* ]]; then safety_before 13 || return 2; fi
  if eval "$2" >>"$record" 2>&1; then echo "PASS  $1"; PASS=$((PASS+1))
  else echo "FAIL  $1 (details: $record)"; FAIL=$((FAIL+1)); fi
}
QPID=""
cleanup() {
  if [ -n "$QPID" ]; then
    kill "$QPID" 2>/dev/null || true
    wait "$QPID" 2>/dev/null || true
  fi
}
trap cleanup EXIT INT TERM

# Use a reconstructible frozen binary when supplied; otherwise build normally.
# Check the real process lock and reclaimable memory before heavy work.
safety_before 13
if [ -n "${SLOTSTREAM_TEST_BINARY:-}" ] && [ "$BIN" != .build/release/slotstream ]; then
  python3 - "$BIN" <<'PYBUILD'
import sys
sys.path.insert(0, 'Tools')
from serve_bench import verified_build
verified_build(sys.argv[1])
PYBUILD
  echo "== frozen build: $BIN =="
else
  echo "== build =="
  safety_before 7
  make build >"$VERIFY_OUT/build.txt" 2>&1
fi

# Ordinary equality gates use 8–10 GB. The live governor drill separately
# declares a 13 GB ceiling: its unchanged 1/2 GB deadbands require a larger
# starting arena. It checks its derived target and real headroom before load,
# every explicit poll and generation, and samples its whole memory interval.
SMALL_MEMORY=8.1
BIG_MEMORY=10
ECBIG=960

echo "== weights provenance (hashes all 105.3 GB vs the pinned revisions; the draft head is optional) =="
if python3 - "$BIN" "$VERIFY_OUT/model-verification" <<'PYVERIFY'
import os,sys
from pathlib import Path
sys.path.insert(0, 'Tools')
from context_qualification import quiet_preflight, verification_lock
from prefill_bench import run_child
out=Path(sys.argv[2]);out.mkdir(exist_ok=False)
quiet_preflight(13)
with verification_lock():
    code=run_child([sys.argv[1], 'pull', '--verify'], os.environ.copy(), out, 600)
raise SystemExit(code)
PYVERIFY
then
  echo "PASS  pull --verify: every pinned file matches"; PASS=$((PASS+1))
else
  echo "FAIL  pull --verify (details: $VERIFY_OUT/model-verification)"; FAIL=$((FAIL+1))
  exit 1
fi

echo "== goldens (need bench/parity31 from Tools/parity_ref.py under mlx==0.31.1) =="
run_model "$BIN" ngram-golden --tokens "9707,11,1246,525,498,30" 2>/dev/null | sed 's/^pos[0-9]*: //' > /tmp/ssv_ngram.txt
check "ngram row ids == python reference"  "diff /tmp/ssv_ngram.txt bench/parity31/ngram_ids.txt"
check "chat template == transformers"      "[ \"\$(run_binary template-check 2>/dev/null)\" = '248045,8678,198,2523,513,10631,13,248046,198,248045,846,198,12675,1017,248046,198,248045,74455,198,248068,271,248069,271' ]"
check "layer parity (0-1 bit-exact gate)"  "run_binary parity --tokens '9707,11,1246,525,498,30' --layers 2 --compare bench/parity31"

echo "== planner: right thing across machine setups (simulated, no model needed) =="
if Tools/planner_gates.sh; then
  echo "PASS  planner gates"; PASS=$((PASS+1))
else
  echo "FAIL  planner gates"; FAIL=$((FAIL+1))
fi

echo "== sampler vs numpy reference + elastic governor policy (no weights needed) =="
if Tools/sampler_gates.sh; then
  echo "PASS  sampler + governor gates"; PASS=$((PASS+1))
else
  echo "FAIL  sampler + governor gates"; FAIL=$((FAIL+1))
fi

echo "== golden equivalence: streaming must not change the math =="
run_model "$BIN" run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --memory-gb $BIG_MEMORY 2>/dev/null > /tmp/ssv_big.txt
run_model "$BIN" run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --memory-gb $SMALL_MEMORY 2>/dev/null > /tmp/ssv_small.txt
check "$SMALL_MEMORY GB cache output == $BIG_MEMORY GB cache output" "diff /tmp/ssv_big.txt /tmp/ssv_small.txt"

echo "== elastic pool: live resizes must not change the math =="
check "grow/shrink/regrow byte-identical (elastic-check)" "run_binary elastic-check --big-slots $ECBIG"

# Prefix reuse is deliberately NOT gated on byte-equality with a cold rebuild:
# re-batching the same tokens re-associates their sums, and measured here that
# moves logits LESS than re-chunking a plain prefill already does. The gate is
# that bound plus determinism of the cached path. See MEASUREMENTS.md.
# Drives the governor itself — poll, decide, lock, resize, log — not just its
# policy function, using the availability seam so no real pressure is needed.
# This required full gate fails acceptance when it cannot run with headroom;
# a diagnostic SKIP is not a passing shrink/cooldown/growth result.
echo "== elastic governor: shrinks, honors the cooldown, grows back =="
safety_before 16
DRILL_LOG="$VERIFY_OUT/elastic-drill.txt"
DRILL_STATUS=0
"$BIN" elastic-drill --slots 1000 --max-memory-gb 13 >"$DRILL_LOG" 2>&1 || DRILL_STATUS=$?
DRILL=$(sed -nE '/^ELASTIC DRILL (PASS|FAIL|SKIP)(:|$)/p' "$DRILL_LOG")
if [ "$DRILL_STATUS" -ne 0 ]; then
  DRILL="ELASTIC DRILL FAIL: exit $DRILL_STATUS (details: $DRILL_LOG)"
elif [[ "$DRILL" == *$'\n'* ]]; then
  DRILL="ELASTIC DRILL FAIL: multiple final statuses (details: $DRILL_LOG)"
elif [ -z "$DRILL" ]; then
  DRILL="ELASTIC DRILL FAIL: missing final status (details: $DRILL_LOG)"
fi
case "$DRILL" in
  "ELASTIC DRILL PASS:"*) echo "PASS  $DRILL"; PASS=$((PASS+1)) ;;
  "ELASTIC DRILL SKIP:"*) echo "FAIL  required full gate skipped: $DRILL"; FAIL=$((FAIL+1)) ;;
  *)      echo "FAIL  $DRILL"; FAIL=$((FAIL+1)) ;;
esac

echo "== conversation prefix cache: bounded, flat with depth, deterministic =="
check "prefix reuse within the prefill-rechunk control (prefix-check)" "run_binary prefix-check"

echo "== prefill sweep: matches the pool path, deterministic, blind to the pool =="
check "sweep within the prefill-rechunk control, identical cold and warm (sweep-check)" "run_binary sweep-check"

# The MTP draft head is a separately converted artifact (Tools/mtp_convert.py),
# not part of `pull` — a fresh install legitimately lacks it, so these SKIP
# rather than fail when it is absent.
echo "== MTP draft head: parity with the Python reference + speculative gates =="
MTPFILE="$HOME/.slotstream/models/qwen38-flash-next-mlx-4bit/mtp.safetensors"
if [ -f "$MTPFILE" ]; then
  check "mtp head bit-parity vs Python reference (mtp-parity)" "run_binary mtp-parity"
  # MTP is priced at startup; the combined vision leg needs its own explicit
  # 12 GB target. It must not add a draft head outside an MTP-off plan.
  safety_before 15
  if "$BIN" mtp-check --memory-gb 12 --mtp on --vision on --image Tools/assets/vision_test/secret1.jpg >"$VERIFY_OUT/mtp.txt" 2>&1 \
      && python3 - "$VERIFY_OUT/mtp.txt" <<'PYMTP'
import json,sys
from pathlib import Path
text=Path(sys.argv[1]).read_text()
assert 'PASS  vision speculation deterministic' in text
assert 'PASS  vision speculation ran' in text
assert 'SKIP' not in text and 'MTP CHECK PASS' in text
rows=[json.loads(line.removeprefix('MTP CHECK MEMORY ')) for line in text.splitlines() if line.startswith('MTP CHECK MEMORY ')]
assert len(rows)==1 and rows[0]['memory_validated'] is True
PYMTP
  then
    echo "PASS  speculative decode gates (determinism, state integrity, accept sanity)"; PASS=$((PASS+1))
  else
    echo "FAIL  speculative decode gates"; tail -5 "$VERIFY_OUT/mtp.txt"; FAIL=$((FAIL+1))
  fi
else
  echo "SKIP  mtp gates (no mtp.safetensors — convert with Tools/mtp_convert.py)"
fi

echo "== memory target keeps its promise =="
run_model "$BIN" run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --memory-gb $BIG_MEMORY --sample-footprint --stats-json /tmp/ssv_mem.json 2>/tmp/ssv_mem.err > /tmp/ssv_mem.txt
check "--memory-gb $BIG_MEMORY sampled footprint and RSS stay under target without swap" \
      "python3 Tools/memory_gate.py /tmp/ssv_mem.json --limit-gb $BIG_MEMORY"
check "--memory-gb $BIG_MEMORY output is stable" "diff /tmp/ssv_mem.txt /tmp/ssv_big.txt"

# The short-prompt gate above cannot see KV/indexer growth, which is what made
# the promise hold by 0.1 GB on a long prompt before the prefill pass was
# budgeted. Re-check it where the pressure actually is.
python3 - <<'PYEOF' > /tmp/ssv_long.txt
f = ["Routine maintenance was performed on the north corridor lighting system. ",
     "Inventory counts were reconciled against the quarterly ledger totals. ",
     "The east wing humidity sensors reported nominal values throughout the day. "]
b = "The archive records that the vault combination is SEVENTEEN. "
for i in range(700):
    b += f[i % 3]
print(b + "\n\nQuestion: what is the vault combination? Answer with one word.")
PYEOF
# Use the normal non-thinking chat template. A bare raw prompt can spend the
# entire output allowance in reasoning, which is invalid recall evidence.
run_model "$BIN" run --prompt-file /tmp/ssv_long.txt --max-tokens 16 --greedy --memory-gb $BIG_MEMORY \
  --sample-footprint --stats-json /tmp/ssv_longmem.json \
  2>/tmp/ssv_longmem.err > /tmp/ssv_longmem.txt
check "--memory-gb $BIG_MEMORY sampled footprint and RSS under target on the long prompt without swap" \
      "python3 Tools/memory_gate.py /tmp/ssv_longmem.json --limit-gb $BIG_MEMORY"
check "long-context answer still correct (sparse indexer active)" \
      "python3 Tools/long_context_gate.py /tmp/ssv_longmem.json /tmp/ssv_longmem.txt --expected SEVENTEEN --minimum-prompt-tokens 7000 --maximum-output-tokens 16"

# context-check is the tool that earns any future move of the 32k ceiling; the
# battery runs one small rung so the command itself stays proven (a 2k prompt
# at the small target reads in about a minute).
run_model "$BIN" context-check --tokens 2048 --memory-gb $BIG_MEMORY --sample-footprint --json 2>/dev/null > /tmp/ssv_ctx.json
check "context-check: 2k rung reads inside the plan and reports it" \
      "python3 -c 'import json; d=json.loads(open(\"/tmp/ssv_ctx.json\").read().strip().splitlines()[-1]); assert d[\"fits\"] and d[\"aborted\"] is None and d[\"prefill_tokens\"]==2048, d'"

check "context-check: sampled memory remains under target without swap" \
      "python3 Tools/memory_gate.py /tmp/ssv_ctx.json --limit-gb $BIG_MEMORY"

echo "== serving robustness (inputs that used to crash or corrupt output) =="
echo "== behavioural sanity: has the conversion lost anything obvious? =="
# NOT the FP8 comparison the plan calls for (see N4) — that needs an inference
# credential for Qwen3.8-Flash-Next FP8, which is not provisioned. This catches
# gross quantization or architecture damage and gates future re-quantization.
# `set -e` is on, so every step here has to be failure-tolerant on purpose:
# a `kill` of an already-dead server, and a `wait` on a killed one (which
# returns 143), both abort the whole battery otherwise. That is exactly how an
# earlier version of this block silently truncated the run after this gate.
safety_before 13
"$BIN" serve --port 11467 --memory-gb $BIG_MEMORY >/tmp/ssv_q.log 2>&1 &
QPID=$!
for _ in $(seq 1 120); do
  if curl -s --max-time 3 http://127.0.0.1:11467/api/version >/dev/null 2>&1; then break; fi
  sleep 2
done
if Tools/quality_probe.sh 11467; then
  echo "PASS  behavioural quality probe (15 items)"; PASS=$((PASS+1))
else
  echo "FAIL  behavioural quality probe"; FAIL=$((FAIL+1))
fi
kill $QPID 2>/dev/null || true
wait $QPID 2>/dev/null || true
QPID=""

echo "== weights behind a symlink (Foundation will not list a symlinked dir) =="
MODEL_DIR=models/qwen38-flash-next-mlx-4bit
[ -d "$MODEL_DIR" ] || MODEL_DIR="$HOME/.slotstream/models/qwen38-flash-next-mlx-4bit"
SYM=/tmp/ssv_symlink_model
rm -f "$SYM"; ln -s "$(cd "$MODEL_DIR" && pwd)" "$SYM"
check "run through a symlinked model dir"  "run_binary run --model \"\$SYM\" --memory-gb $SMALL_MEMORY --max-tokens 1 --greedy --prompt hi"
rm -f "$SYM"

safety_before 13
if Tools/api_robustness.sh 11466 13; then
  echo "PASS  serving robustness suite"; PASS=$((PASS+1))
else
  echo "FAIL  serving robustness suite"; FAIL=$((FAIL+1))
fi

echo "== vision =="
# The tower against an independent implementation. It loads 0.9 GB of vision
# tensors and none of the 105 GB trunk, so it is cheap and can run anywhere the
# weights are. mlx 0.31.1 for the same reason the parity goldens use it.
VP="$VERIFY_OUT/vision-parity"
if [ -x .venv31/bin/python ]; then
  check "vision tower dumps its pixels and embeddings" \
    'run_binary vision-parity --out "$VP"'
  safety_before 7
  if .venv31/bin/python Tools/vision_ref.py "$VP" | tail -8; then
    echo "PASS  vision tower matches the float32 reference within the bf16 band"
    PASS=$((PASS+1))
  else
    echo "FAIL  vision tower parity"; FAIL=$((FAIL+1))
  fi
else
  echo "SKIP  vision parity (no .venv31; see CLAUDE.md for the mlx 0.31.1 venv)"
  FAIL=$((FAIL+1)) # Required full vision acceptance did not run.
fi

# Every serving surface, with a real picture, against a real server. The model
# has to name what is in the photograph: a tower wired to the wrong positions
# still answers fluently, and nothing cheaper than this notices.
#
# Full original photographs require a 3.99 GB attention workspace reservation.
# Keep this explicit profile local to this server: ordinary equality/quality
# gates still use BIG_MEMORY. The 10 GB predecessor now correctly refuses the
# larger image before dispatch, and that counterexample remains in db/.
VISION_MEMORY=14.5
VISION_PREFILL=3072
NEED_GB=$(awk "BEGIN{print $VISION_MEMORY + 6}")
AVAIL_GB=$("$BIN" doctor --json 2>/dev/null | python3 -c 'import json,sys; print(json.load(sys.stdin).get("device_available_gb", 0))' 2>/dev/null || echo 0)
if [ "$(awk "BEGIN{print ($AVAIL_GB < $NEED_GB)}")" = "1" ]; then
  echo "SKIP  vision serving suite (only ${AVAIL_GB} GB reclaimable, needs ${NEED_GB})"
  FAIL=$((FAIL+1)) # Required full vision acceptance did not run.
  echo "      re-run after preflight: SLOTSTREAM_PREFILL_CHUNK=$VISION_PREFILL SLOTSTREAM_BENCH_DETAILS=1 $BIN serve --memory-gb $VISION_MEMORY --mtp off --vision on --max-context 32768 --max-prefill-wait 0 --no-elastic --port 11468"
  echo "      then: python3 Tools/vision_serving.py 11468"
else
safety_before "$NEED_GB"
SLOTSTREAM_PREFILL_CHUNK="$VISION_PREFILL" SLOTSTREAM_BENCH_DETAILS=1 "$BIN" serve --memory-gb "$VISION_MEMORY" --mtp off --vision on --max-context 32768 --max-prefill-wait 0 --no-elastic --port 11468 > /tmp/ssv-vision-serve.log 2>&1 &
QPID=$!
for _ in $(seq 1 120); do
  if grep -q "listening on" /tmp/ssv-vision-serve.log 2>/dev/null; then break; fi
  sleep 1
done
if python3 Tools/vision_serving.py 11468; then
  echo "PASS  vision serving suite"; PASS=$((PASS+1))
else
  echo "FAIL  vision serving suite"; FAIL=$((FAIL+1))
fi
kill "$QPID" 2>/dev/null || true
wait "$QPID" 2>/dev/null || true
QPID=""
fi

echo
echo "passed $PASS, failed $FAIL"
[ $FAIL -eq 0 ]
````

## /tmp/slotstream-optimization-execution/verify-governor-parser-v286/applied-verification.json

SHA-256 `1b366566c894fcd635e3afb5cbc7878c8ac60df70e294d0da870671ca2a45165`; 680 bytes.

````text
{
  "captured_at": "2026-09-07T09:43:45.047064+00:00",
  "classification": "Actual repo parser regression check, no model or Slotstream build",
  "files": {
    "/Users/carlos/Projects/slotstream/Tools/verify.sh": "ed2485271adf39581150a38fd56b117e9c82dba7b8e1bed857f7fbeb39991065",
    "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py": "739bf1d03823ad77f0f7663af5b223474c5518148a1e51065d168a7109b50762"
  },
  "test_command": [
    "python3",
    "Tools/verify_binary_test.py"
  ],
  "prior_actual_test_result": "15 tests passed in 4.446 seconds; session94898 exit0",
  "syntax_command": [
    "bash",
    "-n",
    "Tools/verify.sh"
  ],
  "syntax_exit_code": 0
}
````

## /tmp/slotstream-optimization-execution/verify-governor-parser-v286/applied.json

SHA-256 `f6380f5516f8baac9f7fa511b4c61f208fa775999ec54b1368ed4ee9fbee52e4`; 132 bytes.

````text
[
  {
    "path": "Tools/verify.sh",
    "bytes": 15437
  },
  {
    "path": "Tools/verify_binary_test.py",
    "bytes": 9664
  }
]
````

## /tmp/slotstream-optimization-execution/verify-governor-parser-v286/before/verify.sh

SHA-256 `5afd9e6a87ef2df8bbc0a39b6bddbc064a2a494b72e191819c7422223ddbdcaa`; 15200 bytes.

````text
#!/bin/bash
# slotstream verification battery. Runs every correctness gate end to end.
# (SPM unit tests require Xcode; this machine has CLT only — the goldens below
# are the actual acceptance tests and run against the real checkpoint.)
set -eo pipefail
cd "$(dirname "$0")/.."
BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
VERIFY_OUT=${SLOTSTREAM_VERIFY_OUT:-.build/verification-$(date +%Y%m%d-%H%M%S)}
mkdir -p "$VERIFY_OUT"
export BIN SLOTSTREAM_TEST_BINARY="$BIN"
CHECK_INDEX=0
safety_before() {
  python3 - "$1" <<'PYSAFE'
import sys
sys.path.insert(0, 'Tools')
from prefill_bench import preflight
preflight(float(sys.argv[1]))
PYSAFE
}
run_model() { safety_before 13 || return 2; "$@"; }
# Keep the selected path out of evaluated snippets, including substitutions.
run_binary() { "$BIN" "$@"; }
PASS=0; FAIL=0
check() {
  CHECK_INDEX=$((CHECK_INDEX+1))
  local record="$VERIFY_OUT/check-$CHECK_INDEX.txt"
  printf '%s\n%s\n' "$1" "$2" > "$record"
  if [[ "$2" == "run_binary "* ]]; then safety_before 13 || return 2; fi
  if eval "$2" >>"$record" 2>&1; then echo "PASS  $1"; PASS=$((PASS+1))
  else echo "FAIL  $1 (details: $record)"; FAIL=$((FAIL+1)); fi
}
QPID=""
cleanup() {
  if [ -n "$QPID" ]; then
    kill "$QPID" 2>/dev/null || true
    wait "$QPID" 2>/dev/null || true
  fi
}
trap cleanup EXIT INT TERM

# Use a reconstructible frozen binary when supplied; otherwise build normally.
# Check the real process lock and reclaimable memory before heavy work.
safety_before 13
if [ -n "${SLOTSTREAM_TEST_BINARY:-}" ] && [ "$BIN" != .build/release/slotstream ]; then
  python3 - "$BIN" <<'PYBUILD'
import sys
sys.path.insert(0, 'Tools')
from serve_bench import verified_build
verified_build(sys.argv[1])
PYBUILD
  echo "== frozen build: $BIN =="
else
  echo "== build =="
  safety_before 7
  make build >"$VERIFY_OUT/build.txt" 2>&1
fi

# Ordinary equality gates use 8–10 GB. The live governor drill separately
# declares a 13 GB ceiling: its unchanged 1/2 GB deadbands require a larger
# starting arena. It checks its derived target and real headroom before load,
# every explicit poll and generation, and samples its whole memory interval.
SMALL_MEMORY=8.1
BIG_MEMORY=10
ECBIG=960

echo "== weights provenance (hashes all 105.3 GB vs the pinned revisions; the draft head is optional) =="
if python3 - "$BIN" "$VERIFY_OUT/model-verification" <<'PYVERIFY'
import os,sys
from pathlib import Path
sys.path.insert(0, 'Tools')
from context_qualification import quiet_preflight, verification_lock
from prefill_bench import run_child
out=Path(sys.argv[2]);out.mkdir(exist_ok=False)
quiet_preflight(13)
with verification_lock():
    code=run_child([sys.argv[1], 'pull', '--verify'], os.environ.copy(), out, 600)
raise SystemExit(code)
PYVERIFY
then
  echo "PASS  pull --verify: every pinned file matches"; PASS=$((PASS+1))
else
  echo "FAIL  pull --verify (details: $VERIFY_OUT/model-verification)"; FAIL=$((FAIL+1))
  exit 1
fi

echo "== goldens (need bench/parity31 from Tools/parity_ref.py under mlx==0.31.1) =="
run_model "$BIN" ngram-golden --tokens "9707,11,1246,525,498,30" 2>/dev/null | sed 's/^pos[0-9]*: //' > /tmp/ssv_ngram.txt
check "ngram row ids == python reference"  "diff /tmp/ssv_ngram.txt bench/parity31/ngram_ids.txt"
check "chat template == transformers"      "[ \"\$(run_binary template-check 2>/dev/null)\" = '248045,8678,198,2523,513,10631,13,248046,198,248045,846,198,12675,1017,248046,198,248045,74455,198,248068,271,248069,271' ]"
check "layer parity (0-1 bit-exact gate)"  "run_binary parity --tokens '9707,11,1246,525,498,30' --layers 2 --compare bench/parity31"

echo "== planner: right thing across machine setups (simulated, no model needed) =="
if Tools/planner_gates.sh; then
  echo "PASS  planner gates"; PASS=$((PASS+1))
else
  echo "FAIL  planner gates"; FAIL=$((FAIL+1))
fi

echo "== sampler vs numpy reference + elastic governor policy (no weights needed) =="
if Tools/sampler_gates.sh; then
  echo "PASS  sampler + governor gates"; PASS=$((PASS+1))
else
  echo "FAIL  sampler + governor gates"; FAIL=$((FAIL+1))
fi

echo "== golden equivalence: streaming must not change the math =="
run_model "$BIN" run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --memory-gb $BIG_MEMORY 2>/dev/null > /tmp/ssv_big.txt
run_model "$BIN" run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --memory-gb $SMALL_MEMORY 2>/dev/null > /tmp/ssv_small.txt
check "$SMALL_MEMORY GB cache output == $BIG_MEMORY GB cache output" "diff /tmp/ssv_big.txt /tmp/ssv_small.txt"

echo "== elastic pool: live resizes must not change the math =="
check "grow/shrink/regrow byte-identical (elastic-check)" "run_binary elastic-check --big-slots $ECBIG"

# Prefix reuse is deliberately NOT gated on byte-equality with a cold rebuild:
# re-batching the same tokens re-associates their sums, and measured here that
# moves logits LESS than re-chunking a plain prefill already does. The gate is
# that bound plus determinism of the cached path. See MEASUREMENTS.md.
# Drives the governor itself — poll, decide, lock, resize, log — not just its
# policy function, using the availability seam so no real pressure is needed.
# This required full gate fails acceptance when it cannot run with headroom;
# a diagnostic SKIP is not a passing shrink/cooldown/growth result.
echo "== elastic governor: shrinks, honors the cooldown, grows back =="
safety_before 16
DRILL_LOG="$VERIFY_OUT/elastic-drill.txt"
DRILL_STATUS=0
"$BIN" elastic-drill --slots 1000 --max-memory-gb 13 >"$DRILL_LOG" 2>&1 || DRILL_STATUS=$?
DRILL=$(sed -n '/^ELASTIC DRILL \(PASS\|FAIL\|SKIP\)/p' "$DRILL_LOG" | tail -1)
if [ "$DRILL_STATUS" -ne 0 ]; then
  DRILL="ELASTIC DRILL FAIL: exit $DRILL_STATUS (details: $DRILL_LOG)"
fi
case "$DRILL" in
  *PASS*) echo "PASS  $DRILL"; PASS=$((PASS+1)) ;;
  *SKIP*) echo "FAIL  required full gate skipped: $DRILL"; FAIL=$((FAIL+1)) ;;
  *)      echo "FAIL  $DRILL"; FAIL=$((FAIL+1)) ;;
esac

echo "== conversation prefix cache: bounded, flat with depth, deterministic =="
check "prefix reuse within the prefill-rechunk control (prefix-check)" "run_binary prefix-check"

echo "== prefill sweep: matches the pool path, deterministic, blind to the pool =="
check "sweep within the prefill-rechunk control, identical cold and warm (sweep-check)" "run_binary sweep-check"

# The MTP draft head is a separately converted artifact (Tools/mtp_convert.py),
# not part of `pull` — a fresh install legitimately lacks it, so these SKIP
# rather than fail when it is absent.
echo "== MTP draft head: parity with the Python reference + speculative gates =="
MTPFILE="$HOME/.slotstream/models/qwen38-flash-next-mlx-4bit/mtp.safetensors"
if [ -f "$MTPFILE" ]; then
  check "mtp head bit-parity vs Python reference (mtp-parity)" "run_binary mtp-parity"
  # MTP is priced at startup; the combined vision leg needs its own explicit
  # 12 GB target. It must not add a draft head outside an MTP-off plan.
  safety_before 15
  if "$BIN" mtp-check --memory-gb 12 --mtp on --vision on --image Tools/assets/vision_test/secret1.jpg >"$VERIFY_OUT/mtp.txt" 2>&1 \
      && python3 - "$VERIFY_OUT/mtp.txt" <<'PYMTP'
import json,sys
from pathlib import Path
text=Path(sys.argv[1]).read_text()
assert 'PASS  vision speculation deterministic' in text
assert 'PASS  vision speculation ran' in text
assert 'SKIP' not in text and 'MTP CHECK PASS' in text
rows=[json.loads(line.removeprefix('MTP CHECK MEMORY ')) for line in text.splitlines() if line.startswith('MTP CHECK MEMORY ')]
assert len(rows)==1 and rows[0]['memory_validated'] is True
PYMTP
  then
    echo "PASS  speculative decode gates (determinism, state integrity, accept sanity)"; PASS=$((PASS+1))
  else
    echo "FAIL  speculative decode gates"; tail -5 "$VERIFY_OUT/mtp.txt"; FAIL=$((FAIL+1))
  fi
else
  echo "SKIP  mtp gates (no mtp.safetensors — convert with Tools/mtp_convert.py)"
fi

echo "== memory target keeps its promise =="
run_model "$BIN" run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --memory-gb $BIG_MEMORY --sample-footprint --stats-json /tmp/ssv_mem.json 2>/tmp/ssv_mem.err > /tmp/ssv_mem.txt
check "--memory-gb $BIG_MEMORY sampled footprint and RSS stay under target without swap" \
      "python3 Tools/memory_gate.py /tmp/ssv_mem.json --limit-gb $BIG_MEMORY"
check "--memory-gb $BIG_MEMORY output is stable" "diff /tmp/ssv_mem.txt /tmp/ssv_big.txt"

# The short-prompt gate above cannot see KV/indexer growth, which is what made
# the promise hold by 0.1 GB on a long prompt before the prefill pass was
# budgeted. Re-check it where the pressure actually is.
python3 - <<'PYEOF' > /tmp/ssv_long.txt
f = ["Routine maintenance was performed on the north corridor lighting system. ",
     "Inventory counts were reconciled against the quarterly ledger totals. ",
     "The east wing humidity sensors reported nominal values throughout the day. "]
b = "The archive records that the vault combination is SEVENTEEN. "
for i in range(700):
    b += f[i % 3]
print(b + "\n\nQuestion: what is the vault combination? Answer with one word.")
PYEOF
# Use the normal non-thinking chat template. A bare raw prompt can spend the
# entire output allowance in reasoning, which is invalid recall evidence.
run_model "$BIN" run --prompt-file /tmp/ssv_long.txt --max-tokens 16 --greedy --memory-gb $BIG_MEMORY \
  --sample-footprint --stats-json /tmp/ssv_longmem.json \
  2>/tmp/ssv_longmem.err > /tmp/ssv_longmem.txt
check "--memory-gb $BIG_MEMORY sampled footprint and RSS under target on the long prompt without swap" \
      "python3 Tools/memory_gate.py /tmp/ssv_longmem.json --limit-gb $BIG_MEMORY"
check "long-context answer still correct (sparse indexer active)" \
      "python3 Tools/long_context_gate.py /tmp/ssv_longmem.json /tmp/ssv_longmem.txt --expected SEVENTEEN --minimum-prompt-tokens 7000 --maximum-output-tokens 16"

# context-check is the tool that earns any future move of the 32k ceiling; the
# battery runs one small rung so the command itself stays proven (a 2k prompt
# at the small target reads in about a minute).
run_model "$BIN" context-check --tokens 2048 --memory-gb $BIG_MEMORY --sample-footprint --json 2>/dev/null > /tmp/ssv_ctx.json
check "context-check: 2k rung reads inside the plan and reports it" \
      "python3 -c 'import json; d=json.loads(open(\"/tmp/ssv_ctx.json\").read().strip().splitlines()[-1]); assert d[\"fits\"] and d[\"aborted\"] is None and d[\"prefill_tokens\"]==2048, d'"

check "context-check: sampled memory remains under target without swap" \
      "python3 Tools/memory_gate.py /tmp/ssv_ctx.json --limit-gb $BIG_MEMORY"

echo "== serving robustness (inputs that used to crash or corrupt output) =="
echo "== behavioural sanity: has the conversion lost anything obvious? =="
# NOT the FP8 comparison the plan calls for (see N4) — that needs an inference
# credential for Qwen3.8-Flash-Next FP8, which is not provisioned. This catches
# gross quantization or architecture damage and gates future re-quantization.
# `set -e` is on, so every step here has to be failure-tolerant on purpose:
# a `kill` of an already-dead server, and a `wait` on a killed one (which
# returns 143), both abort the whole battery otherwise. That is exactly how an
# earlier version of this block silently truncated the run after this gate.
safety_before 13
"$BIN" serve --port 11467 --memory-gb $BIG_MEMORY >/tmp/ssv_q.log 2>&1 &
QPID=$!
for _ in $(seq 1 120); do
  if curl -s --max-time 3 http://127.0.0.1:11467/api/version >/dev/null 2>&1; then break; fi
  sleep 2
done
if Tools/quality_probe.sh 11467; then
  echo "PASS  behavioural quality probe (15 items)"; PASS=$((PASS+1))
else
  echo "FAIL  behavioural quality probe"; FAIL=$((FAIL+1))
fi
kill $QPID 2>/dev/null || true
wait $QPID 2>/dev/null || true
QPID=""

echo "== weights behind a symlink (Foundation will not list a symlinked dir) =="
MODEL_DIR=models/qwen38-flash-next-mlx-4bit
[ -d "$MODEL_DIR" ] || MODEL_DIR="$HOME/.slotstream/models/qwen38-flash-next-mlx-4bit"
SYM=/tmp/ssv_symlink_model
rm -f "$SYM"; ln -s "$(cd "$MODEL_DIR" && pwd)" "$SYM"
check "run through a symlinked model dir"  "run_binary run --model \"\$SYM\" --memory-gb $SMALL_MEMORY --max-tokens 1 --greedy --prompt hi"
rm -f "$SYM"

safety_before 13
if Tools/api_robustness.sh 11466 13; then
  echo "PASS  serving robustness suite"; PASS=$((PASS+1))
else
  echo "FAIL  serving robustness suite"; FAIL=$((FAIL+1))
fi

echo "== vision =="
# The tower against an independent implementation. It loads 0.9 GB of vision
# tensors and none of the 105 GB trunk, so it is cheap and can run anywhere the
# weights are. mlx 0.31.1 for the same reason the parity goldens use it.
VP="$VERIFY_OUT/vision-parity"
if [ -x .venv31/bin/python ]; then
  check "vision tower dumps its pixels and embeddings" \
    'run_binary vision-parity --out "$VP"'
  safety_before 7
  if .venv31/bin/python Tools/vision_ref.py "$VP" | tail -8; then
    echo "PASS  vision tower matches the float32 reference within the bf16 band"
    PASS=$((PASS+1))
  else
    echo "FAIL  vision tower parity"; FAIL=$((FAIL+1))
  fi
else
  echo "SKIP  vision parity (no .venv31; see CLAUDE.md for the mlx 0.31.1 venv)"
  FAIL=$((FAIL+1)) # Required full vision acceptance did not run.
fi

# Every serving surface, with a real picture, against a real server. The model
# has to name what is in the photograph: a tower wired to the wrong positions
# still answers fluently, and nothing cheaper than this notices.
#
# Full original photographs require a 3.99 GB attention workspace reservation.
# Keep this explicit profile local to this server: ordinary equality/quality
# gates still use BIG_MEMORY. The 10 GB predecessor now correctly refuses the
# larger image before dispatch, and that counterexample remains in db/.
VISION_MEMORY=14.5
VISION_PREFILL=3072
NEED_GB=$(awk "BEGIN{print $VISION_MEMORY + 6}")
AVAIL_GB=$("$BIN" doctor --json 2>/dev/null | python3 -c 'import json,sys; print(json.load(sys.stdin).get("device_available_gb", 0))' 2>/dev/null || echo 0)
if [ "$(awk "BEGIN{print ($AVAIL_GB < $NEED_GB)}")" = "1" ]; then
  echo "SKIP  vision serving suite (only ${AVAIL_GB} GB reclaimable, needs ${NEED_GB})"
  FAIL=$((FAIL+1)) # Required full vision acceptance did not run.
  echo "      re-run after preflight: SLOTSTREAM_PREFILL_CHUNK=$VISION_PREFILL SLOTSTREAM_BENCH_DETAILS=1 $BIN serve --memory-gb $VISION_MEMORY --mtp off --vision on --max-context 32768 --max-prefill-wait 0 --no-elastic --port 11468"
  echo "      then: python3 Tools/vision_serving.py 11468"
else
safety_before "$NEED_GB"
SLOTSTREAM_PREFILL_CHUNK="$VISION_PREFILL" SLOTSTREAM_BENCH_DETAILS=1 "$BIN" serve --memory-gb "$VISION_MEMORY" --mtp off --vision on --max-context 32768 --max-prefill-wait 0 --no-elastic --port 11468 > /tmp/ssv-vision-serve.log 2>&1 &
QPID=$!
for _ in $(seq 1 120); do
  if grep -q "listening on" /tmp/ssv-vision-serve.log 2>/dev/null; then break; fi
  sleep 1
done
if python3 Tools/vision_serving.py 11468; then
  echo "PASS  vision serving suite"; PASS=$((PASS+1))
else
  echo "FAIL  vision serving suite"; FAIL=$((FAIL+1))
fi
kill "$QPID" 2>/dev/null || true
wait "$QPID" 2>/dev/null || true
QPID=""
fi

echo
echo "passed $PASS, failed $FAIL"
[ $FAIL -eq 0 ]
````

## /tmp/slotstream-optimization-execution/verify-governor-parser-v286/before/verify_binary_test.py

SHA-256 `739bf1d03823ad77f0f7663af5b223474c5518148a1e51065d168a7109b50762`; 9664 bytes.

````text
"""Exercise verify.sh's real dispatch/check functions without model or build work."""
import json
import os
from pathlib import Path
import subprocess
import tempfile
import unittest


SCRIPT = Path(__file__).with_name('verify.sh').read_text()


class VerifyBinarySelection(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='slotstream-verify-selection-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.trace = self.root/'trace.jsonl'
        self.safety = self.root/'safety.txt'
        self.paths = {}
        for name, relative in [('release', '.build/release/slotstream'),
                               ('legacy', 'legacy/slotstream'),
                               ('frozen', "frozen space's; $(touch injected)/selected")]:
            path = self.root/relative
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text('''#!/usr/bin/env python3
import json, os, sys
with open(os.environ['VERIFY_FIXTURE_TRACE'], 'a') as output:
    output.write(json.dumps({'binary': __file__, 'arguments': sys.argv[1:]})+'\\n')
if sys.argv[1:] == ['template-check']:
    print('248045,8678,198,2523,513,10631,13,248046,198,248045,846,198,12675,1017,248046,198,248045,74455,198,248068,271,248069,271')
raise SystemExit(int(os.environ.get('VERIFY_FIXTURE_EXIT', '0')))
''')
            path.chmod(0o755)
            self.paths[name] = path

    def run_check(self, changes=None, *, template=False, vision=False):
        # Extract the actual header, check function and one real call site.
        # Replace only the external preflight observation; full verify.sh,
        # its compiler/weight reads and its model battery are never launched.
        header = SCRIPT[SCRIPT.index('BIN='):SCRIPT.index('QPID=""')]
        needle = ('check "vision tower dumps' if vision else
                  'check "chat template ==' if template else 'check "layer parity (')
        lines = SCRIPT.splitlines()
        index = next(i for i, line in enumerate(lines) if line.lstrip().startswith(needle))
        call = lines[index]
        while call.endswith('\\'):
            index += 1
            call += '\n'+lines[index]
        script = 'set -eo pipefail\n'+header+'''
safety_before() {
  printf '%s\\n' "$1" >> "$VERIFY_FIXTURE_SAFETY"
  return "${VERIFY_FIXTURE_PREFLIGHT_EXIT:-0}"
}
'''+call+'\n[ "$FAIL" -eq 0 ]\n'
        env = {k:v for k,v in os.environ.items()
               if k != 'BIN' and not k.startswith(('SLOTSTREAM_', 'SS_DEBUG', 'VERIFY_FIXTURE_'))}
        env.update(SLOTSTREAM_VERIFY_OUT=str(self.root/"results space's"),
                   VP=str(self.root/"vision output's; $(touch injected)"),
                   VERIFY_FIXTURE_TRACE=str(self.trace), VERIFY_FIXTURE_SAFETY=str(self.safety))
        env.update(changes or {})
        p = subprocess.run(['bash', '-c', script], cwd=self.root, env=env,
                           text=True, capture_output=True, timeout=10)
        rows = [json.loads(line) for line in self.trace.read_text().splitlines()] if self.trace.exists() else []
        self.assertFalse((self.root/'injected').exists(), p.stdout+p.stderr)
        return p, rows

    def selected(self, env, name, *, template=False, vision=False):
        p, rows = self.run_check(env, template=template, vision=vision)
        self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(len(rows), 1)
        self.assertEqual(Path(rows[0]['binary']).resolve(), self.paths[name].resolve())
        self.assertEqual(rows[0]['arguments'],
                         ['vision-parity', '--out', str(self.root/"vision output's; $(touch injected)")] if vision else
                         ['template-check'] if template else
                         ['parity', '--tokens', '9707,11,1246,525,498,30', '--layers', '2', '--compare', 'bench/parity31'])
        if not template:
            self.assertEqual(self.safety.read_text(), '13\n')

    def test_default_release(self):
        self.selected({}, 'release')

    def test_legacy_bin(self):
        self.selected({'BIN': str(self.paths['legacy'])}, 'legacy')

    def test_selected_path_preserves_spaces_quotes_and_shell_metacharacters(self):
        self.selected({'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen')

    def test_explicit_selection_has_precedence(self):
        self.selected({'BIN': str(self.paths['legacy']), 'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen')

    def test_template_substitution_uses_selected_path(self):
        self.selected({'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen', template=True)

    def test_vision_output_path_is_passed_as_one_literal_argument(self):
        self.selected({'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen', vision=True)

    def test_missing_selected_file_does_not_fall_back(self):
        p, rows = self.run_check({'SLOTSTREAM_TEST_BINARY': str(self.root/'missing')})
        self.assertNotEqual(p.returncode, 0)
        self.assertEqual(rows, [])

    def test_selected_failure_fails_gate(self):
        p, rows = self.run_check({'SLOTSTREAM_TEST_BINARY': str(self.paths['legacy']), 'VERIFY_FIXTURE_EXIT': '23'})
        self.assertNotEqual(p.returncode, 0)
        self.assertEqual(len(rows), 1)

    def test_failed_preflight_prevents_launch(self):
        p, rows = self.run_check({'SLOTSTREAM_TEST_BINARY': str(self.paths['legacy']), 'VERIFY_FIXTURE_PREFLIGHT_EXIT': '2'})
        self.assertEqual(p.returncode, 2)
        self.assertEqual(rows, [])


class VerifyGovernorStatus(unittest.TestCase):
    def run_status(self, text, status=0):
        with tempfile.TemporaryDirectory(prefix='slotstream-governor-status-') as directory:
            root = Path(directory)
            result = root/"results PASS; $(touch injected)"
            result.mkdir()
            fixture = root/"selected binary's path"
            fixture.write_text("#!/usr/bin/env python3\nimport os,sys\n"
                               "assert sys.argv[1:] == ['elastic-drill','--slots','1000','--max-memory-gb','13']\n"
                               "sys.stdout.write(os.environ['VERIFY_DRILL_TEXT'])\n"
                               "raise SystemExit(int(os.environ['VERIFY_DRILL_STATUS']))\n")
            fixture.chmod(0o755)
            # Execute the actual verification block with the real system sed.
            # Only the native model-producing command is replaced by a fixture.
            start = SCRIPT.index('DRILL_LOG=')
            end = SCRIPT.index('\nesac', start)+len('\nesac')
            block = 'set -eo pipefail\nPASS=0; FAIL=0\n'+SCRIPT[start:end]+'''
printf 'COUNTS %s %s\\n' "$PASS" "$FAIL"
[ "$FAIL" -eq 0 ]
'''
            env = dict(os.environ, BIN=str(fixture), VERIFY_OUT=str(result),
                       VERIFY_DRILL_TEXT=text, VERIFY_DRILL_STATUS=str(status))
            process = subprocess.run(['bash','-c',block], cwd=root, env=env,
                                     text=True, capture_output=True, timeout=10)
            self.assertFalse((root/'injected').exists(), process.stdout+process.stderr)
            self.assertEqual((result/'elastic-drill.txt').read_text(), text)
            return process

    def test_real_status_shape_passes_with_progress_and_memory_record(self):
        process = self.run_status('progress\nELASTIC DRILL MEMORY {"complete":true}\n'
                                  'ELASTIC DRILL PASS: exact recovery\n')
        self.assertEqual(process.returncode, 0, process.stdout+process.stderr)
        self.assertIn('COUNTS 1 0', process.stdout)

    def test_success_without_final_newline_passes(self):
        process = self.run_status('ELASTIC DRILL PASS: exact recovery')
        self.assertEqual(process.returncode, 0, process.stdout+process.stderr)
        self.assertIn('COUNTS 1 0', process.stdout)

    def test_failure_and_skip_cannot_pass_from_words_in_their_details(self):
        for text in ['ELASTIC DRILL FAIL: expected PASS\n',
                     'ELASTIC DRILL SKIP: unable to run PASS case\n']:
            with self.subTest(text=text):
                process = self.run_status(text)
                self.assertNotEqual(process.returncode, 0, process.stdout+process.stderr)
                self.assertIn('COUNTS 0 1', process.stdout)

    def test_process_failure_overrides_success_even_with_pass_in_log_path(self):
        process = self.run_status('ELASTIC DRILL PASS: complete\n', status=23)
        self.assertNotEqual(process.returncode, 0, process.stdout+process.stderr)
        self.assertIn('COUNTS 0 1', process.stdout)

    def test_missing_or_malformed_final_status_fails_closed(self):
        for text in ['', 'other PASS output\n', 'ELASTIC DRILL PASSED: no\n',
                     'ELASTIC DRILL PASS\n', 'ELASTIC DRILL PASSIVE: no\n']:
            with self.subTest(text=text):
                process = self.run_status(text)
                self.assertNotEqual(process.returncode, 0, process.stdout+process.stderr)
                self.assertIn('COUNTS 0 1', process.stdout)

    def test_duplicate_or_conflicting_final_statuses_fail_closed(self):
        for text in ['ELASTIC DRILL PASS: a\nELASTIC DRILL PASS: b\n',
                     'ELASTIC DRILL FAIL: a\nELASTIC DRILL PASS: b\n',
                     'ELASTIC DRILL PASS: a\nELASTIC DRILL FAIL: b\n']:
            with self.subTest(text=text):
                process = self.run_status(text)
                self.assertNotEqual(process.returncode, 0, process.stdout+process.stderr)
                self.assertIn('COUNTS 0 1', process.stdout)


if __name__ == '__main__':
    unittest.main()
````

## /tmp/slotstream-optimization-execution/verify-governor-parser-v286/before-test.py

SHA-256 `f3b686b203c193c3ef887ddf42aef7c14fef97762d203349bff2193dab6afee4`; 5625 bytes.

````text
"""Exercise verify.sh's real dispatch/check functions without model or build work."""
import json
import os
from pathlib import Path
import subprocess
import tempfile
import unittest


SCRIPT = Path(__file__).with_name('verify.sh').read_text()


class VerifyBinarySelection(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='slotstream-verify-selection-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.trace = self.root/'trace.jsonl'
        self.safety = self.root/'safety.txt'
        self.paths = {}
        for name, relative in [('release', '.build/release/slotstream'),
                               ('legacy', 'legacy/slotstream'),
                               ('frozen', "frozen space's; $(touch injected)/selected")]:
            path = self.root/relative
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text('''#!/usr/bin/env python3
import json, os, sys
with open(os.environ['VERIFY_FIXTURE_TRACE'], 'a') as output:
    output.write(json.dumps({'binary': __file__, 'arguments': sys.argv[1:]})+'\\n')
if sys.argv[1:] == ['template-check']:
    print('248045,8678,198,2523,513,10631,13,248046,198,248045,846,198,12675,1017,248046,198,248045,74455,198,248068,271,248069,271')
raise SystemExit(int(os.environ.get('VERIFY_FIXTURE_EXIT', '0')))
''')
            path.chmod(0o755)
            self.paths[name] = path

    def run_check(self, changes=None, *, template=False, vision=False):
        # Extract the actual header, check function and one real call site.
        # Replace only the external preflight observation; full verify.sh,
        # its compiler/weight reads and its model battery are never launched.
        header = SCRIPT[SCRIPT.index('BIN='):SCRIPT.index('QPID=""')]
        needle = ('check "vision tower dumps' if vision else
                  'check "chat template ==' if template else 'check "layer parity (')
        lines = SCRIPT.splitlines()
        index = next(i for i, line in enumerate(lines) if line.lstrip().startswith(needle))
        call = lines[index]
        while call.endswith('\\'):
            index += 1
            call += '\n'+lines[index]
        script = 'set -eo pipefail\n'+header+'''
safety_before() {
  printf '%s\\n' "$1" >> "$VERIFY_FIXTURE_SAFETY"
  return "${VERIFY_FIXTURE_PREFLIGHT_EXIT:-0}"
}
'''+call+'\n[ "$FAIL" -eq 0 ]\n'
        env = {k:v for k,v in os.environ.items()
               if k != 'BIN' and not k.startswith(('SLOTSTREAM_', 'SS_DEBUG', 'VERIFY_FIXTURE_'))}
        env.update(SLOTSTREAM_VERIFY_OUT=str(self.root/"results space's"),
                   VP=str(self.root/"vision output's; $(touch injected)"),
                   VERIFY_FIXTURE_TRACE=str(self.trace), VERIFY_FIXTURE_SAFETY=str(self.safety))
        env.update(changes or {})
        p = subprocess.run(['bash', '-c', script], cwd=self.root, env=env,
                           text=True, capture_output=True, timeout=10)
        rows = [json.loads(line) for line in self.trace.read_text().splitlines()] if self.trace.exists() else []
        self.assertFalse((self.root/'injected').exists(), p.stdout+p.stderr)
        return p, rows

    def selected(self, env, name, *, template=False, vision=False):
        p, rows = self.run_check(env, template=template, vision=vision)
        self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(len(rows), 1)
        self.assertEqual(Path(rows[0]['binary']).resolve(), self.paths[name].resolve())
        self.assertEqual(rows[0]['arguments'],
                         ['vision-parity', '--out', str(self.root/"vision output's; $(touch injected)")] if vision else
                         ['template-check'] if template else
                         ['parity', '--tokens', '9707,11,1246,525,498,30', '--layers', '2', '--compare', 'bench/parity31'])
        if not template:
            self.assertEqual(self.safety.read_text(), '13\n')

    def test_default_release(self):
        self.selected({}, 'release')

    def test_legacy_bin(self):
        self.selected({'BIN': str(self.paths['legacy'])}, 'legacy')

    def test_selected_path_preserves_spaces_quotes_and_shell_metacharacters(self):
        self.selected({'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen')

    def test_explicit_selection_has_precedence(self):
        self.selected({'BIN': str(self.paths['legacy']), 'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen')

    def test_template_substitution_uses_selected_path(self):
        self.selected({'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen', template=True)

    def test_vision_output_path_is_passed_as_one_literal_argument(self):
        self.selected({'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen', vision=True)

    def test_missing_selected_file_does_not_fall_back(self):
        p, rows = self.run_check({'SLOTSTREAM_TEST_BINARY': str(self.root/'missing')})
        self.assertNotEqual(p.returncode, 0)
        self.assertEqual(rows, [])

    def test_selected_failure_fails_gate(self):
        p, rows = self.run_check({'SLOTSTREAM_TEST_BINARY': str(self.paths['legacy']), 'VERIFY_FIXTURE_EXIT': '23'})
        self.assertNotEqual(p.returncode, 0)
        self.assertEqual(len(rows), 1)

    def test_failed_preflight_prevents_launch(self):
        p, rows = self.run_check({'SLOTSTREAM_TEST_BINARY': str(self.paths['legacy']), 'VERIFY_FIXTURE_PREFLIGHT_EXIT': '2'})
        self.assertEqual(p.returncode, 2)
        self.assertEqual(rows, [])


if __name__ == '__main__':
    unittest.main()
````

## /tmp/slotstream-optimization-execution/verify-governor-parser-v286/before-tests.stderr

SHA-256 `891987927a85a9c879d8d35f67ff7d38d31acdcb6e5f46fe7cad164966be46da`; 2009 bytes.

````text
............FFF
======================================================================
FAIL: test_process_failure_overrides_success_even_with_pass_in_log_path (__main__.VerifyGovernorStatus)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/verify-governor-parser-v286/before/verify_binary_test.py", line 163, in test_process_failure_overrides_success_even_with_pass_in_log_path
    self.assertNotEqual(process.returncode, 0, process.stdout+process.stderr)
AssertionError: 0 == 0 : PASS  ELASTIC DRILL FAIL: exit 23 (details: /var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/slotstream-governor-status-tsrki45s/results PASS; $(touch injected)/elastic-drill.txt)
COUNTS 1 0


======================================================================
FAIL: test_real_status_shape_passes_with_progress_and_memory_record (__main__.VerifyGovernorStatus)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/verify-governor-parser-v286/before/verify_binary_test.py", line 145, in test_real_status_shape_passes_with_progress_and_memory_record
    self.assertEqual(process.returncode, 0, process.stdout+process.stderr)
AssertionError: 1 != 0 : FAIL  
COUNTS 0 1


======================================================================
FAIL: test_success_without_final_newline_passes (__main__.VerifyGovernorStatus)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/verify-governor-parser-v286/before/verify_binary_test.py", line 150, in test_success_without_final_newline_passes
    self.assertEqual(process.returncode, 0, process.stdout+process.stderr)
AssertionError: 1 != 0 : FAIL  
COUNTS 0 1


----------------------------------------------------------------------
Ran 15 tests in 6.908s

FAILED (failures=3)
````

## /tmp/slotstream-optimization-execution/verify-governor-parser-v286/before-tests.stdout

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/verify-governor-parser-v286/before-verify.sh

SHA-256 `5afd9e6a87ef2df8bbc0a39b6bddbc064a2a494b72e191819c7422223ddbdcaa`; 15200 bytes.

````text
#!/bin/bash
# slotstream verification battery. Runs every correctness gate end to end.
# (SPM unit tests require Xcode; this machine has CLT only — the goldens below
# are the actual acceptance tests and run against the real checkpoint.)
set -eo pipefail
cd "$(dirname "$0")/.."
BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
VERIFY_OUT=${SLOTSTREAM_VERIFY_OUT:-.build/verification-$(date +%Y%m%d-%H%M%S)}
mkdir -p "$VERIFY_OUT"
export BIN SLOTSTREAM_TEST_BINARY="$BIN"
CHECK_INDEX=0
safety_before() {
  python3 - "$1" <<'PYSAFE'
import sys
sys.path.insert(0, 'Tools')
from prefill_bench import preflight
preflight(float(sys.argv[1]))
PYSAFE
}
run_model() { safety_before 13 || return 2; "$@"; }
# Keep the selected path out of evaluated snippets, including substitutions.
run_binary() { "$BIN" "$@"; }
PASS=0; FAIL=0
check() {
  CHECK_INDEX=$((CHECK_INDEX+1))
  local record="$VERIFY_OUT/check-$CHECK_INDEX.txt"
  printf '%s\n%s\n' "$1" "$2" > "$record"
  if [[ "$2" == "run_binary "* ]]; then safety_before 13 || return 2; fi
  if eval "$2" >>"$record" 2>&1; then echo "PASS  $1"; PASS=$((PASS+1))
  else echo "FAIL  $1 (details: $record)"; FAIL=$((FAIL+1)); fi
}
QPID=""
cleanup() {
  if [ -n "$QPID" ]; then
    kill "$QPID" 2>/dev/null || true
    wait "$QPID" 2>/dev/null || true
  fi
}
trap cleanup EXIT INT TERM

# Use a reconstructible frozen binary when supplied; otherwise build normally.
# Check the real process lock and reclaimable memory before heavy work.
safety_before 13
if [ -n "${SLOTSTREAM_TEST_BINARY:-}" ] && [ "$BIN" != .build/release/slotstream ]; then
  python3 - "$BIN" <<'PYBUILD'
import sys
sys.path.insert(0, 'Tools')
from serve_bench import verified_build
verified_build(sys.argv[1])
PYBUILD
  echo "== frozen build: $BIN =="
else
  echo "== build =="
  safety_before 7
  make build >"$VERIFY_OUT/build.txt" 2>&1
fi

# Ordinary equality gates use 8–10 GB. The live governor drill separately
# declares a 13 GB ceiling: its unchanged 1/2 GB deadbands require a larger
# starting arena. It checks its derived target and real headroom before load,
# every explicit poll and generation, and samples its whole memory interval.
SMALL_MEMORY=8.1
BIG_MEMORY=10
ECBIG=960

echo "== weights provenance (hashes all 105.3 GB vs the pinned revisions; the draft head is optional) =="
if python3 - "$BIN" "$VERIFY_OUT/model-verification" <<'PYVERIFY'
import os,sys
from pathlib import Path
sys.path.insert(0, 'Tools')
from context_qualification import quiet_preflight, verification_lock
from prefill_bench import run_child
out=Path(sys.argv[2]);out.mkdir(exist_ok=False)
quiet_preflight(13)
with verification_lock():
    code=run_child([sys.argv[1], 'pull', '--verify'], os.environ.copy(), out, 600)
raise SystemExit(code)
PYVERIFY
then
  echo "PASS  pull --verify: every pinned file matches"; PASS=$((PASS+1))
else
  echo "FAIL  pull --verify (details: $VERIFY_OUT/model-verification)"; FAIL=$((FAIL+1))
  exit 1
fi

echo "== goldens (need bench/parity31 from Tools/parity_ref.py under mlx==0.31.1) =="
run_model "$BIN" ngram-golden --tokens "9707,11,1246,525,498,30" 2>/dev/null | sed 's/^pos[0-9]*: //' > /tmp/ssv_ngram.txt
check "ngram row ids == python reference"  "diff /tmp/ssv_ngram.txt bench/parity31/ngram_ids.txt"
check "chat template == transformers"      "[ \"\$(run_binary template-check 2>/dev/null)\" = '248045,8678,198,2523,513,10631,13,248046,198,248045,846,198,12675,1017,248046,198,248045,74455,198,248068,271,248069,271' ]"
check "layer parity (0-1 bit-exact gate)"  "run_binary parity --tokens '9707,11,1246,525,498,30' --layers 2 --compare bench/parity31"

echo "== planner: right thing across machine setups (simulated, no model needed) =="
if Tools/planner_gates.sh; then
  echo "PASS  planner gates"; PASS=$((PASS+1))
else
  echo "FAIL  planner gates"; FAIL=$((FAIL+1))
fi

echo "== sampler vs numpy reference + elastic governor policy (no weights needed) =="
if Tools/sampler_gates.sh; then
  echo "PASS  sampler + governor gates"; PASS=$((PASS+1))
else
  echo "FAIL  sampler + governor gates"; FAIL=$((FAIL+1))
fi

echo "== golden equivalence: streaming must not change the math =="
run_model "$BIN" run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --memory-gb $BIG_MEMORY 2>/dev/null > /tmp/ssv_big.txt
run_model "$BIN" run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --memory-gb $SMALL_MEMORY 2>/dev/null > /tmp/ssv_small.txt
check "$SMALL_MEMORY GB cache output == $BIG_MEMORY GB cache output" "diff /tmp/ssv_big.txt /tmp/ssv_small.txt"

echo "== elastic pool: live resizes must not change the math =="
check "grow/shrink/regrow byte-identical (elastic-check)" "run_binary elastic-check --big-slots $ECBIG"

# Prefix reuse is deliberately NOT gated on byte-equality with a cold rebuild:
# re-batching the same tokens re-associates their sums, and measured here that
# moves logits LESS than re-chunking a plain prefill already does. The gate is
# that bound plus determinism of the cached path. See MEASUREMENTS.md.
# Drives the governor itself — poll, decide, lock, resize, log — not just its
# policy function, using the availability seam so no real pressure is needed.
# This required full gate fails acceptance when it cannot run with headroom;
# a diagnostic SKIP is not a passing shrink/cooldown/growth result.
echo "== elastic governor: shrinks, honors the cooldown, grows back =="
safety_before 16
DRILL_LOG="$VERIFY_OUT/elastic-drill.txt"
DRILL_STATUS=0
"$BIN" elastic-drill --slots 1000 --max-memory-gb 13 >"$DRILL_LOG" 2>&1 || DRILL_STATUS=$?
DRILL=$(sed -n '/^ELASTIC DRILL \(PASS\|FAIL\|SKIP\)/p' "$DRILL_LOG" | tail -1)
if [ "$DRILL_STATUS" -ne 0 ]; then
  DRILL="ELASTIC DRILL FAIL: exit $DRILL_STATUS (details: $DRILL_LOG)"
fi
case "$DRILL" in
  *PASS*) echo "PASS  $DRILL"; PASS=$((PASS+1)) ;;
  *SKIP*) echo "FAIL  required full gate skipped: $DRILL"; FAIL=$((FAIL+1)) ;;
  *)      echo "FAIL  $DRILL"; FAIL=$((FAIL+1)) ;;
esac

echo "== conversation prefix cache: bounded, flat with depth, deterministic =="
check "prefix reuse within the prefill-rechunk control (prefix-check)" "run_binary prefix-check"

echo "== prefill sweep: matches the pool path, deterministic, blind to the pool =="
check "sweep within the prefill-rechunk control, identical cold and warm (sweep-check)" "run_binary sweep-check"

# The MTP draft head is a separately converted artifact (Tools/mtp_convert.py),
# not part of `pull` — a fresh install legitimately lacks it, so these SKIP
# rather than fail when it is absent.
echo "== MTP draft head: parity with the Python reference + speculative gates =="
MTPFILE="$HOME/.slotstream/models/qwen38-flash-next-mlx-4bit/mtp.safetensors"
if [ -f "$MTPFILE" ]; then
  check "mtp head bit-parity vs Python reference (mtp-parity)" "run_binary mtp-parity"
  # MTP is priced at startup; the combined vision leg needs its own explicit
  # 12 GB target. It must not add a draft head outside an MTP-off plan.
  safety_before 15
  if "$BIN" mtp-check --memory-gb 12 --mtp on --vision on --image Tools/assets/vision_test/secret1.jpg >"$VERIFY_OUT/mtp.txt" 2>&1 \
      && python3 - "$VERIFY_OUT/mtp.txt" <<'PYMTP'
import json,sys
from pathlib import Path
text=Path(sys.argv[1]).read_text()
assert 'PASS  vision speculation deterministic' in text
assert 'PASS  vision speculation ran' in text
assert 'SKIP' not in text and 'MTP CHECK PASS' in text
rows=[json.loads(line.removeprefix('MTP CHECK MEMORY ')) for line in text.splitlines() if line.startswith('MTP CHECK MEMORY ')]
assert len(rows)==1 and rows[0]['memory_validated'] is True
PYMTP
  then
    echo "PASS  speculative decode gates (determinism, state integrity, accept sanity)"; PASS=$((PASS+1))
  else
    echo "FAIL  speculative decode gates"; tail -5 "$VERIFY_OUT/mtp.txt"; FAIL=$((FAIL+1))
  fi
else
  echo "SKIP  mtp gates (no mtp.safetensors — convert with Tools/mtp_convert.py)"
fi

echo "== memory target keeps its promise =="
run_model "$BIN" run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --memory-gb $BIG_MEMORY --sample-footprint --stats-json /tmp/ssv_mem.json 2>/tmp/ssv_mem.err > /tmp/ssv_mem.txt
check "--memory-gb $BIG_MEMORY sampled footprint and RSS stay under target without swap" \
      "python3 Tools/memory_gate.py /tmp/ssv_mem.json --limit-gb $BIG_MEMORY"
check "--memory-gb $BIG_MEMORY output is stable" "diff /tmp/ssv_mem.txt /tmp/ssv_big.txt"

# The short-prompt gate above cannot see KV/indexer growth, which is what made
# the promise hold by 0.1 GB on a long prompt before the prefill pass was
# budgeted. Re-check it where the pressure actually is.
python3 - <<'PYEOF' > /tmp/ssv_long.txt
f = ["Routine maintenance was performed on the north corridor lighting system. ",
     "Inventory counts were reconciled against the quarterly ledger totals. ",
     "The east wing humidity sensors reported nominal values throughout the day. "]
b = "The archive records that the vault combination is SEVENTEEN. "
for i in range(700):
    b += f[i % 3]
print(b + "\n\nQuestion: what is the vault combination? Answer with one word.")
PYEOF
# Use the normal non-thinking chat template. A bare raw prompt can spend the
# entire output allowance in reasoning, which is invalid recall evidence.
run_model "$BIN" run --prompt-file /tmp/ssv_long.txt --max-tokens 16 --greedy --memory-gb $BIG_MEMORY \
  --sample-footprint --stats-json /tmp/ssv_longmem.json \
  2>/tmp/ssv_longmem.err > /tmp/ssv_longmem.txt
check "--memory-gb $BIG_MEMORY sampled footprint and RSS under target on the long prompt without swap" \
      "python3 Tools/memory_gate.py /tmp/ssv_longmem.json --limit-gb $BIG_MEMORY"
check "long-context answer still correct (sparse indexer active)" \
      "python3 Tools/long_context_gate.py /tmp/ssv_longmem.json /tmp/ssv_longmem.txt --expected SEVENTEEN --minimum-prompt-tokens 7000 --maximum-output-tokens 16"

# context-check is the tool that earns any future move of the 32k ceiling; the
# battery runs one small rung so the command itself stays proven (a 2k prompt
# at the small target reads in about a minute).
run_model "$BIN" context-check --tokens 2048 --memory-gb $BIG_MEMORY --sample-footprint --json 2>/dev/null > /tmp/ssv_ctx.json
check "context-check: 2k rung reads inside the plan and reports it" \
      "python3 -c 'import json; d=json.loads(open(\"/tmp/ssv_ctx.json\").read().strip().splitlines()[-1]); assert d[\"fits\"] and d[\"aborted\"] is None and d[\"prefill_tokens\"]==2048, d'"

check "context-check: sampled memory remains under target without swap" \
      "python3 Tools/memory_gate.py /tmp/ssv_ctx.json --limit-gb $BIG_MEMORY"

echo "== serving robustness (inputs that used to crash or corrupt output) =="
echo "== behavioural sanity: has the conversion lost anything obvious? =="
# NOT the FP8 comparison the plan calls for (see N4) — that needs an inference
# credential for Qwen3.8-Flash-Next FP8, which is not provisioned. This catches
# gross quantization or architecture damage and gates future re-quantization.
# `set -e` is on, so every step here has to be failure-tolerant on purpose:
# a `kill` of an already-dead server, and a `wait` on a killed one (which
# returns 143), both abort the whole battery otherwise. That is exactly how an
# earlier version of this block silently truncated the run after this gate.
safety_before 13
"$BIN" serve --port 11467 --memory-gb $BIG_MEMORY >/tmp/ssv_q.log 2>&1 &
QPID=$!
for _ in $(seq 1 120); do
  if curl -s --max-time 3 http://127.0.0.1:11467/api/version >/dev/null 2>&1; then break; fi
  sleep 2
done
if Tools/quality_probe.sh 11467; then
  echo "PASS  behavioural quality probe (15 items)"; PASS=$((PASS+1))
else
  echo "FAIL  behavioural quality probe"; FAIL=$((FAIL+1))
fi
kill $QPID 2>/dev/null || true
wait $QPID 2>/dev/null || true
QPID=""

echo "== weights behind a symlink (Foundation will not list a symlinked dir) =="
MODEL_DIR=models/qwen38-flash-next-mlx-4bit
[ -d "$MODEL_DIR" ] || MODEL_DIR="$HOME/.slotstream/models/qwen38-flash-next-mlx-4bit"
SYM=/tmp/ssv_symlink_model
rm -f "$SYM"; ln -s "$(cd "$MODEL_DIR" && pwd)" "$SYM"
check "run through a symlinked model dir"  "run_binary run --model \"\$SYM\" --memory-gb $SMALL_MEMORY --max-tokens 1 --greedy --prompt hi"
rm -f "$SYM"

safety_before 13
if Tools/api_robustness.sh 11466 13; then
  echo "PASS  serving robustness suite"; PASS=$((PASS+1))
else
  echo "FAIL  serving robustness suite"; FAIL=$((FAIL+1))
fi

echo "== vision =="
# The tower against an independent implementation. It loads 0.9 GB of vision
# tensors and none of the 105 GB trunk, so it is cheap and can run anywhere the
# weights are. mlx 0.31.1 for the same reason the parity goldens use it.
VP="$VERIFY_OUT/vision-parity"
if [ -x .venv31/bin/python ]; then
  check "vision tower dumps its pixels and embeddings" \
    'run_binary vision-parity --out "$VP"'
  safety_before 7
  if .venv31/bin/python Tools/vision_ref.py "$VP" | tail -8; then
    echo "PASS  vision tower matches the float32 reference within the bf16 band"
    PASS=$((PASS+1))
  else
    echo "FAIL  vision tower parity"; FAIL=$((FAIL+1))
  fi
else
  echo "SKIP  vision parity (no .venv31; see CLAUDE.md for the mlx 0.31.1 venv)"
  FAIL=$((FAIL+1)) # Required full vision acceptance did not run.
fi

# Every serving surface, with a real picture, against a real server. The model
# has to name what is in the photograph: a tower wired to the wrong positions
# still answers fluently, and nothing cheaper than this notices.
#
# Full original photographs require a 3.99 GB attention workspace reservation.
# Keep this explicit profile local to this server: ordinary equality/quality
# gates still use BIG_MEMORY. The 10 GB predecessor now correctly refuses the
# larger image before dispatch, and that counterexample remains in db/.
VISION_MEMORY=14.5
VISION_PREFILL=3072
NEED_GB=$(awk "BEGIN{print $VISION_MEMORY + 6}")
AVAIL_GB=$("$BIN" doctor --json 2>/dev/null | python3 -c 'import json,sys; print(json.load(sys.stdin).get("device_available_gb", 0))' 2>/dev/null || echo 0)
if [ "$(awk "BEGIN{print ($AVAIL_GB < $NEED_GB)}")" = "1" ]; then
  echo "SKIP  vision serving suite (only ${AVAIL_GB} GB reclaimable, needs ${NEED_GB})"
  FAIL=$((FAIL+1)) # Required full vision acceptance did not run.
  echo "      re-run after preflight: SLOTSTREAM_PREFILL_CHUNK=$VISION_PREFILL SLOTSTREAM_BENCH_DETAILS=1 $BIN serve --memory-gb $VISION_MEMORY --mtp off --vision on --max-context 32768 --max-prefill-wait 0 --no-elastic --port 11468"
  echo "      then: python3 Tools/vision_serving.py 11468"
else
safety_before "$NEED_GB"
SLOTSTREAM_PREFILL_CHUNK="$VISION_PREFILL" SLOTSTREAM_BENCH_DETAILS=1 "$BIN" serve --memory-gb "$VISION_MEMORY" --mtp off --vision on --max-context 32768 --max-prefill-wait 0 --no-elastic --port 11468 > /tmp/ssv-vision-serve.log 2>&1 &
QPID=$!
for _ in $(seq 1 120); do
  if grep -q "listening on" /tmp/ssv-vision-serve.log 2>/dev/null; then break; fi
  sleep 1
done
if python3 Tools/vision_serving.py 11468; then
  echo "PASS  vision serving suite"; PASS=$((PASS+1))
else
  echo "FAIL  vision serving suite"; FAIL=$((FAIL+1))
fi
kill "$QPID" 2>/dev/null || true
wait "$QPID" 2>/dev/null || true
QPID=""
fi

echo
echo "passed $PASS, failed $FAIL"
[ $FAIL -eq 0 ]
````

## /tmp/slotstream-optimization-execution/verify-governor-parser-v286/draft-tests.json

SHA-256 `655887976a1af8563cd6caa1286918833630ab7f7bf164d056aae6631d40adfb`; 2349 bytes.

````text
[
  {
    "variant": "before",
    "exit_code": 1,
    "stdout": "",
    "stderr": "............FFF\n======================================================================\nFAIL: test_process_failure_overrides_success_even_with_pass_in_log_path (__main__.VerifyGovernorStatus)\n----------------------------------------------------------------------\nTraceback (most recent call last):\n  File \"/tmp/slotstream-optimization-execution/verify-governor-parser-v286/before/verify_binary_test.py\", line 163, in test_process_failure_overrides_success_even_with_pass_in_log_path\n    self.assertNotEqual(process.returncode, 0, process.stdout+process.stderr)\nAssertionError: 0 == 0 : PASS  ELASTIC DRILL FAIL: exit 23 (details: /var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/slotstream-governor-status-tsrki45s/results PASS; $(touch injected)/elastic-drill.txt)\nCOUNTS 1 0\n\n\n======================================================================\nFAIL: test_real_status_shape_passes_with_progress_and_memory_record (__main__.VerifyGovernorStatus)\n----------------------------------------------------------------------\nTraceback (most recent call last):\n  File \"/tmp/slotstream-optimization-execution/verify-governor-parser-v286/before/verify_binary_test.py\", line 145, in test_real_status_shape_passes_with_progress_and_memory_record\n    self.assertEqual(process.returncode, 0, process.stdout+process.stderr)\nAssertionError: 1 != 0 : FAIL  \nCOUNTS 0 1\n\n\n======================================================================\nFAIL: test_success_without_final_newline_passes (__main__.VerifyGovernorStatus)\n----------------------------------------------------------------------\nTraceback (most recent call last):\n  File \"/tmp/slotstream-optimization-execution/verify-governor-parser-v286/before/verify_binary_test.py\", line 150, in test_success_without_final_newline_passes\n    self.assertEqual(process.returncode, 0, process.stdout+process.stderr)\nAssertionError: 1 != 0 : FAIL  \nCOUNTS 0 1\n\n\n----------------------------------------------------------------------\nRan 15 tests in 6.908s\n\nFAILED (failures=3)\n"
  },
  {
    "variant": "after",
    "exit_code": 0,
    "stdout": "",
    "stderr": "...............\n----------------------------------------------------------------------\nRan 15 tests in 6.350s\n\nOK\n"
  }
]
````

## /tmp/slotstream-optimization-execution/verify-governor-parser-v286/exact-source-parser-counterexample.json

SHA-256 `264727a94c0be2dc71cb137fe860ee59cc35c6fb32e43e7a10305d3a6baf54c8`; 292 bytes.

````text
{
  "source_line": "DRILL=$(sed -n '/^ELASTIC DRILL \\(PASS\\|FAIL\\|SKIP\\)/p' \"$DRILL_LOG\" | tail -1)",
  "command": [
    "sed",
    "-n",
    "/^ELASTIC DRILL \\(PASS\\|FAIL\\|SKIP\\)/p"
  ],
  "exit_code": 0,
  "stdout": "",
  "stderr": "",
  "extracted_from_unchanged_script": true
}
````

## /tmp/slotstream-optimization-execution/verify-governor-parser-v286/initial-probe-correction.md

SHA-256 `0310536b9fd082ce0b58d2cb76446a9dac93bd64341dafc0794cd3eff86d1237`; 326 bytes.

````text
The first ad hoc original-command probe doubled the backslashes in a Python raw string and is not the exact shell pattern. Preserve it as a probe transcription error. exact-source-parser-counterexample.json extracts the real command with shlex from the unchanged verify.sh and is the authoritative actual parser reproduction.
````

## /tmp/slotstream-optimization-execution/verify-governor-parser-v286/prepare-v0-syntax-failure.py

SHA-256 `5500685a948165efac5d5da847be646fb89ffae5d030c65a0fa605a707c219ac`; 6103 bytes.

````text
from pathlib import Path
import json,subprocess
R=Path('/Users/carlos/Projects/slotstream');P=Path(__file__).parent
before=(P/'before-verify.sh').read_text()
old=next(line for line in before.splitlines() if line.startswith('DRILL=$(sed '))
new='DRILL=$(sed -nE \'/^ELASTIC DRILL (PASS|FAIL|SKIP)(:|$)/p\' "$DRILL_LOG")'
after=before.replace(old,new)
after=after.replace('''  DRILL="ELASTIC DRILL FAIL: exit $DRILL_STATUS (details: $DRILL_LOG)"
fi
case "$DRILL" in
  *PASS*)''','''  DRILL="ELASTIC DRILL FAIL: exit $DRILL_STATUS (details: $DRILL_LOG)"
elif [[ "$DRILL" == *$'\\n'* ]]; then
  DRILL="ELASTIC DRILL FAIL: multiple final statuses (details: $DRILL_LOG)"
elif [ -z "$DRILL" ]; then
  DRILL="ELASTIC DRILL FAIL: missing final status (details: $DRILL_LOG)"
fi
case "$DRILL" in
  "ELASTIC DRILL PASS:"*)''')
after=after.replace('  *SKIP*) echo "FAIL  required full gate skipped: $DRILL";', '  "ELASTIC DRILL SKIP:"*) echo "FAIL  required full gate skipped: $DRILL";')
assert after!=before and 'multiple final statuses' in after
(P/'after-verify.sh').write_text(after)
original=(R/'Tools/verify_binary_test.py').read_text();(P/'before-test.py').write_text(original)
extra=r'''

class VerifyGovernorStatus(unittest.TestCase):
    def run_status(self, text, status=0):
        with tempfile.TemporaryDirectory(prefix='slotstream-governor-status-') as directory:
            root = Path(directory)
            result = root/"results PASS; $(touch injected)"
            result.mkdir()
            fixture = root/"selected binary's path"
            fixture.write_text("#!/usr/bin/env python3\nimport os,sys\n"
                               "assert sys.argv[1:] == ['elastic-drill','--slots','1000','--max-memory-gb','13']\n"
                               "sys.stdout.write(os.environ['VERIFY_DRILL_TEXT'])\n"
                               "raise SystemExit(int(os.environ['VERIFY_DRILL_STATUS']))\n")
            fixture.chmod(0o755)
            # Execute the actual verification block with the real system sed.
            # Only the native model-producing command is replaced by a fixture.
            start = SCRIPT.index('DRILL_LOG=')
            end = SCRIPT.index('\nesac', start)+len('\nesac')
            block = 'set -eo pipefail\nPASS=0; FAIL=0\n'+SCRIPT[start:end]+'''
printf 'COUNTS %s %s\\n' "$PASS" "$FAIL"
[ "$FAIL" -eq 0 ]
'''
            env = dict(os.environ, BIN=str(fixture), VERIFY_OUT=str(result),
                       VERIFY_DRILL_TEXT=text, VERIFY_DRILL_STATUS=str(status))
            process = subprocess.run(['bash','-c',block], cwd=root, env=env,
                                     text=True, capture_output=True, timeout=10)
            self.assertFalse((root/'injected').exists(), process.stdout+process.stderr)
            self.assertEqual((result/'elastic-drill.txt').read_text(), text)
            return process

    def test_real_status_shape_passes_with_progress_and_memory_record(self):
        process = self.run_status('progress\nELASTIC DRILL MEMORY {"complete":true}\n'
                                  'ELASTIC DRILL PASS: exact recovery\n')
        self.assertEqual(process.returncode, 0, process.stdout+process.stderr)
        self.assertIn('COUNTS 1 0', process.stdout)

    def test_success_without_final_newline_passes(self):
        process = self.run_status('ELASTIC DRILL PASS: exact recovery')
        self.assertEqual(process.returncode, 0, process.stdout+process.stderr)
        self.assertIn('COUNTS 1 0', process.stdout)

    def test_failure_and_skip_cannot_pass_from_words_in_their_details(self):
        for text in ['ELASTIC DRILL FAIL: expected PASS\n',
                     'ELASTIC DRILL SKIP: unable to run PASS case\n']:
            with self.subTest(text=text):
                process = self.run_status(text)
                self.assertNotEqual(process.returncode, 0, process.stdout+process.stderr)
                self.assertIn('COUNTS 0 1', process.stdout)

    def test_process_failure_overrides_success_even_with_pass_in_log_path(self):
        process = self.run_status('ELASTIC DRILL PASS: complete\n', status=23)
        self.assertNotEqual(process.returncode, 0, process.stdout+process.stderr)
        self.assertIn('COUNTS 0 1', process.stdout)

    def test_missing_or_malformed_final_status_fails_closed(self):
        for text in ['', 'other PASS output\n', 'ELASTIC DRILL PASSED: no\n',
                     'ELASTIC DRILL PASS\n', 'ELASTIC DRILL PASSIVE: no\n']:
            with self.subTest(text=text):
                process = self.run_status(text)
                self.assertNotEqual(process.returncode, 0, process.stdout+process.stderr)
                self.assertIn('COUNTS 0 1', process.stdout)

    def test_duplicate_or_conflicting_final_statuses_fail_closed(self):
        for text in ['ELASTIC DRILL PASS: a\nELASTIC DRILL PASS: b\n',
                     'ELASTIC DRILL FAIL: a\nELASTIC DRILL PASS: b\n',
                     'ELASTIC DRILL PASS: a\nELASTIC DRILL FAIL: b\n']:
            with self.subTest(text=text):
                process = self.run_status(text)
                self.assertNotEqual(process.returncode, 0, process.stdout+process.stderr)
                self.assertIn('COUNTS 0 1', process.stdout)
'''
newtest=original.replace("\n\nif __name__ == '__main__':",extra+"\n\nif __name__ == '__main__':")
(P/'after-test.py').write_text(newtest)
results=[]
for name,script in [('before',before),('after',after)]:
 d=P/name;d.mkdir(exist_ok=False);(d/'verify.sh').write_text(script);(d/'verify_binary_test.py').write_text(newtest)
 p=subprocess.run(['python3',str(d/'verify_binary_test.py')],cwd=R,capture_output=True,text=True)
 (P/(name+'-tests.stdout')).write_text(p.stdout);(P/(name+'-tests.stderr')).write_text(p.stderr)
 results.append({'variant':name,'exit_code':p.returncode,'stdout':p.stdout,'stderr':p.stderr})
(P/'draft-tests.json').write_text(json.dumps(results,indent=2)+'\n')
print(json.dumps(results,indent=2))
assert results[0]['exit_code']!=0 and results[1]['exit_code']==0
print('Temporary correction and real-system parser fixtures pass; live Tools files unchanged.')
````

## /tmp/slotstream-optimization-execution/verify-governor-parser-v286/prepare.py

SHA-256 `60919a42005994b452dae071e3a01ce8fd336743cd007d9840d80a311396318c`; 6103 bytes.

````text
from pathlib import Path
import json,subprocess
R=Path('/Users/carlos/Projects/slotstream');P=Path(__file__).parent
before=(P/'before-verify.sh').read_text()
old=next(line for line in before.splitlines() if line.startswith('DRILL=$(sed '))
new='DRILL=$(sed -nE \'/^ELASTIC DRILL (PASS|FAIL|SKIP)(:|$)/p\' "$DRILL_LOG")'
after=before.replace(old,new)
after=after.replace('''  DRILL="ELASTIC DRILL FAIL: exit $DRILL_STATUS (details: $DRILL_LOG)"
fi
case "$DRILL" in
  *PASS*)''','''  DRILL="ELASTIC DRILL FAIL: exit $DRILL_STATUS (details: $DRILL_LOG)"
elif [[ "$DRILL" == *$'\\n'* ]]; then
  DRILL="ELASTIC DRILL FAIL: multiple final statuses (details: $DRILL_LOG)"
elif [ -z "$DRILL" ]; then
  DRILL="ELASTIC DRILL FAIL: missing final status (details: $DRILL_LOG)"
fi
case "$DRILL" in
  "ELASTIC DRILL PASS:"*)''')
after=after.replace('  *SKIP*) echo "FAIL  required full gate skipped: $DRILL";', '  "ELASTIC DRILL SKIP:"*) echo "FAIL  required full gate skipped: $DRILL";')
assert after!=before and 'multiple final statuses' in after
(P/'after-verify.sh').write_text(after)
original=(R/'Tools/verify_binary_test.py').read_text();(P/'before-test.py').write_text(original)
extra=r"""

class VerifyGovernorStatus(unittest.TestCase):
    def run_status(self, text, status=0):
        with tempfile.TemporaryDirectory(prefix='slotstream-governor-status-') as directory:
            root = Path(directory)
            result = root/"results PASS; $(touch injected)"
            result.mkdir()
            fixture = root/"selected binary's path"
            fixture.write_text("#!/usr/bin/env python3\nimport os,sys\n"
                               "assert sys.argv[1:] == ['elastic-drill','--slots','1000','--max-memory-gb','13']\n"
                               "sys.stdout.write(os.environ['VERIFY_DRILL_TEXT'])\n"
                               "raise SystemExit(int(os.environ['VERIFY_DRILL_STATUS']))\n")
            fixture.chmod(0o755)
            # Execute the actual verification block with the real system sed.
            # Only the native model-producing command is replaced by a fixture.
            start = SCRIPT.index('DRILL_LOG=')
            end = SCRIPT.index('\nesac', start)+len('\nesac')
            block = 'set -eo pipefail\nPASS=0; FAIL=0\n'+SCRIPT[start:end]+'''
printf 'COUNTS %s %s\\n' "$PASS" "$FAIL"
[ "$FAIL" -eq 0 ]
'''
            env = dict(os.environ, BIN=str(fixture), VERIFY_OUT=str(result),
                       VERIFY_DRILL_TEXT=text, VERIFY_DRILL_STATUS=str(status))
            process = subprocess.run(['bash','-c',block], cwd=root, env=env,
                                     text=True, capture_output=True, timeout=10)
            self.assertFalse((root/'injected').exists(), process.stdout+process.stderr)
            self.assertEqual((result/'elastic-drill.txt').read_text(), text)
            return process

    def test_real_status_shape_passes_with_progress_and_memory_record(self):
        process = self.run_status('progress\nELASTIC DRILL MEMORY {"complete":true}\n'
                                  'ELASTIC DRILL PASS: exact recovery\n')
        self.assertEqual(process.returncode, 0, process.stdout+process.stderr)
        self.assertIn('COUNTS 1 0', process.stdout)

    def test_success_without_final_newline_passes(self):
        process = self.run_status('ELASTIC DRILL PASS: exact recovery')
        self.assertEqual(process.returncode, 0, process.stdout+process.stderr)
        self.assertIn('COUNTS 1 0', process.stdout)

    def test_failure_and_skip_cannot_pass_from_words_in_their_details(self):
        for text in ['ELASTIC DRILL FAIL: expected PASS\n',
                     'ELASTIC DRILL SKIP: unable to run PASS case\n']:
            with self.subTest(text=text):
                process = self.run_status(text)
                self.assertNotEqual(process.returncode, 0, process.stdout+process.stderr)
                self.assertIn('COUNTS 0 1', process.stdout)

    def test_process_failure_overrides_success_even_with_pass_in_log_path(self):
        process = self.run_status('ELASTIC DRILL PASS: complete\n', status=23)
        self.assertNotEqual(process.returncode, 0, process.stdout+process.stderr)
        self.assertIn('COUNTS 0 1', process.stdout)

    def test_missing_or_malformed_final_status_fails_closed(self):
        for text in ['', 'other PASS output\n', 'ELASTIC DRILL PASSED: no\n',
                     'ELASTIC DRILL PASS\n', 'ELASTIC DRILL PASSIVE: no\n']:
            with self.subTest(text=text):
                process = self.run_status(text)
                self.assertNotEqual(process.returncode, 0, process.stdout+process.stderr)
                self.assertIn('COUNTS 0 1', process.stdout)

    def test_duplicate_or_conflicting_final_statuses_fail_closed(self):
        for text in ['ELASTIC DRILL PASS: a\nELASTIC DRILL PASS: b\n',
                     'ELASTIC DRILL FAIL: a\nELASTIC DRILL PASS: b\n',
                     'ELASTIC DRILL PASS: a\nELASTIC DRILL FAIL: b\n']:
            with self.subTest(text=text):
                process = self.run_status(text)
                self.assertNotEqual(process.returncode, 0, process.stdout+process.stderr)
                self.assertIn('COUNTS 0 1', process.stdout)
"""
newtest=original.replace("\n\nif __name__ == '__main__':",extra+"\n\nif __name__ == '__main__':")
(P/'after-test.py').write_text(newtest)
results=[]
for name,script in [('before',before),('after',after)]:
 d=P/name;d.mkdir(exist_ok=False);(d/'verify.sh').write_text(script);(d/'verify_binary_test.py').write_text(newtest)
 p=subprocess.run(['python3',str(d/'verify_binary_test.py')],cwd=R,capture_output=True,text=True)
 (P/(name+'-tests.stdout')).write_text(p.stdout);(P/(name+'-tests.stderr')).write_text(p.stderr)
 results.append({'variant':name,'exit_code':p.returncode,'stdout':p.stdout,'stderr':p.stderr})
(P/'draft-tests.json').write_text(json.dumps(results,indent=2)+'\n')
print(json.dumps(results,indent=2))
assert results[0]['exit_code']!=0 and results[1]['exit_code']==0
print('Temporary correction and real-system parser fixtures pass; live Tools files unchanged.')
````

