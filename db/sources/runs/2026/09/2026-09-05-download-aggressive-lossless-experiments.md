---
type: run
id: 01m1t4n4y059ptg2y7th68hg1t
created: 2026-09-06T01:17:19.680099+00:00
updated: 2026-09-06T01:17:34.255539+00:00
summary: Raw aggressive compression experiments with exact source; runtime timings discarded for concurrent load, deterministic artifact properties independently verified
binary: .venv31/bin/python and scratch rans_probe.dylib; versions and hashes in body
captured_at: 2026-09-06
command: probe.py screen; qualify.py holdout; full_file.py; native_probe.py; native_full.py
discard_reason: Runtime timings excluded because the Mac had concurrent work; deterministic sizes and exact byte reconstruction independently verified in the artifact-inspection run
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Aggressive lossless compression experiments and source closure
tool: Python NumPy codecs ANS and Clang
---
# Aggressive lossless compression — raw experiments and source closure

Runtime performance is discarded: concurrent compilation, tests and system work ran on this shared Mac. Timing fields are preserved verbatim below for diagnosis, never accepted as installation-speed benchmarks. Compression byte counts and successful exact roundtrips are deterministic artifact properties; independent hashes and current sizes are in [[sources/runs/2026/09/2026-09-05-download-compression-artifact-inspection]].

The PPMd-I candidate failed its decoder on byte-shuffled BF16. That failed attempt is preserved and excluded; the completed screen uses the remaining seven codecs/settings families. No source model file, production downloader or hosting configuration was changed.

## Exact commands
```sh
.venv31/bin/python -u .build/download-compression-max/probe.py screen --mib 1
.venv31/bin/python -u .build/download-compression-max/qualify.py holdout
.venv31/bin/python -u .build/download-compression-max/full_file_v1.py --file model-00011.safetensors --block-mib 32
clang -O3 -std=c11 -Wall -Wextra -Werror -dynamiclib .build/download-compression-max/rans_probe.c -o .build/download-compression-max/rans_probe.dylib
.venv31/bin/python -u .build/download-compression-max/native_probe.py
.venv31/bin/python -u .build/download-compression-max/native_full.py
.venv31/bin/python .build/download-compression-max/regenerate_inventory.py
.venv31/bin/python .build/download-compression-max/report_data.py
.venv31/bin/python .build/download-compression-max/build_evidence.py
```

The original full-shard command used `full_file.py` before it was preserved as `full_file_v1.py`. The source hash in the first receipt matches that preserved file. Dependencies were installed in the isolated `.build/download-audit/python` target; exact versions are recorded in the artifact inspection. No main Python environment dependencies were replaced.

## Reproduction inputs
The 3,283-tensor inventory is deterministically rebuilt by `regenerate_inventory.py`; its reproduced SHA-256 equals the original input inventory. On a fresh checkout, recreate `.build/download-audit/tensors.json` from the emitted inventory before importing the probes, and provide the exact pinned model under the documented model cache path. The probe formats are trusted-input research formats, not hardened production download parsers.


## Raw output: screen-attempt1.stderr

```text
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/.build/download-compression-max/probe.py", line 401, in <module>
    screen(args)
  File "/Users/carlos/Projects/slotstream/.build/download-compression-max/probe.py", line 358, in screen
    row = measure(transform + '/' + cm, original,
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/Users/carlos/Projects/slotstream/.build/download-compression-max/probe.py", line 299, in measure
    restored = dec(compressed)
               ^^^^^^^^^^^^^^^
  File "/Users/carlos/Projects/slotstream/.build/download-compression-max/probe.py", line 360, in <lambda>
    lambda data, tr=transform, co=cm: b''.join(bf_restore(codec_decode(p, co), tr) for p in unpacket(data)))
                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/Users/carlos/Projects/slotstream/.build/download-compression-max/probe.py", line 360, in <genexpr>
    lambda data, tr=transform, co=cm: b''.join(bf_restore(codec_decode(p, co), tr) for p in unpacket(data)))
                                                          ^^^^^^^^^^^^^^^^^^^
  File "/Users/carlos/Projects/slotstream/.build/download-compression-max/probe.py", line 116, in codec_decode
    return pyppmd.decompress(src, max_order=12, mem_size=64 * MiB)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/Users/carlos/Projects/slotstream/.build/download-audit/python/pyppmd/__init__.py", line 205, in decompress
    return _decompress8(data, max_order, mem_size)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/Users/carlos/Projects/slotstream/.build/download-audit/python/pyppmd/__init__.py", line 218, in _decompress8
    res = decomp.decode(data)
          ^^^^^^^^^^^^^^^^^^^
ValueError: L1595: Corrupted input data.

```


## Raw output: screen-attempt1.jsonl

```text
{"group": "experts", "kind": "weight", "method": "raw/zstd3", "original_bytes": 1048576, "compressed_bytes": 976399, "fraction": 0.9311666488647461, "encode_seconds_diagnostic": 0.0020441249944269657, "decode_seconds_diagnostic": 0.0013512498699128628, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "raw/zstd9", "original_bytes": 1048576, "compressed_bytes": 976048, "fraction": 0.9308319091796875, "encode_seconds_diagnostic": 0.0014496250078082085, "decode_seconds_diagnostic": 0.0006896671839058399, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "raw/zstd19", "original_bytes": 1048576, "compressed_bytes": 976621, "fraction": 0.9313783645629883, "encode_seconds_diagnostic": 0.027726041851565242, "decode_seconds_diagnostic": 0.0007104158867150545, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "raw/zstd22", "original_bytes": 1048576, "compressed_bytes": 976621, "fraction": 0.9313783645629883, "encode_seconds_diagnostic": 0.020119542023167014, "decode_seconds_diagnostic": 0.0007455421146005392, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "raw/xz9e", "original_bytes": 1048576, "compressed_bytes": 986028, "fraction": 0.9403495788574219, "encode_seconds_diagnostic": 0.2404002919793129, "decode_seconds_diagnostic": 0.05111133283935487, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "raw/brotli11", "original_bytes": 1048576, "compressed_bytes": 975381, "fraction": 0.9301958084106445, "encode_seconds_diagnostic": 1.1432544998824596, "decode_seconds_diagnostic": 0.0063166250474750996, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "raw/bzip2", "original_bytes": 1048576, "compressed_bytes": 1021722, "fraction": 0.9743900299072266, "encode_seconds_diagnostic": 0.1447953749448061, "decode_seconds_diagnostic": 0.0581063749268651, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "raw/ppmd", "original_bytes": 1048576, "compressed_bytes": 998293, "fraction": 0.9520463943481445, "encode_seconds_diagnostic": 0.16516175004653633, "decode_seconds_diagnostic": 0.21757891704328358, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "shuffle4/zstd3", "original_bytes": 1048576, "compressed_bytes": 976325, "fraction": 0.931096076965332, "encode_seconds_diagnostic": 0.0011227501090615988, "decode_seconds_diagnostic": 0.0013217499945312738, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "shuffle4/zstd19", "original_bytes": 1048576, "compressed_bytes": 976707, "fraction": 0.9314603805541992, "encode_seconds_diagnostic": 0.023845667019486427, "decode_seconds_diagnostic": 0.0012729999143630266, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "planes32/zstd3", "original_bytes": 1048576, "compressed_bytes": 1048613, "fraction": 1.000035285949707, "encode_seconds_diagnostic": 0.0025015000719577074, "decode_seconds_diagnostic": 0.0038540831301361322, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "planes32/zstd19", "original_bytes": 1048576, "compressed_bytes": 1048613, "fraction": 1.000035285949707, "encode_seconds_diagnostic": 0.02216783305630088, "decode_seconds_diagnostic": 0.003747333073988557, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "qbytes/zstd3", "original_bytes": 1048576, "compressed_bytes": 1082909, "fraction": 1.0327425003051758, "encode_seconds_diagnostic": 0.007552958093583584, "decode_seconds_diagnostic": 0.0025976658798754215, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "qbytes/zstd9", "original_bytes": 1048576, "compressed_bytes": 1075716, "fraction": 1.0258827209472656, "encode_seconds_diagnostic": 0.028991416096687317, "decode_seconds_diagnostic": 0.002658457960933447, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "qbytes/zstd19", "original_bytes": 1048576, "compressed_bytes": 982004, "fraction": 0.9365119934082031, "encode_seconds_diagnostic": 0.37803579098545015, "decode_seconds_diagnostic": 0.0016360830049961805, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "qbytes/zstd22", "original_bytes": 1048576, "compressed_bytes": 982004, "fraction": 0.9365119934082031, "encode_seconds_diagnostic": 0.33164633298292756, "decode_seconds_diagnostic": 0.0015353329945355654, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "qbytes/xz9e", "original_bytes": 1048576, "compressed_bytes": 1029860, "fraction": 0.9821510314941406, "encode_seconds_diagnostic": 0.7911329579073936, "decode_seconds_diagnostic": 0.08020133315585554, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "qbytes/brotli11", "original_bytes": 1048576, "compressed_bytes": 979929, "fraction": 0.9345331192016602, "encode_seconds_diagnostic": 1.2667757079470903, "decode_seconds_diagnostic": 0.01074387482367456, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "qbytes/bzip2", "original_bytes": 1048576, "compressed_bytes": 1042074, "fraction": 0.9937992095947266, "encode_seconds_diagnostic": 0.18154204194433987, "decode_seconds_diagnostic": 0.07880291598848999, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "qbytes/ppmd", "original_bytes": 1048576, "compressed_bytes": 1016006, "fraction": 0.9689388275146484, "encode_seconds_diagnostic": 0.3099041248206049, "decode_seconds_diagnostic": 0.3500859159976244, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "qplanes/zstd3", "original_bytes": 1048576, "compressed_bytes": 1040724, "fraction": 0.9925117492675781, "encode_seconds_diagnostic": 0.002134291920810938, "decode_seconds_diagnostic": 0.0039468330796808004, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "qplanes/zstd19", "original_bytes": 1048576, "compressed_bytes": 1040831, "fraction": 0.9926137924194336, "encode_seconds_diagnostic": 0.025181832956150174, "decode_seconds_diagnostic": 0.004005166934803128, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "foldplanes/zstd3", "original_bytes": 1048576, "compressed_bytes": 982193, "fraction": 0.9366922378540039, "encode_seconds_diagnostic": 0.004266624804586172, "decode_seconds_diagnostic": 0.005607124883681536, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "foldplanes/zstd9", "original_bytes": 1048576, "compressed_bytes": 981212, "fraction": 0.9357566833496094, "encode_seconds_diagnostic": 0.003564083017408848, "decode_seconds_diagnostic": 0.0053415000438690186, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "foldplanes/zstd19", "original_bytes": 1048576, "compressed_bytes": 982300, "fraction": 0.9367942810058594, "encode_seconds_diagnostic": 0.03305441699922085, "decode_seconds_diagnostic": 0.005543208913877606, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "foldplanes/zstd22", "original_bytes": 1048576, "compressed_bytes": 982300, "fraction": 0.9367942810058594, "encode_seconds_diagnostic": 0.03216787497512996, "decode_seconds_diagnostic": 0.005387000041082501, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "foldplanes/xz9e", "original_bytes": 1048576, "compressed_bytes": 989464, "fraction": 0.9436264038085938, "encode_seconds_diagnostic": 0.2369975419715047, "decode_seconds_diagnostic": 0.044149375054985285, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "foldplanes/brotli11", "original_bytes": 1048576, "compressed_bytes": 979992, "fraction": 0.9345932006835938, "encode_seconds_diagnostic": 0.6645548748783767, "decode_seconds_diagnostic": 0.010392915923148394, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "foldplanes/bzip2", "original_bytes": 1048576, "compressed_bytes": 1029153, "fraction": 0.9814767837524414, "encode_seconds_diagnostic": 0.16033208393491805, "decode_seconds_diagnostic": 0.06213491689413786, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "foldplanes/ppmd", "original_bytes": 1048576, "compressed_bytes": 1014830, "fraction": 0.9678173065185547, "encode_seconds_diagnostic": 0.1900634579360485, "decode_seconds_diagnostic": 0.26403083303011954, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "centerfoldplanes/zstd3", "original_bytes": 1048576, "compressed_bytes": 978605, "fraction": 0.9332704544067383, "encode_seconds_diagnostic": 0.004424791084602475, "decode_seconds_diagnostic": 0.00601495779119432, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "centerfoldplanes/zstd9", "original_bytes": 1048576, "compressed_bytes": 979022, "fraction": 0.9336681365966797, "encode_seconds_diagnostic": 0.005799375008791685, "decode_seconds_diagnostic": 0.0061034588143229485, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "centerfoldplanes/zstd19", "original_bytes": 1048576, "compressed_bytes": 976194, "fraction": 0.9309711456298828, "encode_seconds_diagnostic": 0.033253374975174665, "decode_seconds_diagnostic": 0.006230500061064959, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "centerfoldplanes/zstd22", "original_bytes": 1048576, "compressed_bytes": 976194, "fraction": 0.9309711456298828, "encode_seconds_diagnostic": 0.03055337513796985, "decode_seconds_diagnostic": 0.006170625099912286, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "centerfoldplanes/xz9e", "original_bytes": 1048576, "compressed_bytes": 982604, "fraction": 0.9370841979980469, "encode_seconds_diagnostic": 0.24164512497372925, "decode_seconds_diagnostic": 0.032053499948233366, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "centerfoldplanes/brotli11", "original_bytes": 1048576, "compressed_bytes": 974128, "fraction": 0.9290008544921875, "encode_seconds_diagnostic": 0.5464760411996394, "decode_seconds_diagnostic": 0.01054575014859438, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "centerfoldplanes/bzip2", "original_bytes": 1048576, "compressed_bytes": 1024283, "fraction": 0.976832389831543, "encode_seconds_diagnostic": 0.1617285420652479, "decode_seconds_diagnostic": 0.06380874989554286, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "centerfoldplanes/ppmd", "original_bytes": 1048576, "compressed_bytes": 1009389, "fraction": 0.9626283645629883, "encode_seconds_diagnostic": 0.19060249999165535, "decode_seconds_diagnostic": 0.24944841698743403, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "centerpacked/zstd3", "original_bytes": 1048576, "compressed_bytes": 971146, "fraction": 0.9261569976806641, "encode_seconds_diagnostic": 0.0027915409300476313, "decode_seconds_diagnostic": 0.0027314999606460333, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "centerpacked/zstd19", "original_bytes": 1048576, "compressed_bytes": 971541, "fraction": 0.9265336990356445, "encode_seconds_diagnostic": 0.02710620895959437, "decode_seconds_diagnostic": 0.0028197080828249454, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "centerbytes/zstd3", "original_bytes": 1048576, "compressed_bytes": 1079838, "fraction": 1.0298137664794922, "encode_seconds_diagnostic": 0.008461625082418323, "decode_seconds_diagnostic": 0.0032109590247273445, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "centerbytes/zstd19", "original_bytes": 1048576, "compressed_bytes": 975401, "fraction": 0.9302148818969727, "encode_seconds_diagnostic": 0.4269750830717385, "decode_seconds_diagnostic": 0.0024645410012453794, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "ans", "original_bytes": 1048576, "compressed_bytes": 971797, "fraction": 0.9267778396606445, "encode_seconds_diagnostic": 0.011536292033270001, "decode_seconds_diagnostic": 0.02710212511010468, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "context_ans", "original_bytes": 1048576, "compressed_bytes": 966596, "fraction": 0.9218177795410156, "encode_seconds_diagnostic": 0.011953999986872077, "decode_seconds_diagnostic": 0.027848791796714067, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "blosc4_1_9_262144", "original_bytes": 1048576, "compressed_bytes": 977070, "fraction": 0.9318065643310547, "encode_seconds_diagnostic": 0.022445791168138385, "decode_seconds_diagnostic": 0.000722500029951334, "roundtrip_exact": true}
{"group": "experts", "kind": "weight", "method": "blosc4_2_9_262144", "original_bytes": 1048576, "compressed_bytes": 1048608, "fraction": 1.000030517578125, "encode_seconds_diagnostic": 0.020069583784788847, "decode_seconds_diagnostic": 3.5084085538983345e-05, "roundtrip_exact": true}
{"group": "experts", "kind": "pair", "method": "raw/zstd3", "original_bytes": 2097152, "compressed_bytes": 1387219, "fraction": 0.6614775657653809, "encode_seconds_diagnostic": 0.006231042090803385, "decode_seconds_diagnostic": 0.0018097918946295977, "roundtrip_exact": true}
{"group": "experts", "kind": "pair", "method": "raw/zstd9", "original_bytes": 2097152, "compressed_bytes": 1312398, "fraction": 0.6258001327514648, "encode_seconds_diagnostic": 0.019139334093779325, "decode_seconds_diagnostic": 0.002130917040631175, "roundtrip_exact": true}
{"group": "experts", "kind": "pair", "method": "raw/zstd19", "original_bytes": 2097152, "compressed_bytes": 1322366, "fraction": 0.6305532455444336, "encode_seconds_diagnostic": 0.17793008405715227, "decode_seconds_diagnostic": 0.0023204998578876257, "roundtrip_exact": true}
{"group": "experts", "kind": "pair", "method": "raw/zstd22", "original_bytes": 2097152, "compressed_bytes": 1322366, "fraction": 0.6305532455444336, "encode_seconds_diagnostic": 0.17468637507408857, "decode_seconds_diagnostic": 0.0023230831138789654, "roundtrip_exact": true}
{"group": "experts", "kind": "pair", "method": "raw/xz9e", "original_bytes": 2097152, "compressed_bytes": 1187476, "fraction": 0.5662326812744141, "encode_seconds_diagnostic": 0.6990782502107322, "decode_seconds_diagnostic": 0.08574983291327953, "roundtrip_exact": true}
{"group": "experts", "kind": "pair", "method": "raw/brotli11", "original_bytes": 2097152, "compressed_bytes": 1202935, "fraction": 0.5736041069030762, "encode_seconds_diagnostic": 2.1283404589630663, "decode_seconds_diagnostic": 0.011184917064383626, "roundtrip_exact": true}
{"group": "experts", "kind": "pair", "method": "raw/bzip2", "original_bytes": 2097152, "compressed_bytes": 1148733, "fraction": 0.5477585792541504, "encode_seconds_diagnostic": 0.21145483292639256, "decode_seconds_diagnostic": 0.07964358408935368, "roundtrip_exact": true}
{"group": "experts", "kind": "pair", "method": "raw/ppmd", "original_bytes": 2097152, "compressed_bytes": 1137813, "fraction": 0.5425515174865723, "encode_seconds_diagnostic": 0.27733574993908405, "decode_seconds_diagnostic": 0.3373023341409862, "roundtrip_exact": true}
{"group": "experts", "kind": "pair", "method": "shuffle2/zstd3", "original_bytes": 2097152, "compressed_bytes": 1222171, "fraction": 0.5827765464782715, "encode_seconds_diagnostic": 0.003357374807819724, "decode_seconds_diagnostic": 0.003518542042002082, "roundtrip_exact": true}
{"group": "experts", "kind": "pair", "method": "shuffle2/zstd9", "original_bytes": 2097152, "compressed_bytes": 1205319, "fraction": 0.5747408866882324, "encode_seconds_diagnostic": 0.017136000096797943, "decode_seconds_diagnostic": 0.0034710830077528954, "roundtrip_exact": true}
{"group": "experts", "kind": "pair", "method": "shuffle2/zstd19", "original_bytes": 2097152, "compressed_bytes": 1179074, "fraction": 0.5622262954711914, "encode_seconds_diagnostic": 0.23604599991813302, "decode_seconds_diagnostic": 0.003473707940429449, "roundtrip_exact": true}
{"group": "experts", "kind": "pair", "method": "shuffle2/zstd22", "original_bytes": 2097152, "compressed_bytes": 1179074, "fraction": 0.5622262954711914, "encode_seconds_diagnostic": 0.2389870418701321, "decode_seconds_diagnostic": 0.0034879581071436405, "roundtrip_exact": true}
{"group": "experts", "kind": "pair", "method": "shuffle2/xz9e", "original_bytes": 2097152, "compressed_bytes": 1166384, "fraction": 0.5561752319335938, "encode_seconds_diagnostic": 1.044326167088002, "decode_seconds_diagnostic": 0.0709098749794066, "roundtrip_exact": true}
{"group": "experts", "kind": "pair", "method": "shuffle2/brotli11", "original_bytes": 2097152, "compressed_bytes": 1187103, "fraction": 0.5660548210144043, "encode_seconds_diagnostic": 1.9033143329434097, "decode_seconds_diagnostic": 0.011208832962438464, "roundtrip_exact": true}
{"group": "experts", "kind": "pair", "method": "shuffle2/bzip2", "original_bytes": 2097152, "compressed_bytes": 1212966, "fraction": 0.5783872604370117, "encode_seconds_diagnostic": 0.2130565419793129, "decode_seconds_diagnostic": 0.08391504199244082, "roundtrip_exact": true}

```


## Raw output: screen.json

```text
{
  "stage": "screen",
  "started": {
    "utc": "2026-09-06T00:44:31.308555+00:00",
    "vm_stat": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     3764.\nPages active:                                1023476.\nPages inactive:                               917623.\nPages speculative:                            104176.\nPages throttled:                                   0.\nPages wired down:                             339923.\nPages purgeable:                                  41.\n\"Translation faults\":                    14224038894.\nPages copy-on-write:                       654937159.\nPages zero filled:                       17620363250.\nPages reactivated:                        2901106744.\nPages purged:                               65251106.\nFile-backed pages:                           1456816.\nAnonymous pages:                              588459.\nPages stored in compressor:                  2297142.\nPages occupied by compressor:                 696610.\nDecompressions:                           1000772742.\nCompressions:                             1298351548.\nPageins:                                  6557873002.\nPageouts:                                   10797407.\nSwapins:                                    41724265.\nSwapouts:                                   69922789.\nPages tagged:                                 177862.\nPages tagged resident:                        123387.\nPages tagged compressed:                       54475.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6830.\nPages tag-storage free:                          210.\nPages tag-storage non-tag pageable:            91256.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9034816.\nTagged compressions:                         9946236.\nTagged decompressions:                       9156669.\n",
    "load_average": [
      26.13330078125,
      11.42919921875,
      6.330078125
    ]
  },
  "source_sha256": "61ec0aebb2fd8b08034f92f83e2cfc7a90ee0d9f6ac9248f780cf760a09fb4c9",
  "sample_policy": "Four component strata; largest eligible weight selected per stratum; offset 37%; companion scales/biases exact matching group; remaining BF16 largest other weight.",
  "size_per_weight": 1048576,
  "samples": [
    {
      "group": "experts",
      "kind": "weights",
      "tensor": {
        "file": "model-00001.safetensors",
        "name": "language_model.model.layers.0.mlp.switch_mlp.down_proj.weight",
        "dtype": "U32",
        "shape": [
          512,
          2560,
          80
        ],
        "offset": 4235421225,
        "size": 419430400,
        "group": "experts"
      },
      "offset": 154801152,
      "size": 1048576,
      "sha256": "880fa769d4660b4c6802bff89bf6788aa6e172d1a80d19007ba871453ed829e7",
      "group_size": 64,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 976399,
          "fraction": 0.9311666488647461,
          "encode_seconds_diagnostic": 0.0023931670002639294,
          "decode_seconds_diagnostic": 0.0018589170649647713,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd9",
          "original_bytes": 1048576,
          "compressed_bytes": 976048,
          "fraction": 0.9308319091796875,
          "encode_seconds_diagnostic": 0.002164666075259447,
          "decode_seconds_diagnostic": 0.0009997920133173466,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 976621,
          "fraction": 0.9313783645629883,
          "encode_seconds_diagnostic": 0.07405687519349158,
          "decode_seconds_diagnostic": 0.0011264169588685036,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd22",
          "original_bytes": 1048576,
          "compressed_bytes": 976621,
          "fraction": 0.9313783645629883,
          "encode_seconds_diagnostic": 0.07098645810037851,
          "decode_seconds_diagnostic": 0.001066667027771473,
          "roundtrip_exact": true
        },
        {
          "method": "raw/xz9e",
          "original_bytes": 1048576,
          "compressed_bytes": 986028,
          "fraction": 0.9403495788574219,
          "encode_seconds_diagnostic": 0.36396908410824835,
          "decode_seconds_diagnostic": 0.0766043751500547,
          "roundtrip_exact": true
        },
        {
          "method": "raw/brotli11",
          "original_bytes": 1048576,
          "compressed_bytes": 975381,
          "fraction": 0.9301958084106445,
          "encode_seconds_diagnostic": 1.7668743329122663,
          "decode_seconds_diagnostic": 0.009218124905601144,
          "roundtrip_exact": true
        },
        {
          "method": "raw/bzip2",
          "original_bytes": 1048576,
          "compressed_bytes": 1021722,
          "fraction": 0.9743900299072266,
          "encode_seconds_diagnostic": 0.25811616610735655,
          "decode_seconds_diagnostic": 0.1041242079809308,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle4/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 976325,
          "fraction": 0.931096076965332,
          "encode_seconds_diagnostic": 0.001781916944310069,
          "decode_seconds_diagnostic": 0.0018465418834239244,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle4/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 976707,
          "fraction": 0.9314603805541992,
          "encode_seconds_diagnostic": 0.06479374994523823,
          "decode_seconds_diagnostic": 0.0015987500082701445,
          "roundtrip_exact": true
        },
        {
          "method": "planes32/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 1048613,
          "fraction": 1.000035285949707,
          "encode_seconds_diagnostic": 0.007975958054885268,
          "decode_seconds_diagnostic": 0.006049333140254021,
          "roundtrip_exact": true
        },
        {
          "method": "planes32/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 1048613,
          "fraction": 1.000035285949707,
          "encode_seconds_diagnostic": 0.07470829202793539,
          "decode_seconds_diagnostic": 0.006184250116348267,
          "roundtrip_exact": true
        },
        {
          "method": "qbytes/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 1082909,
          "fraction": 1.0327425003051758,
          "encode_seconds_diagnostic": 0.014439917169511318,
          "decode_seconds_diagnostic": 0.007283207960426807,
          "roundtrip_exact": true
        },
        {
          "method": "qbytes/zstd9",
          "original_bytes": 1048576,
          "compressed_bytes": 1075716,
          "fraction": 1.0258827209472656,
          "encode_seconds_diagnostic": 0.05209616688080132,
          "decode_seconds_diagnostic": 0.003973666112869978,
          "roundtrip_exact": true
        },
        {
          "method": "qbytes/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 982004,
          "fraction": 0.9365119934082031,
          "encode_seconds_diagnostic": 1.180221291957423,
          "decode_seconds_diagnostic": 0.0026232500094920397,
          "roundtrip_exact": true
        },
        {
          "method": "qbytes/zstd22",
          "original_bytes": 1048576,
          "compressed_bytes": 982004,
          "fraction": 0.9365119934082031,
          "encode_seconds_diagnostic": 1.2348163749556988,
          "decode_seconds_diagnostic": 0.0025661669205874205,
          "roundtrip_exact": true
        },
        {
          "method": "qbytes/xz9e",
          "original_bytes": 1048576,
          "compressed_bytes": 1029860,
          "fraction": 0.9821510314941406,
          "encode_seconds_diagnostic": 2.0415792500134557,
          "decode_seconds_diagnostic": 0.1157065408769995,
          "roundtrip_exact": true
        },
        {
          "method": "qbytes/brotli11",
          "original_bytes": 1048576,
          "compressed_bytes": 979929,
          "fraction": 0.9345331192016602,
          "encode_seconds_diagnostic": 2.4819304579868913,
          "decode_seconds_diagnostic": 0.0146332080475986,
          "roundtrip_exact": true
        },
        {
          "method": "qbytes/bzip2",
          "original_bytes": 1048576,
          "compressed_bytes": 1042074,
          "fraction": 0.9937992095947266,
          "encode_seconds_diagnostic": 0.2925973751116544,
          "decode_seconds_diagnostic": 0.1533233339432627,
          "roundtrip_exact": true
        },
        {
          "method": "qplanes/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 1040724,
          "fraction": 0.9925117492675781,
          "encode_seconds_diagnostic": 0.004120000172406435,
          "decode_seconds_diagnostic": 0.007440000073984265,
          "roundtrip_exact": true
        },
        {
          "method": "qplanes/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 1040831,
          "fraction": 0.9926137924194336,
          "encode_seconds_diagnostic": 0.08235487504862249,
          "decode_seconds_diagnostic": 0.007043916033580899,
          "roundtrip_exact": true
        },
        {
          "method": "foldplanes/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 982193,
          "fraction": 0.9366922378540039,
          "encode_seconds_diagnostic": 0.010299499845132232,
          "decode_seconds_diagnostic": 0.008946791989728808,
          "roundtrip_exact": true
        },
        {
          "method": "foldplanes/zstd9",
          "original_bytes": 1048576,
          "compressed_bytes": 981212,
          "fraction": 0.9357566833496094,
          "encode_seconds_diagnostic": 0.0061784591525793076,
          "decode_seconds_diagnostic": 0.009431833168491721,
          "roundtrip_exact": true
        },
        {
          "method": "foldplanes/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 982300,
          "fraction": 0.9367942810058594,
          "encode_seconds_diagnostic": 0.09293120796792209,
          "decode_seconds_diagnostic": 0.00796562503091991,
          "roundtrip_exact": true
        },
        {
          "method": "foldplanes/zstd22",
          "original_bytes": 1048576,
          "compressed_bytes": 982300,
          "fraction": 0.9367942810058594,
          "encode_seconds_diagnostic": 0.09286500001326203,
          "decode_seconds_diagnostic": 0.00873024994507432,
          "roundtrip_exact": true
        },
        {
          "method": "foldplanes/xz9e",
          "original_bytes": 1048576,
          "compressed_bytes": 989464,
          "fraction": 0.9436264038085938,
          "encode_seconds_diagnostic": 0.37198687507770956,
          "decode_seconds_diagnostic": 0.06726987496949732,
          "roundtrip_exact": true
        },
        {
          "method": "foldplanes/brotli11",
          "original_bytes": 1048576,
          "compressed_bytes": 979992,
          "fraction": 0.9345932006835938,
          "encode_seconds_diagnostic": 1.0722347090486437,
          "decode_seconds_diagnostic": 0.015321583021432161,
          "roundtrip_exact": true
        },
        {
          "method": "foldplanes/bzip2",
          "original_bytes": 1048576,
          "compressed_bytes": 1029153,
          "fraction": 0.9814767837524414,
          "encode_seconds_diagnostic": 0.30407366598956287,
          "decode_seconds_diagnostic": 0.12039741687476635,
          "roundtrip_exact": true
        },
        {
          "method": "centerfoldplanes/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 978605,
          "fraction": 0.9332704544067383,
          "encode_seconds_diagnostic": 0.0068346248008310795,
          "decode_seconds_diagnostic": 0.010353040881454945,
          "roundtrip_exact": true
        },
        {
          "method": "centerfoldplanes/zstd9",
          "original_bytes": 1048576,
          "compressed_bytes": 979022,
          "fraction": 0.9336681365966797,
          "encode_seconds_diagnostic": 0.009549082955345511,
          "decode_seconds_diagnostic": 0.009414041880518198,
          "roundtrip_exact": true
        },
        {
          "method": "centerfoldplanes/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 976194,
          "fraction": 0.9309711456298828,
          "encode_seconds_diagnostic": 0.09196912497282028,
          "decode_seconds_diagnostic": 0.009116249857470393,
          "roundtrip_exact": true
        },
        {
          "method": "centerfoldplanes/zstd22",
          "original_bytes": 1048576,
          "compressed_bytes": 976194,
          "fraction": 0.9309711456298828,
          "encode_seconds_diagnostic": 0.09370012488216162,
          "decode_seconds_diagnostic": 0.009744750102981925,
          "roundtrip_exact": true
        },
        {
          "method": "centerfoldplanes/xz9e",
          "original_bytes": 1048576,
          "compressed_bytes": 982604,
          "fraction": 0.9370841979980469,
          "encode_seconds_diagnostic": 0.3712323328945786,
          "decode_seconds_diagnostic": 0.048666541930288076,
          "roundtrip_exact": true
        },
        {
          "method": "centerfoldplanes/brotli11",
          "original_bytes": 1048576,
          "compressed_bytes": 974128,
          "fraction": 0.9290008544921875,
          "encode_seconds_diagnostic": 0.9031847910955548,
          "decode_seconds_diagnostic": 0.016688416013494134,
          "roundtrip_exact": true
        },
        {
          "method": "centerfoldplanes/bzip2",
          "original_bytes": 1048576,
          "compressed_bytes": 1024283,
          "fraction": 0.976832389831543,
          "encode_seconds_diagnostic": 0.2866466250270605,
          "decode_seconds_diagnostic": 0.10964520904235542,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 971146,
          "fraction": 0.9261569976806641,
          "encode_seconds_diagnostic": 0.004611082840710878,
          "decode_seconds_diagnostic": 0.004411708097904921,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 971541,
          "fraction": 0.9265336990356445,
          "encode_seconds_diagnostic": 0.09944791696034372,
          "decode_seconds_diagnostic": 0.004035624908283353,
          "roundtrip_exact": true
        },
        {
          "method": "centerbytes/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 1079838,
          "fraction": 1.0298137664794922,
          "encode_seconds_diagnostic": 0.01467112498357892,
          "decode_seconds_diagnostic": 0.005321708042174578,
          "roundtrip_exact": true
        },
        {
          "method": "centerbytes/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 975401,
          "fraction": 0.9302148818969727,
          "encode_seconds_diagnostic": 1.3042513330001384,
          "decode_seconds_diagnostic": 0.003922292031347752,
          "roundtrip_exact": true
        },
        {
          "method": "ans",
          "original_bytes": 1048576,
          "compressed_bytes": 971797,
          "fraction": 0.9267778396606445,
          "encode_seconds_diagnostic": 0.02337124990299344,
          "decode_seconds_diagnostic": 0.03572379215620458,
          "roundtrip_exact": true
        },
        {
          "method": "context_ans",
          "original_bytes": 1048576,
          "compressed_bytes": 966596,
          "fraction": 0.9218177795410156,
          "encode_seconds_diagnostic": 0.015815250109881163,
          "decode_seconds_diagnostic": 0.03803099994547665,
          "roundtrip_exact": true
        },
        {
          "method": "blosc4_1_9_262144",
          "original_bytes": 1048576,
          "compressed_bytes": 977070,
          "fraction": 0.9318065643310547,
          "encode_seconds_diagnostic": 0.05252391588874161,
          "decode_seconds_diagnostic": 0.003055666806176305,
          "roundtrip_exact": true
        },
        {
          "method": "blosc4_2_9_262144",
          "original_bytes": 1048576,
          "compressed_bytes": 1048608,
          "fraction": 1.000030517578125,
          "encode_seconds_diagnostic": 0.04625391587615013,
          "decode_seconds_diagnostic": 5.454104393720627e-05,
          "roundtrip_exact": true
        }
      ],
      "nibble_entropy_bits": 3.706661241552994,
      "conditional_center_entropy_bits": 3.6835661937901065
    },
    {
      "group": "experts",
      "kind": "scale_bias_pair",
      "tensor": {
        "file": "model-00001.safetensors",
        "name": "language_model.model.layers.0.mlp.switch_mlp.down_proj.scales",
        "dtype": "BF16",
        "shape": [
          512,
          2560,
          10
        ],
        "offset": 4209206825,
        "size": 26214400,
        "group": "experts"
      },
      "bias_tensor": {
        "file": "model-00001.safetensors",
        "name": "language_model.model.layers.0.mlp.switch_mlp.down_proj.biases",
        "dtype": "BF16",
        "shape": [
          512,
          2560,
          10
        ],
        "offset": 9352867441,
        "size": 26214400,
        "group": "experts"
      },
      "offset": 9311232,
      "size_per_tensor": 1048576,
      "sha256": "9b0400a444d6edf4c6d0532c4afcf94c0f403fbc3029c33a67c5d37a53828115",
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 1387219,
          "fraction": 0.6614775657653809,
          "encode_seconds_diagnostic": 0.010992666007950902,
          "decode_seconds_diagnostic": 0.0027169999666512012,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd9",
          "original_bytes": 2097152,
          "compressed_bytes": 1312398,
          "fraction": 0.6258001327514648,
          "encode_seconds_diagnostic": 0.03766124998219311,
          "decode_seconds_diagnostic": 0.0026205419562757015,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 1322366,
          "fraction": 0.6305532455444336,
          "encode_seconds_diagnostic": 0.6006725418847054,
          "decode_seconds_diagnostic": 0.0034712909255176783,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd22",
          "original_bytes": 2097152,
          "compressed_bytes": 1322366,
          "fraction": 0.6305532455444336,
          "encode_seconds_diagnostic": 0.5777578339911997,
          "decode_seconds_diagnostic": 0.0033976249396800995,
          "roundtrip_exact": true
        },
        {
          "method": "raw/xz9e",
          "original_bytes": 2097152,
          "compressed_bytes": 1187476,
          "fraction": 0.5662326812744141,
          "encode_seconds_diagnostic": 1.3419146670494229,
          "decode_seconds_diagnostic": 0.13565320894122124,
          "roundtrip_exact": true
        },
        {
          "method": "raw/brotli11",
          "original_bytes": 2097152,
          "compressed_bytes": 1202935,
          "fraction": 0.5736041069030762,
          "encode_seconds_diagnostic": 3.405019207857549,
          "decode_seconds_diagnostic": 0.016744582913815975,
          "roundtrip_exact": true
        },
        {
          "method": "raw/bzip2",
          "original_bytes": 2097152,
          "compressed_bytes": 1148733,
          "fraction": 0.5477585792541504,
          "encode_seconds_diagnostic": 0.3592046669218689,
          "decode_seconds_diagnostic": 0.1462300829589367,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 1222171,
          "fraction": 0.5827765464782715,
          "encode_seconds_diagnostic": 0.00695945811457932,
          "decode_seconds_diagnostic": 0.004892041906714439,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd9",
          "original_bytes": 2097152,
          "compressed_bytes": 1205319,
          "fraction": 0.5747408866882324,
          "encode_seconds_diagnostic": 0.030076707946136594,
          "decode_seconds_diagnostic": 0.005034499801695347,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 1179074,
          "fraction": 0.5622262954711914,
          "encode_seconds_diagnostic": 0.5285350419580936,
          "decode_seconds_diagnostic": 0.004943124949932098,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd22",
          "original_bytes": 2097152,
          "compressed_bytes": 1179074,
          "fraction": 0.5622262954711914,
          "encode_seconds_diagnostic": 0.5182657078839839,
          "decode_seconds_diagnostic": 0.004860667046159506,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/xz9e",
          "original_bytes": 2097152,
          "compressed_bytes": 1166384,
          "fraction": 0.5561752319335938,
          "encode_seconds_diagnostic": 1.7231089167762548,
          "decode_seconds_diagnostic": 0.10583962500095367,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/brotli11",
          "original_bytes": 2097152,
          "compressed_bytes": 1187103,
          "fraction": 0.5660548210144043,
          "encode_seconds_diagnostic": 3.0308899579104036,
          "decode_seconds_diagnostic": 0.014922708040103316,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/bzip2",
          "original_bytes": 2097152,
          "compressed_bytes": 1212966,
          "fraction": 0.5783872604370117,
          "encode_seconds_diagnostic": 0.38205733289942145,
          "decode_seconds_diagnostic": 0.13774116593413055,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 1235094,
          "fraction": 0.5889387130737305,
          "encode_seconds_diagnostic": 0.007243250031024218,
          "decode_seconds_diagnostic": 0.013336667092517018,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd9",
          "original_bytes": 2097152,
          "compressed_bytes": 1230778,
          "fraction": 0.5868806838989258,
          "encode_seconds_diagnostic": 0.009520499967038631,
          "decode_seconds_diagnostic": 0.012093083932995796,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 1222888,
          "fraction": 0.5831184387207031,
          "encode_seconds_diagnostic": 0.1341869169846177,
          "decode_seconds_diagnostic": 0.011812792159616947,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd22",
          "original_bytes": 2097152,
          "compressed_bytes": 1222599,
          "fraction": 0.5829806327819824,
          "encode_seconds_diagnostic": 0.2010779578704387,
          "decode_seconds_diagnostic": 0.010783416917547584,
          "roundtrip_exact": true
        },
        {
          "method": "planes/xz9e",
          "original_bytes": 2097152,
          "compressed_bytes": 1210652,
          "fraction": 0.5772838592529297,
          "encode_seconds_diagnostic": 1.1661903341300786,
          "decode_seconds_diagnostic": 0.04399779113009572,
          "roundtrip_exact": true
        },
        {
          "method": "planes/brotli11",
          "original_bytes": 2097152,
          "compressed_bytes": 1211469,
          "fraction": 0.5776734352111816,
          "encode_seconds_diagnostic": 1.546036375220865,
          "decode_seconds_diagnostic": 0.017382374964654446,
          "roundtrip_exact": true
        },
        {
          "method": "planes/bzip2",
          "original_bytes": 2097152,
          "compressed_bytes": 1254862,
          "fraction": 0.5983648300170898,
          "encode_seconds_diagnostic": 0.49817724991589785,
          "decode_seconds_diagnostic": 0.14675774984061718,
          "roundtrip_exact": true
        },
        {
          "method": "xorshuffle/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 1260162,
          "fraction": 0.6008920669555664,
          "encode_seconds_diagnostic": 0.007553417002782226,
          "decode_seconds_diagnostic": 0.007558625191450119,
          "roundtrip_exact": true
        },
        {
          "method": "xorshuffle/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 1215868,
          "fraction": 0.5797710418701172,
          "encode_seconds_diagnostic": 0.5181577911134809,
          "decode_seconds_diagnostic": 0.00711420807056129,
          "roundtrip_exact": true
        },
        {
          "method": "deltashuffle/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 1297713,
          "fraction": 0.618797779083252,
          "encode_seconds_diagnostic": 0.007289416855201125,
          "decode_seconds_diagnostic": 0.0068902079947292805,
          "roundtrip_exact": true
        },
        {
          "method": "deltashuffle/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 1262562,
          "fraction": 0.6020364761352539,
          "encode_seconds_diagnostic": 0.4845209161285311,
          "decode_seconds_diagnostic": 0.010507125174626708,
          "roundtrip_exact": true
        },
        {
          "method": "xorplanes/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 1174324,
          "fraction": 0.5599613189697266,
          "encode_seconds_diagnostic": 0.005581041099503636,
          "decode_seconds_diagnostic": 0.01370783313177526,
          "roundtrip_exact": true
        },
        {
          "method": "xorplanes/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 1151182,
          "fraction": 0.5489263534545898,
          "encode_seconds_diagnostic": 0.11676979204639792,
          "decode_seconds_diagnostic": 0.0133201670832932,
          "roundtrip_exact": true
        },
        {
          "method": "deltaplanes/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 1183869,
          "fraction": 0.5645127296447754,
          "encode_seconds_diagnostic": 0.004681291989982128,
          "decode_seconds_diagnostic": 0.01339533319696784,
          "roundtrip_exact": true
        },
        {
          "method": "deltaplanes/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 1170956,
          "fraction": 0.5583553314208984,
          "encode_seconds_diagnostic": 0.12567587522789836,
          "decode_seconds_diagnostic": 0.014755666954442859,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 726818,
          "fraction": 0.3465738296508789,
          "encode_seconds_diagnostic": 0.0051026251167058945,
          "decode_seconds_diagnostic": 0.009685666067525744,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 2097152,
          "compressed_bytes": 703798,
          "fraction": 0.33559703826904297,
          "encode_seconds_diagnostic": 0.03151558293029666,
          "decode_seconds_diagnostic": 0.007365916855633259,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 662577,
          "fraction": 0.31594133377075195,
          "encode_seconds_diagnostic": 0.7071019168943167,
          "decode_seconds_diagnostic": 0.00724637508392334,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd22",
          "original_bytes": 2097152,
          "compressed_bytes": 662573,
          "fraction": 0.31593942642211914,
          "encode_seconds_diagnostic": 0.7244860420469195,
          "decode_seconds_diagnostic": 0.00682608294300735,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/xz9e",
          "original_bytes": 2097152,
          "compressed_bytes": 652644,
          "fraction": 0.3112049102783203,
          "encode_seconds_diagnostic": 3.26549566606991,
          "decode_seconds_diagnostic": 0.05751495901495218,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/brotli11",
          "original_bytes": 2097152,
          "compressed_bytes": 676549,
          "fraction": 0.322603702545166,
          "encode_seconds_diagnostic": 3.261326542124152,
          "decode_seconds_diagnostic": 0.012267166981473565,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/bzip2",
          "original_bytes": 2097152,
          "compressed_bytes": 687718,
          "fraction": 0.3279294967651367,
          "encode_seconds_diagnostic": 0.23780370806343853,
          "decode_seconds_diagnostic": 0.08427216717973351,
          "roundtrip_exact": true
        },
        {
          "method": "pred_planes/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 729572,
          "fraction": 0.3478870391845703,
          "encode_seconds_diagnostic": 0.004959500161930919,
          "decode_seconds_diagnostic": 0.011192624922841787,
          "roundtrip_exact": true
        },
        {
          "method": "pred_planes/zstd9",
          "original_bytes": 2097152,
          "compressed_bytes": 716300,
          "fraction": 0.34155845642089844,
          "encode_seconds_diagnostic": 0.017322166822850704,
          "decode_seconds_diagnostic": 0.011783666210249066,
          "roundtrip_exact": true
        },
        {
          "method": "pred_planes/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 694440,
          "fraction": 0.3311347961425781,
          "encode_seconds_diagnostic": 0.30057691712863743,
          "decode_seconds_diagnostic": 0.011437915964052081,
          "roundtrip_exact": true
        },
        {
          "method": "pred_planes/zstd22",
          "original_bytes": 2097152,
          "compressed_bytes": 694190,
          "fraction": 0.33101558685302734,
          "encode_seconds_diagnostic": 0.34812025004066527,
          "decode_seconds_diagnostic": 0.013505167094990611,
          "roundtrip_exact": true
        },
        {
          "method": "pred_planes/xz9e",
          "original_bytes": 2097152,
          "compressed_bytes": 693196,
          "fraction": 0.33054161071777344,
          "encode_seconds_diagnostic": 1.795858833938837,
          "decode_seconds_diagnostic": 0.041721625020727515,
          "roundtrip_exact": true
        },
        {
          "method": "pred_planes/brotli11",
          "original_bytes": 2097152,
          "compressed_bytes": 694112,
          "fraction": 0.3309783935546875,
          "encode_seconds_diagnostic": 1.9188215418253094,
          "decode_seconds_diagnostic": 0.017061875201761723,
          "roundtrip_exact": true
        },
        {
          "method": "pred_planes/bzip2",
          "original_bytes": 2097152,
          "compressed_bytes": 713312,
          "fraction": 0.3401336669921875,
          "encode_seconds_diagnostic": 0.29669574997387826,
          "decode_seconds_diagnostic": 0.09009337495081127,
          "roundtrip_exact": true
        },
        {
          "method": "ans",
          "original_bytes": 2097152,
          "compressed_bytes": 1093834,
          "fraction": 0.521580696105957,
          "encode_seconds_diagnostic": 0.008792916079983115,
          "decode_seconds_diagnostic": 0.047065542079508305,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 2097152,
          "compressed_bytes": 635817,
          "fraction": 0.30318117141723633,
          "encode_seconds_diagnostic": 0.012776374816894531,
          "decode_seconds_diagnostic": 0.06018841592594981,
          "roundtrip_exact": true
        }
      ],
      "predictor_exact_fraction": 0.9694747924804688,
      "residual_histogram": [
        [
          0,
          508284
        ],
        [
          2,
          8298
        ],
        [
          1,
          7706
        ]
      ]
    },
    {
      "group": "ngram",
      "kind": "weights",
      "tensor": {
        "file": "model-00001.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_0.weight",
        "dtype": "U32",
        "shape": [
          2500012,
          20
        ],
        "offset": 3929933721,
        "size": 200000960,
        "group": "ngram"
      },
      "offset": 73612288,
      "size": 1048576,
      "sha256": "b558e03f56e6a52f5642ac931c0f28c9bd1e68f35396281fcb2ebce5d0a560d5",
      "group_size": 32,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 1010709,
          "fraction": 0.9638872146606445,
          "encode_seconds_diagnostic": 0.0016959169879555702,
          "decode_seconds_diagnostic": 0.001052832929417491,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd9",
          "original_bytes": 1048576,
          "compressed_bytes": 1009729,
          "fraction": 0.9629526138305664,
          "encode_seconds_diagnostic": 0.0014332081191241741,
          "decode_seconds_diagnostic": 0.0009096250869333744,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 1010459,
          "fraction": 0.963648796081543,
          "encode_seconds_diagnostic": 0.05230195797048509,
          "decode_seconds_diagnostic": 0.001068208133801818,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd22",
          "original_bytes": 1048576,
          "compressed_bytes": 1010459,
          "fraction": 0.963648796081543,
          "encode_seconds_diagnostic": 0.04608424985781312,
          "decode_seconds_diagnostic": 0.0010530001018196344,
          "roundtrip_exact": true
        },
        {
          "method": "raw/xz9e",
          "original_bytes": 1048576,
          "compressed_bytes": 1020044,
          "fraction": 0.9727897644042969,
          "encode_seconds_diagnostic": 0.30863220896571875,
          "decode_seconds_diagnostic": 0.07358795893378556,
          "roundtrip_exact": true
        },
        {
          "method": "raw/brotli11",
          "original_bytes": 1048576,
          "compressed_bytes": 1009034,
          "fraction": 0.9622898101806641,
          "encode_seconds_diagnostic": 1.437192999990657,
          "decode_seconds_diagnostic": 0.0069761250633746386,
          "roundtrip_exact": true
        },
        {
          "method": "raw/bzip2",
          "original_bytes": 1048576,
          "compressed_bytes": 1042085,
          "fraction": 0.993809700012207,
          "encode_seconds_diagnostic": 0.24585962505079806,
          "decode_seconds_diagnostic": 0.08662608289159834,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle4/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 1010725,
          "fraction": 0.963902473449707,
          "encode_seconds_diagnostic": 0.0019049581605941057,
          "decode_seconds_diagnostic": 0.001514666946604848,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle4/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 1010311,
          "fraction": 0.9635076522827148,
          "encode_seconds_diagnostic": 0.04594941716641188,
          "decode_seconds_diagnostic": 0.0018627089448273182,
          "roundtrip_exact": true
        },
        {
          "method": "planes32/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 1048613,
          "fraction": 1.000035285949707,
          "encode_seconds_diagnostic": 0.0029692500829696655,
          "decode_seconds_diagnostic": 0.005264625186100602,
          "roundtrip_exact": true
        },
        {
          "method": "planes32/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 1048613,
          "fraction": 1.000035285949707,
          "encode_seconds_diagnostic": 0.046775542199611664,
          "decode_seconds_diagnostic": 0.005328458035364747,
          "roundtrip_exact": true
        },
        {
          "method": "qbytes/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 1090796,
          "fraction": 1.0402641296386719,
          "encode_seconds_diagnostic": 0.011056500021368265,
          "decode_seconds_diagnostic": 0.003496958175674081,
          "roundtrip_exact": true
        },
        {
          "method": "qbytes/zstd9",
          "original_bytes": 1048576,
          "compressed_bytes": 1100368,
          "fraction": 1.0493927001953125,
          "encode_seconds_diagnostic": 0.0394727501552552,
          "decode_seconds_diagnostic": 0.004594374913722277,
          "roundtrip_exact": true
        },
        {
          "method": "qbytes/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 1019005,
          "fraction": 0.9717988967895508,
          "encode_seconds_diagnostic": 0.7318452910985798,
          "decode_seconds_diagnostic": 0.0019359588623046875,
          "roundtrip_exact": true
        },
        {
          "method": "qbytes/zstd22",
          "original_bytes": 1048576,
          "compressed_bytes": 1019005,
          "fraction": 0.9717988967895508,
          "encode_seconds_diagnostic": 0.7372476251330227,
          "decode_seconds_diagnostic": 0.0020846251863986254,
          "roundtrip_exact": true
        },
        {
          "method": "qbytes/xz9e",
          "original_bytes": 1048576,
          "compressed_bytes": 1057952,
          "fraction": 1.008941650390625,
          "encode_seconds_diagnostic": 1.430151749867946,
          "decode_seconds_diagnostic": 0.11649395804852247,
          "roundtrip_exact": true
        },
        {
          "method": "qbytes/brotli11",
          "original_bytes": 1048576,
          "compressed_bytes": 1016523,
          "fraction": 0.9694318771362305,
          "encode_seconds_diagnostic": 1.5121902921237051,
          "decode_seconds_diagnostic": 0.015136374859139323,
          "roundtrip_exact": true
        },
        {
          "method": "qbytes/bzip2",
          "original_bytes": 1048576,
          "compressed_bytes": 1056905,
          "fraction": 1.0079431533813477,
          "encode_seconds_diagnostic": 0.2583124579396099,
          "decode_seconds_diagnostic": 0.129013542085886,
          "roundtrip_exact": true
        },
        {
          "method": "qplanes/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 1042636,
          "fraction": 0.9943351745605469,
          "encode_seconds_diagnostic": 0.002689292188733816,
          "decode_seconds_diagnostic": 0.006087957881391048,
          "roundtrip_exact": true
        },
        {
          "method": "qplanes/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 1042719,
          "fraction": 0.9944143295288086,
          "encode_seconds_diagnostic": 0.0477249170653522,
          "decode_seconds_diagnostic": 0.00616650003939867,
          "roundtrip_exact": true
        },
        {
          "method": "foldplanes/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 1017067,
          "fraction": 0.9699506759643555,
          "encode_seconds_diagnostic": 0.0054259998723864555,
          "decode_seconds_diagnostic": 0.007911875145509839,
          "roundtrip_exact": true
        },
        {
          "method": "foldplanes/zstd9",
          "original_bytes": 1048576,
          "compressed_bytes": 1016651,
          "fraction": 0.9695539474487305,
          "encode_seconds_diagnostic": 0.005088833859190345,
          "decode_seconds_diagnostic": 0.00773795903660357,
          "roundtrip_exact": true
        },
        {
          "method": "foldplanes/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 1014791,
          "fraction": 0.9677801132202148,
          "encode_seconds_diagnostic": 0.048501874785870314,
          "decode_seconds_diagnostic": 0.007893499918282032,
          "roundtrip_exact": true
        },
        {
          "method": "foldplanes/zstd22",
          "original_bytes": 1048576,
          "compressed_bytes": 1014791,
          "fraction": 0.9677801132202148,
          "encode_seconds_diagnostic": 0.04739520791918039,
          "decode_seconds_diagnostic": 0.007883500074967742,
          "roundtrip_exact": true
        },
        {
          "method": "foldplanes/xz9e",
          "original_bytes": 1048576,
          "compressed_bytes": 1022236,
          "fraction": 0.9748802185058594,
          "encode_seconds_diagnostic": 0.3142985838931054,
          "decode_seconds_diagnostic": 0.04564112494699657,
          "roundtrip_exact": true
        },
        {
          "method": "foldplanes/brotli11",
          "original_bytes": 1048576,
          "compressed_bytes": 1014067,
          "fraction": 0.9670896530151367,
          "encode_seconds_diagnostic": 1.201352917123586,
          "decode_seconds_diagnostic": 0.014002749929204583,
          "roundtrip_exact": true
        },
        {
          "method": "foldplanes/bzip2",
          "original_bytes": 1048576,
          "compressed_bytes": 1045570,
          "fraction": 0.9971332550048828,
          "encode_seconds_diagnostic": 0.25912687508389354,
          "decode_seconds_diagnostic": 0.09533208305947483,
          "roundtrip_exact": true
        },
        {
          "method": "centerfoldplanes/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 1013012,
          "fraction": 0.9660835266113281,
          "encode_seconds_diagnostic": 0.006406333995983005,
          "decode_seconds_diagnostic": 0.008914291858673096,
          "roundtrip_exact": true
        },
        {
          "method": "centerfoldplanes/zstd9",
          "original_bytes": 1048576,
          "compressed_bytes": 1012953,
          "fraction": 0.9660272598266602,
          "encode_seconds_diagnostic": 0.005535125033929944,
          "decode_seconds_diagnostic": 0.009107875172048807,
          "roundtrip_exact": true
        },
        {
          "method": "centerfoldplanes/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 1010682,
          "fraction": 0.9638614654541016,
          "encode_seconds_diagnostic": 0.04821333289146423,
          "decode_seconds_diagnostic": 0.00885825022123754,
          "roundtrip_exact": true
        },
        {
          "method": "centerfoldplanes/zstd22",
          "original_bytes": 1048576,
          "compressed_bytes": 1010682,
          "fraction": 0.9638614654541016,
          "encode_seconds_diagnostic": 0.041629499988630414,
          "decode_seconds_diagnostic": 0.009150166064500809,
          "roundtrip_exact": true
        },
        {
          "method": "centerfoldplanes/xz9e",
          "original_bytes": 1048576,
          "compressed_bytes": 1016612,
          "fraction": 0.9695167541503906,
          "encode_seconds_diagnostic": 0.31173900002613664,
          "decode_seconds_diagnostic": 0.04270129092037678,
          "roundtrip_exact": true
        },
        {
          "method": "centerfoldplanes/brotli11",
          "original_bytes": 1048576,
          "compressed_bytes": 1009556,
          "fraction": 0.9627876281738281,
          "encode_seconds_diagnostic": 0.7947709169238806,
          "decode_seconds_diagnostic": 0.01317070797085762,
          "roundtrip_exact": true
        },
        {
          "method": "centerfoldplanes/bzip2",
          "original_bytes": 1048576,
          "compressed_bytes": 1042933,
          "fraction": 0.9946184158325195,
          "encode_seconds_diagnostic": 0.26678783306851983,
          "decode_seconds_diagnostic": 0.09861508291214705,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 1009040,
          "fraction": 0.9622955322265625,
          "encode_seconds_diagnostic": 0.004407041938975453,
          "decode_seconds_diagnostic": 0.004112042021006346,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 1009034,
          "fraction": 0.9622898101806641,
          "encode_seconds_diagnostic": 0.05517216701991856,
          "decode_seconds_diagnostic": 0.004197458038106561,
          "roundtrip_exact": true
        },
        {
          "method": "centerbytes/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 1090238,
          "fraction": 1.0397319793701172,
          "encode_seconds_diagnostic": 0.011564125074073672,
          "decode_seconds_diagnostic": 0.0046790000051259995,
          "roundtrip_exact": true
        },
        {
          "method": "centerbytes/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 1016608,
          "fraction": 0.969512939453125,
          "encode_seconds_diagnostic": 0.7451918751467019,
          "decode_seconds_diagnostic": 0.0030080419965088367,
          "roundtrip_exact": true
        },
        {
          "method": "ans",
          "original_bytes": 1048576,
          "compressed_bytes": 1005845,
          "fraction": 0.9592485427856445,
          "encode_seconds_diagnostic": 0.01475920807570219,
          "decode_seconds_diagnostic": 0.035475999815389514,
          "roundtrip_exact": true
        },
        {
          "method": "context_ans",
          "original_bytes": 1048576,
          "compressed_bytes": 1001977,
          "fraction": 0.9555597305297852,
          "encode_seconds_diagnostic": 0.017650249879807234,
          "decode_seconds_diagnostic": 0.03606783295981586,
          "roundtrip_exact": true
        },
        {
          "method": "blosc4_1_9_262144",
          "original_bytes": 1048576,
          "compressed_bytes": 1010691,
          "fraction": 0.9638700485229492,
          "encode_seconds_diagnostic": 0.033357459120452404,
          "decode_seconds_diagnostic": 0.0009875830728560686,
          "roundtrip_exact": true
        },
        {
          "method": "blosc4_2_9_262144",
          "original_bytes": 1048576,
          "compressed_bytes": 1048608,
          "fraction": 1.000030517578125,
          "encode_seconds_diagnostic": 0.03618870791979134,
          "decode_seconds_diagnostic": 4.9708178266882896e-05,
          "roundtrip_exact": true
        }
      ],
      "nibble_entropy_bits": 3.836546140913291,
      "conditional_center_entropy_bits": 3.8191243453254935
    },
    {
      "group": "ngram",
      "kind": "scale_bias_pair",
      "tensor": {
        "file": "model-00001.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_0.scales",
        "dtype": "BF16",
        "shape": [
          2500012,
          5
        ],
        "offset": 3904933601,
        "size": 25000120,
        "group": "ngram"
      },
      "bias_tensor": {
        "file": "model-00001.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_0.biases",
        "dtype": "BF16",
        "shape": [
          2500012,
          5
        ],
        "offset": 6327657881,
        "size": 25000120,
        "group": "ngram"
      },
      "offset": 8861952,
      "size_per_tensor": 1048576,
      "sha256": "28a3483ffd9aeefbc1a510d90a478074f69c134500f1e8d392330ddf0bc99e46",
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 1391265,
          "fraction": 0.6634068489074707,
          "encode_seconds_diagnostic": 0.009577875025570393,
          "decode_seconds_diagnostic": 0.0024215830489993095,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd9",
          "original_bytes": 2097152,
          "compressed_bytes": 1316805,
          "fraction": 0.627901554107666,
          "encode_seconds_diagnostic": 0.029134707991033792,
          "decode_seconds_diagnostic": 0.0025309589691460133,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 1293986,
          "fraction": 0.6170206069946289,
          "encode_seconds_diagnostic": 0.36094416701234877,
          "decode_seconds_diagnostic": 0.0034828749485313892,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd22",
          "original_bytes": 2097152,
          "compressed_bytes": 1293986,
          "fraction": 0.6170206069946289,
          "encode_seconds_diagnostic": 0.3492212500423193,
          "decode_seconds_diagnostic": 0.003277083160355687,
          "roundtrip_exact": true
        },
        {
          "method": "raw/xz9e",
          "original_bytes": 2097152,
          "compressed_bytes": 1194380,
          "fraction": 0.5695247650146484,
          "encode_seconds_diagnostic": 1.0687877498567104,
          "decode_seconds_diagnostic": 0.11749295913614333,
          "roundtrip_exact": true
        },
        {
          "method": "raw/brotli11",
          "original_bytes": 2097152,
          "compressed_bytes": 1197240,
          "fraction": 0.5708885192871094,
          "encode_seconds_diagnostic": 3.4871285420376807,
          "decode_seconds_diagnostic": 0.01778704090975225,
          "roundtrip_exact": true
        },
        {
          "method": "raw/bzip2",
          "original_bytes": 2097152,
          "compressed_bytes": 1155694,
          "fraction": 0.5510778427124023,
          "encode_seconds_diagnostic": 0.3221981660462916,
          "decode_seconds_diagnostic": 0.13110437500290573,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 1222182,
          "fraction": 0.5827817916870117,
          "encode_seconds_diagnostic": 0.004824500065296888,
          "decode_seconds_diagnostic": 0.00438112486153841,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd9",
          "original_bytes": 2097152,
          "compressed_bytes": 1204480,
          "fraction": 0.5743408203125,
          "encode_seconds_diagnostic": 0.025994458002969623,
          "decode_seconds_diagnostic": 0.005617124959826469,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 1179980,
          "fraction": 0.5626583099365234,
          "encode_seconds_diagnostic": 0.38548537506721914,
          "decode_seconds_diagnostic": 0.004789750091731548,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd22",
          "original_bytes": 2097152,
          "compressed_bytes": 1179980,
          "fraction": 0.5626583099365234,
          "encode_seconds_diagnostic": 0.3794644579757005,
          "decode_seconds_diagnostic": 0.004256916930899024,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/xz9e",
          "original_bytes": 2097152,
          "compressed_bytes": 1182068,
          "fraction": 0.5636539459228516,
          "encode_seconds_diagnostic": 1.4788096249103546,
          "decode_seconds_diagnostic": 0.1018009998369962,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/brotli11",
          "original_bytes": 2097152,
          "compressed_bytes": 1197123,
          "fraction": 0.5708327293395996,
          "encode_seconds_diagnostic": 1.9858220000751317,
          "decode_seconds_diagnostic": 0.014913167105987668,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/bzip2",
          "original_bytes": 2097152,
          "compressed_bytes": 1226989,
          "fraction": 0.5850739479064941,
          "encode_seconds_diagnostic": 0.33489691698923707,
          "decode_seconds_diagnostic": 0.1310353330336511,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 1243747,
          "fraction": 0.5930647850036621,
          "encode_seconds_diagnostic": 0.004511417122557759,
          "decode_seconds_diagnostic": 0.010150959016755223,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd9",
          "original_bytes": 2097152,
          "compressed_bytes": 1243018,
          "fraction": 0.592717170715332,
          "encode_seconds_diagnostic": 0.005447791889309883,
          "decode_seconds_diagnostic": 0.010275041917338967,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 1227533,
          "fraction": 0.5853333473205566,
          "encode_seconds_diagnostic": 0.07383975014090538,
          "decode_seconds_diagnostic": 0.010624125134199858,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd22",
          "original_bytes": 2097152,
          "compressed_bytes": 1227295,
          "fraction": 0.5852198600769043,
          "encode_seconds_diagnostic": 0.13016837509348989,
          "decode_seconds_diagnostic": 0.011077000061050057,
          "roundtrip_exact": true
        },
        {
          "method": "planes/xz9e",
          "original_bytes": 2097152,
          "compressed_bytes": 1217140,
          "fraction": 0.5803775787353516,
          "encode_seconds_diagnostic": 0.9814687499310821,
          "decode_seconds_diagnostic": 0.04787541599944234,
          "roundtrip_exact": true
        },
        {
          "method": "planes/brotli11",
          "original_bytes": 2097152,
          "compressed_bytes": 1218016,
          "fraction": 0.5807952880859375,
          "encode_seconds_diagnostic": 1.533903209026903,
          "decode_seconds_diagnostic": 0.0179555828217417,
          "roundtrip_exact": true
        },
        {
          "method": "planes/bzip2",
          "original_bytes": 2097152,
          "compressed_bytes": 1257217,
          "fraction": 0.5994877815246582,
          "encode_seconds_diagnostic": 0.4212532921228558,
          "decode_seconds_diagnostic": 0.12459629192017019,
          "roundtrip_exact": true
        },
        {
          "method": "xorshuffle/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 1268232,
          "fraction": 0.6047401428222656,
          "encode_seconds_diagnostic": 0.006112208124250174,
          "decode_seconds_diagnostic": 0.007174541940912604,
          "roundtrip_exact": true
        },
        {
          "method": "xorshuffle/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 1224885,
          "fraction": 0.5840706825256348,
          "encode_seconds_diagnostic": 0.38994799996726215,
          "decode_seconds_diagnostic": 0.006196541013196111,
          "roundtrip_exact": true
        },
        {
          "method": "deltashuffle/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 1315232,
          "fraction": 0.6271514892578125,
          "encode_seconds_diagnostic": 0.006403875071555376,
          "decode_seconds_diagnostic": 0.007506499998271465,
          "roundtrip_exact": true
        },
        {
          "method": "deltashuffle/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 1278812,
          "fraction": 0.6097850799560547,
          "encode_seconds_diagnostic": 0.3325233340729028,
          "decode_seconds_diagnostic": 0.007763792062178254,
          "roundtrip_exact": true
        },
        {
          "method": "xorplanes/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 1182620,
          "fraction": 0.5639171600341797,
          "encode_seconds_diagnostic": 0.0043598751071840525,
          "decode_seconds_diagnostic": 0.01190866599790752,
          "roundtrip_exact": true
        },
        {
          "method": "xorplanes/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 1162943,
          "fraction": 0.5545344352722168,
          "encode_seconds_diagnostic": 0.09015987510792911,
          "decode_seconds_diagnostic": 0.012374625075608492,
          "roundtrip_exact": true
        },
        {
          "method": "deltaplanes/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 1194747,
          "fraction": 0.569699764251709,
          "encode_seconds_diagnostic": 0.004698167089372873,
          "decode_seconds_diagnostic": 0.013143042102456093,
          "roundtrip_exact": true
        },
        {
          "method": "deltaplanes/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 1187877,
          "fraction": 0.5664238929748535,
          "encode_seconds_diagnostic": 0.07569416589103639,
          "decode_seconds_diagnostic": 0.012701292056590319,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 807533,
          "fraction": 0.38506174087524414,
          "encode_seconds_diagnostic": 0.005876875016838312,
          "decode_seconds_diagnostic": 0.0063930838368833065,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 2097152,
          "compressed_bytes": 787833,
          "fraction": 0.3756680488586426,
          "encode_seconds_diagnostic": 0.03337087482213974,
          "decode_seconds_diagnostic": 0.00615887506864965,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 749407,
          "fraction": 0.3573451042175293,
          "encode_seconds_diagnostic": 0.5257315828930587,
          "decode_seconds_diagnostic": 0.006530333077535033,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd22",
          "original_bytes": 2097152,
          "compressed_bytes": 749358,
          "fraction": 0.35732173919677734,
          "encode_seconds_diagnostic": 0.5293444169219583,
          "decode_seconds_diagnostic": 0.005841042147949338,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/xz9e",
          "original_bytes": 2097152,
          "compressed_bytes": 750364,
          "fraction": 0.3578014373779297,
          "encode_seconds_diagnostic": 2.6931007909588516,
          "decode_seconds_diagnostic": 0.07333541591651738,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/brotli11",
          "original_bytes": 2097152,
          "compressed_bytes": 744253,
          "fraction": 0.3548874855041504,
          "encode_seconds_diagnostic": 2.417094875127077,
          "decode_seconds_diagnostic": 0.011822333093732595,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/bzip2",
          "original_bytes": 2097152,
          "compressed_bytes": 775906,
          "fraction": 0.3699808120727539,
          "encode_seconds_diagnostic": 0.2900523750577122,
          "decode_seconds_diagnostic": 0.09643166605383158,
          "roundtrip_exact": true
        },
        {
          "method": "pred_planes/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 812202,
          "fraction": 0.38728809356689453,
          "encode_seconds_diagnostic": 0.005389333004131913,
          "decode_seconds_diagnostic": 0.012323792092502117,
          "roundtrip_exact": true
        },
        {
          "method": "pred_planes/zstd9",
          "original_bytes": 2097152,
          "compressed_bytes": 802098,
          "fraction": 0.38247013092041016,
          "encode_seconds_diagnostic": 0.01974162505939603,
          "decode_seconds_diagnostic": 0.012430667178705335,
          "roundtrip_exact": true
        },
        {
          "method": "pred_planes/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 765972,
          "fraction": 0.36524391174316406,
          "encode_seconds_diagnostic": 0.29556304193101823,
          "decode_seconds_diagnostic": 0.01157862483523786,
          "roundtrip_exact": true
        },
        {
          "method": "pred_planes/zstd22",
          "original_bytes": 2097152,
          "compressed_bytes": 765972,
          "fraction": 0.36524391174316406,
          "encode_seconds_diagnostic": 0.2801000839099288,
          "decode_seconds_diagnostic": 0.011645749909803271,
          "roundtrip_exact": true
        },
        {
          "method": "pred_planes/xz9e",
          "original_bytes": 2097152,
          "compressed_bytes": 757940,
          "fraction": 0.36141395568847656,
          "encode_seconds_diagnostic": 1.5330610841047019,
          "decode_seconds_diagnostic": 0.0512385000474751,
          "roundtrip_exact": true
        },
        {
          "method": "pred_planes/brotli11",
          "original_bytes": 2097152,
          "compressed_bytes": 758141,
          "fraction": 0.3615097999572754,
          "encode_seconds_diagnostic": 1.4531177908647805,
          "decode_seconds_diagnostic": 0.017253082944080234,
          "roundtrip_exact": true
        },
        {
          "method": "pred_planes/bzip2",
          "original_bytes": 2097152,
          "compressed_bytes": 798598,
          "fraction": 0.3808012008666992,
          "encode_seconds_diagnostic": 0.33397704106755555,
          "decode_seconds_diagnostic": 0.0941981659270823,
          "roundtrip_exact": true
        },
        {
          "method": "ans",
          "original_bytes": 2097152,
          "compressed_bytes": 1088925,
          "fraction": 0.5192399024963379,
          "encode_seconds_diagnostic": 0.007011875044554472,
          "decode_seconds_diagnostic": 0.051732791820541024,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 2097152,
          "compressed_bytes": 652849,
          "fraction": 0.31130266189575195,
          "encode_seconds_diagnostic": 0.014108833856880665,
          "decode_seconds_diagnostic": 0.06304079107940197,
          "roundtrip_exact": true
        }
      ],
      "predictor_exact_fraction": 0.9587860107421875,
      "residual_histogram": [
        [
          0,
          502680
        ],
        [
          2,
          11323
        ],
        [
          1,
          10285
        ]
      ]
    },
    {
      "group": "other",
      "kind": "weights",
      "tensor": {
        "file": "model-00011.safetensors",
        "name": "language_model.lm_head.weight",
        "dtype": "U32",
        "shape": [
          248320,
          320
        ],
        "offset": 910238560,
        "size": 317849600,
        "group": "other"
      },
      "offset": 117216256,
      "size": 1048576,
      "sha256": "936ebe395afb420f07ef153ce69d69fccd23cb6ed7a25d206df9e011e5b3fd37",
      "group_size": 64,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 970885,
          "fraction": 0.925908088684082,
          "encode_seconds_diagnostic": 0.0012112921103835106,
          "decode_seconds_diagnostic": 0.000814375001937151,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd9",
          "original_bytes": 1048576,
          "compressed_bytes": 970631,
          "fraction": 0.9256658554077148,
          "encode_seconds_diagnostic": 0.0015037499833852053,
          "decode_seconds_diagnostic": 0.0011270411778241396,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 971387,
          "fraction": 0.926386833190918,
          "encode_seconds_diagnostic": 0.03646083292551339,
          "decode_seconds_diagnostic": 0.0010570830199867487,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd22",
          "original_bytes": 1048576,
          "compressed_bytes": 971387,
          "fraction": 0.926386833190918,
          "encode_seconds_diagnostic": 0.029451374895870686,
          "decode_seconds_diagnostic": 0.0010494589805603027,
          "roundtrip_exact": true
        },
        {
          "method": "raw/xz9e",
          "original_bytes": 1048576,
          "compressed_bytes": 980740,
          "fraction": 0.9353065490722656,
          "encode_seconds_diagnostic": 0.29508320800960064,
          "decode_seconds_diagnostic": 0.07293700007721782,
          "roundtrip_exact": true
        },
        {
          "method": "raw/brotli11",
          "original_bytes": 1048576,
          "compressed_bytes": 970004,
          "fraction": 0.9250679016113281,
          "encode_seconds_diagnostic": 1.3420471660792828,
          "decode_seconds_diagnostic": 0.00864416710101068,
          "roundtrip_exact": true
        },
        {
          "method": "raw/bzip2",
          "original_bytes": 1048576,
          "compressed_bytes": 1018153,
          "fraction": 0.9709863662719727,
          "encode_seconds_diagnostic": 0.2101397078949958,
          "decode_seconds_diagnostic": 0.07945850002579391,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle4/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 970929,
          "fraction": 0.9259500503540039,
          "encode_seconds_diagnostic": 0.00144212506711483,
          "decode_seconds_diagnostic": 0.0014258339069783688,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle4/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 971270,
          "fraction": 0.9262752532958984,
          "encode_seconds_diagnostic": 0.03341458295471966,
          "decode_seconds_diagnostic": 0.0018471668008714914,
          "roundtrip_exact": true
        },
        {
          "method": "planes32/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 1048613,
          "fraction": 1.000035285949707,
          "encode_seconds_diagnostic": 0.0035476249177008867,
          "decode_seconds_diagnostic": 0.005386749980971217,
          "roundtrip_exact": true
        },
        {
          "method": "planes32/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 1048613,
          "fraction": 1.000035285949707,
          "encode_seconds_diagnostic": 0.03130924981087446,
          "decode_seconds_diagnostic": 0.0051360828801989555,
          "roundtrip_exact": true
        },
        {
          "method": "qbytes/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 1081125,
          "fraction": 1.031041145324707,
          "encode_seconds_diagnostic": 0.011082792188972235,
          "decode_seconds_diagnostic": 0.003508749883621931,
          "roundtrip_exact": true
        },
        {
          "method": "qbytes/zstd9",
          "original_bytes": 1048576,
          "compressed_bytes": 1071769,
          "fraction": 1.0221185684204102,
          "encode_seconds_diagnostic": 0.04095670813694596,
          "decode_seconds_diagnostic": 0.003565459046512842,
          "roundtrip_exact": true
        },
        {
          "method": "qbytes/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 976439,
          "fraction": 0.9312047958374023,
          "encode_seconds_diagnostic": 0.5370698750484735,
          "decode_seconds_diagnostic": 0.002226458163931966,
          "roundtrip_exact": true
        },
        {
          "method": "qbytes/zstd22",
          "original_bytes": 1048576,
          "compressed_bytes": 976439,
          "fraction": 0.9312047958374023,
          "encode_seconds_diagnostic": 0.630454083206132,
          "decode_seconds_diagnostic": 0.0025917079765349627,
          "roundtrip_exact": true
        },
        {
          "method": "qbytes/xz9e",
          "original_bytes": 1048576,
          "compressed_bytes": 1024584,
          "fraction": 0.9771194458007812,
          "encode_seconds_diagnostic": 1.3116981249768287,
          "decode_seconds_diagnostic": 0.12018312490545213,
          "roundtrip_exact": true
        },
        {
          "method": "qbytes/brotli11",
          "original_bytes": 1048576,
          "compressed_bytes": 974092,
          "fraction": 0.9289665222167969,
          "encode_seconds_diagnostic": 1.723863499937579,
          "decode_seconds_diagnostic": 0.015051375143229961,
          "roundtrip_exact": true
        },
        {
          "method": "qbytes/bzip2",
          "original_bytes": 1048576,
          "compressed_bytes": 1038923,
          "fraction": 0.9907941818237305,
          "encode_seconds_diagnostic": 0.2568753329105675,
          "decode_seconds_diagnostic": 0.11382283386774361,
          "roundtrip_exact": true
        },
        {
          "method": "qplanes/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 1039168,
          "fraction": 0.99102783203125,
          "encode_seconds_diagnostic": 0.002546583069488406,
          "decode_seconds_diagnostic": 0.005853084148839116,
          "roundtrip_exact": true
        },
        {
          "method": "qplanes/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 1039289,
          "fraction": 0.9911432266235352,
          "encode_seconds_diagnostic": 0.03785141697153449,
          "decode_seconds_diagnostic": 0.005873125046491623,
          "roundtrip_exact": true
        },
        {
          "method": "foldplanes/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 977130,
          "fraction": 0.9318637847900391,
          "encode_seconds_diagnostic": 0.00544962496496737,
          "decode_seconds_diagnostic": 0.007801875006407499,
          "roundtrip_exact": true
        },
        {
          "method": "foldplanes/zstd9",
          "original_bytes": 1048576,
          "compressed_bytes": 976259,
          "fraction": 0.9310331344604492,
          "encode_seconds_diagnostic": 0.005281792022287846,
          "decode_seconds_diagnostic": 0.00757283391430974,
          "roundtrip_exact": true
        },
        {
          "method": "foldplanes/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 976829,
          "fraction": 0.9315767288208008,
          "encode_seconds_diagnostic": 0.04111708304844797,
          "decode_seconds_diagnostic": 0.007680957904085517,
          "roundtrip_exact": true
        },
        {
          "method": "foldplanes/zstd22",
          "original_bytes": 1048576,
          "compressed_bytes": 976829,
          "fraction": 0.9315767288208008,
          "encode_seconds_diagnostic": 0.0358988749794662,
          "decode_seconds_diagnostic": 0.007622083881869912,
          "roundtrip_exact": true
        },
        {
          "method": "foldplanes/xz9e",
          "original_bytes": 1048576,
          "compressed_bytes": 984336,
          "fraction": 0.9387359619140625,
          "encode_seconds_diagnostic": 0.2932919589802623,
          "decode_seconds_diagnostic": 0.06153470790013671,
          "roundtrip_exact": true
        },
        {
          "method": "foldplanes/brotli11",
          "original_bytes": 1048576,
          "compressed_bytes": 974837,
          "fraction": 0.9296770095825195,
          "encode_seconds_diagnostic": 0.9396771248430014,
          "decode_seconds_diagnostic": 0.013800999848172069,
          "roundtrip_exact": true
        },
        {
          "method": "foldplanes/bzip2",
          "original_bytes": 1048576,
          "compressed_bytes": 1025726,
          "fraction": 0.9782085418701172,
          "encode_seconds_diagnostic": 0.24070770805701613,
          "decode_seconds_diagnostic": 0.08819341589696705,
          "roundtrip_exact": true
        },
        {
          "method": "centerfoldplanes/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 974241,
          "fraction": 0.9291086196899414,
          "encode_seconds_diagnostic": 0.005959332920610905,
          "decode_seconds_diagnostic": 0.008737500058487058,
          "roundtrip_exact": true
        },
        {
          "method": "centerfoldplanes/zstd9",
          "original_bytes": 1048576,
          "compressed_bytes": 974688,
          "fraction": 0.929534912109375,
          "encode_seconds_diagnostic": 0.008859541965648532,
          "decode_seconds_diagnostic": 0.008846124866977334,
          "roundtrip_exact": true
        },
        {
          "method": "centerfoldplanes/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 970062,
          "fraction": 0.9251232147216797,
          "encode_seconds_diagnostic": 0.04257220798172057,
          "decode_seconds_diagnostic": 0.008731417125090957,
          "roundtrip_exact": true
        },
        {
          "method": "centerfoldplanes/zstd22",
          "original_bytes": 1048576,
          "compressed_bytes": 970062,
          "fraction": 0.9251232147216797,
          "encode_seconds_diagnostic": 0.04069970897398889,
          "decode_seconds_diagnostic": 0.009327791864052415,
          "roundtrip_exact": true
        },
        {
          "method": "centerfoldplanes/xz9e",
          "original_bytes": 1048576,
          "compressed_bytes": 976768,
          "fraction": 0.9315185546875,
          "encode_seconds_diagnostic": 0.29510304098948836,
          "decode_seconds_diagnostic": 0.04503320902585983,
          "roundtrip_exact": true
        },
        {
          "method": "centerfoldplanes/brotli11",
          "original_bytes": 1048576,
          "compressed_bytes": 967983,
          "fraction": 0.9231405258178711,
          "encode_seconds_diagnostic": 0.6891164579428732,
          "decode_seconds_diagnostic": 0.014938625041395426,
          "roundtrip_exact": true
        },
        {
          "method": "centerfoldplanes/bzip2",
          "original_bytes": 1048576,
          "compressed_bytes": 1020578,
          "fraction": 0.9732990264892578,
          "encode_seconds_diagnostic": 0.22650891612283885,
          "decode_seconds_diagnostic": 0.09015787485986948,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 964925,
          "fraction": 0.9202241897583008,
          "encode_seconds_diagnostic": 0.003376249922439456,
          "decode_seconds_diagnostic": 0.0030552088283002377,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 965604,
          "fraction": 0.9208717346191406,
          "encode_seconds_diagnostic": 0.03634970891289413,
          "decode_seconds_diagnostic": 0.004129375098273158,
          "roundtrip_exact": true
        },
        {
          "method": "centerbytes/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 1077648,
          "fraction": 1.0277252197265625,
          "encode_seconds_diagnostic": 0.011258625192567706,
          "decode_seconds_diagnostic": 0.004895542049780488,
          "roundtrip_exact": true
        },
        {
          "method": "centerbytes/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 968748,
          "fraction": 0.9238700866699219,
          "encode_seconds_diagnostic": 0.4716529999859631,
          "decode_seconds_diagnostic": 0.0032224999740719795,
          "roundtrip_exact": true
        },
        {
          "method": "ans",
          "original_bytes": 1048576,
          "compressed_bytes": 966629,
          "fraction": 0.921849250793457,
          "encode_seconds_diagnostic": 0.01384237501770258,
          "decode_seconds_diagnostic": 0.035309082828462124,
          "roundtrip_exact": true
        },
        {
          "method": "context_ans",
          "original_bytes": 1048576,
          "compressed_bytes": 960427,
          "fraction": 0.9159345626831055,
          "encode_seconds_diagnostic": 0.014513542177155614,
          "decode_seconds_diagnostic": 0.03382487501949072,
          "roundtrip_exact": true
        },
        {
          "method": "blosc4_1_9_262144",
          "original_bytes": 1048576,
          "compressed_bytes": 971724,
          "fraction": 0.9267082214355469,
          "encode_seconds_diagnostic": 0.030467916978523135,
          "decode_seconds_diagnostic": 0.0007151251193135977,
          "roundtrip_exact": true
        },
        {
          "method": "blosc4_2_9_262144",
          "original_bytes": 1048576,
          "compressed_bytes": 1048608,
          "fraction": 1.000030517578125,
          "encode_seconds_diagnostic": 0.029264124808833003,
          "decode_seconds_diagnostic": 3.720889799296856e-05,
          "roundtrip_exact": true
        }
      ],
      "nibble_entropy_bits": 3.686948796281329,
      "conditional_center_entropy_bits": 3.660566315100906
    },
    {
      "group": "other",
      "kind": "scale_bias_pair",
      "tensor": {
        "file": "model-00011.safetensors",
        "name": "language_model.lm_head.scales",
        "dtype": "BF16",
        "shape": [
          248320,
          40
        ],
        "offset": 1722378080,
        "size": 19865600,
        "group": "other"
      },
      "bias_tensor": {
        "file": "model-00011.safetensors",
        "name": "language_model.lm_head.biases",
        "dtype": "BF16",
        "shape": [
          248320,
          40
        ],
        "offset": 472038240,
        "size": 19865600,
        "group": "other"
      },
      "offset": 6962176,
      "size_per_tensor": 1048576,
      "sha256": "421691af6deb58b887a99c2b2c50896726dbec336a326e75deb829cfa3f289ac",
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 1362168,
          "fraction": 0.6495323181152344,
          "encode_seconds_diagnostic": 0.009667625185102224,
          "decode_seconds_diagnostic": 0.0020466670393943787,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd9",
          "original_bytes": 2097152,
          "compressed_bytes": 1299096,
          "fraction": 0.6194572448730469,
          "encode_seconds_diagnostic": 0.025416375137865543,
          "decode_seconds_diagnostic": 0.002703416859731078,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 1323459,
          "fraction": 0.6310744285583496,
          "encode_seconds_diagnostic": 0.2271519999485463,
          "decode_seconds_diagnostic": 0.002350917086005211,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd22",
          "original_bytes": 2097152,
          "compressed_bytes": 1323459,
          "fraction": 0.6310744285583496,
          "encode_seconds_diagnostic": 0.22907970799133182,
          "decode_seconds_diagnostic": 0.003162125125527382,
          "roundtrip_exact": true
        },
        {
          "method": "raw/xz9e",
          "original_bytes": 2097152,
          "compressed_bytes": 1177408,
          "fraction": 0.561431884765625,
          "encode_seconds_diagnostic": 0.9002202090341598,
          "decode_seconds_diagnostic": 0.11557891708798707,
          "roundtrip_exact": true
        },
        {
          "method": "raw/brotli11",
          "original_bytes": 2097152,
          "compressed_bytes": 1191218,
          "fraction": 0.5680170059204102,
          "encode_seconds_diagnostic": 3.7314978330396116,
          "decode_seconds_diagnostic": 0.014500041957944632,
          "roundtrip_exact": true
        },
        {
          "method": "raw/bzip2",
          "original_bytes": 2097152,
          "compressed_bytes": 1151575,
          "fraction": 0.5491137504577637,
          "encode_seconds_diagnostic": 0.30693662515841424,
          "decode_seconds_diagnostic": 0.1074617919512093,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 1199159,
          "fraction": 0.5718035697937012,
          "encode_seconds_diagnostic": 0.004637625068426132,
          "decode_seconds_diagnostic": 0.004177709110081196,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd9",
          "original_bytes": 2097152,
          "compressed_bytes": 1183797,
          "fraction": 0.5644783973693848,
          "encode_seconds_diagnostic": 0.0240941250231117,
          "decode_seconds_diagnostic": 0.005220500053837895,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 1155098,
          "fraction": 0.5507936477661133,
          "encode_seconds_diagnostic": 0.3514396669343114,
          "decode_seconds_diagnostic": 0.004071125062182546,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd22",
          "original_bytes": 2097152,
          "compressed_bytes": 1155098,
          "fraction": 0.5507936477661133,
          "encode_seconds_diagnostic": 0.34695604094304144,
          "decode_seconds_diagnostic": 0.004261791007593274,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/xz9e",
          "original_bytes": 2097152,
          "compressed_bytes": 1147852,
          "fraction": 0.5473384857177734,
          "encode_seconds_diagnostic": 1.4676042501814663,
          "decode_seconds_diagnostic": 0.09316420811228454,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/brotli11",
          "original_bytes": 2097152,
          "compressed_bytes": 1161069,
          "fraction": 0.5536408424377441,
          "encode_seconds_diagnostic": 2.0695460829883814,
          "decode_seconds_diagnostic": 0.015187625074759126,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/bzip2",
          "original_bytes": 2097152,
          "compressed_bytes": 1204717,
          "fraction": 0.5744538307189941,
          "encode_seconds_diagnostic": 0.2908876249566674,
          "decode_seconds_diagnostic": 0.1185973749961704,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 1202221,
          "fraction": 0.5732636451721191,
          "encode_seconds_diagnostic": 0.004621000029146671,
          "decode_seconds_diagnostic": 0.009604041930288076,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd9",
          "original_bytes": 2097152,
          "compressed_bytes": 1201126,
          "fraction": 0.5727415084838867,
          "encode_seconds_diagnostic": 0.005886666942387819,
          "decode_seconds_diagnostic": 0.009988375008106232,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 1188600,
          "fraction": 0.5667686462402344,
          "encode_seconds_diagnostic": 0.07444841600954533,
          "decode_seconds_diagnostic": 0.009915041970089078,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd22",
          "original_bytes": 2097152,
          "compressed_bytes": 1188434,
          "fraction": 0.5666894912719727,
          "encode_seconds_diagnostic": 0.08298904192633927,
          "decode_seconds_diagnostic": 0.010123542044311762,
          "roundtrip_exact": true
        },
        {
          "method": "planes/xz9e",
          "original_bytes": 2097152,
          "compressed_bytes": 1177132,
          "fraction": 0.5613002777099609,
          "encode_seconds_diagnostic": 1.0284407080616802,
          "decode_seconds_diagnostic": 0.0415153328794986,
          "roundtrip_exact": true
        },
        {
          "method": "planes/brotli11",
          "original_bytes": 2097152,
          "compressed_bytes": 1175998,
          "fraction": 0.5607595443725586,
          "encode_seconds_diagnostic": 1.2770037078298628,
          "decode_seconds_diagnostic": 0.018534124828875065,
          "roundtrip_exact": true
        },
        {
          "method": "planes/bzip2",
          "original_bytes": 2097152,
          "compressed_bytes": 1233206,
          "fraction": 0.588038444519043,
          "encode_seconds_diagnostic": 0.38612841605208814,
          "decode_seconds_diagnostic": 0.11059445911087096,
          "roundtrip_exact": true
        },
        {
          "method": "xorshuffle/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 1246271,
          "fraction": 0.5942683219909668,
          "encode_seconds_diagnostic": 0.005814915988594294,
          "decode_seconds_diagnostic": 0.007555834017693996,
          "roundtrip_exact": true
        },
        {
          "method": "xorshuffle/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 1201467,
          "fraction": 0.572904109954834,
          "encode_seconds_diagnostic": 0.329619332915172,
          "decode_seconds_diagnostic": 0.007343958131968975,
          "roundtrip_exact": true
        },
        {
          "method": "deltashuffle/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 1295621,
          "fraction": 0.617800235748291,
          "encode_seconds_diagnostic": 0.005802875151857734,
          "decode_seconds_diagnostic": 0.0062053329311311245,
          "roundtrip_exact": true
        },
        {
          "method": "deltashuffle/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 1261010,
          "fraction": 0.6012964248657227,
          "encode_seconds_diagnostic": 0.2643494999501854,
          "decode_seconds_diagnostic": 0.007708416087552905,
          "roundtrip_exact": true
        },
        {
          "method": "xorplanes/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 1175964,
          "fraction": 0.5607433319091797,
          "encode_seconds_diagnostic": 0.003997458145022392,
          "decode_seconds_diagnostic": 0.011742833070456982,
          "roundtrip_exact": true
        },
        {
          "method": "xorplanes/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 1131026,
          "fraction": 0.5393152236938477,
          "encode_seconds_diagnostic": 0.06879283301532269,
          "decode_seconds_diagnostic": 0.011486916104331613,
          "roundtrip_exact": true
        },
        {
          "method": "deltaplanes/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 1183690,
          "fraction": 0.564427375793457,
          "encode_seconds_diagnostic": 0.004784666001796722,
          "decode_seconds_diagnostic": 0.012084958143532276,
          "roundtrip_exact": true
        },
        {
          "method": "deltaplanes/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 1167073,
          "fraction": 0.5565037727355957,
          "encode_seconds_diagnostic": 0.05899500008672476,
          "decode_seconds_diagnostic": 0.012092208955436945,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 729215,
          "fraction": 0.3477168083190918,
          "encode_seconds_diagnostic": 0.003880874952301383,
          "decode_seconds_diagnostic": 0.006058375118300319,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 2097152,
          "compressed_bytes": 706259,
          "fraction": 0.33677053451538086,
          "encode_seconds_diagnostic": 0.0280907501000911,
          "decode_seconds_diagnostic": 0.006537416949868202,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 664046,
          "fraction": 0.31664180755615234,
          "encode_seconds_diagnostic": 0.5182338329032063,
          "decode_seconds_diagnostic": 0.006384499836713076,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd22",
          "original_bytes": 2097152,
          "compressed_bytes": 664046,
          "fraction": 0.31664180755615234,
          "encode_seconds_diagnostic": 0.5234952080063522,
          "decode_seconds_diagnostic": 0.00601712497882545,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/xz9e",
          "original_bytes": 2097152,
          "compressed_bytes": 657552,
          "fraction": 0.31354522705078125,
          "encode_seconds_diagnostic": 2.8773436669725925,
          "decode_seconds_diagnostic": 0.0605319170281291,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/brotli11",
          "original_bytes": 2097152,
          "compressed_bytes": 677281,
          "fraction": 0.3229527473449707,
          "encode_seconds_diagnostic": 2.599249874940142,
          "decode_seconds_diagnostic": 0.0105899169575423,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/bzip2",
          "original_bytes": 2097152,
          "compressed_bytes": 697946,
          "fraction": 0.3328065872192383,
          "encode_seconds_diagnostic": 0.2260101658757776,
          "decode_seconds_diagnostic": 0.0787710000295192,
          "roundtrip_exact": true
        },
        {
          "method": "pred_planes/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 733706,
          "fraction": 0.34985828399658203,
          "encode_seconds_diagnostic": 0.004816832952201366,
          "decode_seconds_diagnostic": 0.010527583071961999,
          "roundtrip_exact": true
        },
        {
          "method": "pred_planes/zstd9",
          "original_bytes": 2097152,
          "compressed_bytes": 721061,
          "fraction": 0.3438286781311035,
          "encode_seconds_diagnostic": 0.016545208171010017,
          "decode_seconds_diagnostic": 0.011233834084123373,
          "roundtrip_exact": true
        },
        {
          "method": "pred_planes/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 695470,
          "fraction": 0.33162593841552734,
          "encode_seconds_diagnostic": 0.24694474996067584,
          "decode_seconds_diagnostic": 0.00997849996201694,
          "roundtrip_exact": true
        },
        {
          "method": "pred_planes/zstd22",
          "original_bytes": 2097152,
          "compressed_bytes": 695313,
          "fraction": 0.33155107498168945,
          "encode_seconds_diagnostic": 0.2595483751501888,
          "decode_seconds_diagnostic": 0.01000170805491507,
          "roundtrip_exact": true
        },
        {
          "method": "pred_planes/xz9e",
          "original_bytes": 2097152,
          "compressed_bytes": 693192,
          "fraction": 0.3305397033691406,
          "encode_seconds_diagnostic": 1.6150506669655442,
          "decode_seconds_diagnostic": 0.03977491590194404,
          "roundtrip_exact": true
        },
        {
          "method": "pred_planes/brotli11",
          "original_bytes": 2097152,
          "compressed_bytes": 690661,
          "fraction": 0.3293328285217285,
          "encode_seconds_diagnostic": 1.7642157499212772,
          "decode_seconds_diagnostic": 0.015142125077545643,
          "roundtrip_exact": true
        },
        {
          "method": "pred_planes/bzip2",
          "original_bytes": 2097152,
          "compressed_bytes": 721062,
          "fraction": 0.3438291549682617,
          "encode_seconds_diagnostic": 0.2507452080026269,
          "decode_seconds_diagnostic": 0.07665270892903209,
          "roundtrip_exact": true
        },
        {
          "method": "ans",
          "original_bytes": 2097152,
          "compressed_bytes": 1079152,
          "fraction": 0.5145797729492188,
          "encode_seconds_diagnostic": 0.007603292120620608,
          "decode_seconds_diagnostic": 0.04147941595874727,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 2097152,
          "compressed_bytes": 635389,
          "fraction": 0.3029770851135254,
          "encode_seconds_diagnostic": 0.01193399983458221,
          "decode_seconds_diagnostic": 0.05457658297382295,
          "roundtrip_exact": true
        }
      ],
      "predictor_exact_fraction": 0.9620857238769531,
      "residual_histogram": [
        [
          0,
          504410
        ],
        [
          2,
          10299
        ],
        [
          1,
          9579
        ]
      ]
    },
    {
      "group": "mtp",
      "kind": "weights",
      "tensor": {
        "file": "mtp.safetensors",
        "name": "mtp.layers.0.mlp.switch_mlp.down_proj.weight",
        "dtype": "U32",
        "shape": [
          512,
          2560,
          80
        ],
        "offset": 612269731,
        "size": 419430400,
        "group": "mtp"
      },
      "offset": 154801152,
      "size": 1048576,
      "sha256": "9ce25835ffd8764108e93e329ec8bd5b895f82892d4e548a4b214a110ef95835",
      "group_size": 64,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 977344,
          "fraction": 0.93206787109375,
          "encode_seconds_diagnostic": 0.0011001250240951777,
          "decode_seconds_diagnostic": 0.000958999851718545,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd9",
          "original_bytes": 1048576,
          "compressed_bytes": 976969,
          "fraction": 0.9317102432250977,
          "encode_seconds_diagnostic": 0.001268833177164197,
          "decode_seconds_diagnostic": 0.0009281248785555363,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 977580,
          "fraction": 0.9322929382324219,
          "encode_seconds_diagnostic": 0.024630500003695488,
          "decode_seconds_diagnostic": 0.0007589999586343765,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd22",
          "original_bytes": 1048576,
          "compressed_bytes": 977580,
          "fraction": 0.9322929382324219,
          "encode_seconds_diagnostic": 0.02671195799484849,
          "decode_seconds_diagnostic": 0.0008779580239206553,
          "roundtrip_exact": true
        },
        {
          "method": "raw/xz9e",
          "original_bytes": 1048576,
          "compressed_bytes": 986912,
          "fraction": 0.941192626953125,
          "encode_seconds_diagnostic": 0.2538863748777658,
          "decode_seconds_diagnostic": 0.06393074989318848,
          "roundtrip_exact": true
        },
        {
          "method": "raw/brotli11",
          "original_bytes": 1048576,
          "compressed_bytes": 976290,
          "fraction": 0.9310626983642578,
          "encode_seconds_diagnostic": 1.203030499862507,
          "decode_seconds_diagnostic": 0.008155792020261288,
          "roundtrip_exact": true
        },
        {
          "method": "raw/bzip2",
          "original_bytes": 1048576,
          "compressed_bytes": 1022186,
          "fraction": 0.9748325347900391,
          "encode_seconds_diagnostic": 0.18845154088921845,
          "decode_seconds_diagnostic": 0.07517458288930357,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle4/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 977250,
          "fraction": 0.9319782257080078,
          "encode_seconds_diagnostic": 0.0014830839354544878,
          "decode_seconds_diagnostic": 0.0013264580629765987,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle4/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 977603,
          "fraction": 0.9323148727416992,
          "encode_seconds_diagnostic": 0.032311041839420795,
          "decode_seconds_diagnostic": 0.0017038329970091581,
          "roundtrip_exact": true
        },
        {
          "method": "planes32/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 1048613,
          "fraction": 1.000035285949707,
          "encode_seconds_diagnostic": 0.003195167053490877,
          "decode_seconds_diagnostic": 0.004975541029125452,
          "roundtrip_exact": true
        },
        {
          "method": "planes32/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 1048613,
          "fraction": 1.000035285949707,
          "encode_seconds_diagnostic": 0.026777666993439198,
          "decode_seconds_diagnostic": 0.00466187484562397,
          "roundtrip_exact": true
        },
        {
          "method": "qbytes/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 1082910,
          "fraction": 1.0327434539794922,
          "encode_seconds_diagnostic": 0.009514583041891456,
          "decode_seconds_diagnostic": 0.0031962499488145113,
          "roundtrip_exact": true
        },
        {
          "method": "qbytes/zstd9",
          "original_bytes": 1048576,
          "compressed_bytes": 1076182,
          "fraction": 1.026327133178711,
          "encode_seconds_diagnostic": 0.04052770812995732,
          "decode_seconds_diagnostic": 0.0035712078679353,
          "roundtrip_exact": true
        },
        {
          "method": "qbytes/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 983276,
          "fraction": 0.9377250671386719,
          "encode_seconds_diagnostic": 0.43403108417987823,
          "decode_seconds_diagnostic": 0.0020562498830258846,
          "roundtrip_exact": true
        },
        {
          "method": "qbytes/zstd22",
          "original_bytes": 1048576,
          "compressed_bytes": 983276,
          "fraction": 0.9377250671386719,
          "encode_seconds_diagnostic": 0.38351075001992285,
          "decode_seconds_diagnostic": 0.0020465839188545942,
          "roundtrip_exact": true
        },
        {
          "method": "qbytes/xz9e",
          "original_bytes": 1048576,
          "compressed_bytes": 1032212,
          "fraction": 0.9843940734863281,
          "encode_seconds_diagnostic": 0.9655659589916468,
          "decode_seconds_diagnostic": 0.09649750008247793,
          "roundtrip_exact": true
        },
        {
          "method": "qbytes/brotli11",
          "original_bytes": 1048576,
          "compressed_bytes": 981020,
          "fraction": 0.9355735778808594,
          "encode_seconds_diagnostic": 1.408469415968284,
          "decode_seconds_diagnostic": 0.01193162496201694,
          "roundtrip_exact": true
        },
        {
          "method": "qbytes/bzip2",
          "original_bytes": 1048576,
          "compressed_bytes": 1042362,
          "fraction": 0.9940738677978516,
          "encode_seconds_diagnostic": 0.2335117079783231,
          "decode_seconds_diagnostic": 0.10212954203598201,
          "roundtrip_exact": true
        },
        {
          "method": "qplanes/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 1041037,
          "fraction": 0.9928102493286133,
          "encode_seconds_diagnostic": 0.0021529998630285263,
          "decode_seconds_diagnostic": 0.005095000145956874,
          "roundtrip_exact": true
        },
        {
          "method": "qplanes/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 1041133,
          "fraction": 0.9929018020629883,
          "encode_seconds_diagnostic": 0.025315083097666502,
          "decode_seconds_diagnostic": 0.0054406661074608564,
          "roundtrip_exact": true
        },
        {
          "method": "foldplanes/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 983028,
          "fraction": 0.9374885559082031,
          "encode_seconds_diagnostic": 0.005254999967291951,
          "decode_seconds_diagnostic": 0.006993582937866449,
          "roundtrip_exact": true
        },
        {
          "method": "foldplanes/zstd9",
          "original_bytes": 1048576,
          "compressed_bytes": 982124,
          "fraction": 0.9366264343261719,
          "encode_seconds_diagnostic": 0.005054292036220431,
          "decode_seconds_diagnostic": 0.00679749995470047,
          "roundtrip_exact": true
        },
        {
          "method": "foldplanes/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 982505,
          "fraction": 0.9369897842407227,
          "encode_seconds_diagnostic": 0.03225779184140265,
          "decode_seconds_diagnostic": 0.006585374940186739,
          "roundtrip_exact": true
        },
        {
          "method": "foldplanes/zstd22",
          "original_bytes": 1048576,
          "compressed_bytes": 982505,
          "fraction": 0.9369897842407227,
          "encode_seconds_diagnostic": 0.03319812496192753,
          "decode_seconds_diagnostic": 0.007069415878504515,
          "roundtrip_exact": true
        },
        {
          "method": "foldplanes/xz9e",
          "original_bytes": 1048576,
          "compressed_bytes": 990236,
          "fraction": 0.9443626403808594,
          "encode_seconds_diagnostic": 0.2589099579490721,
          "decode_seconds_diagnostic": 0.05495904106646776,
          "roundtrip_exact": true
        },
        {
          "method": "foldplanes/brotli11",
          "original_bytes": 1048576,
          "compressed_bytes": 980744,
          "fraction": 0.9353103637695312,
          "encode_seconds_diagnostic": 0.780871749855578,
          "decode_seconds_diagnostic": 0.013191541889682412,
          "roundtrip_exact": true
        },
        {
          "method": "foldplanes/bzip2",
          "original_bytes": 1048576,
          "compressed_bytes": 1029504,
          "fraction": 0.9818115234375,
          "encode_seconds_diagnostic": 0.2086770001333207,
          "decode_seconds_diagnostic": 0.07827816694043577,
          "roundtrip_exact": true
        },
        {
          "method": "centerfoldplanes/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 978890,
          "fraction": 0.9335422515869141,
          "encode_seconds_diagnostic": 0.005556000163778663,
          "decode_seconds_diagnostic": 0.007937333080917597,
          "roundtrip_exact": true
        },
        {
          "method": "centerfoldplanes/zstd9",
          "original_bytes": 1048576,
          "compressed_bytes": 979231,
          "fraction": 0.9338674545288086,
          "encode_seconds_diagnostic": 0.006128875073045492,
          "decode_seconds_diagnostic": 0.007516375044360757,
          "roundtrip_exact": true
        },
        {
          "method": "centerfoldplanes/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 977102,
          "fraction": 0.9318370819091797,
          "encode_seconds_diagnostic": 0.03312833304516971,
          "decode_seconds_diagnostic": 0.007680624956265092,
          "roundtrip_exact": true
        },
        {
          "method": "centerfoldplanes/zstd22",
          "original_bytes": 1048576,
          "compressed_bytes": 977102,
          "fraction": 0.9318370819091797,
          "encode_seconds_diagnostic": 0.03265587496571243,
          "decode_seconds_diagnostic": 0.007904625032097101,
          "roundtrip_exact": true
        },
        {
          "method": "centerfoldplanes/xz9e",
          "original_bytes": 1048576,
          "compressed_bytes": 983456,
          "fraction": 0.937896728515625,
          "encode_seconds_diagnostic": 0.25951166707091033,
          "decode_seconds_diagnostic": 0.04061454115435481,
          "roundtrip_exact": true
        },
        {
          "method": "centerfoldplanes/brotli11",
          "original_bytes": 1048576,
          "compressed_bytes": 975116,
          "fraction": 0.9299430847167969,
          "encode_seconds_diagnostic": 0.667175083886832,
          "decode_seconds_diagnostic": 0.013407084159553051,
          "roundtrip_exact": true
        },
        {
          "method": "centerfoldplanes/bzip2",
          "original_bytes": 1048576,
          "compressed_bytes": 1025011,
          "fraction": 0.9775266647338867,
          "encode_seconds_diagnostic": 0.21102195815183222,
          "decode_seconds_diagnostic": 0.08011450013145804,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 972133,
          "fraction": 0.927098274230957,
          "encode_seconds_diagnostic": 0.0034141670912504196,
          "decode_seconds_diagnostic": 0.0030695830937474966,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 972508,
          "fraction": 0.9274559020996094,
          "encode_seconds_diagnostic": 0.029832375003024936,
          "decode_seconds_diagnostic": 0.003131916979327798,
          "roundtrip_exact": true
        },
        {
          "method": "centerbytes/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 1080255,
          "fraction": 1.0302114486694336,
          "encode_seconds_diagnostic": 0.010830082930624485,
          "decode_seconds_diagnostic": 0.004375874996185303,
          "roundtrip_exact": true
        },
        {
          "method": "centerbytes/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 976603,
          "fraction": 0.931361198425293,
          "encode_seconds_diagnostic": 0.3711634590290487,
          "decode_seconds_diagnostic": 0.0031913749407976866,
          "roundtrip_exact": true
        },
        {
          "method": "ans",
          "original_bytes": 1048576,
          "compressed_bytes": 972721,
          "fraction": 0.9276590347290039,
          "encode_seconds_diagnostic": 0.01439387514255941,
          "decode_seconds_diagnostic": 0.03330358304083347,
          "roundtrip_exact": true
        },
        {
          "method": "context_ans",
          "original_bytes": 1048576,
          "compressed_bytes": 967468,
          "fraction": 0.9226493835449219,
          "encode_seconds_diagnostic": 0.014550374820828438,
          "decode_seconds_diagnostic": 0.03529274999164045,
          "roundtrip_exact": true
        },
        {
          "method": "blosc4_1_9_262144",
          "original_bytes": 1048576,
          "compressed_bytes": 977974,
          "fraction": 0.9326686859130859,
          "encode_seconds_diagnostic": 0.027135625015944242,
          "decode_seconds_diagnostic": 0.0008733749855309725,
          "roundtrip_exact": true
        },
        {
          "method": "blosc4_2_9_262144",
          "original_bytes": 1048576,
          "compressed_bytes": 1048608,
          "fraction": 1.000030517578125,
          "encode_seconds_diagnostic": 0.025797333102673292,
          "decode_seconds_diagnostic": 2.6582973077893257e-05,
          "roundtrip_exact": true
        }
      ],
      "nibble_entropy_bits": 3.710185577354302,
      "conditional_center_entropy_bits": 3.6869625976870184
    },
    {
      "group": "mtp",
      "kind": "scale_bias_pair",
      "tensor": {
        "file": "mtp.safetensors",
        "name": "mtp.layers.0.mlp.switch_mlp.down_proj.scales",
        "dtype": "BF16",
        "shape": [
          512,
          2560,
          10
        ],
        "offset": 586055331,
        "size": 26214400,
        "group": "mtp"
      },
      "bias_tensor": {
        "file": "mtp.safetensors",
        "name": "mtp.layers.0.mlp.switch_mlp.down_proj.biases",
        "dtype": "BF16",
        "shape": [
          512,
          2560,
          10
        ],
        "offset": 559738275,
        "size": 26214400,
        "group": "mtp"
      },
      "offset": 9311232,
      "size_per_tensor": 1048576,
      "sha256": "236ecd2459a717dc3d7897dbe3c5c47e181e7fd8ced34562ebd28377108667ae",
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 1338352,
          "fraction": 0.6381759643554688,
          "encode_seconds_diagnostic": 0.008812374901026487,
          "decode_seconds_diagnostic": 0.0024170000106096268,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd9",
          "original_bytes": 2097152,
          "compressed_bytes": 1277534,
          "fraction": 0.6091756820678711,
          "encode_seconds_diagnostic": 0.02357608312740922,
          "decode_seconds_diagnostic": 0.0026727919466793537,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 1315837,
          "fraction": 0.6274399757385254,
          "encode_seconds_diagnostic": 0.19775366690009832,
          "decode_seconds_diagnostic": 0.0029881661757826805,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd22",
          "original_bytes": 2097152,
          "compressed_bytes": 1315837,
          "fraction": 0.6274399757385254,
          "encode_seconds_diagnostic": 0.22496941615827382,
          "decode_seconds_diagnostic": 0.0030308749992400408,
          "roundtrip_exact": true
        },
        {
          "method": "raw/xz9e",
          "original_bytes": 2097152,
          "compressed_bytes": 1172940,
          "fraction": 0.5593013763427734,
          "encode_seconds_diagnostic": 0.9755524999927729,
          "decode_seconds_diagnostic": 0.11810308415442705,
          "roundtrip_exact": true
        },
        {
          "method": "raw/brotli11",
          "original_bytes": 2097152,
          "compressed_bytes": 1201753,
          "fraction": 0.5730404853820801,
          "encode_seconds_diagnostic": 2.7823210421483964,
          "decode_seconds_diagnostic": 0.014150124974548817,
          "roundtrip_exact": true
        },
        {
          "method": "raw/bzip2",
          "original_bytes": 2097152,
          "compressed_bytes": 1147447,
          "fraction": 0.5471453666687012,
          "encode_seconds_diagnostic": 0.27393804187886417,
          "decode_seconds_diagnostic": 0.10107654193416238,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 1178567,
          "fraction": 0.5619845390319824,
          "encode_seconds_diagnostic": 0.0037394168321043253,
          "decode_seconds_diagnostic": 0.004354375181719661,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd9",
          "original_bytes": 2097152,
          "compressed_bytes": 1160499,
          "fraction": 0.5533690452575684,
          "encode_seconds_diagnostic": 0.021862833993509412,
          "decode_seconds_diagnostic": 0.003820959012955427,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 1130537,
          "fraction": 0.5390820503234863,
          "encode_seconds_diagnostic": 0.306791374925524,
          "decode_seconds_diagnostic": 0.003545332932844758,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd22",
          "original_bytes": 2097152,
          "compressed_bytes": 1130537,
          "fraction": 0.5390820503234863,
          "encode_seconds_diagnostic": 0.310274374904111,
          "decode_seconds_diagnostic": 0.0035078751388937235,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/xz9e",
          "original_bytes": 2097152,
          "compressed_bytes": 1127736,
          "fraction": 0.5377464294433594,
          "encode_seconds_diagnostic": 1.3896195830311626,
          "decode_seconds_diagnostic": 0.08431137492880225,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/brotli11",
          "original_bytes": 2097152,
          "compressed_bytes": 1145771,
          "fraction": 0.5463461875915527,
          "encode_seconds_diagnostic": 2.47768387501128,
          "decode_seconds_diagnostic": 0.01431170804426074,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/bzip2",
          "original_bytes": 2097152,
          "compressed_bytes": 1181213,
          "fraction": 0.5632462501525879,
          "encode_seconds_diagnostic": 0.2752357078716159,
          "decode_seconds_diagnostic": 0.11078466614708304,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 1169860,
          "fraction": 0.5578327178955078,
          "encode_seconds_diagnostic": 0.004443374928086996,
          "decode_seconds_diagnostic": 0.009047582978382707,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd9",
          "original_bytes": 2097152,
          "compressed_bytes": 1166342,
          "fraction": 0.5561552047729492,
          "encode_seconds_diagnostic": 0.00771741708740592,
          "decode_seconds_diagnostic": 0.00894370791502297,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 1158531,
          "fraction": 0.5524306297302246,
          "encode_seconds_diagnostic": 0.08567974995821714,
          "decode_seconds_diagnostic": 0.008534624939784408,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd22",
          "original_bytes": 2097152,
          "compressed_bytes": 1158450,
          "fraction": 0.5523920059204102,
          "encode_seconds_diagnostic": 0.0960727499332279,
          "decode_seconds_diagnostic": 0.009323874954134226,
          "roundtrip_exact": true
        },
        {
          "method": "planes/xz9e",
          "original_bytes": 2097152,
          "compressed_bytes": 1148392,
          "fraction": 0.5475959777832031,
          "encode_seconds_diagnostic": 0.8958619998302311,
          "decode_seconds_diagnostic": 0.030694665852934122,
          "roundtrip_exact": true
        },
        {
          "method": "planes/brotli11",
          "original_bytes": 2097152,
          "compressed_bytes": 1145974,
          "fraction": 0.546442985534668,
          "encode_seconds_diagnostic": 1.1448387920390815,
          "decode_seconds_diagnostic": 0.014689750038087368,
          "roundtrip_exact": true
        },
        {
          "method": "planes/bzip2",
          "original_bytes": 2097152,
          "compressed_bytes": 1206941,
          "fraction": 0.5755143165588379,
          "encode_seconds_diagnostic": 0.35008779214695096,
          "decode_seconds_diagnostic": 0.10183775005862117,
          "roundtrip_exact": true
        },
        {
          "method": "xorshuffle/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 1231469,
          "fraction": 0.5872101783752441,
          "encode_seconds_diagnostic": 0.00469183293171227,
          "decode_seconds_diagnostic": 0.007142875110730529,
          "roundtrip_exact": true
        },
        {
          "method": "xorshuffle/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 1182556,
          "fraction": 0.5638866424560547,
          "encode_seconds_diagnostic": 0.306040707975626,
          "decode_seconds_diagnostic": 0.005689916200935841,
          "roundtrip_exact": true
        },
        {
          "method": "deltashuffle/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 1305330,
          "fraction": 0.6224298477172852,
          "encode_seconds_diagnostic": 0.005746334092691541,
          "decode_seconds_diagnostic": 0.007143124938011169,
          "roundtrip_exact": true
        },
        {
          "method": "deltashuffle/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 1269290,
          "fraction": 0.6052446365356445,
          "encode_seconds_diagnostic": 0.23346916679292917,
          "decode_seconds_diagnostic": 0.0073321249801665545,
          "roundtrip_exact": true
        },
        {
          "method": "xorplanes/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 1143688,
          "fraction": 0.5453529357910156,
          "encode_seconds_diagnostic": 0.004627499962225556,
          "decode_seconds_diagnostic": 0.011550833936780691,
          "roundtrip_exact": true
        },
        {
          "method": "xorplanes/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 1133988,
          "fraction": 0.5407276153564453,
          "encode_seconds_diagnostic": 0.07601941702887416,
          "decode_seconds_diagnostic": 0.011314291972666979,
          "roundtrip_exact": true
        },
        {
          "method": "deltaplanes/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 1187015,
          "fraction": 0.5660128593444824,
          "encode_seconds_diagnostic": 0.004104667110368609,
          "decode_seconds_diagnostic": 0.010524207958951592,
          "roundtrip_exact": true
        },
        {
          "method": "deltaplanes/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 1177187,
          "fraction": 0.5613265037536621,
          "encode_seconds_diagnostic": 0.04661858407780528,
          "decode_seconds_diagnostic": 0.011374291963875294,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 750088,
          "fraction": 0.3576698303222656,
          "encode_seconds_diagnostic": 0.004264916991814971,
          "decode_seconds_diagnostic": 0.00669724983163178,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 2097152,
          "compressed_bytes": 728829,
          "fraction": 0.3475327491760254,
          "encode_seconds_diagnostic": 0.0259398331400007,
          "decode_seconds_diagnostic": 0.00539654097519815,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 689178,
          "fraction": 0.3286256790161133,
          "encode_seconds_diagnostic": 0.4499488330911845,
          "decode_seconds_diagnostic": 0.005774207878857851,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd22",
          "original_bytes": 2097152,
          "compressed_bytes": 689217,
          "fraction": 0.3286442756652832,
          "encode_seconds_diagnostic": 0.45322774979285896,
          "decode_seconds_diagnostic": 0.005484375171363354,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/xz9e",
          "original_bytes": 2097152,
          "compressed_bytes": 682788,
          "fraction": 0.3255786895751953,
          "encode_seconds_diagnostic": 2.8158086659386754,
          "decode_seconds_diagnostic": 0.06762129184789956,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/brotli11",
          "original_bytes": 2097152,
          "compressed_bytes": 686038,
          "fraction": 0.32712841033935547,
          "encode_seconds_diagnostic": 2.77802054095082,
          "decode_seconds_diagnostic": 0.011441666865721345,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/bzip2",
          "original_bytes": 2097152,
          "compressed_bytes": 717662,
          "fraction": 0.3422079086303711,
          "encode_seconds_diagnostic": 0.2580095829907805,
          "decode_seconds_diagnostic": 0.09092529211193323,
          "roundtrip_exact": true
        },
        {
          "method": "pred_planes/zstd3",
          "original_bytes": 2097152,
          "compressed_bytes": 737627,
          "fraction": 0.3517279624938965,
          "encode_seconds_diagnostic": 0.006019291002303362,
          "decode_seconds_diagnostic": 0.012313958024606109,
          "roundtrip_exact": true
        },
        {
          "method": "pred_planes/zstd9",
          "original_bytes": 2097152,
          "compressed_bytes": 723119,
          "fraction": 0.34481000900268555,
          "encode_seconds_diagnostic": 0.01926908316090703,
          "decode_seconds_diagnostic": 0.0109852091409266,
          "roundtrip_exact": true
        },
        {
          "method": "pred_planes/zstd19",
          "original_bytes": 2097152,
          "compressed_bytes": 698649,
          "fraction": 0.3331418037414551,
          "encode_seconds_diagnostic": 0.2953836659435183,
          "decode_seconds_diagnostic": 0.011964290868490934,
          "roundtrip_exact": true
        },
        {
          "method": "pred_planes/zstd22",
          "original_bytes": 2097152,
          "compressed_bytes": 698649,
          "fraction": 0.3331418037414551,
          "encode_seconds_diagnostic": 0.3023663330823183,
          "decode_seconds_diagnostic": 0.011846584035083652,
          "roundtrip_exact": true
        },
        {
          "method": "pred_planes/xz9e",
          "original_bytes": 2097152,
          "compressed_bytes": 691140,
          "fraction": 0.3295612335205078,
          "encode_seconds_diagnostic": 1.5178629169240594,
          "decode_seconds_diagnostic": 0.0390795839484781,
          "roundtrip_exact": true
        },
        {
          "method": "pred_planes/brotli11",
          "original_bytes": 2097152,
          "compressed_bytes": 691747,
          "fraction": 0.3298506736755371,
          "encode_seconds_diagnostic": 1.346151958219707,
          "decode_seconds_diagnostic": 0.01524375006556511,
          "roundtrip_exact": true
        },
        {
          "method": "pred_planes/bzip2",
          "original_bytes": 2097152,
          "compressed_bytes": 740951,
          "fraction": 0.35331296920776367,
          "encode_seconds_diagnostic": 0.26980787492357194,
          "decode_seconds_diagnostic": 0.07801658287644386,
          "roundtrip_exact": true
        },
        {
          "method": "ans",
          "original_bytes": 2097152,
          "compressed_bytes": 1078734,
          "fraction": 0.5143804550170898,
          "encode_seconds_diagnostic": 0.007683000061661005,
          "decode_seconds_diagnostic": 0.043018291937187314,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 2097152,
          "compressed_bytes": 630862,
          "fraction": 0.30081844329833984,
          "encode_seconds_diagnostic": 0.011969082988798618,
          "decode_seconds_diagnostic": 0.05522591597400606,
          "roundtrip_exact": true
        }
      ],
      "predictor_exact_fraction": 0.9654388427734375,
      "residual_histogram": [
        [
          0,
          506168
        ],
        [
          2,
          9232
        ],
        [
          1,
          8888
        ]
      ]
    },
    {
      "group": "other",
      "kind": "bf16_unpaired",
      "tensor": {
        "file": "model-00001.safetensors",
        "name": "vision_tower.merger.linear_fc1.weight",
        "dtype": "BF16",
        "shape": [
          4608,
          4608
        ],
        "offset": 6797049233,
        "size": 42467328,
        "group": "other"
      },
      "offset": 15324928,
      "size": 1048576,
      "sha256": "9e5a53da0235cd4f590dc52176465487153eba8856a02566c80cad3599d21701",
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 815902,
          "fraction": 0.7781047821044922,
          "encode_seconds_diagnostic": 0.0010019999463111162,
          "decode_seconds_diagnostic": 0.000969999935477972,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd9",
          "original_bytes": 1048576,
          "compressed_bytes": 815864,
          "fraction": 0.7780685424804688,
          "encode_seconds_diagnostic": 0.0015104589983820915,
          "decode_seconds_diagnostic": 0.0009623339865356684,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 816802,
          "fraction": 0.7789630889892578,
          "encode_seconds_diagnostic": 0.051727292127907276,
          "decode_seconds_diagnostic": 0.001162166940048337,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd22",
          "original_bytes": 1048576,
          "compressed_bytes": 816802,
          "fraction": 0.7789630889892578,
          "encode_seconds_diagnostic": 0.05007137497887015,
          "decode_seconds_diagnostic": 0.0010779998265206814,
          "roundtrip_exact": true
        },
        {
          "method": "raw/xz9e",
          "original_bytes": 1048576,
          "compressed_bytes": 755840,
          "fraction": 0.7208251953125,
          "encode_seconds_diagnostic": 0.3106339159421623,
          "decode_seconds_diagnostic": 0.05917508387938142,
          "roundtrip_exact": true
        },
        {
          "method": "raw/brotli11",
          "original_bytes": 1048576,
          "compressed_bytes": 750159,
          "fraction": 0.7154073715209961,
          "encode_seconds_diagnostic": 1.3776300000026822,
          "decode_seconds_diagnostic": 0.009169749915599823,
          "roundtrip_exact": true
        },
        {
          "method": "raw/bzip2",
          "original_bytes": 1048576,
          "compressed_bytes": 725364,
          "fraction": 0.6917610168457031,
          "encode_seconds_diagnostic": 0.1839410001412034,
          "decode_seconds_diagnostic": 0.06430095783434808,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 739792,
          "fraction": 0.7055206298828125,
          "encode_seconds_diagnostic": 0.003436584025621414,
          "decode_seconds_diagnostic": 0.0021565419156104326,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd9",
          "original_bytes": 1048576,
          "compressed_bytes": 727466,
          "fraction": 0.6937656402587891,
          "encode_seconds_diagnostic": 0.01204804191365838,
          "decode_seconds_diagnostic": 0.0021127499639987946,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 722507,
          "fraction": 0.6890363693237305,
          "encode_seconds_diagnostic": 0.1323753329925239,
          "decode_seconds_diagnostic": 0.0023073749616742134,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd22",
          "original_bytes": 1048576,
          "compressed_bytes": 722507,
          "fraction": 0.6890363693237305,
          "encode_seconds_diagnostic": 0.128915874985978,
          "decode_seconds_diagnostic": 0.002126166829839349,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/xz9e",
          "original_bytes": 1048576,
          "compressed_bytes": 712632,
          "fraction": 0.6796188354492188,
          "encode_seconds_diagnostic": 0.48894583294168115,
          "decode_seconds_diagnostic": 0.02789929206483066,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/brotli11",
          "original_bytes": 1048576,
          "compressed_bytes": 699676,
          "fraction": 0.6672630310058594,
          "encode_seconds_diagnostic": 0.918643708107993,
          "decode_seconds_diagnostic": 0.005999667104333639,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/bzip2",
          "original_bytes": 1048576,
          "compressed_bytes": 727900,
          "fraction": 0.6941795349121094,
          "encode_seconds_diagnostic": 0.20122345793060958,
          "decode_seconds_diagnostic": 0.06933145807124674,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 789762,
          "fraction": 0.7531757354736328,
          "encode_seconds_diagnostic": 0.002129875123500824,
          "decode_seconds_diagnostic": 0.004700416931882501,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd9",
          "original_bytes": 1048576,
          "compressed_bytes": 789400,
          "fraction": 0.7528305053710938,
          "encode_seconds_diagnostic": 0.002427958883345127,
          "decode_seconds_diagnostic": 0.0040117918979376554,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 784739,
          "fraction": 0.7483854293823242,
          "encode_seconds_diagnostic": 0.043011958012357354,
          "decode_seconds_diagnostic": 0.004851208999752998,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd22",
          "original_bytes": 1048576,
          "compressed_bytes": 784720,
          "fraction": 0.7483673095703125,
          "encode_seconds_diagnostic": 0.04035662510432303,
          "decode_seconds_diagnostic": 0.005346708931028843,
          "roundtrip_exact": true
        },
        {
          "method": "planes/xz9e",
          "original_bytes": 1048576,
          "compressed_bytes": 776444,
          "fraction": 0.7404747009277344,
          "encode_seconds_diagnostic": 0.471007333137095,
          "decode_seconds_diagnostic": 0.02163820806890726,
          "roundtrip_exact": true
        },
        {
          "method": "planes/brotli11",
          "original_bytes": 1048576,
          "compressed_bytes": 780137,
          "fraction": 0.7439966201782227,
          "encode_seconds_diagnostic": 1.1761071251239628,
          "decode_seconds_diagnostic": 0.010615290841087699,
          "roundtrip_exact": true
        },
        {
          "method": "planes/bzip2",
          "original_bytes": 1048576,
          "compressed_bytes": 794457,
          "fraction": 0.7576532363891602,
          "encode_seconds_diagnostic": 0.2173505830578506,
          "decode_seconds_diagnostic": 0.07371341600082815,
          "roundtrip_exact": true
        },
        {
          "method": "xorshuffle/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 755097,
          "fraction": 0.7201166152954102,
          "encode_seconds_diagnostic": 0.0038344580680131912,
          "decode_seconds_diagnostic": 0.003496707882732153,
          "roundtrip_exact": true
        },
        {
          "method": "xorshuffle/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 738348,
          "fraction": 0.7041435241699219,
          "encode_seconds_diagnostic": 0.12628304190002382,
          "decode_seconds_diagnostic": 0.0037468750961124897,
          "roundtrip_exact": true
        },
        {
          "method": "deltashuffle/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 761574,
          "fraction": 0.7262935638427734,
          "encode_seconds_diagnostic": 0.0037252919282764196,
          "decode_seconds_diagnostic": 0.003671791171655059,
          "roundtrip_exact": true
        },
        {
          "method": "deltashuffle/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 746954,
          "fraction": 0.7123508453369141,
          "encode_seconds_diagnostic": 0.11326229199767113,
          "decode_seconds_diagnostic": 0.0039783751126378775,
          "roundtrip_exact": true
        },
        {
          "method": "xorplanes/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 766237,
          "fraction": 0.7307405471801758,
          "encode_seconds_diagnostic": 0.0024035831447690725,
          "decode_seconds_diagnostic": 0.006595291895791888,
          "roundtrip_exact": true
        },
        {
          "method": "xorplanes/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 750940,
          "fraction": 0.7161521911621094,
          "encode_seconds_diagnostic": 0.04315304197371006,
          "decode_seconds_diagnostic": 0.006704958854243159,
          "roundtrip_exact": true
        },
        {
          "method": "deltaplanes/zstd3",
          "original_bytes": 1048576,
          "compressed_bytes": 776381,
          "fraction": 0.7404146194458008,
          "encode_seconds_diagnostic": 0.0025984589010477066,
          "decode_seconds_diagnostic": 0.005972458980977535,
          "roundtrip_exact": true
        },
        {
          "method": "deltaplanes/zstd19",
          "original_bytes": 1048576,
          "compressed_bytes": 765062,
          "fraction": 0.7296199798583984,
          "encode_seconds_diagnostic": 0.04125470807775855,
          "decode_seconds_diagnostic": 0.00644408306106925,
          "roundtrip_exact": true
        }
      ]
    }
  ],
  "finished": {
    "utc": "2026-09-06T00:47:14.647281+00:00",
    "vm_stat": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   510022.\nPages active:                                 845572.\nPages inactive:                               581291.\nPages speculative:                            262133.\nPages throttled:                                   0.\nPages wired down:                             218301.\nPages purgeable:                               16324.\n\"Translation faults\":                    14225953222.\nPages copy-on-write:                       655118603.\nPages zero filled:                       17621233353.\nPages reactivated:                        2904448265.\nPages purged:                               65279986.\nFile-backed pages:                           1123544.\nAnonymous pages:                              565452.\nPages stored in compressor:                  1795143.\nPages occupied by compressor:                 659753.\nDecompressions:                           1001469182.\nCompressions:                             1298620829.\nPageins:                                  6561075504.\nPageouts:                                   10805750.\nSwapins:                                    41724281.\nSwapouts:                                   69922789.\nPages tagged:                                 178447.\nPages tagged resident:                        124862.\nPages tagged compressed:                       53585.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6830.\nPages tag-storage free:                         8516.\nPages tag-storage non-tag pageable:            82950.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8961536.\nTagged compressions:                         9950445.\nTagged decompressions:                       9161626.\n",
    "load_average": [
      12.01953125,
      12.3349609375,
      7.6767578125
    ]
  }
}
```


## Raw output: holdout.json

```text
{
  "stage": "holdout",
  "started": {
    "utc": "2026-09-06T00:49:02.039387+00:00",
    "vm_stat": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   295812.\nPages active:                                 914827.\nPages inactive:                               501868.\nPages speculative:                            477950.\nPages throttled:                                   0.\nPages wired down:                             241008.\nPages purgeable:                                5956.\n\"Translation faults\":                    14231672477.\nPages copy-on-write:                       655278647.\nPages zero filled:                       17624180336.\nPages reactivated:                        2904449001.\nPages purged:                               65280702.\nFile-backed pages:                           1418026.\nAnonymous pages:                              476619.\nPages stored in compressor:                  1768257.\nPages occupied by compressor:                 650839.\nDecompressions:                           1001494910.\nCompressions:                             1298620829.\nPageins:                                  6561176754.\nPageouts:                                   10805750.\nSwapins:                                    41724301.\nSwapouts:                                   69922789.\nPages tagged:                                 178969.\nPages tagged resident:                        128692.\nPages tagged compressed:                       50277.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6830.\nPages tag-storage free:                         3741.\nPages tag-storage non-tag pageable:            87725.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8293312.\nTagged compressions:                         9950445.\nTagged decompressions:                       9164919.\n",
    "load_average": [
      11.4375,
      12.10546875,
      8.14990234375
    ]
  },
  "seed": "0x534c4f54",
  "policy": "Stratified systematic PPS by tensor bytes with a random point in each cumulative-byte interval; random aligned window in chosen tensor; 16 samples per expert/ngram stratum, 8 other, 6 MTP; side information and probability tables accounted; 8 MiB maximum original sample.",
  "source_sha256": "65f06f0d068c2efb5744bfe366c48328d86dd99ef1dccd8c0bae29788c9c04f7",
  "samples": [
    {
      "stratum": [
        "experts",
        "pairs"
      ],
      "population_bytes": 7549747200,
      "sample_index": 0,
      "tensor": {
        "file": "model-00004.safetensors",
        "name": "language_model.model.layers.10.mlp.switch_mlp.up_proj.scales",
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "offset": 3532922566,
        "size": 26214400,
        "group": "experts"
      },
      "offset": 15639552,
      "size_per_tensor": 4194304,
      "sha256": "a0950fed433261030905fa8f3bc1cf8137cb61befffb0579cff5bb1a30bcd280",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5295805,
          "fraction": 0.6313091516494751,
          "encode_seconds_diagnostic": 0.03172008413821459,
          "decode_seconds_diagnostic": 0.0088660828769207,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4502272,
          "fraction": 0.536712646484375,
          "encode_seconds_diagnostic": 1.3674899998586625,
          "decode_seconds_diagnostic": 0.017118750140070915,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 2781557,
          "fraction": 0.33158743381500244,
          "encode_seconds_diagnostic": 0.024230708135291934,
          "decode_seconds_diagnostic": 0.022703916998580098,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 2690277,
          "fraction": 0.32070600986480713,
          "encode_seconds_diagnostic": 0.10276304185390472,
          "decode_seconds_diagnostic": 0.020116500090807676,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2529005,
          "fraction": 0.30148088932037354,
          "encode_seconds_diagnostic": 1.897941708099097,
          "decode_seconds_diagnostic": 0.019335207995027304,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2410619,
          "fraction": 0.28736817836761475,
          "encode_seconds_diagnostic": 0.053092166082933545,
          "decode_seconds_diagnostic": 0.2124357500579208,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "experts",
        "pairs"
      ],
      "population_bytes": 7549747200,
      "sample_index": 1,
      "tensor": {
        "file": "model-00004.safetensors",
        "name": "language_model.model.layers.11.mlp.switch_mlp.gate_proj.scales",
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "offset": 3019410150,
        "size": 26214400,
        "group": "experts"
      },
      "offset": 2294784,
      "size_per_tensor": 4194304,
      "sha256": "b833073209ac760843b8bf3f26ad9a45a3eb06ebb3943b82e59ecb15eb114625",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5313438,
          "fraction": 0.633411169052124,
          "encode_seconds_diagnostic": 0.03192983311600983,
          "decode_seconds_diagnostic": 0.008626374881714582,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4517850,
          "fraction": 0.5385696887969971,
          "encode_seconds_diagnostic": 1.2920822091400623,
          "decode_seconds_diagnostic": 0.016410832991823554,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 2800590,
          "fraction": 0.33385634422302246,
          "encode_seconds_diagnostic": 0.022037707967683673,
          "decode_seconds_diagnostic": 0.020941416965797544,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 2697236,
          "fraction": 0.321535587310791,
          "encode_seconds_diagnostic": 0.0998451670166105,
          "decode_seconds_diagnostic": 0.020241709193214774,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2527270,
          "fraction": 0.30127406120300293,
          "encode_seconds_diagnostic": 1.9084574591834098,
          "decode_seconds_diagnostic": 0.02037958288565278,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2417654,
          "fraction": 0.2882068157196045,
          "encode_seconds_diagnostic": 0.05556520796380937,
          "decode_seconds_diagnostic": 0.21259616711176932,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "experts",
        "pairs"
      ],
      "population_bytes": 7549747200,
      "sample_index": 2,
      "tensor": {
        "file": "model-00005.safetensors",
        "name": "language_model.model.layers.15.mlp.switch_mlp.gate_proj.scales",
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "offset": 8251775131,
        "size": 26214400,
        "group": "experts"
      },
      "offset": 17717760,
      "size_per_tensor": 4194304,
      "sha256": "d59529a7d5004e2379204fb1b876a48992d497e9f0744bf8968ba329bbbc1b96",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5318491,
          "fraction": 0.6340135335922241,
          "encode_seconds_diagnostic": 0.0318596251308918,
          "decode_seconds_diagnostic": 0.008624958107247949,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4513743,
          "fraction": 0.538080096244812,
          "encode_seconds_diagnostic": 1.29175362479873,
          "decode_seconds_diagnostic": 0.016212499933317304,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 2812712,
          "fraction": 0.33530139923095703,
          "encode_seconds_diagnostic": 0.022143499925732613,
          "decode_seconds_diagnostic": 0.02099224994890392,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 2712978,
          "fraction": 0.3234121799468994,
          "encode_seconds_diagnostic": 0.09968466707505286,
          "decode_seconds_diagnostic": 0.020204874919727445,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2539165,
          "fraction": 0.3026920557022095,
          "encode_seconds_diagnostic": 1.8701708330772817,
          "decode_seconds_diagnostic": 0.019089333014562726,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2431106,
          "fraction": 0.2898104190826416,
          "encode_seconds_diagnostic": 0.05353491613641381,
          "decode_seconds_diagnostic": 0.21241162484511733,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "experts",
        "pairs"
      ],
      "population_bytes": 7549747200,
      "sample_index": 3,
      "tensor": {
        "file": "model-00005.safetensors",
        "name": "language_model.model.layers.18.mlp.switch_mlp.up_proj.scales",
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "offset": 3341487035,
        "size": 26214400,
        "group": "experts"
      },
      "offset": 19481088,
      "size_per_tensor": 4194304,
      "sha256": "d8f06ab7363827c1c00258789cd80900a059ceaa2b1b889383ab657a614c072a",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5326534,
          "fraction": 0.634972333908081,
          "encode_seconds_diagnostic": 0.03219295805320144,
          "decode_seconds_diagnostic": 0.008516541915014386,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4526633,
          "fraction": 0.5396167039871216,
          "encode_seconds_diagnostic": 1.296443667029962,
          "decode_seconds_diagnostic": 0.01647795783355832,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 2808432,
          "fraction": 0.3347911834716797,
          "encode_seconds_diagnostic": 0.02223829203285277,
          "decode_seconds_diagnostic": 0.021029082825407386,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 2717812,
          "fraction": 0.3239884376525879,
          "encode_seconds_diagnostic": 0.09961504116654396,
          "decode_seconds_diagnostic": 0.020352249965071678,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2543770,
          "fraction": 0.3032410144805908,
          "encode_seconds_diagnostic": 1.7979206249583513,
          "decode_seconds_diagnostic": 0.01802995800971985,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2433727,
          "fraction": 0.2901228666305542,
          "encode_seconds_diagnostic": 0.04961524996906519,
          "decode_seconds_diagnostic": 0.19557420792989433,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "experts",
        "pairs"
      ],
      "population_bytes": 7549747200,
      "sample_index": 4,
      "tensor": {
        "file": "model-00006.safetensors",
        "name": "language_model.model.layers.21.mlp.switch_mlp.gate_proj.scales",
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "offset": 4887876855,
        "size": 26214400,
        "group": "experts"
      },
      "offset": 2189824,
      "size_per_tensor": 4194304,
      "sha256": "9b70f32e5b12d419c25074fdc5ca3fc1a016e8ccbd37db1c118b59c8af1ca71e",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5321994,
          "fraction": 0.6344311237335205,
          "encode_seconds_diagnostic": 0.0308078748639673,
          "decode_seconds_diagnostic": 0.007904500002041459,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4527423,
          "fraction": 0.5397108793258667,
          "encode_seconds_diagnostic": 1.2114873749669641,
          "decode_seconds_diagnostic": 0.013987333048135042,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 2804693,
          "fraction": 0.3343454599380493,
          "encode_seconds_diagnostic": 0.018794375006109476,
          "decode_seconds_diagnostic": 0.01839479198679328,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 2712981,
          "fraction": 0.32341253757476807,
          "encode_seconds_diagnostic": 0.08867099997587502,
          "decode_seconds_diagnostic": 0.01822700002230704,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2540198,
          "fraction": 0.30281519889831543,
          "encode_seconds_diagnostic": 1.6384492919314653,
          "decode_seconds_diagnostic": 0.01781454193405807,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2430000,
          "fraction": 0.28967857360839844,
          "encode_seconds_diagnostic": 0.04698358289897442,
          "decode_seconds_diagnostic": 0.18669620901346207,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "experts",
        "pairs"
      ],
      "population_bytes": 7549747200,
      "sample_index": 5,
      "tensor": {
        "file": "model-00006.safetensors",
        "name": "language_model.model.layers.22.mlp.switch_mlp.gate_proj.scales",
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "offset": 3454839511,
        "size": 26214400,
        "group": "experts"
      },
      "offset": 219648,
      "size_per_tensor": 4194304,
      "sha256": "2b950a16d3dc6ff189f92814096cfa77c21a83a1f92dd65079bdb0f96b6d5fcc",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5359187,
          "fraction": 0.6388648748397827,
          "encode_seconds_diagnostic": 0.027852750150486827,
          "decode_seconds_diagnostic": 0.007595208939164877,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4553061,
          "fraction": 0.5427671670913696,
          "encode_seconds_diagnostic": 1.14247320801951,
          "decode_seconds_diagnostic": 0.01424600020982325,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 2839505,
          "fraction": 0.3384953737258911,
          "encode_seconds_diagnostic": 0.019680833909660578,
          "decode_seconds_diagnostic": 0.019037041114643216,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 2746486,
          "fraction": 0.327406644821167,
          "encode_seconds_diagnostic": 0.08848000015132129,
          "decode_seconds_diagnostic": 0.017469209153205156,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2582890,
          "fraction": 0.3079044818878174,
          "encode_seconds_diagnostic": 1.6139879999682307,
          "decode_seconds_diagnostic": 0.016556124901399016,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2459690,
          "fraction": 0.29321789741516113,
          "encode_seconds_diagnostic": 0.04849270801059902,
          "decode_seconds_diagnostic": 0.18686633300967515,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "experts",
        "pairs"
      ],
      "population_bytes": 7549747200,
      "sample_index": 6,
      "tensor": {
        "file": "model-00007.safetensors",
        "name": "language_model.model.layers.26.mlp.switch_mlp.gate_proj.scales",
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "offset": 10141949508,
        "size": 26214400,
        "group": "experts"
      },
      "offset": 15489536,
      "size_per_tensor": 4194304,
      "sha256": "f77184ca7153823e1af690c596eca0dc954cb3fb292555499be90c05fad2d7c0",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5356552,
          "fraction": 0.6385507583618164,
          "encode_seconds_diagnostic": 0.02801695792004466,
          "decode_seconds_diagnostic": 0.007316207978874445,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4550761,
          "fraction": 0.5424929857254028,
          "encode_seconds_diagnostic": 1.1288173329085112,
          "decode_seconds_diagnostic": 0.015023750020191073,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 2812121,
          "fraction": 0.3352309465408325,
          "encode_seconds_diagnostic": 0.020257625030353665,
          "decode_seconds_diagnostic": 0.019413374830037355,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 2721213,
          "fraction": 0.3243938684463501,
          "encode_seconds_diagnostic": 0.09158562519587576,
          "decode_seconds_diagnostic": 0.018712125020101666,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2546261,
          "fraction": 0.3035379648208618,
          "encode_seconds_diagnostic": 1.6638760000932962,
          "decode_seconds_diagnostic": 0.01663862494751811,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2440643,
          "fraction": 0.2909473180770874,
          "encode_seconds_diagnostic": 0.04599654208868742,
          "decode_seconds_diagnostic": 0.18554974999278784,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "experts",
        "pairs"
      ],
      "population_bytes": 7549747200,
      "sample_index": 7,
      "tensor": {
        "file": "model-00007.safetensors",
        "name": "language_model.model.layers.3.mlp.switch_mlp.down_proj.scales",
        "dtype": "BF16",
        "shape": [
          512,
          2560,
          10
        ],
        "offset": 1413466628,
        "size": 26214400,
        "group": "experts"
      },
      "offset": 1045760,
      "size_per_tensor": 4194304,
      "sha256": "1982a5d24ca037953b95760449f78cbfa0b80e12891a8c88ec37e02329a201ac",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5433277,
          "fraction": 0.6476970911026001,
          "encode_seconds_diagnostic": 0.027003959054127336,
          "decode_seconds_diagnostic": 0.007526749977841973,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4609108,
          "fraction": 0.5494484901428223,
          "encode_seconds_diagnostic": 1.1461600409820676,
          "decode_seconds_diagnostic": 0.015003249980509281,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 2851628,
          "fraction": 0.33994054794311523,
          "encode_seconds_diagnostic": 0.021239165915176272,
          "decode_seconds_diagnostic": 0.01861374988220632,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 2747985,
          "fraction": 0.3275853395462036,
          "encode_seconds_diagnostic": 0.08666441706009209,
          "decode_seconds_diagnostic": 0.017356083961203694,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2572269,
          "fraction": 0.30663836002349854,
          "encode_seconds_diagnostic": 1.6825987079646438,
          "decode_seconds_diagnostic": 0.016422250075265765,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2470710,
          "fraction": 0.29453158378601074,
          "encode_seconds_diagnostic": 0.04566970793530345,
          "decode_seconds_diagnostic": 0.18265279196202755,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "experts",
        "pairs"
      ],
      "population_bytes": 7549747200,
      "sample_index": 8,
      "tensor": {
        "file": "model-00008.safetensors",
        "name": "language_model.model.layers.31.mlp.switch_mlp.down_proj.scales",
        "dtype": "BF16",
        "shape": [
          512,
          2560,
          10
        ],
        "offset": 2050977627,
        "size": 26214400,
        "group": "experts"
      },
      "offset": 16242176,
      "size_per_tensor": 4194304,
      "sha256": "bc5dc226893dd8f4a123e310fb63e56e7f80179907b26e197aff1d08d9bcff90",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5506428,
          "fraction": 0.6564173698425293,
          "encode_seconds_diagnostic": 0.026550832903012633,
          "decode_seconds_diagnostic": 0.007599500007927418,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4676942,
          "fraction": 0.55753493309021,
          "encode_seconds_diagnostic": 1.1665073749609292,
          "decode_seconds_diagnostic": 0.01363037503324449,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 2887507,
          "fraction": 0.3442176580429077,
          "encode_seconds_diagnostic": 0.019367750035598874,
          "decode_seconds_diagnostic": 0.018434750149026513,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 2794281,
          "fraction": 0.3331042528152466,
          "encode_seconds_diagnostic": 0.08981545804999769,
          "decode_seconds_diagnostic": 0.01780916703864932,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2619045,
          "fraction": 0.3122144937515259,
          "encode_seconds_diagnostic": 1.6290597501210868,
          "decode_seconds_diagnostic": 0.016963916830718517,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2509811,
          "fraction": 0.29919278621673584,
          "encode_seconds_diagnostic": 0.04593395791016519,
          "decode_seconds_diagnostic": 0.18226358294487,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "experts",
        "pairs"
      ],
      "population_bytes": 7549747200,
      "sample_index": 9,
      "tensor": {
        "file": "model-00008.safetensors",
        "name": "language_model.model.layers.35.mlp.switch_mlp.gate_proj.scales",
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "offset": 7090452987,
        "size": 26214400,
        "group": "experts"
      },
      "offset": 16676608,
      "size_per_tensor": 4194304,
      "sha256": "2f31b79db97e025fb158f1007edba034180b18eabd9e328cb00c3d055e79835f",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5339312,
          "fraction": 0.6364955902099609,
          "encode_seconds_diagnostic": 0.02764083305373788,
          "decode_seconds_diagnostic": 0.007701291004195809,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4535252,
          "fraction": 0.5406441688537598,
          "encode_seconds_diagnostic": 1.168380541028455,
          "decode_seconds_diagnostic": 0.014166540931910276,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 2810552,
          "fraction": 0.33504390716552734,
          "encode_seconds_diagnostic": 0.020119084045290947,
          "decode_seconds_diagnostic": 0.01926404214464128,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 2719608,
          "fraction": 0.3242025375366211,
          "encode_seconds_diagnostic": 0.08776854095049202,
          "decode_seconds_diagnostic": 0.017520166002213955,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2558954,
          "fraction": 0.3050510883331299,
          "encode_seconds_diagnostic": 1.617241624975577,
          "decode_seconds_diagnostic": 0.016442666994407773,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2438278,
          "fraction": 0.2906653881072998,
          "encode_seconds_diagnostic": 0.04466212494298816,
          "decode_seconds_diagnostic": 0.18152037519030273,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "experts",
        "pairs"
      ],
      "population_bytes": 7549747200,
      "sample_index": 10,
      "tensor": {
        "file": "model-00008.safetensors",
        "name": "language_model.model.layers.38.mlp.switch_mlp.gate_proj.scales",
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "offset": 476755259,
        "size": 26214400,
        "group": "experts"
      },
      "offset": 15778304,
      "size_per_tensor": 4194304,
      "sha256": "342f910f16341185dda6ae51b38e36969e4bc8a5b651a1f6108dc2978038ebb5",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5417312,
          "fraction": 0.6457939147949219,
          "encode_seconds_diagnostic": 0.027725334046408534,
          "decode_seconds_diagnostic": 0.007788375020027161,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4597146,
          "fraction": 0.5480225086212158,
          "encode_seconds_diagnostic": 1.1660014591179788,
          "decode_seconds_diagnostic": 0.014397166902199388,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 2898446,
          "fraction": 0.3455216884613037,
          "encode_seconds_diagnostic": 0.020622249925509095,
          "decode_seconds_diagnostic": 0.019381250021979213,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 2805417,
          "fraction": 0.3344317674636841,
          "encode_seconds_diagnostic": 0.09441304206848145,
          "decode_seconds_diagnostic": 0.01868008286692202,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2627950,
          "fraction": 0.3132760524749756,
          "encode_seconds_diagnostic": 1.6013590421061963,
          "decode_seconds_diagnostic": 0.016553582856431603,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2514092,
          "fraction": 0.29970312118530273,
          "encode_seconds_diagnostic": 0.044596082996577024,
          "decode_seconds_diagnostic": 0.18440966703929007,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "experts",
        "pairs"
      ],
      "population_bytes": 7549747200,
      "sample_index": 11,
      "tensor": {
        "file": "model-00009.safetensors",
        "name": "language_model.model.layers.4.mlp.switch_mlp.down_proj.scales",
        "dtype": "BF16",
        "shape": [
          512,
          2560,
          10
        ],
        "offset": 9105487276,
        "size": 26214400,
        "group": "experts"
      },
      "offset": 21215744,
      "size_per_tensor": 4194304,
      "sha256": "f6a6053538335a87af47c1127feccb50941ca01957c2f9efe780b0b92216f75f",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5453362,
          "fraction": 0.6500914096832275,
          "encode_seconds_diagnostic": 0.02995304111391306,
          "decode_seconds_diagnostic": 0.0074434170965105295,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4626720,
          "fraction": 0.5515480041503906,
          "encode_seconds_diagnostic": 1.1217378340661526,
          "decode_seconds_diagnostic": 0.01428908295929432,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 2855162,
          "fraction": 0.3403618335723877,
          "encode_seconds_diagnostic": 0.019991917070001364,
          "decode_seconds_diagnostic": 0.018906832905486226,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 2762787,
          "fraction": 0.3293498754501343,
          "encode_seconds_diagnostic": 0.08679120801389217,
          "decode_seconds_diagnostic": 0.01836229208856821,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2585723,
          "fraction": 0.30824220180511475,
          "encode_seconds_diagnostic": 1.607310916064307,
          "decode_seconds_diagnostic": 0.016541499877348542,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2486010,
          "fraction": 0.2963554859161377,
          "encode_seconds_diagnostic": 0.04602520796470344,
          "decode_seconds_diagnostic": 0.18165166699327528,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "experts",
        "pairs"
      ],
      "population_bytes": 7549747200,
      "sample_index": 12,
      "tensor": {
        "file": "model-00009.safetensors",
        "name": "language_model.model.layers.41.mlp.switch_mlp.gate_proj.scales",
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "offset": 3423094380,
        "size": 26214400,
        "group": "experts"
      },
      "offset": 2360576,
      "size_per_tensor": 4194304,
      "sha256": "c1d4d6bd6eb25c6d13c06d10338e27cfa985bfa5bbc6eb953e6ffd3312a8ec41",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5305257,
          "fraction": 0.6324359178543091,
          "encode_seconds_diagnostic": 0.03150758403353393,
          "decode_seconds_diagnostic": 0.007790375035256147,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4508806,
          "fraction": 0.5374915599822998,
          "encode_seconds_diagnostic": 1.1613610000349581,
          "decode_seconds_diagnostic": 0.014409874798730016,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 2822010,
          "fraction": 0.3364098072052002,
          "encode_seconds_diagnostic": 0.019924042047932744,
          "decode_seconds_diagnostic": 0.019636250101029873,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 2727230,
          "fraction": 0.32511115074157715,
          "encode_seconds_diagnostic": 0.08794166706502438,
          "decode_seconds_diagnostic": 0.019152041990309954,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2550685,
          "fraction": 0.3040653467178345,
          "encode_seconds_diagnostic": 1.6070590829476714,
          "decode_seconds_diagnostic": 0.01618666690774262,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2441901,
          "fraction": 0.2910972833633423,
          "encode_seconds_diagnostic": 0.04549608309753239,
          "decode_seconds_diagnostic": 0.18120016693137586,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "experts",
        "pairs"
      ],
      "population_bytes": 7549747200,
      "sample_index": 13,
      "tensor": {
        "file": "model-00010.safetensors",
        "name": "language_model.model.layers.45.mlp.switch_mlp.up_proj.scales",
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "offset": 3670600082,
        "size": 26214400,
        "group": "experts"
      },
      "offset": 3954432,
      "size_per_tensor": 4194304,
      "sha256": "9264c403769de70f00bc76286aef5b0ca13d08eb954695bff49414d24413da93",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5340948,
          "fraction": 0.636690616607666,
          "encode_seconds_diagnostic": 0.02763791591860354,
          "decode_seconds_diagnostic": 0.007421792019158602,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4540747,
          "fraction": 0.5412992238998413,
          "encode_seconds_diagnostic": 1.1375459169503301,
          "decode_seconds_diagnostic": 0.013854332966729999,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 2831257,
          "fraction": 0.33751213550567627,
          "encode_seconds_diagnostic": 0.019000000087544322,
          "decode_seconds_diagnostic": 0.01788620906881988,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 2739016,
          "fraction": 0.32651615142822266,
          "encode_seconds_diagnostic": 0.08565979194827378,
          "decode_seconds_diagnostic": 0.017193375155329704,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2562849,
          "fraction": 0.3055154085159302,
          "encode_seconds_diagnostic": 1.568813000107184,
          "decode_seconds_diagnostic": 0.016134582925587893,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2453010,
          "fraction": 0.2924215793609619,
          "encode_seconds_diagnostic": 0.04472316708415747,
          "decode_seconds_diagnostic": 0.180684583960101,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "experts",
        "pairs"
      ],
      "population_bytes": 7549747200,
      "sample_index": 14,
      "tensor": {
        "file": "model-00010.safetensors",
        "name": "language_model.model.layers.6.mlp.switch_mlp.up_proj.scales",
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "offset": 1572842706,
        "size": 26214400,
        "group": "experts"
      },
      "offset": 1108736,
      "size_per_tensor": 4194304,
      "sha256": "45118df33e86d72ca8a4225e70e0542ecb230fa3b9096915ac7356c98b773b13",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5308963,
          "fraction": 0.6328777074813843,
          "encode_seconds_diagnostic": 0.030370791908353567,
          "decode_seconds_diagnostic": 0.007665208075195551,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4512130,
          "fraction": 0.5378878116607666,
          "encode_seconds_diagnostic": 1.1247250000014901,
          "decode_seconds_diagnostic": 0.013833750039339066,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 2810457,
          "fraction": 0.33503258228302,
          "encode_seconds_diagnostic": 0.018981665838509798,
          "decode_seconds_diagnostic": 0.022530707996338606,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 2719086,
          "fraction": 0.3241403102874756,
          "encode_seconds_diagnostic": 0.08908641710877419,
          "decode_seconds_diagnostic": 0.018112249905243516,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2553916,
          "fraction": 0.30445051193237305,
          "encode_seconds_diagnostic": 1.5882640830241144,
          "decode_seconds_diagnostic": 0.01650354196317494,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2433469,
          "fraction": 0.2900921106338501,
          "encode_seconds_diagnostic": 0.04446758306585252,
          "decode_seconds_diagnostic": 0.18059383309446275,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "experts",
        "pairs"
      ],
      "population_bytes": 7549747200,
      "sample_index": 15,
      "tensor": {
        "file": "model-00010.safetensors",
        "name": "language_model.model.layers.8.mlp.switch_mlp.up_proj.scales",
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "offset": 118065778,
        "size": 26214400,
        "group": "experts"
      },
      "offset": 17635072,
      "size_per_tensor": 4194304,
      "sha256": "7bb2e2adf74d787159a697c55b0fbb796951f0619b75120acf987811431ba82b",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5310154,
          "fraction": 0.6330196857452393,
          "encode_seconds_diagnostic": 0.027153708040714264,
          "decode_seconds_diagnostic": 0.007377292029559612,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4505610,
          "fraction": 0.5371105670928955,
          "encode_seconds_diagnostic": 1.1322550000622869,
          "decode_seconds_diagnostic": 0.015767334029078484,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 2802168,
          "fraction": 0.3340444564819336,
          "encode_seconds_diagnostic": 0.01953674992546439,
          "decode_seconds_diagnostic": 0.0190543329808861,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 2699939,
          "fraction": 0.3218578100204468,
          "encode_seconds_diagnostic": 0.08712149993516505,
          "decode_seconds_diagnostic": 0.017817834159359336,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2524686,
          "fraction": 0.3009660243988037,
          "encode_seconds_diagnostic": 1.5637846670579165,
          "decode_seconds_diagnostic": 0.016045792028307915,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2418818,
          "fraction": 0.2883455753326416,
          "encode_seconds_diagnostic": 0.04440304217860103,
          "decode_seconds_diagnostic": 0.18052395898848772,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "experts",
        "weights"
      ],
      "population_bytes": 60397977600,
      "sample_index": 0,
      "tensor": {
        "file": "model-00001.safetensors",
        "name": "language_model.model.layers.1.mlp.switch_mlp.gate_proj.weight",
        "dtype": "U32",
        "shape": [
          512,
          640,
          320
        ],
        "offset": 5477664209,
        "size": 419430400,
        "group": "experts"
      },
      "offset": 350520320,
      "size_per_tensor": 8388608,
      "sha256": "de857e470e7100d662f1b1d1cb06895bbca71cdce3691c1c9b7b552a08413d32",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7767439,
          "fraction": 0.9259508848190308,
          "encode_seconds_diagnostic": 0.006936292164027691,
          "decode_seconds_diagnostic": 0.00601412495598197,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 7768313,
          "fraction": 0.9260550737380981,
          "encode_seconds_diagnostic": 0.4592959159053862,
          "decode_seconds_diagnostic": 0.006115250056609511,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7717650,
          "fraction": 0.9200155735015869,
          "encode_seconds_diagnostic": 0.025668458081781864,
          "decode_seconds_diagnostic": 0.02280204091221094,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7674167,
          "fraction": 0.9148319959640503,
          "encode_seconds_diagnostic": 0.10647441702894866,
          "decode_seconds_diagnostic": 0.2215492920950055,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7676197,
          "fraction": 0.9150739908218384,
          "encode_seconds_diagnostic": 0.05126916593872011,
          "decode_seconds_diagnostic": 0.16761116683483124,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7651141,
          "fraction": 0.912087082862854,
          "encode_seconds_diagnostic": 0.10956316720694304,
          "decode_seconds_diagnostic": 0.23189854202792048,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7664872,
          "fraction": 0.9137239456176758,
          "encode_seconds_diagnostic": 0.06076658284291625,
          "decode_seconds_diagnostic": 0.17610787483863533,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "experts",
        "weights"
      ],
      "population_bytes": 60397977600,
      "sample_index": 1,
      "tensor": {
        "file": "model-00005.safetensors",
        "name": "language_model.model.layers.13.mlp.switch_mlp.up_proj.weight",
        "dtype": "U32",
        "shape": [
          512,
          640,
          320
        ],
        "offset": 9695226459,
        "size": 419430400,
        "group": "experts"
      },
      "offset": 89075200,
      "size_per_tensor": 8388608,
      "sha256": "26b3554ca26f9363a7ad5b52ff7a0dcce7ba6965c69e23a8bf48645a72bf47fb",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7825885,
          "fraction": 0.9329181909561157,
          "encode_seconds_diagnostic": 0.007296208990737796,
          "decode_seconds_diagnostic": 0.006031207973137498,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 7824916,
          "fraction": 0.932802677154541,
          "encode_seconds_diagnostic": 0.44443833315744996,
          "decode_seconds_diagnostic": 0.00609199982136488,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7791478,
          "fraction": 0.928816556930542,
          "encode_seconds_diagnostic": 0.025969667127355933,
          "decode_seconds_diagnostic": 0.02440737490542233,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7747299,
          "fraction": 0.923550009727478,
          "encode_seconds_diagnostic": 0.09951612516306341,
          "decode_seconds_diagnostic": 0.2204775419086218,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7749349,
          "fraction": 0.9237943887710571,
          "encode_seconds_diagnostic": 0.051064667059108615,
          "decode_seconds_diagnostic": 0.16754641686566174,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7726818,
          "fraction": 0.9211084842681885,
          "encode_seconds_diagnostic": 0.10684579191729426,
          "decode_seconds_diagnostic": 0.22923383302986622,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7738304,
          "fraction": 0.9224777221679688,
          "encode_seconds_diagnostic": 0.05845545814372599,
          "decode_seconds_diagnostic": 0.17386495904065669,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "experts",
        "weights"
      ],
      "population_bytes": 60397977600,
      "sample_index": 2,
      "tensor": {
        "file": "model-00005.safetensors",
        "name": "language_model.model.layers.14.mlp.switch_mlp.down_proj.weight",
        "dtype": "U32",
        "shape": [
          512,
          2560,
          80
        ],
        "offset": 5926434011,
        "size": 419430400,
        "group": "experts"
      },
      "offset": 381056768,
      "size_per_tensor": 8388608,
      "sha256": "60be404c49e497a8dcb5055ae5f646e9098ec73efac58eeb824db50484607cc1",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7837913,
          "fraction": 0.9343520402908325,
          "encode_seconds_diagnostic": 0.007297375006601214,
          "decode_seconds_diagnostic": 0.005996834021061659,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 7837567,
          "fraction": 0.934310793876648,
          "encode_seconds_diagnostic": 0.4420311660505831,
          "decode_seconds_diagnostic": 0.006103290943428874,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7805364,
          "fraction": 0.9304718971252441,
          "encode_seconds_diagnostic": 0.0234375,
          "decode_seconds_diagnostic": 0.023010874865576625,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7760944,
          "fraction": 0.9251766204833984,
          "encode_seconds_diagnostic": 0.09851712500676513,
          "decode_seconds_diagnostic": 0.22109458316117525,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7762993,
          "fraction": 0.925420880317688,
          "encode_seconds_diagnostic": 0.05200541717931628,
          "decode_seconds_diagnostic": 0.16721337498165667,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7746957,
          "fraction": 0.9235092401504517,
          "encode_seconds_diagnostic": 0.10784495808184147,
          "decode_seconds_diagnostic": 0.23071870882995427,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7759619,
          "fraction": 0.9250186681747437,
          "encode_seconds_diagnostic": 0.05941687501035631,
          "decode_seconds_diagnostic": 0.1751698749139905,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "experts",
        "weights"
      ],
      "population_bytes": 60397977600,
      "sample_index": 3,
      "tensor": {
        "file": "model-00005.safetensors",
        "name": "language_model.model.layers.19.mlp.switch_mlp.down_proj.weight",
        "dtype": "U32",
        "shape": [
          512,
          2560,
          80
        ],
        "offset": 5359588219,
        "size": 419430400,
        "group": "experts"
      },
      "offset": 301149696,
      "size_per_tensor": 8388608,
      "sha256": "6a4d16b7a62ffe00bf1455b33b2032e0ec6ce503961cdbfcb7f49e1ad1571a54",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7838871,
          "fraction": 0.9344662427902222,
          "encode_seconds_diagnostic": 0.008053000085055828,
          "decode_seconds_diagnostic": 0.006012000143527985,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 7837405,
          "fraction": 0.9342914819717407,
          "encode_seconds_diagnostic": 0.448480041930452,
          "decode_seconds_diagnostic": 0.006093916017562151,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7807540,
          "fraction": 0.9307312965393066,
          "encode_seconds_diagnostic": 0.02372970897704363,
          "decode_seconds_diagnostic": 0.024306332925334573,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7762481,
          "fraction": 0.925359845161438,
          "encode_seconds_diagnostic": 0.09934516716748476,
          "decode_seconds_diagnostic": 0.22069474984891713,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7764562,
          "fraction": 0.9256079196929932,
          "encode_seconds_diagnostic": 0.05195516697131097,
          "decode_seconds_diagnostic": 0.16740741697140038,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7748578,
          "fraction": 0.9237024784088135,
          "encode_seconds_diagnostic": 0.10820887493900955,
          "decode_seconds_diagnostic": 0.2300841249525547,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7761261,
          "fraction": 0.925214409828186,
          "encode_seconds_diagnostic": 0.05962504190392792,
          "decode_seconds_diagnostic": 0.17490345798432827,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "experts",
        "weights"
      ],
      "population_bytes": 60397977600,
      "sample_index": 4,
      "tensor": {
        "file": "model-00006.safetensors",
        "name": "language_model.model.layers.21.mlp.switch_mlp.up_proj.weight",
        "dtype": "U32",
        "shape": [
          512,
          640,
          320
        ],
        "offset": 4412587255,
        "size": 419430400,
        "group": "experts"
      },
      "offset": 284517632,
      "size_per_tensor": 8388608,
      "sha256": "c22441003c080efc5f541eb53d03358e53cc3c41f3e39698a45d22db54e3ac0f",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7831473,
          "fraction": 0.9335843324661255,
          "encode_seconds_diagnostic": 0.00734341680072248,
          "decode_seconds_diagnostic": 0.005988541059195995,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 7829437,
          "fraction": 0.9333416223526001,
          "encode_seconds_diagnostic": 0.4895555831026286,
          "decode_seconds_diagnostic": 0.0061279169749468565,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7794804,
          "fraction": 0.9292130470275879,
          "encode_seconds_diagnostic": 0.02679183310829103,
          "decode_seconds_diagnostic": 0.02473695809021592,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7749543,
          "fraction": 0.92381751537323,
          "encode_seconds_diagnostic": 0.10558791691437364,
          "decode_seconds_diagnostic": 0.22668945789337158,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7751722,
          "fraction": 0.9240772724151611,
          "encode_seconds_diagnostic": 0.05430700001306832,
          "decode_seconds_diagnostic": 0.16791529208421707,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7731167,
          "fraction": 0.9216269254684448,
          "encode_seconds_diagnostic": 0.11123845796100795,
          "decode_seconds_diagnostic": 0.2423404580913484,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7743604,
          "fraction": 0.9231095314025879,
          "encode_seconds_diagnostic": 0.06134233414195478,
          "decode_seconds_diagnostic": 0.17561908392235637,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "experts",
        "weights"
      ],
      "population_bytes": 60397977600,
      "sample_index": 5,
      "tensor": {
        "file": "model-00006.safetensors",
        "name": "language_model.model.layers.22.mlp.switch_mlp.up_proj.weight",
        "dtype": "U32",
        "shape": [
          512,
          640,
          320
        ],
        "offset": 3008457431,
        "size": 419430400,
        "group": "experts"
      },
      "offset": 223507712,
      "size_per_tensor": 8388608,
      "sha256": "a55efe654b4681f26ae536e4ae709ca246ffec36d233cfac8b0a28fb1e7d33c9",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7819641,
          "fraction": 0.9321738481521606,
          "encode_seconds_diagnostic": 0.007259290898218751,
          "decode_seconds_diagnostic": 0.00604408304207027,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 7818837,
          "fraction": 0.9320780038833618,
          "encode_seconds_diagnostic": 0.4697839580476284,
          "decode_seconds_diagnostic": 0.006101999897509813,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7778948,
          "fraction": 0.9273228645324707,
          "encode_seconds_diagnostic": 0.024560875026509166,
          "decode_seconds_diagnostic": 0.023693916853517294,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7734730,
          "fraction": 0.9220516681671143,
          "encode_seconds_diagnostic": 0.0999478748999536,
          "decode_seconds_diagnostic": 0.22220754204317927,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7736909,
          "fraction": 0.9223114252090454,
          "encode_seconds_diagnostic": 0.05256970808841288,
          "decode_seconds_diagnostic": 0.16767087508924305,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7714864,
          "fraction": 0.9196834564208984,
          "encode_seconds_diagnostic": 0.1098235419485718,
          "decode_seconds_diagnostic": 0.23149695806205273,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7727710,
          "fraction": 0.9212148189544678,
          "encode_seconds_diagnostic": 0.060653042048215866,
          "decode_seconds_diagnostic": 0.1759168750140816,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "experts",
        "weights"
      ],
      "population_bytes": 60397977600,
      "sample_index": 6,
      "tensor": {
        "file": "model-00006.safetensors",
        "name": "language_model.model.layers.25.mlp.switch_mlp.down_proj.weight",
        "dtype": "U32",
        "shape": [
          512,
          2560,
          80
        ],
        "offset": 8383573207,
        "size": 419430400,
        "group": "experts"
      },
      "offset": 229158144,
      "size_per_tensor": 8388608,
      "sha256": "92776bb6bbc543220b838c6411dc539726f0b613ab077ea16a49fac230fcec94",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7836419,
          "fraction": 0.9341739416122437,
          "encode_seconds_diagnostic": 0.007454332895576954,
          "decode_seconds_diagnostic": 0.006023457972332835,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 7835877,
          "fraction": 0.9341093301773071,
          "encode_seconds_diagnostic": 0.44942466681823134,
          "decode_seconds_diagnostic": 0.006111749913543463,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7804828,
          "fraction": 0.9304080009460449,
          "encode_seconds_diagnostic": 0.02376745897345245,
          "decode_seconds_diagnostic": 0.02350537502206862,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7760085,
          "fraction": 0.9250742197036743,
          "encode_seconds_diagnostic": 0.09893537499010563,
          "decode_seconds_diagnostic": 0.22153304191306233,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7762076,
          "fraction": 0.9253115653991699,
          "encode_seconds_diagnostic": 0.05572529090568423,
          "decode_seconds_diagnostic": 0.1704979590140283,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7749981,
          "fraction": 0.9238697290420532,
          "encode_seconds_diagnostic": 0.10818933392874897,
          "decode_seconds_diagnostic": 0.23084037494845688,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7763674,
          "fraction": 0.9255020618438721,
          "encode_seconds_diagnostic": 0.059758458053693175,
          "decode_seconds_diagnostic": 0.17516812519170344,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "experts",
        "weights"
      ],
      "population_bytes": 60397977600,
      "sample_index": 7,
      "tensor": {
        "file": "model-00007.safetensors",
        "name": "language_model.model.layers.3.mlp.switch_mlp.down_proj.weight",
        "dtype": "U32",
        "shape": [
          512,
          2560,
          80
        ],
        "offset": 1439681028,
        "size": 419430400,
        "group": "experts"
      },
      "offset": 301940480,
      "size_per_tensor": 8388608,
      "sha256": "5b44ef1cbe2fa1b2a6b4ec99ad9e4be362545f5c83c673ef6b07d9dbaccc5191",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7832677,
          "fraction": 0.9337278604507446,
          "encode_seconds_diagnostic": 0.0072117920499295,
          "decode_seconds_diagnostic": 0.006029207957908511,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 7830696,
          "fraction": 0.9334917068481445,
          "encode_seconds_diagnostic": 0.45037104189395905,
          "decode_seconds_diagnostic": 0.006085666827857494,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7795961,
          "fraction": 0.9293509721755981,
          "encode_seconds_diagnostic": 0.02337995800189674,
          "decode_seconds_diagnostic": 0.023217916022986174,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7750538,
          "fraction": 0.923936128616333,
          "encode_seconds_diagnostic": 0.10043099988251925,
          "decode_seconds_diagnostic": 0.220863499911502,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7752729,
          "fraction": 0.9241973161697388,
          "encode_seconds_diagnostic": 0.05216600000858307,
          "decode_seconds_diagnostic": 0.167569583049044,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7739530,
          "fraction": 0.922623872756958,
          "encode_seconds_diagnostic": 0.11224362486973405,
          "decode_seconds_diagnostic": 0.23384008300490677,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7754759,
          "fraction": 0.9244393110275269,
          "encode_seconds_diagnostic": 0.06348220887593925,
          "decode_seconds_diagnostic": 0.1787403328344226,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "experts",
        "weights"
      ],
      "population_bytes": 60397977600,
      "sample_index": 8,
      "tensor": {
        "file": "model-00007.safetensors",
        "name": "language_model.model.layers.31.mlp.switch_mlp.up_proj.weight",
        "dtype": "U32",
        "shape": [
          512,
          640,
          320
        ],
        "offset": 37824420,
        "size": 419430400,
        "group": "experts"
      },
      "offset": 144127488,
      "size_per_tensor": 8388608,
      "sha256": "5611031327d9293284697579d9d96ca0d8f92c900cb8e9832a690722ad2302cd",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7809447,
          "fraction": 0.93095862865448,
          "encode_seconds_diagnostic": 0.007182541070505977,
          "decode_seconds_diagnostic": 0.0059967499691993,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 7808321,
          "fraction": 0.9308243989944458,
          "encode_seconds_diagnostic": 0.4567617089487612,
          "decode_seconds_diagnostic": 0.0060839171055704355,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7770286,
          "fraction": 0.9262902736663818,
          "encode_seconds_diagnostic": 0.023246957920491695,
          "decode_seconds_diagnostic": 0.023218249902129173,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7728234,
          "fraction": 0.9212772846221924,
          "encode_seconds_diagnostic": 0.09928787499666214,
          "decode_seconds_diagnostic": 0.2207275410182774,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7730257,
          "fraction": 0.9215184450149536,
          "encode_seconds_diagnostic": 0.05224875011481345,
          "decode_seconds_diagnostic": 0.1671532078180462,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7709615,
          "fraction": 0.9190577268600464,
          "encode_seconds_diagnostic": 0.10804804181680083,
          "decode_seconds_diagnostic": 0.22912695887498558,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7721354,
          "fraction": 0.920457124710083,
          "encode_seconds_diagnostic": 0.058415708132088184,
          "decode_seconds_diagnostic": 0.17397783393971622,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "experts",
        "weights"
      ],
      "population_bytes": 60397977600,
      "sample_index": 9,
      "tensor": {
        "file": "model-00008.safetensors",
        "name": "language_model.model.layers.35.mlp.switch_mlp.down_proj.weight",
        "dtype": "U32",
        "shape": [
          512,
          2560,
          80
        ],
        "offset": 2671972795,
        "size": 419430400,
        "group": "experts"
      },
      "offset": 97561088,
      "size_per_tensor": 8388608,
      "sha256": "8ff399a309a20c4917fdc14ea1470359a9a2f7f15ecb251633ea9c0ead61e892",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7815616,
          "fraction": 0.9316940307617188,
          "encode_seconds_diagnostic": 0.007261084159836173,
          "decode_seconds_diagnostic": 0.006004999857395887,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 7815940,
          "fraction": 0.9317326545715332,
          "encode_seconds_diagnostic": 0.45212012506090105,
          "decode_seconds_diagnostic": 0.006069459021091461,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7776039,
          "fraction": 0.9269760847091675,
          "encode_seconds_diagnostic": 0.023376750061288476,
          "decode_seconds_diagnostic": 0.02278233296237886,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7732963,
          "fraction": 0.921841025352478,
          "encode_seconds_diagnostic": 0.09923745784908533,
          "decode_seconds_diagnostic": 0.22080312483012676,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7735116,
          "fraction": 0.9220976829528809,
          "encode_seconds_diagnostic": 0.05210116715170443,
          "decode_seconds_diagnostic": 0.1674540841486305,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7723181,
          "fraction": 0.9206749200820923,
          "encode_seconds_diagnostic": 0.11329429084435105,
          "decode_seconds_diagnostic": 0.2367226250935346,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7739828,
          "fraction": 0.9226593971252441,
          "encode_seconds_diagnostic": 0.06433912483043969,
          "decode_seconds_diagnostic": 0.17948691686615348,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "experts",
        "weights"
      ],
      "population_bytes": 60397977600,
      "sample_index": 10,
      "tensor": {
        "file": "model-00008.safetensors",
        "name": "language_model.model.layers.36.mlp.switch_mlp.down_proj.weight",
        "dtype": "U32",
        "shape": [
          512,
          2560,
          80
        ],
        "offset": 3615056411,
        "size": 419430400,
        "group": "experts"
      },
      "offset": 354771712,
      "size_per_tensor": 8388608,
      "sha256": "608a4434caa9f0c9872615918cc4f8aa0c500bc9082f0f576dc6ebb1cf719a7d",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7831065,
          "fraction": 0.9335356950759888,
          "encode_seconds_diagnostic": 0.007212709169834852,
          "decode_seconds_diagnostic": 0.00598637480288744,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 7830066,
          "fraction": 0.9334166049957275,
          "encode_seconds_diagnostic": 0.4547382078599185,
          "decode_seconds_diagnostic": 0.006289832992479205,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7796583,
          "fraction": 0.9294251203536987,
          "encode_seconds_diagnostic": 0.025248500052839518,
          "decode_seconds_diagnostic": 0.0232078330591321,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7751388,
          "fraction": 0.9240374565124512,
          "encode_seconds_diagnostic": 0.10134433396160603,
          "decode_seconds_diagnostic": 0.22192529099993408,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7753473,
          "fraction": 0.9242860078811646,
          "encode_seconds_diagnostic": 0.053173416992649436,
          "decode_seconds_diagnostic": 0.16921345796436071,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7740182,
          "fraction": 0.9227015972137451,
          "encode_seconds_diagnostic": 0.11188891693018377,
          "decode_seconds_diagnostic": 0.2317557919304818,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7754672,
          "fraction": 0.9244289398193359,
          "encode_seconds_diagnostic": 0.06150824995711446,
          "decode_seconds_diagnostic": 0.17822095891460776,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "experts",
        "weights"
      ],
      "population_bytes": 60397977600,
      "sample_index": 11,
      "tensor": {
        "file": "model-00009.safetensors",
        "name": "language_model.model.layers.4.mlp.switch_mlp.up_proj.weight",
        "dtype": "U32",
        "shape": [
          512,
          640,
          320
        ],
        "offset": 8578254508,
        "size": 419430400,
        "group": "experts"
      },
      "offset": 347064832,
      "size_per_tensor": 8388608,
      "sha256": "5a529910341b7ee511feb419e86b0a9e9dc950439dd96c41325517de699008e3",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7789440,
          "fraction": 0.9285736083984375,
          "encode_seconds_diagnostic": 0.007015208015218377,
          "decode_seconds_diagnostic": 0.006016208091750741,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 7789856,
          "fraction": 0.9286231994628906,
          "encode_seconds_diagnostic": 0.44731966708786786,
          "decode_seconds_diagnostic": 0.0060762090142816305,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7743557,
          "fraction": 0.923103928565979,
          "encode_seconds_diagnostic": 0.022886165883392096,
          "decode_seconds_diagnostic": 0.022762374952435493,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7701921,
          "fraction": 0.9181405305862427,
          "encode_seconds_diagnostic": 0.09969529090449214,
          "decode_seconds_diagnostic": 0.2211747921537608,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7704035,
          "fraction": 0.918392539024353,
          "encode_seconds_diagnostic": 0.05249370797537267,
          "decode_seconds_diagnostic": 0.16800358286127448,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7681064,
          "fraction": 0.915654182434082,
          "encode_seconds_diagnostic": 0.11044566705822945,
          "decode_seconds_diagnostic": 0.2313662921078503,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7694524,
          "fraction": 0.9172587394714355,
          "encode_seconds_diagnostic": 0.061380666913464665,
          "decode_seconds_diagnostic": 0.17652437486685812,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "experts",
        "weights"
      ],
      "population_bytes": 60397977600,
      "sample_index": 12,
      "tensor": {
        "file": "model-00009.safetensors",
        "name": "language_model.model.layers.42.mlp.switch_mlp.down_proj.weight",
        "dtype": "U32",
        "shape": [
          512,
          2560,
          80
        ],
        "offset": 6688769004,
        "size": 419430400,
        "group": "experts"
      },
      "offset": 131640320,
      "size_per_tensor": 8388608,
      "sha256": "08380de57bf8534b513a26b1ddd1651e6e0cf0b6e006a15b8960dc7acf0c6b63",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7823734,
          "fraction": 0.932661771774292,
          "encode_seconds_diagnostic": 0.007084957789629698,
          "decode_seconds_diagnostic": 0.006022542016580701,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 7823137,
          "fraction": 0.9325906038284302,
          "encode_seconds_diagnostic": 0.4452779998537153,
          "decode_seconds_diagnostic": 0.006106459069997072,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7786984,
          "fraction": 0.9282808303833008,
          "encode_seconds_diagnostic": 0.023530500009655952,
          "decode_seconds_diagnostic": 0.022816249867901206,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7741914,
          "fraction": 0.9229080677032471,
          "encode_seconds_diagnostic": 0.0995954170357436,
          "decode_seconds_diagnostic": 0.22089062491431832,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7744069,
          "fraction": 0.923164963722229,
          "encode_seconds_diagnostic": 0.05252145789563656,
          "decode_seconds_diagnostic": 0.16821220889687538,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7726452,
          "fraction": 0.9210648536682129,
          "encode_seconds_diagnostic": 0.1115257500205189,
          "decode_seconds_diagnostic": 0.23372908402234316,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7740758,
          "fraction": 0.9227702617645264,
          "encode_seconds_diagnostic": 0.062188792042434216,
          "decode_seconds_diagnostic": 0.17722816695459187,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "experts",
        "weights"
      ],
      "population_bytes": 60397977600,
      "sample_index": 13,
      "tensor": {
        "file": "model-00009.safetensors",
        "name": "language_model.model.layers.44.mlp.switch_mlp.down_proj.weight",
        "dtype": "U32",
        "shape": [
          512,
          2560,
          80
        ],
        "offset": 7123579884,
        "size": 419430400,
        "group": "experts"
      },
      "offset": 410518784,
      "size_per_tensor": 8388608,
      "sha256": "380a87b78de93ab7aef8ad90ee72467b683f11e1f0f1d9c2c166d73dbbf1b3c7",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7832240,
          "fraction": 0.9336757659912109,
          "encode_seconds_diagnostic": 0.007320583797991276,
          "decode_seconds_diagnostic": 0.006004999857395887,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 7830077,
          "fraction": 0.9334179162979126,
          "encode_seconds_diagnostic": 0.44268358312547207,
          "decode_seconds_diagnostic": 0.006102583836764097,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7796640,
          "fraction": 0.9294319152832031,
          "encode_seconds_diagnostic": 0.02318612509407103,
          "decode_seconds_diagnostic": 0.023039875086396933,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7752101,
          "fraction": 0.9241224527359009,
          "encode_seconds_diagnostic": 0.09933687513694167,
          "decode_seconds_diagnostic": 0.22131654201075435,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7754268,
          "fraction": 0.9243807792663574,
          "encode_seconds_diagnostic": 0.05242645810358226,
          "decode_seconds_diagnostic": 0.16750424983911216,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7738682,
          "fraction": 0.922522783279419,
          "encode_seconds_diagnostic": 0.10960491700097919,
          "decode_seconds_diagnostic": 0.23158104112371802,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7752454,
          "fraction": 0.9241645336151123,
          "encode_seconds_diagnostic": 0.06121970806270838,
          "decode_seconds_diagnostic": 0.17660037497989833,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "experts",
        "weights"
      ],
      "population_bytes": 60397977600,
      "sample_index": 14,
      "tensor": {
        "file": "model-00010.safetensors",
        "name": "language_model.model.layers.6.mlp.switch_mlp.down_proj.weight",
        "dtype": "U32",
        "shape": [
          512,
          2560,
          80
        ],
        "offset": 1122001106,
        "size": 419430400,
        "group": "experts"
      },
      "offset": 194616320,
      "size_per_tensor": 8388608,
      "sha256": "b82cc4d0e4e951735d9035162a9b770b94a2c0219c9c7cc263e27d0ae3532131",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7825390,
          "fraction": 0.9328591823577881,
          "encode_seconds_diagnostic": 0.007297875126823783,
          "decode_seconds_diagnostic": 0.006000374909490347,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 7824533,
          "fraction": 0.9327570199966431,
          "encode_seconds_diagnostic": 0.44298091693781316,
          "decode_seconds_diagnostic": 0.006108416011556983,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7791690,
          "fraction": 0.9288418292999268,
          "encode_seconds_diagnostic": 0.023487166967242956,
          "decode_seconds_diagnostic": 0.024602832971140742,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7746282,
          "fraction": 0.9234287738800049,
          "encode_seconds_diagnostic": 0.10015354095958173,
          "decode_seconds_diagnostic": 0.2209511660039425,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7748379,
          "fraction": 0.9236787557601929,
          "encode_seconds_diagnostic": 0.05249358410947025,
          "decode_seconds_diagnostic": 0.167518958915025,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7732338,
          "fraction": 0.9217665195465088,
          "encode_seconds_diagnostic": 0.11103712487965822,
          "decode_seconds_diagnostic": 0.2332574580796063,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7747171,
          "fraction": 0.9235347509384155,
          "encode_seconds_diagnostic": 0.06244891695678234,
          "decode_seconds_diagnostic": 0.17775820894166827,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "experts",
        "weights"
      ],
      "population_bytes": 60397977600,
      "sample_index": 15,
      "tensor": {
        "file": "model-00010.safetensors",
        "name": "language_model.model.layers.7.mlp.switch_mlp.down_proj.weight",
        "dtype": "U32",
        "shape": [
          512,
          2560,
          80
        ],
        "offset": 8410611570,
        "size": 419430400,
        "group": "experts"
      },
      "offset": 76578816,
      "size_per_tensor": 8388608,
      "sha256": "f4e3eef9369d495c4d88ac2fbcee36abaf0f985fc0784727950ce186761ec70e",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7833343,
          "fraction": 0.9338072538375854,
          "encode_seconds_diagnostic": 0.00727875018492341,
          "decode_seconds_diagnostic": 0.006031041033565998,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 7832883,
          "fraction": 0.9337524175643921,
          "encode_seconds_diagnostic": 0.448062791954726,
          "decode_seconds_diagnostic": 0.0060864591505378485,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7799479,
          "fraction": 0.9297703504562378,
          "encode_seconds_diagnostic": 0.023134500021114945,
          "decode_seconds_diagnostic": 0.022795791970565915,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7754942,
          "fraction": 0.9244611263275146,
          "encode_seconds_diagnostic": 0.0991970831528306,
          "decode_seconds_diagnostic": 0.22069720807485282,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7757020,
          "fraction": 0.9247088432312012,
          "encode_seconds_diagnostic": 0.051910792011767626,
          "decode_seconds_diagnostic": 0.16756749991327524,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7741395,
          "fraction": 0.9228461980819702,
          "encode_seconds_diagnostic": 0.11048924992792308,
          "decode_seconds_diagnostic": 0.2318719590548426,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7755001,
          "fraction": 0.9244681596755981,
          "encode_seconds_diagnostic": 0.061208791099488735,
          "decode_seconds_diagnostic": 0.1765275839716196,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "mtp",
        "bf16"
      ],
      "population_bytes": 6155776,
      "sample_index": 0,
      "tensor": {
        "file": "mtp.safetensors",
        "name": "mtp.layers.0.mlp.gate.weight",
        "dtype": "BF16",
        "shape": [
          512,
          2560
        ],
        "offset": 1466470051,
        "size": 2621440,
        "group": "mtp"
      },
      "offset": 0,
      "size_per_tensor": 2621440,
      "sha256": "f0d35fa41b360a08bc0c5b1e5766aa42df960291716ee189208b5d2599462c20",
      "original_bytes": 2621440,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 2621440,
          "compressed_bytes": 2066961,
          "fraction": 0.7884830474853516,
          "encode_seconds_diagnostic": 0.0021322080865502357,
          "decode_seconds_diagnostic": 0.0020721249748021364,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 2621440,
          "compressed_bytes": 1783808,
          "fraction": 0.68046875,
          "encode_seconds_diagnostic": 0.2082877499051392,
          "decode_seconds_diagnostic": 0.003477750113233924,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd19",
          "original_bytes": 2621440,
          "compressed_bytes": 1918803,
          "fraction": 0.7319652557373046,
          "encode_seconds_diagnostic": 0.07263387506827712,
          "decode_seconds_diagnostic": 0.008908332791179419,
          "roundtrip_exact": true
        },
        {
          "method": "ans",
          "original_bytes": 2621440,
          "compressed_bytes": 1759044,
          "fraction": 0.6710220336914062,
          "encode_seconds_diagnostic": 0.007371457992121577,
          "decode_seconds_diagnostic": 0.044142541009932756,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "mtp",
        "bf16"
      ],
      "population_bytes": 6155776,
      "sample_index": 1,
      "tensor": {
        "file": "mtp.safetensors",
        "name": "mtp.layers.0.mlp.gate.weight",
        "dtype": "BF16",
        "shape": [
          512,
          2560
        ],
        "offset": 1466470051,
        "size": 2621440,
        "group": "mtp"
      },
      "offset": 0,
      "size_per_tensor": 2621440,
      "sha256": "f0d35fa41b360a08bc0c5b1e5766aa42df960291716ee189208b5d2599462c20",
      "original_bytes": 2621440,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 2621440,
          "compressed_bytes": 2066961,
          "fraction": 0.7884830474853516,
          "encode_seconds_diagnostic": 0.001966708106920123,
          "decode_seconds_diagnostic": 0.001938709057867527,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 2621440,
          "compressed_bytes": 1783808,
          "fraction": 0.68046875,
          "encode_seconds_diagnostic": 0.20838679186999798,
          "decode_seconds_diagnostic": 0.003067291108891368,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd19",
          "original_bytes": 2621440,
          "compressed_bytes": 1918803,
          "fraction": 0.7319652557373046,
          "encode_seconds_diagnostic": 0.07194850011728704,
          "decode_seconds_diagnostic": 0.008748000022023916,
          "roundtrip_exact": true
        },
        {
          "method": "ans",
          "original_bytes": 2621440,
          "compressed_bytes": 1759044,
          "fraction": 0.6710220336914062,
          "encode_seconds_diagnostic": 0.007373834028840065,
          "decode_seconds_diagnostic": 0.04405895806849003,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "mtp",
        "bf16"
      ],
      "population_bytes": 6155776,
      "sample_index": 2,
      "tensor": {
        "file": "mtp.safetensors",
        "name": "mtp.layers.0.mlp.gate.weight",
        "dtype": "BF16",
        "shape": [
          512,
          2560
        ],
        "offset": 1466470051,
        "size": 2621440,
        "group": "mtp"
      },
      "offset": 0,
      "size_per_tensor": 2621440,
      "sha256": "f0d35fa41b360a08bc0c5b1e5766aa42df960291716ee189208b5d2599462c20",
      "original_bytes": 2621440,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 2621440,
          "compressed_bytes": 2066961,
          "fraction": 0.7884830474853516,
          "encode_seconds_diagnostic": 0.001962166978046298,
          "decode_seconds_diagnostic": 0.0019263748545199633,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 2621440,
          "compressed_bytes": 1783808,
          "fraction": 0.68046875,
          "encode_seconds_diagnostic": 0.20579270902089775,
          "decode_seconds_diagnostic": 0.0030768748838454485,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd19",
          "original_bytes": 2621440,
          "compressed_bytes": 1918803,
          "fraction": 0.7319652557373046,
          "encode_seconds_diagnostic": 0.07236199988983572,
          "decode_seconds_diagnostic": 0.008695417083799839,
          "roundtrip_exact": true
        },
        {
          "method": "ans",
          "original_bytes": 2621440,
          "compressed_bytes": 1759044,
          "fraction": 0.6710220336914062,
          "encode_seconds_diagnostic": 0.007366957841441035,
          "decode_seconds_diagnostic": 0.04395724995993078,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "mtp",
        "bf16"
      ],
      "population_bytes": 6155776,
      "sample_index": 3,
      "tensor": {
        "file": "mtp.safetensors",
        "name": "mtp.layers.0.self_attn.indexer.index_qk_proj.weight",
        "dtype": "BF16",
        "shape": [
          640,
          2560
        ],
        "offset": 27534755,
        "size": 3276800,
        "group": "mtp"
      },
      "offset": 0,
      "size_per_tensor": 3276800,
      "sha256": "2befafae6e944c1fc651fd73d4d527eb6f138a6c1679065b003128ee3150e859",
      "original_bytes": 3276800,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 3276800,
          "compressed_bytes": 2578357,
          "fraction": 0.7868521118164062,
          "encode_seconds_diagnostic": 0.0025647080037742853,
          "decode_seconds_diagnostic": 0.0025190419983118773,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 3276800,
          "compressed_bytes": 2279164,
          "fraction": 0.695545654296875,
          "encode_seconds_diagnostic": 0.2788399579003453,
          "decode_seconds_diagnostic": 0.00549095799215138,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd19",
          "original_bytes": 3276800,
          "compressed_bytes": 2378132,
          "fraction": 0.725748291015625,
          "encode_seconds_diagnostic": 0.0900006250012666,
          "decode_seconds_diagnostic": 0.010815459070727229,
          "roundtrip_exact": true
        },
        {
          "method": "ans",
          "original_bytes": 3276800,
          "compressed_bytes": 2189989,
          "fraction": 0.6683316040039062,
          "encode_seconds_diagnostic": 0.009171499870717525,
          "decode_seconds_diagnostic": 0.055139790987595916,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "mtp",
        "bf16"
      ],
      "population_bytes": 6155776,
      "sample_index": 4,
      "tensor": {
        "file": "mtp.safetensors",
        "name": "mtp.layers.0.self_attn.indexer.index_qk_proj.weight",
        "dtype": "BF16",
        "shape": [
          640,
          2560
        ],
        "offset": 27534755,
        "size": 3276800,
        "group": "mtp"
      },
      "offset": 0,
      "size_per_tensor": 3276800,
      "sha256": "2befafae6e944c1fc651fd73d4d527eb6f138a6c1679065b003128ee3150e859",
      "original_bytes": 3276800,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 3276800,
          "compressed_bytes": 2578357,
          "fraction": 0.7868521118164062,
          "encode_seconds_diagnostic": 0.0024937500711530447,
          "decode_seconds_diagnostic": 0.002390500158071518,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 3276800,
          "compressed_bytes": 2279164,
          "fraction": 0.695545654296875,
          "encode_seconds_diagnostic": 0.277470292057842,
          "decode_seconds_diagnostic": 0.0048423339612782,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd19",
          "original_bytes": 3276800,
          "compressed_bytes": 2378132,
          "fraction": 0.725748291015625,
          "encode_seconds_diagnostic": 0.09205262502655387,
          "decode_seconds_diagnostic": 0.010611458914354444,
          "roundtrip_exact": true
        },
        {
          "method": "ans",
          "original_bytes": 3276800,
          "compressed_bytes": 2189989,
          "fraction": 0.6683316040039062,
          "encode_seconds_diagnostic": 0.0092102091293782,
          "decode_seconds_diagnostic": 0.055032792035490274,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "mtp",
        "bf16"
      ],
      "population_bytes": 6155776,
      "sample_index": 5,
      "tensor": {
        "file": "mtp.safetensors",
        "name": "mtp.layers.0.self_attn.indexer.index_qk_proj.weight",
        "dtype": "BF16",
        "shape": [
          640,
          2560
        ],
        "offset": 27534755,
        "size": 3276800,
        "group": "mtp"
      },
      "offset": 0,
      "size_per_tensor": 3276800,
      "sha256": "2befafae6e944c1fc651fd73d4d527eb6f138a6c1679065b003128ee3150e859",
      "original_bytes": 3276800,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 3276800,
          "compressed_bytes": 2578357,
          "fraction": 0.7868521118164062,
          "encode_seconds_diagnostic": 0.002500208094716072,
          "decode_seconds_diagnostic": 0.00239145802333951,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 3276800,
          "compressed_bytes": 2279164,
          "fraction": 0.695545654296875,
          "encode_seconds_diagnostic": 0.2774753328412771,
          "decode_seconds_diagnostic": 0.00483179185539484,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd19",
          "original_bytes": 3276800,
          "compressed_bytes": 2378132,
          "fraction": 0.725748291015625,
          "encode_seconds_diagnostic": 0.09098433307372034,
          "decode_seconds_diagnostic": 0.010622916975989938,
          "roundtrip_exact": true
        },
        {
          "method": "ans",
          "original_bytes": 3276800,
          "compressed_bytes": 2189989,
          "fraction": 0.6683316040039062,
          "encode_seconds_diagnostic": 0.00916258292272687,
          "decode_seconds_diagnostic": 0.05492308386601508,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "mtp",
        "pairs"
      ],
      "population_bytes": 162754560,
      "sample_index": 0,
      "tensor": {
        "file": "mtp.safetensors",
        "name": "mtp.layers.0.mlp.switch_mlp.down_proj.scales",
        "dtype": "BF16",
        "shape": [
          512,
          2560,
          10
        ],
        "offset": 586055331,
        "size": 26214400,
        "group": "mtp"
      },
      "offset": 3483136,
      "size_per_tensor": 4194304,
      "sha256": "e3af76b60a8631b86b454eb320efd577add16357aba3aa82cd97b772429dd43d",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5346453,
          "fraction": 0.6373468637466431,
          "encode_seconds_diagnostic": 0.026581416139379144,
          "decode_seconds_diagnostic": 0.007167750038206577,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4503204,
          "fraction": 0.5368237495422363,
          "encode_seconds_diagnostic": 1.1702089998871088,
          "decode_seconds_diagnostic": 0.012968833092600107,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 3000956,
          "fraction": 0.3577418327331543,
          "encode_seconds_diagnostic": 0.02002699999138713,
          "decode_seconds_diagnostic": 0.0191539169754833,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 2915090,
          "fraction": 0.3475058078765869,
          "encode_seconds_diagnostic": 0.08666195790283382,
          "decode_seconds_diagnostic": 0.017131500178948045,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2731203,
          "fraction": 0.3255847692489624,
          "encode_seconds_diagnostic": 1.481643999926746,
          "decode_seconds_diagnostic": 0.016051582992076874,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2519086,
          "fraction": 0.30029845237731934,
          "encode_seconds_diagnostic": 0.04440141702070832,
          "decode_seconds_diagnostic": 0.18094933312386274,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "mtp",
        "pairs"
      ],
      "population_bytes": 162754560,
      "sample_index": 1,
      "tensor": {
        "file": "mtp.safetensors",
        "name": "mtp.layers.0.mlp.switch_mlp.down_proj.scales",
        "dtype": "BF16",
        "shape": [
          512,
          2560,
          10
        ],
        "offset": 586055331,
        "size": 26214400,
        "group": "mtp"
      },
      "offset": 21822208,
      "size_per_tensor": 4194304,
      "sha256": "2d94af3f3ad3754318ff505b3ebd74ac6dd8cfe7b8c2680587c063e4b05fbb8c",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5355430,
          "fraction": 0.6384170055389404,
          "encode_seconds_diagnostic": 0.027520708041265607,
          "decode_seconds_diagnostic": 0.0072575409431010485,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4515093,
          "fraction": 0.5382410287857056,
          "encode_seconds_diagnostic": 1.1955675829667598,
          "decode_seconds_diagnostic": 0.012999082915484905,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 3004828,
          "fraction": 0.3582034111022949,
          "encode_seconds_diagnostic": 0.019696792121976614,
          "decode_seconds_diagnostic": 0.017787415999919176,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 2922071,
          "fraction": 0.3483380079269409,
          "encode_seconds_diagnostic": 0.08760474994778633,
          "decode_seconds_diagnostic": 0.017546250019222498,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2735256,
          "fraction": 0.3260679244995117,
          "encode_seconds_diagnostic": 1.5963542500976473,
          "decode_seconds_diagnostic": 0.01626649987883866,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2527074,
          "fraction": 0.301250696182251,
          "encode_seconds_diagnostic": 0.045862791826948524,
          "decode_seconds_diagnostic": 0.18257650011219084,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "mtp",
        "pairs"
      ],
      "population_bytes": 162754560,
      "sample_index": 2,
      "tensor": {
        "file": "mtp.safetensors",
        "name": "mtp.layers.0.mlp.switch_mlp.gate_proj.scales",
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "offset": 30913955,
        "size": 26214400,
        "group": "mtp"
      },
      "offset": 2414336,
      "size_per_tensor": 4194304,
      "sha256": "da408a6bdc579aee426d3d11b8806d594a165f83d445e5861bf5b397d807618a",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5366321,
          "fraction": 0.639715313911438,
          "encode_seconds_diagnostic": 0.02721741609275341,
          "decode_seconds_diagnostic": 0.007470957934856415,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4524442,
          "fraction": 0.5393555164337158,
          "encode_seconds_diagnostic": 1.2756250840611756,
          "decode_seconds_diagnostic": 0.01755004096776247,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 3029793,
          "fraction": 0.3611794710159302,
          "encode_seconds_diagnostic": 0.02152308402583003,
          "decode_seconds_diagnostic": 0.02033995813690126,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 2944436,
          "fraction": 0.35100412368774414,
          "encode_seconds_diagnostic": 0.09324437496252358,
          "decode_seconds_diagnostic": 0.01801295904442668,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2767171,
          "fraction": 0.3298724889755249,
          "encode_seconds_diagnostic": 1.7747067909222096,
          "decode_seconds_diagnostic": 0.018357709050178528,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2554277,
          "fraction": 0.3044935464859009,
          "encode_seconds_diagnostic": 0.04803504212759435,
          "decode_seconds_diagnostic": 0.18988783401437104,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "mtp",
        "pairs"
      ],
      "population_bytes": 162754560,
      "sample_index": 3,
      "tensor": {
        "file": "mtp.safetensors",
        "name": "mtp.layers.0.mlp.switch_mlp.gate_proj.scales",
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "offset": 30913955,
        "size": 26214400,
        "group": "mtp"
      },
      "offset": 14696448,
      "size_per_tensor": 4194304,
      "sha256": "1612490dc8fce57d2f84e8cfb222dd3c8943ca3213390622a30bbd42170fed94",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5367393,
          "fraction": 0.6398431062698364,
          "encode_seconds_diagnostic": 0.0293226249050349,
          "decode_seconds_diagnostic": 0.007423209026455879,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4523987,
          "fraction": 0.5393012762069702,
          "encode_seconds_diagnostic": 1.401009207824245,
          "decode_seconds_diagnostic": 0.013514833059161901,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 3033811,
          "fraction": 0.3616584539413452,
          "encode_seconds_diagnostic": 0.02064295904710889,
          "decode_seconds_diagnostic": 0.019940792117267847,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 2947879,
          "fraction": 0.3514145612716675,
          "encode_seconds_diagnostic": 0.09368612500838935,
          "decode_seconds_diagnostic": 0.019039874896407127,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2761153,
          "fraction": 0.3291550874710083,
          "encode_seconds_diagnostic": 1.6771229580044746,
          "decode_seconds_diagnostic": 0.0174407078884542,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2557627,
          "fraction": 0.304892897605896,
          "encode_seconds_diagnostic": 0.047716249944642186,
          "decode_seconds_diagnostic": 0.1858054578769952,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "mtp",
        "pairs"
      ],
      "population_bytes": 162754560,
      "sample_index": 4,
      "tensor": {
        "file": "mtp.safetensors",
        "name": "mtp.layers.0.mlp.switch_mlp.up_proj.scales",
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "offset": 87879075,
        "size": 26214400,
        "group": "mtp"
      },
      "offset": 16764928,
      "size_per_tensor": 4194304,
      "sha256": "dcd8f2093640d55be77b5add903adb3379d47eb63a093882c5d6cfc04a23f5a1",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5362671,
          "fraction": 0.6392802000045776,
          "encode_seconds_diagnostic": 0.029444374842569232,
          "decode_seconds_diagnostic": 0.007893250091001391,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4518887,
          "fraction": 0.5386933088302612,
          "encode_seconds_diagnostic": 1.4940345829818398,
          "decode_seconds_diagnostic": 0.01462891697883606,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 3025656,
          "fraction": 0.3606863021850586,
          "encode_seconds_diagnostic": 0.02165941707789898,
          "decode_seconds_diagnostic": 0.01933504198677838,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 2942339,
          "fraction": 0.35075414180755615,
          "encode_seconds_diagnostic": 0.09366495907306671,
          "decode_seconds_diagnostic": 0.018260333919897676,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2757500,
          "fraction": 0.3287196159362793,
          "encode_seconds_diagnostic": 1.7366882499773055,
          "decode_seconds_diagnostic": 0.016975332982838154,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2527888,
          "fraction": 0.3013477325439453,
          "encode_seconds_diagnostic": 0.044941750122234225,
          "decode_seconds_diagnostic": 0.18224620795808733,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "mtp",
        "pairs"
      ],
      "population_bytes": 162754560,
      "sample_index": 5,
      "tensor": {
        "file": "mtp.safetensors",
        "name": "mtp.layers.0.mlp.switch_mlp.up_proj.scales",
        "dtype": "BF16",
        "shape": [
          512,
          640,
          40
        ],
        "offset": 87879075,
        "size": 26214400,
        "group": "mtp"
      },
      "offset": 19645440,
      "size_per_tensor": 4194304,
      "sha256": "5a334139a01ecd68c3396ebccd73f9fe3953699fb644b3c7b368d462c9fc8bc5",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5417724,
          "fraction": 0.6458430290222168,
          "encode_seconds_diagnostic": 0.026024999795481563,
          "decode_seconds_diagnostic": 0.007203332846984267,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4571838,
          "fraction": 0.5450055599212646,
          "encode_seconds_diagnostic": 1.2664982078131288,
          "decode_seconds_diagnostic": 0.013684917008504272,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 3063195,
          "fraction": 0.36516129970550537,
          "encode_seconds_diagnostic": 0.0210420829243958,
          "decode_seconds_diagnostic": 0.018704500049352646,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 2981865,
          "fraction": 0.35546600818634033,
          "encode_seconds_diagnostic": 0.09113462502136827,
          "decode_seconds_diagnostic": 0.018008582992479205,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2798796,
          "fraction": 0.33364248275756836,
          "encode_seconds_diagnostic": 1.6921971670817584,
          "decode_seconds_diagnostic": 0.016597416950389743,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2560892,
          "fraction": 0.3052821159362793,
          "encode_seconds_diagnostic": 0.04520795796997845,
          "decode_seconds_diagnostic": 0.18538537505082786,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "mtp",
        "weights"
      ],
      "population_bytes": 1302036480,
      "sample_index": 0,
      "tensor": {
        "file": "mtp.safetensors",
        "name": "mtp.layers.0.mlp.switch_mlp.down_proj.weight",
        "dtype": "U32",
        "shape": [
          512,
          2560,
          80
        ],
        "offset": 612269731,
        "size": 419430400,
        "group": "mtp"
      },
      "offset": 26038784,
      "size_per_tensor": 8388608,
      "sha256": "1976ac10a04461a63c70c0bbd7b9facdd2f71ab526b2410d5f9f1b8681326752",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7811378,
          "fraction": 0.9311888217926025,
          "encode_seconds_diagnostic": 0.007564333034679294,
          "decode_seconds_diagnostic": 0.006061542080715299,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 7809995,
          "fraction": 0.9310239553451538,
          "encode_seconds_diagnostic": 0.5215786669868976,
          "decode_seconds_diagnostic": 0.006574833067134023,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7767191,
          "fraction": 0.9259213209152222,
          "encode_seconds_diagnostic": 0.029804958030581474,
          "decode_seconds_diagnostic": 0.02582716685719788,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7723241,
          "fraction": 0.9206820726394653,
          "encode_seconds_diagnostic": 0.10347125004045665,
          "decode_seconds_diagnostic": 0.2328163341153413,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7725355,
          "fraction": 0.9209340810775757,
          "encode_seconds_diagnostic": 0.05476037482731044,
          "decode_seconds_diagnostic": 0.16870270785875618,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7707939,
          "fraction": 0.9188579320907593,
          "encode_seconds_diagnostic": 0.12009187508374453,
          "decode_seconds_diagnostic": 0.23603712487965822,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7725253,
          "fraction": 0.9209219217300415,
          "encode_seconds_diagnostic": 0.06608941708691418,
          "decode_seconds_diagnostic": 0.18355800001882017,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "mtp",
        "weights"
      ],
      "population_bytes": 1302036480,
      "sample_index": 1,
      "tensor": {
        "file": "mtp.safetensors",
        "name": "mtp.layers.0.mlp.switch_mlp.down_proj.weight",
        "dtype": "U32",
        "shape": [
          512,
          2560,
          80
        ],
        "offset": 612269731,
        "size": 419430400,
        "group": "mtp"
      },
      "offset": 99217920,
      "size_per_tensor": 8388608,
      "sha256": "dd007c54553e15a9d57878cafb7a141ac30d47aedf7cf97695f9b30a13ca950c",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7804480,
          "fraction": 0.9303665161132812,
          "encode_seconds_diagnostic": 0.007253166055306792,
          "decode_seconds_diagnostic": 0.006152250105515122,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 7804544,
          "fraction": 0.9303741455078125,
          "encode_seconds_diagnostic": 0.5266627080272883,
          "decode_seconds_diagnostic": 0.006369833135977387,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7759888,
          "fraction": 0.9250507354736328,
          "encode_seconds_diagnostic": 0.025889499811455607,
          "decode_seconds_diagnostic": 0.024902709061279893,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7715567,
          "fraction": 0.9197672605514526,
          "encode_seconds_diagnostic": 0.10327524994499981,
          "decode_seconds_diagnostic": 0.2221255418844521,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7717694,
          "fraction": 0.9200208187103271,
          "encode_seconds_diagnostic": 0.05436704191379249,
          "decode_seconds_diagnostic": 0.1694726669229567,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7699762,
          "fraction": 0.9178831577301025,
          "encode_seconds_diagnostic": 0.1165681672282517,
          "decode_seconds_diagnostic": 0.2398914590012282,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7717386,
          "fraction": 0.9199841022491455,
          "encode_seconds_diagnostic": 0.0670745421666652,
          "decode_seconds_diagnostic": 0.18408558308146894,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "mtp",
        "weights"
      ],
      "population_bytes": 1302036480,
      "sample_index": 2,
      "tensor": {
        "file": "mtp.safetensors",
        "name": "mtp.layers.0.mlp.switch_mlp.gate_proj.weight",
        "dtype": "U32",
        "shape": [
          512,
          640,
          320
        ],
        "offset": 140307875,
        "size": 419430400,
        "group": "mtp"
      },
      "offset": 62955520,
      "size_per_tensor": 8388608,
      "sha256": "9f995cb1db64fe43262ce447080c2dbc8b88752f9917ec2b2dc5dfa6acbee57f",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7785156,
          "fraction": 0.928062915802002,
          "encode_seconds_diagnostic": 0.008560792077332735,
          "decode_seconds_diagnostic": 0.006424542050808668,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 7783725,
          "fraction": 0.9278923273086548,
          "encode_seconds_diagnostic": 0.4765068329870701,
          "decode_seconds_diagnostic": 0.006133832968771458,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7725309,
          "fraction": 0.9209285974502563,
          "encode_seconds_diagnostic": 0.022972792154178023,
          "decode_seconds_diagnostic": 0.022530582966282964,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7678526,
          "fraction": 0.9153516292572021,
          "encode_seconds_diagnostic": 0.10093537508510053,
          "decode_seconds_diagnostic": 0.22568833292461932,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7680663,
          "fraction": 0.9156063795089722,
          "encode_seconds_diagnostic": 0.05323758302256465,
          "decode_seconds_diagnostic": 0.17063316609710455,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7657188,
          "fraction": 0.9128079414367676,
          "encode_seconds_diagnostic": 0.11605220893397927,
          "decode_seconds_diagnostic": 0.23902420816011727,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7674128,
          "fraction": 0.9148273468017578,
          "encode_seconds_diagnostic": 0.06790641695261002,
          "decode_seconds_diagnostic": 0.18231200007721782,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "mtp",
        "weights"
      ],
      "population_bytes": 1302036480,
      "sample_index": 3,
      "tensor": {
        "file": "mtp.safetensors",
        "name": "mtp.layers.0.mlp.switch_mlp.gate_proj.weight",
        "dtype": "U32",
        "shape": [
          512,
          640,
          320
        ],
        "offset": 140307875,
        "size": 419430400,
        "group": "mtp"
      },
      "offset": 171906304,
      "size_per_tensor": 8388608,
      "sha256": "1f768d900c46cafe468ba1ab19ec2a5b111de146e5a6f7c8098e7c3764540433",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7774004,
          "fraction": 0.9267334938049316,
          "encode_seconds_diagnostic": 0.007289249915629625,
          "decode_seconds_diagnostic": 0.006071583833545446,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 7773853,
          "fraction": 0.9267154932022095,
          "encode_seconds_diagnostic": 0.4737381669692695,
          "decode_seconds_diagnostic": 0.006316374987363815,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7714617,
          "fraction": 0.9196540117263794,
          "encode_seconds_diagnostic": 0.023416166892275214,
          "decode_seconds_diagnostic": 0.02346095908433199,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7666448,
          "fraction": 0.9139118194580078,
          "encode_seconds_diagnostic": 0.10201699985191226,
          "decode_seconds_diagnostic": 0.22344295913353562,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7668580,
          "fraction": 0.9141659736633301,
          "encode_seconds_diagnostic": 0.05485804216004908,
          "decode_seconds_diagnostic": 0.170509957941249,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7646672,
          "fraction": 0.9115543365478516,
          "encode_seconds_diagnostic": 0.1173505000770092,
          "decode_seconds_diagnostic": 0.23718166700564325,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7663870,
          "fraction": 0.9136044979095459,
          "encode_seconds_diagnostic": 0.06504320912063122,
          "decode_seconds_diagnostic": 0.18021366698667407,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "mtp",
        "weights"
      ],
      "population_bytes": 1302036480,
      "sample_index": 4,
      "tensor": {
        "file": "mtp.safetensors",
        "name": "mtp.layers.0.mlp.switch_mlp.up_proj.weight",
        "dtype": "U32",
        "shape": [
          512,
          640,
          320
        ],
        "offset": 1034669731,
        "size": 419430400,
        "group": "mtp"
      },
      "offset": 400259840,
      "size_per_tensor": 8388608,
      "sha256": "7a7fa3ed72250356bd9127521d579c1a6fa7d4137d65d86b93a01a31fa0c9449",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7794930,
          "fraction": 0.9292280673980713,
          "encode_seconds_diagnostic": 0.007130000041797757,
          "decode_seconds_diagnostic": 0.006046665832400322,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 7794759,
          "fraction": 0.9292076826095581,
          "encode_seconds_diagnostic": 0.47426633303985,
          "decode_seconds_diagnostic": 0.0062548748683184385,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7742717,
          "fraction": 0.9230037927627563,
          "encode_seconds_diagnostic": 0.02348337508738041,
          "decode_seconds_diagnostic": 0.023190333042293787,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7697988,
          "fraction": 0.9176716804504395,
          "encode_seconds_diagnostic": 0.102517707971856,
          "decode_seconds_diagnostic": 0.22884920798242092,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7700109,
          "fraction": 0.9179245233535767,
          "encode_seconds_diagnostic": 0.053288209019228816,
          "decode_seconds_diagnostic": 0.17002041707746685,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7679112,
          "fraction": 0.9154214859008789,
          "encode_seconds_diagnostic": 0.11599795892834663,
          "decode_seconds_diagnostic": 0.24363245908170938,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7694784,
          "fraction": 0.9172897338867188,
          "encode_seconds_diagnostic": 0.06788983405567706,
          "decode_seconds_diagnostic": 0.18676575017161667,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "mtp",
        "weights"
      ],
      "population_bytes": 1302036480,
      "sample_index": 5,
      "tensor": {
        "file": "mtp.safetensors",
        "name": "mtp.layers.0.mlp.switch_mlp.up_proj.weight",
        "dtype": "U32",
        "shape": [
          512,
          640,
          320
        ],
        "offset": 1034669731,
        "size": 419430400,
        "group": "mtp"
      },
      "offset": 45336064,
      "size_per_tensor": 8388608,
      "sha256": "fd391a2ef43f96cfcc03dee62ec085c5951ce256c145c2e6abe501d5fe87102a",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7791287,
          "fraction": 0.9287937879562378,
          "encode_seconds_diagnostic": 0.007334833964705467,
          "decode_seconds_diagnostic": 0.006257834145799279,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 7792480,
          "fraction": 0.9289360046386719,
          "encode_seconds_diagnostic": 0.47603670903481543,
          "decode_seconds_diagnostic": 0.00617804192006588,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7737670,
          "fraction": 0.9224021434783936,
          "encode_seconds_diagnostic": 0.025008999975398183,
          "decode_seconds_diagnostic": 0.02414258406497538,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7693499,
          "fraction": 0.917136549949646,
          "encode_seconds_diagnostic": 0.10140345897525549,
          "decode_seconds_diagnostic": 0.2284747080411762,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7695613,
          "fraction": 0.9173885583877563,
          "encode_seconds_diagnostic": 0.05339641612954438,
          "decode_seconds_diagnostic": 0.1714875001925975,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7678698,
          "fraction": 0.9153721332550049,
          "encode_seconds_diagnostic": 0.11437783297151327,
          "decode_seconds_diagnostic": 0.24382345797494054,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7695042,
          "fraction": 0.9173204898834229,
          "encode_seconds_diagnostic": 0.06477324990555644,
          "decode_seconds_diagnostic": 0.18668258283287287,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "pairs"
      ],
      "population_bytes": 6400030720,
      "sample_index": 0,
      "tensor": {
        "file": "model-00001.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_1.scales",
        "dtype": "BF16",
        "shape": [
          2500012,
          5
        ],
        "offset": 3676450921,
        "size": 25000120,
        "group": "ngram"
      },
      "offset": 15747072,
      "size_per_tensor": 4194304,
      "sha256": "6608e8750e8ba788ba853ee75fc51fd0076e411a54f920e20ac2fa1222cdc61a",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5553575,
          "fraction": 0.66203773021698,
          "encode_seconds_diagnostic": 0.02850737515836954,
          "decode_seconds_diagnostic": 0.007361041847616434,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4711627,
          "fraction": 0.5616697072982788,
          "encode_seconds_diagnostic": 1.2236616250593215,
          "decode_seconds_diagnostic": 0.013831499963998795,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 3226182,
          "fraction": 0.38459086418151855,
          "encode_seconds_diagnostic": 0.02212812495417893,
          "decode_seconds_diagnostic": 0.019766832934692502,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 3151508,
          "fraction": 0.3756890296936035,
          "encode_seconds_diagnostic": 0.0953454589471221,
          "decode_seconds_diagnostic": 0.01833379198797047,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2989762,
          "fraction": 0.35640740394592285,
          "encode_seconds_diagnostic": 1.5622206251136959,
          "decode_seconds_diagnostic": 0.016875999979674816,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2607713,
          "fraction": 0.3108636140823364,
          "encode_seconds_diagnostic": 0.04469258291646838,
          "decode_seconds_diagnostic": 0.1852855000179261,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "pairs"
      ],
      "population_bytes": 6400030720,
      "sample_index": 1,
      "tensor": {
        "file": "model-00001.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_21.scales",
        "dtype": "BF16",
        "shape": [
          2500012,
          5
        ],
        "offset": 6363068241,
        "size": 25000120,
        "group": "ngram"
      },
      "offset": 16359680,
      "size_per_tensor": 4194304,
      "sha256": "5572a1889dcbae194965b9ba717b0900edb88fedc46141b97d3a2f442812c1db",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5551710,
          "fraction": 0.6618154048919678,
          "encode_seconds_diagnostic": 0.02596187498420477,
          "decode_seconds_diagnostic": 0.007680458016693592,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4712015,
          "fraction": 0.5617159605026245,
          "encode_seconds_diagnostic": 1.16193183301948,
          "decode_seconds_diagnostic": 0.0145562500692904,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 3223668,
          "fraction": 0.3842911720275879,
          "encode_seconds_diagnostic": 0.02189533389173448,
          "decode_seconds_diagnostic": 0.01794054196216166,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 3150620,
          "fraction": 0.3755831718444824,
          "encode_seconds_diagnostic": 0.09028208395466208,
          "decode_seconds_diagnostic": 0.017620832892134786,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2989411,
          "fraction": 0.3563655614852905,
          "encode_seconds_diagnostic": 1.5752650001086295,
          "decode_seconds_diagnostic": 0.017924666171893477,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2607051,
          "fraction": 0.3107846975326538,
          "encode_seconds_diagnostic": 0.04622474987991154,
          "decode_seconds_diagnostic": 0.1835309169255197,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "pairs"
      ],
      "population_bytes": 6400030720,
      "sample_index": 2,
      "tensor": {
        "file": "model-00001.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_8.scales",
        "dtype": "BF16",
        "shape": [
          2500012,
          5
        ],
        "offset": 1750074041,
        "size": 25000120,
        "group": "ngram"
      },
      "offset": 14604288,
      "size_per_tensor": 4194304,
      "sha256": "14f678b3e1a14ab9019d7549bf8c3e6d200a075a4f6ad1b5d7aad4086fb7455d",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5552923,
          "fraction": 0.6619600057601929,
          "encode_seconds_diagnostic": 0.029274916043505073,
          "decode_seconds_diagnostic": 0.007144500035792589,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4708007,
          "fraction": 0.561238169670105,
          "encode_seconds_diagnostic": 1.211035082815215,
          "decode_seconds_diagnostic": 0.014007375109940767,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 3223253,
          "fraction": 0.3842417001724243,
          "encode_seconds_diagnostic": 0.021777583053335547,
          "decode_seconds_diagnostic": 0.018162416061386466,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 3149472,
          "fraction": 0.3754463195800781,
          "encode_seconds_diagnostic": 0.09105191612616181,
          "decode_seconds_diagnostic": 0.017981708981096745,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2984367,
          "fraction": 0.3557642698287964,
          "encode_seconds_diagnostic": 1.6189318750984967,
          "decode_seconds_diagnostic": 0.01849050004966557,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2606179,
          "fraction": 0.3106807470321655,
          "encode_seconds_diagnostic": 0.04485112498514354,
          "decode_seconds_diagnostic": 0.18089370895177126,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "pairs"
      ],
      "population_bytes": 6400030720,
      "sample_index": 3,
      "tensor": {
        "file": "model-00002.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_22.scales",
        "dtype": "BF16",
        "shape": [
          2500012,
          5
        ],
        "offset": 8200058331,
        "size": 25000120,
        "group": "ngram"
      },
      "offset": 16975360,
      "size_per_tensor": 4194304,
      "sha256": "826efca1b5902c7ea306df9e685f0670f9495932a4d48788ec5f21229427c7c0",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5554063,
          "fraction": 0.6620959043502808,
          "encode_seconds_diagnostic": 0.02521170792169869,
          "decode_seconds_diagnostic": 0.006885125068947673,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4711287,
          "fraction": 0.5616291761398315,
          "encode_seconds_diagnostic": 1.2544390419498086,
          "decode_seconds_diagnostic": 0.014262709068134427,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 3223891,
          "fraction": 0.3843177556991577,
          "encode_seconds_diagnostic": 0.023209374863654375,
          "decode_seconds_diagnostic": 0.018840624950826168,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 3150189,
          "fraction": 0.37553179264068604,
          "encode_seconds_diagnostic": 0.09138641599565744,
          "decode_seconds_diagnostic": 0.018177707912400365,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2993798,
          "fraction": 0.3568885326385498,
          "encode_seconds_diagnostic": 1.5609552499372512,
          "decode_seconds_diagnostic": 0.018474499927833676,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2606869,
          "fraction": 0.31076300144195557,
          "encode_seconds_diagnostic": 0.04586583306081593,
          "decode_seconds_diagnostic": 0.1844008748885244,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "pairs"
      ],
      "population_bytes": 6400030720,
      "sample_index": 4,
      "tensor": {
        "file": "model-00002.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_32.scales",
        "dtype": "BF16",
        "shape": [
          2500012,
          5
        ],
        "offset": 8450059531,
        "size": 25000120,
        "group": "ngram"
      },
      "offset": 15464448,
      "size_per_tensor": 4194304,
      "sha256": "b336d0d3a99c53c70e2f52028b6f4da318b93fe7d66d0c4e79fbfca8e4add659",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5552003,
          "fraction": 0.6618503332138062,
          "encode_seconds_diagnostic": 0.02568712504580617,
          "decode_seconds_diagnostic": 0.007128582801669836,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4711845,
          "fraction": 0.5616956949234009,
          "encode_seconds_diagnostic": 1.253556540934369,
          "decode_seconds_diagnostic": 0.013735667103901505,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 3222302,
          "fraction": 0.3841283321380615,
          "encode_seconds_diagnostic": 0.02568824985064566,
          "decode_seconds_diagnostic": 0.018753041978925467,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 3148906,
          "fraction": 0.3753788471221924,
          "encode_seconds_diagnostic": 0.0901518331374973,
          "decode_seconds_diagnostic": 0.019463832955807447,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2989987,
          "fraction": 0.3564342260360718,
          "encode_seconds_diagnostic": 1.85464904201217,
          "decode_seconds_diagnostic": 0.01782391592860222,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2605265,
          "fraction": 0.3105717897415161,
          "encode_seconds_diagnostic": 0.044312332989647985,
          "decode_seconds_diagnostic": 0.18066070904023945,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "pairs"
      ],
      "population_bytes": 6400030720,
      "sample_index": 5,
      "tensor": {
        "file": "model-00002.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_40.scales",
        "dtype": "BF16",
        "shape": [
          2500012,
          5
        ],
        "offset": 8975062051,
        "size": 25000120,
        "group": "ngram"
      },
      "offset": 18068992,
      "size_per_tensor": 4194304,
      "sha256": "f876157bbceb8b2562199048ebf60c34dac4cfcc212f6b26a97c4fd2d61fc25f",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5553288,
          "fraction": 0.6620035171508789,
          "encode_seconds_diagnostic": 0.024769874988123775,
          "decode_seconds_diagnostic": 0.00687437504529953,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4710566,
          "fraction": 0.5615432262420654,
          "encode_seconds_diagnostic": 1.415627249982208,
          "decode_seconds_diagnostic": 0.01356341689825058,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 3223873,
          "fraction": 0.3843156099319458,
          "encode_seconds_diagnostic": 0.021647207904607058,
          "decode_seconds_diagnostic": 0.01845325017347932,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 3149761,
          "fraction": 0.3754807710647583,
          "encode_seconds_diagnostic": 0.08961345790885389,
          "decode_seconds_diagnostic": 0.018237000098451972,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2997762,
          "fraction": 0.3573610782623291,
          "encode_seconds_diagnostic": 1.489450957858935,
          "decode_seconds_diagnostic": 0.02039029193110764,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2606528,
          "fraction": 0.31072235107421875,
          "encode_seconds_diagnostic": 0.04719004197977483,
          "decode_seconds_diagnostic": 0.18396337516605854,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "pairs"
      ],
      "population_bytes": 6400030720,
      "sample_index": 6,
      "tensor": {
        "file": "model-00002.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_52.scales",
        "dtype": "BF16",
        "shape": [
          2500012,
          5
        ],
        "offset": 3525035891,
        "size": 25000120,
        "group": "ngram"
      },
      "offset": 16154880,
      "size_per_tensor": 4194304,
      "sha256": "83a399349161fc76b798f5c42433efda454bb20a82206c9eaae54b222a9160ad",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5552145,
          "fraction": 0.6618672609329224,
          "encode_seconds_diagnostic": 0.027875542175024748,
          "decode_seconds_diagnostic": 0.007572459056973457,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4712682,
          "fraction": 0.5617954730987549,
          "encode_seconds_diagnostic": 1.1952709588222206,
          "decode_seconds_diagnostic": 0.013827084098011255,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 3222783,
          "fraction": 0.38418567180633545,
          "encode_seconds_diagnostic": 0.02248795796185732,
          "decode_seconds_diagnostic": 0.019085500156506896,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 3149169,
          "fraction": 0.37541019916534424,
          "encode_seconds_diagnostic": 0.0904259579256177,
          "decode_seconds_diagnostic": 0.017479124944657087,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2988842,
          "fraction": 0.35629773139953613,
          "encode_seconds_diagnostic": 1.4232952499296516,
          "decode_seconds_diagnostic": 0.017075541894882917,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2605948,
          "fraction": 0.3106532096862793,
          "encode_seconds_diagnostic": 0.04456779104657471,
          "decode_seconds_diagnostic": 0.1827918749768287,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "pairs"
      ],
      "population_bytes": 6400030720,
      "sample_index": 7,
      "tensor": {
        "file": "model-00002.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_60.scales",
        "dtype": "BF16",
        "shape": [
          2500012,
          5
        ],
        "offset": 950023531,
        "size": 25000120,
        "group": "ngram"
      },
      "offset": 16519424,
      "size_per_tensor": 4194304,
      "sha256": "2114241c69605198243c85bca873ab719d9ad18f9111dd8a730dd1874bd112bc",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5552018,
          "fraction": 0.6618521213531494,
          "encode_seconds_diagnostic": 0.025033624842762947,
          "decode_seconds_diagnostic": 0.006959500024095178,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4712311,
          "fraction": 0.5617512464523315,
          "encode_seconds_diagnostic": 1.248848999850452,
          "decode_seconds_diagnostic": 0.013653416885063052,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 3225612,
          "fraction": 0.3845229148864746,
          "encode_seconds_diagnostic": 0.021735750138759613,
          "decode_seconds_diagnostic": 0.017682624980807304,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 3152122,
          "fraction": 0.3757622241973877,
          "encode_seconds_diagnostic": 0.08974620793014765,
          "decode_seconds_diagnostic": 0.01753866602666676,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2991505,
          "fraction": 0.35661518573760986,
          "encode_seconds_diagnostic": 1.4455387920606881,
          "decode_seconds_diagnostic": 0.01807495905086398,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2607925,
          "fraction": 0.3108888864517212,
          "encode_seconds_diagnostic": 0.04490954102948308,
          "decode_seconds_diagnostic": 0.18159958394244313,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "pairs"
      ],
      "population_bytes": 6400030720,
      "sample_index": 8,
      "tensor": {
        "file": "model-00003.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_66.scales",
        "dtype": "BF16",
        "shape": [
          2500012,
          5
        ],
        "offset": 5200043944,
        "size": 25000120,
        "group": "ngram"
      },
      "offset": 20604928,
      "size_per_tensor": 4194304,
      "sha256": "7459ebc38870f365f79de60e1a369e7acd54206d021c10e8bdd6bfdb1ac6cc77",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5397748,
          "fraction": 0.6434617042541504,
          "encode_seconds_diagnostic": 0.028988166945055127,
          "decode_seconds_diagnostic": 0.00742229213938117,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4567392,
          "fraction": 0.5444755554199219,
          "encode_seconds_diagnostic": 1.2257364171091467,
          "decode_seconds_diagnostic": 0.01351170800626278,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 3150225,
          "fraction": 0.37553608417510986,
          "encode_seconds_diagnostic": 0.021426333114504814,
          "decode_seconds_diagnostic": 0.018292834050953388,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 3080622,
          "fraction": 0.36723875999450684,
          "encode_seconds_diagnostic": 0.0897089580539614,
          "decode_seconds_diagnostic": 0.017727874917909503,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2910680,
          "fraction": 0.34698009490966797,
          "encode_seconds_diagnostic": 1.4952666671015322,
          "decode_seconds_diagnostic": 0.016727790934965014,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2536304,
          "fraction": 0.3023509979248047,
          "encode_seconds_diagnostic": 0.04446116695180535,
          "decode_seconds_diagnostic": 0.1816132920794189,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "pairs"
      ],
      "population_bytes": 6400030720,
      "sample_index": 9,
      "tensor": {
        "file": "model-00003.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_71.scales",
        "dtype": "BF16",
        "shape": [
          2500012,
          5
        ],
        "offset": 5650046104,
        "size": 25000120,
        "group": "ngram"
      },
      "offset": 14341888,
      "size_per_tensor": 4194304,
      "sha256": "ff79a4ee1fa00b88221b4ad746334f57b1ea6988c17ac7ca2c35945039a3e07e",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5394159,
          "fraction": 0.6430338621139526,
          "encode_seconds_diagnostic": 0.02648279187269509,
          "decode_seconds_diagnostic": 0.0071772499941289425,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4570922,
          "fraction": 0.5448963642120361,
          "encode_seconds_diagnostic": 1.235284750116989,
          "decode_seconds_diagnostic": 0.01481549977324903,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 3150889,
          "fraction": 0.3756152391433716,
          "encode_seconds_diagnostic": 0.023720416938886046,
          "decode_seconds_diagnostic": 0.01791520812548697,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 3082456,
          "fraction": 0.36745738983154297,
          "encode_seconds_diagnostic": 0.09023970901034772,
          "decode_seconds_diagnostic": 0.017687084153294563,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2915298,
          "fraction": 0.3475306034088135,
          "encode_seconds_diagnostic": 1.7266499169636518,
          "decode_seconds_diagnostic": 0.017352249938994646,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2536763,
          "fraction": 0.3024057149887085,
          "encode_seconds_diagnostic": 0.045448374934494495,
          "decode_seconds_diagnostic": 0.18680249992758036,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "pairs"
      ],
      "population_bytes": 6400030720,
      "sample_index": 10,
      "tensor": {
        "file": "model-00003.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_77.scales",
        "dtype": "BF16",
        "shape": [
          2500012,
          5
        ],
        "offset": 3400035304,
        "size": 25000120,
        "group": "ngram"
      },
      "offset": 2103552,
      "size_per_tensor": 4194304,
      "sha256": "525ecc00b9fafd806dd9ccbdd2609a91efd96907f71cca295281460d6024c447",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5393663,
          "fraction": 0.6429747343063354,
          "encode_seconds_diagnostic": 0.02991949999704957,
          "decode_seconds_diagnostic": 0.007670040940865874,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4569881,
          "fraction": 0.5447722673416138,
          "encode_seconds_diagnostic": 1.268907707883045,
          "decode_seconds_diagnostic": 0.013759374851360917,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 3150534,
          "fraction": 0.37557291984558105,
          "encode_seconds_diagnostic": 0.02184224990196526,
          "decode_seconds_diagnostic": 0.01805512490682304,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 3081494,
          "fraction": 0.3673427104949951,
          "encode_seconds_diagnostic": 0.09177549998275936,
          "decode_seconds_diagnostic": 0.018295374931767583,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2916212,
          "fraction": 0.3476395606994629,
          "encode_seconds_diagnostic": 1.5790299160871655,
          "decode_seconds_diagnostic": 0.017980000004172325,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2535972,
          "fraction": 0.30231142044067383,
          "encode_seconds_diagnostic": 0.045576625037938356,
          "decode_seconds_diagnostic": 0.1863792499061674,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "pairs"
      ],
      "population_bytes": 6400030720,
      "sample_index": 11,
      "tensor": {
        "file": "model-00003.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_91.scales",
        "dtype": "BF16",
        "shape": [
          2500012,
          5
        ],
        "offset": 5050043224,
        "size": 25000120,
        "group": "ngram"
      },
      "offset": 17885184,
      "size_per_tensor": 4194304,
      "sha256": "f6a3c91370aef63064ade6c03a4a2aaafaea489e4c8dd23bfe54a3a0e09512a1",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5391599,
          "fraction": 0.6427286863327026,
          "encode_seconds_diagnostic": 0.027193417074158788,
          "decode_seconds_diagnostic": 0.008174499962478876,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4570407,
          "fraction": 0.5448349714279175,
          "encode_seconds_diagnostic": 1.5040389171335846,
          "decode_seconds_diagnostic": 0.013943625148385763,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 3152474,
          "fraction": 0.37580418586730957,
          "encode_seconds_diagnostic": 0.02253274992108345,
          "decode_seconds_diagnostic": 0.019889499992132187,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 3083472,
          "fraction": 0.36757850646972656,
          "encode_seconds_diagnostic": 0.09729191707447171,
          "decode_seconds_diagnostic": 0.019314916105940938,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2916918,
          "fraction": 0.34772372245788574,
          "encode_seconds_diagnostic": 1.7725924160331488,
          "decode_seconds_diagnostic": 0.017708083847537637,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2537684,
          "fraction": 0.30251550674438477,
          "encode_seconds_diagnostic": 0.046070249984040856,
          "decode_seconds_diagnostic": 0.18618087517097592,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "pairs"
      ],
      "population_bytes": 6400030720,
      "sample_index": 12,
      "tensor": {
        "file": "model-00003.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_93.scales",
        "dtype": "BF16",
        "shape": [
          2500012,
          5
        ],
        "offset": 7125053184,
        "size": 25000120,
        "group": "ngram"
      },
      "offset": 3252736,
      "size_per_tensor": 4194304,
      "sha256": "084420f786a89fbf6fc4099899318503b23b8eb5de4106c421afda0ec1e959ec",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5392976,
          "fraction": 0.6428928375244141,
          "encode_seconds_diagnostic": 0.031733499839901924,
          "decode_seconds_diagnostic": 0.00800029095262289,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4567827,
          "fraction": 0.5445274114608765,
          "encode_seconds_diagnostic": 1.4471296661067754,
          "decode_seconds_diagnostic": 0.016471167095005512,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 3152888,
          "fraction": 0.3758535385131836,
          "encode_seconds_diagnostic": 0.023277999833226204,
          "decode_seconds_diagnostic": 0.019440040923655033,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 3083675,
          "fraction": 0.36760270595550537,
          "encode_seconds_diagnostic": 0.09647258394397795,
          "decode_seconds_diagnostic": 0.019431249937042594,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2912683,
          "fraction": 0.3472188711166382,
          "encode_seconds_diagnostic": 1.734314665896818,
          "decode_seconds_diagnostic": 0.018226541811600327,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2538130,
          "fraction": 0.3025686740875244,
          "encode_seconds_diagnostic": 0.04520620917901397,
          "decode_seconds_diagnostic": 0.19165474991314113,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "pairs"
      ],
      "population_bytes": 6400030720,
      "sample_index": 13,
      "tensor": {
        "file": "model-00004.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_102.scales",
        "dtype": "BF16",
        "shape": [
          2500012,
          5
        ],
        "offset": 8463825158,
        "size": 25000120,
        "group": "ngram"
      },
      "offset": 20418048,
      "size_per_tensor": 4194304,
      "sha256": "a5afd4311a1a6725e8147ca11240a7c739f7be37b679a9d4d9916e20fd7fed51",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5391001,
          "fraction": 0.6426573991775513,
          "encode_seconds_diagnostic": 0.02885708399116993,
          "decode_seconds_diagnostic": 0.007834125077351928,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4573124,
          "fraction": 0.545158863067627,
          "encode_seconds_diagnostic": 1.4204164580442011,
          "decode_seconds_diagnostic": 0.0146635000128299,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 3149287,
          "fraction": 0.37542426586151123,
          "encode_seconds_diagnostic": 0.022647917037829757,
          "decode_seconds_diagnostic": 0.018472207942977548,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 3080852,
          "fraction": 0.3672661781311035,
          "encode_seconds_diagnostic": 0.09220216702669859,
          "decode_seconds_diagnostic": 0.018573208013549447,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2918030,
          "fraction": 0.3478562831878662,
          "encode_seconds_diagnostic": 1.6147079588845372,
          "decode_seconds_diagnostic": 0.020100542111322284,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2535556,
          "fraction": 0.3022618293762207,
          "encode_seconds_diagnostic": 0.047569625079631805,
          "decode_seconds_diagnostic": 0.1900902499910444,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "pairs"
      ],
      "population_bytes": 6400030720,
      "sample_index": 14,
      "tensor": {
        "file": "model-00004.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_119.scales",
        "dtype": "BF16",
        "shape": [
          2500012,
          5
        ],
        "offset": 7028917062,
        "size": 25000120,
        "group": "ngram"
      },
      "offset": 17318656,
      "size_per_tensor": 4194304,
      "sha256": "3f2fdaa1129baede41880ec3d50bda5c601c6a852de33cfc60a261869fc2af35",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5397526,
          "fraction": 0.6434352397918701,
          "encode_seconds_diagnostic": 0.02946133306249976,
          "decode_seconds_diagnostic": 0.007649749983102083,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4566873,
          "fraction": 0.544413685798645,
          "encode_seconds_diagnostic": 1.2978003749158233,
          "decode_seconds_diagnostic": 0.013799041975289583,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 3149227,
          "fraction": 0.3754171133041382,
          "encode_seconds_diagnostic": 0.022071082843467593,
          "decode_seconds_diagnostic": 0.018094999948516488,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 3079996,
          "fraction": 0.36716413497924805,
          "encode_seconds_diagnostic": 0.09178483299911022,
          "decode_seconds_diagnostic": 0.017984417034313083,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2915505,
          "fraction": 0.3475552797317505,
          "encode_seconds_diagnostic": 1.6146210830193013,
          "decode_seconds_diagnostic": 0.018098084023222327,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2535374,
          "fraction": 0.30224013328552246,
          "encode_seconds_diagnostic": 0.04780366690829396,
          "decode_seconds_diagnostic": 0.18901195796206594,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "pairs"
      ],
      "population_bytes": 6400030720,
      "sample_index": 15,
      "tensor": {
        "file": "model-00004.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_120.scales",
        "dtype": "BF16",
        "shape": [
          2500012,
          5
        ],
        "offset": 5763490318,
        "size": 25000120,
        "group": "ngram"
      },
      "offset": 19673856,
      "size_per_tensor": 4194304,
      "sha256": "10f39723cd1cef48f5ec431c788626d7efb39680a756e94fdcb6a960021bb67d",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5390617,
          "fraction": 0.6426116228103638,
          "encode_seconds_diagnostic": 0.027166583109647036,
          "decode_seconds_diagnostic": 0.007243583910167217,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4568794,
          "fraction": 0.5446426868438721,
          "encode_seconds_diagnostic": 1.307884915964678,
          "decode_seconds_diagnostic": 0.013756916858255863,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 3155144,
          "fraction": 0.37612247467041016,
          "encode_seconds_diagnostic": 0.02180045796558261,
          "decode_seconds_diagnostic": 0.017823334084823728,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 3086384,
          "fraction": 0.36792564392089844,
          "encode_seconds_diagnostic": 0.09053562511689961,
          "decode_seconds_diagnostic": 0.017775957938283682,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2921665,
          "fraction": 0.3482896089553833,
          "encode_seconds_diagnostic": 1.6361629581078887,
          "decode_seconds_diagnostic": 0.0182242919690907,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2540531,
          "fraction": 0.30285489559173584,
          "encode_seconds_diagnostic": 0.047561333049088717,
          "decode_seconds_diagnostic": 0.18724162504076958,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "weights"
      ],
      "population_bytes": 25600122880,
      "sample_index": 0,
      "tensor": {
        "file": "model-00001.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_0.weight",
        "dtype": "U32",
        "shape": [
          2500012,
          20
        ],
        "offset": 3929933721,
        "size": 200000960,
        "group": "ngram"
      },
      "offset": 171550976,
      "size_per_tensor": 8388608,
      "sha256": "9e2edc9c91f14de5a31bdef1ab1d5be888e08f6cb24f390959ba4dca2bed4c0a",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8086731,
          "fraction": 0.9640134572982788,
          "encode_seconds_diagnostic": 0.010252832900732756,
          "decode_seconds_diagnostic": 0.006778207840397954,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 8079793,
          "fraction": 0.9631863832473755,
          "encode_seconds_diagnostic": 0.5013633749913424,
          "decode_seconds_diagnostic": 0.006794250104576349,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8075028,
          "fraction": 0.962618350982666,
          "encode_seconds_diagnostic": 0.02778291585855186,
          "decode_seconds_diagnostic": 0.025205582845956087,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8010723,
          "fraction": 0.954952597618103,
          "encode_seconds_diagnostic": 0.1188418329693377,
          "decode_seconds_diagnostic": 0.2322356658987701,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8012467,
          "fraction": 0.9551604986190796,
          "encode_seconds_diagnostic": 0.058577624848112464,
          "decode_seconds_diagnostic": 0.17837287485599518,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 8000144,
          "fraction": 0.9536914825439453,
          "encode_seconds_diagnostic": 0.1270115419756621,
          "decode_seconds_diagnostic": 0.25551299983635545,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 8016096,
          "fraction": 0.9555931091308594,
          "encode_seconds_diagnostic": 0.07842849986627698,
          "decode_seconds_diagnostic": 0.19060049997642636,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "weights"
      ],
      "population_bytes": 25600122880,
      "sample_index": 1,
      "tensor": {
        "file": "model-00001.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_19.weight",
        "dtype": "U32",
        "shape": [
          2500012,
          20
        ],
        "offset": 7218044553,
        "size": 200000960,
        "group": "ngram"
      },
      "offset": 2439424,
      "size_per_tensor": 8388608,
      "sha256": "db73d1d96fa06f8061e7820feac332642262d2bdca13d6df20a058598de90b20",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8085360,
          "fraction": 0.9638500213623047,
          "encode_seconds_diagnostic": 0.010017791064456105,
          "decode_seconds_diagnostic": 0.006661584135144949,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 8080337,
          "fraction": 0.9632512331008911,
          "encode_seconds_diagnostic": 0.4998777909204364,
          "decode_seconds_diagnostic": 0.006569707999005914,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8072815,
          "fraction": 0.9623545408248901,
          "encode_seconds_diagnostic": 0.027741750003769994,
          "decode_seconds_diagnostic": 0.025023916037753224,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8010235,
          "fraction": 0.9548944234848022,
          "encode_seconds_diagnostic": 0.10823416686616838,
          "decode_seconds_diagnostic": 0.23690820904448628,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8011978,
          "fraction": 0.9551022052764893,
          "encode_seconds_diagnostic": 0.058991750003769994,
          "decode_seconds_diagnostic": 0.18001433298923075,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 8000163,
          "fraction": 0.9536937475204468,
          "encode_seconds_diagnostic": 0.12888904195278883,
          "decode_seconds_diagnostic": 0.256038999883458,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 8016262,
          "fraction": 0.9556128978729248,
          "encode_seconds_diagnostic": 0.0795517498627305,
          "decode_seconds_diagnostic": 0.1983190830796957,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "weights"
      ],
      "population_bytes": 25600122880,
      "sample_index": 2,
      "tensor": {
        "file": "model-00001.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_24.weight",
        "dtype": "U32",
        "shape": [
          2500012,
          20
        ],
        "offset": 6507545209,
        "size": 200000960,
        "group": "ngram"
      },
      "offset": 6939904,
      "size_per_tensor": 8388608,
      "sha256": "d2c0a978439194e07ca2091dbff30b51d5dd92f7d3c36ecfd48b217d8601eb67",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8086315,
          "fraction": 0.9639638662338257,
          "encode_seconds_diagnostic": 0.010617583990097046,
          "decode_seconds_diagnostic": 0.006772707914933562,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 8080045,
          "fraction": 0.9632164239883423,
          "encode_seconds_diagnostic": 0.5002209171652794,
          "decode_seconds_diagnostic": 0.006691291928291321,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8074520,
          "fraction": 0.9625577926635742,
          "encode_seconds_diagnostic": 0.027770667104050517,
          "decode_seconds_diagnostic": 0.023839334025979042,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8010403,
          "fraction": 0.9549144506454468,
          "encode_seconds_diagnostic": 0.11070470814593136,
          "decode_seconds_diagnostic": 0.2292094579897821,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8012088,
          "fraction": 0.9551153182983398,
          "encode_seconds_diagnostic": 0.058516375022009015,
          "decode_seconds_diagnostic": 0.17763549997471273,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 8000036,
          "fraction": 0.9536786079406738,
          "encode_seconds_diagnostic": 0.12925524986349046,
          "decode_seconds_diagnostic": 0.26222200016491115,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 8016015,
          "fraction": 0.9555834531784058,
          "encode_seconds_diagnostic": 0.08192412508651614,
          "decode_seconds_diagnostic": 0.20361591689288616,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "weights"
      ],
      "population_bytes": 25600122880,
      "sample_index": 3,
      "tensor": {
        "file": "model-00002.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_28.weight",
        "dtype": "U32",
        "shape": [
          2500012,
          20
        ],
        "offset": 7775056291,
        "size": 200000960,
        "group": "ngram"
      },
      "offset": 1852928,
      "size_per_tensor": 8388608,
      "sha256": "bf29bca00eccb11f2a65438dd9c4ef300101368575d16e60814305b96acf70af",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8085392,
          "fraction": 0.9638538360595703,
          "encode_seconds_diagnostic": 0.011360666016116738,
          "decode_seconds_diagnostic": 0.0072083750274032354,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 8079552,
          "fraction": 0.9631576538085938,
          "encode_seconds_diagnostic": 0.5215640000533313,
          "decode_seconds_diagnostic": 0.006573916878551245,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8073099,
          "fraction": 0.9623883962631226,
          "encode_seconds_diagnostic": 0.028277208097279072,
          "decode_seconds_diagnostic": 0.02470012498088181,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8009407,
          "fraction": 0.9547957181930542,
          "encode_seconds_diagnostic": 0.10803625010885298,
          "decode_seconds_diagnostic": 0.23384595895186067,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8011122,
          "fraction": 0.9550001621246338,
          "encode_seconds_diagnostic": 0.059524042066186666,
          "decode_seconds_diagnostic": 0.17703674989752471,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7999465,
          "fraction": 0.9536105394363403,
          "encode_seconds_diagnostic": 0.1317370410542935,
          "decode_seconds_diagnostic": 0.25355791696347296,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 8015649,
          "fraction": 0.9555398225784302,
          "encode_seconds_diagnostic": 0.07925387495197356,
          "decode_seconds_diagnostic": 0.19267845805734396,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "weights"
      ],
      "population_bytes": 25600122880,
      "sample_index": 4,
      "tensor": {
        "file": "model-00002.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_33.weight",
        "dtype": "U32",
        "shape": [
          2500012,
          20
        ],
        "offset": 7175053411,
        "size": 200000960,
        "group": "ngram"
      },
      "offset": 109051904,
      "size_per_tensor": 8388608,
      "sha256": "a75d5a25298783df84eec5bdc6494a3654b3c2b1fa89e382d9d889faff69746a",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8085172,
          "fraction": 0.9638276100158691,
          "encode_seconds_diagnostic": 0.009704417083412409,
          "decode_seconds_diagnostic": 0.006640959065407515,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 8079310,
          "fraction": 0.9631288051605225,
          "encode_seconds_diagnostic": 0.5039214170537889,
          "decode_seconds_diagnostic": 0.007043709047138691,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8073670,
          "fraction": 0.962456464767456,
          "encode_seconds_diagnostic": 0.028503207955509424,
          "decode_seconds_diagnostic": 0.024905000114813447,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8009983,
          "fraction": 0.9548643827438354,
          "encode_seconds_diagnostic": 0.10966612491756678,
          "decode_seconds_diagnostic": 0.23424608283676207,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8011731,
          "fraction": 0.9550727605819702,
          "encode_seconds_diagnostic": 0.058852958027273417,
          "decode_seconds_diagnostic": 0.1852824161760509,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 8000148,
          "fraction": 0.9536919593811035,
          "encode_seconds_diagnostic": 0.13438329100608826,
          "decode_seconds_diagnostic": 0.2530484579037875,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 8016376,
          "fraction": 0.9556264877319336,
          "encode_seconds_diagnostic": 0.08156433305703104,
          "decode_seconds_diagnostic": 0.1972823329269886,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "weights"
      ],
      "population_bytes": 25600122880,
      "sample_index": 5,
      "tensor": {
        "file": "model-00002.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_45.weight",
        "dtype": "U32",
        "shape": [
          2500012,
          20
        ],
        "offset": 3675036611,
        "size": 200000960,
        "group": "ngram"
      },
      "offset": 104097792,
      "size_per_tensor": 8388608,
      "sha256": "da9961737a813d11d490da1f64b2f61818bf9fdb10e0d05d5563e973c8975112",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8085362,
          "fraction": 0.9638502597808838,
          "encode_seconds_diagnostic": 0.009874249808490276,
          "decode_seconds_diagnostic": 0.006777832983061671,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 8079615,
          "fraction": 0.9631651639938354,
          "encode_seconds_diagnostic": 0.507330457912758,
          "decode_seconds_diagnostic": 0.006548750214278698,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8073858,
          "fraction": 0.9624788761138916,
          "encode_seconds_diagnostic": 0.028728374978527427,
          "decode_seconds_diagnostic": 0.0235296250320971,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8010788,
          "fraction": 0.9549603462219238,
          "encode_seconds_diagnostic": 0.10560212493874133,
          "decode_seconds_diagnostic": 0.22799774981103837,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8012488,
          "fraction": 0.9551630020141602,
          "encode_seconds_diagnostic": 0.05657608318142593,
          "decode_seconds_diagnostic": 0.17063891608268023,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 8000482,
          "fraction": 0.9537317752838135,
          "encode_seconds_diagnostic": 0.12650854093953967,
          "decode_seconds_diagnostic": 0.24684449983760715,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 8016551,
          "fraction": 0.955647349357605,
          "encode_seconds_diagnostic": 0.07532675005495548,
          "decode_seconds_diagnostic": 0.18956908397376537,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "weights"
      ],
      "population_bytes": 25600122880,
      "sample_index": 6,
      "tensor": {
        "file": "model-00002.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_53.weight",
        "dtype": "U32",
        "shape": [
          2500012,
          20
        ],
        "offset": 9550064811,
        "size": 200000960,
        "group": "ngram"
      },
      "offset": 22796032,
      "size_per_tensor": 8388608,
      "sha256": "25975c22134f37b75384887bc18d3b8b093812f4b53e39bf52b566163f85c144",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8088462,
          "fraction": 0.9642198085784912,
          "encode_seconds_diagnostic": 0.01007104106247425,
          "decode_seconds_diagnostic": 0.006626332877203822,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 8080059,
          "fraction": 0.963218092918396,
          "encode_seconds_diagnostic": 0.48136191605590284,
          "decode_seconds_diagnostic": 0.006685083033517003,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8074540,
          "fraction": 0.9625601768493652,
          "encode_seconds_diagnostic": 0.026411915896460414,
          "decode_seconds_diagnostic": 0.023245375137776136,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8010641,
          "fraction": 0.9549428224563599,
          "encode_seconds_diagnostic": 0.10431541688740253,
          "decode_seconds_diagnostic": 0.22589658293873072,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8012358,
          "fraction": 0.9551475048065186,
          "encode_seconds_diagnostic": 0.05601837486028671,
          "decode_seconds_diagnostic": 0.17132262513041496,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 8000548,
          "fraction": 0.9537396430969238,
          "encode_seconds_diagnostic": 0.12661679205484688,
          "decode_seconds_diagnostic": 0.24543920811265707,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 8016493,
          "fraction": 0.955640435218811,
          "encode_seconds_diagnostic": 0.07587858405895531,
          "decode_seconds_diagnostic": 0.19040062511339784,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "weights"
      ],
      "population_bytes": 25600122880,
      "sample_index": 7,
      "tensor": {
        "file": "model-00002.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_56.weight",
        "dtype": "U32",
        "shape": [
          2500012,
          20
        ],
        "offset": 1725027251,
        "size": 200000960,
        "group": "ngram"
      },
      "offset": 118116096,
      "size_per_tensor": 8388608,
      "sha256": "04f3abd7e1c34f09fcd951f37d51426053e4322a904c6c1b9449f2e051e6808a",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8086922,
          "fraction": 0.964036226272583,
          "encode_seconds_diagnostic": 0.009799042018130422,
          "decode_seconds_diagnostic": 0.006624708883464336,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 8080372,
          "fraction": 0.9632554054260254,
          "encode_seconds_diagnostic": 0.4781800829805434,
          "decode_seconds_diagnostic": 0.006586625007912517,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8074605,
          "fraction": 0.962567925453186,
          "encode_seconds_diagnostic": 0.025964791886508465,
          "decode_seconds_diagnostic": 0.023502709111198783,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8011682,
          "fraction": 0.9550669193267822,
          "encode_seconds_diagnostic": 0.10403812490403652,
          "decode_seconds_diagnostic": 0.2260887089651078,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8013433,
          "fraction": 0.9552756547927856,
          "encode_seconds_diagnostic": 0.05589862493798137,
          "decode_seconds_diagnostic": 0.17106395890004933,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 8001719,
          "fraction": 0.9538792371749878,
          "encode_seconds_diagnostic": 0.12569691706448793,
          "decode_seconds_diagnostic": 0.2460147920064628,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 8017876,
          "fraction": 0.9558053016662598,
          "encode_seconds_diagnostic": 0.07557262503542006,
          "decode_seconds_diagnostic": 0.1909163340460509,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "weights"
      ],
      "population_bytes": 25600122880,
      "sample_index": 8,
      "tensor": {
        "file": "model-00003.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_105.weight",
        "dtype": "U32",
        "shape": [
          2500012,
          20
        ],
        "offset": 5225044064,
        "size": 200000960,
        "group": "ngram"
      },
      "offset": 172550912,
      "size_per_tensor": 8388608,
      "sha256": "c4e1cefd88b7a59cf6286241ce41283cc7ea8701be7abb6a44068aa2bc79ef58",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8085334,
          "fraction": 0.9638469219207764,
          "encode_seconds_diagnostic": 0.009798707906156778,
          "decode_seconds_diagnostic": 0.006685291882604361,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 8079154,
          "fraction": 0.9631102085113525,
          "encode_seconds_diagnostic": 0.49224937497638166,
          "decode_seconds_diagnostic": 0.006546959048137069,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8073155,
          "fraction": 0.9623950719833374,
          "encode_seconds_diagnostic": 0.026360624935477972,
          "decode_seconds_diagnostic": 0.023299125023186207,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8009595,
          "fraction": 0.9548181295394897,
          "encode_seconds_diagnostic": 0.10537970904260874,
          "decode_seconds_diagnostic": 0.2262168750166893,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8011377,
          "fraction": 0.9550305604934692,
          "encode_seconds_diagnostic": 0.05838970793411136,
          "decode_seconds_diagnostic": 0.17261433298699558,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7991402,
          "fraction": 0.9526493549346924,
          "encode_seconds_diagnostic": 0.12558337510563433,
          "decode_seconds_diagnostic": 0.24364354205317795,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 8005308,
          "fraction": 0.9543070793151855,
          "encode_seconds_diagnostic": 0.0728390421718359,
          "decode_seconds_diagnostic": 0.18705529207363725,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "weights"
      ],
      "population_bytes": 25600122880,
      "sample_index": 9,
      "tensor": {
        "file": "model-00003.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_70.weight",
        "dtype": "U32",
        "shape": [
          2500012,
          20
        ],
        "offset": 4175039024,
        "size": 200000960,
        "group": "ngram"
      },
      "offset": 45894912,
      "size_per_tensor": 8388608,
      "sha256": "1f6e5fc7d503a98f0e483a32645b80af6eddbffc4e36aadeec078597f9d90391",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8084568,
          "fraction": 0.9637556076049805,
          "encode_seconds_diagnostic": 0.009790957905352116,
          "decode_seconds_diagnostic": 0.006648874841630459,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 8078301,
          "fraction": 0.9630085229873657,
          "encode_seconds_diagnostic": 0.48575233295559883,
          "decode_seconds_diagnostic": 0.006542666116729379,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8072874,
          "fraction": 0.9623615741729736,
          "encode_seconds_diagnostic": 0.02649620804004371,
          "decode_seconds_diagnostic": 0.02324949996545911,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8008185,
          "fraction": 0.9546500444412231,
          "encode_seconds_diagnostic": 0.10373879200778902,
          "decode_seconds_diagnostic": 0.225662583950907,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8009826,
          "fraction": 0.954845666885376,
          "encode_seconds_diagnostic": 0.05578549997881055,
          "decode_seconds_diagnostic": 0.17071541701443493,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7989668,
          "fraction": 0.9524426460266113,
          "encode_seconds_diagnostic": 0.12197287497110665,
          "decode_seconds_diagnostic": 0.2421709168702364,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 8003400,
          "fraction": 0.9540796279907227,
          "encode_seconds_diagnostic": 0.07142104115337133,
          "decode_seconds_diagnostic": 0.18604841688647866,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "weights"
      ],
      "population_bytes": 25600122880,
      "sample_index": 10,
      "tensor": {
        "file": "model-00003.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_76.weight",
        "dtype": "U32",
        "shape": [
          2500012,
          20
        ],
        "offset": 7725056064,
        "size": 200000960,
        "group": "ngram"
      },
      "offset": 32423680,
      "size_per_tensor": 8388608,
      "sha256": "916400b352d65567e83abf72c2496c974bb8ebc438ff3564f898d9c68958c40c",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8084824,
          "fraction": 0.9637861251831055,
          "encode_seconds_diagnostic": 0.009898957796394825,
          "decode_seconds_diagnostic": 0.006633290788158774,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 8079341,
          "fraction": 0.9631325006484985,
          "encode_seconds_diagnostic": 0.49592841579578817,
          "decode_seconds_diagnostic": 0.006900666980072856,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8072121,
          "fraction": 0.9622718095779419,
          "encode_seconds_diagnostic": 0.02796712494455278,
          "decode_seconds_diagnostic": 0.02468154113739729,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8009249,
          "fraction": 0.9547768831253052,
          "encode_seconds_diagnostic": 0.10995479091070592,
          "decode_seconds_diagnostic": 0.2290765829384327,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8010957,
          "fraction": 0.9549804925918579,
          "encode_seconds_diagnostic": 0.06000845902599394,
          "decode_seconds_diagnostic": 0.17265424993820488,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7990729,
          "fraction": 0.9525691270828247,
          "encode_seconds_diagnostic": 0.12499245791696012,
          "decode_seconds_diagnostic": 0.2467176248319447,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 8004589,
          "fraction": 0.9542213678359985,
          "encode_seconds_diagnostic": 0.07375808409415185,
          "decode_seconds_diagnostic": 0.18879483407363296,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "weights"
      ],
      "population_bytes": 25600122880,
      "sample_index": 11,
      "tensor": {
        "file": "model-00003.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_89.weight",
        "dtype": "U32",
        "shape": [
          2500012,
          20
        ],
        "offset": 1725027264,
        "size": 200000960,
        "group": "ngram"
      },
      "offset": 98586624,
      "size_per_tensor": 8388608,
      "sha256": "ec2f0f4ef087a0ea5b5a22c4a3ad3456536c233963eef33ec3b911655f79702e",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8085446,
          "fraction": 0.963860273361206,
          "encode_seconds_diagnostic": 0.009867792017757893,
          "decode_seconds_diagnostic": 0.00662812520749867,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 8078559,
          "fraction": 0.9630392789840698,
          "encode_seconds_diagnostic": 0.5109571670182049,
          "decode_seconds_diagnostic": 0.0070319578517228365,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8073312,
          "fraction": 0.9624137878417969,
          "encode_seconds_diagnostic": 0.031502542085945606,
          "decode_seconds_diagnostic": 0.02532358397729695,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8009653,
          "fraction": 0.9548250436782837,
          "encode_seconds_diagnostic": 0.11439004214480519,
          "decode_seconds_diagnostic": 0.2517224580515176,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8011428,
          "fraction": 0.9550366401672363,
          "encode_seconds_diagnostic": 0.060388042125850916,
          "decode_seconds_diagnostic": 0.1816353329923004,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7991033,
          "fraction": 0.9526053667068481,
          "encode_seconds_diagnostic": 0.13464549998752773,
          "decode_seconds_diagnostic": 0.2570247082039714,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 8004902,
          "fraction": 0.9542586803436279,
          "encode_seconds_diagnostic": 0.07655575009994209,
          "decode_seconds_diagnostic": 0.19920820812694728,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "weights"
      ],
      "population_bytes": 25600122880,
      "sample_index": 12,
      "tensor": {
        "file": "model-00003.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_96.weight",
        "dtype": "U32",
        "shape": [
          2500012,
          20
        ],
        "offset": 2450030744,
        "size": 200000960,
        "group": "ngram"
      },
      "offset": 128140544,
      "size_per_tensor": 8388608,
      "sha256": "9a09631a57d9c035a26e9df879bb944502570ae2a828962c3376285514d91489",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8084436,
          "fraction": 0.9637398719787598,
          "encode_seconds_diagnostic": 0.011697874870151281,
          "decode_seconds_diagnostic": 0.007295917021110654,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 8078398,
          "fraction": 0.9630200862884521,
          "encode_seconds_diagnostic": 0.5557130421511829,
          "decode_seconds_diagnostic": 0.007267832988873124,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8071392,
          "fraction": 0.9621849060058594,
          "encode_seconds_diagnostic": 0.029502624878659844,
          "decode_seconds_diagnostic": 0.02491754200309515,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8008087,
          "fraction": 0.9546383619308472,
          "encode_seconds_diagnostic": 0.11510729207657278,
          "decode_seconds_diagnostic": 0.24801033409312367,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8009877,
          "fraction": 0.9548517465591431,
          "encode_seconds_diagnostic": 0.06425658403895795,
          "decode_seconds_diagnostic": 0.1860428329091519,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7990109,
          "fraction": 0.9524952173233032,
          "encode_seconds_diagnostic": 0.13156683393754065,
          "decode_seconds_diagnostic": 0.26603879197500646,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 8004083,
          "fraction": 0.9541610479354858,
          "encode_seconds_diagnostic": 0.08030712488107383,
          "decode_seconds_diagnostic": 0.20467083295807242,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "weights"
      ],
      "population_bytes": 25600122880,
      "sample_index": 13,
      "tensor": {
        "file": "model-00004.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_108.weight",
        "dtype": "U32",
        "shape": [
          2500012,
          20
        ],
        "offset": 7078917302,
        "size": 200000960,
        "group": "ngram"
      },
      "offset": 105140224,
      "size_per_tensor": 8388608,
      "sha256": "3924f01789975901b0cd0669098bb746009c770c1d5a4c2c6743e2976e947fb3",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8085090,
          "fraction": 0.963817834854126,
          "encode_seconds_diagnostic": 0.010917874984443188,
          "decode_seconds_diagnostic": 0.0070015001110732555,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 8079341,
          "fraction": 0.9631325006484985,
          "encode_seconds_diagnostic": 0.5646064581815153,
          "decode_seconds_diagnostic": 0.007322417106479406,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8073106,
          "fraction": 0.9623892307281494,
          "encode_seconds_diagnostic": 0.02950270799919963,
          "decode_seconds_diagnostic": 0.026168917072936893,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8009293,
          "fraction": 0.9547821283340454,
          "encode_seconds_diagnostic": 0.11004220810718834,
          "decode_seconds_diagnostic": 0.24330183397978544,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8011051,
          "fraction": 0.9549916982650757,
          "encode_seconds_diagnostic": 0.06261641695164144,
          "decode_seconds_diagnostic": 0.18497187504544854,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7991077,
          "fraction": 0.9526106119155884,
          "encode_seconds_diagnostic": 0.13488041702657938,
          "decode_seconds_diagnostic": 0.2652702908962965,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 8004917,
          "fraction": 0.9542604684829712,
          "encode_seconds_diagnostic": 0.07988599990494549,
          "decode_seconds_diagnostic": 0.20434604212641716,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "weights"
      ],
      "population_bytes": 25600122880,
      "sample_index": 14,
      "tensor": {
        "file": "model-00004.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_117.weight",
        "dtype": "U32",
        "shape": [
          2500012,
          20
        ],
        "offset": 7303918382,
        "size": 200000960,
        "group": "ngram"
      },
      "offset": 187977216,
      "size_per_tensor": 8388608,
      "sha256": "9ee86d9c99d68e3b5cdcba60dcca321b9d34e753d45ca6f9fffa808809b83746",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8085056,
          "fraction": 0.9638137817382812,
          "encode_seconds_diagnostic": 0.011328124906867743,
          "decode_seconds_diagnostic": 0.007239250000566244,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 8080477,
          "fraction": 0.9632679224014282,
          "encode_seconds_diagnostic": 0.5592752499505877,
          "decode_seconds_diagnostic": 0.007316875038668513,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8074033,
          "fraction": 0.962499737739563,
          "encode_seconds_diagnostic": 0.02993462490849197,
          "decode_seconds_diagnostic": 0.026367624988779426,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8008717,
          "fraction": 0.9547134637832642,
          "encode_seconds_diagnostic": 0.11508925002999604,
          "decode_seconds_diagnostic": 0.23961679195053875,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8010484,
          "fraction": 0.9549241065979004,
          "encode_seconds_diagnostic": 0.05706883314996958,
          "decode_seconds_diagnostic": 0.17408924992196262,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7990375,
          "fraction": 0.9525269269943237,
          "encode_seconds_diagnostic": 0.12210487481206656,
          "decode_seconds_diagnostic": 0.24305024999193847,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 8004314,
          "fraction": 0.9541885852813721,
          "encode_seconds_diagnostic": 0.07201133389025927,
          "decode_seconds_diagnostic": 0.18831629189662635,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "ngram",
        "weights"
      ],
      "population_bytes": 25600122880,
      "sample_index": 15,
      "tensor": {
        "file": "model-00004.safetensors",
        "name": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_124.weight",
        "dtype": "U32",
        "shape": [
          2500012,
          20
        ],
        "offset": 4784882238,
        "size": 200000960,
        "group": "ngram"
      },
      "offset": 156073216,
      "size_per_tensor": 8388608,
      "sha256": "b24c383dfdf895aa43593ed75d166be03fabd8f37ad07270c194a9951d251172",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8086566,
          "fraction": 0.9639937877655029,
          "encode_seconds_diagnostic": 0.01080499985255301,
          "decode_seconds_diagnostic": 0.006709125125780702,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 8079964,
          "fraction": 0.9632067680358887,
          "encode_seconds_diagnostic": 0.4981114170514047,
          "decode_seconds_diagnostic": 0.006788667058572173,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 8074176,
          "fraction": 0.9625167846679688,
          "encode_seconds_diagnostic": 0.02648958400823176,
          "decode_seconds_diagnostic": 0.024105583084747195,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8011353,
          "fraction": 0.95502769947052,
          "encode_seconds_diagnostic": 0.11030962504446507,
          "decode_seconds_diagnostic": 0.2289734580554068,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 8013132,
          "fraction": 0.9552397727966309,
          "encode_seconds_diagnostic": 0.05704658292233944,
          "decode_seconds_diagnostic": 0.17300279205664992,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7992882,
          "fraction": 0.9528257846832275,
          "encode_seconds_diagnostic": 0.12439516605809331,
          "decode_seconds_diagnostic": 0.24249641690403223,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 8006785,
          "fraction": 0.954483151435852,
          "encode_seconds_diagnostic": 0.07281987508758903,
          "decode_seconds_diagnostic": 0.1901042500976473,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "other",
        "bf16"
      ],
      "population_bytes": 1093924320,
      "sample_index": 0,
      "tensor": {
        "file": "model-00001.safetensors",
        "name": "vision_tower.blocks.1.mlp.linear_fc2.weight",
        "dtype": "BF16",
        "shape": [
          1152,
          4304
        ],
        "offset": 6970257641,
        "size": 9916416,
        "group": "other"
      },
      "offset": 378368,
      "size_per_tensor": 8388608,
      "sha256": "e8a6d256b863ab38d1da770990c3dd5c43d0a446a2ded985926713696c58defd",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 6589054,
          "fraction": 0.7854764461517334,
          "encode_seconds_diagnostic": 0.0069696251302957535,
          "decode_seconds_diagnostic": 0.006133249960839748,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 5673967,
          "fraction": 0.6763895750045776,
          "encode_seconds_diagnostic": 1.1904597920365632,
          "decode_seconds_diagnostic": 0.009813166921958327,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 6279835,
          "fraction": 0.7486146688461304,
          "encode_seconds_diagnostic": 0.3643562919460237,
          "decode_seconds_diagnostic": 0.02651433297432959,
          "roundtrip_exact": true
        },
        {
          "method": "ans",
          "original_bytes": 8388608,
          "compressed_bytes": 5581874,
          "fraction": 0.6654112339019775,
          "encode_seconds_diagnostic": 0.023457667091861367,
          "decode_seconds_diagnostic": 0.1425429170485586,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "other",
        "bf16"
      ],
      "population_bytes": 1093924320,
      "sample_index": 1,
      "tensor": {
        "file": "model-00001.safetensors",
        "name": "vision_tower.blocks.14.attn.proj.weight",
        "dtype": "BF16",
        "shape": [
          1152,
          1152
        ],
        "offset": 6839516561,
        "size": 2654208,
        "group": "other"
      },
      "offset": 0,
      "size_per_tensor": 2654208,
      "sha256": "0fdbd4a166b264917cb5bcffa51bac177d519ded8c07dabfaf5c42744ee53bbd",
      "original_bytes": 2654208,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 2654208,
          "compressed_bytes": 2063826,
          "fraction": 0.7775675455729166,
          "encode_seconds_diagnostic": 0.0020844999235123396,
          "decode_seconds_diagnostic": 0.0018694589380174875,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 2654208,
          "compressed_bytes": 1819059,
          "fraction": 0.6853490758825231,
          "encode_seconds_diagnostic": 0.31330995890311897,
          "decode_seconds_diagnostic": 0.004205249948427081,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd19",
          "original_bytes": 2654208,
          "compressed_bytes": 1978472,
          "fraction": 0.745409553433642,
          "encode_seconds_diagnostic": 0.09385591582395136,
          "decode_seconds_diagnostic": 0.009152958169579506,
          "roundtrip_exact": true
        },
        {
          "method": "ans",
          "original_bytes": 2654208,
          "compressed_bytes": 1745675,
          "fraction": 0.6577009036217207,
          "encode_seconds_diagnostic": 0.0075584170408546925,
          "decode_seconds_diagnostic": 0.04509508307091892,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "other",
        "bf16"
      ],
      "population_bytes": 1093924320,
      "sample_index": 2,
      "tensor": {
        "file": "model-00001.safetensors",
        "name": "vision_tower.blocks.2.mlp.linear_fc2.weight",
        "dtype": "BF16",
        "shape": [
          1152,
          4304
        ],
        "offset": 8223944017,
        "size": 9916416,
        "group": "other"
      },
      "offset": 814592,
      "size_per_tensor": 8388608,
      "sha256": "e45373887f9577873613059821ec6f40ef2cbc9647f5ff83b9b1a1ed5b15a940",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 6629758,
          "fraction": 0.7903287410736084,
          "encode_seconds_diagnostic": 0.006430333014577627,
          "decode_seconds_diagnostic": 0.006064375163987279,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 5714663,
          "fraction": 0.6812409162521362,
          "encode_seconds_diagnostic": 2.1881837921682745,
          "decode_seconds_diagnostic": 0.012650709133595228,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 6295305,
          "fraction": 0.750458836555481,
          "encode_seconds_diagnostic": 0.49677720782347023,
          "decode_seconds_diagnostic": 0.035773999989032745,
          "roundtrip_exact": true
        },
        {
          "method": "ans",
          "original_bytes": 8388608,
          "compressed_bytes": 5630871,
          "fraction": 0.6712521314620972,
          "encode_seconds_diagnostic": 0.030729416059330106,
          "decode_seconds_diagnostic": 0.18326766602694988,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "other",
        "bf16"
      ],
      "population_bytes": 1093924320,
      "sample_index": 3,
      "tensor": {
        "file": "model-00001.safetensors",
        "name": "vision_tower.blocks.21.attn.proj.weight",
        "dtype": "BF16",
        "shape": [
          1152,
          1152
        ],
        "offset": 6048982913,
        "size": 2654208,
        "group": "other"
      },
      "offset": 0,
      "size_per_tensor": 2654208,
      "sha256": "cf28cfc71229880069f8537744a8e32fa43f4d9def8c13d04c67b5780eae61cb",
      "original_bytes": 2654208,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 2654208,
          "compressed_bytes": 2065849,
          "fraction": 0.7783297315055941,
          "encode_seconds_diagnostic": 0.002830041106790304,
          "decode_seconds_diagnostic": 0.0027502088341861963,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 2654208,
          "compressed_bytes": 1820676,
          "fraction": 0.6859582971643519,
          "encode_seconds_diagnostic": 0.40927420905791223,
          "decode_seconds_diagnostic": 0.0053731659427285194,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd19",
          "original_bytes": 2654208,
          "compressed_bytes": 1981668,
          "fraction": 0.7466136791087963,
          "encode_seconds_diagnostic": 0.10913100000470877,
          "decode_seconds_diagnostic": 0.011771874967962503,
          "roundtrip_exact": true
        },
        {
          "method": "ans",
          "original_bytes": 2654208,
          "compressed_bytes": 1747099,
          "fraction": 0.6582374101803626,
          "encode_seconds_diagnostic": 0.009353416971862316,
          "decode_seconds_diagnostic": 0.059476499911397696,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "other",
        "bf16"
      ],
      "population_bytes": 1093924320,
      "sample_index": 4,
      "tensor": {
        "file": "model-00001.safetensors",
        "name": "vision_tower.blocks.4.mlp.linear_fc1.weight",
        "dtype": "BF16",
        "shape": [
          4304,
          1152
        ],
        "offset": 10003457569,
        "size": 9916416,
        "group": "other"
      },
      "offset": 773376,
      "size_per_tensor": 8388608,
      "sha256": "2f5826123318a722c6711e1d490253849f24292126f58e913e16d0d3432ecec1",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 6554340,
          "fraction": 0.7813382148742676,
          "encode_seconds_diagnostic": 0.009645082987844944,
          "decode_seconds_diagnostic": 0.007848749868571758,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 5717178,
          "fraction": 0.6815407276153564,
          "encode_seconds_diagnostic": 2.0744082091841847,
          "decode_seconds_diagnostic": 0.014077124884352088,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 6210864,
          "fraction": 0.7403926849365234,
          "encode_seconds_diagnostic": 0.49589091702364385,
          "decode_seconds_diagnostic": 0.03583445795811713,
          "roundtrip_exact": true
        },
        {
          "method": "ans",
          "original_bytes": 8388608,
          "compressed_bytes": 5539970,
          "fraction": 0.6604158878326416,
          "encode_seconds_diagnostic": 0.029826082987710834,
          "decode_seconds_diagnostic": 0.18679079203866422,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "other",
        "bf16"
      ],
      "population_bytes": 1093924320,
      "sample_index": 5,
      "tensor": {
        "file": "model-00001.safetensors",
        "name": "vision_tower.blocks.7.attn.qkv.weight",
        "dtype": "BF16",
        "shape": [
          3456,
          1152
        ],
        "offset": 9987527713,
        "size": 7962624,
        "group": "other"
      },
      "offset": 0,
      "size_per_tensor": 7962624,
      "sha256": "1d4e00fbd5e1a6aef95127712e89257fdaa933fa7674022a25c702aa60abeb13",
      "original_bytes": 7962624,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 7962624,
          "compressed_bytes": 6208197,
          "fraction": 0.7796672302999614,
          "encode_seconds_diagnostic": 0.008336207829415798,
          "decode_seconds_diagnostic": 0.007943958975374699,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 7962624,
          "compressed_bytes": 5462315,
          "fraction": 0.685994340559092,
          "encode_seconds_diagnostic": 1.9317199161741883,
          "decode_seconds_diagnostic": 0.014594125095754862,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd19",
          "original_bytes": 7962624,
          "compressed_bytes": 5907794,
          "fraction": 0.7419405964666924,
          "encode_seconds_diagnostic": 0.4600179579574615,
          "decode_seconds_diagnostic": 0.034455624874681234,
          "roundtrip_exact": true
        },
        {
          "method": "ans",
          "original_bytes": 7962624,
          "compressed_bytes": 5255188,
          "fraction": 0.6599819356031379,
          "encode_seconds_diagnostic": 0.028805541805922985,
          "decode_seconds_diagnostic": 0.17716637509875,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "other",
        "bf16"
      ],
      "population_bytes": 1093924320,
      "sample_index": 6,
      "tensor": {
        "file": "model-00001.safetensors",
        "name": "vision_tower.merger.linear_fc1.weight",
        "dtype": "BF16",
        "shape": [
          4608,
          4608
        ],
        "offset": 6797049233,
        "size": 42467328,
        "group": "other"
      },
      "offset": 4626944,
      "size_per_tensor": 8388608,
      "sha256": "b30a39ab9cca3edbd620d72a3f19f642b2bf42d82fdaa54c1e935b2c917b856b",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 6528609,
          "fraction": 0.7782708406448364,
          "encode_seconds_diagnostic": 0.009192540775984526,
          "decode_seconds_diagnostic": 0.008033541962504387,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 5605506,
          "fraction": 0.6682283878326416,
          "encode_seconds_diagnostic": 2.1095853748265654,
          "decode_seconds_diagnostic": 0.01274749985896051,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 6268360,
          "fraction": 0.7472467422485352,
          "encode_seconds_diagnostic": 0.4948260420933366,
          "decode_seconds_diagnostic": 0.035573665983974934,
          "roundtrip_exact": true
        },
        {
          "method": "ans",
          "original_bytes": 8388608,
          "compressed_bytes": 5496550,
          "fraction": 0.6552398204803467,
          "encode_seconds_diagnostic": 0.030984416836872697,
          "decode_seconds_diagnostic": 0.18602599995210767,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "other",
        "bf16"
      ],
      "population_bytes": 1093924320,
      "sample_index": 7,
      "tensor": {
        "file": "model-00008.safetensors",
        "name": "language_model.model.layers.36.attn_hyper_connection.block_inject_weight.weight",
        "dtype": "BF16",
        "shape": [
          4,
          10240
        ],
        "offset": 3148665275,
        "size": 81920,
        "group": "other"
      },
      "offset": 0,
      "size_per_tensor": 81920,
      "sha256": "a576d6fa727dd980e82a204e1681549d30f8860686d3b8486988b9f71313ed0e",
      "original_bytes": 81920,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 81920,
          "compressed_bytes": 65989,
          "fraction": 0.80552978515625,
          "encode_seconds_diagnostic": 7.637497037649155e-05,
          "decode_seconds_diagnostic": 9.87909734249115e-05,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 81920,
          "compressed_bytes": 58075,
          "fraction": 0.70892333984375,
          "encode_seconds_diagnostic": 0.011433374835178256,
          "decode_seconds_diagnostic": 0.00023720902390778065,
          "roundtrip_exact": true
        },
        {
          "method": "planes/zstd19",
          "original_bytes": 81920,
          "compressed_bytes": 60575,
          "fraction": 0.73944091796875,
          "encode_seconds_diagnostic": 0.004756625043228269,
          "decode_seconds_diagnostic": 0.00038824998773634434,
          "roundtrip_exact": true
        },
        {
          "method": "ans",
          "original_bytes": 81920,
          "compressed_bytes": 59387,
          "fraction": 0.72493896484375,
          "encode_seconds_diagnostic": 0.000587834045290947,
          "decode_seconds_diagnostic": 0.001950457924976945,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "other",
        "pairs"
      ],
      "population_bytes": 303104000,
      "sample_index": 0,
      "tensor": {
        "file": "model-00001.safetensors",
        "name": "language_model.model.layers.0.linear_attn.in_proj_qkv.scales",
        "dtype": "BF16",
        "shape": [
          10240,
          40
        ],
        "offset": 9429955273,
        "size": 819200,
        "group": "other"
      },
      "offset": 0,
      "size_per_tensor": 819200,
      "sha256": "6660fc2c63eb72d9dec9d2df9056cf12198a58a1d6eb61787efa4f2790f139c4",
      "original_bytes": 1638400,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 1638400,
          "compressed_bytes": 1109040,
          "fraction": 0.676904296875,
          "encode_seconds_diagnostic": 0.007160709006711841,
          "decode_seconds_diagnostic": 0.0020270829554647207,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 1638400,
          "compressed_bytes": 943795,
          "fraction": 0.5760467529296875,
          "encode_seconds_diagnostic": 0.26924999989569187,
          "decode_seconds_diagnostic": 0.003680499969050288,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 1638400,
          "compressed_bytes": 633095,
          "fraction": 0.3864105224609375,
          "encode_seconds_diagnostic": 0.006190665997564793,
          "decode_seconds_diagnostic": 0.005220457911491394,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 1638400,
          "compressed_bytes": 619702,
          "fraction": 0.378236083984375,
          "encode_seconds_diagnostic": 0.023719791090115905,
          "decode_seconds_diagnostic": 0.004712249850854278,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 1638400,
          "compressed_bytes": 581769,
          "fraction": 0.3550836181640625,
          "encode_seconds_diagnostic": 0.38863658299669623,
          "decode_seconds_diagnostic": 0.0044557079672813416,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 1638400,
          "compressed_bytes": 544042,
          "fraction": 0.332056884765625,
          "encode_seconds_diagnostic": 0.012010040925815701,
          "decode_seconds_diagnostic": 0.046264125034213066,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "other",
        "pairs"
      ],
      "population_bytes": 303104000,
      "sample_index": 1,
      "tensor": {
        "file": "model-00006.safetensors",
        "name": "language_model.model.layers.20.linear_attn.in_proj_qkv.scales",
        "dtype": "BF16",
        "shape": [
          10240,
          40
        ],
        "offset": 4980574743,
        "size": 819200,
        "group": "other"
      },
      "offset": 0,
      "size_per_tensor": 819200,
      "sha256": "ac6f6777e5ef7135f9d0d724fd547bd8fa1a954162a62afeb67f4170dadbea47",
      "original_bytes": 1638400,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 1638400,
          "compressed_bytes": 1119512,
          "fraction": 0.6832958984375,
          "encode_seconds_diagnostic": 0.004802916198968887,
          "decode_seconds_diagnostic": 0.0015862078871577978,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 1638400,
          "compressed_bytes": 954236,
          "fraction": 0.58241943359375,
          "encode_seconds_diagnostic": 0.2592061669565737,
          "decode_seconds_diagnostic": 0.0037175831384956837,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 1638400,
          "compressed_bytes": 647803,
          "fraction": 0.3953875732421875,
          "encode_seconds_diagnostic": 0.006375584052875638,
          "decode_seconds_diagnostic": 0.004909582901746035,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 1638400,
          "compressed_bytes": 633580,
          "fraction": 0.38670654296875,
          "encode_seconds_diagnostic": 0.024444042006507516,
          "decode_seconds_diagnostic": 0.004322458058595657,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 1638400,
          "compressed_bytes": 595043,
          "fraction": 0.3631854248046875,
          "encode_seconds_diagnostic": 0.5119626251980662,
          "decode_seconds_diagnostic": 0.00560875004157424,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 1638400,
          "compressed_bytes": 558108,
          "fraction": 0.34064208984375,
          "encode_seconds_diagnostic": 0.012292749946936965,
          "decode_seconds_diagnostic": 0.04650008399039507,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "other",
        "pairs"
      ],
      "population_bytes": 303104000,
      "sample_index": 2,
      "tensor": {
        "file": "model-00007.safetensors",
        "name": "language_model.model.layers.28.linear_attn.out_proj.scales",
        "dtype": "BF16",
        "shape": [
          2560,
          96
        ],
        "offset": 8132963396,
        "size": 491520,
        "group": "other"
      },
      "offset": 0,
      "size_per_tensor": 491520,
      "sha256": "c4b61920d5449bd7c73a142c5faa6ffada3d0dfbbd0e4792caf5425bb691af24",
      "original_bytes": 983040,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 983040,
          "compressed_bytes": 669329,
          "fraction": 0.6808766682942708,
          "encode_seconds_diagnostic": 0.005358624970540404,
          "decode_seconds_diagnostic": 0.0011379590723663568,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 983040,
          "compressed_bytes": 570646,
          "fraction": 0.5804911295572917,
          "encode_seconds_diagnostic": 0.2230900840368122,
          "decode_seconds_diagnostic": 0.002230915939435363,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 983040,
          "compressed_bytes": 370332,
          "fraction": 0.37672119140625,
          "encode_seconds_diagnostic": 0.0041905411053448915,
          "decode_seconds_diagnostic": 0.003314583096653223,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 983040,
          "compressed_bytes": 360232,
          "fraction": 0.3664469401041667,
          "encode_seconds_diagnostic": 0.02078329212963581,
          "decode_seconds_diagnostic": 0.0027143750339746475,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 983040,
          "compressed_bytes": 341631,
          "fraction": 0.3475250244140625,
          "encode_seconds_diagnostic": 0.27789374999701977,
          "decode_seconds_diagnostic": 0.002281125169247389,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 983040,
          "compressed_bytes": 315029,
          "fraction": 0.32046407063802085,
          "encode_seconds_diagnostic": 0.006024416070431471,
          "decode_seconds_diagnostic": 0.026964667020365596,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "other",
        "pairs"
      ],
      "population_bytes": 303104000,
      "sample_index": 3,
      "tensor": {
        "file": "model-00007.safetensors",
        "name": "language_model.model.layers.31.self_attn.o_proj.scales",
        "dtype": "BF16",
        "shape": [
          2560,
          96
        ],
        "offset": 3458628,
        "size": 491520,
        "group": "other"
      },
      "offset": 0,
      "size_per_tensor": 491520,
      "sha256": "d81c8a0d56404e5b2b0ec1493d89f97b51d1488748a92c6f3d53a6f4fa0ca5a3",
      "original_bytes": 983040,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 983040,
          "compressed_bytes": 684173,
          "fraction": 0.6959767659505208,
          "encode_seconds_diagnostic": 0.003225624794140458,
          "decode_seconds_diagnostic": 0.0009068751242011786,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 983040,
          "compressed_bytes": 580307,
          "fraction": 0.5903188069661458,
          "encode_seconds_diagnostic": 0.3094180829357356,
          "decode_seconds_diagnostic": 0.0018144578207284212,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 983040,
          "compressed_bytes": 383670,
          "fraction": 0.390289306640625,
          "encode_seconds_diagnostic": 0.0034491668920964003,
          "decode_seconds_diagnostic": 0.002429791959002614,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 983040,
          "compressed_bytes": 373925,
          "fraction": 0.3803761800130208,
          "encode_seconds_diagnostic": 0.015470708021894097,
          "decode_seconds_diagnostic": 0.0023534169886261225,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 983040,
          "compressed_bytes": 355944,
          "fraction": 0.3620849609375,
          "encode_seconds_diagnostic": 0.6005878751166165,
          "decode_seconds_diagnostic": 0.0027458330150693655,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 983040,
          "compressed_bytes": 322351,
          "fraction": 0.32791239420572915,
          "encode_seconds_diagnostic": 0.008250124985352159,
          "decode_seconds_diagnostic": 0.03902912512421608,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "other",
        "pairs"
      ],
      "population_bytes": 303104000,
      "sample_index": 4,
      "tensor": {
        "file": "model-00009.safetensors",
        "name": "language_model.model.layers.44.linear_attn.in_proj_z.scales",
        "dtype": "BF16",
        "shape": [
          6144,
          40
        ],
        "offset": 970218572,
        "size": 491520,
        "group": "other"
      },
      "offset": 0,
      "size_per_tensor": 491520,
      "sha256": "3982db8e5a2bfd3a78b06c25b2ca0de176237c37476821528df30443cd6867ea",
      "original_bytes": 983040,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 983040,
          "compressed_bytes": 692213,
          "fraction": 0.7041554768880208,
          "encode_seconds_diagnostic": 0.003814249997958541,
          "decode_seconds_diagnostic": 0.0012930829543620348,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 983040,
          "compressed_bytes": 592540,
          "fraction": 0.6027628580729166,
          "encode_seconds_diagnostic": 0.3008111249655485,
          "decode_seconds_diagnostic": 0.002179959090426564,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 983040,
          "compressed_bytes": 400766,
          "fraction": 0.40768025716145834,
          "encode_seconds_diagnostic": 0.005918166134506464,
          "decode_seconds_diagnostic": 0.00391162489540875,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 983040,
          "compressed_bytes": 390650,
          "fraction": 0.3973897298177083,
          "encode_seconds_diagnostic": 0.02259379206225276,
          "decode_seconds_diagnostic": 0.0044328749645501375,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 983040,
          "compressed_bytes": 366110,
          "fraction": 0.3724263509114583,
          "encode_seconds_diagnostic": 0.3894585829693824,
          "decode_seconds_diagnostic": 0.0035098749212920666,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 983040,
          "compressed_bytes": 345040,
          "fraction": 0.3509928385416667,
          "encode_seconds_diagnostic": 0.008728792192414403,
          "decode_seconds_diagnostic": 0.03429654217325151,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "other",
        "pairs"
      ],
      "population_bytes": 303104000,
      "sample_index": 5,
      "tensor": {
        "file": "model-00010.safetensors",
        "name": "language_model.model.layers.7.self_attn.o_proj.scales",
        "dtype": "BF16",
        "shape": [
          2560,
          96
        ],
        "offset": 586156658,
        "size": 491520,
        "group": "other"
      },
      "offset": 0,
      "size_per_tensor": 491520,
      "sha256": "c34cf24cefec1ec4ebce82769a91a415beb25061737190ee1697d6efb994d55d",
      "original_bytes": 983040,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 983040,
          "compressed_bytes": 674528,
          "fraction": 0.6861653645833333,
          "encode_seconds_diagnostic": 0.0035842088982462883,
          "decode_seconds_diagnostic": 0.0011143749579787254,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 983040,
          "compressed_bytes": 575116,
          "fraction": 0.5850382486979167,
          "encode_seconds_diagnostic": 0.19008612516336143,
          "decode_seconds_diagnostic": 0.0023564579896628857,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 983040,
          "compressed_bytes": 382404,
          "fraction": 0.38900146484375,
          "encode_seconds_diagnostic": 0.00411766697652638,
          "decode_seconds_diagnostic": 0.0030096250120550394,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 983040,
          "compressed_bytes": 372719,
          "fraction": 0.37914937337239585,
          "encode_seconds_diagnostic": 0.019081417005509138,
          "decode_seconds_diagnostic": 0.003343291813507676,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 983040,
          "compressed_bytes": 353504,
          "fraction": 0.35960286458333335,
          "encode_seconds_diagnostic": 0.26831279089674354,
          "decode_seconds_diagnostic": 0.0027118748985230923,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 983040,
          "compressed_bytes": 321969,
          "fraction": 0.3275238037109375,
          "encode_seconds_diagnostic": 0.00766733312048018,
          "decode_seconds_diagnostic": 0.02979041705839336,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "other",
        "pairs"
      ],
      "population_bytes": 303104000,
      "sample_index": 6,
      "tensor": {
        "file": "model-00011.safetensors",
        "name": "language_model.lm_head.scales",
        "dtype": "BF16",
        "shape": [
          248320,
          40
        ],
        "offset": 1722378080,
        "size": 19865600,
        "group": "other"
      },
      "offset": 15020032,
      "size_per_tensor": 4194304,
      "sha256": "427366fc5808e80d45f0b00132b7b36a272303a5ceb3db433ec33c45126ed212",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5558130,
          "fraction": 0.6625807285308838,
          "encode_seconds_diagnostic": 0.03915612492710352,
          "decode_seconds_diagnostic": 0.010682583088055253,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4711034,
          "fraction": 0.5615990161895752,
          "encode_seconds_diagnostic": 2.162158250110224,
          "decode_seconds_diagnostic": 0.019863750087097287,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 2940840,
          "fraction": 0.35057544708251953,
          "encode_seconds_diagnostic": 0.027407540939748287,
          "decode_seconds_diagnostic": 0.026234040968120098,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 2850160,
          "fraction": 0.3397655487060547,
          "encode_seconds_diagnostic": 0.12311725015752017,
          "decode_seconds_diagnostic": 0.023742249934002757,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2673685,
          "fraction": 0.31872808933258057,
          "encode_seconds_diagnostic": 2.7927788340020925,
          "decode_seconds_diagnostic": 0.025217542191967368,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2567915,
          "fraction": 0.30611932277679443,
          "encode_seconds_diagnostic": 0.05915066599845886,
          "decode_seconds_diagnostic": 0.23972274991683662,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "other",
        "pairs"
      ],
      "population_bytes": 303104000,
      "sample_index": 7,
      "tensor": {
        "file": "model-00011.safetensors",
        "name": "language_model.model.embed_tokens.scales",
        "dtype": "BF16",
        "shape": [
          248320,
          40
        ],
        "offset": 1702512480,
        "size": 19865600,
        "group": "other"
      },
      "offset": 12798720,
      "size_per_tensor": 4194304,
      "sha256": "d4cd3ffb7fbd7ccc3ff5b7ddf604f0dc01016a0219c7e3e814576263244ec70c",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 5432396,
          "fraction": 0.6475920677185059,
          "encode_seconds_diagnostic": 0.04161183396354318,
          "decode_seconds_diagnostic": 0.010495790978893638,
          "roundtrip_exact": true
        },
        {
          "method": "shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 4575783,
          "fraction": 0.5454758405685425,
          "encode_seconds_diagnostic": 2.1478746661450714,
          "decode_seconds_diagnostic": 0.018895833054557443,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 2957304,
          "fraction": 0.3525381088256836,
          "encode_seconds_diagnostic": 0.029318124987185,
          "decode_seconds_diagnostic": 0.027074749814346433,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd9",
          "original_bytes": 8388608,
          "compressed_bytes": 2861735,
          "fraction": 0.341145396232605,
          "encode_seconds_diagnostic": 0.12403112486936152,
          "decode_seconds_diagnostic": 0.024056541034951806,
          "roundtrip_exact": true
        },
        {
          "method": "pred_shuffle2/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 2681123,
          "fraction": 0.3196147680282593,
          "encode_seconds_diagnostic": 2.739547583973035,
          "decode_seconds_diagnostic": 0.023966250009834766,
          "roundtrip_exact": true
        },
        {
          "method": "pred_ans",
          "original_bytes": 8388608,
          "compressed_bytes": 2552211,
          "fraction": 0.30424726009368896,
          "encode_seconds_diagnostic": 0.05990625009872019,
          "decode_seconds_diagnostic": 0.2339304171036929,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "other",
        "weights"
      ],
      "population_bytes": 2424832000,
      "sample_index": 0,
      "tensor": {
        "file": "model-00001.safetensors",
        "name": "language_model.model.layers.0.linear_attn.in_proj_qkv.weight",
        "dtype": "U32",
        "shape": [
          10240,
          320
        ],
        "offset": 5218663609,
        "size": 13107200,
        "group": "other"
      },
      "offset": 250112,
      "size_per_tensor": 8388608,
      "sha256": "9f6a4391b4e9579db77b2993f48845d2db920a7732a98088624981275cacdd5f",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7662721,
          "fraction": 0.913467526435852,
          "encode_seconds_diagnostic": 0.009896665811538696,
          "decode_seconds_diagnostic": 0.00793679105117917,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 7667470,
          "fraction": 0.9140336513519287,
          "encode_seconds_diagnostic": 0.7638783329166472,
          "decode_seconds_diagnostic": 0.00848166598007083,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7565802,
          "fraction": 0.9019138813018799,
          "encode_seconds_diagnostic": 0.033389125019311905,
          "decode_seconds_diagnostic": 0.03262316691689193,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7504120,
          "fraction": 0.8945608139038086,
          "encode_seconds_diagnostic": 0.1408879158552736,
          "decode_seconds_diagnostic": 0.3089607909787446,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7505931,
          "fraction": 0.8947767019271851,
          "encode_seconds_diagnostic": 0.06890554097481072,
          "decode_seconds_diagnostic": 0.21309704100713134,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7481545,
          "fraction": 0.8918696641921997,
          "encode_seconds_diagnostic": 0.15604779217392206,
          "decode_seconds_diagnostic": 0.2633294169791043,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7505968,
          "fraction": 0.8947811126708984,
          "encode_seconds_diagnostic": 0.08690383308567107,
          "decode_seconds_diagnostic": 0.2982876671012491,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "other",
        "weights"
      ],
      "population_bytes": 2424832000,
      "sample_index": 1,
      "tensor": {
        "file": "model-00006.safetensors",
        "name": "language_model.model.layers.19.mlp_hyper_connection.input_mix_weight_down.weight",
        "dtype": "U32",
        "shape": [
          320,
          1280
        ],
        "offset": 6013893335,
        "size": 1638400,
        "group": "other"
      },
      "offset": 0,
      "size_per_tensor": 1638400,
      "sha256": "1304a47ecefda94bc9dc0504863884f960f9250e050fe8382af8d0da9e4e53fd",
      "original_bytes": 1638400,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 1638400,
          "compressed_bytes": 1482852,
          "fraction": 0.90506103515625,
          "encode_seconds_diagnostic": 0.0029872911982238293,
          "decode_seconds_diagnostic": 0.00151162501424551,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 1638400,
          "compressed_bytes": 1484146,
          "fraction": 0.905850830078125,
          "encode_seconds_diagnostic": 0.3244890000205487,
          "decode_seconds_diagnostic": 0.001435082871466875,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 1638400,
          "compressed_bytes": 1461456,
          "fraction": 0.892001953125,
          "encode_seconds_diagnostic": 0.0059964589308947325,
          "decode_seconds_diagnostic": 0.005328875035047531,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 1638400,
          "compressed_bytes": 1449745,
          "fraction": 0.8848541259765625,
          "encode_seconds_diagnostic": 0.02185262506827712,
          "decode_seconds_diagnostic": 0.04519558302126825,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 1638400,
          "compressed_bytes": 1451995,
          "fraction": 0.8862274169921875,
          "encode_seconds_diagnostic": 0.16779999993741512,
          "decode_seconds_diagnostic": 0.0352166248485446,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 1638400,
          "compressed_bytes": 1460110,
          "fraction": 0.891180419921875,
          "encode_seconds_diagnostic": 0.08527250005863607,
          "decode_seconds_diagnostic": 0.07052758312784135,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 1638400,
          "compressed_bytes": 1482058,
          "fraction": 0.904576416015625,
          "encode_seconds_diagnostic": 0.023457332979887724,
          "decode_seconds_diagnostic": 0.05219604214653373,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "other",
        "weights"
      ],
      "population_bytes": 2424832000,
      "sample_index": 2,
      "tensor": {
        "file": "model-00007.safetensors",
        "name": "language_model.model.layers.3.self_attn.q_proj.weight",
        "dtype": "U32",
        "shape": [
          12288,
          320
        ],
        "offset": 1929706596,
        "size": 15728640,
        "group": "other"
      },
      "offset": 1134080,
      "size_per_tensor": 8388608,
      "sha256": "1dbfd4679f8007b8157b68fd2d3b1fae409136c0455ceda3c7df142beed7368d",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7712698,
          "fraction": 0.9194252490997314,
          "encode_seconds_diagnostic": 0.009597124997526407,
          "decode_seconds_diagnostic": 0.00819195806980133,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 7713478,
          "fraction": 0.919518232345581,
          "encode_seconds_diagnostic": 0.7822891669347882,
          "decode_seconds_diagnostic": 0.008773165987804532,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7634506,
          "fraction": 0.9101040363311768,
          "encode_seconds_diagnostic": 0.03492237511090934,
          "decode_seconds_diagnostic": 0.03172404202632606,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7582867,
          "fraction": 0.903948187828064,
          "encode_seconds_diagnostic": 0.1370007919613272,
          "decode_seconds_diagnostic": 0.30052433302626014,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7584875,
          "fraction": 0.9041875600814819,
          "encode_seconds_diagnostic": 0.0721859170589596,
          "decode_seconds_diagnostic": 0.22968108300119638,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7560687,
          "fraction": 0.9013041257858276,
          "encode_seconds_diagnostic": 0.16189470794051886,
          "decode_seconds_diagnostic": 0.31920287501998246,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7581443,
          "fraction": 0.9037784337997437,
          "encode_seconds_diagnostic": 0.09327787486836314,
          "decode_seconds_diagnostic": 0.2490408329758793,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "other",
        "weights"
      ],
      "population_bytes": 2424832000,
      "sample_index": 3,
      "tensor": {
        "file": "model-00008.safetensors",
        "name": "language_model.model.layers.34.linear_attn.in_proj_qkv.weight",
        "dtype": "U32",
        "shape": [
          10240,
          320
        ],
        "offset": 3594760635,
        "size": 13107200,
        "group": "other"
      },
      "offset": 2425088,
      "size_per_tensor": 8388608,
      "sha256": "139a058533d16860ad740941d305505e814c637a97f4c6dee8c448945a3165e9",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7627689,
          "fraction": 0.9092913866043091,
          "encode_seconds_diagnostic": 0.010135292075574398,
          "decode_seconds_diagnostic": 0.00867966702207923,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 7635934,
          "fraction": 0.9102742671966553,
          "encode_seconds_diagnostic": 0.7911946249660105,
          "decode_seconds_diagnostic": 0.009013291914016008,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7489426,
          "fraction": 0.8928091526031494,
          "encode_seconds_diagnostic": 0.03216858394443989,
          "decode_seconds_diagnostic": 0.032793874852359295,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7415564,
          "fraction": 0.8840041160583496,
          "encode_seconds_diagnostic": 0.13784208288416266,
          "decode_seconds_diagnostic": 0.3038271658588201,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7416985,
          "fraction": 0.8841735124588013,
          "encode_seconds_diagnostic": 0.07226312509737909,
          "decode_seconds_diagnostic": 0.23006687499582767,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7398323,
          "fraction": 0.8819488286972046,
          "encode_seconds_diagnostic": 0.17959095910191536,
          "decode_seconds_diagnostic": 0.33772574993781745,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7426934,
          "fraction": 0.885359525680542,
          "encode_seconds_diagnostic": 0.10797462495975196,
          "decode_seconds_diagnostic": 0.2614095830358565,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "other",
        "weights"
      ],
      "population_bytes": 2424832000,
      "sample_index": 4,
      "tensor": {
        "file": "model-00009.safetensors",
        "name": "language_model.model.layers.40.linear_attn.out_proj.weight",
        "dtype": "U32",
        "shape": [
          2560,
          768
        ],
        "offset": 8094025292,
        "size": 7864320,
        "group": "other"
      },
      "offset": 0,
      "size_per_tensor": 7864320,
      "sha256": "b4fae65ebfaf46f0c4d1bcb62a5aed07472d737175b67b8935b29bb5a7c19ace",
      "original_bytes": 7864320,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 7864320,
          "compressed_bytes": 7252247,
          "fraction": 0.922170893351237,
          "encode_seconds_diagnostic": 0.009952457854524255,
          "decode_seconds_diagnostic": 0.007858957862481475,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 7864320,
          "compressed_bytes": 7254935,
          "fraction": 0.9225126902262369,
          "encode_seconds_diagnostic": 0.6414397079497576,
          "decode_seconds_diagnostic": 0.008397249970585108,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 7864320,
          "compressed_bytes": 7193501,
          "fraction": 0.9147009531656901,
          "encode_seconds_diagnostic": 0.030343625228852034,
          "decode_seconds_diagnostic": 0.028956209076568484,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 7864320,
          "compressed_bytes": 7150249,
          "fraction": 0.909201176961263,
          "encode_seconds_diagnostic": 0.12850899994373322,
          "decode_seconds_diagnostic": 0.282719915965572,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 7864320,
          "compressed_bytes": 7152311,
          "fraction": 0.909463373819987,
          "encode_seconds_diagnostic": 0.06703091692179441,
          "decode_seconds_diagnostic": 0.21481179096736014,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 7864320,
          "compressed_bytes": 7144561,
          "fraction": 0.9084779103597005,
          "encode_seconds_diagnostic": 0.15957024996168911,
          "decode_seconds_diagnostic": 0.30696966708637774,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 7864320,
          "compressed_bytes": 7168737,
          "fraction": 0.9115520477294922,
          "encode_seconds_diagnostic": 0.09683158295229077,
          "decode_seconds_diagnostic": 0.2425570001360029,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "other",
        "weights"
      ],
      "population_bytes": 2424832000,
      "sample_index": 5,
      "tensor": {
        "file": "model-00010.safetensors",
        "name": "language_model.model.layers.5.mlp_hyper_connection.input_mix_weight_up.weight",
        "dtype": "U32",
        "shape": [
          10240,
          40
        ],
        "offset": 8894861170,
        "size": 1638400,
        "group": "other"
      },
      "offset": 0,
      "size_per_tensor": 1638400,
      "sha256": "817f65517b04ffb1a83cca80b7fdc01f4a0609337cb9437ad9d916ab84f720b8",
      "original_bytes": 1638400,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 1638400,
          "compressed_bytes": 1446149,
          "fraction": 0.8826593017578125,
          "encode_seconds_diagnostic": 0.0018563750199973583,
          "decode_seconds_diagnostic": 0.0017062078695744276,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 1638400,
          "compressed_bytes": 1449877,
          "fraction": 0.8849346923828125,
          "encode_seconds_diagnostic": 0.08405295899137855,
          "decode_seconds_diagnostic": 0.0020478328224271536,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 1638400,
          "compressed_bytes": 1403431,
          "fraction": 0.8565863037109375,
          "encode_seconds_diagnostic": 0.006868832977488637,
          "decode_seconds_diagnostic": 0.006073000142350793,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 1638400,
          "compressed_bytes": 1396971,
          "fraction": 0.8526434326171874,
          "encode_seconds_diagnostic": 0.02800954203121364,
          "decode_seconds_diagnostic": 0.058737457962706685,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 1638400,
          "compressed_bytes": 1398153,
          "fraction": 0.8533648681640625,
          "encode_seconds_diagnostic": 0.014297791058197618,
          "decode_seconds_diagnostic": 0.045133457984775305,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 1638400,
          "compressed_bytes": 1404742,
          "fraction": 0.857386474609375,
          "encode_seconds_diagnostic": 0.0351652498356998,
          "decode_seconds_diagnostic": 0.06791225005872548,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 1638400,
          "compressed_bytes": 1427735,
          "fraction": 0.8714202880859375,
          "encode_seconds_diagnostic": 0.022143624955788255,
          "decode_seconds_diagnostic": 0.05214508296921849,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "other",
        "weights"
      ],
      "population_bytes": 2424832000,
      "sample_index": 6,
      "tensor": {
        "file": "model-00011.safetensors",
        "name": "language_model.lm_head.weight",
        "dtype": "U32",
        "shape": [
          248320,
          320
        ],
        "offset": 910238560,
        "size": 317849600,
        "group": "other"
      },
      "offset": 15315200,
      "size_per_tensor": 8388608,
      "sha256": "509cdc0668ae11d7e913050b4ac8a6e74b367eac20e9ea5e5677862e89d6bb2d",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7778909,
          "fraction": 0.9273182153701782,
          "encode_seconds_diagnostic": 0.010707290843129158,
          "decode_seconds_diagnostic": 0.008521790849044919,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 7778974,
          "fraction": 0.927325963973999,
          "encode_seconds_diagnostic": 0.7103023747913539,
          "decode_seconds_diagnostic": 0.008187457919120789,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7731317,
          "fraction": 0.9216448068618774,
          "encode_seconds_diagnostic": 0.03278979193419218,
          "decode_seconds_diagnostic": 0.03216437506489456,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7689512,
          "fraction": 0.916661262512207,
          "encode_seconds_diagnostic": 0.1371560839470476,
          "decode_seconds_diagnostic": 0.3008222079370171,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7691597,
          "fraction": 0.9169098138809204,
          "encode_seconds_diagnostic": 0.0732646668329835,
          "decode_seconds_diagnostic": 0.23042970802634954,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7677121,
          "fraction": 0.9151841402053833,
          "encode_seconds_diagnostic": 0.15634966595098376,
          "decode_seconds_diagnostic": 0.31600504205562174,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7692445,
          "fraction": 0.9170109033584595,
          "encode_seconds_diagnostic": 0.08697537495754659,
          "decode_seconds_diagnostic": 0.24366174987517297,
          "roundtrip_exact": true
        }
      ]
    },
    {
      "stratum": [
        "other",
        "weights"
      ],
      "population_bytes": 2424832000,
      "sample_index": 7,
      "tensor": {
        "file": "model-00011.safetensors",
        "name": "language_model.model.embed_tokens.weight",
        "dtype": "U32",
        "shape": [
          248320,
          320
        ],
        "offset": 519756640,
        "size": 317849600,
        "group": "other"
      },
      "offset": 53884672,
      "size_per_tensor": 8388608,
      "sha256": "8e2ae0050b31aadf94f4f3cb75e6de9c0658cb1c813bdef95e0c1fafdfb09652",
      "original_bytes": 8388608,
      "results": [
        {
          "method": "raw/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7810375,
          "fraction": 0.9310692548751831,
          "encode_seconds_diagnostic": 0.011267582885921001,
          "decode_seconds_diagnostic": 0.0081384580116719,
          "roundtrip_exact": true
        },
        {
          "method": "raw/zstd19",
          "original_bytes": 8388608,
          "compressed_bytes": 7810941,
          "fraction": 0.9311367273330688,
          "encode_seconds_diagnostic": 0.7353957919403911,
          "decode_seconds_diagnostic": 0.00892429193481803,
          "roundtrip_exact": true
        },
        {
          "method": "centerpacked/zstd3",
          "original_bytes": 8388608,
          "compressed_bytes": 7767927,
          "fraction": 0.9260090589523315,
          "encode_seconds_diagnostic": 0.03356837504543364,
          "decode_seconds_diagnostic": 0.031327541917562485,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7723958,
          "fraction": 0.9207675457000732,
          "encode_seconds_diagnostic": 0.137245416874066,
          "decode_seconds_diagnostic": 0.299869375070557,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_center",
          "original_bytes": 8388608,
          "compressed_bytes": 7726036,
          "fraction": 0.9210152626037598,
          "encode_seconds_diagnostic": 0.07279558293521404,
          "decode_seconds_diagnostic": 0.22903054091148078,
          "roundtrip_exact": true
        },
        {
          "method": "context_nibble_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7718121,
          "fraction": 0.9200717210769653,
          "encode_seconds_diagnostic": 0.1680679169949144,
          "decode_seconds_diagnostic": 0.32968383305706084,
          "roundtrip_exact": true
        },
        {
          "method": "context_byte_scale",
          "original_bytes": 8388608,
          "compressed_bytes": 7737047,
          "fraction": 0.9223278760910034,
          "encode_seconds_diagnostic": 0.09950949996709824,
          "decode_seconds_diagnostic": 0.2724683750420809,
          "roundtrip_exact": true
        }
      ]
    }
  ],
  "finished": {
    "utc": "2026-09-06T00:53:03.601177+00:00",
    "vm_stat": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   264156.\nPages active:                                1007041.\nPages inactive:                               731257.\nPages speculative:                            273171.\nPages throttled:                                   0.\nPages wired down:                             218918.\nPages purgeable:                               14606.\n\"Translation faults\":                    14238609799.\nPages copy-on-write:                       655542106.\nPages zero filled:                       17628209416.\nPages reactivated:                        2904457476.\nPages purged:                               65290448.\nFile-backed pages:                           1257215.\nAnonymous pages:                              754254.\nPages stored in compressor:                  1670687.\nPages occupied by compressor:                 590418.\nDecompressions:                           1001590268.\nCompressions:                             1298620829.\nPageins:                                  6561431700.\nPageouts:                                   10805818.\nSwapins:                                    41724313.\nSwapouts:                                   69922789.\nPages tagged:                                 179166.\nPages tagged resident:                        131425.\nPages tagged compressed:                       47741.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6830.\nPages tag-storage free:                          659.\nPages tag-storage non-tag pageable:            90807.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7741696.\nTagged compressions:                         9950445.\nTagged decompressions:                       9167439.\n",
    "load_average": [
      8.041015625,
      9.13037109375,
      7.73291015625
    ]
  },
  "summary": {
    "strata": [
      {
        "stratum": [
          "experts",
          "pairs"
        ],
        "population_bytes": 7549747200,
        "samples": 16,
        "sample_bytes": 134217728,
        "mean_fraction_by_method": {
          "raw/zstd3": 0.6385670155286789,
          "shuffle2/zstd19": 0.5424335896968842,
          "pred_shuffle2/zstd3": 0.33698079735040665,
          "pred_shuffle2/zstd9": 0.3256971538066864,
          "pred_shuffle2/zstd19": 0.30521032214164734,
          "pred_ans": 0.29198481142520905
        },
        "best_fixed_method": "pred_ans",
        "fast_adaptive_fraction": 0.3256971538066864,
        "strong_adaptive_fraction": 0.29198481142520905,
        "strong_sample_minmax": [
          0.28736817836761475,
          0.29970312118530273
        ]
      },
      {
        "stratum": [
          "experts",
          "weights"
        ],
        "population_bytes": 60397977600,
        "samples": 16,
        "sample_bytes": 134217728,
        "mean_fraction_by_method": {
          "raw/zstd3": 0.9324445798993111,
          "raw/zstd19": 0.932349719107151,
          "centerpacked/zstd3": 0.9280281588435173,
          "context_nibble_center": 0.9227509200572968,
          "context_byte_center": 0.9230014234781265,
          "context_nibble_scale": 0.9209062531590462,
          "context_byte_scale": 0.9225276485085487
        },
        "best_fixed_method": "context_nibble_scale",
        "fast_adaptive_fraction": 0.9280281588435173,
        "strong_adaptive_fraction": 0.9209062531590462,
        "strong_sample_minmax": [
          0.912087082862854,
          0.9238697290420532
        ]
      },
      {
        "stratum": [
          "mtp",
          "bf16"
        ],
        "population_bytes": 6155776,
        "samples": 6,
        "sample_bytes": 17694720,
        "mean_fraction_by_method": {
          "raw/zstd3": 0.787667579650879,
          "shuffle2/zstd19": 0.6880072021484375,
          "planes/zstd19": 0.7288567733764648,
          "ans": 0.6696768188476563
        },
        "best_fixed_method": "ans",
        "fast_adaptive_fraction": 0.787667579650879,
        "strong_adaptive_fraction": 0.6696768188476563,
        "strong_sample_minmax": [
          0.6683316040039062,
          0.6710220336914062
        ]
      },
      {
        "stratum": [
          "mtp",
          "pairs"
        ],
        "population_bytes": 162754560,
        "samples": 6,
        "sample_bytes": 50331648,
        "mean_fraction_by_method": {
          "raw/zstd3": 0.6400742530822754,
          "shuffle2/zstd19": 0.5395700732866923,
          "pred_shuffle2/zstd3": 0.3607717951138814,
          "pred_shuffle2/zstd9": 0.35074710845947266,
          "pred_shuffle2/zstd19": 0.32884039481480914,
          "pred_ans": 0.30292757352193195
        },
        "best_fixed_method": "pred_ans",
        "fast_adaptive_fraction": 0.35074710845947266,
        "strong_adaptive_fraction": 0.30292757352193195,
        "strong_sample_minmax": [
          0.30029845237731934,
          0.3052821159362793
        ]
      },
      {
        "stratum": [
          "mtp",
          "weights"
        ],
        "population_bytes": 1302036480,
        "samples": 6,
        "sample_bytes": 50331648,
        "mean_fraction_by_method": {
          "raw/zstd3": 0.9290622671445211,
          "raw/zstd19": 0.9290249347686768,
          "centerpacked/zstd3": 0.9228267669677734,
          "context_nibble_center": 0.9174201687177023,
          "context_byte_center": 0.917673389116923,
          "context_nibble_scale": 0.9153161644935608,
          "context_byte_scale": 0.9173246820767721
        },
        "best_fixed_method": "context_nibble_scale",
        "fast_adaptive_fraction": 0.9228267669677734,
        "strong_adaptive_fraction": 0.9153161644935608,
        "strong_sample_minmax": [
          0.9115543365478516,
          0.9188579320907593
        ]
      },
      {
        "stratum": [
          "ngram",
          "pairs"
        ],
        "population_bytes": 6400030720,
        "samples": 16,
        "sample_bytes": 134217728,
        "mean_fraction_by_method": {
          "raw/zstd3": 0.6524548977613449,
          "shuffle2/zstd19": 0.5531725287437439,
          "pred_shuffle2/zstd3": 0.37999624013900757,
          "pred_shuffle2/zstd9": 0.3714911490678787,
          "pred_shuffle2/zstd19": 0.3520580008625984,
          "pred_ans": 0.30658984184265137
        },
        "best_fixed_method": "pred_ans",
        "fast_adaptive_fraction": 0.3714911490678787,
        "strong_adaptive_fraction": 0.30658984184265137,
        "strong_sample_minmax": [
          0.30224013328552246,
          0.3108888864517212
        ]
      },
      {
        "stratum": [
          "ngram",
          "weights"
        ],
        "population_bytes": 25600122880,
        "samples": 16,
        "sample_bytes": 134217728,
        "mean_fraction_by_method": {
          "raw/zstd3": 0.9638893306255341,
          "raw/zstd19": 0.963156059384346,
          "centerpacked/zstd3": 0.9624384641647339,
          "context_nibble_center": 0.9548514634370804,
          "context_byte_center": 0.9550586119294167,
          "context_nibble_scale": 0.9531526267528534,
          "context_byte_scale": 0.9549380540847778
        },
        "best_fixed_method": "context_nibble_scale",
        "fast_adaptive_fraction": 0.9624384641647339,
        "strong_adaptive_fraction": 0.9531526267528534,
        "strong_sample_minmax": [
          0.9524426460266113,
          0.9538792371749878
        ]
      },
      {
        "stratum": [
          "other",
          "bf16"
        ],
        "population_bytes": 1093924320,
        "samples": 8,
        "sample_bytes": 46907392,
        "mean_fraction_by_method": {
          "raw/zstd3": 0.784563566909896,
          "shuffle2/zstd19": 0.6842030825193036,
          "planes/zstd19": 0.7450147099455688,
          "ans": 0.6691472859907542
        },
        "best_fixed_method": "ans",
        "fast_adaptive_fraction": 0.784563566909896,
        "strong_adaptive_fraction": 0.6671453328657543,
        "strong_sample_minmax": [
          0.6552398204803467,
          0.70892333984375
        ]
      },
      {
        "stratum": [
          "other",
          "pairs"
        ],
        "population_bytes": 303104000,
        "samples": 8,
        "sample_bytes": 23986176,
        "mean_fraction_by_method": {
          "raw/zstd3": 0.6796934084097545,
          "shuffle2/zstd19": 0.5780190108219783,
          "pred_shuffle2/zstd3": 0.38107548395792645,
          "pred_shuffle2/zstd9": 0.37115197439988457,
          "pred_shuffle2/zstd19": 0.349781387646993,
          "pred_ans": 0.32624483307202656
        },
        "best_fixed_method": "pred_ans",
        "fast_adaptive_fraction": 0.37115197439988457,
        "strong_adaptive_fraction": 0.32624483307202656,
        "strong_sample_minmax": [
          0.30424726009368896,
          0.3509928385416667
        ]
      },
      {
        "stratum": [
          "other",
          "weights"
        ],
        "population_bytes": 2424832000,
        "samples": 8,
        "sample_bytes": 53084160,
        "mean_fraction_by_method": {
          "raw/zstd3": 0.9138078578313191,
          "raw/zstd19": 0.9144483818610509,
          "centerpacked/zstd3": 0.9019712682565053,
          "context_nibble_center": 0.8958300826946894,
          "context_byte_center": 0.8962648137410482,
          "context_nibble_scale": 0.8959279106060664,
          "context_byte_scale": 0.9013508254289627
        },
        "best_fixed_method": "context_nibble_center",
        "fast_adaptive_fraction": 0.9019712682565053,
        "strong_adaptive_fraction": 0.8945442436138789,
        "strong_sample_minmax": [
          0.8526434326171874,
          0.9200717210769653
        ]
      }
    ],
    "total_model_bytes": 105264463248,
    "population_accounted_bytes": 105240685536,
    "unmodeled_bytes_kept_raw": 23777712,
    "unique_windows_sampled_bytes": 779206656,
    "estimated_total_download_bytes": {
      "plain_zstd3": 94612778960.75803,
      "fast_adaptive": 89971198670.92822,
      "strong_adaptive": 88455085636.14523
    },
    "estimated_total_savings_percent": {
      "plain_zstd3": 10.118974588933128,
      "fast_adaptive": 14.528421183359185,
      "strong_adaptive": 15.968710705580058
    }
  }
}
```


## Raw output: full-file.json

```text
{
  "stage": "complete_shard",
  "started": {
    "utc": "2026-09-06T00:54:09.092806+00:00",
    "vm_stat": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   277870.\nPages active:                                 991625.\nPages inactive:                               636700.\nPages speculative:                            371892.\nPages throttled:                                   0.\nPages wired down:                             218152.\nPages purgeable:                               20225.\n\"Translation faults\":                    14241302168.\nPages copy-on-write:                       655603529.\nPages zero filled:                       17629643497.\nPages reactivated:                        2904457968.\nPages purged:                               65291124.\nFile-backed pages:                           1405197.\nAnonymous pages:                              595020.\nPages stored in compressor:                  1663586.\nPages occupied by compressor:                 587864.\nDecompressions:                           1001593067.\nCompressions:                             1298620829.\nPageins:                                  6561506927.\nPageouts:                                   10805818.\nSwapins:                                    41724324.\nSwapouts:                                   69922789.\nPages tagged:                                 179166.\nPages tagged resident:                        131571.\nPages tagged compressed:                       47595.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6830.\nPages tag-storage free:                         1398.\nPages tag-storage non-tag pageable:            90068.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7713664.\nTagged compressions:                         9950445.\nTagged decompressions:                       9167577.\n",
    "load_average": [
      5.71728515625,
      8.47607421875,
      7.60400390625
    ]
  },
  "filename": "model-00011.safetensors",
  "block_mib": 32,
  "source_sha256": "50671838cf2c4518ee105e1546f79a502ca42d57bd7aaa31d761783affafb2d9",
  "frames": [
    {
      "kind": "raw",
      "ranges": [
        [
          0,
          4960
        ]
      ],
      "method": "zstd3",
      "sha256": "3f55cfa1497b1e1b45d596abbad4047fc80f00a955b35a889a0846e0e61a65e2",
      "archive_bytes": 1055
    },
    {
      "kind": "quant",
      "ranges": [
        [
          26219360,
          33554432
        ],
        [
          445649760,
          2097152
        ],
        [
          4960,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "c835c46d5f1c42606c32c7c712851003fa824ff7c9e88152bb9bfad79be959c3",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.down_proj.weight",
      "archive_bytes": 32221283,
      "weight_candidate_bytes": {
        "raw/zstd3": 31364356,
        "context_nibble_center": 31057564,
        "context_nibble_scale": 30992005
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2710576,
        "pred_shuffle2/zstd19": 1281508,
        "pred_ans": 1229004
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          59773792,
          33554432
        ],
        [
          447746912,
          2097152
        ],
        [
          2102112,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "6450db83e4221667f658e4826d225b16529cde0dcdbac11e958110f32d030a2e",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.down_proj.weight",
      "archive_bytes": 32213699,
      "weight_candidate_bytes": {
        "raw/zstd3": 31368965,
        "context_nibble_center": 31057614,
        "context_nibble_scale": 30989910
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2699485,
        "pred_shuffle2/zstd19": 1277193,
        "pred_ans": 1223512
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          93328224,
          33554432
        ],
        [
          449844064,
          2097152
        ],
        [
          4199264,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "024a93966ab0a47aaf01e2151e74e165de0c3ace8f4b6a2bbe955d95219b7b86",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.down_proj.weight",
      "archive_bytes": 32217504,
      "weight_candidate_bytes": {
        "raw/zstd3": 31365922,
        "context_nibble_center": 31057106,
        "context_nibble_scale": 30990739
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2705385,
        "pred_shuffle2/zstd19": 1279710,
        "pred_ans": 1226488
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          126882656,
          33554432
        ],
        [
          451941216,
          2097152
        ],
        [
          6296416,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "c3ca69442ccffe8328f34427c1a2e9cfd76a7940173357d081c31675f851eecd",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.down_proj.weight",
      "archive_bytes": 32190603,
      "weight_candidate_bytes": {
        "raw/zstd3": 31348173,
        "context_nibble_center": 31035931,
        "context_nibble_scale": 30965821
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2698861,
        "pred_shuffle2/zstd19": 1278219,
        "pred_ans": 1224504
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          160437088,
          33554432
        ],
        [
          454038368,
          2097152
        ],
        [
          8393568,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "2df063d2fe7f9bd3918f4bf56f8df9ef27f6482b68ecbf10e0c3bd60d7e19ccb",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.down_proj.weight",
      "archive_bytes": 32219589,
      "weight_candidate_bytes": {
        "raw/zstd3": 31365323,
        "context_nibble_center": 31055583,
        "context_nibble_scale": 30990227
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2709549,
        "pred_shuffle2/zstd19": 1281492,
        "pred_ans": 1229084
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          193991520,
          33554432
        ],
        [
          456135520,
          2097152
        ],
        [
          10490720,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "4a12e92c657f4c5b3d1fdcf5ddad08292a55f204ab671b25b52230957a7f40f0",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.down_proj.weight",
      "archive_bytes": 32215663,
      "weight_candidate_bytes": {
        "raw/zstd3": 31367652,
        "context_nibble_center": 31059149,
        "context_nibble_scale": 30991441
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2701440,
        "pred_shuffle2/zstd19": 1277926,
        "pred_ans": 1223943
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          227545952,
          33554432
        ],
        [
          458232672,
          2097152
        ],
        [
          12587872,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "38277dcabdb011af1b9a16a0864b26e78f98a1ad33f8a3a0f8f86375c1eaddda",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.down_proj.weight",
      "archive_bytes": 32220086,
      "weight_candidate_bytes": {
        "raw/zstd3": 31364115,
        "context_nibble_center": 31056945,
        "context_nibble_scale": 30990749
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2713183,
        "pred_shuffle2/zstd19": 1285263,
        "pred_ans": 1229058
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          261100384,
          33554432
        ],
        [
          460329824,
          2097152
        ],
        [
          14685024,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "ea32487597d539feecd774309cbda30bd40f1207840b27ef2c581ace24a1344d",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.down_proj.weight",
      "archive_bytes": 32208354,
      "weight_candidate_bytes": {
        "raw/zstd3": 31355633,
        "context_nibble_center": 31046774,
        "context_nibble_scale": 30980493
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2705131,
        "pred_shuffle2/zstd19": 1280424,
        "pred_ans": 1227582
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          294654816,
          33554432
        ],
        [
          462426976,
          2097152
        ],
        [
          16782176,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "bbe2f45d39a023e08fe15b171d37ee9e761604cb83c0e4106bda1509ffb58e32",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.down_proj.weight",
      "archive_bytes": 32206299,
      "weight_candidate_bytes": {
        "raw/zstd3": 31362636,
        "context_nibble_center": 31051114,
        "context_nibble_scale": 30981355
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2700990,
        "pred_shuffle2/zstd19": 1279997,
        "pred_ans": 1224665
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          328209248,
          33554432
        ],
        [
          464524128,
          2097152
        ],
        [
          18879328,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "8adb5d0153c8f4227663ba78013976748a597c6dea2d8675ce6a21bf91b1b746",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.down_proj.weight",
      "archive_bytes": 32207966,
      "weight_candidate_bytes": {
        "raw/zstd3": 31362775,
        "context_nibble_center": 31053673,
        "context_nibble_scale": 30983657
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2703229,
        "pred_shuffle2/zstd19": 1282596,
        "pred_ans": 1224030
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          361763680,
          33554432
        ],
        [
          466621280,
          2097152
        ],
        [
          20976480,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "4b7b1a25468d542eb1736539778626462b68ca095b06070fb183665a87ee7749",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.down_proj.weight",
      "archive_bytes": 32219465,
      "weight_candidate_bytes": {
        "raw/zstd3": 31367695,
        "context_nibble_center": 31059946,
        "context_nibble_scale": 30993146
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2703788,
        "pred_shuffle2/zstd19": 1278322,
        "pred_ans": 1226040
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          395318112,
          33554432
        ],
        [
          468718432,
          2097152
        ],
        [
          23073632,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "e97b819e95c8085e3fc74e4254360f0e49f8e940769f8ba5e7554e66d8f459bf",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.down_proj.weight",
      "archive_bytes": 32217218,
      "weight_candidate_bytes": {
        "raw/zstd3": 31366091,
        "context_nibble_center": 31053803,
        "context_nibble_scale": 30988658
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2708265,
        "pred_shuffle2/zstd19": 1281796,
        "pred_ans": 1228281
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          428872544,
          16777216
        ],
        [
          470815584,
          1048576
        ],
        [
          25170784,
          1048576
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "a6cdda31abcfeec2d42c0f58482ca318b1d7078c42e17f4c8f25842894ac765e",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.down_proj.weight",
      "archive_bytes": 16109874,
      "weight_candidate_bytes": {
        "raw/zstd3": 15681319,
        "context_nibble_center": 15527154,
        "context_nibble_scale": 15496678
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 1351677,
        "pred_shuffle2/zstd19": 642520,
        "pred_ans": 612917
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          518118240,
          819200
        ],
        [
          2163312480,
          51200
        ],
        [
          883788640,
          51200
        ]
      ],
      "weight_method": "context_nibble_center",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "3f47e4a730b521d28cd7505967cc9a41c8d614508ba0131dc369e92d18da3752",
      "tensor": "language_model.model.layers.9.mlp.shared_expert.up_proj.weight",
      "archive_bytes": 771445,
      "weight_candidate_bytes": {
        "raw/zstd3": 750038,
        "context_nibble_center": 737905,
        "context_nibble_scale": 743023
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 69300,
        "pred_shuffle2/zstd19": 34086,
        "pred_ans": 33264
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          518937440,
          819200
        ],
        [
          471987040,
          51200
        ],
        [
          2165985120,
          51200
        ]
      ],
      "weight_method": "context_nibble_center",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "dcca1d51b1ca2ce966ce641df8ed40d11cb797e546d7569bd597af59d34c396b",
      "tensor": "language_model.model.layers.9.mlp.shared_expert.gate_proj.weight",
      "archive_bytes": 774197,
      "weight_candidate_bytes": {
        "raw/zstd3": 752307,
        "context_nibble_center": 740788,
        "context_nibble_scale": 746053
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 69423,
        "pred_shuffle2/zstd19": 33904,
        "pred_ans": 33133
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          519756640,
          33554432
        ],
        [
          1702512480,
          2097152
        ],
        [
          863820640,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "e1f95f0fe48f82dfbc2f6b78e5f60797ea7c6880d7fb78271da365872b3e6a25",
      "tensor": "language_model.model.embed_tokens.weight",
      "archive_bytes": 32028799,
      "weight_candidate_bytes": {
        "raw/zstd3": 31088066,
        "context_nibble_center": 30717106,
        "context_nibble_scale": 30696747
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2813238,
        "pred_shuffle2/zstd19": 1450442,
        "pred_ans": 1331771
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          553311072,
          33554432
        ],
        [
          1704609632,
          2097152
        ],
        [
          865917792,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "3d95b9bec5a78f4867bd282964b5706a1dcec63442adc306d56618b37b2d4194",
      "tensor": "language_model.model.embed_tokens.weight",
      "archive_bytes": 32093109,
      "weight_candidate_bytes": {
        "raw/zstd3": 31230757,
        "context_nibble_center": 30877265,
        "context_nibble_scale": 30819159
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2724937,
        "pred_shuffle2/zstd19": 1363812,
        "pred_ans": 1273669
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          586865504,
          33554432
        ],
        [
          1706706784,
          2097152
        ],
        [
          868014944,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "ffd188e0e9fd04e066620c72379f62627d49539323181fc8288a712044840e1b",
      "tensor": "language_model.model.embed_tokens.weight",
      "archive_bytes": 32117079,
      "weight_candidate_bytes": {
        "raw/zstd3": 31267897,
        "context_nibble_center": 30925020,
        "context_nibble_scale": 30855377
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2704726,
        "pred_shuffle2/zstd19": 1335316,
        "pred_ans": 1261421
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          620419936,
          33554432
        ],
        [
          1708803936,
          2097152
        ],
        [
          870112096,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "90027cb3d5a41c80a39dc233089e3581992c0c8ccdab9b5ac46a471f9a40d060",
      "tensor": "language_model.model.embed_tokens.weight",
      "archive_bytes": 32123835,
      "weight_candidate_bytes": {
        "raw/zstd3": 31221029,
        "context_nibble_center": 30875005,
        "context_nibble_scale": 30828924
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2735073,
        "pred_shuffle2/zstd19": 1367975,
        "pred_ans": 1294630
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          653974368,
          33554432
        ],
        [
          1710901088,
          2097152
        ],
        [
          872209248,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "abc68ac25f33eea9c18fa26e2d39023e93da7a9ad9c11ed9cf38b0977bfd706f",
      "tensor": "language_model.model.embed_tokens.weight",
      "archive_bytes": 32075828,
      "weight_candidate_bytes": {
        "raw/zstd3": 31230923,
        "context_nibble_center": 30867855,
        "context_nibble_scale": 30800648
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2723115,
        "pred_shuffle2/zstd19": 1338049,
        "pred_ans": 1274899
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          687528800,
          33554432
        ],
        [
          1712998240,
          2097152
        ],
        [
          874306400,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "e38994593b3ce22d7c2d17b685bb11653d350691524bc9106161e4588616fa2e",
      "tensor": "language_model.model.embed_tokens.weight",
      "archive_bytes": 32106111,
      "weight_candidate_bytes": {
        "raw/zstd3": 31266524,
        "context_nibble_center": 30892858,
        "context_nibble_scale": 30823781
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2732402,
        "pred_shuffle2/zstd19": 1341309,
        "pred_ans": 1282049
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          721083232,
          33554432
        ],
        [
          1715095392,
          2097152
        ],
        [
          876403552,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "a0dca2c317dbc21cc82474dfbde17bc9b510066fa24504673e282fe4c2157700",
      "tensor": "language_model.model.embed_tokens.weight",
      "archive_bytes": 32159921,
      "weight_candidate_bytes": {
        "raw/zstd3": 31289735,
        "context_nibble_center": 30941773,
        "context_nibble_scale": 30878426
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2726347,
        "pred_shuffle2/zstd19": 1354951,
        "pred_ans": 1281214
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          754637664,
          33554432
        ],
        [
          1717192544,
          2097152
        ],
        [
          878500704,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "148171877bfe4e89c86682541fead1a492e0e8668e5ed8b9d2d806ebb005c6a8",
      "tensor": "language_model.model.embed_tokens.weight",
      "archive_bytes": 32150404,
      "weight_candidate_bytes": {
        "raw/zstd3": 31304275,
        "context_nibble_center": 30949031,
        "context_nibble_scale": 30877054
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2709065,
        "pred_shuffle2/zstd19": 1337637,
        "pred_ans": 1273069
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          788192096,
          33554432
        ],
        [
          1719289696,
          2097152
        ],
        [
          880597856,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "6c20429855fe552bbf279d356b58a28e490d6cdd9b8bd9a1b761a91648ab1993",
      "tensor": "language_model.model.embed_tokens.weight",
      "archive_bytes": 32159630,
      "weight_candidate_bytes": {
        "raw/zstd3": 31313007,
        "context_nibble_center": 30957853,
        "context_nibble_scale": 30883198
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2713212,
        "pred_shuffle2/zstd19": 1341103,
        "pred_ans": 1276151
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          821746528,
          15859712
        ],
        [
          1721386848,
          991232
        ],
        [
          882695008,
          991232
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "50b3670ecfaca453092f588bb79e1b41bc51e38301487a8e0bbaa6ca28706150",
      "tensor": "language_model.model.embed_tokens.weight",
      "archive_bytes": 15227093,
      "weight_candidate_bytes": {
        "raw/zstd3": 14800408,
        "context_nibble_center": 14638741,
        "context_nibble_scale": 14616596
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 1288178,
        "pred_shuffle2/zstd19": 639502,
        "pred_ans": 610218
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          910238560,
          33554432
        ],
        [
          1722378080,
          2097152
        ],
        [
          472038240,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "18532843e6d1a989ab06b81954e85d638803b43ace772890ae2d99b4115dd5dc",
      "tensor": "language_model.lm_head.weight",
      "archive_bytes": 31910669,
      "weight_candidate_bytes": {
        "raw/zstd3": 31090449,
        "context_nibble_center": 30717818,
        "context_nibble_scale": 30640813
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2720424,
        "pred_shuffle2/zstd19": 1328373,
        "pred_ans": 1269575
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          943792992,
          33554432
        ],
        [
          1724475232,
          2097152
        ],
        [
          474135392,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "30135acf9a6eae131a5aa7ea8847a4408bd2db95c68e086e8d436b1504156398",
      "tensor": "language_model.lm_head.weight",
      "archive_bytes": 31950585,
      "weight_candidate_bytes": {
        "raw/zstd3": 31108657,
        "context_nibble_center": 30756091,
        "context_nibble_scale": 30687930
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2725438,
        "pred_shuffle2/zstd19": 1317409,
        "pred_ans": 1262374
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          977347424,
          33554432
        ],
        [
          1726572384,
          2097152
        ],
        [
          476232544,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "1b9ce192dca33f058f3d69eb7a565bd6ffc774d9306a04093143251994587343",
      "tensor": "language_model.lm_head.weight",
      "archive_bytes": 31943547,
      "weight_candidate_bytes": {
        "raw/zstd3": 31100455,
        "context_nibble_center": 30742519,
        "context_nibble_scale": 30677044
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2731755,
        "pred_shuffle2/zstd19": 1320383,
        "pred_ans": 1266222
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1010901856,
          33554432
        ],
        [
          1728669536,
          2097152
        ],
        [
          478329696,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "cea560e309686bc2b8ce2bd31951459ce71d7d4dadee2d66cee0de96f83ddd0f",
      "tensor": "language_model.lm_head.weight",
      "archive_bytes": 31900192,
      "weight_candidate_bytes": {
        "raw/zstd3": 31069518,
        "context_nibble_center": 30706352,
        "context_nibble_scale": 30633033
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2723484,
        "pred_shuffle2/zstd19": 1322553,
        "pred_ans": 1266877
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1044456288,
          33554432
        ],
        [
          1730766688,
          2097152
        ],
        [
          480426848,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "e0f4a442c441e6b67cbc10fe5232deb4fa9cf4ceffa9f77a28f6965f5d9e33a5",
      "tensor": "language_model.lm_head.weight",
      "archive_bytes": 31864817,
      "weight_candidate_bytes": {
        "raw/zstd3": 31064807,
        "context_nibble_center": 30697909,
        "context_nibble_scale": 30611765
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2707413,
        "pred_shuffle2/zstd19": 1307945,
        "pred_ans": 1252770
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1078010720,
          33554432
        ],
        [
          1732863840,
          2097152
        ],
        [
          482524000,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "4ada124fb7cee6f434567062e657a2fe3f354f12aba1de21a689f962a023958a",
      "tensor": "language_model.lm_head.weight",
      "archive_bytes": 31892958,
      "weight_candidate_bytes": {
        "raw/zstd3": 31065213,
        "context_nibble_center": 30702345,
        "context_nibble_scale": 30628039
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2721466,
        "pred_shuffle2/zstd19": 1317251,
        "pred_ans": 1264637
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1111565152,
          33554432
        ],
        [
          1734960992,
          2097152
        ],
        [
          484621152,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "720f216f45da390806525621d73e78458be48b89f88343a11e69765990919225",
      "tensor": "language_model.lm_head.weight",
      "archive_bytes": 31933257,
      "weight_candidate_bytes": {
        "raw/zstd3": 31068567,
        "context_nibble_center": 30691291,
        "context_nibble_scale": 30635539
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2789736,
        "pred_shuffle2/zstd19": 1346205,
        "pred_ans": 1297436
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1145119584,
          33554432
        ],
        [
          1737058144,
          2097152
        ],
        [
          486718304,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "4cf5fd97f49cbcd057e8ee5d08ff416ea2414f65349d480d7a605a5ce6594a2b",
      "tensor": "language_model.lm_head.weight",
      "archive_bytes": 31925709,
      "weight_candidate_bytes": {
        "raw/zstd3": 31069167,
        "context_nibble_center": 30700464,
        "context_nibble_scale": 30638492
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2788112,
        "pred_shuffle2/zstd19": 1342369,
        "pred_ans": 1286935
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1178674016,
          33554432
        ],
        [
          1739155296,
          2097152
        ],
        [
          488815456,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "cf28bd6eed1002c35f2e1ab7f264126b098dc3415a56ae66ffb986822ef2e7d6",
      "tensor": "language_model.lm_head.weight",
      "archive_bytes": 31874765,
      "weight_candidate_bytes": {
        "raw/zstd3": 31031848,
        "context_nibble_center": 30656784,
        "context_nibble_scale": 30591621
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2775846,
        "pred_shuffle2/zstd19": 1344679,
        "pred_ans": 1282862
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1212228448,
          15859712
        ],
        [
          1741252448,
          991232
        ],
        [
          490912608,
          991232
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "4d3a82058e1423d99fe346cd00705c331dd2e7bafa21d896da6145619afd5256",
      "tensor": "language_model.lm_head.weight",
      "archive_bytes": 15054538,
      "weight_candidate_bytes": {
        "raw/zstd3": 14651130,
        "context_nibble_center": 14466717,
        "context_nibble_scale": 14441904
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 1314246,
        "pred_shuffle2/zstd19": 637504,
        "pred_ans": 612354
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1228088160,
          1638400
        ],
        [
          883686240,
          102400
        ],
        [
          910054240,
          102400
        ]
      ],
      "weight_method": "context_nibble_center",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "95219432af2b70311ebbf529b739b1c47266f5ae76198bd379dbdf74d5f5ab2f",
      "tensor": "language_model.model.layers.9.mlp_hyper_connection.input_mix_weight_down.weight",
      "archive_bytes": 1525381,
      "weight_candidate_bytes": {
        "raw/zstd3": 1479784,
        "context_nibble_center": 1454776,
        "context_nibble_scale": 1462927
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 145377,
        "pred_shuffle2/zstd19": 72827,
        "pred_ans": 70326
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1255940960,
          33554432
        ],
        [
          1229726560,
          2097152
        ],
        [
          491903840,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "1f58d904ad9586a36e3fb50dbbf0d4249b98b6b9fded09e6f4cef608432c389b",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.gate_proj.weight",
      "archive_bytes": 31942672,
      "weight_candidate_bytes": {
        "raw/zstd3": 31166526,
        "context_nibble_center": 30825204,
        "context_nibble_scale": 30719620
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2668460,
        "pred_shuffle2/zstd19": 1278925,
        "pred_ans": 1222770
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1289495392,
          33554432
        ],
        [
          1231823712,
          2097152
        ],
        [
          494000992,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "f5162f08f51c1c0fe67be6f3b4562d30cdc5222cf97e54d7dacd5998e05591d5",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.gate_proj.weight",
      "archive_bytes": 31966207,
      "weight_candidate_bytes": {
        "raw/zstd3": 31186984,
        "context_nibble_center": 30848390,
        "context_nibble_scale": 30744832
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2669321,
        "pred_shuffle2/zstd19": 1276836,
        "pred_ans": 1221093
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1323049824,
          33554432
        ],
        [
          1233920864,
          2097152
        ],
        [
          496098144,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "161317a5bbefdd4bb054e31bfb34554f24927fe2af6b0b59baafd5e7e0bc2bec",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.gate_proj.weight",
      "archive_bytes": 31962249,
      "weight_candidate_bytes": {
        "raw/zstd3": 31188288,
        "context_nibble_center": 30841646,
        "context_nibble_scale": 30736902
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2671578,
        "pred_shuffle2/zstd19": 1281393,
        "pred_ans": 1225065
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1356604256,
          33554432
        ],
        [
          1236018016,
          2097152
        ],
        [
          498195296,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "9e9396449acc6a7165359f7848bd09238512087dd95fbf3912d3ab2936f24a98",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.gate_proj.weight",
      "archive_bytes": 31934100,
      "weight_candidate_bytes": {
        "raw/zstd3": 31163292,
        "context_nibble_center": 30807620,
        "context_nibble_scale": 30702037
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2680056,
        "pred_shuffle2/zstd19": 1286603,
        "pred_ans": 1231781
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1390158688,
          33554432
        ],
        [
          1238115168,
          2097152
        ],
        [
          500292448,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "b3ae2b214943d3826107b9a5be6036b9d820bb9c3a8599879fbda4975004227f",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.gate_proj.weight",
      "archive_bytes": 31937835,
      "weight_candidate_bytes": {
        "raw/zstd3": 31162737,
        "context_nibble_center": 30819491,
        "context_nibble_scale": 30713798
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2666811,
        "pred_shuffle2/zstd19": 1279342,
        "pred_ans": 1223755
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1423713120,
          33554432
        ],
        [
          1240212320,
          2097152
        ],
        [
          502389600,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "0ce6404bad40bf05a7f9f2dfb6709a7aa42673038b8b40ff512d7c47c87bc332",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.gate_proj.weight",
      "archive_bytes": 31971261,
      "weight_candidate_bytes": {
        "raw/zstd3": 31193516,
        "context_nibble_center": 30854776,
        "context_nibble_scale": 30751702
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2666135,
        "pred_shuffle2/zstd19": 1273773,
        "pred_ans": 1219277
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1457267552,
          33554432
        ],
        [
          1242309472,
          2097152
        ],
        [
          504486752,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "c9856c15ccae0886b99bd2d91aa141b18c50a9e198686ee2009759744664cad1",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.gate_proj.weight",
      "archive_bytes": 31941186,
      "weight_candidate_bytes": {
        "raw/zstd3": 31163885,
        "context_nibble_center": 30824085,
        "context_nibble_scale": 30717555
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2669949,
        "pred_shuffle2/zstd19": 1280934,
        "pred_ans": 1223349
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1490821984,
          33554432
        ],
        [
          1244406624,
          2097152
        ],
        [
          506583904,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "0b2ab05c06932e5870b0ed28f6dc31f1f6bb94c5da137fe358e520e9e7502b41",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.gate_proj.weight",
      "archive_bytes": 31939805,
      "weight_candidate_bytes": {
        "raw/zstd3": 31170250,
        "context_nibble_center": 30816818,
        "context_nibble_scale": 30712148
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2673928,
        "pred_shuffle2/zstd19": 1283721,
        "pred_ans": 1227375
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1524376416,
          33554432
        ],
        [
          1246503776,
          2097152
        ],
        [
          508681056,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "afe7b2c6ae2662a7650b0109628bdb349f693a8bd02ffe9dd667f510d61bf439",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.gate_proj.weight",
      "archive_bytes": 31960022,
      "weight_candidate_bytes": {
        "raw/zstd3": 31182566,
        "context_nibble_center": 30837616,
        "context_nibble_scale": 30733997
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2674329,
        "pred_shuffle2/zstd19": 1282559,
        "pred_ans": 1225743
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1557930848,
          33554432
        ],
        [
          1248600928,
          2097152
        ],
        [
          510778208,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "c4c7bcce7f9fd58fc76b633886314e4409c9dae5b1abfbfe42606fbd2df03d52",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.gate_proj.weight",
      "archive_bytes": 31980545,
      "weight_candidate_bytes": {
        "raw/zstd3": 31201248,
        "context_nibble_center": 30862347,
        "context_nibble_scale": 30759472
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2668822,
        "pred_shuffle2/zstd19": 1278936,
        "pred_ans": 1220791
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1591485280,
          33554432
        ],
        [
          1250698080,
          2097152
        ],
        [
          512875360,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "8548a7e21b79a72fe781c36a5da692b22bb1df65534fcadc0819f5f52511f3ed",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.gate_proj.weight",
      "archive_bytes": 31955479,
      "weight_candidate_bytes": {
        "raw/zstd3": 31178295,
        "context_nibble_center": 30838117,
        "context_nibble_scale": 30733724
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2669957,
        "pred_shuffle2/zstd19": 1279115,
        "pred_ans": 1221473
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1625039712,
          33554432
        ],
        [
          1252795232,
          2097152
        ],
        [
          514972512,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "bd3ce23df527f12df00e28513c948e7ccbf267188a3ed779b805dbcdce7da787",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.gate_proj.weight",
      "archive_bytes": 31937050,
      "weight_candidate_bytes": {
        "raw/zstd3": 31166090,
        "context_nibble_center": 30819350,
        "context_nibble_scale": 30714045
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2667601,
        "pred_shuffle2/zstd19": 1280487,
        "pred_ans": 1222723
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1658594144,
          16777216
        ],
        [
          1254892384,
          1048576
        ],
        [
          517069664,
          1048576
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "77e967c5c6eb7ebd39f4301084e5e9a450f7fcfec7db17fea5d5e3fee5834060",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.gate_proj.weight",
      "archive_bytes": 15992079,
      "weight_candidate_bytes": {
        "raw/zstd3": 15597805,
        "context_nibble_center": 15429857,
        "context_nibble_scale": 15381635
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 1333075,
        "pred_shuffle2/zstd19": 638321,
        "pred_ans": 610162
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1701693280,
          819200
        ],
        [
          471935840,
          51200
        ],
        [
          471884640,
          51200
        ]
      ],
      "weight_method": "context_nibble_center",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "8be7d2b173fffe8156b31fc850c85c8b38b5af5f5ec9b16ea0650f4e28b0dff5",
      "tensor": "language_model.model.layers.9.mlp.shared_expert.down_proj.weight",
      "archive_bytes": 776561,
      "weight_candidate_bytes": {
        "raw/zstd3": 754029,
        "context_nibble_center": 742571,
        "context_nibble_scale": 749236
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 70241,
        "pred_shuffle2/zstd19": 34428,
        "pred_ans": 33714
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1742243680,
          1638400
        ],
        [
          2166036320,
          102400
        ],
        [
          1675371360,
          102400
        ]
      ],
      "weight_method": "context_nibble_center",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "deaddf671e730af0fedc3a9ad4cb2a13ba484231c1fef388068a587214245b7c",
      "tensor": "language_model.model.layers.9.mlp_hyper_connection.input_mix_weight_up.weight",
      "archive_bytes": 1484334,
      "weight_candidate_bytes": {
        "raw/zstd3": 1447728,
        "context_nibble_center": 1406735,
        "context_nibble_scale": 1424965
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 150322,
        "pred_shuffle2/zstd19": 80969,
        "pred_ans": 77318
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1743882080,
          33554432
        ],
        [
          837606240,
          2097152
        ],
        [
          1675473760,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "676163bbe94d697f5dc94033006026daad1943b74399c5281a5daa39f5f97edb",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.up_proj.weight",
      "archive_bytes": 31948456,
      "weight_candidate_bytes": {
        "raw/zstd3": 31178408,
        "context_nibble_center": 30836889,
        "context_nibble_scale": 30731378
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2661389,
        "pred_shuffle2/zstd19": 1272673,
        "pred_ans": 1216796
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1777436512,
          33554432
        ],
        [
          839703392,
          2097152
        ],
        [
          1677570912,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "d92504048f3cea0c53202f2ec8dcfe58ade67136b731be4a9194656ed00ba689",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.up_proj.weight",
      "archive_bytes": 31972928,
      "weight_candidate_bytes": {
        "raw/zstd3": 31202657,
        "context_nibble_center": 30861712,
        "context_nibble_scale": 30758063
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2655185,
        "pred_shuffle2/zstd19": 1270119,
        "pred_ans": 1214583
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1810990944,
          33554432
        ],
        [
          841800544,
          2097152
        ],
        [
          1679668064,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "d5edccfc5a33f47d08cd9e985c9ca3d68365250ae618a8a5d0b5d666cfdb3a4f",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.up_proj.weight",
      "archive_bytes": 31969538,
      "weight_candidate_bytes": {
        "raw/zstd3": 31195535,
        "context_nibble_center": 30857974,
        "context_nibble_scale": 30752451
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2658661,
        "pred_shuffle2/zstd19": 1271931,
        "pred_ans": 1216805
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1844545376,
          33554432
        ],
        [
          843897696,
          2097152
        ],
        [
          1681765216,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "38305063b7c2cf0866a817d4e78ac86a5e7ca9c1c8ac8b544748bd0140fc572c",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.up_proj.weight",
      "archive_bytes": 31949352,
      "weight_candidate_bytes": {
        "raw/zstd3": 31182674,
        "context_nibble_center": 30830698,
        "context_nibble_scale": 30724039
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2670503,
        "pred_shuffle2/zstd19": 1280967,
        "pred_ans": 1225031
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1878099808,
          33554432
        ],
        [
          845994848,
          2097152
        ],
        [
          1683862368,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "46df521673da4789570486bc4f0fec7551f50834d67c9a772a61f22cf2b0f901",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.up_proj.weight",
      "archive_bytes": 31948019,
      "weight_candidate_bytes": {
        "raw/zstd3": 31174683,
        "context_nibble_center": 30832687,
        "context_nibble_scale": 30728322
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2660421,
        "pred_shuffle2/zstd19": 1275974,
        "pred_ans": 1219415
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1911654240,
          33554432
        ],
        [
          848092000,
          2097152
        ],
        [
          1685959520,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "034efff271b1f7512e542267e537e0aff878ec53816187ec4d9a7157b20fd901",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.up_proj.weight",
      "archive_bytes": 31978486,
      "weight_candidate_bytes": {
        "raw/zstd3": 31201192,
        "context_nibble_center": 30868223,
        "context_nibble_scale": 30764209
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2658974,
        "pred_shuffle2/zstd19": 1275924,
        "pred_ans": 1213995
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1945208672,
          33554432
        ],
        [
          850189152,
          2097152
        ],
        [
          1688056672,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "274b34f718bc2bc0a4ba6ed8fc7db152b42c2be9c0999c4617b0002e5b71c4fd",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.up_proj.weight",
      "archive_bytes": 31940293,
      "weight_candidate_bytes": {
        "raw/zstd3": 31168455,
        "context_nibble_center": 30827214,
        "context_nibble_scale": 30720490
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2665449,
        "pred_shuffle2/zstd19": 1274284,
        "pred_ans": 1219521
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1978763104,
          33554432
        ],
        [
          852286304,
          2097152
        ],
        [
          1690153824,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "3999ac1e32f2dff667591b1c3e4dc5903482b9d7797cfc39ebd9db32abaf0b13",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.up_proj.weight",
      "archive_bytes": 31952338,
      "weight_candidate_bytes": {
        "raw/zstd3": 31184613,
        "context_nibble_center": 30836317,
        "context_nibble_scale": 30730271
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2664053,
        "pred_shuffle2/zstd19": 1278415,
        "pred_ans": 1221785
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          2012317536,
          33554432
        ],
        [
          854383456,
          2097152
        ],
        [
          1692250976,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "ec195528093a718fd07fc921758829b53c129bc52f3cb6f5676b21960a5e2139",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.up_proj.weight",
      "archive_bytes": 31965921,
      "weight_candidate_bytes": {
        "raw/zstd3": 31196283,
        "context_nibble_center": 30852254,
        "context_nibble_scale": 30747006
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2660514,
        "pred_shuffle2/zstd19": 1275090,
        "pred_ans": 1218633
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          2045871968,
          33554432
        ],
        [
          856480608,
          2097152
        ],
        [
          1694348128,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "8afbd3416d3d5e2fc0c2bcba5240a08a2c0d159a9f6e233485f72b8b9dc81f95",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.up_proj.weight",
      "archive_bytes": 31986130,
      "weight_candidate_bytes": {
        "raw/zstd3": 31211489,
        "context_nibble_center": 30874752,
        "context_nibble_scale": 30770688
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2659486,
        "pred_shuffle2/zstd19": 1270718,
        "pred_ans": 1215160
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          2079426400,
          33554432
        ],
        [
          858577760,
          2097152
        ],
        [
          1696445280,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "71c305e93cabf9032f2eba186dc76fb68867cc301ca391072be7b06ac8272f17",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.up_proj.weight",
      "archive_bytes": 31964914,
      "weight_candidate_bytes": {
        "raw/zstd3": 31192557,
        "context_nibble_center": 30852419,
        "context_nibble_scale": 30748582
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2658515,
        "pred_shuffle2/zstd19": 1271845,
        "pred_ans": 1216050
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          2112980832,
          33554432
        ],
        [
          860674912,
          2097152
        ],
        [
          1698542432,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "6d09f88694d6c2dd167e476e961d8cb0981ac99ecaa11feb03653c86203cdb49",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.up_proj.weight",
      "archive_bytes": 31949408,
      "weight_candidate_bytes": {
        "raw/zstd3": 31178242,
        "context_nibble_center": 30836886,
        "context_nibble_scale": 30732068
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2660390,
        "pred_shuffle2/zstd19": 1272541,
        "pred_ans": 1217058
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          2146535264,
          16777216
        ],
        [
          862772064,
          1048576
        ],
        [
          1700639584,
          1048576
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "b72c737a5ba8f29eba3e2bbaa46360917768e0045a4db510c3529ccc95c407cb",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.up_proj.weight",
      "archive_bytes": 15997083,
      "weight_candidate_bytes": {
        "raw/zstd3": 15604836,
        "context_nibble_center": 15437842,
        "context_nibble_scale": 15389447
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 1332358,
        "pred_shuffle2/zstd19": 635623,
        "pred_ans": 607354
      }
    },
    {
      "kind": "bf16",
      "ranges": [
        [
          471864160,
          20480
        ]
      ],
      "method": "ans",
      "sha256": "eca700802ac6312f29d3c1efca56009514c49dc354a4d611addcb582a8c8d013",
      "tensor": "language_model.model.layers.9.mlp_hyper_connection.hc_norm.weight",
      "archive_bytes": 11245,
      "candidate_bytes": {
        "raw/zstd3": 13349,
        "shuffle2/zstd19": 11125,
        "ans": 11094
      }
    },
    {
      "kind": "bf16",
      "ranges": [
        [
          883839840,
          26214400
        ]
      ],
      "method": "ans",
      "sha256": "68035d6130f22f61da552b68400a613aa5f8b30f8327b751f0b863cf3c740756",
      "tensor": "language_model.model.layers.8.mlp.switch_mlp.down_proj.scales",
      "archive_bytes": 13011473,
      "candidate_bytes": {
        "raw/zstd3": 15982336,
        "shuffle2/zstd19": 13275473,
        "ans": 13011319
      }
    },
    {
      "kind": "bf16",
      "ranges": [
        [
          910156640,
          81920
        ]
      ],
      "method": "shuffle2/zstd19",
      "sha256": "ece2a04270501feacd41a25e880de4ca0a73fd0096764b684ed1f2736e8f3caf",
      "tensor": "language_model.model.layers.9.mlp_hyper_connection.block_inject_weight.weight",
      "archive_bytes": 58843,
      "candidate_bytes": {
        "raw/zstd3": 65649,
        "shuffle2/zstd19": 58680,
        "ans": 59235
      }
    },
    {
      "kind": "bf16",
      "ranges": [
        [
          1701688160,
          5120
        ]
      ],
      "method": "shuffle2/zstd19",
      "sha256": "b901be0a7b3c981f03766da2d656ed97b7a0f19ff9146b7357d2724dd91c1f9f",
      "tensor": "language_model.model.layers.9.mlp.shared_expert_gate.weight",
      "archive_bytes": 3978,
      "candidate_bytes": {
        "raw/zstd3": 4099,
        "shuffle2/zstd19": 3815,
        "ans": 4532
      }
    },
    {
      "kind": "bf16",
      "ranges": [
        [
          2163363680,
          2621440
        ]
      ],
      "method": "ans",
      "sha256": "8556487138975295619957d9ece22b042e4b8790810edac60c8e08eae4f59f4a",
      "tensor": "language_model.model.layers.9.mlp.gate.weight",
      "archive_bytes": 1734041,
      "candidate_bytes": {
        "raw/zstd3": 2046461,
        "shuffle2/zstd19": 1759021,
        "ans": 1733887
      }
    },
    {
      "kind": "bf16",
      "ranges": [
        [
          2166138720,
          26214400
        ]
      ],
      "method": "ans",
      "sha256": "fdaba4b362aa0797c9095ca647409859663790ee093684daa555c7f10e705433",
      "tensor": "language_model.model.layers.8.mlp.switch_mlp.down_proj.biases",
      "archive_bytes": 13213726,
      "candidate_bytes": {
        "raw/zstd3": 17601777,
        "shuffle2/zstd19": 15192146,
        "ans": 13213571
      }
    }
  ],
  "encode_seconds_diagnostic": 108.60065795807168,
  "original_bytes": 2192353120,
  "archive_bytes": 1841470354,
  "archive_sha256": "d6da9ac55afea4d2bb29e8efd31ed819ca5515760a3ed72dca77e3dc9104b74a",
  "savings_percent": 16.004847157103963,
  "unpack": {
    "started": {
      "utc": "2026-09-06T00:55:59.156576+00:00",
      "vm_stat": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   227178.\nPages active:                                1010872.\nPages inactive:                              1014266.\nPages speculative:                             13975.\nPages throttled:                                   0.\nPages wired down:                             231949.\nPages purgeable:                                1370.\n\"Translation faults\":                    14242988611.\nPages copy-on-write:                       655911035.\nPages zero filled:                       17630625295.\nPages reactivated:                        2904470156.\nPages purged:                               65294638.\nFile-backed pages:                           1343374.\nAnonymous pages:                              695739.\nPages stored in compressor:                  1658025.\nPages occupied by compressor:                 585794.\nDecompressions:                           1001597522.\nCompressions:                             1298620829.\nPageins:                                  6561743387.\nPageouts:                                   10805905.\nSwapins:                                    41724328.\nSwapouts:                                   69922789.\nPages tagged:                                 181745.\nPages tagged resident:                        134476.\nPages tagged compressed:                       47269.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6830.\nPages tag-storage free:                         1318.\nPages tag-storage non-tag pageable:            90148.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7645504.\nTagged compressions:                         9950445.\nTagged decompressions:                       9167900.\n",
      "load_average": [
        2.78369140625,
        6.54345703125,
        6.9462890625
      ]
    },
    "finished": {
      "utc": "2026-09-06T00:56:56.519004+00:00",
      "vm_stat": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   157653.\nPages active:                                1030717.\nPages inactive:                              1077456.\nPages speculative:                             15484.\nPages throttled:                                   0.\nPages wired down:                             217932.\nPages purgeable:                               11095.\n\"Translation faults\":                    14243349324.\nPages copy-on-write:                       655937596.\nPages zero filled:                       17630854078.\nPages reactivated:                        2904470494.\nPages purged:                               65295602.\nFile-backed pages:                           1479895.\nAnonymous pages:                              643762.\nPages stored in compressor:                  1656256.\nPages occupied by compressor:                 585145.\nDecompressions:                           1001599292.\nCompressions:                             1298620829.\nPageins:                                  6561745873.\nPageouts:                                   10805905.\nSwapins:                                    41724328.\nSwapouts:                                   69922789.\nPages tagged:                                 179366.\nPages tagged resident:                        132113.\nPages tagged compressed:                       47253.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6830.\nPages tag-storage free:                         1322.\nPages tag-storage non-tag pageable:            90144.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7644224.\nTagged compressions:                         9950445.\nTagged decompressions:                       9167915.\n",
      "load_average": [
        2.0908203125,
        5.72802734375,
        6.61669921875
      ]
    },
    "decode_write_fsync_and_final_hash_seconds_diagnostic": 57.36010591685772,
    "frames": 71,
    "original_bytes": 2192353120,
    "coverage_exact": true,
    "reconstructed_sha256": "9128a9cbf81cd25bc4cbebe8adeefa12fa36ee96fcccb6f5fe378343b45131f0",
    "pinned_sha256_matches": true
  },
  "finished": {
    "utc": "2026-09-06T00:56:56.524586+00:00",
    "vm_stat": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   157644.\nPages active:                                1030746.\nPages inactive:                              1077452.\nPages speculative:                             15484.\nPages throttled:                                   0.\nPages wired down:                             217932.\nPages purgeable:                               11095.\n\"Translation faults\":                    14243349860.\nPages copy-on-write:                       655937729.\nPages zero filled:                       17630854152.\nPages reactivated:                        2904470494.\nPages purged:                               65295602.\nFile-backed pages:                           1479895.\nAnonymous pages:                              643787.\nPages stored in compressor:                  1656256.\nPages occupied by compressor:                 585145.\nDecompressions:                           1001599292.\nCompressions:                             1298620829.\nPageins:                                  6561745874.\nPageouts:                                   10805905.\nSwapins:                                    41724328.\nSwapouts:                                   69922789.\nPages tagged:                                 179366.\nPages tagged resident:                        132113.\nPages tagged compressed:                       47253.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6830.\nPages tag-storage free:                         1322.\nPages tag-storage non-tag pageable:            90144.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7644224.\nTagged compressions:                         9950445.\nTagged decompressions:                       9167915.\n",
    "load_average": [
      2.0908203125,
      5.72802734375,
      6.61669921875
    ]
  }
}
```


## Raw output: native-probe.json

```text
{
  "stage": "native_rans_large_blocks",
  "started": {
    "utc": "2026-09-06T01:02:41.794818+00:00",
    "vm_stat": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   348359.\nPages active:                                 973253.\nPages inactive:                               859392.\nPages speculative:                            115773.\nPages throttled:                                   0.\nPages wired down:                             233435.\nPages purgeable:                                 291.\n\"Translation faults\":                    14246184082.\nPages copy-on-write:                       656157039.\nPages zero filled:                       17634196051.\nPages reactivated:                        2904892616.\nPages purged:                               65305033.\nFile-backed pages:                           1315092.\nAnonymous pages:                              633326.\nPages stored in compressor:                  1583705.\nPages occupied by compressor:                 554610.\nDecompressions:                           1001671525.\nCompressions:                             1298620829.\nPageins:                                  6562297185.\nPageouts:                                   10806000.\nSwapins:                                    41724355.\nSwapouts:                                   69922789.\nPages tagged:                                 179497.\nPages tagged resident:                        133141.\nPages tagged compressed:                       46356.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6830.\nPages tag-storage free:                          574.\nPages tag-storage non-tag pageable:            90892.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7462464.\nTagged compressions:                         9950445.\nTagged decompressions:                       9168798.\n",
    "load_average": [
      1.73828125,
      2.88330078125,
      4.921875
    ]
  },
  "self_checks": 12,
  "source_sha256": "a9c07a0ce3c5b70e7fc6806203fa7462cb694e3c0455697afe8ae9b37533ea54",
  "c_source_sha256": "1ce6e4f9afd5bf559402db7268fc26af16681a5dc3ac45b7abfa53fb7154335e",
  "binary_sha256": "d26ff4389c1a87fd5df8bba7a8b7f8186debea5628f8d5dbc0b6b717afbc6657",
  "samples": [
    {
      "group": "experts",
      "method": "baseline",
      "file": "model-00001.safetensors",
      "tensor": "language_model.model.layers.0.mlp.switch_mlp.down_proj.weight",
      "offset": 320274432,
      "original_bytes": 37748736,
      "compressed_bytes": 32155531,
      "fraction": 0.8518306679195828,
      "sha256": "1cef21f1af25c9100678263ebdf6622d105a96b41ad52d69586cdb2bfabb3247",
      "roundtrip_exact": true,
      "encode_seconds_diagnostic": 0.528935250127688,
      "decode_seconds_diagnostic": [
        0.9908486669883132,
        0.9890203329268843,
        0.9914808750618249
      ],
      "median_decode_MBps_diagnostic": 38.09737779103783
    },
    {
      "group": "experts",
      "method": "native",
      "file": "model-00001.safetensors",
      "tensor": "language_model.model.layers.0.mlp.switch_mlp.down_proj.weight",
      "offset": 320274432,
      "original_bytes": 37748736,
      "compressed_bytes": 32156295,
      "fraction": 0.8518509070078532,
      "sha256": "1cef21f1af25c9100678263ebdf6622d105a96b41ad52d69586cdb2bfabb3247",
      "roundtrip_exact": true,
      "encode_seconds_diagnostic": 0.3526761669199914,
      "decode_seconds_diagnostic": [
        0.2865448328666389,
        0.2893533748574555,
        0.28602533298544586
      ],
      "median_decode_MBps_diagnostic": 131.73762591478547
    },
    {
      "group": "experts",
      "method": "native_reverse",
      "file": "model-00001.safetensors",
      "tensor": "language_model.model.layers.0.mlp.switch_mlp.down_proj.weight",
      "offset": 320274432,
      "original_bytes": 37748736,
      "compressed_bytes": 32140079,
      "fraction": 0.8514213297102187,
      "sha256": "1cef21f1af25c9100678263ebdf6622d105a96b41ad52d69586cdb2bfabb3247",
      "roundtrip_exact": true,
      "encode_seconds_diagnostic": 0.34817349980585277,
      "decode_seconds_diagnostic": [
        0.28569266595877707,
        0.2848130001220852,
        0.28491133404895663
      ],
      "median_decode_MBps_diagnostic": 132.49292495156965
    },
    {
      "group": "experts",
      "method": "fast_zstd",
      "file": "model-00001.safetensors",
      "tensor": "language_model.model.layers.0.mlp.switch_mlp.down_proj.weight",
      "offset": 320274432,
      "original_bytes": 37748736,
      "compressed_bytes": 32526946,
      "fraction": 0.8616698053148057,
      "sha256": "1cef21f1af25c9100678263ebdf6622d105a96b41ad52d69586cdb2bfabb3247",
      "roundtrip_exact": true,
      "encode_seconds_diagnostic": 0.15069850021973252,
      "decode_seconds_diagnostic": [
        0.099523332901299,
        0.10041883308440447,
        0.09982324996963143
      ],
      "median_decode_MBps_diagnostic": 378.15575040367895
    },
    {
      "group": "ngram",
      "method": "baseline",
      "file": "model-00001.safetensors",
      "tensor": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_0.weight",
      "offset": 138149888,
      "original_bytes": 41943040,
      "compressed_bytes": 34582531,
      "fraction": 0.8245117902755738,
      "sha256": "cf75d145a380c73bf671de33e48ec0487dcea03178268545b694cfb90866bc80",
      "roundtrip_exact": true,
      "encode_seconds_diagnostic": 0.5388601250015199,
      "decode_seconds_diagnostic": [
        1.1030648332089186,
        1.1007791669107974,
        1.1131762501318008
      ],
      "median_decode_MBps_diagnostic": 38.02409317862467
    },
    {
      "group": "ngram",
      "method": "native",
      "file": "model-00001.safetensors",
      "tensor": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_0.weight",
      "offset": 138149888,
      "original_bytes": 41943040,
      "compressed_bytes": 34580948,
      "fraction": 0.8244740486145019,
      "sha256": "cf75d145a380c73bf671de33e48ec0487dcea03178268545b694cfb90866bc80",
      "roundtrip_exact": true,
      "encode_seconds_diagnostic": 0.379505957942456,
      "decode_seconds_diagnostic": [
        0.311402624938637,
        0.31016629096120596,
        0.31016029114834964
      ],
      "median_decode_MBps_diagnostic": 135.2275899164233
    },
    {
      "group": "ngram",
      "method": "native_reverse",
      "file": "model-00001.safetensors",
      "tensor": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_0.weight",
      "offset": 138149888,
      "original_bytes": 41943040,
      "compressed_bytes": 34532518,
      "fraction": 0.823319387435913,
      "sha256": "cf75d145a380c73bf671de33e48ec0487dcea03178268545b694cfb90866bc80",
      "roundtrip_exact": true,
      "encode_seconds_diagnostic": 0.3807804170064628,
      "decode_seconds_diagnostic": [
        0.30853720800951123,
        0.3077167081646621,
        0.30779070779681206
      ],
      "median_decode_MBps_diagnostic": 136.2713003918516
    },
    {
      "group": "ngram",
      "method": "fast_zstd",
      "file": "model-00001.safetensors",
      "tensor": "language_model.model.layers.1.ple.ple_embedding.ngram_embedding.shard_0.weight",
      "offset": 138149888,
      "original_bytes": 41943040,
      "compressed_bytes": 35446977,
      "fraction": 0.8451217889785767,
      "sha256": "cf75d145a380c73bf671de33e48ec0487dcea03178268545b694cfb90866bc80",
      "roundtrip_exact": true,
      "encode_seconds_diagnostic": 0.19204499991610646,
      "decode_seconds_diagnostic": [
        0.1094077080488205,
        0.11003637500107288,
        0.10985754197463393
      ],
      "median_decode_MBps_diagnostic": 381.7948157777336
    },
    {
      "group": "other",
      "method": "baseline",
      "file": "model-00011.safetensors",
      "tensor": "language_model.lm_head.weight",
      "offset": 235962368,
      "original_bytes": 37748736,
      "compressed_bytes": 31924131,
      "fraction": 0.8457006613413492,
      "sha256": "d486a83ec8174e08ff08fb9248accc8d97b5ed331d1893cde078f31eb23f412e",
      "roundtrip_exact": true,
      "encode_seconds_diagnostic": 0.45682529197074473,
      "decode_seconds_diagnostic": [
        0.9650640829931945,
        0.96035779081285,
        0.9600265000481158
      ],
      "median_decode_MBps_diagnostic": 39.30695034821277
    },
    {
      "group": "other",
      "method": "native",
      "file": "model-00011.safetensors",
      "tensor": "language_model.lm_head.weight",
      "offset": 235962368,
      "original_bytes": 37748736,
      "compressed_bytes": 31923712,
      "fraction": 0.8456895616319444,
      "sha256": "d486a83ec8174e08ff08fb9248accc8d97b5ed331d1893cde078f31eb23f412e",
      "roundtrip_exact": true,
      "encode_seconds_diagnostic": 0.323080874979496,
      "decode_seconds_diagnostic": [
        0.26605600002221763,
        0.26830304181203246,
        0.26811162498779595
      ],
      "median_decode_MBps_diagnostic": 140.7948499126745
    },
    {
      "group": "other",
      "method": "native_reverse",
      "file": "model-00011.safetensors",
      "tensor": "language_model.lm_head.weight",
      "offset": 235962368,
      "original_bytes": 37748736,
      "compressed_bytes": 31906889,
      "fraction": 0.8452439043256972,
      "sha256": "d486a83ec8174e08ff08fb9248accc8d97b5ed331d1893cde078f31eb23f412e",
      "roundtrip_exact": true,
      "encode_seconds_diagnostic": 0.32701674988493323,
      "decode_seconds_diagnostic": [
        0.26478149998001754,
        0.2663512909784913,
        0.26558145810849965
      ],
      "median_decode_MBps_diagnostic": 142.13618777775622
    },
    {
      "group": "other",
      "method": "fast_zstd",
      "file": "model-00011.safetensors",
      "tensor": "language_model.lm_head.weight",
      "offset": 235962368,
      "original_bytes": 37748736,
      "compressed_bytes": 32294383,
      "fraction": 0.8555089897579617,
      "sha256": "d486a83ec8174e08ff08fb9248accc8d97b5ed331d1893cde078f31eb23f412e",
      "roundtrip_exact": true,
      "encode_seconds_diagnostic": 0.14052470796741545,
      "decode_seconds_diagnostic": [
        0.09932679100893438,
        0.09919199999421835,
        0.09945445787161589
      ],
      "median_decode_MBps_diagnostic": 380.04586291934595
    },
    {
      "group": "mtp",
      "method": "baseline",
      "file": "mtp.safetensors",
      "tensor": "mtp.layers.0.mlp.switch_mlp.down_proj.weight",
      "offset": 320274432,
      "original_bytes": 37748736,
      "compressed_bytes": 32014997,
      "fraction": 0.8481077882978652,
      "sha256": "0f7ae535d93b68e0993d868436d54f3a4233a31a90ba9bfc309591e99340a72c",
      "roundtrip_exact": true,
      "encode_seconds_diagnostic": 0.47518362500704825,
      "decode_seconds_diagnostic": [
        0.9811232499778271,
        0.9792844171170145,
        0.9873467921279371
      ],
      "median_decode_MBps_diagnostic": 38.475019321836584
    },
    {
      "group": "mtp",
      "method": "native",
      "file": "mtp.safetensors",
      "tensor": "mtp.layers.0.mlp.switch_mlp.down_proj.weight",
      "offset": 320274432,
      "original_bytes": 37748736,
      "compressed_bytes": 32015171,
      "fraction": 0.8481123977237277,
      "sha256": "0f7ae535d93b68e0993d868436d54f3a4233a31a90ba9bfc309591e99340a72c",
      "roundtrip_exact": true,
      "encode_seconds_diagnostic": 0.34647066704928875,
      "decode_seconds_diagnostic": [
        0.2838520840741694,
        0.28460758295841515,
        0.2838644590228796
      ],
      "median_decode_MBps_diagnostic": 132.9815508779753
    },
    {
      "group": "mtp",
      "method": "native_reverse",
      "file": "mtp.safetensors",
      "tensor": "mtp.layers.0.mlp.switch_mlp.down_proj.weight",
      "offset": 320274432,
      "original_bytes": 37748736,
      "compressed_bytes": 32005331,
      "fraction": 0.8478517267439101,
      "sha256": "0f7ae535d93b68e0993d868436d54f3a4233a31a90ba9bfc309591e99340a72c",
      "roundtrip_exact": true,
      "encode_seconds_diagnostic": 0.34526799991726875,
      "decode_seconds_diagnostic": [
        0.2825788748450577,
        0.28363108402118087,
        0.2834157079923898
      ],
      "median_decode_MBps_diagnostic": 133.1921094543342
    },
    {
      "group": "mtp",
      "method": "fast_zstd",
      "file": "mtp.safetensors",
      "tensor": "mtp.layers.0.mlp.switch_mlp.down_proj.weight",
      "offset": 320274432,
      "original_bytes": 37748736,
      "compressed_bytes": 32477190,
      "fraction": 0.8603517214457194,
      "sha256": "0f7ae535d93b68e0993d868436d54f3a4233a31a90ba9bfc309591e99340a72c",
      "roundtrip_exact": true,
      "encode_seconds_diagnostic": 0.1352764170151204,
      "decode_seconds_diagnostic": [
        0.100134665844962,
        0.09932487504556775,
        0.10010087490081787
      ],
      "median_decode_MBps_diagnostic": 377.1069537344431
    }
  ],
  "finished": {
    "utc": "2026-09-06T01:03:09.247008+00:00",
    "vm_stat": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   274351.\nPages active:                                1012374.\nPages inactive:                               895969.\nPages speculative:                            116115.\nPages throttled:                                   0.\nPages wired down:                             231545.\nPages purgeable:                                2943.\n\"Translation faults\":                    14246324215.\nPages copy-on-write:                       656166937.\nPages zero filled:                       17634316685.\nPages reactivated:                        2904892799.\nPages purged:                               65305059.\nFile-backed pages:                           1322570.\nAnonymous pages:                              701888.\nPages stored in compressor:                  1583401.\nPages occupied by compressor:                 554502.\nDecompressions:                           1001671827.\nCompressions:                             1298620829.\nPageins:                                  6562304410.\nPageouts:                                   10806000.\nSwapins:                                    41724355.\nSwapouts:                                   69922789.\nPages tagged:                                 179338.\nPages tagged resident:                        132988.\nPages tagged compressed:                       46350.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6830.\nPages tag-storage free:                          648.\nPages tag-storage non-tag pageable:            90818.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7462464.\nTagged compressions:                         9950445.\nTagged decompressions:                       9168802.\n",
    "load_average": [
      1.67236328125,
      2.7783203125,
      4.82421875
    ]
  }
}
```


## Raw output: native-full/full-file.json

```text
{
  "stage": "complete_shard",
  "started": {
    "utc": "2026-09-06T01:04:44.277242+00:00",
    "vm_stat": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   495656.\nPages active:                                 847113.\nPages inactive:                               932407.\nPages speculative:                             34639.\nPages throttled:                                   0.\nPages wired down:                             217984.\nPages purgeable:                                9769.\n\"Translation faults\":                    14247346102.\nPages copy-on-write:                       656232973.\nPages zero filled:                       17635963521.\nPages reactivated:                        2905311747.\nPages purged:                               65315877.\nFile-backed pages:                           1194520.\nAnonymous pages:                              619639.\nPages stored in compressor:                  1584924.\nPages occupied by compressor:                 557107.\nDecompressions:                           1001696577.\nCompressions:                             1298661653.\nPageins:                                  6562454997.\nPageouts:                                   10806409.\nSwapins:                                    41724359.\nSwapouts:                                   69922789.\nPages tagged:                                 177597.\nPages tagged resident:                        133360.\nPages tagged compressed:                       44237.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6831.\nPages tag-storage free:                          993.\nPages tag-storage non-tag pageable:            90472.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7001600.\nTagged compressions:                         9951646.\nTagged decompressions:                       9171523.\n",
    "load_average": [
      2.3544921875,
      2.6630859375,
      4.55712890625
    ]
  },
  "filename": "model-00011.safetensors",
  "block_mib": 32,
  "entropy_codec": "native-rans-v1",
  "source_sha256": "ea5d830f311c7b74a7dd8051e8ef8ff17a37066268f02abd83b756e8220c6891",
  "frames": [
    {
      "kind": "raw",
      "ranges": [
        [
          0,
          4960
        ]
      ],
      "method": "zstd3",
      "sha256": "3f55cfa1497b1e1b45d596abbad4047fc80f00a955b35a889a0846e0e61a65e2",
      "archive_bytes": 1055
    },
    {
      "kind": "quant",
      "ranges": [
        [
          26219360,
          33554432
        ],
        [
          445649760,
          2097152
        ],
        [
          4960,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "c835c46d5f1c42606c32c7c712851003fa824ff7c9e88152bb9bfad79be959c3",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.down_proj.weight",
      "archive_bytes": 32220743,
      "weight_candidate_bytes": {
        "raw/zstd3": 31364356,
        "context_nibble_center": 31057657,
        "context_nibble_scale": 30992987
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2710576,
        "pred_shuffle2/zstd19": 1281508,
        "pred_ans": 1227482
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          59773792,
          33554432
        ],
        [
          447746912,
          2097152
        ],
        [
          2102112,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "6450db83e4221667f658e4826d225b16529cde0dcdbac11e958110f32d030a2e",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.down_proj.weight",
      "archive_bytes": 32213456,
      "weight_candidate_bytes": {
        "raw/zstd3": 31368965,
        "context_nibble_center": 31057750,
        "context_nibble_scale": 30991157
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2699485,
        "pred_shuffle2/zstd19": 1277193,
        "pred_ans": 1222022
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          93328224,
          33554432
        ],
        [
          449844064,
          2097152
        ],
        [
          4199264,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "024a93966ab0a47aaf01e2151e74e165de0c3ace8f4b6a2bbe955d95219b7b86",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.down_proj.weight",
      "archive_bytes": 32217355,
      "weight_candidate_bytes": {
        "raw/zstd3": 31365922,
        "context_nibble_center": 31057212,
        "context_nibble_scale": 30992053
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2705385,
        "pred_shuffle2/zstd19": 1279710,
        "pred_ans": 1225025
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          126882656,
          33554432
        ],
        [
          451941216,
          2097152
        ],
        [
          6296416,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "c3ca69442ccffe8328f34427c1a2e9cfd76a7940173357d081c31675f851eecd",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.down_proj.weight",
      "archive_bytes": 32190633,
      "weight_candidate_bytes": {
        "raw/zstd3": 31348173,
        "context_nibble_center": 31036059,
        "context_nibble_scale": 30967264
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2698861,
        "pred_shuffle2/zstd19": 1278219,
        "pred_ans": 1223091
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          160437088,
          33554432
        ],
        [
          454038368,
          2097152
        ],
        [
          8393568,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "2df063d2fe7f9bd3918f4bf56f8df9ef27f6482b68ecbf10e0c3bd60d7e19ccb",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.down_proj.weight",
      "archive_bytes": 32219138,
      "weight_candidate_bytes": {
        "raw/zstd3": 31365323,
        "context_nibble_center": 31055717,
        "context_nibble_scale": 30991299
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2709549,
        "pred_shuffle2/zstd19": 1281492,
        "pred_ans": 1227561
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          193991520,
          33554432
        ],
        [
          456135520,
          2097152
        ],
        [
          10490720,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "4a12e92c657f4c5b3d1fdcf5ddad08292a55f204ab671b25b52230957a7f40f0",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.down_proj.weight",
      "archive_bytes": 32215371,
      "weight_candidate_bytes": {
        "raw/zstd3": 31367652,
        "context_nibble_center": 31059268,
        "context_nibble_scale": 30992604
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2701440,
        "pred_shuffle2/zstd19": 1277926,
        "pred_ans": 1222488
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          227545952,
          33554432
        ],
        [
          458232672,
          2097152
        ],
        [
          12587872,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "38277dcabdb011af1b9a16a0864b26e78f98a1ad33f8a3a0f8f86375c1eaddda",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.down_proj.weight",
      "archive_bytes": 32219595,
      "weight_candidate_bytes": {
        "raw/zstd3": 31364115,
        "context_nibble_center": 31057060,
        "context_nibble_scale": 30991798
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2713183,
        "pred_shuffle2/zstd19": 1285263,
        "pred_ans": 1227518
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          261100384,
          33554432
        ],
        [
          460329824,
          2097152
        ],
        [
          14685024,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "ea32487597d539feecd774309cbda30bd40f1207840b27ef2c581ace24a1344d",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.down_proj.weight",
      "archive_bytes": 32208248,
      "weight_candidate_bytes": {
        "raw/zstd3": 31355633,
        "context_nibble_center": 31046888,
        "context_nibble_scale": 30981832
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2705131,
        "pred_shuffle2/zstd19": 1280424,
        "pred_ans": 1226137
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          294654816,
          33554432
        ],
        [
          462426976,
          2097152
        ],
        [
          16782176,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "bbe2f45d39a023e08fe15b171d37ee9e761604cb83c0e4106bda1509ffb58e32",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.down_proj.weight",
      "archive_bytes": 32205964,
      "weight_candidate_bytes": {
        "raw/zstd3": 31362636,
        "context_nibble_center": 31051225,
        "context_nibble_scale": 30982535
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2700990,
        "pred_shuffle2/zstd19": 1279997,
        "pred_ans": 1223150
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          328209248,
          33554432
        ],
        [
          464524128,
          2097152
        ],
        [
          18879328,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "8adb5d0153c8f4227663ba78013976748a597c6dea2d8675ce6a21bf91b1b746",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.down_proj.weight",
      "archive_bytes": 32207691,
      "weight_candidate_bytes": {
        "raw/zstd3": 31362775,
        "context_nibble_center": 31053808,
        "context_nibble_scale": 30984863
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2703229,
        "pred_shuffle2/zstd19": 1282596,
        "pred_ans": 1222549
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          361763680,
          33554432
        ],
        [
          466621280,
          2097152
        ],
        [
          20976480,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "4b7b1a25468d542eb1736539778626462b68ca095b06070fb183665a87ee7749",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.down_proj.weight",
      "archive_bytes": 32219053,
      "weight_candidate_bytes": {
        "raw/zstd3": 31367695,
        "context_nibble_center": 31060054,
        "context_nibble_scale": 30994196
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2703788,
        "pred_shuffle2/zstd19": 1278322,
        "pred_ans": 1224578
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          395318112,
          33554432
        ],
        [
          468718432,
          2097152
        ],
        [
          23073632,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "e97b819e95c8085e3fc74e4254360f0e49f8e940769f8ba5e7554e66d8f459bf",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.down_proj.weight",
      "archive_bytes": 32216974,
      "weight_candidate_bytes": {
        "raw/zstd3": 31366091,
        "context_nibble_center": 31053937,
        "context_nibble_scale": 30989892
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2708265,
        "pred_shuffle2/zstd19": 1281796,
        "pred_ans": 1226803
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          428872544,
          16777216
        ],
        [
          470815584,
          1048576
        ],
        [
          25170784,
          1048576
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "a6cdda31abcfeec2d42c0f58482ca318b1d7078c42e17f4c8f25842894ac765e",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.down_proj.weight",
      "archive_bytes": 16110034,
      "weight_candidate_bytes": {
        "raw/zstd3": 15681319,
        "context_nibble_center": 15527240,
        "context_nibble_scale": 15497753
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 1351677,
        "pred_shuffle2/zstd19": 642520,
        "pred_ans": 612002
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          518118240,
          819200
        ],
        [
          2163312480,
          51200
        ],
        [
          883788640,
          51200
        ]
      ],
      "weight_method": "context_nibble_center",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "3f47e4a730b521d28cd7505967cc9a41c8d614508ba0131dc369e92d18da3752",
      "tensor": "language_model.model.layers.9.mlp.shared_expert.up_proj.weight",
      "archive_bytes": 771658,
      "weight_candidate_bytes": {
        "raw/zstd3": 750038,
        "context_nibble_center": 738048,
        "context_nibble_scale": 744349
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 69300,
        "pred_shuffle2/zstd19": 34086,
        "pred_ans": 33334
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          518937440,
          819200
        ],
        [
          471987040,
          51200
        ],
        [
          2165985120,
          51200
        ]
      ],
      "weight_method": "context_nibble_center",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "dcca1d51b1ca2ce966ce641df8ed40d11cb797e546d7569bd597af59d34c396b",
      "tensor": "language_model.model.layers.9.mlp.shared_expert.gate_proj.weight",
      "archive_bytes": 774401,
      "weight_candidate_bytes": {
        "raw/zstd3": 752307,
        "context_nibble_center": 740935,
        "context_nibble_scale": 747421
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 69423,
        "pred_shuffle2/zstd19": 33904,
        "pred_ans": 33190
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          519756640,
          33554432
        ],
        [
          1702512480,
          2097152
        ],
        [
          863820640,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "e1f95f0fe48f82dfbc2f6b78e5f60797ea7c6880d7fb78271da365872b3e6a25",
      "tensor": "language_model.model.embed_tokens.weight",
      "archive_bytes": 32028925,
      "weight_candidate_bytes": {
        "raw/zstd3": 31088066,
        "context_nibble_center": 30717161,
        "context_nibble_scale": 30698566
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2813238,
        "pred_shuffle2/zstd19": 1450442,
        "pred_ans": 1330078
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          553311072,
          33554432
        ],
        [
          1704609632,
          2097152
        ],
        [
          865917792,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "3d95b9bec5a78f4867bd282964b5706a1dcec63442adc306d56618b37b2d4194",
      "tensor": "language_model.model.embed_tokens.weight",
      "archive_bytes": 32094260,
      "weight_candidate_bytes": {
        "raw/zstd3": 31230757,
        "context_nibble_center": 30877366,
        "context_nibble_scale": 30821095
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2724937,
        "pred_shuffle2/zstd19": 1363812,
        "pred_ans": 1272884
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          586865504,
          33554432
        ],
        [
          1706706784,
          2097152
        ],
        [
          868014944,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "ffd188e0e9fd04e066620c72379f62627d49539323181fc8288a712044840e1b",
      "tensor": "language_model.model.embed_tokens.weight",
      "archive_bytes": 32118394,
      "weight_candidate_bytes": {
        "raw/zstd3": 31267897,
        "context_nibble_center": 30925110,
        "context_nibble_scale": 30857291
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2704726,
        "pred_shuffle2/zstd19": 1335316,
        "pred_ans": 1260822
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          620419936,
          33554432
        ],
        [
          1708803936,
          2097152
        ],
        [
          870112096,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "90027cb3d5a41c80a39dc233089e3581992c0c8ccdab9b5ac46a471f9a40d060",
      "tensor": "language_model.model.embed_tokens.weight",
      "archive_bytes": 32126496,
      "weight_candidate_bytes": {
        "raw/zstd3": 31221029,
        "context_nibble_center": 30875094,
        "context_nibble_scale": 30831064
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2735073,
        "pred_shuffle2/zstd19": 1367975,
        "pred_ans": 1295151
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          653974368,
          33554432
        ],
        [
          1710901088,
          2097152
        ],
        [
          872209248,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "abc68ac25f33eea9c18fa26e2d39023e93da7a9ad9c11ed9cf38b0977bfd706f",
      "tensor": "language_model.model.embed_tokens.weight",
      "archive_bytes": 32080707,
      "weight_candidate_bytes": {
        "raw/zstd3": 31230923,
        "context_nibble_center": 30867978,
        "context_nibble_scale": 30802954
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2723115,
        "pred_shuffle2/zstd19": 1338049,
        "pred_ans": 1277472
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          687528800,
          33554432
        ],
        [
          1712998240,
          2097152
        ],
        [
          874306400,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "e38994593b3ce22d7c2d17b685bb11653d350691524bc9106161e4588616fa2e",
      "tensor": "language_model.model.embed_tokens.weight",
      "archive_bytes": 32108455,
      "weight_candidate_bytes": {
        "raw/zstd3": 31266524,
        "context_nibble_center": 30892956,
        "context_nibble_scale": 30826135
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2732402,
        "pred_shuffle2/zstd19": 1341309,
        "pred_ans": 1282039
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          721083232,
          33554432
        ],
        [
          1715095392,
          2097152
        ],
        [
          876403552,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "a0dca2c317dbc21cc82474dfbde17bc9b510066fa24504673e282fe4c2157700",
      "tensor": "language_model.model.embed_tokens.weight",
      "archive_bytes": 32161202,
      "weight_candidate_bytes": {
        "raw/zstd3": 31289735,
        "context_nibble_center": 30941902,
        "context_nibble_scale": 30880670
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2726347,
        "pred_shuffle2/zstd19": 1354951,
        "pred_ans": 1280251
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          754637664,
          33554432
        ],
        [
          1717192544,
          2097152
        ],
        [
          878500704,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "148171877bfe4e89c86682541fead1a492e0e8668e5ed8b9d2d806ebb005c6a8",
      "tensor": "language_model.model.embed_tokens.weight",
      "archive_bytes": 32151094,
      "weight_candidate_bytes": {
        "raw/zstd3": 31304275,
        "context_nibble_center": 30949157,
        "context_nibble_scale": 30879402
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2709065,
        "pred_shuffle2/zstd19": 1337637,
        "pred_ans": 1271411
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          788192096,
          33554432
        ],
        [
          1719289696,
          2097152
        ],
        [
          880597856,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "6c20429855fe552bbf279d356b58a28e490d6cdd9b8bd9a1b761a91648ab1993",
      "tensor": "language_model.model.embed_tokens.weight",
      "archive_bytes": 32160121,
      "weight_candidate_bytes": {
        "raw/zstd3": 31313007,
        "context_nibble_center": 30957952,
        "context_nibble_scale": 30885525
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2713212,
        "pred_shuffle2/zstd19": 1341103,
        "pred_ans": 1274315
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          821746528,
          15859712
        ],
        [
          1721386848,
          991232
        ],
        [
          882695008,
          991232
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "50b3670ecfaca453092f588bb79e1b41bc51e38301487a8e0bbaa6ca28706150",
      "tensor": "language_model.model.embed_tokens.weight",
      "archive_bytes": 15228038,
      "weight_candidate_bytes": {
        "raw/zstd3": 14800408,
        "context_nibble_center": 14638863,
        "context_nibble_scale": 14618681
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 1288178,
        "pred_shuffle2/zstd19": 639502,
        "pred_ans": 609078
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          910238560,
          33554432
        ],
        [
          1722378080,
          2097152
        ],
        [
          472038240,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "18532843e6d1a989ab06b81954e85d638803b43ace772890ae2d99b4115dd5dc",
      "tensor": "language_model.lm_head.weight",
      "archive_bytes": 31910755,
      "weight_candidate_bytes": {
        "raw/zstd3": 31090449,
        "context_nibble_center": 30717943,
        "context_nibble_scale": 30642430
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2720424,
        "pred_shuffle2/zstd19": 1328373,
        "pred_ans": 1268044
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          943792992,
          33554432
        ],
        [
          1724475232,
          2097152
        ],
        [
          474135392,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "30135acf9a6eae131a5aa7ea8847a4408bd2db95c68e086e8d436b1504156398",
      "tensor": "language_model.lm_head.weight",
      "archive_bytes": 31950457,
      "weight_candidate_bytes": {
        "raw/zstd3": 31108657,
        "context_nibble_center": 30756186,
        "context_nibble_scale": 30689355
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2725438,
        "pred_shuffle2/zstd19": 1317409,
        "pred_ans": 1260821
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          977347424,
          33554432
        ],
        [
          1726572384,
          2097152
        ],
        [
          476232544,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "1b9ce192dca33f058f3d69eb7a565bd6ffc774d9306a04093143251994587343",
      "tensor": "language_model.lm_head.weight",
      "archive_bytes": 31943435,
      "weight_candidate_bytes": {
        "raw/zstd3": 31100455,
        "context_nibble_center": 30742630,
        "context_nibble_scale": 30678455
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2731755,
        "pred_shuffle2/zstd19": 1320383,
        "pred_ans": 1264699
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1010901856,
          33554432
        ],
        [
          1728669536,
          2097152
        ],
        [
          478329696,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "cea560e309686bc2b8ce2bd31951459ce71d7d4dadee2d66cee0de96f83ddd0f",
      "tensor": "language_model.lm_head.weight",
      "archive_bytes": 31900053,
      "weight_candidate_bytes": {
        "raw/zstd3": 31069518,
        "context_nibble_center": 30706446,
        "context_nibble_scale": 30634419
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2723484,
        "pred_shuffle2/zstd19": 1322553,
        "pred_ans": 1265352
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1044456288,
          33554432
        ],
        [
          1730766688,
          2097152
        ],
        [
          480426848,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "e0f4a442c441e6b67cbc10fe5232deb4fa9cf4ceffa9f77a28f6965f5d9e33a5",
      "tensor": "language_model.lm_head.weight",
      "archive_bytes": 31864488,
      "weight_candidate_bytes": {
        "raw/zstd3": 31064807,
        "context_nibble_center": 30698050,
        "context_nibble_scale": 30613042
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2707413,
        "pred_shuffle2/zstd19": 1307945,
        "pred_ans": 1251164
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1078010720,
          33554432
        ],
        [
          1732863840,
          2097152
        ],
        [
          482524000,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "4ada124fb7cee6f434567062e657a2fe3f354f12aba1de21a689f962a023958a",
      "tensor": "language_model.lm_head.weight",
      "archive_bytes": 31892622,
      "weight_candidate_bytes": {
        "raw/zstd3": 31065213,
        "context_nibble_center": 30702447,
        "context_nibble_scale": 30629312
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2721466,
        "pred_shuffle2/zstd19": 1317251,
        "pred_ans": 1263028
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1111565152,
          33554432
        ],
        [
          1734960992,
          2097152
        ],
        [
          484621152,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "720f216f45da390806525621d73e78458be48b89f88343a11e69765990919225",
      "tensor": "language_model.lm_head.weight",
      "archive_bytes": 31933141,
      "weight_candidate_bytes": {
        "raw/zstd3": 31068567,
        "context_nibble_center": 30691401,
        "context_nibble_scale": 30636977
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2789736,
        "pred_shuffle2/zstd19": 1346205,
        "pred_ans": 1295882
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1145119584,
          33554432
        ],
        [
          1737058144,
          2097152
        ],
        [
          486718304,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "4cf5fd97f49cbcd057e8ee5d08ff416ea2414f65349d480d7a605a5ce6594a2b",
      "tensor": "language_model.lm_head.weight",
      "archive_bytes": 31925313,
      "weight_candidate_bytes": {
        "raw/zstd3": 31069167,
        "context_nibble_center": 30700560,
        "context_nibble_scale": 30639686
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2788112,
        "pred_shuffle2/zstd19": 1342369,
        "pred_ans": 1285345
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1178674016,
          33554432
        ],
        [
          1739155296,
          2097152
        ],
        [
          488815456,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "cf28bd6eed1002c35f2e1ab7f264126b098dc3415a56ae66ffb986822ef2e7d6",
      "tensor": "language_model.lm_head.weight",
      "archive_bytes": 31874302,
      "weight_candidate_bytes": {
        "raw/zstd3": 31031848,
        "context_nibble_center": 30656877,
        "context_nibble_scale": 30592777
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2775846,
        "pred_shuffle2/zstd19": 1344679,
        "pred_ans": 1281243
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1212228448,
          15859712
        ],
        [
          1741252448,
          991232
        ],
        [
          490912608,
          991232
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "4d3a82058e1423d99fe346cd00705c331dd2e7bafa21d896da6145619afd5256",
      "tensor": "language_model.lm_head.weight",
      "archive_bytes": 15054690,
      "weight_candidate_bytes": {
        "raw/zstd3": 14651130,
        "context_nibble_center": 14466810,
        "context_nibble_scale": 14443064
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 1314246,
        "pred_shuffle2/zstd19": 637504,
        "pred_ans": 611346
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1228088160,
          1638400
        ],
        [
          883686240,
          102400
        ],
        [
          910054240,
          102400
        ]
      ],
      "weight_method": "context_nibble_center",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "95219432af2b70311ebbf529b739b1c47266f5ae76198bd379dbdf74d5f5ab2f",
      "tensor": "language_model.model.layers.9.mlp_hyper_connection.input_mix_weight_down.weight",
      "archive_bytes": 1525454,
      "weight_candidate_bytes": {
        "raw/zstd3": 1479784,
        "context_nibble_center": 1454868,
        "context_nibble_scale": 1464426
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 145377,
        "pred_shuffle2/zstd19": 72827,
        "pred_ans": 70307
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1255940960,
          33554432
        ],
        [
          1229726560,
          2097152
        ],
        [
          491903840,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "1f58d904ad9586a36e3fb50dbbf0d4249b98b6b9fded09e6f4cef608432c389b",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.gate_proj.weight",
      "archive_bytes": 31942202,
      "weight_candidate_bytes": {
        "raw/zstd3": 31166526,
        "context_nibble_center": 30825324,
        "context_nibble_scale": 30720672
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2668460,
        "pred_shuffle2/zstd19": 1278925,
        "pred_ans": 1221248
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1289495392,
          33554432
        ],
        [
          1231823712,
          2097152
        ],
        [
          494000992,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "f5162f08f51c1c0fe67be6f3b4562d30cdc5222cf97e54d7dacd5998e05591d5",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.gate_proj.weight",
      "archive_bytes": 31965706,
      "weight_candidate_bytes": {
        "raw/zstd3": 31186984,
        "context_nibble_center": 30848540,
        "context_nibble_scale": 30745827
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2669321,
        "pred_shuffle2/zstd19": 1276836,
        "pred_ans": 1219597
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1323049824,
          33554432
        ],
        [
          1233920864,
          2097152
        ],
        [
          496098144,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "161317a5bbefdd4bb054e31bfb34554f24927fe2af6b0b59baafd5e7e0bc2bec",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.gate_proj.weight",
      "archive_bytes": 31961942,
      "weight_candidate_bytes": {
        "raw/zstd3": 31188288,
        "context_nibble_center": 30841794,
        "context_nibble_scale": 30738133
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2671578,
        "pred_shuffle2/zstd19": 1281393,
        "pred_ans": 1223527
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1356604256,
          33554432
        ],
        [
          1236018016,
          2097152
        ],
        [
          498195296,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "9e9396449acc6a7165359f7848bd09238512087dd95fbf3912d3ab2936f24a98",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.gate_proj.weight",
      "archive_bytes": 31934190,
      "weight_candidate_bytes": {
        "raw/zstd3": 31163292,
        "context_nibble_center": 30807773,
        "context_nibble_scale": 30703643
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2680056,
        "pred_shuffle2/zstd19": 1286603,
        "pred_ans": 1230265
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1390158688,
          33554432
        ],
        [
          1238115168,
          2097152
        ],
        [
          500292448,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "b3ae2b214943d3826107b9a5be6036b9d820bb9c3a8599879fbda4975004227f",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.gate_proj.weight",
      "archive_bytes": 31937458,
      "weight_candidate_bytes": {
        "raw/zstd3": 31162737,
        "context_nibble_center": 30819635,
        "context_nibble_scale": 30714966
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2666811,
        "pred_shuffle2/zstd19": 1279342,
        "pred_ans": 1222210
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1423713120,
          33554432
        ],
        [
          1240212320,
          2097152
        ],
        [
          502389600,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "0ce6404bad40bf05a7f9f2dfb6709a7aa42673038b8b40ff512d7c47c87bc332",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.gate_proj.weight",
      "archive_bytes": 31970882,
      "weight_candidate_bytes": {
        "raw/zstd3": 31193516,
        "context_nibble_center": 30854880,
        "context_nibble_scale": 30752807
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2666135,
        "pred_shuffle2/zstd19": 1273773,
        "pred_ans": 1217793
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1457267552,
          33554432
        ],
        [
          1242309472,
          2097152
        ],
        [
          504486752,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "c9856c15ccae0886b99bd2d91aa141b18c50a9e198686ee2009759744664cad1",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.gate_proj.weight",
      "archive_bytes": 31940752,
      "weight_candidate_bytes": {
        "raw/zstd3": 31163885,
        "context_nibble_center": 30824224,
        "context_nibble_scale": 30718705
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2669949,
        "pred_shuffle2/zstd19": 1280934,
        "pred_ans": 1221765
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1490821984,
          33554432
        ],
        [
          1244406624,
          2097152
        ],
        [
          506583904,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "0b2ab05c06932e5870b0ed28f6dc31f1f6bb94c5da137fe358e520e9e7502b41",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.gate_proj.weight",
      "archive_bytes": 31939644,
      "weight_candidate_bytes": {
        "raw/zstd3": 31170250,
        "context_nibble_center": 30816970,
        "context_nibble_scale": 30713508
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2673928,
        "pred_shuffle2/zstd19": 1283721,
        "pred_ans": 1225854
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1524376416,
          33554432
        ],
        [
          1246503776,
          2097152
        ],
        [
          508681056,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "afe7b2c6ae2662a7650b0109628bdb349f693a8bd02ffe9dd667f510d61bf439",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.gate_proj.weight",
      "archive_bytes": 31959847,
      "weight_candidate_bytes": {
        "raw/zstd3": 31182566,
        "context_nibble_center": 30837751,
        "context_nibble_scale": 30735324
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2674329,
        "pred_shuffle2/zstd19": 1282559,
        "pred_ans": 1224241
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1557930848,
          33554432
        ],
        [
          1248600928,
          2097152
        ],
        [
          510778208,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "c4c7bcce7f9fd58fc76b633886314e4409c9dae5b1abfbfe42606fbd2df03d52",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.gate_proj.weight",
      "archive_bytes": 31980147,
      "weight_candidate_bytes": {
        "raw/zstd3": 31201248,
        "context_nibble_center": 30862490,
        "context_nibble_scale": 30760577
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2668822,
        "pred_shuffle2/zstd19": 1278936,
        "pred_ans": 1219288
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1591485280,
          33554432
        ],
        [
          1250698080,
          2097152
        ],
        [
          512875360,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "8548a7e21b79a72fe781c36a5da692b22bb1df65534fcadc0819f5f52511f3ed",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.gate_proj.weight",
      "archive_bytes": 31955156,
      "weight_candidate_bytes": {
        "raw/zstd3": 31178295,
        "context_nibble_center": 30838241,
        "context_nibble_scale": 30734829
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2669957,
        "pred_shuffle2/zstd19": 1279115,
        "pred_ans": 1220045
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1625039712,
          33554432
        ],
        [
          1252795232,
          2097152
        ],
        [
          514972512,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "bd3ce23df527f12df00e28513c948e7ccbf267188a3ed779b805dbcdce7da787",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.gate_proj.weight",
      "archive_bytes": 31936569,
      "weight_candidate_bytes": {
        "raw/zstd3": 31166090,
        "context_nibble_center": 30819493,
        "context_nibble_scale": 30715105
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2667601,
        "pred_shuffle2/zstd19": 1280487,
        "pred_ans": 1221182
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1658594144,
          16777216
        ],
        [
          1254892384,
          1048576
        ],
        [
          517069664,
          1048576
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "77e967c5c6eb7ebd39f4301084e5e9a450f7fcfec7db17fea5d5e3fee5834060",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.gate_proj.weight",
      "archive_bytes": 15992145,
      "weight_candidate_bytes": {
        "raw/zstd3": 15597805,
        "context_nibble_center": 15429972,
        "context_nibble_scale": 15382583
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 1333075,
        "pred_shuffle2/zstd19": 638321,
        "pred_ans": 609280
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1701693280,
          819200
        ],
        [
          471935840,
          51200
        ],
        [
          471884640,
          51200
        ]
      ],
      "weight_method": "context_nibble_center",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "8be7d2b173fffe8156b31fc850c85c8b38b5af5f5ec9b16ea0650f4e28b0dff5",
      "tensor": "language_model.model.layers.9.mlp.shared_expert.down_proj.weight",
      "archive_bytes": 776770,
      "weight_candidate_bytes": {
        "raw/zstd3": 754029,
        "context_nibble_center": 742695,
        "context_nibble_scale": 750675
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 70241,
        "pred_shuffle2/zstd19": 34428,
        "pred_ans": 33799
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1742243680,
          1638400
        ],
        [
          2166036320,
          102400
        ],
        [
          1675371360,
          102400
        ]
      ],
      "weight_method": "context_nibble_center",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "deaddf671e730af0fedc3a9ad4cb2a13ba484231c1fef388068a587214245b7c",
      "tensor": "language_model.model.layers.9.mlp_hyper_connection.input_mix_weight_up.weight",
      "archive_bytes": 1484409,
      "weight_candidate_bytes": {
        "raw/zstd3": 1447728,
        "context_nibble_center": 1406817,
        "context_nibble_scale": 1427481
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 150322,
        "pred_shuffle2/zstd19": 80969,
        "pred_ans": 77311
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1743882080,
          33554432
        ],
        [
          837606240,
          2097152
        ],
        [
          1675473760,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "676163bbe94d697f5dc94033006026daad1943b74399c5281a5daa39f5f97edb",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.up_proj.weight",
      "archive_bytes": 31947875,
      "weight_candidate_bytes": {
        "raw/zstd3": 31178408,
        "context_nibble_center": 30837022,
        "context_nibble_scale": 30732285
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2661389,
        "pred_shuffle2/zstd19": 1272673,
        "pred_ans": 1215308
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1777436512,
          33554432
        ],
        [
          839703392,
          2097152
        ],
        [
          1677570912,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "d92504048f3cea0c53202f2ec8dcfe58ade67136b731be4a9194656ed00ba689",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.up_proj.weight",
      "archive_bytes": 31972379,
      "weight_candidate_bytes": {
        "raw/zstd3": 31202657,
        "context_nibble_center": 30861839,
        "context_nibble_scale": 30759048
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2655185,
        "pred_shuffle2/zstd19": 1270119,
        "pred_ans": 1213049
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1810990944,
          33554432
        ],
        [
          841800544,
          2097152
        ],
        [
          1679668064,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "d5edccfc5a33f47d08cd9e985c9ca3d68365250ae618a8a5d0b5d666cfdb3a4f",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.up_proj.weight",
      "archive_bytes": 31969217,
      "weight_candidate_bytes": {
        "raw/zstd3": 31195535,
        "context_nibble_center": 30858100,
        "context_nibble_scale": 30753640
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2658661,
        "pred_shuffle2/zstd19": 1271931,
        "pred_ans": 1215295
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1844545376,
          33554432
        ],
        [
          843897696,
          2097152
        ],
        [
          1681765216,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "38305063b7c2cf0866a817d4e78ac86a5e7ca9c1c8ac8b544748bd0140fc572c",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.up_proj.weight",
      "archive_bytes": 31949079,
      "weight_candidate_bytes": {
        "raw/zstd3": 31182674,
        "context_nibble_center": 30830806,
        "context_nibble_scale": 30725261
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2670503,
        "pred_shuffle2/zstd19": 1280967,
        "pred_ans": 1223536
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1878099808,
          33554432
        ],
        [
          845994848,
          2097152
        ],
        [
          1683862368,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "46df521673da4789570486bc4f0fec7551f50834d67c9a772a61f22cf2b0f901",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.up_proj.weight",
      "archive_bytes": 31947575,
      "weight_candidate_bytes": {
        "raw/zstd3": 31174683,
        "context_nibble_center": 30832839,
        "context_nibble_scale": 30729357
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2660421,
        "pred_shuffle2/zstd19": 1275974,
        "pred_ans": 1217936
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1911654240,
          33554432
        ],
        [
          848092000,
          2097152
        ],
        [
          1685959520,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "034efff271b1f7512e542267e537e0aff878ec53816187ec4d9a7157b20fd901",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.up_proj.weight",
      "archive_bytes": 31978008,
      "weight_candidate_bytes": {
        "raw/zstd3": 31201192,
        "context_nibble_center": 30868342,
        "context_nibble_scale": 30765179
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2658974,
        "pred_shuffle2/zstd19": 1275924,
        "pred_ans": 1212547
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1945208672,
          33554432
        ],
        [
          850189152,
          2097152
        ],
        [
          1688056672,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "274b34f718bc2bc0a4ba6ed8fc7db152b42c2be9c0999c4617b0002e5b71c4fd",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.up_proj.weight",
      "archive_bytes": 31939801,
      "weight_candidate_bytes": {
        "raw/zstd3": 31168455,
        "context_nibble_center": 30827350,
        "context_nibble_scale": 30721511
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2665449,
        "pred_shuffle2/zstd19": 1274284,
        "pred_ans": 1218008
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          1978763104,
          33554432
        ],
        [
          852286304,
          2097152
        ],
        [
          1690153824,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "3999ac1e32f2dff667591b1c3e4dc5903482b9d7797cfc39ebd9db32abaf0b13",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.up_proj.weight",
      "archive_bytes": 31952008,
      "weight_candidate_bytes": {
        "raw/zstd3": 31184613,
        "context_nibble_center": 30836469,
        "context_nibble_scale": 30731477
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2664053,
        "pred_shuffle2/zstd19": 1278415,
        "pred_ans": 1220249
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          2012317536,
          33554432
        ],
        [
          854383456,
          2097152
        ],
        [
          1692250976,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "ec195528093a718fd07fc921758829b53c129bc52f3cb6f5676b21960a5e2139",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.up_proj.weight",
      "archive_bytes": 31965554,
      "weight_candidate_bytes": {
        "raw/zstd3": 31196283,
        "context_nibble_center": 30852397,
        "context_nibble_scale": 30748134
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2660514,
        "pred_shuffle2/zstd19": 1275090,
        "pred_ans": 1217138
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          2045871968,
          33554432
        ],
        [
          856480608,
          2097152
        ],
        [
          1694348128,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "8afbd3416d3d5e2fc0c2bcba5240a08a2c0d159a9f6e233485f72b8b9dc81f95",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.up_proj.weight",
      "archive_bytes": 31985739,
      "weight_candidate_bytes": {
        "raw/zstd3": 31211489,
        "context_nibble_center": 30874880,
        "context_nibble_scale": 30771760
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2659486,
        "pred_shuffle2/zstd19": 1270718,
        "pred_ans": 1213697
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          2079426400,
          33554432
        ],
        [
          858577760,
          2097152
        ],
        [
          1696445280,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "71c305e93cabf9032f2eba186dc76fb68867cc301ca391072be7b06ac8272f17",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.up_proj.weight",
      "archive_bytes": 31964458,
      "weight_candidate_bytes": {
        "raw/zstd3": 31192557,
        "context_nibble_center": 30852582,
        "context_nibble_scale": 30749581
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2658515,
        "pred_shuffle2/zstd19": 1271845,
        "pred_ans": 1214595
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          2112980832,
          33554432
        ],
        [
          860674912,
          2097152
        ],
        [
          1698542432,
          2097152
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "6d09f88694d6c2dd167e476e961d8cb0981ac99ecaa11feb03653c86203cdb49",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.up_proj.weight",
      "archive_bytes": 31948952,
      "weight_candidate_bytes": {
        "raw/zstd3": 31178242,
        "context_nibble_center": 30837024,
        "context_nibble_scale": 30733123
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 2660390,
        "pred_shuffle2/zstd19": 1272541,
        "pred_ans": 1215547
      }
    },
    {
      "kind": "quant",
      "ranges": [
        [
          2146535264,
          16777216
        ],
        [
          862772064,
          1048576
        ],
        [
          1700639584,
          1048576
        ]
      ],
      "weight_method": "context_nibble_scale",
      "pair_method": "pred_ans",
      "group_size": 64,
      "sha256": "b72c737a5ba8f29eba3e2bbaa46360917768e0045a4db510c3529ccc95c407cb",
      "tensor": "language_model.model.layers.9.mlp.switch_mlp.up_proj.weight",
      "archive_bytes": 15997180,
      "weight_candidate_bytes": {
        "raw/zstd3": 15604836,
        "context_nibble_center": 15437959,
        "context_nibble_scale": 15390401
      },
      "pair_candidate_bytes": {
        "raw/zstd3": 1332358,
        "pred_shuffle2/zstd19": 635623,
        "pred_ans": 606497
      }
    },
    {
      "kind": "bf16",
      "ranges": [
        [
          471864160,
          20480
        ]
      ],
      "method": "shuffle2/zstd19",
      "sha256": "eca700802ac6312f29d3c1efca56009514c49dc354a4d611addcb582a8c8d013",
      "tensor": "language_model.model.layers.9.mlp_hyper_connection.hc_norm.weight",
      "archive_bytes": 11288,
      "candidate_bytes": {
        "raw/zstd3": 13349,
        "shuffle2/zstd19": 11125,
        "ans": 11140
      }
    },
    {
      "kind": "bf16",
      "ranges": [
        [
          883839840,
          26214400
        ]
      ],
      "method": "ans",
      "sha256": "68035d6130f22f61da552b68400a613aa5f8b30f8327b751f0b863cf3c740756",
      "tensor": "language_model.model.layers.8.mlp.switch_mlp.down_proj.scales",
      "archive_bytes": 13020342,
      "candidate_bytes": {
        "raw/zstd3": 15982336,
        "shuffle2/zstd19": 13275473,
        "ans": 13020188
      }
    },
    {
      "kind": "bf16",
      "ranges": [
        [
          910156640,
          81920
        ]
      ],
      "method": "shuffle2/zstd19",
      "sha256": "ece2a04270501feacd41a25e880de4ca0a73fd0096764b684ed1f2736e8f3caf",
      "tensor": "language_model.model.layers.9.mlp_hyper_connection.block_inject_weight.weight",
      "archive_bytes": 58843,
      "candidate_bytes": {
        "raw/zstd3": 65649,
        "shuffle2/zstd19": 58680,
        "ans": 59241
      }
    },
    {
      "kind": "bf16",
      "ranges": [
        [
          1701688160,
          5120
        ]
      ],
      "method": "shuffle2/zstd19",
      "sha256": "b901be0a7b3c981f03766da2d656ed97b7a0f19ff9146b7357d2724dd91c1f9f",
      "tensor": "language_model.model.layers.9.mlp.shared_expert_gate.weight",
      "archive_bytes": 3978,
      "candidate_bytes": {
        "raw/zstd3": 4099,
        "shuffle2/zstd19": 3815,
        "ans": 4602
      }
    },
    {
      "kind": "bf16",
      "ranges": [
        [
          2163363680,
          2621440
        ]
      ],
      "method": "ans",
      "sha256": "8556487138975295619957d9ece22b042e4b8790810edac60c8e08eae4f59f4a",
      "tensor": "language_model.model.layers.9.mlp.gate.weight",
      "archive_bytes": 1734118,
      "candidate_bytes": {
        "raw/zstd3": 2046461,
        "shuffle2/zstd19": 1759021,
        "ans": 1733964
      }
    },
    {
      "kind": "bf16",
      "ranges": [
        [
          2166138720,
          26214400
        ]
      ],
      "method": "ans",
      "sha256": "fdaba4b362aa0797c9095ca647409859663790ee093684daa555c7f10e705433",
      "tensor": "language_model.model.layers.8.mlp.switch_mlp.down_proj.biases",
      "archive_bytes": 13235810,
      "candidate_bytes": {
        "raw/zstd3": 17601777,
        "shuffle2/zstd19": 15192146,
        "ans": 13235655
      }
    }
  ],
  "encode_seconds_diagnostic": 120.48377087479457,
  "original_bytes": 2192353120,
  "archive_bytes": 1841504097,
  "archive_sha256": "d6de1ec7b27c79ff7030301e5bfbd41267e3013ae7d99752c1d85fbc7b9b1836",
  "savings_percent": 16.003308034610775,
  "unpack": {
    "started": {
      "utc": "2026-09-06T01:06:46.238573+00:00",
      "vm_stat": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    52549.\nPages active:                                 914184.\nPages inactive:                               758227.\nPages speculative:                            241328.\nPages throttled:                                   0.\nPages wired down:                             523152.\nPages purgeable:                                1349.\n\"Translation faults\":                    14254481967.\nPages copy-on-write:                       656381028.\nPages zero filled:                       17641092124.\nPages reactivated:                        2905774151.\nPages purged:                               65319518.\nFile-backed pages:                           1313049.\nAnonymous pages:                              600690.\nPages stored in compressor:                  1673213.\nPages occupied by compressor:                 596177.\nDecompressions:                           1002016967.\nCompressions:                             1299165217.\nPageins:                                  6562833380.\nPageouts:                                   10807612.\nSwapins:                                    41724549.\nSwapouts:                                   69922789.\nPages tagged:                                 179717.\nPages tagged resident:                        129744.\nPages tagged compressed:                       49973.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6831.\nPages tag-storage free:                          281.\nPages tag-storage non-tag pageable:            90897.\nPages tag-storage non-tag wired:                 295.\nBytes of compressed tags:                    8144000.\nTagged compressions:                         9958257.\nTagged decompressions:                       9172388.\n",
      "load_average": [
        7.4638671875,
        3.9736328125,
        4.7890625
      ]
    },
    "finished": {
      "utc": "2026-09-06T01:07:07.224987+00:00",
      "vm_stat": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     6625.\nPages active:                                 986212.\nPages inactive:                               915591.\nPages speculative:                             71594.\nPages throttled:                                   0.\nPages wired down:                             514143.\nPages purgeable:                                3183.\n\"Translation faults\":                    14254726511.\nPages copy-on-write:                       656389485.\nPages zero filled:                       17641249339.\nPages reactivated:                        2905817186.\nPages purged:                               65321242.\nFile-backed pages:                           1322998.\nAnonymous pages:                              650399.\nPages stored in compressor:                  1661792.\nPages occupied by compressor:                 590895.\nDecompressions:                           1002024538.\nCompressions:                             1299165217.\nPageins:                                  6562845358.\nPageouts:                                   10807626.\nSwapins:                                    41724561.\nSwapouts:                                   69922789.\nPages tagged:                                 179666.\nPages tagged resident:                        129730.\nPages tagged compressed:                       49936.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6831.\nPages tag-storage free:                          394.\nPages tag-storage non-tag pageable:            90964.\nPages tag-storage non-tag wired:                 115.\nBytes of compressed tags:                    8134848.\nTagged compressions:                         9958257.\nTagged decompressions:                       9172424.\n",
      "load_average": [
        6.49169921875,
        4.0234375,
        4.7822265625
      ]
    },
    "decode_write_fsync_and_final_hash_seconds_diagnostic": 20.987791624851525,
    "frames": 71,
    "original_bytes": 2192353120,
    "coverage_exact": true,
    "reconstructed_sha256": "9128a9cbf81cd25bc4cbebe8adeefa12fa36ee96fcccb6f5fe378343b45131f0",
    "pinned_sha256_matches": true
  },
  "finished": {
    "utc": "2026-09-06T01:07:07.232281+00:00",
    "vm_stat": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     6759.\nPages active:                                 990667.\nPages inactive:                               915551.\nPages speculative:                             71594.\nPages throttled:                                   0.\nPages wired down:                             509714.\nPages purgeable:                                3183.\n\"Translation faults\":                    14254727028.\nPages copy-on-write:                       656389620.\nPages zero filled:                       17641249388.\nPages reactivated:                        2905817186.\nPages purged:                               65321242.\nFile-backed pages:                           1322998.\nAnonymous pages:                              654814.\nPages stored in compressor:                  1661792.\nPages occupied by compressor:                 590895.\nDecompressions:                           1002024538.\nCompressions:                             1299165217.\nPageins:                                  6562845359.\nPageouts:                                   10807626.\nSwapins:                                    41724561.\nSwapouts:                                   69922789.\nPages tagged:                                 179666.\nPages tagged resident:                        129730.\nPages tagged compressed:                       49936.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6831.\nPages tag-storage free:                          389.\nPages tag-storage non-tag pageable:            91076.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8134848.\nTagged compressions:                         9958257.\nTagged decompressions:                       9172424.\n",
    "load_average": [
      6.49169921875,
      4.0234375,
      4.7822265625
    ]
  }
}
```


## Raw output: inventory-rebuild.json

```text
{"tensors": 3283, "matches_original_inventory": true, "sha256": "464f0628829202e57b36653c621fa0215d0a1b83976896d3c613e1c143c5fbdd", "original_sha256": "464f0628829202e57b36653c621fa0215d0a1b83976896d3c613e1c143c5fbdd"}

```


## Source: probe.py
SHA-256: `61ec0aebb2fd8b08034f92f83e2cfc7a90ee0d9f6ac9248f780cf760a09fb4c9`

```python
"""Bounded, byte-exact lossless transport experiments on the pinned checkpoint.

No MLX import, GPU allocation, model mutation, or network/model inference.
Artifacts are a probe format, not a production download/archive contract.
"""
import argparse
import collections
import datetime
import hashlib
import json
import lzma
import bz2
import math
import os
from pathlib import Path
import struct
import subprocess
import sys
import time

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent / 'download-audit/python'))
import numpy as np
import zstandard as zstd
import brotli
import blosc2
import pyppmd
import constriction

ROOT = Path.home() / '.slotstream/models/qwen38-flash-next-mlx-4bit'
INVENTORY = json.loads((HERE.parent / 'download-audit/tensors.json').read_text())
TS = INVENTORY['tensors']
BY_NAME = {t['name']: t for t in TS}
MiB = 1 << 20


def utc():
    return datetime.datetime.now(datetime.timezone.utc).isoformat()


def host_state():
    return {'utc': utc(), 'vm_stat': subprocess.check_output(['vm_stat'], text=True),
            'load_average': os.getloadavg()}


def read(t, offset, size):
    assert 0 <= offset <= t['size'] and size <= t['size'] - offset
    with (ROOT / t['file']).open('rb') as f:
        f.seek(t['offset'] + offset)
        out = f.read(size)
    assert len(out) == size
    return out


def companion(t, suffix):
    return BY_NAME[t['name'].rsplit('.', 1)[0] + '.' + suffix]


def group_size(t):
    return t['size'] * 4 // companion(t, 'scales')['size']


def side_data(t, offset, size):
    gs = group_size(t)
    assert offset % (gs // 2) == size % (gs // 2) == 0
    return (read(companion(t, 'scales'), offset * 4 // gs, size * 4 // gs),
            read(companion(t, 'biases'), offset * 4 // gs, size * 4 // gs))


def packet(parts):
    return struct.pack('<I', len(parts)) + b''.join(struct.pack('<Q', len(p)) for p in parts) + b''.join(parts)


def unpacket(data):
    n, = struct.unpack_from('<I', data)
    lengths = struct.unpack_from('<' + 'Q' * n, data, 4)
    at = 4 + 8 * n
    out = []
    for count in lengths:
        out.append(data[at:at + count])
        at += count
    assert at == len(data)
    return out


def codec_encode(src, method):
    if method.startswith('zstd'):
        return zstd.ZstdCompressor(level=int(method[4:]), threads=0, write_checksum=True).compress(src)
    if method == 'xz9e':
        return lzma.compress(src, format=lzma.FORMAT_XZ, preset=9 | lzma.PRESET_EXTREME)
    if method.startswith('brotli'):
        return brotli.compress(src, quality=int(method[6:]), mode=brotli.MODE_GENERIC, lgwin=24)
    if method == 'bzip2':
        return bz2.compress(src, compresslevel=9)
    if method == 'ppmd':
        return pyppmd.compress(src, max_order=12, mem_size=64 * MiB)
    if method.startswith('blosc'):
        size, filt, level, block = map(int, method[5:].split('_'))
        return blosc2.compress2(src, codec=blosc2.Codec.ZSTD, clevel=level,
                               typesize=size, nthreads=1, blocksize=block,
                               filters=[blosc2.Filter.NOFILTER] * 5 + [blosc2.Filter(filt)],
                               splitmode=blosc2.SplitMode.NEVER_SPLIT)
    raise ValueError(method)


def codec_decode(src, method):
    if method.startswith('zstd'):
        return zstd.ZstdDecompressor().decompress(src)
    if method == 'xz9e':
        return lzma.decompress(src)
    if method.startswith('brotli'):
        return brotli.decompress(src)
    if method == 'bzip2':
        return bz2.decompress(src)
    if method == 'ppmd':
        return pyppmd.decompress(src, max_order=12, mem_size=64 * MiB)
    if method.startswith('blosc'):
        return blosc2.decompress2(src, nthreads=1)
    raise ValueError(method)


def shuffle(src, size):
    return np.frombuffer(src, np.uint8).reshape(-1, size).T.copy().tobytes()


def unshuffle(src, size):
    return np.frombuffer(src, np.uint8).reshape(size, -1).T.copy().tobytes()


def planes(a, bits):
    assert len(a) % 8 == 0
    return b''.join(np.packbits(((a >> bit) & 1).astype(np.uint8), bitorder='little').tobytes()
                    for bit in range(bits))


def unplanes(src, bits, dtype):
    b = np.frombuffer(src, np.uint8).reshape(bits, -1)
    out = np.zeros(b.shape[1] * 8, dtype=dtype)
    for bit in range(bits):
        out |= np.unpackbits(b[bit], bitorder='little').astype(dtype) << bit
    return out


def nibbles(src):
    a = np.frombuffer(src, np.uint8)
    out = np.empty(2 * len(a), np.uint8)
    out[::2] = a & 15
    out[1::2] = a >> 4
    return out


def pack_nibbles(a):
    return (a[::2] | (a[1::2] << 4)).astype(np.uint8).tobytes()


def bf32(src):
    return (np.frombuffer(src, '<u2').astype(np.uint32) << 16).view(np.float32)


def centers(scales, biases):
    with np.errstate(divide='ignore', invalid='ignore', over='ignore'):
        c = np.nan_to_num(np.rint(-bf32(biases) / bf32(scales)), nan=0, posinf=0, neginf=0)
    return c.clip(0, 255).astype(np.uint8)


def predict_bias(scales, c):
    p = (-bf32(scales) * c.astype(np.float32)).view(np.uint32)
    return ((p + np.uint32(0x7fff) + ((p >> 16) & 1)) >> 16).astype(np.uint16)


def pair_parts(scales, biases):
    c = centers(scales, biases)
    delta = (np.frombuffer(biases, '<u2') - predict_bias(scales, c)).view(np.int16).astype(np.int32)
    residual = ((delta << 1) ^ (delta >> 15)).astype(np.uint16)
    return [scales, c.tobytes(), residual.tobytes()]


def pair_restore(parts):
    scales, c, residual = parts
    c = np.frombuffer(c, np.uint8)
    z = np.frombuffer(residual, '<u2').astype(np.int32)
    delta = (z >> 1) ^ -(z & 1)
    biases = (predict_bias(scales, c).astype(np.int32) + delta).astype(np.uint16).tobytes()
    return scales, biases


def entropy(a, alphabet):
    h = np.bincount(a.astype(np.int32), minlength=alphabet)
    p = h[h > 0] / len(a)
    return float(-(p * np.log2(p)).sum())


def ans_encode(a, alphabet):
    # Store every model count and framing byte; no omitted probability tables.
    h = np.bincount(a.astype(np.int32), minlength=alphabet).astype('<u4')
    model = constriction.stream.model.Categorical(h.astype(np.float64), perfect=False)
    ans = constriction.stream.stack.AnsCoder()
    ans.encode_reverse(a.astype(np.int32), model)
    return packet([struct.pack('<Q', len(a)), codec_encode(h.tobytes(), 'zstd3'), ans.get_compressed().astype('<u4').tobytes()])


def ans_decode(src):
    n, counts, compressed = unpacket(src)
    n, = struct.unpack('<Q', n)
    h = np.frombuffer(codec_decode(counts, 'zstd3'), '<u4')
    model = constriction.stream.model.Categorical(h.astype(np.float64), perfect=False)
    ans = constriction.stream.stack.AnsCoder(np.frombuffer(compressed, '<u4').copy())
    out = ans.decode(model, n)
    assert ans.is_empty()
    return out


def weight_transform(src, mode, gs, c):
    if mode == 'raw': return src
    if mode == 'shuffle4': return shuffle(src, 4)
    if mode == 'planes32': return planes(np.frombuffer(src, '<u4'), 32)
    q = nibbles(src)
    if mode.startswith('center'):
        q = ((q.reshape(-1, gs).astype(np.int16) - c[:, None]) & 15).astype(np.uint8).reshape(-1)
    if 'fold' in mode:
        # A bijective re-labeling of the 16 symbols, no rounding or re-quantization.
        s = ((q.astype(np.int16) + (8 if mode.startswith('center') else 0)) & 15) - 8
        q = ((s << 1) ^ (s >> 15)).astype(np.uint8)
    if mode.endswith('bytes'): return q.tobytes()
    if mode.endswith('packed'): return pack_nibbles(q)
    if mode.endswith('planes'): return planes(q, 4)
    raise ValueError(mode)


def weight_restore(src, mode, gs, c):
    if mode == 'raw': return src
    if mode == 'shuffle4': return unshuffle(src, 4)
    if mode == 'planes32': return unplanes(src, 32, np.uint32).tobytes()
    if mode.endswith('bytes'): q = np.frombuffer(src, np.uint8)
    elif mode.endswith('packed'): q = nibbles(src)
    elif mode.endswith('planes'): q = unplanes(src, 4, np.uint8)
    else: raise ValueError(mode)
    if 'fold' in mode:
        z = q.astype(np.int16)
        q = (((z >> 1) ^ -(z & 1)) + (0 if mode.startswith('center') else 8)) & 15
        q = q.astype(np.uint8)
    if mode.startswith('center'):
        q = ((q.reshape(-1, gs).astype(np.uint16) + c[:, None]) & 15).astype(np.uint8).reshape(-1)
    return pack_nibbles(q)


def bf_transform(src, mode, stride=1):
    if mode == 'raw': return src
    if mode == 'shuffle2': return shuffle(src, 2)
    a = np.frombuffer(src, '<u2')
    if mode.startswith('xor'):
        a = a.copy(); a[stride:] ^= a[:-stride].copy()
    if mode.startswith('delta'):
        a = a.copy(); a[stride:] -= a[:-stride].copy()
    if mode.endswith('planes'): return planes(a, 16)
    if mode.endswith('shuffle'): return shuffle(a.tobytes(), 2)
    raise ValueError(mode)


def bf_restore(src, mode, stride=1):
    if mode == 'raw': return src
    if mode == 'shuffle2': return unshuffle(src, 2)
    if mode.endswith('planes'): a = unplanes(src, 16, np.uint16)
    elif mode.endswith('shuffle'): a = np.frombuffer(unshuffle(src, 2), '<u2').copy()
    else: raise ValueError(mode)
    if mode.startswith('xor'):
        for col in range(stride): a[col::stride] = np.bitwise_xor.accumulate(a[col::stride])
    if mode.startswith('delta'):
        for col in range(stride): a[col::stride] = np.cumsum(a[col::stride], dtype=np.uint16)
    return a.tobytes()


def q_context_encode(q, c, gs, context_mode='center'):
    # Reversible group permutation from already decoded side information.
    # A center model per group; no per-weight float parameters or probability matrix.
    ctx = c if context_mode == 'center' else np.minimum(c, 15)
    m = q.reshape(-1, gs)
    parts = []
    for v in np.unique(ctx):
        values = m[ctx == v].reshape(-1)
        parts.append(packet([bytes([v]), ans_encode(values, 16)]))
    return packet(parts)


def q_context_decode(src, c, gs):
    out = np.empty((len(c), gs), np.uint8)
    for p in unpacket(src):
        v, enc = unpacket(p)
        values = ans_decode(enc).astype(np.uint8)
        out[c == v[0]] = values.reshape(-1, gs)
    return out.reshape(-1)


def measure(method, original, enc, dec):
    start = time.perf_counter()
    compressed = enc()
    et = time.perf_counter() - start
    start = time.perf_counter()
    restored = dec(compressed)
    dt = time.perf_counter() - start
    assert restored == original, method
    return {'method': method, 'original_bytes': len(original), 'compressed_bytes': len(compressed),
            'fraction': len(compressed) / len(original), 'encode_seconds_diagnostic': et,
            'decode_seconds_diagnostic': dt, 'roundtrip_exact': True}


def screen(args):
    result = {'stage': 'screen', 'started': host_state(), 'source_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
              'sample_policy': 'Four component strata; largest eligible weight selected per stratum; offset 37%; companion scales/biases exact matching group; remaining BF16 largest other weight.',
              'size_per_weight': args.mib * MiB, 'samples': []}
    # pyppmd variant I failed its byte-exact decode on the first shuffled BF16
    # pair. Preserve that attempt and exclude the codec from the resumed screen.
    codecs = ['zstd3', 'zstd9', 'zstd19', 'zstd22', 'xz9e', 'brotli11', 'bzip2']
    for group in ['experts', 'ngram', 'other', 'mtp']:
        candidates = sorted((t for t in TS if t['group'] == group and t['dtype'] == 'U32'), key=lambda t: (-t['size'], t['name']))
        t = candidates[0]; gs = group_size(t)
        size = min(args.mib * MiB, t['size']); size = size // 256 * 256
        offset = int((t['size'] - size) * .37) // 256 * 256
        src = read(t, offset, size); scales, biases = side_data(t, offset, size); c = centers(scales, biases)
        item = {'group': group, 'kind': 'weights', 'tensor': t, 'offset': offset, 'size': size,
                'sha256': hashlib.sha256(src).hexdigest(), 'group_size': gs, 'results': []}
        q = nibbles(src)
        item['nibble_entropy_bits'] = entropy(q, 16)
        item['conditional_center_entropy_bits'] = sum(np.sum(c == v) / len(c) * entropy(q.reshape(-1, gs)[c == v].reshape(-1), 16) for v in np.unique(c))
        for transform in ['raw', 'shuffle4', 'planes32', 'qbytes', 'qplanes', 'foldplanes', 'centerfoldplanes', 'centerpacked', 'centerbytes']:
            cms = codecs if transform in ['raw', 'qbytes', 'foldplanes', 'centerfoldplanes'] else ['zstd3', 'zstd19']
            for cm in cms:
                row = measure(transform + '/' + cm, src,
                    lambda tr=transform, co=cm: codec_encode(weight_transform(src, tr, gs, c), co),
                    lambda data, tr=transform, co=cm: weight_restore(codec_decode(data, co), tr, gs, c))
                item['results'].append(row)
                print(json.dumps({'group': group, 'kind': 'weight', **row}), flush=True)
        for mode in ['ans', 'context_ans']:
            row = measure(mode, src,
                lambda mo=mode: ans_encode(q, 16) if mo == 'ans' else q_context_encode(q, c, gs),
                lambda data, mo=mode: pack_nibbles(ans_decode(data).astype(np.uint8) if mo == 'ans' else q_context_decode(data, c, gs)))
            item['results'].append(row)
            print(json.dumps({'group': group, 'kind': 'weight', **row}), flush=True)
        for filt in [1, 2]:
            cm = f'blosc4_{filt}_9_262144'
            row = measure(cm, src, lambda co=cm: codec_encode(src, co), lambda data, co=cm: codec_decode(data, co))
            item['results'].append(row)
            print(json.dumps({'group': group, 'kind': 'weight', **row}), flush=True)
        result['samples'].append(item)
        (HERE / 'screen-partial.json').write_text(json.dumps(result, indent=2))
        # Use larger companion-only samples so BF16 codec comparisons have fair block sizes.
        st = companion(t, 'scales'); bt = companion(t, 'biases')
        ssize = min(args.mib * MiB, st['size']) // 256 * 256
        soff = int((st['size'] - ssize) * .37) // 256 * 256
        scales = read(st, soff, ssize); biases = read(bt, soff, ssize)
        original = scales + biases
        pair = {'group': group, 'kind': 'scale_bias_pair', 'tensor': st, 'bias_tensor': bt,
                'offset': soff, 'size_per_tensor': ssize, 'sha256': hashlib.sha256(original).hexdigest(), 'results': []}
        parts = pair_parts(scales, biases)
        res = np.frombuffer(parts[2], '<u2')
        pair['predictor_exact_fraction'] = float(np.mean(res == 0))
        pair['residual_histogram'] = collections.Counter(res.tolist()).most_common(20)
        for transform in ['raw', 'shuffle2', 'planes', 'xorshuffle', 'deltashuffle', 'xorplanes', 'deltaplanes']:
            for cm in (codecs if transform in ['raw', 'shuffle2', 'planes'] else ['zstd3', 'zstd19']):
                row = measure(transform + '/' + cm, original,
                    lambda tr=transform, co=cm: packet([codec_encode(bf_transform(p, tr), co) for p in [scales, biases]]),
                    lambda data, tr=transform, co=cm: b''.join(bf_restore(codec_decode(p, co), tr) for p in unpacket(data)))
                pair['results'].append(row)
                print(json.dumps({'group': group, 'kind': 'pair', **row}), flush=True)
        for transform in ['shuffle2', 'planes']:
            for cm in codecs:
                row = measure('pred_' + transform + '/' + cm, original,
                    lambda tr=transform, co=cm: packet([codec_encode(bf_transform(parts[0], tr), co), codec_encode(parts[1], co), codec_encode(bf_transform(parts[2], tr), co)]),
                    lambda data, tr=transform, co=cm: b''.join(pair_restore([bf_restore(codec_decode(p, co), tr) if i != 1 else codec_decode(p, co) for i, p in enumerate(unpacket(data))])))
                pair['results'].append(row)
                print(json.dumps({'group': group, 'kind': 'pair', **row}), flush=True)
        for predicted in [False, True]:
            ps = parts if predicted else [scales, biases]
            row = measure('pred_ans' if predicted else 'ans', original,
                lambda: packet([ans_encode(np.frombuffer(p, np.uint8 if predicted and i == 1 else '<u2'), 256 if predicted and i == 1 else 65536) for i, p in enumerate(ps)]),
                lambda data: b''.join(pair_restore([ans_decode(p).astype(np.uint8 if i == 1 else np.uint16).tobytes() for i, p in enumerate(unpacket(data))])) if predicted else b''.join(ans_decode(p).astype(np.uint16).tobytes() for p in unpacket(data)))
            pair['results'].append(row)
            print(json.dumps({'group': group, 'kind': 'pair', **row}), flush=True)
        result['samples'].append(pair)
        (HERE / 'screen-partial.json').write_text(json.dumps(result, indent=2))
    # Ordinary BF16 does not have an affine-quantization pair: screen it separately.
    t = max((t for t in TS if t['group'] == 'other' and t['dtype'] == 'BF16' and t['name'].endswith('.weight')), key=lambda t: t['size'])
    size = min(args.mib * MiB, t['size']) // 256 * 256
    offset = int((t['size'] - size) * .37) // 256 * 256
    src = read(t, offset, size)
    item = {'group': 'other', 'kind': 'bf16_unpaired', 'tensor': t, 'offset': offset, 'size': size, 'sha256': hashlib.sha256(src).hexdigest(), 'results': []}
    for tr in ['raw', 'shuffle2', 'planes', 'xorshuffle', 'deltashuffle', 'xorplanes', 'deltaplanes']:
        for cm in codecs if tr in ['raw', 'shuffle2', 'planes'] else ['zstd3', 'zstd19']:
            row = measure(tr + '/' + cm, src, lambda: codec_encode(bf_transform(src, tr), cm), lambda data: bf_restore(codec_decode(data, cm), tr))
            item['results'].append(row)
            print(json.dumps({'group': 'other', 'kind': 'bf16_unpaired', **row}), flush=True)
    result['samples'].append(item)
    result['finished'] = host_state()
    (HERE / 'screen.json').write_text(json.dumps(result, indent=2))


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('stage', choices=['screen'])
    parser.add_argument('--mib', type=int, default=1)
    args = parser.parse_args()
    os.nice(10)
    screen(args)

```


## Source: qualify.py
SHA-256: `65f06f0d068c2efb5744bfe366c48328d86dd99ef1dccd8c0bae29788c9c04f7`

```python
"""Broader samples, exact size accounting, and self-contained decode qualification."""
import argparse
import collections
import hashlib
import json
import math
import os
from pathlib import Path
import random
import statistics
import struct
import sys
import time

import probe as p
from probe import np, MiB, HERE


def context(scales, biases, mode):
    c = p.centers(scales, biases).astype(np.uint32)
    if mode == 'scale':
        c = c * 4096 + ((np.frombuffer(scales, '<u2') & 32767).astype(np.uint32) >> 5)
    return c


def context_encode(src, scales, biases, gs, symbols='byte', conditioning='center'):
    ctx = context(scales, biases, conditioning)
    m = (np.frombuffer(src, np.uint8).reshape(-1, gs // 2) if symbols == 'byte'
         else p.nibbles(src).reshape(-1, gs))
    parts = []
    for v in np.unique(ctx):
        a = m[ctx == v].reshape(-1)
        parts.append(p.packet([struct.pack('<I', int(v)), p.ans_encode(a, 256 if symbols == 'byte' else 16)]))
    return p.packet(parts)


def context_decode(src, scales, biases, gs, symbols='byte', conditioning='center'):
    ctx = context(scales, biases, conditioning)
    m = np.empty((len(ctx), gs // 2 if symbols == 'byte' else gs), np.uint8)
    for entry in p.unpacket(src):
        value, encoded = p.unpacket(entry)
        v, = struct.unpack('<I', value)
        a = p.ans_decode(encoded).astype(np.uint8)
        m[ctx == v] = a.reshape(-1, m.shape[1])
    return m.tobytes() if symbols == 'byte' else p.pack_nibbles(m.reshape(-1))


def weight_encode(src, scales, biases, gs, method):
    if method.startswith('context_'):
        _, symbols, conditioning = method.split('_')
        return context_encode(src, scales, biases, gs, symbols, conditioning)
    transform, codec = method.split('/')
    return p.codec_encode(p.weight_transform(src, transform, gs, p.centers(scales, biases)), codec)


def weight_decode(src, scales, biases, gs, method):
    if method.startswith('context_'):
        _, symbols, conditioning = method.split('_')
        return context_decode(src, scales, biases, gs, symbols, conditioning)
    transform, codec = method.split('/')
    return p.weight_restore(p.codec_decode(src, codec), transform, gs, p.centers(scales, biases))


def pair_encode(scales, biases, method):
    if method == 'pred_ans':
        parts = p.pair_parts(scales, biases)
        return p.packet([p.ans_encode(np.frombuffer(a, np.uint8 if i == 1 else '<u2'), 256 if i == 1 else 65536) for i, a in enumerate(parts)])
    predicted = method.startswith('pred_')
    tr, codec = method.removeprefix('pred_').split('/')
    parts = p.pair_parts(scales, biases) if predicted else [scales, biases]
    return p.packet([p.codec_encode(a if predicted and i == 1 else p.bf_transform(a, tr), codec) for i, a in enumerate(parts)])


def pair_decode(src, method):
    if method == 'pred_ans':
        parts = [p.ans_decode(a).astype(np.uint8 if i == 1 else np.uint16).tobytes() for i, a in enumerate(p.unpacket(src))]
        return p.pair_restore(parts)
    predicted = method.startswith('pred_')
    tr, codec = method.removeprefix('pred_').split('/')
    parts = [p.codec_decode(a, codec) if predicted and i == 1 else p.bf_restore(p.codec_decode(a, codec), tr) for i, a in enumerate(p.unpacket(src))]
    return p.pair_restore(parts) if predicted else tuple(parts)


def ordinary_encode(src, method):
    if method == 'ans':
        return p.ans_encode(np.frombuffer(src, '<u2'), 65536)
    tr, codec = method.split('/')
    return p.codec_encode(p.bf_transform(src, tr), codec)


def ordinary_decode(src, method):
    if method == 'ans': return p.ans_decode(src).astype(np.uint16).tobytes()
    tr, codec = method.split('/')
    return p.bf_restore(p.codec_decode(src, codec), tr)


WEIGHT_METHODS = ['raw/zstd3', 'raw/zstd19', 'centerpacked/zstd3',
                  'context_nibble_center', 'context_byte_center', 'context_nibble_scale', 'context_byte_scale']
PAIR_METHODS = ['raw/zstd3', 'shuffle2/zstd19', 'pred_shuffle2/zstd3',
                'pred_shuffle2/zstd9', 'pred_shuffle2/zstd19', 'pred_ans']
BF_METHODS = ['raw/zstd3', 'shuffle2/zstd19', 'planes/zstd19', 'ans']


def strata():
    out = collections.defaultdict(list)
    for t in p.TS:
        if t['size'] < 256: continue
        if t['dtype'] == 'U32': kind = 'weights'
        elif t['dtype'] == 'BF16' and t['name'].endswith('.scales'): kind = 'pairs'
        elif t['dtype'] == 'BF16' and not t['name'].endswith('.biases'): kind = 'bf16'
        else: continue
        out[t['group'], kind].append(t)
    return out


def choices_for(key):
    return WEIGHT_METHODS if key[1] == 'weights' else PAIR_METHODS if key[1] == 'pairs' else BF_METHODS


def sample_plan():
    rng = random.Random(0x534C4F54)
    plan = []
    for key, ts in sorted(strata().items()):
        pop = sum(t['size'] * (2 if key[1] == 'pairs' else 1) for t in ts)
        count = 16 if key[0] in ['experts', 'ngram'] else 8 if key[0] == 'other' else 6
        # Stratified PPS: equal cumulative-byte intervals with a random offset
        # in each interval; every tensor is eligible, including small tensors.
        order = sorted(ts, key=lambda t: (t['file'], t['name']))
        raw_total = sum(t['size'] for t in order)
        cumul = np.cumsum([t['size'] for t in order])
        for i in range(count):
            point = (i + rng.random()) * raw_total / count
            t = order[int(np.searchsorted(cumul, point, side='right'))]
            size = min(t['size'], (4 if key[1] == 'pairs' else 8) * MiB) // 256 * 256
            off = rng.randrange((t['size'] - size) // 256 + 1) * 256
            # No overlap with 1 MiB screen on its selected tensor(s).
            while abs(off - int((t['size'] - MiB) * .37) // 256 * 256) < size + MiB and t['size'] > 4 * size:
                off = rng.randrange((t['size'] - size) // 256 + 1) * 256
            plan.append({'stratum': list(key), 'population_bytes': pop, 'sample_index': i,
                         'tensor': t, 'offset': off, 'size_per_tensor': size})
    return plan


def holdout():
    plan = sample_plan()
    (HERE / 'holdout-plan.json').write_text(json.dumps(plan, indent=2))
    out = {'stage': 'holdout', 'started': p.host_state(), 'seed': '0x534c4f54',
           'policy': 'Stratified systematic PPS by tensor bytes with a random point in each cumulative-byte interval; random aligned window in chosen tensor; 16 samples per expert/ngram stratum, 8 other, 6 MTP; side information and probability tables accounted; 8 MiB maximum original sample.',
           'source_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest(), 'samples': []}
    for sample in plan:
        group, kind = sample['stratum']; t = sample['tensor']; size = sample['size_per_tensor']; off = sample['offset']
        src = p.read(t, off, size)
        if kind == 'weights':
            scales, biases = p.side_data(t, off, size); gs = p.group_size(t)
            enc = lambda method: weight_encode(src, scales, biases, gs, method)
            dec = lambda data, method: weight_decode(data, scales, biases, gs, method)
        elif kind == 'pairs':
            scales = src; biases = p.read(p.companion(t, 'biases'), off, size); src = scales + biases
            enc = lambda method: pair_encode(scales, biases, method)
            dec = lambda data, method: b''.join(pair_decode(data, method))
        else:
            enc = lambda method: ordinary_encode(src, method)
            dec = lambda data, method: ordinary_decode(data, method)
        sample['sha256'] = hashlib.sha256(src).hexdigest()
        sample['original_bytes'] = len(src)
        sample['results'] = []
        for method in choices_for((group, kind)):
            row = p.measure(method, src, lambda: enc(method), lambda data: dec(data, method))
            # One method selector plus eight bytes for original size. Production
            # manifest/HTTP overhead must still be measured in a full downloader.
            row['compressed_bytes'] += 9
            row['fraction'] = row['compressed_bytes'] / len(src)
            sample['results'].append(row)
        out['samples'].append(sample)
        print(json.dumps({'stratum': sample['stratum'], 'index': sample['sample_index'], 'size': len(src), 'file': t['file'],
                          'methods': {r['method']: round(r['fraction'], 7) for r in sample['results']}}), flush=True)
        (HERE / 'holdout-partial.json').write_text(json.dumps(out, indent=2))
    out['finished'] = p.host_state()
    out['summary'] = summarize(out)
    (HERE / 'holdout.json').write_text(json.dumps(out, indent=2))
    print(json.dumps(out['summary'], indent=2), flush=True)


def summarize(out):
    grouped = collections.defaultdict(list)
    for s in out['samples']: grouped[tuple(s['stratum'])].append(s)
    strata_rows = []
    predicted = collections.Counter()
    total = 105264463248
    covered = 0
    for key, samples in grouped.items():
        pop = samples[0]['population_bytes']; covered += pop
        methods = {m: statistics.mean(next(r['fraction'] for r in s['results'] if r['method'] == m) for s in samples) for m in choices_for(key)}
        best_method = min(methods, key=methods.get)
        fast_methods = [m for m in methods if m.endswith('/zstd3') or m == 'pred_shuffle2/zstd9']
        # Adaptive offline choice is implementable; every choice counts a selector.
        best = statistics.mean(min(r['fraction'] for r in s['results']) for s in samples)
        fast = statistics.mean(min(r['fraction'] for r in s['results'] if r['method'] in fast_methods) for s in samples)
        plain = methods['raw/zstd3']
        predicted['plain_zstd3'] += pop * plain
        predicted['fast_adaptive'] += pop * fast
        predicted['strong_adaptive'] += pop * best
        strata_rows.append({'stratum': key, 'population_bytes': pop, 'samples': len(samples), 'sample_bytes': sum(s['original_bytes'] for s in samples),
                            'mean_fraction_by_method': methods, 'best_fixed_method': best_method,
                            'fast_adaptive_fraction': fast, 'strong_adaptive_fraction': best,
                            'strong_sample_minmax': [min(min(r['fraction'] for r in s['results']) for s in samples), max(min(r['fraction'] for r in s['results']) for s in samples)]})
    return {'strata': strata_rows, 'total_model_bytes': total, 'population_accounted_bytes': covered,
            'unmodeled_bytes_kept_raw': total - covered,
            'unique_windows_sampled_bytes': sum(s['original_bytes'] for s in out['samples']),
            'estimated_total_download_bytes': {k: v + total - covered for k, v in predicted.items()},
            'estimated_total_savings_percent': {k: 100 * (1 - (v + total - covered) / total) for k, v in predicted.items()}}


if __name__ == '__main__':
    parser = argparse.ArgumentParser(); parser.add_argument('stage', choices=['holdout'])
    args = parser.parse_args(); os.nice(10); holdout()

```


## Source: full_file_v1.py
SHA-256: `50671838cf2c4518ee105e1546f79a502ca42d57bd7aaa31d761783affafb2d9`

```python
"""Build and independently unpack one complete pinned safetensors shard.

Archive frames carry original offsets, codec selections, lengths and SHA-256.
The unpacker obtains model bytes only from the archive, never original tensors.
This is a bounded trusted-input probe, not a hardened production archive parser.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import struct
import time
import qualify as q
import probe as p

MAGIC = b'SLOTCMP1'


def sha_file(path):
    h = hashlib.sha256()
    with path.open('rb') as f:
        while b := f.read(16 * p.MiB): h.update(b)
    return h.hexdigest()


def write_record(f, meta, payload):
    j = json.dumps(meta, separators=(',', ':')).encode()
    f.write(struct.pack('<QQ', len(j), len(payload))); f.write(j); f.write(payload)
    return 16 + len(j) + len(payload)


def read_record(f):
    header = f.read(16)
    if not header: return None
    a, b = struct.unpack('<QQ', header)
    return json.loads(f.read(a)), f.read(b)


def choose(methods, encode):
    best = None
    counts = {}
    for method in methods:
        data = encode(method); counts[method] = len(data)
        if best is None or len(data) < len(best[1]): best = (method, data)
    return *best, counts


def unpack(archive, destination):
    coverage = []; frames = 0; original_bytes = 0
    started = p.host_state(); timer = time.perf_counter()
    with archive.open('rb') as f, destination.open('w+b') as dst:
        assert f.read(8) == MAGIC
        header, empty = read_record(f)
        assert empty == b''
        dst.truncate(header['original_size'])
        while record := read_record(f):
            meta, payload = record
            if meta['kind'] == 'quant':
                pairs, weights = p.unpacket(payload)
                scales, biases = q.pair_decode(pairs, meta['pair_method'])
                weights = q.weight_decode(weights, scales, biases, meta['group_size'], meta['weight_method'])
                pieces = [weights, scales, biases]
            elif meta['kind'] == 'bf16':
                pieces = [q.ordinary_decode(payload, meta['method'])]
            else:
                pieces = [p.codec_decode(payload, meta['method'])]
            assert hashlib.sha256(b''.join(pieces)).hexdigest() == meta['sha256']
            assert len(pieces) == len(meta['ranges'])
            for piece, (offset, size) in zip(pieces, meta['ranges']):
                assert len(piece) == size
                dst.seek(offset); assert dst.write(piece) == size
                coverage.append((offset, offset + size)); original_bytes += size
            frames += 1
        dst.flush(); os.fsync(dst.fileno())
    at = 0
    for begin, end in sorted(coverage):
        assert at == begin, (at, begin, end)
        at = end
    assert at == original_bytes == header['original_size']
    actual_sha = sha_file(destination)
    assert actual_sha == header['original_sha256']
    return {'started': started, 'finished': p.host_state(), 'decode_write_fsync_and_final_hash_seconds_diagnostic': time.perf_counter() - timer,
            'frames': frames, 'original_bytes': original_bytes, 'coverage_exact': True,
            'reconstructed_sha256': actual_sha, 'pinned_sha256_matches': True}


def build(filename, block_mib):
    out = {'stage': 'complete_shard', 'started': p.host_state(), 'filename': filename, 'block_mib': block_mib,
           'source_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest(), 'frames': []}
    source = p.ROOT / filename
    archive = p.HERE / (filename + '.slotcmp')
    restored = p.HERE / (filename + '.restored')
    original_sha = sha_file(source)
    if filename == 'model-00011.safetensors':
        assert original_sha == '9128a9cbf81cd25bc4cbebe8adeefa12fa36ee96fcccb6f5fe378343b45131f0'
    tensors = [t for t in p.TS if t['file'] == filename]
    consumed = set()
    timer = time.perf_counter()
    with archive.open('wb') as f:
        f.write(MAGIC)
        write_record(f, {'filename': filename, 'original_size': source.stat().st_size, 'original_sha256': original_sha,
                         'version': 1, 'byte_order': 'little', 'notes': 'Lossless prototype, codec versions in run evidence.'}, b'')
        first = min(t['offset'] for t in tensors)
        with source.open('rb') as source_stream: header = source_stream.read(first)
        meta = {'kind': 'raw', 'ranges': [[0, first]], 'method': 'zstd3', 'sha256': hashlib.sha256(header).hexdigest()}
        out['frames'].append({**meta, 'archive_bytes': write_record(f, meta, p.codec_encode(header, 'zstd3'))})
        for t in sorted((t for t in tensors if t['dtype'] == 'U32'), key=lambda t: t['offset']):
            st = p.companion(t, 'scales'); bt = p.companion(t, 'biases'); gs = p.group_size(t)
            assert st['file'] == bt['file'] == filename
            consumed.update([t['name'], st['name'], bt['name']])
            for off in range(0, t['size'], block_mib * p.MiB):
                size = min(block_mib * p.MiB, t['size'] - off)
                weights = p.read(t, off, size); scales, biases = p.side_data(t, off, size)
                wm, wc, wr = choose(['raw/zstd3', 'context_nibble_center', 'context_nibble_scale'],
                                    lambda m: q.weight_encode(weights, scales, biases, gs, m))
                pm, pc, pr = choose(['raw/zstd3', 'pred_shuffle2/zstd19', 'pred_ans'], lambda m: q.pair_encode(scales, biases, m))
                ranges = [[t['offset'] + off, size], [st['offset'] + off * 4 // gs, len(scales)], [bt['offset'] + off * 4 // gs, len(biases)]]
                meta = {'kind': 'quant', 'ranges': ranges, 'weight_method': wm, 'pair_method': pm, 'group_size': gs,
                        'sha256': hashlib.sha256(weights + scales + biases).hexdigest()}
                size_on_disk = write_record(f, meta, p.packet([pc, wc]))
                out['frames'].append({**meta, 'tensor': t['name'], 'archive_bytes': size_on_disk,
                                      'weight_candidate_bytes': wr, 'pair_candidate_bytes': pr})
                print(json.dumps({'tensor': t['name'], 'offset': off, 'source_bytes': size + len(scales) + len(biases),
                                  'archive_bytes': size_on_disk, 'weight_method': wm, 'pair_method': pm}), flush=True)
        for t in sorted(tensors, key=lambda t: t['offset']):
            if t['name'] in consumed: continue
            for off in range(0, t['size'], block_mib * p.MiB):
                size = min(block_mib * p.MiB, t['size'] - off); original = p.read(t, off, size)
                if t['dtype'] == 'BF16':
                    method, data, cr = choose(['raw/zstd3', 'shuffle2/zstd19', 'ans'], lambda m: q.ordinary_encode(original, m))
                    kind = 'bf16'
                else:
                    method = 'zstd3'; data = p.codec_encode(original, method); cr = {method: len(data)}; kind = 'raw'
                meta = {'kind': kind, 'ranges': [[t['offset'] + off, size]], 'method': method,
                        'sha256': hashlib.sha256(original).hexdigest()}
                out['frames'].append({**meta, 'tensor': t['name'], 'archive_bytes': write_record(f, meta, data), 'candidate_bytes': cr})
        f.flush(); os.fsync(f.fileno())
    out['encode_seconds_diagnostic'] = time.perf_counter() - timer
    out['original_bytes'] = source.stat().st_size
    out['archive_bytes'] = archive.stat().st_size
    out['archive_sha256'] = sha_file(archive)
    out['savings_percent'] = 100 * (1 - out['archive_bytes'] / out['original_bytes'])
    out['unpack'] = unpack(archive, restored)
    out['finished'] = p.host_state()
    (p.HERE / 'full-file.json').write_text(json.dumps(out, indent=2))
    print(json.dumps({k: v for k, v in out.items() if k != 'frames'}, indent=2), flush=True)


if __name__ == '__main__':
    a = argparse.ArgumentParser(); a.add_argument('--file', default='model-00011.safetensors'); a.add_argument('--block-mib', type=int, default=32)
    args = a.parse_args(); os.nice(10); build(args.file, args.block_mib)

```


## Source: full_file.py
SHA-256: `ea5d830f311c7b74a7dd8051e8ef8ff17a37066268f02abd83b756e8220c6891`

```python
"""Build and independently unpack one complete pinned safetensors shard.

Archive frames carry original offsets, codec selections, lengths and SHA-256.
The unpacker obtains model bytes only from the archive, never original tensors.
This is a bounded trusted-input probe, not a hardened production archive parser.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import struct
import time
import qualify as q
import probe as p

MAGIC = b'SLOTCMP1'
ENTROPY_CODEC = 'constriction-ans-v1'


def sha_file(path):
    h = hashlib.sha256()
    with path.open('rb') as f:
        while b := f.read(16 * p.MiB): h.update(b)
    return h.hexdigest()


def write_record(f, meta, payload):
    j = json.dumps(meta, separators=(',', ':')).encode()
    f.write(struct.pack('<QQ', len(j), len(payload))); f.write(j); f.write(payload)
    return 16 + len(j) + len(payload)


def read_record(f):
    header = f.read(16)
    if not header: return None
    a, b = struct.unpack('<QQ', header)
    return json.loads(f.read(a)), f.read(b)


def choose(methods, encode):
    best = None
    counts = {}
    for method in methods:
        data = encode(method); counts[method] = len(data)
        if best is None or len(data) < len(best[1]): best = (method, data)
    return *best, counts


def unpack(archive, destination):
    coverage = []; frames = 0; original_bytes = 0
    started = p.host_state(); timer = time.perf_counter()
    with archive.open('rb') as f, destination.open('w+b') as dst:
        assert f.read(8) == MAGIC
        header, empty = read_record(f)
        assert empty == b''
        assert header.get('entropy_codec', 'constriction-ans-v1') == ENTROPY_CODEC
        dst.truncate(header['original_size'])
        while record := read_record(f):
            meta, payload = record
            if meta['kind'] == 'quant':
                pairs, weights = p.unpacket(payload)
                scales, biases = q.pair_decode(pairs, meta['pair_method'])
                weights = q.weight_decode(weights, scales, biases, meta['group_size'], meta['weight_method'])
                pieces = [weights, scales, biases]
            elif meta['kind'] == 'bf16':
                pieces = [q.ordinary_decode(payload, meta['method'])]
            else:
                pieces = [p.codec_decode(payload, meta['method'])]
            assert hashlib.sha256(b''.join(pieces)).hexdigest() == meta['sha256']
            assert len(pieces) == len(meta['ranges'])
            for piece, (offset, size) in zip(pieces, meta['ranges']):
                assert len(piece) == size
                dst.seek(offset); assert dst.write(piece) == size
                coverage.append((offset, offset + size)); original_bytes += size
            frames += 1
        dst.flush(); os.fsync(dst.fileno())
    at = 0
    for begin, end in sorted(coverage):
        assert at == begin, (at, begin, end)
        at = end
    assert at == original_bytes == header['original_size']
    actual_sha = sha_file(destination)
    assert actual_sha == header['original_sha256']
    return {'started': started, 'finished': p.host_state(), 'decode_write_fsync_and_final_hash_seconds_diagnostic': time.perf_counter() - timer,
            'frames': frames, 'original_bytes': original_bytes, 'coverage_exact': True,
            'reconstructed_sha256': actual_sha, 'pinned_sha256_matches': True}


def build(filename, block_mib):
    out = {'stage': 'complete_shard', 'started': p.host_state(), 'filename': filename, 'block_mib': block_mib, 'entropy_codec': ENTROPY_CODEC,
           'source_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest(), 'frames': []}
    source = p.ROOT / filename
    archive = p.HERE / (filename + '.slotcmp')
    restored = p.HERE / (filename + '.restored')
    original_sha = sha_file(source)
    if filename == 'model-00011.safetensors':
        assert original_sha == '9128a9cbf81cd25bc4cbebe8adeefa12fa36ee96fcccb6f5fe378343b45131f0'
    tensors = [t for t in p.TS if t['file'] == filename]
    consumed = set()
    timer = time.perf_counter()
    with archive.open('wb') as f:
        f.write(MAGIC)
        write_record(f, {'filename': filename, 'original_size': source.stat().st_size, 'original_sha256': original_sha,
                         'version': 1, 'byte_order': 'little', 'entropy_codec': ENTROPY_CODEC, 'notes': 'Lossless prototype, codec versions in run evidence.'}, b'')
        first = min(t['offset'] for t in tensors)
        with source.open('rb') as source_stream: header = source_stream.read(first)
        meta = {'kind': 'raw', 'ranges': [[0, first]], 'method': 'zstd3', 'sha256': hashlib.sha256(header).hexdigest()}
        out['frames'].append({**meta, 'archive_bytes': write_record(f, meta, p.codec_encode(header, 'zstd3'))})
        for t in sorted((t for t in tensors if t['dtype'] == 'U32'), key=lambda t: t['offset']):
            st = p.companion(t, 'scales'); bt = p.companion(t, 'biases'); gs = p.group_size(t)
            assert st['file'] == bt['file'] == filename
            consumed.update([t['name'], st['name'], bt['name']])
            for off in range(0, t['size'], block_mib * p.MiB):
                size = min(block_mib * p.MiB, t['size'] - off)
                weights = p.read(t, off, size); scales, biases = p.side_data(t, off, size)
                wm, wc, wr = choose(['raw/zstd3', 'context_nibble_center', 'context_nibble_scale'],
                                    lambda m: q.weight_encode(weights, scales, biases, gs, m))
                pm, pc, pr = choose(['raw/zstd3', 'pred_shuffle2/zstd19', 'pred_ans'], lambda m: q.pair_encode(scales, biases, m))
                ranges = [[t['offset'] + off, size], [st['offset'] + off * 4 // gs, len(scales)], [bt['offset'] + off * 4 // gs, len(biases)]]
                meta = {'kind': 'quant', 'ranges': ranges, 'weight_method': wm, 'pair_method': pm, 'group_size': gs,
                        'sha256': hashlib.sha256(weights + scales + biases).hexdigest()}
                size_on_disk = write_record(f, meta, p.packet([pc, wc]))
                out['frames'].append({**meta, 'tensor': t['name'], 'archive_bytes': size_on_disk,
                                      'weight_candidate_bytes': wr, 'pair_candidate_bytes': pr})
                print(json.dumps({'tensor': t['name'], 'offset': off, 'source_bytes': size + len(scales) + len(biases),
                                  'archive_bytes': size_on_disk, 'weight_method': wm, 'pair_method': pm}), flush=True)
        for t in sorted(tensors, key=lambda t: t['offset']):
            if t['name'] in consumed: continue
            for off in range(0, t['size'], block_mib * p.MiB):
                size = min(block_mib * p.MiB, t['size'] - off); original = p.read(t, off, size)
                if t['dtype'] == 'BF16':
                    method, data, cr = choose(['raw/zstd3', 'shuffle2/zstd19', 'ans'], lambda m: q.ordinary_encode(original, m))
                    kind = 'bf16'
                else:
                    method = 'zstd3'; data = p.codec_encode(original, method); cr = {method: len(data)}; kind = 'raw'
                meta = {'kind': kind, 'ranges': [[t['offset'] + off, size]], 'method': method,
                        'sha256': hashlib.sha256(original).hexdigest()}
                out['frames'].append({**meta, 'tensor': t['name'], 'archive_bytes': write_record(f, meta, data), 'candidate_bytes': cr})
        f.flush(); os.fsync(f.fileno())
    out['encode_seconds_diagnostic'] = time.perf_counter() - timer
    out['original_bytes'] = source.stat().st_size
    out['archive_bytes'] = archive.stat().st_size
    out['archive_sha256'] = sha_file(archive)
    out['savings_percent'] = 100 * (1 - out['archive_bytes'] / out['original_bytes'])
    out['unpack'] = unpack(archive, restored)
    out['finished'] = p.host_state()
    (p.HERE / 'full-file.json').write_text(json.dumps(out, indent=2))
    print(json.dumps({k: v for k, v in out.items() if k != 'frames'}, indent=2), flush=True)


if __name__ == '__main__':
    a = argparse.ArgumentParser(); a.add_argument('--file', default='model-00011.safetensors'); a.add_argument('--block-mib', type=int, default=32)
    args = a.parse_args(); os.nice(10); build(args.file, args.block_mib)

```


## Source: rans_probe.c
SHA-256: `1ce6e4f9afd5bf559402db7268fc26af16681a5dc3ac45b7abfa53fb7154335e`

```c
/* Four interleaved byte-renormalized rANS states, direct decode lookup.
 * Independent bounded probe implementation of standard rANS equations.
 * Algorithm reference: https://github.com/rygorous/ryg_rans (public domain).
 * Trusted-input experiment; not a production file-format/security review.
 */
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#define LOWER (1u << 23)

static uint32_t *cumulative(const uint32_t *f, uint32_t alphabet, uint32_t bits) {
    uint32_t *c = malloc((alphabet + 1) * sizeof(uint32_t));
    if (!c) return NULL;
    c[0] = 0;
    for (uint32_t i = 0; i < alphabet; ++i) c[i + 1] = c[i] + f[i];
    if (c[alphabet] != (1u << bits)) { free(c); return NULL; }
    return c;
}

int64_t encode_rans(const uint16_t *src, uint64_t n, const uint32_t *freq,
                    uint32_t alphabet, uint32_t bits, uint8_t *dst, uint64_t cap) {
    if (bits < 1 || bits > 16 || alphabet < 1 || alphabet > 65536 || cap < 16) return -1;
    uint32_t *cum = cumulative(freq, alphabet, bits);
    if (!cum) return -2;
    uint32_t states[4] = {LOWER, LOWER, LOWER, LOWER};
    uint8_t *ptr = dst + cap;
    for (uint64_t i = n; i-- > 0;) {
        uint32_t sym = src[i];
        if (sym >= alphabet || freq[sym] == 0) { free(cum); return -3; }
        uint32_t f = freq[sym], x = states[i & 3];
        uint32_t limit = ((LOWER >> bits) << 8) * f;
        while (x >= limit) {
            if (ptr <= dst + 16) { free(cum); return -4; }
            *--ptr = (uint8_t)x; x >>= 8;
        }
        states[i & 3] = ((x / f) << bits) + x % f + cum[sym];
    }
    ptr -= 16;
    for (int i = 0; i < 4; ++i) {
        uint32_t x = states[i];
        for (int j = 0; j < 4; ++j) ptr[i * 4 + j] = (uint8_t)(x >> (8 * j));
    }
    uint64_t length = (dst + cap) - ptr;
    memmove(dst, ptr, length);
    free(cum);
    return (int64_t)length;
}

int decode_rans(const uint8_t *src, uint64_t length, const uint32_t *freq,
                uint32_t alphabet, uint32_t bits, uint16_t *dst, uint64_t n) {
    if (length < 16 || bits < 1 || bits > 16 || alphabet < 1 || alphabet > 65536) return -1;
    uint32_t *cum = cumulative(freq, alphabet, bits);
    if (!cum) return -2;
    uint32_t total = 1u << bits, mask = total - 1;
    uint16_t *lut = malloc(total * sizeof(uint16_t));
    if (!lut) { free(cum); return -3; }
    for (uint32_t s = 0; s < alphabet; ++s)
        for (uint32_t j = cum[s]; j < cum[s + 1]; ++j) lut[j] = (uint16_t)s;
    uint32_t states[4];
    for (int i = 0; i < 4; ++i) {
        uint32_t x = 0;
        for (int j = 0; j < 4; ++j) x |= (uint32_t)src[i * 4 + j] << (8 * j);
        if (x < LOWER) { free(lut); free(cum); return -4; }
        states[i] = x;
    }
    const uint8_t *ptr = src + 16, *end = src + length;
    for (uint64_t i = 0; i < n; ++i) {
        uint32_t x = states[i & 3], slot = x & mask;
        uint16_t sym = lut[slot];
        dst[i] = sym;
        x = freq[sym] * (x >> bits) + slot - cum[sym];
        while (x < LOWER) {
            if (ptr == end) { free(lut); free(cum); return -5; }
            x = (x << 8) | *ptr++;
        }
        states[i & 3] = x;
    }
    int status = ptr == end ? 0 : -6;
    for (int i = 0; i < 4; ++i) if (states[i] != LOWER) status = -7;
    free(lut); free(cum); return status;
}

```


## Source: native_probe.py
SHA-256: `a9c07a0ce3c5b70e7fc6806203fa7462cb694e3c0455697afe8ae9b37533ea54`

```python
"""Native rANS alternative plus reverse quantization-metadata prediction."""
import ctypes as C
import hashlib
import json
import os
from pathlib import Path
import statistics
import struct
import time
import qualify as q
import probe as p
from probe import np

lib = C.CDLL(str(p.HERE / 'rans_probe.dylib'))
lib.encode_rans.argtypes = [C.c_void_p, C.c_uint64, C.c_void_p, C.c_uint32, C.c_uint32, C.c_void_p, C.c_uint64]
lib.encode_rans.restype = C.c_int64
lib.decode_rans.argtypes = [C.c_void_p, C.c_uint64, C.c_void_p, C.c_uint32, C.c_uint32, C.c_void_p, C.c_uint64]
lib.decode_rans.restype = C.c_int


def normalize(h, bits):
    total = 1 << bits
    scaled = h.astype(np.float64) * (total / int(h.sum()))
    f = np.maximum(np.floor(scaled).astype(np.int64), (h > 0).astype(np.int64))
    difference = total - int(f.sum())
    if difference > 0:
        order = np.argsort(-(scaled - f), kind='stable')
        f[order[:difference]] += 1
    elif difference < 0:
        order = np.argsort(scaled - f, kind='stable')
        for idx in order:
            take = min(-difference, int(f[idx] - (h[idx] > 0)))
            f[idx] -= take; difference += take
            if difference == 0: break
    assert f.sum() == total and np.all(f[h > 0] > 0)
    return f.astype('<u4')


def encode(a, alphabet):
    a = np.ascontiguousarray(a, dtype=np.uint16)
    bits = 12 if alphabet <= 256 else 16
    h = np.bincount(a, minlength=alphabet)
    f = normalize(h, bits)
    buf = np.empty(2 * len(a) + 1048576, np.uint8)
    n = lib.encode_rans(a.ctypes.data, len(a), f.ctypes.data, alphabet, bits, buf.ctypes.data, len(buf))
    assert n >= 16, n
    return p.packet([struct.pack('<QII', len(a), alphabet, bits), p.codec_encode(f.tobytes(), 'zstd3'), buf[:n].tobytes()])


def decode(data):
    header, table, payload = p.unpacket(data)
    n, alphabet, bits = struct.unpack('<QII', header)
    f = np.frombuffer(p.codec_decode(table, 'zstd3'), '<u4')
    assert len(f) == alphabet
    src = np.frombuffer(payload, np.uint8)
    out = np.empty(n, np.uint16)
    code = lib.decode_rans(src.ctypes.data, len(src), f.ctypes.data, alphabet, bits, out.ctypes.data, n)
    assert code == 0, code
    return out


def predict_scale(biases, c):
    with np.errstate(divide='ignore', invalid='ignore'):
        f = np.where(c > 0, -p.bf32(biases) / c.astype(np.float32), np.float32(0)).view(np.uint32)
    return ((f + np.uint32(0x7fff) + ((f >> 16) & 1)) >> 16).astype(np.uint16)


def reverse_parts(scales, biases):
    c = p.centers(scales, biases)
    delta = (np.frombuffer(scales, '<u2') - predict_scale(biases, c)).view(np.int16).astype(np.int32)
    residual = ((delta << 1) ^ (delta >> 15)).astype(np.uint16)
    return [biases, c.tobytes(), residual.tobytes()]


def reverse_restore(parts):
    biases, c, residual = parts
    c = np.frombuffer(c, np.uint8); z = np.frombuffer(residual, '<u2').astype(np.int32)
    delta = (z >> 1) ^ -(z & 1)
    scales = (predict_scale(biases, c).astype(np.int32) + delta).astype(np.uint16).tobytes()
    return scales, biases


def reverse_encode(scales, biases):
    parts = reverse_parts(scales, biases)
    return p.packet([encode(np.frombuffer(a, np.uint8 if i == 1 else '<u2'), 256 if i == 1 else 65536) for i, a in enumerate(parts)])


def reverse_decode(data):
    return reverse_restore([decode(a).astype(np.uint8 if i == 1 else np.uint16).tobytes() for i, a in enumerate(p.unpacket(data))])


def self_check():
    rng = np.random.default_rng(9128)
    tests = 0
    for alphabet in [16, 256, 65536]:
        arrays = [np.zeros(1, np.uint16), np.full(1024, alphabet - 1, np.uint16),
                  np.arange(alphabet, dtype=np.uint16), rng.integers(0, alphabet, 200003, dtype=np.uint16)]
        for a in arrays:
            assert np.array_equal(a, decode(encode(a, alphabet))); tests += 1
    return tests


def run():
    out = {'stage': 'native_rans_large_blocks', 'started': p.host_state(), 'self_checks': self_check(),
           'source_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
           'c_source_sha256': hashlib.sha256((p.HERE / 'rans_probe.c').read_bytes()).hexdigest(),
           'binary_sha256': hashlib.sha256((p.HERE / 'rans_probe.dylib').read_bytes()).hexdigest(), 'samples': []}
    baseline_encode, baseline_decode = p.ans_encode, p.ans_decode
    for group in ['experts', 'ngram', 'other', 'mtp']:
        t = max((t for t in p.TS if t['group'] == group and t['dtype'] == 'U32'), key=lambda t: t['size'])
        size = 32 * p.MiB; off = int((t['size'] - size) * .83) // 4096 * 4096
        weights = p.read(t, off, size); scales, biases = p.side_data(t, off, size); gs = p.group_size(t)
        original = weights + scales + biases
        for method in ['baseline', 'native', 'native_reverse', 'fast_zstd']:
            p.ans_encode, p.ans_decode = (baseline_encode, baseline_decode) if method == 'baseline' else (encode, decode)
            if method == 'fast_zstd':
                en = lambda: p.packet([q.pair_encode(scales, biases, 'pred_shuffle2/zstd9'), q.weight_encode(weights, scales, biases, gs, 'centerpacked/zstd3')])
                def de(data):
                    a, b = p.unpacket(data); s, z = q.pair_decode(a, 'pred_shuffle2/zstd9')
                    return q.weight_decode(b, s, z, gs, 'centerpacked/zstd3') + s + z
            else:
                en = lambda: p.packet([reverse_encode(scales, biases) if method == 'native_reverse' else q.pair_encode(scales, biases, 'pred_ans'),
                                       q.weight_encode(weights, scales, biases, gs, 'context_nibble_scale')])
                def de(data):
                    a, b = p.unpacket(data)
                    s, z = reverse_decode(a) if method == 'native_reverse' else q.pair_decode(a, 'pred_ans')
                    return q.weight_decode(b, s, z, gs, 'context_nibble_scale') + s + z
            st = time.perf_counter(); compressed = en(); et = time.perf_counter() - st
            times = []
            for repeat in range(3):
                st = time.perf_counter(); reconstructed = de(compressed); times.append(time.perf_counter() - st)
                assert reconstructed == original
            row = {'group': group, 'method': method, 'file': t['file'], 'tensor': t['name'], 'offset': off,
                   'original_bytes': len(original), 'compressed_bytes': len(compressed), 'fraction': len(compressed) / len(original),
                   'sha256': hashlib.sha256(original).hexdigest(), 'roundtrip_exact': True,
                   'encode_seconds_diagnostic': et, 'decode_seconds_diagnostic': times,
                   'median_decode_MBps_diagnostic': len(original) / statistics.median(times) / 1e6}
            out['samples'].append(row); print(json.dumps(row), flush=True)
    p.ans_encode, p.ans_decode = baseline_encode, baseline_decode
    out['finished'] = p.host_state()
    (p.HERE / 'native-probe.json').write_text(json.dumps(out, indent=2))


if __name__ == '__main__':
    os.nice(10); run()

```


## Source: native_full.py
SHA-256: `305b5fc425ad8b64361d33668ca86c0207fba145a4a3c0c9ffb39ffec39715f6`

```python
import os
from pathlib import Path
import probe as p
import native_probe as n
import full_file as f

os.nice(10)
p.ans_encode = n.encode
p.ans_decode = n.decode
f.ENTROPY_CODEC = 'native-rans-v1'
p.HERE = p.HERE / 'native-full'
p.HERE.mkdir(exist_ok=True)
f.build('model-00011.safetensors', 32)

```


## Source: regenerate_inventory.py
SHA-256: `144a092ef2c924552a4a5df4857118a9b9cc5f85b151ff3f921e57b5f93fba94`

```python
"""Rebuild the read-only tensor inventory from the local pinned model headers."""
from pathlib import Path
import collections
import hashlib
import json
import math
import struct

model = Path.home() / '.slotstream/models/qwen38-flash-next-mlx-4bit'
here = Path(__file__).resolve().parent
tensors = []; dtypes = collections.Counter(); groups = collections.Counter()
for file in sorted(model.glob('*.safetensors')):
    with file.open('rb') as f:
        length, = struct.unpack('<Q', f.read(8)); header = json.loads(f.read(length))
    ranges = []
    for name, tensor in sorted(header.items()):
        if name == '__metadata__': continue
        a, b = tensor['data_offsets']; dtype = tensor['dtype']
        assert b - a == math.prod(tensor['shape']) * {'BF16': 2, 'U32': 4, 'I64': 8}[dtype]
        group = ('mtp' if file.name == 'mtp.safetensors' else 'ngram' if 'ple' in name and 'embedding' in name
                 else 'experts' if 'switch_mlp' in name else 'other')
        tensors.append({'file': file.name, 'name': name, 'dtype': dtype, 'shape': tensor['shape'],
                        'offset': 8 + length + a, 'size': b - a, 'group': group})
        dtypes[dtype] += b - a; groups[group] += b - a; ranges.append((a, b))
    at = 0
    for a, b in sorted(ranges): assert a == at; at = b
    assert at + 8 + length == file.stat().st_size
inventory = {'dtype_bytes': dict(dtypes), 'group_bytes': dict(groups), 'tensors': tensors}
payload = json.dumps(inventory, indent=2).encode()
destination = here / 'regenerated-tensors.json'
destination.write_bytes(payload)
original = here.parent / 'download-audit/tensors.json'
if original.exists():
    assert json.loads(original.read_bytes()) == inventory
else:
    original.parent.mkdir(parents=True, exist_ok=True)
    original.write_bytes(payload)
print(json.dumps({'tensors': len(tensors), 'matches_original_inventory': True,
                  'sha256': hashlib.sha256(payload).hexdigest(), 'original_sha256': hashlib.sha256(original.read_bytes()).hexdigest()}))

```


## Source: report_data.py
SHA-256: `19dfbf410384ffc2c44a6c6b7aa9c26f25d86bbd13a94a1edf2d654576588303`

```python
"""Deterministic arithmetic over saved probe receipts; no compression rerun."""
import collections
import hashlib
import importlib.metadata
import json
from pathlib import Path
import re
import sys
import probe as p

root = p.HERE
holdout = json.loads((root / 'holdout.json').read_text())
screen = json.loads((root / 'screen.json').read_text())
native = json.loads((root / 'native-probe.json').read_text())
full = json.loads((root / 'full-file.json').read_text())
intervals = collections.defaultdict(list)
for s in holdout['samples']:
    t = s['tensor']; off = s['offset']; size = s['size_per_tensor']
    intervals[t['file']].append((t['offset'] + off, t['offset'] + off + size))
    if s['stratum'][1] == 'pairs':
        t = p.companion(t, 'biases')
        intervals[t['file']].append((t['offset'] + off, t['offset'] + off + size))
unique = 0
for name, ranges in intervals.items():
    low = high = -1
    for a, b in sorted(ranges):
        if a > high:
            unique += max(0, high - low); low, high = a, b
        else: high = max(high, b)
    unique += max(0, high - low)

tot = holdout['summary']['total_model_bytes']
saved = tot - holdout['summary']['estimated_total_download_bytes']['strong_adaptive']
transfer = []
for mbps in [50, 100, 500, 1000, 2500, 5000, 10000]:
    rate = mbps * 1e6 / 8
    transfer.append({'nominal_link_Mbps': mbps, 'original_ideal_seconds': tot / rate,
                     'strong_ideal_transfer_seconds': (tot - saved) / rate,
                     'ideal_transfer_seconds_saved': saved / rate,
                     'decode_MBps_to_preserve_all_savings_when_streamed': rate / ((tot - saved) / tot) / 1e6,
                     'decode_MBps_to_break_even_if_entire_download_then_decode': rate / (saved / tot) / 1e6})
out = {'holdout_windows': len(holdout['samples']),
       'sampled_bytes_including_overlapping_windows': sum(s['original_bytes'] for s in holdout['samples']),
       'distinct_sampled_original_bytes': unique, 'files_covered': sorted(intervals),
       'screen_exact_roundtrips': sum(len(s['results']) for s in screen['samples']),
       'holdout_exact_roundtrips': sum(len(s['results']) for s in holdout['samples']),
       'native_exact_roundtrips': len(native['samples']) * 3, 'native_synthetic_exact_roundtrips': native['self_checks'],
       'estimates': holdout['summary'], 'ideal_network_arithmetic': transfer,
       'full_shard': {k: full[k] for k in ['original_bytes', 'archive_bytes', 'savings_percent', 'archive_sha256']},
       'native_larger_block_fractions': [{k: s[k] for k in ['group', 'method', 'original_bytes', 'compressed_bytes', 'fraction']} for s in native['samples']],
       'versions': {name: importlib.metadata.version(name) for name in ['numpy', 'zstandard', 'lz4', 'brotli', 'blosc2', 'pyppmd', 'constriction']},
       'input_inventory_sha256': hashlib.sha256((root.parent / 'download-audit/tensors.json').read_bytes()).hexdigest(),
       'timing_status': 'Screen and size-qualification timings are diagnostic only and excluded as production performance evidence; shared machine with concurrent work. Byte counts and exact roundtrip checks are deterministic.'}
if (root / 'native-full/full-file.json').exists():
    nf = json.loads((root / 'native-full/full-file.json').read_text())
    out['native_full_shard'] = {k: nf[k] for k in ['original_bytes', 'archive_bytes', 'savings_percent', 'archive_sha256', 'entropy_codec']}
    out['native_full_shard']['pinned_sha256_matches'] = nf['unpack']['pinned_sha256_matches']
(root / 'report-data.json').write_text(json.dumps(out, indent=2))
print(json.dumps({k: v for k, v in out.items() if k not in ['estimates', 'native_larger_block_fractions', 'ideal_network_arithmetic']}, indent=2))

```


## Source: build_evidence.py
SHA-256: `aacb773ec931accf96490ec7db7f549a1ae4bf8e3e3b9acd60e6299f2e566024`

```python
"""Preserve raw experiment outputs and independently inspect finished artifacts."""
from pathlib import Path
import datetime
import hashlib
import json
import subprocess
import probe as p

root = p.HERE


def sha(path):
    with path.open('rb') as f: return hashlib.file_digest(f, 'sha256').hexdigest()


inspection = {'captured_at_utc': datetime.datetime.now(datetime.timezone.utc).isoformat(),
              'purpose': 'Deterministic artifact sizes, source closure, and hash identity; no runtime performance claim.',
              'git_head': subprocess.check_output(['git', 'rev-parse', 'HEAD'], text=True).strip(),
              'pinned_original_sha256': '9128a9cbf81cd25bc4cbebe8adeefa12fa36ee96fcccb6f5fe378343b45131f0',
              'report_data': json.loads((root / 'report-data.json').read_text()), 'artifacts': [],
              'production_download_source_sha256': {str(path): sha(path) for path in map(Path, ['Sources/Slotstream/WeightDownload.swift', 'Sources/Slotstream/WeightStore.swift', 'Sources/Slotstream/PinnedModel.swift'])}}
for directory in [root, root / 'native-full']:
    for suffix in ['.slotcmp', '.restored']:
        file = directory / ('model-00011.safetensors' + suffix)
        checksum = sha(file)
        if suffix == '.restored': assert checksum == inspection['pinned_original_sha256']
        inspection['artifacts'].append({'path': str(file.relative_to(root)), 'bytes': file.stat().st_size, 'sha256': checksum})
code_names = ['probe.py', 'qualify.py', 'full_file_v1.py', 'full_file.py', 'rans_probe.c', 'native_probe.py', 'native_full.py', 'regenerate_inventory.py', 'report_data.py', 'build_evidence.py']
inspection['probe_source_sha256'] = {name: sha(root / name) for name in code_names}
inspection['native_library_sha256'] = sha(root / 'rans_probe.dylib')
(root / 'artifact-inspection.json').write_text(json.dumps(inspection, indent=2))

source = ['# Aggressive lossless compression — raw experiments and source closure\n',
          'Runtime performance is discarded: concurrent compilation, tests and system work ran on this shared Mac. Timing fields are preserved verbatim below for diagnosis, never accepted as installation-speed benchmarks. Compression byte counts and successful exact roundtrips are deterministic artifact properties; independent hashes and current sizes are in [[sources/runs/2026/09/2026-09-05-download-compression-artifact-inspection]].\n',
          'The PPMd-I candidate failed its decoder on byte-shuffled BF16. That failed attempt is preserved and excluded; the completed screen uses the remaining seven codecs/settings families. No source model file, production downloader or hosting configuration was changed.\n',
          '## Exact commands\n```sh\n.venv31/bin/python -u .build/download-compression-max/probe.py screen --mib 1\n.venv31/bin/python -u .build/download-compression-max/qualify.py holdout\n.venv31/bin/python -u .build/download-compression-max/full_file_v1.py --file model-00011.safetensors --block-mib 32\nclang -O3 -std=c11 -Wall -Wextra -Werror -dynamiclib .build/download-compression-max/rans_probe.c -o .build/download-compression-max/rans_probe.dylib\n.venv31/bin/python -u .build/download-compression-max/native_probe.py\n.venv31/bin/python -u .build/download-compression-max/native_full.py\n.venv31/bin/python .build/download-compression-max/regenerate_inventory.py\n.venv31/bin/python .build/download-compression-max/report_data.py\n.venv31/bin/python .build/download-compression-max/build_evidence.py\n```\n',
          'The original full-shard command used `full_file.py` before it was preserved as `full_file_v1.py`. The source hash in the first receipt matches that preserved file. Dependencies were installed in the isolated `.build/download-audit/python` target; exact versions are recorded in the artifact inspection. No main Python environment dependencies were replaced.\n',
          '## Reproduction inputs\nThe 3,283-tensor inventory is deterministically rebuilt by `regenerate_inventory.py`; its reproduced SHA-256 equals the original input inventory. On a fresh checkout, recreate `.build/download-audit/tensors.json` from the emitted inventory before importing the probes, and provide the exact pinned model under the documented model cache path. The probe formats are trusted-input research formats, not hardened production download parsers.\n']
for name in ['screen-attempt1.stderr', 'screen-attempt1.jsonl', 'screen.json', 'holdout.json', 'full-file.json', 'native-probe.json', 'native-full/full-file.json', 'inventory-rebuild.json']:
    source += [f'\n## Raw output: {name}\n', '```text\n' + (root / name).read_text() + '\n```\n']
for name in code_names:
    source += [f'\n## Source: {name}\nSHA-256: `{inspection["probe_source_sha256"][name]}`\n',
               ('```c\n' if name.endswith('.c') else '```python\n') + (root / name).read_text() + '\n```\n']
source += ['\n## Algorithm references\n',
           '- [MLX affine quantization implementation](https://github.com/ml-explore/mlx/blob/main/mlx/backend/metal/kernels/quantized.h): locally inspected quantization behavior motivated the scale/bias predictor; correctness is established by byte comparison of these pinned tensors.\n',
           '- [Constriction](https://github.com/bamler-lab/constriction): the initial entropy coder.\n',
           '- [Bitshuffle](https://github.com/kiyo-masui/bitshuffle): typed bit rearrangement background; custom transforms are preserved above and Blosc2 bitshuffle was also tested.\n',
           '- [ryg_rans](https://github.com/rygorous/ryg_rans/blob/master/rans_byte.h): public-domain byte-renormalized rANS reference; the bounded C prototype uses standard rANS equations and direct symbol lookup.\n']
(root / 'experiments-source-body.md').write_text('\n'.join(source))
body = '# Compression artifact inspection\n\nThis read-only inspection verifies current archive byte counts and reconstructed-file SHA-256 independently of the discarded runtime timings. The complete checkpoint estimate is an arithmetic extrapolation from the stated sample design, not a completed 105 GB archive. The original `holdout.json` field named `unique_windows_sampled_bytes` counts all sampled windows including overlaps; this inspection reports both total and distinct covered bytes correctly.\n\nRaw experiments and reproducible source: [[sources/runs/2026/09/2026-09-05-download-aggressive-lossless-experiments]].\n\n```json\n' + (root / 'artifact-inspection.json').read_text() + '\n```\n'
(root / 'artifact-source-body.md').write_text(body)
print(json.dumps({'artifact_inspection': 'artifact-inspection.json', 'experiments_source_body_bytes': (root / 'experiments-source-body.md').stat().st_size,
                  'artifact_source_body_bytes': (root / 'artifact-source-body.md').stat().st_size,
                  'all_reconstructed_hashes_match_pinned_original': True}))

```


## Algorithm references

- [MLX affine quantization implementation](https://github.com/ml-explore/mlx/blob/main/mlx/backend/metal/kernels/quantized.h): locally inspected quantization behavior motivated the scale/bias predictor; correctness is established by byte comparison of these pinned tensors.

- [Constriction](https://github.com/bamler-lab/constriction): the initial entropy coder.

- [Bitshuffle](https://github.com/kiyo-masui/bitshuffle): typed bit rearrangement background; custom transforms are preserved above and Blosc2 bitshuffle was also tested.

- [ryg_rans](https://github.com/rygorous/ryg_rans/blob/master/rans_byte.h): public-domain byte-renormalized rANS reference; the bounded C prototype uses standard rANS equations and direct symbol lookup.
