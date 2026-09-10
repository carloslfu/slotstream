---
type: run
id: 01m21ynsxd4v7vc32sdymyqpe5
created: 2026-09-09T02:06:45.165898+00:00
updated: 2026-09-09T02:06:45.465964+00:00
summary: Complete static suite passes on V436 binary and all150 exact sources, with tested16-file restoration
binary: /Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream
captured_at: 2026-09-08
command: python3 /tmp/slotstream-optimization-execution/automatic-scope-static-v452/run.py 2026-09-09T02:30:00Z
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Complete static suite passes on V436 binary and all150 exact sources, with tested16-file restoration
tool: Slotstream exact native and source qualification capture
---
V452 addresses a scope limitation in the older static wrapper: selecting a candidate executable alone left source-reading gates on the shared checkout. This run leases the exact16 changed source entries so all150 source inputs match V436, runs the complete original static suite, then restores every source byte/mode/mtime and verifies unchanged release artifacts, drivers and candidate. Six tiny-fixture tests exercise success, suite failure, exceptions, interruption, partial copying and preservation of foreign edits; all pass. The complete static run passes in297.585322083seconds, including planner64, installer and package/download checks. The original nonperformance static policy permits swap-out activity; this is no inference/capacity/thermal or speed claim. Post-run resources still show Chrome/Wispr active and18.625GB reclaimable, below the next22.2GB model preflight. No model is running and no activation occurred.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-static-v452/checks.py",
    "bytes": 5275,
    "sha256": "b4b3212bd3aad097e13aa0f374d3ef2e3052e36fbd5edb67d0cc56c5a1ee64ac"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-static-v452/checks.stderr",
    "bytes": 540,
    "sha256": "1b950dccd1add147f61e2eb98c6625e12b9469d19f6daffb23a06b8c721443fa"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-static-v452/checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-static-v452/manifest.json",
    "bytes": 4873,
    "sha256": "24bb17dffa2fa67831db58f464f8fdc10f3b6d3e3dd12af2cfae516cdd44cc70"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-static-v452/memory.json",
    "bytes": 272227,
    "sha256": "a32962b60a201b785e2e346a7c959be119c003b9f9016bee725b7de054b8813c"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-static-v452/memory.samples.jsonl",
    "bytes": 207308,
    "sha256": "ef73e8df57c20a6f8ee0a051736cce780173a76d7da88c2d18e9bb7aad866de1"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-static-v452/protocol.json",
    "bytes": 76224,
    "sha256": "2cca897447ccea8422f91825ea2d3315b885efdeb849cff91200c8650f6dfbca"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-static-v452/run.py",
    "bytes": 7714,
    "sha256": "4de52174cf53aa84c3d43247161f6be62a49ac1035948b031e9646ea6152a723"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-static-v452/source-before/Sources/Slotstream/Context.swift",
    "bytes": 14145,
    "sha256": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-static-v452/source-before/Sources/Slotstream/ContextMemory.swift",
    "bytes": 13753,
    "sha256": "1219676f986d33a842fdafa4ea75bf54ed120692903d2a79ff2930550d717683"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-static-v452/source-before/Sources/Slotstream/Engine.swift",
    "bytes": 58066,
    "sha256": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-static-v452/source-before/Sources/Slotstream/Generate.swift",
    "bytes": 74337,
    "sha256": "9bd9619a98aa62685be2de5148942455456b5d30fcf18e5a384148a4ae313da2"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-static-v452/source-before/Sources/Slotstream/MTP.swift",
    "bytes": 14155,
    "sha256": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-static-v452/source-before/Sources/Slotstream/Model.swift",
    "bytes": 54003,
    "sha256": "a4cea913e0f438a69e72672d42046bf904717700d8753c1449e5e48b419033a6"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-static-v452/source-before/Sources/Slotstream/Optimizations.swift",
    "bytes": 14290,
    "sha256": "9ec7c669fbe7c88a88ec55aedbdc7afb87b696182333324265fdf95f60a5a5f1"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-static-v452/source-before/Sources/Slotstream/Plan.swift",
    "bytes": 57154,
    "sha256": "d1021e321894868c4844f2cbe4978c3ca6c6cfa958c9aa64591e9d0ec08e8ff7"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-static-v452/source-before/Sources/Slotstream/RequestControl.swift",
    "bytes": 12590,
    "sha256": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-static-v452/source-before/Sources/Slotstream/Weights.swift",
    "bytes": 11340,
    "sha256": "27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-static-v452/source-before/Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift",
    "bytes": 17050,
    "sha256": "0166555aba0d15daf7a0570607978e4c341aec9ab430f5ce3bc25e3370f149da"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-static-v452/source-before/Sources/SlotstreamDiagnostics/Diagnostics+Context.swift",
    "bytes": 31279,
    "sha256": "7363b347ae2df47ff005cb414722434d8d67783ea85a228d68f3b829153f5f8e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-static-v452/source-before/Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift",
    "bytes": 59604,
    "sha256": "f4b9c59e6abc340e8f15b2d523296ab74fcd269cc39c67f514cb18f41a1f6a96"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-static-v452/source-before/Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift",
    "bytes": 11349,
    "sha256": "71b49d3edc91c35572e0e40937860f8112c5ac56b9816ce870e189d4223d641c"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-static-v452/source-before/Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift",
    "bytes": 18429,
    "sha256": "a57d3ec3d19007bdb48a109214bcc3eb1e6b4e401cb3baaa1296952e39d4bfc6"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-static-v452/source-before.json",
    "bytes": 3228,
    "sha256": "dde64818657af9c36991dff28d27c80246321cf30eed039784ef6d4efc4111e4"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-static-v452/stderr.txt",
    "bytes": 2997,
    "sha256": "253f784504f8db8d28ab66eaec9533b53294871f18af20c727039ad22e63d43e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-static-v452/stdout.txt",
    "bytes": 17026,
    "sha256": "85a702f471cb79a2da4b30f82f6b9738677390e3e1ea7a4569bc4d840f0f166f"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/resource-recheck-v450.json",
    "bytes": 678,
    "sha256": "3afa8bcaa3249a86577a6fee625e54b672a192e736b0a1585123260622d7e114"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/resource-recheck-v453.json",
    "bytes": 583,
    "sha256": "cf03def05d144013db81eec023540fd1be71d5e74c1780595723cdbdcf5b1e89"
  }
]
```

## Artifact SHA-256 b4b3212bd3aad097e13aa0f374d3ef2e3052e36fbd5edb67d0cc56c5a1ee64ac

Encoding: `utf-8`. Original bytes: 5275.

````````````text
"""Source-lease failure tests using tiny files and an intercepted static runner."""
import contextlib,datetime,fcntl,hashlib,importlib.util,io,json,os,signal,sys,tempfile,types,unittest
from pathlib import Path
from unittest.mock import patch
HERE=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('static_lease_under_test',HERE/'run.py');m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
class Checks(unittest.TestCase):
 def exercise(self,mode):
  with tempfile.TemporaryDirectory() as temp:
   base=Path(temp);root=base/'root';packet=base/'static';build=base/'build'
   for p in [root/'Sources',root/'Tools',root/'.build/release',packet,build/'after/Sources']:p.mkdir(parents=True,exist_ok=True)
   (root/'Sources/A.swift').write_text('original A');(root/'Sources/B.swift').write_text('unrelated B');(root/'.build/release/slotstream').write_text('original executable')
   os.chmod(root/'Sources/A.swift',0o640);os.utime(root/'Sources/A.swift',ns=(1_000_000_000,2_000_000_000))
   for name in ['A','New']:(build/f'after/Sources/{name}.swift').write_text('candidate '+name)
   def graph():return {str(p.relative_to(root)):m.digest(p) for p in sorted((root/'Sources').glob('*.swift'))}
   old=graph();selected=dict(old);selected.update({f'Sources/{n}.swift':m.digest(build/f'after/Sources/{n}.swift') for n in ['A','New']})
   entries=[{'path':f'Sources/{n}.swift','before_sha256':old.get(f'Sources/{n}.swift'),'after_sha256':selected[f'Sources/{n}.swift']} for n in ['A','New']]
   (build/'before.json').write_text(json.dumps({'root_source':old,'source':entries,'release':{'slotstream':m.digest(root/'.build/release/slotstream')}}))
   (build/'protocol.json').write_text(json.dumps({'candidate_source':selected}));(build/'run.py').write_text('synthetic helper binding only')
   identity={'binary':str(root/'candidate/slotstream'),'identity':{'source':selected}}
   original_tree=m.lease.tree_state(root/'Sources/A.swift');calls=[]
   def run(command,**kw):
    calls.append(command);self.assertEqual(graph(),selected)
    if mode=='raise':raise RuntimeError('synthetic static failure')
    if mode=='interrupt':raise KeyboardInterrupt('synthetic interruption')
    if mode=='foreign':(root/'Sources/A.swift').write_text('foreign user edit')
    kw['stdout'].write('STATIC GATES PASS\n')
    return types.SimpleNamespace(returncode=1 if mode=='suite-failure' else 0)
   copy=m.shutil.copy2
   def copy_maybe_fail(src,dst,*args,**kwargs):
    if mode=='copy-failure' and str(dst).endswith('.v452-pending'):
     Path(dst).write_text('partial staged bytes');raise OSError('synthetic copy failure')
    return copy(src,dst,*args,**kwargs)
   deadline=(datetime.datetime.now(datetime.timezone.utc)+datetime.timedelta(hours=1)).isoformat()
   old_handlers={sig:signal.getsignal(sig) for sig in [signal.SIGINT,signal.SIGTERM]}
   existing={k:v for k,v in os.environ.items() if k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
   try:
    with patch.object(m,'ROOT',root),patch.object(m,'HERE',packet),patch.object(m,'BUILD',build),patch.object(m,'LOCK_PATH',base/'model.lock'),patch.object(m.lease,'ROOT',root),patch.object(m,'source_files',side_effect=lambda _:sorted((root/'Sources').glob('*.swift'))),patch.object(m,'verified_build',return_value=identity),patch.object(m,'preflight',return_value={'reclaimable_bytes':9_500_000_000}),patch.object(m,'memory',return_value={}),patch.object(m,'vm_snapshot',return_value={}),patch.object(m,'competing_jobs',return_value=[]),patch.object(m,'guarded_run',side_effect=run),patch.object(m.shutil,'copy2',side_effect=copy_maybe_fail),patch.object(sys,'argv',[str(HERE/'run.py'),deadline]),contextlib.redirect_stdout(io.StringIO()):
     code=m.main()
   finally:
    for sig,handler in old_handlers.items():signal.signal(sig,handler)
   result=json.loads((packet/'manifest.json').read_text())
   self.assertEqual(code,0 if mode=='pass' else 1)
   self.assertEqual(result['passed'],mode=='pass')
   self.assertEqual((root/'Sources/B.swift').read_text(),'unrelated B')
   self.assertFalse((root/'Sources/New.swift').exists())
   self.assertFalse(list((root/'Sources').glob('*.v452-pending')))
   if mode=='foreign':
    self.assertEqual((root/'Sources/A.swift').read_text(),'foreign user edit');self.assertFalse(result['source_restored'])
   else:
    self.assertEqual(m.lease.tree_state(root/'Sources/A.swift'),original_tree);self.assertTrue(result['source_restored'])
   self.assertEqual(existing,{k:v for k,v in os.environ.items() if k.startswith(('SLOTSTREAM_','SS_DEBUG'))})
   self.assertEqual(len(calls),0 if mode=='copy-failure' else 1)
   with (base/'model.lock').open('a') as lock:fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
 def test_success_restores_exact_bytes_mode_mtime_and_environment(self):self.exercise('pass')
 def test_failed_suite_restores_sources(self):self.exercise('suite-failure')
 def test_runner_exception_restores_sources(self):self.exercise('raise')
 def test_interruption_restores_sources(self):self.exercise('interrupt')
 def test_partial_copy_cannot_leave_candidate_or_temporary_source(self):self.exercise('copy-failure')
 def test_foreign_edit_is_preserved_while_other_preimages_restore(self):self.exercise('foreign')
if __name__=='__main__':unittest.main(verbosity=2)

````````````

## Artifact SHA-256 1b950dccd1add147f61e2eb98c6625e12b9469d19f6daffb23a06b8c721443fa

Encoding: `utf-8`. Original bytes: 540.

````````````text
test_failed_suite_restores_sources (__main__.Checks) ... ok
test_foreign_edit_is_preserved_while_other_preimages_restore (__main__.Checks) ... ok
test_interruption_restores_sources (__main__.Checks) ... ok
test_partial_copy_cannot_leave_candidate_or_temporary_source (__main__.Checks) ... ok
test_runner_exception_restores_sources (__main__.Checks) ... ok
test_success_restores_exact_bytes_mode_mtime_and_environment (__main__.Checks) ... ok

----------------------------------------------------------------------
Ran 6 tests in 0.061s

OK

````````````

## Artifact SHA-256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

Encoding: `utf-8`. Original bytes: 0.

````````````text

````````````

## Artifact SHA-256 24bb17dffa2fa67831db58f464f8fdc10f3b6d3e3dd12af2cfae516cdd44cc70

Encoding: `utf-8`. Original bytes: 4873.

````````````text
{
  "classification": "Original complete static suite against exact V436 binary and all150 candidate source inputs under a reversible16-file source lease. Original600-second work/620-second whole interval and7/3/3GBstatic envelope. No Engine/model/performance/default activation.",
  "started_at": "2026-09-09T01:56:29.553436+00:00",
  "protocol_sha256": "2cca897447ccea8422f91825ea2d3315b885efdeb849cff91200c8650f6dfbca",
  "passed": true,
  "source_restored": true,
  "model_loaded": false,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 20748877824,
    "swapins": 44233774,
    "swapouts": 77586649,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     3644.\nPages active:                                 976651.\nPages inactive:                              1062310.\nPages speculative:                             34263.\nPages throttled:                                   0.\nPages wired down:                             237306.\nPages purgeable:                               15535.\n\"Translation faults\":                    17984122332.\nPages copy-on-write:                       983565353.\nPages zero filled:                       25649764823.\nPages reactivated:                        4838782936.\nPages purged:                               91872542.\nFile-backed pages:                           1247232.\nAnonymous pages:                              825992.\nPages stored in compressor:                  1555326.\nPages occupied by compressor:                 771266.\nDecompressions:                           1451397644.\nCompressions:                             1790112158.\nPageins:                                  9124864816.\nPageouts:                                   11585597.\nSwapins:                                    44233774.\nSwapouts:                                   77586649.\nPages tagged:                                 175143.\nPages tagged resident:                        130731.\nPages tagged compressed:                       44412.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7039.\nPages tag-storage free:                          124.\nPages tag-storage non-tag pageable:            91133.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7121856.\nTagged compressions:                        14518982.\nTagged decompressions:                      13477857.\n"
  },
  "exact_candidate_sources_applied": true,
  "exit_code": 0,
  "suite_passed": true,
  "elapsed_seconds": 297.58532208300005,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 19172261888,
    "swapins": 44233786,
    "swapouts": 77586665,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   481443.\nPages active:                                 804604.\nPages inactive:                               820427.\nPages speculative:                              1118.\nPages throttled:                                   0.\nPages wired down:                             238708.\nPages purgeable:                               13583.\n\"Translation faults\":                    17998058422.\nPages copy-on-write:                       985239255.\nPages zero filled:                       25655833910.\nPages reactivated:                        4838785382.\nPages purged:                               91881307.\nFile-backed pages:                            675156.\nAnonymous pages:                              950993.\nPages stored in compressor:                  1490498.\nPages occupied by compressor:                 738839.\nDecompressions:                           1451460865.\nCompressions:                             1790112190.\nPageins:                                  9125317168.\nPageouts:                                   11588982.\nSwapins:                                    44233786.\nSwapouts:                                   77586665.\nPages tagged:                                 175695.\nPages tagged resident:                        132376.\nPages tagged compressed:                       43319.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7038.\nPages tag-storage free:                          308.\nPages tag-storage non-tag pageable:            90950.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6959552.\nTagged compressions:                        14518982.\nTagged decompressions:                      13478810.\n"
  },
  "candidate_unchanged": true,
  "sources_restored_exactly": true,
  "release_unchanged": true,
  "drivers_unchanged": true,
  "remaining_jobs": [],
  "model_lock_free": true,
  "within_reservation": true
}

````````````

## Artifact SHA-256 a32962b60a201b785e2e346a7c959be119c003b9f9016bee725b7de054b8813c

Encoding: `gzip+base64`. Original bytes: 272227.

````````````text
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za9efo8PgP962jL4gn/4bPnsZ9b8q8uLe/WXTrNfXdwvLe2nF375R67a37989fsX//z6/cef8GX8/cOPj1iQf+Q38QFfxoffvvgP/GQvPrz+t4cXj98/fbIX++f4j797+w/4qw8vvn//8PDbF+Mf9VytbJ8e27+5Ew96giX1nx/D6p56kKke0Z8f+/Du4dVPb16eeDLn9MuH/Pj7948fP755+O4MwPTzY398/f7huxff4egeP8fSi9R+fuzdT+9/eOBKj95tn+qBx3731T+9f/n2w5t9A77Yd+SH3331xac5DhJfJcdP/vx+rx7f/enrx7df//E9DuivvSfYNhlM/wXdvz28f3yBw3fwtZRKjxdEKf+yBO8fng/LwbepnH3pLAG9/VKG33/HUcuyf5f/FWbh629fvvoXLAE374fDZ63hM/JD/qe3j2//9OPjTx9OPIT3q3CAf/lKPnx85Iq/frsbv/ew1I/vv/AKOLIgcr9ge3z16qd3r/Hgt386fLAx+s11+y8Pn34NC374GXHXZMokWsZj//nkQy+eZjDkkn9e7tejJ56//lJxb+Ednx+jzTlzZijnyaogPPaPTzbszFM/W7nnx86+2ycT+Mv5fvnDD2cOd27V+p8/hh394fV3D28//vbXz2mRZn/+2Kcl/PU3VjbPff7Y19xg+I/jT9pBb/VLj73Anffd67c/8M++8EW1JP7FxwamXfKX3w0n6Wv8936Q/sKc9dT1+LHden7pbfkh/453D6+iX77FX0HFw81Ru5Wb659uv/rDg8Cj87wnnx/77syxy+RbnnlwvvqbZ0qI6/tH0B589d888bgfH378FgwGNvq/PTGrpz/+4f3jT+/2P90v5504/Ey+fuU1vtkpxDevQH3e/vTul1f8MvdUah7m5+E7zyzlV1jJZy95LzthS83PTtT/X9iJdL+LnXi7j53IXezkc8OwgJ34SnbS4fjcwU5wh+tfz06k9M9oxv932cl+g//17KT5/2Ynf8ZOav7f7OR/JXZS7mMn9r8CO/mbf/+b/wmSi9O+YycEAA==
````````````

## Artifact SHA-256 ef73e8df57c20a6f8ee0a051736cce780173a76d7da88c2d18e9bb7aad866de1

Encoding: `gzip+base64`. Original bytes: 207308.

````````````text
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
````````````

## Artifact SHA-256 2cca897447ccea8422f91825ea2d3315b885efdeb849cff91200c8650f6dfbca

Encoding: `gzip+base64`. Original bytes: 76224.

````````````text
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
````````````

## Artifact SHA-256 4de52174cf53aa84c3d43247161f6be62a49ac1035948b031e9646ea6152a723

Encoding: `utf-8`. Original bytes: 7714.

````````````text
"""Full original static suite on exact V436 binary AND temporarily leased sources.

The original V356 checked the selected binary but source-reading gates still
saw the shared reference checkout. This lease makes that scope explicit and
restores all source preimages/modes/mtimes before handback. No model runs.
"""
from pathlib import Path
import datetime,fcntl,importlib.util,json,os,shutil,signal,sys,time,traceback
ROOT=Path('/Users/carlos/Projects/slotstream');HERE=Path(__file__).resolve().parent
BASE=HERE.parent;BUILD=BASE/'automatic-scope-build-v436'
LOCK_PATH=Path(f'/tmp/slotstream-model-{os.getuid()}.lock')
sys.path.insert(0,str(ROOT/'Tools'))
from build_identity import source_files
from prefill_bench import digest,preflight,vm_snapshot
from serve_bench import competing_jobs,verified_build
from optimization_serial_build import guarded_run
from optimization_readiness import pressure_snapshot,require_normal
spec=importlib.util.spec_from_file_location('verified_source_lease_helpers',BUILD/'run.py')
lease=importlib.util.module_from_spec(spec);spec.loader.exec_module(lease)
POLICY={'startup_reclaimable_bytes':7_000_000_000,'minimum_live_reclaimable_bytes':3_000_000_000,
 'maximum_owned_rss_bytes':3_000_000_000,'maximum_build_seconds':600,
 'sample_interval_seconds':.2,'stop_on_new_swapouts':False}

def sources():return {str(p.relative_to(ROOT)):digest(p) for p in source_files(ROOT)}
def memory():
 value=vm_snapshot();require_normal(pressure_snapshot());return value

def main():
 deadline=datetime.datetime.fromisoformat(sys.argv[1].replace('Z','+00:00')).timestamp()
 if deadline-time.time()<620:raise RuntimeError('full600-second static work plus20-second cleanup must fit')
 if (HERE/'protocol.json').exists() or (HERE/'manifest.json').exists():raise RuntimeError('static identity already attempted')
 original=json.loads((BUILD/'before.json').read_text());declared=json.loads((BUILD/'protocol.json').read_text())
 build=verified_build(ROOT/'.build/optimization/automatic-scope-build-v436/candidate/slotstream')
 assert build['identity']['source']==declared['candidate_source']
 assert sources()==original['root_source']
 assert all(digest(ROOT/'.build/release'/n)==sha for n,sha in original['release'].items())
 protocol={'classification':'Original complete static suite against exact V436 binary and all150 candidate source inputs under a reversible16-file source lease. Original600-second work/620-second whole interval and7/3/3GBstatic envelope. No Engine/model/performance/default activation.',
  'build':build,'source_inputs':declared['candidate_source'],'shared_preimages':original['root_source'],
  'lease_files':original['source'],'shared_release':original['release'],'executor_sha256':digest(Path(__file__)),
  'lease_helper_sha256':digest(BUILD/'run.py'),'command':['bash',str(ROOT/'Tools/static_gates.sh')],
  'environment':{'SLOTSTREAM_TEST_BINARY':str(build['binary'])},'policy':POLICY,'deadline_utc':sys.argv[1],
  'maximum_whole_interval_seconds':620,'drivers':{str(p.relative_to(ROOT)):digest(p) for p in sorted((ROOT/'Tools').rglob('*')) if p.is_file() and p.suffix in ['.py','.sh','.mjs','.json'] and '__pycache__' not in p.parts}}
 (HERE/'protocol.json').write_text(json.dumps(protocol,indent=2)+'\n')
 result={'classification':protocol['classification'],'started_at':datetime.datetime.now(datetime.timezone.utc).isoformat(),'protocol_sha256':digest(HERE/'protocol.json'),'passed':False,'source_restored':False,'model_loaded':False}
 started=time.monotonic();applied=[];pending_files=[];before=None
 def interrupted(number,_frame):raise KeyboardInterrupt(f'static lease interrupted by signal{number}')
 signal.signal(signal.SIGINT,interrupted);signal.signal(signal.SIGTERM,interrupted)
 saved={k:v for k,v in os.environ.items() if k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
 paths=[ROOT/e['path'] for e in original['source']]
 try:
  result['before']=preflight(7);memory();assert not competing_jobs()
  with open(LOCK_PATH,'a') as lock:
   fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
   assert sources()==original['root_source']
   before=lease.snapshot(paths,HERE/'source-before')
   (HERE/'source-before.json').write_text(json.dumps(before,indent=2)+'\n')
   try:
    for entry in original['source']:
     source=BUILD/'after'/entry['path'];assert digest(source)==entry['after_sha256']
     path=ROOT/entry['path'];pending=path.with_suffix(path.suffix+'.v452-pending')
     assert not pending.exists(),'temporary source path already exists'
     pending_files.append(pending)
     shutil.copy2(source,pending);pending.replace(path);applied.append(entry)
    assert sources()==declared['candidate_source'];result['exact_candidate_sources_applied']=True
    for key in saved:os.environ.pop(key,None)
    os.environ.update(protocol['environment'])
    with (HERE/'stdout.txt').open('w') as stdout,(HERE/'stderr.txt').open('w') as stderr:
     status=guarded_run(protocol['command'],cwd=ROOT,stdout=stdout,stderr=stderr,record_path=HERE/'memory.json',snapshot=memory,policy=POLICY,classification=protocol['classification'])
    result['exit_code']=status.returncode
    result['suite_passed']=status.returncode==0 and (HERE/'stdout.txt').read_text().rstrip().endswith('STATIC GATES PASS')
    result['passed']=result['suite_passed']
   finally:
    for key in list(os.environ):
     if key.startswith(('SLOTSTREAM_','SS_DEBUG')):os.environ.pop(key,None)
    os.environ.update(saved)
    for pending in pending_files:
     if pending.exists():pending.unlink()
    applied_paths={e['path']:e['after_sha256'] for e in applied}
    safe=[];changed=[]
    for path in paths:
     relative=str(path.relative_to(ROOT))
     matches=(path.is_file() and digest(path)==applied_paths[relative]) if relative in applied_paths else lease.tree_state(path)==before[relative]
     (safe if matches else changed).append(path)
    lease.restore(safe,HERE/'source-before',{str(path.relative_to(ROOT)):before[str(path.relative_to(ROOT))] for path in safe})
    assert not changed,'source changed outside lease; foreign edits preserved, other preimages restored'
    assert sources()==original['root_source'];result['source_restored']=True
 except BaseException as error:
  result['passed']=False;result['error']=f'{type(error).__name__}: {error}';result['traceback']=traceback.format_exc()
 finally:
  result['elapsed_seconds']=time.monotonic()-started
  for key,fn in {'after':vm_snapshot,'candidate_unchanged':lambda:verified_build(build['binary'])==build,
    'sources_restored_exactly':lambda:sources()==original['root_source'],
    'release_unchanged':lambda:all(digest(ROOT/'.build/release'/n)==sha for n,sha in original['release'].items()),
    'drivers_unchanged':lambda:all(digest(ROOT/n)==sha for n,sha in protocol['drivers'].items()),
    'remaining_jobs':competing_jobs,'model_lock_free':lambda:bool(preflight(0))}.items():
   try:result[key]=fn()
   except BaseException as error:result.setdefault('cleanup_errors',{})[key]=f'{type(error).__name__}: {error}'
  result['within_reservation']=time.time()<=deadline
  result['passed']=bool(result['passed'] and result.get('source_restored') and result.get('sources_restored_exactly') and result.get('release_unchanged') and result.get('candidate_unchanged') and result.get('drivers_unchanged') and not result.get('remaining_jobs') and result.get('model_lock_free') and not result.get('cleanup_errors') and result['within_reservation'] and result['elapsed_seconds']<=620)
  (HERE/'manifest.json').write_text(json.dumps(result,indent=2)+'\n')
 print(json.dumps({k:v for k,v in result.items() if k not in ['before','after']},indent=2),flush=True)
 return 0 if result['passed'] else 1
if __name__=='__main__':raise SystemExit(main())

````````````

## Artifact SHA-256 fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0

Encoding: `utf-8`. Original bytes: 14145.

````````````text
// Context length: the cap, why it is what it is, and the prefill schedule that
// keeps a long prompt's transient memory inside what has been measured.

import Foundation

public enum ContextPolicy {
    /// Pinned checkpoint configuration. This is independent of qualification.
    public static let modelLimit = 262_144
    /// Longest prompt plus reply any one request may hold, in tokens.
    ///
    /// The Hermes qualification read 65,520 prompt tokens plus a reply; the
    /// remainder is reserved reply room. This is a measured serving envelope,
    /// not the model's 262,144-token configured limit or an answer-quality claim.
    /// The larger requested window is priced before allocating the expert pool.
    /// See MEASUREMENTS.md, Hermes integration, for the initial budget failure
    /// and the planned-context qualification. Keep ordinary defaults unchanged.
    public static let maxTokens = 65_536
    public static let implementationLimit = maxTokens
    public static let mtpLimit = 65_536
    public static let visionLimit = 65_536
    public static let defaultTokens = 32_768
    /// Context the fixed footprint (Planner.fixedFootprintGB) already pays for.
    public static let tokensInFixedFootprint = 32_768

    package static func maximumDraftDepth(requested: Int, at consumed: Int, limit: Int) -> Int {
        guard requested >= 0, consumed >= 0, consumed <= limit,
              limit > 0, limit <= modelLimit else { return 0 }
        return min(requested, max(0, limit - consumed - 1))
    }

    /// nil when `tokens` is an acceptable --max-context, otherwise the reason.
    public static func validationError(_ tokens: Int) -> String? {
        validationError(tokens, qualification: false)
    }

    public static func validationError(_ tokens: Int, qualification: Bool) -> String? {
        let limit = qualification ? modelLimit : implementationLimit
        if (1 ... limit).contains(tokens) { return nil }
        return "--max-context must be between 1 and \(limit) (prompt plus reply). "
            + "The pinned model limit is \(modelLimit); the released implementation limit is "
            + "\(implementationLimit). A model limit does not guarantee memory fit or answer quality."
    }
}

/// How a prompt is split into prefill passes.
///
/// A pass is faster the bigger it is (the expert stream is re-read roughly once
/// per pass), but the sparse-attention layers score every query token of the
/// pass against every key already in the context, so the pass's transient
/// memory grows with chunk × context, not with the chunk alone. Every number
/// the planner charges for a pass was measured with that product at most
/// `measuredQueryKeyProduct`. Past that point the schedule halves the pass
/// instead of letting the transient grow into space nothing has measured.
public enum PrefillSchedule {
    /// The largest query-by-key product any prefill measurement covered: a
    /// 4096-token pass finishing an 8,016-token prompt (MEASUREMENTS.md,
    /// "Prefill, second pass"). Do not raise it without a new measurement.
    public static let measuredQueryKeyProduct = 4096 * 8016
    /// Late-context passes use the existing small-pass pool path. Their cost
    /// stays unknown until a matching measurement has been registered.
    public static let minChunk = 64

    /// The pass to run when the state already holds `position` tokens and the
    /// plan allows `maxChunk`: halve from `maxChunk` until the product with
    /// the context the pass attends over is inside the measured bound, never
    /// below `minChunk`.
    public static func chunk(at position: Int, maxChunk: Int) -> Int {
        guard position >= 0, position < ContextPolicy.modelLimit else { return 0 }
        // Preserve the original 256-row dispatch while it fits. An odd
        // override such as 4095 must not halve through 511 to 255 inside the
        // existing serving window and silently select small-pass arithmetic.
        let floor = fits(256, at: position) ? 256 : minChunk
        var c = min(4096, max(floor, maxChunk))
        while c > floor, !fits(c, at: position) {
            c = max(floor, c / 2)
        }
        while c > 1, !fits(c, at: position) { c /= 2 }
        return fits(c, at: position) ? c : 0
    }

    /// Division avoids overflowing arbitrary diagnostic inputs. The accepted
    /// context ceiling is unchanged; within it even the minimum pass fits.
    public static func fits(_ count: Int, at position: Int) -> Bool {
        count > 0 && position >= 0 && position <= measuredQueryKeyProduct / count - count
    }

    /// Check the actual remaining rows before shrinking a hypothetical full
    /// pass. A 3,864-row tail after 4,096 fits the existing measured envelope.
    public static func next(remaining: Int, at position: Int, maxChunk: Int, tailAware: Bool) -> Int {
        guard remaining > 0 else { return 0 }
        guard position >= 0, position < ContextPolicy.modelLimit,
              remaining <= ContextPolicy.modelLimit - position else { return 0 }
        let candidate = min(remaining, min(4096, max(1, maxChunk)))
        if tailAware, fits(candidate, at: position) { return candidate }
        return min(remaining, chunk(at: position, maxChunk: maxChunk))
    }

    /// Group existing chronological compute passes without enlarging any
    /// query-by-key product. A scope shares reads; it is not a compute pass.
    public static func scopePasses(remaining: Int, at position: Int, maxChunk: Int,
                                   maxScope: Int, tailAware: Bool) -> [Int] {
        guard remaining > 0, position >= 0, position < ContextPolicy.modelLimit,
              remaining <= ContextPolicy.modelLimit - position else { return [] }
        var result: [Int] = [], count = 0
        let bound = max(minChunk, min(8192, maxScope))
        while count < remaining {
            let (pos, overflow) = max(0, position).addingReportingOverflow(count)
            guard !overflow else { break }
            let n = next(remaining: remaining - count, at: pos, maxChunk: maxChunk, tailAware: tailAware)
            // A short final pass uses the reference cached kernel family;
            // keep it separate until swept short tails have their own gate.
            if n == 0 || (count > 0 && (n < SweepTuning.minTokens || n > bound - count)) { break }
            result.append(n); count += n
            if count >= bound { break }
        }
        return result
    }

    /// End a read-sharing group at a requested checkpoint only when one of
    /// its existing compute passes already ends there. This preserves every
    /// arithmetic shape; an interior token never manufactures a new pass.
    package static func preservingCheckpoint(_ passes: [Int], from position: Int,
                                             checkpoint: Int) -> [Int] {
        guard position >= 0, checkpoint > position,
              checkpoint <= ContextPolicy.modelLimit else { return passes }
        var end = position
        for (index, count) in passes.enumerated() {
            guard count > 0, count <= ContextPolicy.modelLimit - end else { return passes }
            end += count
            if end == checkpoint { return Array(passes.prefix(index + 1)) }
            if end > checkpoint { return passes }
        }
        return passes
    }

    /// The passes that reading `tokens` new tokens from `position` runs.
    public static func passes(tokens: Int, from position: Int = 0, maxChunk: Int, tailAware: Bool = false) -> [Int] {
        computePasses(tokens: tokens, from: position, maxChunk: maxChunk, tailAware: tailAware).map(\.tokens)
    }

    public struct ComputePass: Sendable {
        public let tokens: Int
        public let queryRows: Int
        public let keyExtent: Int
    }

    /// Include the canonical late-context dispatch shape and masked columns,
    /// using the same bounded geometry as Generator. A nominal odd pass can
    /// shrink again for numerical alignment; diagnostics must report that.
    public static func computePasses(tokens: Int, from position: Int = 0,
                                     maxChunk: Int, tailAware: Bool = false) -> [ComputePass] {
        guard position >= 0, tokens >= 0, position <= ContextPolicy.modelLimit,
              tokens <= ContextPolicy.modelLimit - position else { return [] }
        var out: [ComputePass] = []
        var pos = position
        var left = tokens
        let end = position + tokens
        var referenceStart: Int?
        while left > 0 {
            var c = next(remaining: left, at: pos, maxChunk: maxChunk, tailAware: tailAware)
            let small = chunk(at: pos, maxChunk: 256) < 256
            if small {
                if referenceStart == nil { referenceStart = pos }
                c = ContextWorkspace.boundedSmallPass(requested: c, at: pos,
                    referenceStart: referenceStart!, referenceEnd: end)
            }
            guard c > 0 else { return [] }
            let extent = small ? ContextWorkspace.keyExtent(pass: c, context: pos + c,
                referenceStart: referenceStart!, referenceEnd: end) : pos + c
            let queries = small ? ContextWorkspace.queryRows(pass: c, context: pos + c,
                referenceStart: referenceStart!, referenceEnd: end) : c
            guard extent > 0, queries <= measuredQueryKeyProduct / extent else { return [] }
            out.append(ComputePass(tokens: c, queryRows: queries, keyExtent: extent))
            pos += c
            left -= c
        }
        return out
    }

    /// Seconds to read `tokens` new prompt tokens at this plan: the schedule's
    /// passes priced at the measured per-pass throughput anchors
    /// (Planner.estPrefillTokS). The last, partial pass is priced at the rate
    /// of the pass size it was cut from — slightly pessimistic, on purpose.
    public static func estSeconds(tokens: Int, from position: Int = 0, maxChunk: Int, tailAware: Bool = false) -> Double {
        estimateSeconds(tokens: tokens, from: position, maxChunk: maxChunk, tailAware: tailAware) ?? .infinity
    }

    /// nil means there is no qualified throughput anchor for this schedule.
    public static func estimateSeconds(tokens: Int, from position: Int = 0, maxChunk: Int,
                                       tailAware: Bool = false) -> Double? {
        guard position >= 0, tokens >= 0, position <= ContextPolicy.modelLimit,
              tokens <= ContextPolicy.modelLimit - position else { return nil }
        var secs = 0.0
        var pos = max(0, position)
        var left = max(0, tokens)
        while left > 0 {
            let full = tailAware
                ? next(remaining: left, at: pos, maxChunk: maxChunk, tailAware: true)
                : chunk(at: pos, maxChunk: maxChunk)
            let c = min(full, left)
            guard c > 0, full >= 256 else { return nil }
            secs += Double(c) / Planner.estPrefillTokS(chunk: full)
            pos += c
            left -= c
        }
        return secs
    }

    /// "18 s" / "1.2 min" / "1.5 h": the same rounding everywhere it is shown.
    public static func describe(seconds: Double) -> String {
        guard seconds.isFinite else { return "unknown (schedule not yet calibrated)" }
        if seconds < 60 { return String(format: "%.0f s", seconds.rounded()) }
        if seconds < 3600 { return String(format: "%.1f min", seconds / 60) }
        return String(format: "%.1f h", seconds / 3600)
    }
}

/// Progress lines for a long prefill, shared by `run` (stderr) and `serve`
/// (its log). A prompt under `quietBelowTokens` prints nothing: the wait is
/// seconds and the lines would be noise.
public final class PrefillProgressReporter {
    public let quietBelowTokens: Int
    public var maxChunk: Int
    private let sink: (String) -> Void
    private var announced = 0  // total the running announcement was made for
    private var announcedBase = -1
    private var nextMark = 0.25
    private var lastLine: UInt64 = 0
    public var tailAware = false

    public init(quietBelowTokens: Int, maxChunk: Int, sink: @escaping (String) -> Void) {
        self.quietBelowTokens = quietBelowTokens
        self.maxChunk = maxChunk
        self.sink = sink
    }

    /// Generator.onPrefillProgress: called after every pass with the tokens
    /// read so far this request, the tokens it will read, and elapsed seconds.
    public func report(done: Int, total: Int, elapsed: Double) {
        report(done: done, total: total, elapsed: elapsed, base: 0)
    }

    public func report(done: Int, total: Int, elapsed: Double, base: Int) {
        guard total >= quietBelowTokens, total > 0 else { return }
        if announced != total || announcedBase != base {
            announced = total
            announcedBase = base
            nextMark = 0.25
            let eta = PrefillSchedule.estSeconds(tokens: total, from: base, maxChunk: maxChunk, tailAware: tailAware)
            sink("prefill: reading \(total) prompt tokens, ~\(PrefillSchedule.describe(seconds: eta)) "
                + "to the first token at this plan (follow-up turns read only what is new)")
        }
        if done <= 0 { return }
        let frac = Double(done) / Double(total)
        if done >= total {
            let rate = elapsed > 0 ? Double(total) / elapsed : 0
            sink(String(format: "prefill: done, %d tokens in %@ (%.0f tok/s)",
                        total, PrefillSchedule.describe(seconds: elapsed), rate))
            announced = 0
            return
        }
        // One line per quarter, never more often than every 5 s.
        guard frac >= nextMark, lastLine == 0 || RuntimeClock.seconds(since: lastLine) >= 5 else { return }
        while nextMark <= frac { nextMark += 0.25 }
        lastLine = RuntimeClock.now()
        let rate = elapsed > 0 ? Double(done) / elapsed : 0
        let left = rate > 0 ? Double(total - done) / rate : 0
        sink(String(format: "prefill: %d/%d tokens (%.0f%%), ~%@ left",
                    done, total, frac * 100, PrefillSchedule.describe(seconds: left)))
    }
}

````````````

## Artifact SHA-256 1219676f986d33a842fdafa4ea75bf54ed120692903d2a79ff2930550d717683

Encoding: `utf-8`. Original bytes: 13753.

````````````text
import Foundation

// Saturation is a refusal sentinel, never permission to wrap a byte budget.
package enum ContextBytes {
    package static func product(_ values: Int...) -> Int {
        var result = 1
        for value in values {
            guard value >= 0 else { return Int.max }
            let (next, overflow) = result.multipliedReportingOverflow(by: value)
            guard !overflow else { return Int.max }
            result = next
        }
        return result
    }
    package static func sum(_ values: Int...) -> Int {
        var result = 0
        for value in values {
            guard value >= 0 else { return Int.max }
            let (next, overflow) = result.addingReportingOverflow(value)
            guard !overflow else { return Int.max }
            result = next
        }
        return result
    }
}

/// Pure geometry shared by the planner and the actual stepped sequence caches.
/// A capacity is bytes of backing storage, not the number of live token IDs.
public enum ContextGeometry {
    public static let allocationStep = 1024
    public static let attentionLayers = 12
    public static let rowBytes = 2304

    /// Physical bytes needed when one buffer grows. The old allocation can
    /// still have GPU or checkpoint readers, so growth charges the complete
    /// replacement. Capacity in another buffer never grants a credit here.
    public static func nextBufferAllocationBytes(tokens: Int, rowBytes: Int,
                                                 allocatedBytes: Int, step: Int = allocationStep) -> Int {
        guard tokens >= 0, tokens <= ContextPolicy.modelLimit, rowBytes > 0,
              allocatedBytes >= 0, step > 0, step <= ContextPolicy.modelLimit else { return Int.max }
        let capacity = ((tokens + step - 1) / step) * step
        let required = ContextBytes.product(capacity, rowBytes)
        return required > allocatedBytes ? required : 0
    }

    public static func capacityBytes(tokens: Int, layers: Int = attentionLayers,
                                     rowBytes: Int = rowBytes, pooledRowBytes: Int = 256,
                                     compressionRatio: Int = 4, indexerBudget: Int = 2048,
                                     incrementalIndexer: Bool = false) -> Int {
        guard tokens >= 0, layers >= 0, rowBytes > 0, pooledRowBytes >= 0,
              compressionRatio > 0, indexerBudget >= 0, tokens <= ContextPolicy.modelLimit else { return Int.max }
        let capacity = ((tokens + allocationStep - 1) / allocationStep) * allocationStep
        let pooled = incrementalIndexer && tokens > indexerBudget
            ? ((tokens / compressionRatio + 255) / 256) * 256 : 0
        let (rows, a) = capacity.multipliedReportingOverflow(by: rowBytes)
        let (blocks, b) = pooled.multipliedReportingOverflow(by: pooledRowBytes)
        let (one, c) = rows.addingReportingOverflow(blocks)
        let (total, d) = one.multipliedReportingOverflow(by: layers)
        return a || b || c || d ? Int.max : total
    }

    public static func sequenceBytes(tokens: Int, mtp: Bool = false) -> Int {
        capacityBytes(tokens: tokens, layers: attentionLayers + (mtp ? 1 : 0))
    }

    public static func additionalActiveBytes(tokens: Int, mtp: Bool = false) -> Int {
        max(0, sequenceBytes(tokens: tokens, mtp: mtp)
            - sequenceBytes(tokens: ContextPolicy.tokensInFixedFootprint, mtp: mtp))
    }
}

/// Exact integer accounting of an otherwise empirical process envelope. The
/// fixed and workspace allowances are measured budgets, not allocator telemetry.
public struct ContextMemoryLedger: Sendable {
    public let fixedBytes: Int
    public let poolBytes: Int
    public let activeCapacityBytes: Int
    public let additionalActiveBytes: Int
    public let retainedCapacityBytes: Int
    public let retainedRecurrentBytes: Int
    public let prefillBytes: Int
    public let longContextReserveBytes: Int
    public let mtpResidentBytes: Int
    public let visionResidentBytes: Int
    public let planningMarginBytes: Int

    public init(slots: Int, context: Int, chunk: Int, retentionTokens: Int,
                mtp: Bool, visionResident: Bool) {
        fixedBytes = 5_300_000_000
        poolBytes = ContextBytes.product(slots, 2_764_800)
        activeCapacityBytes = ContextGeometry.sequenceBytes(tokens: context, mtp: mtp)
        additionalActiveBytes = ContextGeometry.additionalActiveBytes(tokens: context, mtp: mtp)
        retainedCapacityBytes = ContextBytes.product(retentionTokens, PrefixCache.bytesPerToken)
        retainedRecurrentBytes = retentionTokens > 0
            ? (PrefixCache.maxEntries - 1) * PrefixCache.fixedBytesPerEntry : 0
        prefillBytes = ContextBytes.product(chunk, 1_300_000)
        longContextReserveBytes = Self.transientReserveBytes(context: context, mtp: mtp)
        mtpResidentBytes = mtp ? 1_600_000_000 : 0
        visionResidentBytes = visionResident ? 900_000_000 : 0
        planningMarginBytes = 1_000_000_000
    }

    /// The Hermes envelope is anchored permanently at 65K. Above it, reserve
    /// an additional complete growth allocation for candidate qualification;
    /// this conservative copy budget is not a measured interpolation.
    public static func transientReserveBytes(context: Int, mtp: Bool = false) -> Int {
        guard context > ContextPolicy.tokensInFixedFootprint else { return 0 }
        let hermes = 32_768 * PrefixCache.bytesPerToken
        return max(hermes, ContextGeometry.additionalActiveBytes(tokens: context, mtp: mtp))
    }

    public var expectedPeakBytes: Int {
        ContextBytes.sum(fixedBytes, poolBytes, additionalActiveBytes, retainedCapacityBytes,
            retainedRecurrentBytes, prefillBytes, longContextReserveBytes,
            mtpResidentBytes, visionResidentBytes)
    }
    public var json: [String: Any] {
        ["version": 1, "fixed_bytes": fixedBytes, "pool_bytes": poolBytes,
         "active_capacity_bytes": activeCapacityBytes, "additional_active_bytes": additionalActiveBytes,
         "retained_capacity_bytes": retainedCapacityBytes, "retained_recurrent_bytes": retainedRecurrentBytes,
         "prefill_bytes": prefillBytes, "long_context_reserve_bytes": longContextReserveBytes,
         "mtp_resident_bytes": mtpResidentBytes, "vision_resident_bytes": visionResidentBytes,
         "planning_margin_bytes": planningMarginBytes, "expected_peak_bytes": expectedPeakBytes]
    }
}

/// Bounds for the next dispatch. These are conservative geometry allowances,
/// not throughput anchors or new measured process-peak claims.
public enum ContextWorkspace {
    /// A short pass stays inside one canonical projection/attention domain.
    /// Include masked key columns when choosing its actual query count.
    public static func boundedSmallPass(requested: Int, at position: Int,
                                         referenceStart: Int, referenceEnd: Int) -> Int {
        guard requested > 0, requested < 256, referenceStart >= 0,
              position >= referenceStart, referenceEnd > position,
              referenceEnd <= ContextPolicy.modelLimit else { return 0 }
        let blockRemaining = 256 - ((position - referenceStart) % 256)
        // Only the qualified 64/128-row family is selected for full late
        // passes. Odd user batch overrides cannot introduce a new kernel
        // shape such as 68 or 137; logical terminal rows are still exact.
        let preferred = requested >= 128 ? 128 : requested >= 64 ? 64 : requested
        var count = min(preferred, blockRemaining, referenceEnd - position)
        while count > 0 {
            let extent = keyExtent(pass: count, context: position + count,
                referenceStart: referenceStart, referenceEnd: referenceEnd)
            let queries = queryRows(pass: count, context: position + count,
                referenceStart: referenceStart, referenceEnd: referenceEnd)
            if queries <= PrefillSchedule.measuredQueryKeyProduct / extent { return count }
            count /= 2
        }
        return 0
    }

    public static func keyExtent(pass: Int, context: Int, referenceStart: Int = 0,
                                 referenceEnd: Int = ContextPolicy.modelLimit) -> Int {
        guard pass > 0, context >= pass, context <= ContextPolicy.modelLimit,
              referenceStart >= 0, referenceStart <= context - pass,
              referenceEnd >= context, referenceEnd <= ContextPolicy.modelLimit else { return Int.max }
        guard pass < 256 else { return context }
        let rows = context - referenceStart
        return min(referenceEnd, referenceStart + ((rows + 255) / 256) * 256)
    }

    /// A tiny tail inside a matrix-prefill reference domain must not switch
    /// to the vector attention kernel. Dummy query rows are cropped before
    /// any state update, but they still count toward the physical Q x K bound.
    public static func queryRows(pass: Int, context: Int, referenceStart: Int = 0,
                                  referenceEnd: Int = ContextPolicy.modelLimit) -> Int {
        guard pass > 0, context >= pass, context <= ContextPolicy.modelLimit,
              referenceStart >= 0, referenceStart <= context - pass,
              referenceEnd >= context, referenceEnd <= ContextPolicy.modelLimit else { return Int.max }
        guard pass <= 8 else { return pass }
        let block = referenceStart + ((context - pass - referenceStart) / 256) * 256
        return min(256, referenceEnd - block) > 8 ? 64 : pass
    }

    public static func prefillBytes(pass: Int, context: Int, scope: Int = 0, attentionHeads: Int = 24,
                                    referenceStart: Int = 0, referenceEnd: Int = ContextPolicy.modelLimit,
                                    minimumProjectionRows: Int = 0, padSmallQueries: Bool = false) -> Int {
        guard pass > 0, pass <= 4096, attentionHeads > 0, scope >= 0, context >= pass, context <= ContextPolicy.modelLimit,
              (0 ... 256).contains(minimumProjectionRows),
              pass <= PrefillSchedule.measuredQueryKeyProduct / context else { return Int.max }
        let extent = keyExtent(pass: pass, context: context, referenceStart: referenceStart, referenceEnd: referenceEnd)
        let queries = padSmallQueries ? queryRows(pass: pass, context: context,
            referenceStart: referenceStart, referenceEnd: referenceEnd) : pass
        guard queries <= PrefillSchedule.measuredQueryKeyProduct / extent else { return Int.max }
        // Indexer score/mask/top-k and selected attention coexist with layer
        // activations. Preserve the original linear allowance; bound the
        // query-by-context part even when late passes fall below 256.
        return ContextBytes.sum(max(ContextBytes.product(max(pass, minimumProjectionRows), 1_300_000),
            ContextBytes.product(queries, extent, ContextBytes.sum(ContextBytes.product(attentionHeads, 8), 16))), ContextBytes.product(max(0, scope - pass), 32_768))
    }

    public static func visionBytes(patches: Int, hidden: Int = 1152, heads: Int = 16,
                                   queryTile: Int = 0, padding: Int = 0) -> Int {
        guard patches > 0, patches <= 9216, hidden > 0, heads > 0,
              [0, 256].contains(queryTile), [0, 80, 128].contains(padding),
              queryTile == 0 || padding == 0 else { return Int.max }
        // The pinned width-72 fallback materializes BF16 QK and softmax.
        // Each tile is evaluated before the next, so the candidate really
        // bounds Q by 256. Padding uses a different kernel; retain the full
        // original-score allowance until its resource gate is qualified.
        let queries = queryTile == 256 ? min(patches, 256) : patches
        return ContextBytes.sum(ContextBytes.product(queries, patches, heads, 4),
            ContextBytes.product(patches, hidden, 32))
    }
}

/// Count existing request values without formatting or serializing them first.
/// Depth and overflow fail closed before Jinja/JSON can copy the structure.
package enum ContextInputMemory {
    package static func bytes(_ value: Any, depth: Int = 0) -> Int {
        guard depth < 64 else { return Int.max }
        if let text = value as? String { return ContextBytes.sum(text.utf8.count, 16) }
        if let value = value as? JSONValue {
            switch value {
            case .string(let text): return ContextBytes.sum(text.utf8.count, 16)
            case .array(let values): return values.reduce(16) { ContextBytes.sum($0, bytes($1, depth: depth + 1)) }
            case .object(let values): return values.reduce(16) { ContextBytes.sum($0, $1.key.utf8.count, bytes($1.value, depth: depth + 1)) }
            default: return 32
            }
        }
        if let values = value as? [String: Any] {
            return values.reduce(16) { ContextBytes.sum($0, $1.key.utf8.count, bytes($1.value, depth: depth + 1)) }
        }
        if let values = value as? [Any] {
            return values.reduce(16) { ContextBytes.sum($0, bytes($1, depth: depth + 1)) }
        }
        return 32
    }
    package static func bytes(messages: [ChatMessage], tools: [ToolDefinition]) -> Int {
        let messagesBytes = messages.reduce(0) { sum, m in
            let calls = m.toolCalls.reduce(0) { ContextBytes.sum($0, $1.name.utf8.count, bytes(JSONValue.object($1.arguments))) }
            return ContextBytes.sum(sum, m.role.utf8.count, m.content.utf8.count, m.reasoning?.utf8.count ?? 0,
                m.toolCallId?.utf8.count ?? 0, m.toolName?.utf8.count ?? 0, calls, bytes(m.images), 256)
        }
        return tools.reduce(messagesBytes) { ContextBytes.sum($0, $1.name.utf8.count, $1.description.utf8.count, bytes($1.parameters), 256) }
    }
}

````````````

## Artifact SHA-256 9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316

Encoding: `utf-8`. Original bytes: 58066.

````````````text
// High-level engine: model + tokenizer + chat templating, shared by CLI/server.

import CoreGraphics
import Foundation
import MLX
import Tokenizers

public struct ChatMessage {
    public var role: String
    public var content: String
    /// An assistant turn's reasoning, rendered as `reasoning_content`. Clients
    /// that keep reasoning in history can replay it; fx does not send any.
    public var reasoning: String?
    /// Calls this assistant turn made.
    public var toolCalls: [ParsedToolCall]
    /// For a `tool` message: which call it answers.
    public var toolCallId: String?
    public var toolName: String?
    /// Pictures this turn carries, as inline bytes (a `data:` URL or bare
    /// base64) in the order the template should render them. Text-only paths
    /// leave it empty and behave exactly as before.
    public var images: [String] = []

    public init(role: String, content: String) {
        self.role = role
        self.content = content
        self.reasoning = nil
        self.toolCalls = []
        self.toolCallId = nil
        self.toolName = nil
    }

    public init(
        role: String, content: String, reasoning: String? = nil,
        toolCalls: [ParsedToolCall] = [], toolCallId: String? = nil, toolName: String? = nil
    ) {
        self.role = role
        self.content = content
        self.reasoning = reasoning
        self.toolCalls = toolCalls
        self.toolCallId = toolCallId
        self.toolName = toolName
    }

    /// The dictionary the chat template consumes.
    ///
    /// Tool-call arguments are bridged as an unordered dictionary because
    /// swift-jinja accepts nothing else, so the template's `arguments|items`
    /// follows Swift's hash order. That is why a generated assistant turn is
    /// spliced back as raw ids rather than re-rendered (`PrefixCache`): a
    /// re-render is semantically identical but not byte-identical, and the
    /// prefix cache matches on bytes.
    public var templateValue: [String: any Sendable] {
        var m: [String: any Sendable] = ["role": role, "content": content]
        // The template checks each content part for an `image`/`image_url`
        // key, so a turn with pictures has to arrive as parts rather than a
        // string. Images first, then the text: that is the order the template
        // numbers them in ("Picture 1: ..."), and the order
        // `Engine.imageSources` reads them back in.
        if !images.isEmpty {
            var parts: [[String: any Sendable]] = images.map {
                ["type": "image_url", "image_url": ["url": $0] as [String: any Sendable]]
            }
            if !content.isEmpty { parts.append(["type": "text", "text": content]) }
            m["content"] = parts
        }
        if let r = reasoning, !r.isEmpty { m["reasoning_content"] = r }
        if !toolCalls.isEmpty {
            m["tool_calls"] = toolCalls.map { call in
                [
                    "type": "function",
                    "function": [
                        "name": call.name,
                        "arguments": call.arguments.mapValues { $0.any },
                    ] as [String: any Sendable],
                ] as [String: any Sendable]
            }
        }
        return m
    }
}

public final class Engine {
    public let modelDir: URL
    public let model: Qwen4ExpModel
    public let generator: Generator
    public let tokenizer: any Tokenizers.Tokenizer
    public let eosIds: Set<Int>
    public let modelName: String
    /// Lazily-loaded vision tower (VLM). Loaded on the first request that
    /// carries an image and then cached; see `ensureVisionTower`.
    public private(set) var visionTower: VisionTower?
    /// Whether this process will accept images at all (`--vision`). False
    /// makes every image request a 400 that says so, rather than a surprise
    /// gigabyte.
    public var visionAllowed = true
    /// Whether the checkpoint carries a tower at all, read once at startup so
    /// the fx catalogue and `/api/show` can answer without touching it.
    public private(set) var visionAvailable = false
    /// Longest prompt accepted, at most `ContextPolicy.maxTokens` (the largest
    /// context that has been measured, see Context.swift). Unbounded prompts
    /// are not free: KV plus indexer state costs ~27 KiB per token, and a
    /// prompt is read in full before the first token, so a huge prompt is a
    /// long, memory-growing stall rather than a fast failure.
    private let contextLock = NSRecursiveLock()
    private var configuredContextTokens = ContextPolicy.defaultTokens
    private let allocatedContextTokens: Int
    private var contextAssignmentFailure: RequestFailure?
    public var maxContextTokens: Int {
        get { contextLock.withLock { configuredContextTokens } }
        set {
            contextLock.lock(); defer { contextLock.unlock() }
            if let why = ContextPolicy.validationError(newValue, qualification: currentPlan?.contextQualification ?? false) {
                contextAssignmentFailure = RequestFailure(.invalidConfiguration, why); return
            }
            guard newValue <= allocatedContextTokens else {
                contextAssignmentFailure = RequestFailure(.invalidConfiguration,
                    "context assignment exceeds this engine's allocated plan; construct a new Engine with a validated plan")
                return
            }
            contextAssignmentFailure = nil
            configuredContextTokens = newValue
            let capped = min(prefixCache.maxTokens, newValue)
            prefixCache.configure(maxTokens: capped)
            if let p = currentPlan {
                updatePlan(MemoryPlan(source: p.source, slots: p.slots, targetGB: p.targetGB,
                    ramGB: p.ramGB, workingSetGB: p.workingSetGB, ramPercent: p.ramPercent,
                    availableGB: p.availableGB, clamped: p.clamped, prefillChunk: p.prefillChunk,
                    prefixCacheTokens: capped, mtpEnabled: p.mtpEnabled, visionEnabled: p.visionEnabled,
                    visionResidentReserved: p.visionResidentReserved, maxContextTokens: newValue,
                    notes: p.notes, runtimeAllocationPolicy: p.runtimeAllocationPolicy,
                    maxPrefillWaitMinutes: p.maxPrefillWaitMinutes, contextQualification: p.contextQualification))
            }
        }
    }

    /// Call when a complete request is accepted, before tokenization or images.
    public func beginRequest(connected: @escaping () -> Bool = { true }) throws -> RequestController {
        if let override = requestControllerOverride {
            let control = try override(); try control.attachReservations(requestReservations); return control
        }
        if let contextAssignmentFailure = contextLock.withLock({ contextAssignmentFailure }) { throw contextAssignmentFailure }
        if let unavailable = planLock.withLock({ allocationUnavailable }) { throw unavailable }
        let configuration = try ContextConfiguration(maxContextTokens: maxContextTokens,
            maxPrefillWaitMinutes: currentPlan?.maxPrefillWaitMinutes ?? ContextConfiguration.defaultWaitMinutes,
            qualification: currentPlan?.contextQualification ?? false)
        let control = RequestController(configuration: configuration,
            slackBytes: Int(Planner.availabilitySlackGB(ramGB: currentPlan?.ramGB ?? Planner.deviceRAMGB()) * 1e9),
            connected: connected, pressure: { [weak self] in
                guard let self else { return true }
                return self.pressureBoundary.snapshot() != nil || self.osPressureLock.withLock { self.osPressure }
            })
        try control.attachReservations(requestReservations)
        return control
    }
    private let requestReservations = RequestMemoryReservations()

    // Package-only dependency seam for deterministic HTTP diagnostics. No wire
    // field or environment variable can install it.
    package var requestControllerOverride: (() throws -> RequestController)?

    public var contextPolicyJSON: [String: Any] {
        let plan = currentPlan
        return ["configured_window": maxContextTokens, "model_limit": ContextPolicy.modelLimit,
            "implementation_limit": ContextPolicy.implementationLimit,
            "mtp_limit": ContextPolicy.mtpLimit, "vision_limit": ContextPolicy.visionLimit,
            "max_prefill_wait_minutes": plan?.maxPrefillWaitMinutes ?? ContextConfiguration.defaultWaitMinutes,
            "wait_scope": "accepted_request_to_first_model_token",
            "qualification": plan?.contextQualification ?? false,
            "allocation_available": planLock.withLock { allocationUnavailable == nil },
            "estimate_scope": "measured M5 Pro anchors; unknown for unqualified pass sizes"]
    }

    deinit { pressureMonitor?.cancel() }

    private var allocationUnavailable: RequestFailure?
    package func setAllocationUnavailable(_ failure: RequestFailure?) {
        planLock.withLock { allocationUnavailable = failure }
    }

    private let osPressureLock = NSLock()
    private var osPressure = false
    private var pressureMonitor: DispatchSourceMemoryPressure?

    /// Retained conversation state, so a follow-up turn re-prefills only what
    /// is new. See PrefixCache for the extend-only rule and the memory story.
    public let prefixCache: PrefixCache

    /// Release the retained conversation state. Takes the generation lock, so
    /// never call it from inside `generate`.
    public func dropPrefixCache() {
        withExclusive { prefixCache.drop() }
    }

    /// nil when `promptTokens` fits, otherwise the message to return to the client.
    ///
    /// The message names the cap for what it is. It used to tell people to
    /// raise --max-context, which cannot go past the ceiling the server was
    /// already at.
    public func contextError(promptTokens: Int) -> String? {
        if let contextAssignmentFailure = contextLock.withLock({ contextAssignmentFailure }) { return contextAssignmentFailure.message }
        guard promptTokens < 0 || promptTokens > maxContextTokens else { return nil }
        return "context_length_exceeded: prompt is \(promptTokens) tokens, over the configured \(maxContextTokens)-token prompt-plus-reply window. Send less or restart with a larger supported --max-context; the model limit is \(ContextPolicy.modelLimit)."
    }
    /// The live memory plan (updated by the elastic governor on resize; nil
    /// for internal fixed-size uses). Guarded by its own lock so /api reads
    /// never block behind a running generation.
    private var _plan: MemoryPlan?
    private let planLock = NSLock()
    public var currentPlan: MemoryPlan? {
        planLock.lock()
        defer { planLock.unlock() }
        return _plan
    }
    public func updatePlan(_ p: MemoryPlan) {
        planLock.lock()
        _plan = p
        planLock.unlock()
    }

    private let lock = GenerationGate()
    package let pressureBoundary = PressureBoundary()
    // Immutable after startup, so the governor never reads mutable model
    // controls concurrently with a request changing its diagnostic options.
    package let responsiveGovernor: Bool

    /// Run `body` with the generation lock held — the governor uses this to
    /// resize the pool strictly between requests.
    public func withExclusive<T>(_ body: () throws -> T) rethrows -> T {
        lock.lock()
        defer { lock.unlock() }
        return try body()
    }

    @discardableResult
    package func tryWithExclusive(_ body: () -> Void) -> Bool {
        lock.tryWithExclusive(body)
    }

    /// Pool numbers for the metadata endpoints, published rather than read
    /// live. Reading SlotPool's mutable Swift arrays while the governor
    /// resizes is a data race, but taking the *generation* lock to avoid it
    /// made /api/tags and /api/ps block for the whole of a running request, so
    /// a client that polls either one saw a generating server as a hung one.
    private var _poolSnapshot: (slots: Int, slotsPerLayer: Double, poolBytes: Int) = (0, 0, 0)
    private let poolSnapshotLock = NSLock()

    public func poolSnapshot() -> (slots: Int, slotsPerLayer: Double, poolBytes: Int) {
        poolSnapshotLock.lock()
        defer { poolSnapshotLock.unlock() }
        return _poolSnapshot
    }

    /// Re-read the pool and publish it. **Call with the generation lock held**
    /// (inside `withExclusive`), which is where every resize already happens.
    public func publishPoolSnapshot() {
        let s = (model.pool.slots, model.pool.slotsPerLayer, model.pool.poolBytes)
        poolSnapshotLock.lock()
        _poolSnapshot = s
        poolSnapshotLock.unlock()
    }

    public convenience init(modelDir: URL, plan: MemoryPlan) async throws {
        try await self.init(modelDir: modelDir, poolSlots: plan.slots, plan: plan)
    }

    public init(modelDir: URL, poolSlots: Int, plan: MemoryPlan? = nil) async throws {
        // A plan made for a simulated machine may be printed and compared,
        // never loaded. Simulating memory the machine does not have still
        // allocates for real: on 2026-08-30 a simulated 60 GB drove a 25.4 GB
        // allocation and 39 GB of swap. The flag travels on the plan so this
        // cannot be forgotten at a call site.
        if plan?.simulated == true { throw SlotstreamError.simulatedDeviceCannotLoad }
        let context = try ContextConfiguration(maxContextTokens: plan?.maxContextTokens ?? ContextPolicy.defaultTokens,
            maxPrefillWaitMinutes: plan?.maxPrefillWaitMinutes ?? ContextConfiguration.defaultWaitMinutes,
            qualification: plan?.contextQualification ?? false)
        guard poolSlots >= Geometry.floorSlots, poolSlots <= Geometry.totalRecords,
              plan == nil || plan?.slots == poolSlots else {
            throw SlotstreamError.invalidPlan("engine pool must match a supported memory plan")
        }
        let initialLedger = plan?.memoryLedger ?? ContextMemoryLedger(slots: poolSlots,
            context: context.maxContextTokens, chunk: 256,
            retentionTokens: Planner.prefixCacheTokensFor(poolBudgetGB: Geometry.gb(poolSlots)),
            mtp: false, visionResident: false)
        let initial = RequestController(configuration: context,
            slackBytes: Int(Planner.availabilitySlackGB(ramGB: plan?.ramGB ?? Planner.deviceRAMGB()) * 1e9))
        try initial.check(nextAllocationBytes: initialLedger.expectedPeakBytes, phase: "model allocation")
        self.allocatedContextTokens = context.maxContextTokens
        self.configuredContextTokens = context.maxContextTokens
        self.modelDir = modelDir
        self._plan = plan
        // Sized from the same budget as the pool; SLOTSTREAM_PREFIX_CACHE=0
        // (or --no-prefix-cache) pins it off for parity work.
        let env = ProcessInfo.processInfo.environment["SLOTSTREAM_PREFIX_CACHE"]
        self.prefixCache = PrefixCache(
            maxTokens: plan?.prefixCacheTokens
                ?? Planner.prefixCacheTokensFor(poolBudgetGB: Geometry.gb(poolSlots)),
            enabled: env != "0" && (plan?.runtimeAllocationPolicy?.prefixCacheEnabled ?? true))
        if let p = plan, p.runtimeAllocationPolicy != nil { prefixCache.setBudgetLimit(p.prefixCacheTokens) }
        // MLX's allocator otherwise retains freed transients (KV caches,
        // activations) in an unbounded internal cache — measured ~5 GB of RSS
        // above the memory plan after a few dozen requests. 2 GB keeps
        // per-token reallocation churn away while making real process memory
        // track the announced plan.
        MLX.Memory.cacheLimit = 2 << 30
        self.modelName = "qwen3.8-flash-next:4bit"
        let t0 = Date()
        let index = try CheckpointIndex(dir: modelDir)
        self.model = try Qwen4ExpModel(index: index, poolSlots: poolSlots)
        self.responsiveGovernor = model.optimizations.responsiveGovernor
        try model.validate()
        // Read from the index that is already open — no tensor is touched, and
        // nothing is allocated until an image actually arrives.
        self.visionAvailable = VisionTower.present(index: index)
        self.visionAllowed = plan?.visionEnabled ?? visionAvailable
        if plan?.mtpEnabled == true {
            try model.enableMTP(modelDir: modelDir)
        }
        self.generator = Generator(model: model)
        if let p = plan, p.runtimeAllocationPolicy != nil {
            generator.setPrefillBudgetCeiling(p.prefillChunk)
            generator.prefillChunk = p.prefillChunk
        }
        if let p = plan, ProcessInfo.processInfo.environment["SLOTSTREAM_PREFILL_CHUNK"] == nil {
            generator.prefillChunk = p.prefillChunk
        }
        if let mb = Int(ProcessInfo.processInfo.environment["SLOTSTREAM_PREFILL_CACHE_MB"] ?? "") {
            generator.prefillCacheLimit = max(0, mb) << 20
        } else if let p = plan, p.expectedPeakGB <= 12 {
            generator.prefillCacheLimit = 512 << 20
        }
        self.tokenizer = try await AutoTokenizer.from(modelFolder: modelDir)
        var eos: Set<Int> = [index.config.eosTokenId]
        if let e = tokenizer.eosTokenId { eos.insert(e) }
        // generation_config may list several
        if let d = try? Data(contentsOf: modelDir.appendingPathComponent("generation_config.json")),
            let o = try? JSONSerialization.jsonObject(with: d) as? [String: Any]
        {
            if let list = o["eos_token_id"] as? [Int] { list.forEach { eos.insert($0) } }
            if let one = o["eos_token_id"] as? Int { eos.insert(one) }
        }
        self.eosIds = eos
        publishPoolSnapshot()
        let monitor = DispatchSource.makeMemoryPressureSource(eventMask: [.normal, .warning, .critical],
            queue: DispatchQueue(label: "slotstream.request-pressure"))
        monitor.setEventHandler { [weak self, weak monitor] in
            guard let self, let monitor else { return }
            self.osPressureLock.withLock { self.osPressure = !monitor.data.contains(.normal) }
        }
        monitor.resume(); pressureMonitor = monitor
        let banner = "engine ready in \(String(format: "%.1f", -t0.timeIntervalSinceNow))s: "
            + "expert cache ~\(String(format: "%.0f", model.pool.slotsPerLayer))/\(model.cfg.numExperts) per layer "
            + "(\(model.pool.slots) global slots = \(String(format: "%.1f", Double(model.pool.poolBytes) / 1e9)) GB), "
            + (model.mtpHead != nil ? "mtp draft head on, " : "")
            + "eos \(eos.sorted())\n"
        FileHandle.standardError.write(banner.data(using: .utf8)!)
    }

    public func encodeChat(_ messages: [ChatMessage], thinking: Bool) throws -> [Int] {
        try encodeChat(messages, tools: [], thinking: thinking, effort: nil)
    }

    /// Render a conversation that may declare tools and replay tool calls.
    ///
    /// `tools` empty renders no `<tools>` block at all, which is what the
    /// Ollama and OpenAI dialects pass, so their bytes are unchanged.
    public func encodeChat(
        _ messages: [ChatMessage], tools: [ToolDefinition], thinking: Bool, effort: String?
    ) throws -> [Int] {
        try tokenizer.applyChatTemplate(
            messages: messages.map { $0.templateValue },
            tools: tools.isEmpty ? nil : tools.map { $0.templateValue },
            additionalContext: Self.additionalContext(thinking: thinking, effort: effort))
    }

    /// Encode a conversation, substituting the exact ids this server generated
    /// for any assistant turn it can still prove it produced.
    ///
    /// Why this exists. The prefix cache matches on bytes, and it must: the GDN
    /// recurrent state is a fold over the tokens it consumed, with no inverse,
    /// so a state may only be extended by the very ids that built it. A client
    /// replaying history does not send those ids — it sends its own view of the
    /// turn, which the template then re-renders. Whenever that re-render
    /// differs by a single byte, the next turn rebuilds the whole prompt.
    ///
    /// With reasoning ON that is not an edge case, it is every turn: fx (and
    /// most clients) never echo reasoning back, so the re-render is missing the
    /// `<think>` block the model actually produced, and the state cannot match.
    /// Measured on this machine, a two-turn tool loop reused 303 of 325 tokens
    /// with reasoning off and 0 of 349 with it on — three and a half times the
    /// wall time for the identical second turn.
    ///
    /// The splice closes that. For each assistant turn, ask the cache whether it
    /// still holds a state whose ids begin with exactly the prompt that turn was
    /// generated from; if it does, the remainder of those ids *is* that turn,
    /// verbatim. Check that the remainder really describes the turn the client
    /// sent (same calls, same arguments, same text) and then use the held ids in
    /// place of the re-render, tokenizing only the conversation after it.
    ///
    /// Splitting the text at `<|im_end|>` is safe because it is an added token
    /// and therefore a hard tokenizer boundary: the suffix tokenizes identically
    /// whether or not the text before it is present. That is measured, not
    /// assumed — see the `chat-splice` check.
    ///
    /// Any mismatch anywhere falls back to the plain render, which is the
    /// behaviour that existed before. The splice can make a turn cheaper; it can
    /// never make one wrong.
    public func encodeChatSpliced(
        _ messages: [ChatMessage], tools: [ToolDefinition], thinking: Bool, effort: String?
    ) throws -> [Int] {
        let full = try encodeChat(messages, tools: tools, thinking: thinking, effort: effort)
        guard prefixCache.enabled, messages.contains(where: { $0.role == "assistant" })
        else { return full }
        let fullText = tokenizer.decode(tokens: full, skipSpecialTokens: false)

        var spliced: [Int] = []  // ids exactly as the model saw or produced them
        var consumed = 0  // characters of fullText those ids already cover
        var didSplice = false

        func index(_ offset: Int) -> String.Index {
            fullText.index(fullText.startIndex, offsetBy: offset)
        }

        for k in messages.indices where messages[k].role == "assistant" {
            guard
                let headIds = try? encodeChat(
                    Array(messages[0..<k]), tools: tools, thinking: thinking, effort: effort)
            else { break }
            let headText = tokenizer.decode(tokens: headIds, skipSpecialTokens: false)
            guard fullText.hasPrefix(headText), headText.count >= consumed else { break }
            // The ids that produced turn k: what is already spliced, plus the
            // conversation between there and this turn's generation prompt.
            let bridge = String(fullText[index(consumed)..<index(headText.count)])
            let producer =
                spliced + (bridge.isEmpty ? [] : tokenizer.encode(text: bridge, addSpecialTokens: false))
            guard let entry = prefixCache.peek(extending: producer) else { break }
            let generated = Array(entry[producer.count...])
            let genText = tokenizer.decode(tokens: generated, skipSpecialTokens: false)
            guard Self.spliceDescribes(genText, messages[k], tools: tools) else { break }
            guard
                let end = fullText.range(
                    of: "<|im_end|>", range: index(headText.count)..<fullText.endIndex)
            else { break }
            spliced = entry
            consumed = fullText.distance(from: fullText.startIndex, to: end.lowerBound)
            didSplice = true
        }

        guard didSplice else { return full }
        let tail = String(fullText[index(consumed)...])
        return spliced + tokenizer.encode(text: tail, addSpecialTokens: false)
    }

    /// Does this generated text describe the assistant turn the client sent?
    ///
    /// Deliberately compares meaning rather than bytes: the client's copy has
    /// been through its own JSON round trip, so whitespace and argument order
    /// may differ, but the calls it reports must be the calls that were made.
    /// Reasoning is ignored — the client dropping it is the whole reason the
    /// splice is needed.
    public static func spliceDescribes(
        _ generated: String, _ message: ChatMessage, tools: [ToolDefinition]
    ) -> Bool {
        let (_, body) = ThinkSplitter.split(generated)
        let visible = body.isEmpty && !generated.contains("</think>") ? generated : body
        let events = ToolCallSplitter.parseAll(visible, tools: tools.map { $0.schema })
        var calls: [ParsedToolCall] = []
        var text = ""
        for e in events {
            switch e {
            case .toolCall(let c): calls.append(c)
            case .text(let t): text += t
            case .malformed: return false
            default: break
            }
        }
        guard calls.count == message.toolCalls.count else { return false }
        for (a, b) in zip(calls, message.toolCalls) {
            guard a.name == b.name, a.arguments == b.arguments else { return false }
        }
        // The text is compared after trimming only. A client that rewrites the
        // assistant's prose is describing a different turn, and re-rendering it
        // is then the correct answer.
        return text.trimmingCharacters(in: .whitespacesAndNewlines)
            == message.content.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    static func additionalContext(thinking: Bool, effort: String?) -> [String: any Sendable] {
        var ctx: [String: any Sendable] = ["enable_thinking": thinking]
        if let e = effort, thinking { ctx["reasoning_effort"] = e }
        return ctx
    }

    /// Render a template without constructing the multi-GB model. Installer
    /// and API acceptance checks run this while a server is already live; the
    /// old implementation built a second Engine merely to load the tokenizer,
    /// so the singleton guard correctly rejected the check it was meant to run.
    public static func encodeChatWithoutModel(
        modelDir: URL, messages: [ChatMessage], thinking: Bool,
        tools: [ToolDefinition] = [], effort: String? = nil
    ) async throws -> [Int] {
        let tokenizer = try await AutoTokenizer.from(modelFolder: modelDir)
        return try tokenizer.applyChatTemplate(
            messages: messages.map { $0.templateValue },
            tools: tools.isEmpty ? nil : tools.map { $0.templateValue },
            additionalContext: additionalContext(thinking: thinking, effort: effort))
    }

    /// OpenAI path: messages already contain image_url parts, and content may
    /// be String or [[String: Any]] (vision). The nested arrays must be
    /// bridged to the tokenizer's `[String: any Sendable]` messages or the
    /// vision parts are silently dropped before the Jinja template can render
    /// them as <|image_pad|>.
    public func encodeChatOpenAI(
        messages: [[String: Any]], tools: [[String: Any]]?, thinking: Bool = false
    ) throws -> [Int] {
        func toSendable(_ v: Any) -> any Sendable {
            if let arr = v as? [[String: Any]] {
                return arr.map { d -> [String: any Sendable] in
                    var out: [String: any Sendable] = [:]
                    for (k, vv) in d { out[k] = toSendable(vv) }
                    return out
                } as any Sendable
            }
            if let d = v as? [String: Any] {
                var out: [String: any Sendable] = [:]
                for (k, vv) in d { out[k] = toSendable(vv) }
                return out as any Sendable
            }
            if let a = v as? [Any] {
                return a.map { toSendable($0) } as any Sendable
            }
            return v as any Sendable
        }
        let msgs: [[String: any Sendable]] = messages.map { dict in
            var m: [String: any Sendable] = [:]
            for (k, v) in dict { m[k] = toSendable(v) }
            return m
        }
        let toolSpecs: [[String: any Sendable]]? = tools?.map { dict in
            var t: [String: any Sendable] = [:]
            for (k, v) in dict { t[k] = toSendable(v) }
            return t
        }
        return try tokenizer.applyChatTemplate(
            messages: msgs, tools: toolSpecs, additionalContext: ["enable_thinking": thinking])
    }

    // MARK: Vision

    /// Load the vision tower on first use, and only if the machine can spare
    /// it right now.
    ///
    /// **Under the generation lock, not a lock of its own.** Loading is
    /// ~0.9 GB of MLX arrays plus an `eval`; a private lock let that run on a
    /// connection thread while another request was mid-generation, which is
    /// exactly the concurrent GPU work every other allocation path in this
    /// file serializes. `withExclusive` is that serialization, and it also
    /// makes the availability reading below meaningful: nothing else can
    /// allocate between reading it and taking the memory.
    ///
    /// Replan before allocation so a target-driven process pays for the
    /// tower with expert capacity. Also require real machine headroom: an
    /// accounting allowance is not proof that physical memory is available.
    public func ensureVisionTower() throws -> VisionTower { try ensureVisionTower(request: nil) }

    public func ensureVisionTower(request: RequestController?, workspaceBytes: Int = 0) throws -> VisionTower {
        guard workspaceBytes >= 0 else {
            throw RequestFailure(.invalidConfiguration, "vision workspace bytes must be nonnegative")
        }
        guard visionAllowed else {
            throw SlotstreamError.vision(
                "this server was started with --vision off; images are not accepted")
        }
        if let request { try lock.lock(request: request) } else { lock.lock() }
        defer { lock.unlock() }
        return try { () throws -> VisionTower in
            try request?.check(nextAllocationBytes: visionTower == nil ? 1_900_000_000 : 0, phase: "vision tower allocation")
            if pressureBoundary.snapshot() != nil {
                let failure = RequestFailure(.insufficientMemory, "memory pressure interrupted image preparation; retry after the cache resizes")
                throw request?.fail(failure) ?? failure
            }
            let reservedPlan: MemoryPlan?
            do { reservedPlan = try currentPlan.map { try Planner.loadingVision($0) } }
            catch {
                let failure = RequestFailure(.insufficientMemory, "vision allocation cannot fit the current plan: \(error)")
                throw request?.fail(failure) ?? failure
            }
            if let charged = reservedPlan {
                let ledger = charged.memoryLedger
                let peak = ContextBytes.sum(ledger.expectedPeakBytes - ledger.prefillBytes,
                    max(ledger.prefillBytes, workspaceBytes))
                if let target = charged.targetGB, Double(peak) > target * 1e9 {
                    var failure = RequestFailure(.insufficientMemory,
                        "image attention workspace exceeds this process memory target; resize the image or raise --memory-gb")
                    failure.requiredBytes = peak
                    failure.availableBytes = target < Double(Int.max) / 1e9 ? Int(target * 1e9) : Int.max
                    throw request?.fail(failure) ?? failure
                }
            }
            try request?.check(nextAllocationBytes: workspaceBytes, phase: "vision workspace admission")
            if let vt = visionTower { return vt }
            let idx = try CheckpointIndex(dir: modelDir)
            guard VisionTower.present(index: idx) else {
                throw SlotstreamError.vision(
                    "this checkpoint has no vision tower — it is a text-only model")
            }
            let needGB = Double(VisionTower.residentBytes(index: idx)) / 1e9
            guard needGB <= Planner.visionResidentGB else {
                throw SlotstreamError.vision("vision weights exceed the supported resident allowance")
            }
            if let avail = Planner.deviceAvailableGB(), avail.isFinite,
                avail < needGB + Planner.visionLoadMarginGB
            {
                let failure = RequestFailure(.insufficientMemory, String(
                        format: "the vision tower needs %.1f GB and only %.1f GB is reclaimable "
                            + "right now — close other apps and retry, or restart with a lower "
                            + "--memory-gb so the tower fits",
                        needGB, avail))
                throw request?.fail(failure) ?? failure
            }
            if let p = reservedPlan {
                // The lock excludes generation and governor mutation. Shrink
                // releases the old arena before allocating the smaller one.
                model.pool.resize(to: p.slots)
                if p.runtimeAllocationPolicy != nil {
                    generator.setPrefillBudgetCeiling(p.prefillChunk)
                    prefixCache.setBudgetLimit(p.prefixCacheTokens)
                }
                generator.prefillChunk = min(generator.prefillChunk, p.prefillChunk)
                prefixCache.configure(maxTokens: min(prefixCache.maxTokens, p.prefixCacheTokens))
                MLX.Memory.clearCache()
                updatePlan(p)
                publishPoolSnapshot()
            }
            let vt = try VisionTower(index: idx)
            self.visionTower = vt
            return vt
        }()
    }

    /// Tokenize with vision expansion: each template image_pad is worth
    /// N_merged real tokens, so the template's single pad is expanded to a run
    /// of pads that the tower's embeddings will fill. Returns the expanded ids
    /// and a `VisionPrompt` when the request carries images, nil otherwise.
    ///
    /// The tower does not run here. The run lengths come from each image's
    /// dimensions, so the ids — and with them the prefix cache key — are ready
    /// before any pixels are read. `Generator.generate` asks the cache first
    /// and then encodes only the images that the reused state does not cover.
    public func encodeWithVision(
        messages: [[String: Any]], tools: [[String: Any]]?, thinking: Bool = false
    ) throws -> ([Int], VisionPrompt?) {
        try encodeWithVision(messages: messages, tools: tools, thinking: thinking, request: nil)
    }

    public func encodeWithVision(
        messages: [[String: Any]], tools: [[String: Any]]?, thinking: Bool = false,
        request: RequestController?
    ) throws -> ([Int], VisionPrompt?) {
        let request: RequestController? = try request ?? beginRequest()
        try request?.attachReservations(requestReservations)
        try request?.checkInputBytes(ContextBytes.sum(ContextInputMemory.bytes(messages), ContextInputMemory.bytes(tools ?? [])))
        let baseIds = try encodeChatOpenAI(messages: messages, tools: tools, thinking: thinking)
        return try withImages(baseIds: baseIds, sources: Self.imageSources(in: messages), request: request)
    }

    /// The typed path (`ChatMessage`), for the fx gateway and the CLI. Renders
    /// through the same template as `encodeChat` and then expands the same
    /// placeholders.
    public func encodeChatWithVision(
        _ messages: [ChatMessage], tools: [ToolDefinition] = [], thinking: Bool = false,
        effort: String? = nil
    ) throws -> ([Int], VisionPrompt?) {
        try encodeChatWithVision(messages, tools: tools, thinking: thinking, effort: effort, request: nil)
    }

    public func encodeChatWithVision(
        _ messages: [ChatMessage], tools: [ToolDefinition] = [], thinking: Bool = false,
        effort: String? = nil, request: RequestController?
    ) throws -> ([Int], VisionPrompt?) {
        let request: RequestController? = try request ?? beginRequest()
        try request?.attachReservations(requestReservations)
        try request?.checkInputBytes(ContextInputMemory.bytes(messages: messages, tools: tools))
        let baseIds = try encodeChat(messages, tools: tools, thinking: thinking, effort: effort)
        return try withImages(baseIds: baseIds, sources: messages.flatMap { $0.images }, request: request)
    }

    /// Expand each `<|image_pad|>` the template rendered into the run of
    /// placeholders its image is worth, and describe the images for the tower
    /// and the prefix cache. Shared by every surface so they cannot drift.
    private func withImages(baseIds: [Int], sources: [String], request: RequestController? = nil) throws -> ([Int], VisionPrompt?) {
        defer { request?.releaseDispatchReservation() }
        try request?.check(phase: "prompt preparation")
        if sources.isEmpty { return (baseIds, nil) }
        let started = RuntimeClock.now()
        let observer = generator.footprintSampling ? FootprintSampler() : nil
        let vmBefore = generator.footprintSampling ? ProcessMemory.vmActivity() : nil
        var observationFinished = false
        defer { if !observationFinished { _ = observer?.finish() } }
        // Decode and hash first: it needs no tower, it is cheap next to one,
        // and a malformed picture should be a 400 before the process commits
        // 0.9 GB to a tower it may not otherwise need.
        var decoded: [(cg: CGImage, hash: ImageHash)] = []
        let sourceBatch = DecodedImageBatch(deduplicate: model.optimizations.deduplicateImages)
        decoded.reserveCapacity(sources.count)
        for (i, source) in sources.enumerated() {
            try request?.check(nextAllocationBytes: min(source.utf8.count, VisionPreprocess.maxImageBytes * 2), phase: "image source decoding")
            do {
                let data = try VisionPreprocess.loadImageData(from: source)
                decoded.append(try sourceBatch.decode(data, request: request))
            } catch let failure as RequestFailure { throw failure }
            catch { throw SlotstreamError.vision("image \(i + 1): \(error)") }
        }
        let decodedSeconds = RuntimeClock.seconds(since: started)
        let (visionConfig, pixelBounds) = try VisionTower.configuration(directory: modelDir)
        var items: [VisionPrompt.Item] = []
        items.reserveCapacity(decoded.count)
        var expandedCount = baseIds.count
        for (i, d) in decoded.enumerated() {
            try request?.check(phase: "image geometry")
            do {
                let plan = try VisionTower.plan(height: d.cg.height, width: d.cg.width,
                    cfg: visionConfig, bounds: pixelBounds)
                let (next, overflow) = expandedCount.addingReportingOverflow(plan.mergedTokens - 1)
                guard !overflow, next <= min(maxContextTokens, ContextPolicy.visionLimit) else {
                    throw RequestFailure(.contextLengthExceeded,
                        "image-expanded input exceeds the configured or qualified vision context; reduce the history or image count")
                }
                expandedCount = next
                items.append(VisionPrompt.Item(image: d.cg, plan: plan))
            } catch let failure as RequestFailure { throw failure }
            catch { throw SlotstreamError.vision("image \(i + 1): \(error)") }
        }
        let towerStart = RuntimeClock.now()
        let workspace = items.map { ContextWorkspace.visionBytes(patches: $0.plan.patches,
            hidden: visionConfig.hiddenSize, heads: visionConfig.numHeads,
            queryTile: model.optimizations.visionQueryTile, padding: model.optimizations.visionAttentionPadding) }.max() ?? 0
        let vt = try ensureVisionTower(request: request, workspaceBytes: ContextBytes.sum(workspace, sourceBatch.chargedBytes))
        let towerReadySeconds = RuntimeClock.seconds(since: towerStart)
        // The template renders one `<|image_pad|>` per image; the tower
        // produces `mergedTokens` rows for it. Expanding the pad into a run of
        // that length is what makes the two line up, and it moves every token
        // after the first image — ids and segment offsets alike, in one sweep,
        // so a later prompt that extends this one keys identically.
        let imageId = model.cfg.imageTokenId
        let perImage = items.map { $0.plan.mergedTokens }
        var expanded: [Int] = []
        var segments: [ImageSegment] = []
        expanded.reserveCapacity(baseIds.count + perImage.reduce(0, +) - perImage.count)
        var imgIdx = 0
        for tok in baseIds {
            if tok == imageId, imgIdx < perImage.count {
                segments.append(
                    ImageSegment(
                        start: expanded.count, count: perImage[imgIdx], hash: decoded[imgIdx].hash))
                expanded.append(contentsOf: repeatElement(imageId, count: perImage[imgIdx]))
                imgIdx += 1
            } else {
                expanded.append(tok)
            }
        }
        // Both directions are checked. Too few placeholders means the template
        // did not render an image this code found; too many means something
        // else in the prompt tokenized to the placeholder id — a user who
        // typed the literal `<|image_pad|>`, for instance. Either way the rows
        // and the runs would not correspond, so the request stops here rather
        // than putting embeddings under the wrong tokens.
        guard imgIdx == items.count else {
            throw SlotstreamError.vision(
                "the chat template rendered \(imgIdx) image placeholders for \(items.count) "
                    + "images; slotstream cannot place the rest")
        }
        let placeholders = expanded.reduce(0) { $0 + ($1 == imageId ? 1 : 0) }
        guard placeholders == perImage.reduce(0, +) else {
            throw SlotstreamError.vision(
                "the prompt carries \(placeholders) image placeholder tokens but the images "
                    + "account for \(perImage.reduce(0, +)); remove any literal <|image_pad|> "
                    + "from the text")
        }
        guard expanded.count <= min(maxContextTokens, ContextPolicy.visionLimit) else {
            throw RequestFailure(.contextLengthExceeded, "image-expanded input exceeds the configured or qualified vision context limit")
        }
        let prompt = VisionPrompt(tower: vt, items: items, segments: segments, hiddenSize: model.cfg.hiddenSize)
        prompt.preparationRequest = request
        prompt.preparationObservation = ImagePreparationObservation(
            seconds: RuntimeClock.seconds(since: started), sourceDecodeSeconds: decodedSeconds,
            towerReadySeconds: towerReadySeconds, sampledFootprint: observer?.finish(),
            vmBefore: vmBefore, vmAfter: generator.footprintSampling ? ProcessMemory.vmActivity() : nil,
            sourceDecodedImages: sourceBatch.decodedImages, sourceReusedImages: sourceBatch.reusedImages,
            sourceAdmissionBytes: sourceBatch.chargedBytes)
        observationFinished = true
        return (expanded, prompt)
    }

    /// Every image a request carries, in the order the chat template will
    /// render them: message by message, part by part, and Ollama's per-message
    /// `images` array after that message's content parts — which is where the
    /// template puts them too.
    public static func imageSources(in messages: [[String: Any]]) -> [String] {
        var out: [String] = []
        for m in messages {
            if let content = m["content"] as? [[String: Any]] {
                for part in content {
                    if let iu = part["image_url"] as? [String: Any], let u = iu["url"] as? String {
                        out.append(u)
                    } else if let u = part["image_url"] as? String {
                        out.append(u)
                    } else if let u = part["image"] as? String {
                        out.append(u)
                    }
                }
            }
            for b64 in (m["images"] as? [String] ?? []) { out.append(b64) }
        }
        return out
    }

    /// Earliest position at which any stop sequence occurs, or nil.
    private static func stopIndex(_ text: String, _ stops: [String]) -> String.Index? {
        var best: String.Index?
        for s in stops {
            if let r = text.range(of: s), best == nil || r.lowerBound < best! {
                best = r.lowerBound
            }
        }
        return best
    }

    /// Serialized generation (single-flight; callers queue on the lock).
    ///
    /// Incremental detokenization consumes bounded groups of token ids, keeping
    /// incomplete UTF-8 bytes at the group boundary. Two rules matter:
    ///
    /// - Emission and stop holdback are by Unicode scalar, never Character. A
    ///   later token can contribute a scalar that merges into the grapheme
    ///   already sent (an emoji plus U+FE0F is still one Character).
    /// - While stop sequences are active, the last `maxStopLength - 1` scalars
    ///   are withheld, so the prefix of a stop sequence that straddles a token
    ///   boundary is never emitted before the rest of it arrives. Whatever is
    ///   still held back is flushed once generation ends.
    ///
    /// The invariant the tests hold this to: concatenating every streamed delta
    /// reproduces the non-streamed text exactly.
    public func generate(
        promptIds: [Int], params: SampleParams, vision: VisionPrompt? = nil,
        shouldContinue: (() -> Bool)? = nil,
        onToken: ((Int, String) -> Bool)? = nil
    ) -> (text: String, ids: [Int], stats: GenStats) {
        generate(promptIds: promptIds, params: params, vision: vision,
            shouldContinue: shouldContinue, onToken: onToken, request: nil)
    }

    public func generate(
        promptIds: [Int], params: SampleParams, vision: VisionPrompt? = nil,
        shouldContinue: (() -> Bool)? = nil,
        onToken: ((Int, String) -> Bool)? = nil,
        request: RequestController?, onAdmitted: (() -> Bool)? = nil
    ) -> (text: String, ids: [Int], stats: GenStats) {
        let requestStart = RuntimeClock.now()
        let control: RequestController
        do {
            if let contextAssignmentFailure = contextLock.withLock({ contextAssignmentFailure }) { throw contextAssignmentFailure }
            if let unavailable = planLock.withLock({ allocationUnavailable }) { throw unavailable }
            control = try request ?? beginRequest()
            try control.attachReservations(requestReservations)
            guard control.configuration.maxContextTokens <= allocatedContextTokens else {
                throw RequestFailure(.invalidConfiguration, "request policy exceeds the allocated engine window")
            }
            if let why = contextError(promptTokens: promptIds.count) {
                throw RequestFailure(.contextLengthExceeded, why)
            }
            guard promptIds.count <= control.configuration.maxContextTokens else {
                throw RequestFailure(.contextLengthExceeded, "prompt exceeds this request's configured context window")
            }
            try lock.lock(request: control)
        } catch {
            var stats = GenStats(); stats.promptTokens = promptIds.count
            let failure = error as? RequestFailure ?? RequestFailure(.inferenceError, String(describing: error))
            stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
            stats.memoryPressureCancelled = failure.code == .insufficientMemory
            if failure.code == .insufficientMemory, let ticket = pressureBoundary.snapshot() {
                stats.memoryPressureBoundarySeconds = RuntimeClock.seconds(since: ticket.requestedAt)
            }
            stats.requestSeconds = request?.elapsedSeconds ?? RuntimeClock.seconds(since: requestStart)
            return ("", [], stats)
        }
        let queueSeconds = RuntimeClock.seconds(since: requestStart)
        let preparationSeconds = max(0, control.elapsedSeconds - queueSeconds)
        defer { control.releaseDispatchReservation(); lock.unlock() }
        var params = params.sanitized()
        // A queued request may acquire the lock before the waiting governor.
        // Refuse it before image encoding, cache checkout or GPU allocation.
        if let ticket = pressureBoundary.snapshot() {
            var stats = GenStats()
            stats.promptTokens = promptIds.count
            stats.memoryPressureCancelled = true
            let failure = control.fail(RequestFailure(.insufficientMemory,
                "memory pressure interrupted inference; retry after the cache resizes"))
            stats.requestFailure = failure; stats.runtimeError = failure.message
            stats.finishReason = "error"
            stats.memoryPressureBoundarySeconds = RuntimeClock.seconds(since: ticket.requestedAt)
            stats.peakMemoryGB = ProcessMemory.peakResidentGB
            stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
            stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
            stats.cachedRouterBytes = model.cachedRouterBytes
            stats.queueSeconds = queueSeconds
            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
            return ("", [], stats)
        }
        let modeLimit = vision == nil ? ContextPolicy.modelLimit : ContextPolicy.visionLimit
        let effectiveWindow = min(maxContextTokens, control.configuration.maxContextTokens, modeLimit)
        guard promptIds.count <= effectiveWindow else {
            let failure = control.fail(RequestFailure(.contextLengthExceeded,
                "prompt exceeds the configured or qualified vision context window"))
            var stats = GenStats(); stats.promptTokens = promptIds.count
            stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
            stats.queueSeconds = queueSeconds; stats.preparationSeconds = preparationSeconds
            return ("", [], stats)
        }
        let room = max(0, effectiveWindow - promptIds.count)
        if room == 0 {
            if onAdmitted?() == false { control.cancel() }
            var stats = GenStats()
            if let failure = control.failure {
                stats.requestFailure = failure; stats.runtimeError = failure.message
            }
            stats.promptTokens = promptIds.count
            stats.finishReason = control.failure == nil ? "length" : "error"
            stats.peakMemoryGB = ProcessMemory.peakResidentGB
            stats.cachedRouterBytes = model.cachedRouterBytes
            stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
            stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
            stats.queueSeconds = queueSeconds
            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
            return ("", [], stats)
        }
        // Context is prompt + completion, not two independent 32k allowances.
        params.maxTokens = min(params.maxTokens, room)
        let stops = params.stop
        let holdBack = stops.isEmpty
            ? 0 : max(0, (stops.map { $0.unicodeScalars.count }.max() ?? 1) - 1)
        var pendingIds: [Int] = []
        var withheld = ""
        var delivered = ""
        var lastTok = -1
        var clientGone = false
        var stopFound = false
        var firstTextSeconds: Double?
        var pressureObserved: PressureTicket?
        var pressureBoundarySeconds: Double?

        func observePressure() -> Bool {
            guard let ticket = pressureBoundary.snapshot() else { return false }
            control.fail(RequestFailure(.insufficientMemory,
                "memory pressure interrupted inference; retry after the cache resizes"))
            if pressureObserved == nil {
                pressureObserved = ticket
                pressureBoundarySeconds = RuntimeClock.seconds(since: ticket.requestedAt)
            }
            return true
        }

        func emit(_ delta: String, _ tok: Int) -> Bool {
            if delta.isEmpty { return true }
            delivered += delta
            guard let cb = onToken else { return true }
            if firstTextSeconds == nil { firstTextSeconds = RuntimeClock.seconds(since: requestStart) }
            return cb(tok, delta)
        }

        /// Feed a stable decoded piece through the stop-sequence holdback.
        func feed(_ piece: String, final: Bool, tok: Int) -> Bool {
            withheld += piece
            if !stops.isEmpty, let cut = Self.stopIndex(withheld, stops) {
                _ = emit(String(withheld[..<cut]), tok)
                withheld = ""
                stopFound = true
                return false
            }
            let scalars = withheld.unicodeScalars
            let n = final ? scalars.count : max(0, scalars.count - holdBack)
            let delta = String(String.UnicodeScalarView(scalars.prefix(n)))
            withheld = String(String.UnicodeScalarView(scalars.dropFirst(n)))
            return emit(delta, tok)
        }

        /// Qwen's ByteLevel decoder is concatenative once a UTF-8 scalar is
        /// complete. Decode small bounded groups and retain four token bytes at
        /// the boundary; if the candidate still ends in U+FFFD, retain more.
        /// This makes streaming decode O(n), rather than decoding tokens 1...n
        /// after every generated token.
        func flushStablePrefix(_ tok: Int) -> Bool {
            guard !pendingIds.isEmpty else { return true }
            // Start from everything buffered and hand back one token at a time
            // while the decode still ends mid-scalar. Waiting for eight tokens
            // before the first flush and holding four back after it gave
            // clients one delta per four tokens, and no delta at all for a
            // reply shorter than eight; the byte-exactness this protects rests
            // on the replacement-character check below, not on the backlog.
            var n = pendingIds.count
            var piece = ""
            while n > 0 {
                piece = tokenizer.decode(
                    tokens: Array(pendingIds.prefix(n)), skipSpecialTokens: true)
                if !piece.hasSuffix("\u{FFFD}") { break }
                n -= 1
            }
            guard n > 0 else { return true }
            pendingIds.removeFirst(n)
            return feed(piece, final: false, tok: tok)
        }

        let needsIncrementalDecode = onToken != nil || !stops.isEmpty
        let tokenHandler: ((Int) -> Bool)? = needsIncrementalDecode ? { tok in
            control.sampledFirstToken()
            lastTok = tok
            pendingIds.append(tok)
            let ok = flushStablePrefix(tok)
            if !ok, !stopFound { clientGone = true }
            // A pressure event can arrive inside a client callback. This is
            // already a supported committed-emission boundary in both decode
            // paths; do not spend another forward before observing it.
            return ok && !observePressure()
        } : { _ in control.sampledFirstToken(); return !observePressure() }

        var (ids, stats) = generator.generate(
            promptIds: promptIds, params: params, eosIds: eosIds, cache: prefixCache,
            vision: vision,
            shouldContinue: {
                guard !clientGone, !stopFound else { return false }
                if observePressure() { return false }
                return shouldContinue?() ?? true
            }, onToken: tokenHandler, request: control, onAdmitted: onAdmitted)

        var text = tokenizer.decode(tokens: ids, skipSpecialTokens: true)
        if !stops.isEmpty, let cut = Self.stopIndex(text, stops) {
            text = String(text[text.startIndex ..< cut])
        }
        // The one full decode is both the non-streamed result and an exact final
        // reconciliation for the bounded incremental decoder.
        if !clientGone, control.failure == nil, stats.runtimeError == nil, onToken != nil {
            let target = text.unicodeScalars
            let sent = delivered.unicodeScalars
            if target.count >= sent.count, target.starts(with: sent) {
                _ = emit(String(String.UnicodeScalarView(target.dropFirst(sent.count))), lastTok)
            }
        }
        stats.queueSeconds = queueSeconds
        stats.preparationSeconds = preparationSeconds
        stats.memoryPressureCancelled = pressureObserved != nil
        if pressureObserved != nil {
            stats.runtimeError = stats.runtimeError
                ?? "memory pressure interrupted inference; retry after the cache resizes"
            stats.finishReason = "error"
        }
        stats.memoryPressureBoundarySeconds = pressureBoundarySeconds
        stats.firstTextSeconds = firstTextSeconds
        if let failure = control.failure {
            stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
            stats.memoryPressureCancelled = failure.code == .insufficientMemory
            // A request guard can see the ticket before the legacy continuation
            // callback runs. Preserve the same observed boundary in that path.
            if failure.code == .insufficientMemory, stats.memoryPressureBoundarySeconds == nil,
               let ticket = pressureBoundary.snapshot() {
                stats.memoryPressureBoundarySeconds = RuntimeClock.seconds(since: ticket.requestedAt)
            }
            prefixCache.drop()
            Stream.gpu.synchronize()
            MLX.Memory.clearCache()
        }
        stats.requestSeconds = control.elapsedSeconds
        return (text, ids, stats)
    }
}

````````````

## Artifact SHA-256 9bd9619a98aa62685be2de5148942455456b5d30fcf18e5a384148a4ae313da2

Encoding: `gzip+base64`. Original bytes: 74337.

````````````text
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
````````````

## Artifact SHA-256 edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189

Encoding: `utf-8`. Original bytes: 14155.

````````````text
// The MTP (multi-token-prediction) draft head: one extra full-attention
// decoder layer that predicts the token AFTER next, used for self-speculative
// decode. Weights come from `mtp.safetensors` (converted from the official
// release by Tools/mtp_convert.py — the pinned community conversion drops
// them), everything resident: its 512 experts are 1.42 GB and stay loaded,
// so drafting never touches the slot pool or the SSD.
//
// Semantics follow vLLM's Qwen4ExpMultiTokenPredictor ("scheme A"), the only
// public inference implementation of this head, cross-checked against the
// vendored reference's blocks (Tools/reference/mtp_ref.py is the Python
// mirror this port is parity-tested against):
//
//   fuse:   e = fc_embedding(rmsnorm(embed(token)))          (B,T,H)
//           h = fc_hidden(rmsnorm_fullwidth(multi))          per-branch shared
//           x = flatten(e broadcast over branches + h)       (B,T,hc*H)
//   layer:  one full_attention DecoderLayer (QSA + resident MoE + HC)
//   out:    mixer(x) -> (B,T,H) for the shared lm_head,
//           and pre-mixer x is the next draft step's `multi` input.
//
// Positions: the MTP entry for (hidden_i, embed(token_{i+1})) trains at rope
// position i+1, but this port uses 0-based cache positions like the main
// model. RoPE attention depends only on relative positions and every entry
// shifts by the same +1, so the scores are mathematically identical; only a
// uniform basis change separates the two conventions.

import Foundation
import MLX
import MLXNN

/// Loader for `mtp.safetensors`. Names inside keep their `mtp.` prefix.
public final class MTPWeights: TensorSource {
    public let config: ModelConfig
    let arrays: [String: MLXArray]

    public static func fileURL(modelDir: URL) -> URL {
        modelDir.appendingPathComponent("mtp.safetensors")
    }

    public static func present(modelDir: URL) -> Bool {
        FileManager.default.fileExists(atPath: fileURL(modelDir: modelDir).path)
    }

    public init(modelDir: URL, config: ModelConfig) throws {
        self.config = config
        let url = Self.fileURL(modelDir: modelDir)
        guard FileManager.default.fileExists(atPath: url.path) else {
            throw ModelError(
                "no mtp.safetensors in \(modelDir.path) — the MTP draft head is a separate "
                    + "1.5 GB artifact converted from the official release "
                    + "(Tools/mtp_convert.py); run with --mtp off or convert it first")
        }
        let all = try loadArrays(url: url)
        eval(Array(all.values))
        self.arrays = all
    }

    public func optionalTensor(_ name: String) -> MLXArray? { arrays[name] }

    public var totalBytes: Int { arrays.values.reduce(0) { $0 + $1.nbytes } }
}

/// SparseMoeBlock with every expert resident — same math as MoELayer, minus
/// the slot pool: routing indices feed gatherQuantizedMM directly.
final class ResidentMoE {
    var specializedRouter = false
    var routerObserver: (([Int32]) -> Void)?
    let cfg: ModelConfig
    let routerProjection: RouterProjection
    let sharedGate: QLinear
    let sharedGateProj: QLinear
    let sharedUpProj: QLinear
    let sharedDownProj: QLinear
    let gp: (MLXArray, MLXArray, MLXArray)  // gate_proj weight/scales/biases (E, I, H/8)
    let up: (MLXArray, MLXArray, MLXArray)
    let dp: (MLXArray, MLXArray, MLXArray)

    init(_ w: TensorSource, base b: String) {
        cfg = w.config
        routerProjection = RouterProjection(w.tensor(b + ".gate.weight"))
        sharedGate = w.linear(b + ".shared_expert_gate")
        sharedGateProj = w.linear(b + ".shared_expert.gate_proj")
        sharedUpProj = w.linear(b + ".shared_expert.up_proj")
        sharedDownProj = w.linear(b + ".shared_expert.down_proj")
        func triple(_ name: String) -> (MLXArray, MLXArray, MLXArray) {
            (w.tensor(b + ".switch_mlp.\(name).weight"),
             w.tensor(b + ".switch_mlp.\(name).scales"),
             w.tensor(b + ".switch_mlp.\(name).biases"))
        }
        gp = triple("gate_proj")
        up = triple("up_proj")
        dp = triple("down_proj")
    }

    func callAsFunction(_ x: MLXArray) -> MLXArray {
        let logits = routerProjection(x)
        let idx = RouterSelection.indices(logits, k: cfg.topK, enabled: specializedRouter)
        if let routerObserver { routerObserver(idx.asType(.int32).asArray(Int32.self)) }
        let weights = softmax(takeAlong(logits, idx, axis: -1), axis: -1, precise: true)
        let rhs = idx.asType(.uint32)

        let xe = x.expandedDimensions(axes: [-2, -3])
        let g = gatherQuantizedMM(
            xe, gp.0, scales: gp.1, biases: gp.2,
            rhsIndices: rhs, transpose: true, groupSize: cfg.qGroup, bits: cfg.qBits)
        let u = gatherQuantizedMM(
            xe, up.0, scales: up.1, biases: up.2,
            rhsIndices: rhs, transpose: true, groupSize: cfg.qGroup, bits: cfg.qBits)
        let hidden = MLXNN.silu(g) * u
        let d = gatherQuantizedMM(
            hidden, dp.0, scales: dp.1, biases: dp.2,
            rhsIndices: rhs, transpose: true, groupSize: cfg.qGroup, bits: cfg.qBits)
        let experts = d.squeezed(axis: -2)
        let routed = (experts * weights.expandedDimensions(axis: -1)).sum(axis: -2).asType(x.dtype)

        let shared = sharedDownProj(MLXNN.silu(sharedGateProj(x)) * sharedUpProj(x))
        return routed + sigmoid(sharedGate(x)) * shared
    }
}

/// Attention + indexer state for the draft head, one entry per consumed main
/// token (entry i covers the fusion of hidden i-1 with token i's embedding).
/// Speculative decode rolls rejected entries back with `trim`.
public final class MTPState {
    let kv = KVCache()
    let indexer = IndexerCache()

    public init() {}

    func forkForPrefix() -> MTPState {
        let result = MTPState()
        kv.copyForPrefix(to: result.kv)
        indexer.copyForPrefix(to: result.indexer)
        result.materialize()
        return result
    }

    public var offset: Int { kv.offset }

    public func isAligned(withConsumedTokens count: Int) -> Bool {
        count > 0 && kv.offset == count - 1 && indexer.offset == kv.offset
    }

    public func trim(to n: Int) {
        kv.trim(to: n)
        indexer.trim(to: n)
    }

    /// Force pending lazy cache writes so the graph never spans multiple
    /// prefill chunks or speculative rounds.
    func materialize() {
        if let k = kv.keys, let v = kv.values { eval(k, v) }
        indexer.materializeStorage()
    }
}

public final class MTPHead {
    let cfg: ModelConfig
    let fcEmbedding: QLinear
    let fcHidden: QLinear
    let preFcNormEmbedding: RMSNorm
    let preFcNormHidden: RMSNorm
    let attnHC: GatedResidual
    let mlpHC: GatedResidual
    let attn: QSAAttention
    let moe: ResidentMoE
    package var usesSpecializedRouter: Bool {
        get { moe.specializedRouter }
        set {
            if newValue { RouterSelection.prepare() }
            moe.specializedRouter = newValue
        }
    }
    package var routerObserver: (([Int32]) -> Void)? {
        get { moe.routerObserver }
        set { moe.routerObserver = newValue }
    }
    package var usesCompiledNorm: Bool {
        get { attnHC.compiledNormFinish }
        set { attnHC.compiledNormFinish = newValue; mlpHC.compiledNormFinish = newValue; mixer.compiledNormFinish = newValue }
    }
    package var compiledNormFinishes: Int { attnHC.compiledFinishes + mlpHC.compiledFinishes + mixer.compiledFinishes }
    package var indexerSpecializedRows: Int { attn.indexer.specializedRows }
    let mixer: GatedResidual
    public let residentBytes: Int

    public init(_ w: MTPWeights) {
        cfg = w.config
        fcEmbedding = w.linear("mtp.fc_embedding")
        fcHidden = w.linear("mtp.fc_hidden")
        preFcNormEmbedding = RMSNorm(
            weight: w.tensor("mtp.pre_fc_norm_embedding.weight"), eps: cfg.rmsNormEps,
            groupSize: nil)
        // Full-width statistics over all hc*H dims (vLLM builds this one as a
        // plain GemmaRMSNorm over hidden*hc), unlike the per-branch hc_norms.
        preFcNormHidden = RMSNorm(
            weight: w.tensor("mtp.pre_fc_norm_hidden.weight"), eps: cfg.rmsNormEps,
            groupSize: nil)
        attnHC = GatedResidual(w, base: "mtp.layers.0.attn_hyper_connection", useCombine: true)
        mlpHC = GatedResidual(w, base: "mtp.layers.0.mlp_hyper_connection", useCombine: true)
        attn = QSAAttention(w, base: "mtp.layers.0.self_attn")
        moe = ResidentMoE(w, base: "mtp.layers.0.mlp")
        mixer = GatedResidual(w, base: "mtp.hyper_connection_mixer", useCombine: false)
        residentBytes = w.totalBytes
    }

    /// Stage-dump hook for parity debugging (set by mtp-parity --dump).
    public var debugSink: ((String, MLXArray) -> Void)? = nil {
        didSet { attn.debugSink = debugSink }
    }

    /// One step of the draft head over already-embedded tokens.
    /// - embedded: (1,S,H) dequantized embedding rows of the input tokens
    /// - hiddenMulti: (1,S,hc*H) pre-mixer multi stream (main model's on the
    ///   first step, this head's own `multi` output on chained steps)
    /// Returns (sample (1,S,H) for lm_head, multi (1,S,hc*H) for chaining).
    public func callAsFunction(
        embedded: MLXArray, hiddenMulti: MLXArray, rope: Rope, state: MTPState
    ) -> (sample: MLXArray, multi: MLXArray) {
        let (B, S) = (embedded.dim(0), embedded.dim(1))
        let e = fcEmbedding(preFcNormEmbedding(embedded))
        var h = preFcNormHidden(hiddenMulti)
            .reshaped([B, S, cfg.hcCount, cfg.hiddenSize])
        h = fcHidden(h)
        h = e.expandedDimensions(axis: -2) + h
        h = h.reshaped([B, S, cfg.hcCount * cfg.hiddenSize])
        debugSink?("fuse", h)

        let (x1, inj1) = attnHC(h)
        debugSink?("x1", x1)
        let attnOut = attn(x1, rope: rope, cache: state.kv, idxCache: state.indexer)
        debugSink?("attnOut", attnOut)
        h = h + (attnOut.expandedDimensions(axis: -2) * inj1!.expandedDimensions(axis: -1))
            .reshaped(h.shape)

        let (x2, inj2) = mlpHC(h)
        debugSink?("x2", x2)
        let moeOut = moe(x2)
        debugSink?("moeOut", moeOut)
        h = h + (moeOut.expandedDimensions(axis: -2) * inj2!.expandedDimensions(axis: -1))
            .reshaped(h.shape)

        let (mixed, _) = mixer(h)
        return (mixed, h)
    }

    /// Feed consumed main-model tokens through the head so its attention
    /// cache stays aligned: the entry for token chunk[i] fuses the multi
    /// stream of the PREVIOUS position with chunk[i]'s embedding. `prevMulti`
    /// is the multi of the token before chunk[0] — nil only at sequence
    /// start, where token 0 has no preceding hidden and gets no entry
    /// (invariant: cache offset == consumed tokens − 1).
    /// Returns the last position's multi, detached, for the next call.
    ///
    /// `vision` carries the tower's rows for the chunk's placeholder runs,
    /// at chunk-relative offsets, exactly as `Model.hiddenStates` sees them.
    /// They are spliced into the draft stream in place of the placeholder
    /// token's own embedding, so the head's cache is built on what the main
    /// model actually consumed — without it the drafts would be
    /// self-consistent but blind to the picture. Empty on plain text and on
    /// decode, neither of which carries a placeholder.
    public func consume(
        chunk: [Int], chunkMulti: MLXArray, prevMulti: MLXArray?,
        resident: ResidentWeights, rope: Rope, state: MTPState,
        vision: [VisionRun] = [], compactRetainedRow: Bool = false
    ) -> MLXArray {
        do {
            return try consumeChecked(chunk: chunk, chunkMulti: chunkMulti, prevMulti: prevMulti,
                resident: resident, rope: rope, state: state, vision: vision, compactRetainedRow: compactRetainedRow)
        } catch { preconditionFailure("draft embedding lookup failed: \(error)") }
    }

    public func consumeChecked(
        chunk: [Int], chunkMulti: MLXArray, prevMulti: MLXArray?,
        resident: ResidentWeights, rope: Rope, state: MTPState,
        vision: [VisionRun] = [], compactRetainedRow: Bool = false
    ) throws -> MLXArray {
        let S = chunk.count
        guard S > 0, chunk.allSatisfy({ $0 >= 0 && $0 < cfg.vocabSize }),
              chunkMulti.shape == [1, S, cfg.hcCount * cfg.hiddenSize],
              prevMulti == nil || prevMulti!.shape == [1, 1, cfg.hcCount * cfg.hiddenSize] else {
            throw ModelError("draft consumption requires a nonempty, aligned multi-stream chunk")
        }
        let row = chunkMulti[0..., (S - 1)..., 0...]
        let last = compactRetainedRow ? contiguous(row) : row
        // Evaluation alone retains a view's parent; contiguous detaches an
        // oversized backing allocation before this row crosses the boundary.
        eval(last)
        let startIdx = prevMulti == nil ? 1 : 0
        if S - startIdx > 0 {
            var e = try resident.embedChecked(Array(chunk[startIdx...]), shape: [1, S - startIdx]).asType(.bfloat16)
            if !vision.isEmpty {
                // The head skips chunk[0] at sequence start (it has no
                // preceding hidden), so every run is re-based by the same
                // startIdx and a run that falls entirely before it drops out.
                let shifted = vision.compactMap { $0.clipped(to: startIdx, chunk.count) }
                if !shifted.isEmpty {
                    e = Qwen4ExpModel.spliceVision(
                        e, runs: shifted, length: S - startIdx, hidden: cfg.hiddenSize)
                }
            }
            let multis: MLXArray
            if let pm = prevMulti {
                multis = S > 1
                    ? concatenated([pm, chunkMulti[0..., 0 ..< (S - 1), 0...]], axis: 1)
                    : pm
            } else {
                multis = chunkMulti[0..., 0 ..< (S - 1), 0...]
            }
            _ = self(embedded: e, hiddenMulti: multis, rope: rope, state: state)
            state.materialize()
        }
        return last
    }

}

````````````

## Artifact SHA-256 a4cea913e0f438a69e72672d42046bf904717700d8753c1449e5e48b419033a6

Encoding: `utf-8`. Original bytes: 54003.

````````````text
// Qwen4Exp model assembly: 48 layers of (GDN | QSA) + MoE with
// hyper-connection residuals, PLE injection at the configured layer, and the
// final mixer + lm_head. Streams experts (SlotPool) and n-gram rows (NgramStore).

import Foundation
import MLX

public final class Qwen4ExpModel {
    /// All recurrent state and complete-prompt logits belong to this loaded model, even
    /// when another model has the same vocabulary and cache geometry.
    package let promptCheckpointIdentity = UUID()
    public let cfg: ModelConfig
    public let resident: ResidentWeights
    public let pool: SlotPool
    public let ngram: NgramStore
    public var optimizations: InferenceOptimizations
    /// Only the bounded long-context prefill path selects this arithmetic.
    /// Kept outside the independent optimization candidate bundle.
    package var smallPrefillSweep = false
    package var smallPrefillReferenceStart = 0
    package var smallPrefillReferenceEnd = ContextPolicy.modelLimit
    package var alignSmallReferenceDispatch = false
    package var stableSmallPrefillRouting = false
    package var stableSmallPrefillAttention = false
    package var stableSmallPrefillProjections = false
    public var paddedSmallKeyDomains: Int { qsa.values.reduce(0) { $0 + $1.paddedSmallKeyDomains } }
    public var paddedSmallQueryRows: Int { qsa.values.reduce(0) { $0 + $1.paddedSmallQueryRows } }
    public var smallPrefillSweeps: Int { moe.values.reduce(0) { $0 + $1.smallPrefillSweeps } }
    public var residentExpertPrelaunches: Int { moe.values.reduce(0) { $0 + $1.residentPrelaunches } }
    public var residentExpertJoins: Int { moe.values.reduce(0) { $0 + $1.residentJoins } }
    public var residentExpertJoinSeconds: Double { moe.values.reduce(0) { $0 + $1.residentJoinSeconds } }
    public var sharedExpertPrelaunches: Int { moe.values.reduce(0) { $0 + $1.sharedPrelaunches } }
    public var indexerSpecializedRows: Int { qsa.values.reduce(0) { $0 + $1.indexer.specializedRows } }
    private var routerCacheConfigured = false
    public var cachedRouterBytes: Int {
        moe.values.reduce(0) { $0 + $1.routerProjection.cachedBytes }
            + (mtpHead?.moe.routerProjection.cachedBytes ?? 0)
    }

    /// Request entry calls this before a cached MTP draft can advance. Direct
    /// model callers also prepare before touching main recurrent state.
    public var compiledNormFinishes: Int {
        (attnHC + mlpHC + [mixer]).reduce(0) { $0 + $1.compiledFinishes }
    }
    public var readHandleCount: Int { pool.readHandleCount + ngram.readHandleCount }
    public var selectedAttentionTiles: Int {
        qsa.values.reduce(0) { $0 + $1.selectedAttentionTiles } + (mtpHead?.attn.selectedAttentionTiles ?? 0)
    }
    public private(set) var terminalQueryRowsSkipped = 0
    public private(set) var terminalMoERowsSkipped = 0
    private enum HiddenDemand { case fullMulti, stateOnly, lastRow }
    private var compiledNormConfigured = false
    /// Lazy dispatch counters; GPU completion is established by evaluated outputs,
    /// never inferred from these scheduled-operation counts alone.
    public var fusedRoPERotationsScheduled: Int { rope.fusedRotationsScheduled }
    public var ropeTableHits: Int { rope.tableHits }
    public var ropeTableBuilds: Int { rope.tableBuilds }
    public var fusedGDNProjectionsScheduled: Int { gdn.values.reduce(0) { $0 + $1.fusedProjectionsScheduled } }
    func prepareOptimizationKernels() {
        for layer in gdn.values { layer.fuseInputProjection = optimizations.fusedGDNProjection }
        rope.sharedTables = optimizations.sharedRoPE
        rope.fusedRotation = optimizations.fusedRoPE && PartialRotation.prepare()
        let selected = optimizations.selectedTextAttention && SelectedAttention.prepare()
        for layer in qsa.values { layer.selectedAttention = selected }
        mtpHead?.attn.selectedAttention = selected
        pool.directReadHandles = optimizations.directReadHandles
        ngram.directReadHandles = optimizations.directReadHandles
        let compiledNorm = optimizations.compiledNormFinish && CompiledArithmetic.prepare()
        if compiledNorm != compiledNormConfigured {
            for unit in attnHC + mlpHC + [mixer] { unit.compiledNormFinish = compiledNorm }
            compiledNormConfigured = compiledNorm
        }
        mtpHead?.attnHC.compiledNormFinish = compiledNorm
        mtpHead?.mlpHC.compiledNormFinish = compiledNorm
        mtpHead?.mixer.compiledNormFinish = compiledNorm
        ngram.ringEvictionOrder = optimizations.ngramRingOrder
        pool.denseLookup = optimizations.denseExpertLookup
        pool.sparsePinClearing = optimizations.sparsePoolPins
        pool.contiguousSlotWrites = optimizations.contiguousSlotWrites
        pool.wordSlotWrites = optimizations.wordSlotWrites
        pool.cpuSlotWrites = optimizations.cpuSlotWrites
        pool.layerLocalFloorEviction = optimizations.layerLocalFloorCache
        if routerCacheConfigured != optimizations.cachedRouterWeights {
            for layer in moe.values { layer.routerProjection.configure(cached: optimizations.cachedRouterWeights) }
            routerCacheConfigured = optimizations.cachedRouterWeights
        }
        mtpHead?.moe.routerProjection.configure(cached: optimizations.cachedRouterWeights)
        if optimizations.routerTopK { RouterSelection.prepare() }
        if optimizations.indexerBlockTopK { BlockSelection.prepare() }
        mtpHead?.moe.specializedRouter = optimizations.routerTopK
        mtpHead?.attn.indexer.specializedSelector = optimizations.indexerBlockTopK
    }

    let rope: Rope
    var gdn: [Int: GDNLayer] = [:]
    var qsa: [Int: QSAAttention] = [:]
    var moe: [Int: MoELayer] = [:]
    var attnHC: [GatedResidual] = []
    var mlpHC: [GatedResidual] = []
    var ple: [Int: PLELayer] = [:]
    let mixer: GatedResidual
    let lmHead: QLinear
    /// The optional MTP draft head for self-speculative decode; loaded from
    /// mtp.safetensors on demand (`enableMTP`), everything resident.
    public private(set) var mtpHead: MTPHead? = nil
    /// Diagnostic observer; called on the serialized model thread with router-rank IDs.
    public var routerObserver: ((Int, [Int32]) -> Void)?
    package var contextNumericsObserver: ((Int, String, MLXArray) -> Void)?
    package var gdnPhaseProfile: GDNPhaseProfile? {
        didSet { for layer in gdn.values { layer.phaseProfile = gdnPhaseProfile } }
    }
    public let runLayers: Int  // truncated for parity rigs; numLayers normally

    public final class State {
        var modelIdentity: UUID?
        package var ownerModelIdentity: UUID? { modelIdentity }
        let checkpointIdentity = UUID()
        var checkpointLifetimes: [WeakStateCheckpointLifetime] = []
        var recordingEnabled = false
        var recordedTokenIds: [Int]?
        var recordingBaseTokenCount: Int?
        var linear: [Int: LinearCache] = [:]
        var kv: [Int: KVCache] = [:]
        var indexer: [Int: IndexerCache] = [:]
        var ngramCtx: [Int64] = []
        public var tokenCount = 0
        // A failed low-level forward can change early layers while tokenCount
        // still names the preceding boundary. Count alone cannot certify reuse.
        var committedBoundaryValid = true
        /// Speculative-decode companions, created lazily by the MTP-aware
        /// generate path: the draft head's own attention state, and the
        /// pre-mixer multi stream at the last consumed position (the next
        /// draft step's hidden input). They ride the prefix cache with the
        /// rest of the state so conversations keep their draft context.
        public var mtp: MTPState?
        public var lastMulti: MLXArray?
        /// A draft pointer alone is insufficient: plain inference may have
        /// advanced the main prefix since the draft cache was last updated.
        public var hasValidMTP: Bool {
            guard let row = lastMulti, row.ndim == 3, row.dim(0) == 1, row.dim(1) == 1 else { return false }
            return mtp?.isAligned(withConsumedTokens: tokenCount) == true
        }
        public func invalidateMTP() { mtp = nil; lastMulti = nil }
        /// Allocated sequence buffers, including unused capacity after trim.
        /// Recurrent state, convolution windows and allocator cache are separate.
        public var allocatedSequenceBytes: Int {
            kv.values.reduce(0) { $0 + $1.allocatedBytes }
                + indexer.values.reduce(0) { $0 + $1.allocatedBytes }
                + (mtp.map { $0.kv.allocatedBytes + $0.indexer.allocatedBytes } ?? 0)
        }
        var compactStateWindows = false
        public init() {}
    }

    public convenience init(index: CheckpointIndex, poolSlots: Int, runLayers: Int? = nil) throws {
        try self.init(index: index, poolSlots: poolSlots, runLayers: runLayers, embeddingRowCache: nil)
    }

    package init(index: CheckpointIndex, poolSlots: Int, runLayers: Int? = nil, embeddingRowCache: Bool?,
                 packGDNProjections: Bool? = nil) throws {
        self.optimizations = try InferenceOptimizations.environment()
        try ModelProcessGuard.acquire()
        self.cfg = index.config
        let selectedLayers = runLayers ?? index.config.numLayers
        guard selectedLayers >= 1, selectedLayers <= index.config.numLayers else {
            throw ModelError(
                "layer count must be between 1 and \(index.config.numLayers), got \(selectedLayers)")
        }
        guard poolSlots >= 1, poolSlots <= Geometry.totalRecords else {
            throw ModelError(
                "expert-pool slot count must be between 1 and \(Geometry.totalRecords), got \(poolSlots)")
        }
        self.runLayers = selectedLayers
        let store = try ExpertStore(index: index)
        // Reject a wrong/custom checkpoint before allocating the 3.8 GB
        // resident trunk or the expert pool.
        try Geometry.check(against: index.config, recordBytes: store.recordBytes)
        // Explicit experimental startup path: full-file verification precedes
        // resident/pool allocation. Default construction needs no repack.
        if let path = ProcessInfo.processInfo.environment["SLOTSTREAM_EXPERT_LAYOUT"] {
            guard !path.isEmpty else { throw ModelError("SLOTSTREAM_EXPERT_LAYOUT must name a packed artifact directory") }
            let report = try store.loadPackedLayout(at:URL(fileURLWithPath:path,isDirectory:true))
            fputs("[expert-layout] verified \(report.bytes) bytes in \(report.seconds) s\n",stderr)
        }
        // parity rigs keep the truncated layers' experts resident? no — pool serves them
        self.resident = try ResidentWeights(index: index, embeddingRowCache: embeddingRowCache,
            packGDNProjections: packGDNProjections ?? optimizations.fusedGDNProjection)
        self.pool = SlotPool(slots: poolSlots, store: store)
        self.ngram = NgramStore(index: index, resident: resident)
        self.rope = Rope(dim: cfg.rotaryDim, base: cfg.ropeTheta)

        for l in 0 ..< self.runLayers {
            let base = "model.layers.\(l)"
            if cfg.layerTypes[l] == "linear_attention" {
                gdn[l] = GDNLayer(resident, layer: l)
            } else {
                qsa[l] = QSAAttention(resident, layer: l)
            }
            moe[l] = MoELayer(resident, layer: l, pool: pool)
            attnHC.append(GatedResidual(resident, base: base + ".attn_hyper_connection", useCombine: true))
            mlpHC.append(GatedResidual(resident, base: base + ".mlp_hyper_connection", useCombine: true))
            if cfg.pleLayerIndices.contains(l) {
                ple[l] = PLELayer(resident, layer: l, store: ngram)
            }
        }
        if Self.debugDir != nil { attnHC[0].debugName = "hc0" }
        mixer = GatedResidual(resident, base: "model.hyper_connection_mixer", useCombine: false)
        lmHead = resident.linear("lm_head")
    }

    /// The model's rotary embedding (the MTP head shares it).
    public var sharedRope: Rope { rope }

    /// lm_head applied to a draft-head sample hidden — the draft's logits.
    public func draftLogits(_ sample: MLXArray) -> MLXArray { lmHead(sample) }

    /// Load the MTP draft head (1.5 GB resident). Idempotent; throws when
    /// mtp.safetensors is absent.
    public func enableMTP(modelDir: URL) throws {
        guard mtpHead == nil else { return }
        mtpHead = MTPHead(try MTPWeights(modelDir: modelDir, config: cfg))
    }

    /// Conservative capacity needed before a request grows its sequence
    /// caches. Charges allocation steps, completed-block storage and the draft
    /// head when it may be used; it performs no allocation or GPU evaluation.
    public func sequenceCapacityBytes(tokens: Int, mtp: Bool) -> Int {
        let layers = cfg.layerTypes.prefix(runLayers).filter { $0 != "linear_attention" }.count + (mtp ? 1 : 0)
        let rowBytes = (2 * cfg.numKVHeads * cfg.headDim + cfg.indexerHeadDim) * 2
        return ContextGeometry.capacityBytes(tokens: tokens, layers: layers, rowBytes: rowBytes,
            pooledRowBytes: cfg.indexerHeadDim * 2, compressionRatio: cfg.indexerCompressRatio,
            indexerBudget: cfg.indexerBudget, incrementalIndexer: optimizations.incrementalIndexer)
    }

    /// Bound the next physical sequence allocations, keeping main, draft,
    /// raw-indexer and pooled-indexer capacity separate. Rollback retains spare
    /// rows, but they can only be reused by the buffer that actually owns them.
    package func sequenceAllocationBytes(tokens: Int, draftTokens: Int?, state: State,
                                         sharedBacking: Bool = false) -> Int {
        guard tokens >= 0, tokens <= ContextPolicy.modelLimit,
              draftTokens.map({ $0 >= 0 && $0 <= ContextPolicy.modelLimit }) ?? true else { return Int.max }
        let kvRowBytes = ContextBytes.product(cfg.numKVHeads, cfg.headDim, 2)
        let indexRowBytes = ContextBytes.product(cfg.indexerHeadDim, 2)
        func bytes(_ end: Int, kv: KVCache?, index: IndexerCache?, compact: Bool) -> Int {
            func replacement(_ count: Int, _ rowBytes: Int, _ owned: Int, step: Int = 1024) -> Int {
                ContextGeometry.nextBufferAllocationBytes(tokens: count, rowBytes: rowBytes,
                    allocatedBytes: sharedBacking ? 0 : owned, step: step)
            }
            let rawBase = index?.rawBase ?? 0
            guard end >= rawBase else { return Int.max }
            var result = ContextBytes.sum(
                replacement(end, kvRowBytes, kv?.keys?.nbytes ?? 0),
                replacement(end, kvRowBytes, kv?.values?.nbytes ?? 0),
                replacement(end - rawBase, indexRowBytes, index?.rawAllocatedBytes ?? 0,
                    step: compact && rawBase > 0 ? 256 : 1024))
            if end > cfg.indexerBudget, optimizations.incrementalIndexer || compact {
                let blocks = end / cfg.indexerCompressRatio
                result = ContextBytes.sum(result, replacement(blocks, indexRowBytes,
                    index?.pooledAllocatedBytes ?? 0, step: 256))
                if compact {
                    let first = min(blocks * cfg.indexerCompressRatio,
                        max(0, end - 32) / cfg.indexerCompressRatio * cfg.indexerCompressRatio)
                    if first - rawBase >= 256 {
                        // Compaction also creates a fresh small tail before
                        // releasing its parent; it is not a pre-allocation credit.
                        result = ContextBytes.sum(result, replacement(end - first, indexRowBytes, 0, step: 256))
                    }
                }
            }
            return result
        }
        var total = 0
        for layer in 0 ..< runLayers where cfg.layerTypes[layer] != "linear_attention" {
            let index = state.indexer[layer]
            total = ContextBytes.sum(total, bytes(tokens, kv: state.kv[layer], index: index,
                compact: index?.compactRaw ?? optimizations.compactIndexerRaw))
        }
        if let draftTokens {
            total = ContextBytes.sum(total, bytes(draftTokens, kv: state.mtp?.kv,
                index: state.mtp?.indexer, compact: state.mtp?.indexer.compactRaw ?? false))
        }
        return total
    }

    public func makeState() -> State {
        let s = State()
        s.modelIdentity = promptCheckpointIdentity
        s.ngramCtx = Array(repeating: Int64(cfg.eosTokenId), count: cfg.ngramSize - 1)
        for l in 0 ..< runLayers {
            if cfg.layerTypes[l] == "linear_attention" {
                s.linear[l] = LinearCache()
            } else {
                s.kv[l] = KVCache()
                s.indexer[l] = IndexerCache(compactRaw: optimizations.compactIndexerRaw)
            }
        }
        return s
    }

    /// One forward pass over `ids` (1, S). Returns final hidden (1, S, hidden).
    /// `perLayerHook` (parity rigs) receives the hyper-width h after each layer.
    /// Read once: ProcessInfo builds a fresh dictionary on every access, and
    /// this used to run 48 times per token.
    static let debugDir = ProcessInfo.processInfo.environment["SS_DEBUG_DIR"]
    static let debugLayer = Int(ProcessInfo.processInfo.environment["SS_DEBUG_LAYER"] ?? "0") ?? 0

    static func debugDump(_ name: String, _ arr: MLXArray) {
        guard let dir = debugDir else { return }
        let v = arr.asType(.float32).asArray(Float.self)
        let d = v.withUnsafeBufferPointer { Data(buffer: $0) }
        try? FileManager.default.createDirectory(atPath: dir, withIntermediateDirectories: true)
        try? d.write(to: URL(fileURLWithPath: dir).appendingPathComponent(name + ".bin"))
    }

    /// Replace the embeddings under each placeholder run with the tower's rows.
    ///
    /// The template expands one `<|image_pad|>` per image into a run of them,
    /// so what has to happen is a substitution of contiguous spans — which is
    /// what this does, entirely on the GPU. The first version copied the whole
    /// hidden to the CPU as float32, looped over `S × hidden` scalars, and
    /// uploaded it again, on every prefill pass of every vision request. It
    /// also scanned the ids for placeholders and, when the count disagreed with
    /// the rows it was given, logged a line and continued with unspliced
    /// placeholder embeddings — a silently wrong answer. A run carries its own
    /// rows, so the two cannot disagree; a wrong offset is a programming error
    /// and stops here.
    public static func spliceVision(
        _ h: MLXArray, runs: [VisionRun], length S: Int, hidden: Int
    ) -> MLXArray {
        var pieces: [MLXArray] = []
        var cursor = 0
        for run in runs.sorted(by: { $0.start < $1.start }) {
            precondition(
                run.start >= cursor && run.end <= S,
                "vision run \(run.start)..<\(run.end) outside 0..<\(S) or overlapping")
            if run.start > cursor { pieces.append(h[0..., cursor ..< run.start, 0...]) }
            pieces.append(run.rows.reshaped([1, run.count, hidden]).asType(h.dtype))
            cursor = run.end
        }
        if cursor < S { pieces.append(h[0..., cursor ..< S, 0...]) }
        return pieces.count == 1 ? pieces[0] : concatenated(pieces, axis: 1)
    }

    public func hiddenStates(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil
    ) -> MLXArray {
        checkpointCompatibility { try hiddenStatesChecked(ids, state: state, vision: vision, perLayerHook: perLayerHook) }
    }

    /// A read error may leave this caller-owned state partially advanced.
    /// Discard it or restore a prior checkpoint before any reuse. Generator
    /// performs that cleanup for its checked forward calls.
    public func hiddenStatesChecked(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil
    ) throws -> MLXArray {
        let h = try hiddenMulti(ids, state: state, vision: vision, perLayerHook: perLayerHook)
        return mixScope(h)
    }

    private func hiddenMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil
    ) throws -> MLXArray {
        try runHiddenMulti(ids, state: state, vision: vision, perLayerHook: perLayerHook)!
    }

    private func validateForward(_ ids: [Int], state: State) throws {
        guard !ids.isEmpty, ids.allSatisfy({ $0 >= 0 && $0 < cfg.vocabSize }) else {
            throw ModelError("model forward requires a nonempty sequence of valid token IDs")
        }
        guard state.committedBoundaryValid else {
            throw ModelError("model state has an incomplete forward; restore a committed checkpoint or create a new state")
        }
        // State() and tokenCount are public API. Reject an uninitialized,
        // incompatible or offset-corrupted state before changing any cache;
        // otherwise QSA's required cache access can trap after early layers
        // have already advanced. MTP alignment is intentionally checked by
        // its own lifecycle: target verification may have a provisional head.
        guard state.modelIdentity == promptCheckpointIdentity,
              state.tokenCount >= 0, ids.count <= Int(Int32.max),
              state.tokenCount <= Int(Int32.max) - ids.count,
              state.linear.count == gdn.count,
              state.kv.count == qsa.count, state.indexer.count == qsa.count,
              gdn.keys.allSatisfy({ state.linear[$0] != nil }),
              qsa.keys.allSatisfy({ state.kv[$0]?.offset == state.tokenCount
                  && state.indexer[$0]?.offset == state.tokenCount }) else {
            throw ModelError("model state is uninitialized, incompatible or offset-inconsistent; use makeState() or restore a committed checkpoint")
        }
    }

    private func runHiddenMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil,
        computeRanges: [Range<Int>]? = nil, shouldContinue: (() -> Bool)? = nil,
        demand: HiddenDemand = .fullMulti
    ) throws -> MLXArray? {
        try validateForward(ids, state: state)
        state.recordedTokenIds = state.recordingEnabled ? ids : nil
        state.recordingBaseTokenCount = state.recordingEnabled ? state.tokenCount : nil
        state.committedBoundaryValid = false
        let S = ids.count
        let referenceRows: Int
        if alignSmallReferenceDispatch, smallPrefillSweep, state.tokenCount >= smallPrefillReferenceStart,
           state.tokenCount < smallPrefillReferenceEnd {
            let blockStart = smallPrefillReferenceStart + ((state.tokenCount - smallPrefillReferenceStart) / 256) * 256
            referenceRows = min(256, smallPrefillReferenceEnd - blockStart)
        } else { referenceRows = 256 }
        let projectionRows = stableSmallPrefillProjections && smallPrefillSweep && S < referenceRows ? referenceRows : 0
        let ranges = computeRanges ?? stride(from: 0, to: S, by: 4096).map { $0 ..< min(S, $0 + 4096) }
        let layerMajor = optimizations.layerExpertWorkspace && ranges.count > 1
        // Public full-output APIs, MTP and truncated diagnostic models retain
        // all rows. The pinned final layer is QSA; no recurrent update is
        // inferred from a configuration label or omitted for another family.
        let terminalPruning = optimizations.terminalPrefillPruning && mtpHead == nil
            && runLayers == cfg.numLayers && qsa[runLayers - 1] != nil
            && perLayerHook == nil && demand != .fullMulti
        let terminalLastQuery = terminalPruning && optimizations.terminalLastQuery && demand == .lastRow
        if layerMajor {
            precondition(optimizations.compactStateWindows && optimizations.boundedIndexer && optimizations.boundedPLE
                && !state.linear.values.contains(where: { $0.record }),
                "a larger layer workspace requires bounded state, indexer, PLE and a non-recording prefill")
        }
        prepareOptimizationKernels()
        pool.workspacePiecewiseWrites = optimizations.workspacePiecewiseWrites
        state.compactStateWindows = optimizations.compactStateWindows
        ngram.compactRows = optimizations.compactNgramRows
        mtpHead?.attn.indexer.incrementalBlocks = optimizations.incrementalIndexer
        mtpHead?.attn.boundedIndexer = optimizations.boundedIndexer
        mtpHead?.attn.indexer.denseBypass = optimizations.denseIndexerBypass
        mtpHead?.attn.indexer.specializedSelector = optimizations.indexerBlockTopK
        mtpHead?.moe.specializedRouter = optimizations.routerTopK
        var h0 = try resident.embedChecked(ids, shape: [1, S]).asType(.bfloat16)
        if !vision.isEmpty { h0 = Self.spliceVision(h0, runs: vision, length: S, hidden: cfg.hiddenSize) }
        Self.debugDump("embed", h0)
        var h = tiled(h0, repetitions: [1, 1, cfg.hcCount])

        // n-gram history: rolling context + new ids
        let history = state.ngramCtx + ids.map { Int64($0) }
        state.ngramCtx = Array(history.suffix(cfg.ngramSize - 1))
        let lookahead = optimizations.ngramLookahead && S >= 16 && runLayers > ngram.pleLayerIndex
            ? try ngram.beginPrefetch(history:history,nNew:S,maxTokens:optimizations.boundedPLE || layerMajor ? 256 : 1024) : nil
        defer { if let lookahead { ngram.discardPrefetch(lookahead) } }

        for l in 0 ..< runLayers {
            if shouldContinue?() == false { return nil }
            if MemTrace.on { MemTrace.enterLayer(l, kind: gdn[l] != nil ? "gdn" : "qsa") }
            moe[l]!.specializedRouter = optimizations.routerTopK
            moe[l]!.overlapShared = optimizations.overlapSharedExpert
            moe[l]!.overlapResident = optimizations.overlapResidentExperts
            qsa[l]?.indexer.denseBypass = optimizations.denseIndexerBypass
            qsa[l]?.indexer.specializedSelector = optimizations.indexerBlockTopK
            moe[l]!.workspaceComputeRanges = layerMajor ? ranges : []
            moe[l]!.workspaceTokenTile = optimizations.workspaceTokenTile
            attnHC[l].minimumProjectionRows = projectionRows
            mlpHC[l].minimumProjectionRows = projectionRows
            gdn[l]?.minimumProjectionRows = projectionRows
            qsa[l]?.minimumProjectionRows = projectionRows
            qsa[l]?.indexer.minimumProjectionRows = projectionRows
            ple[l]?.minimumProjectionRows = projectionRows
            moe[l]!.minimumProjectionRows = projectionRows
            if terminalPruning, l == runLayers - 1, demand == .stateOnly, layerMajor {
                let historyBase = history.count - S
                for range in ranges {
                    var hidden = h[0..., range, 0...]
                    if let p = ple[l] {
                        p.boundedTokens = true
                        let begin = max(0, historyBase + range.lowerBound - (cfg.ngramSize - 1))
                        hidden = try hidden + p(hidden, history: Array(history[begin ..< historyBase + range.upperBound]),
                            nNew: range.count, cache: state.linear[l])
                    }
                    let x = attnHC[l](hidden).0
                    qsa[l]!.appendKeysOnly(x, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!)
                    if shouldContinue?() == false { return nil }
                }
                terminalQueryRowsSkipped += S; terminalMoERowsSkipped += S
                state.tokenCount += S
                state.committedBoundaryValid = true
                return MLXArray.zeros([1, 0, cfg.hcCount * cfg.hiddenSize], dtype: h.dtype)
            }
            if layerMajor {
                // Preserve the established 4096-token compute shapes while
                // sharing expert reads over the whole layer frontier.
                var bases: [MLXArray] = [], inputs: [MLXArray] = [], injections: [MLXArray] = []
                let historyBase = history.count - S
                for range in ranges {
                    let (lo, hi) = (range.lowerBound, range.upperBound)
                    let begin = max(0, historyBase + lo - (cfg.ngramSize - 1))
                    let lastQuery = terminalLastQuery && l == runLayers - 1
                    if lastQuery && hi < S {
                        // Earlier tiles contribute only persistent keys. Keep
                        // each original PLE/HC/projection compute shape.
                        var hidden = h[0..., lo ..< hi, 0...]
                        if let p = ple[l] {
                            p.boundedTokens = true
                            hidden = try hidden + p(hidden, history: Array(history[begin ..< historyBase + hi]),
                                nNew: hi - lo, cache: state.linear[l])
                        }
                        qsa[l]!.appendKeysOnly(attnHC[l](hidden).0, rope: rope,
                            cache: state.kv[l]!, idxCache: state.indexer[l]!)
                        if shouldContinue?() == false { return nil }
                        continue
                    }
                    let prepared = try prepareScopeAttention(layer: l, hidden: h[0..., lo ..< hi, 0...],
                        history: Array(history[begin ..< historyBase + hi]), state: state, lastQueryOnly: lastQuery)
                    eval(prepared.base, prepared.input, prepared.injection)
                    state.linear[l]?.compactWindows()
                    if shouldContinue?() == false { return nil }
                    bases.append(prepared.base); inputs.append(prepared.input); injections.append(prepared.injection)
                }
                let base = concatenated(bases, axis: 1)
                let input = concatenated(inputs, axis: 1)
                let injection = concatenated(injections, axis: 1)
                if optimizations.compactScopeFrontier {
                    // The previous frontier and the component arrays are no
                    // longer needed after their joined values materialize.
                    // Release them before loading the full expert workspace.
                    eval(base, input, injection)
                    bases.removeAll(); inputs.removeAll(); injections.removeAll()
                    h = base
                }
                MemTrace.mark("scope-frontier", nil)
                moe[l]!.routerObserver = routerObserver
                moe[l]!.useLayerWorkspace = true
                if terminalPruning, l == runLayers - 1, demand == .lastRow {
                    moe[l]!.useLayerWorkspace = false
                    moe[l]!.workspaceComputeRanges = []
                    let row = input.dim(1) - 1
                    let output = try moe[l]!(input[0..., row..., 0...])
                    h = base[0..., row..., 0...] + (output.expandedDimensions(axis: -2)
                        * injection[0..., row..., 0...].expandedDimensions(axis: -1)).reshaped([1, 1, cfg.hcCount * cfg.hiddenSize])
                    terminalMoERowsSkipped += S - 1
                    if terminalLastQuery { terminalQueryRowsSkipped += S - input.dim(1) }
                } else {
                    let output = try moe[l]!(input)
                    h = base + (output.expandedDimensions(axis: -2)
                        * injection.expandedDimensions(axis: -1)).reshaped(base.shape)
                }
                eval(h)
                MemTrace.mark("layer-end", h)
                perLayerHook?(l, h)
                continue
            }
            if let p = ple[l] {
                p.boundedTokens = optimizations.boundedPLE
                h = try h + p(h, history: history, nNew: S, cache: state.linear[l] ?? nil)
                MemTrace.mark("ple", h)
            }
            let dbgLayer = Self.debugLayer
            let (x1, inj1) = attnHC[l](h)
            if l == dbgLayer { Self.debugDump("x1", x1); Self.debugDump("inj1", inj1!) }
            contextNumericsObserver?(l, "x1", x1)
            contextNumericsObserver?(l, "inj1", inj1!)
            MemTrace.mark("hc1", x1)
            if terminalPruning, l == runLayers - 1, demand == .stateOnly {
                qsa[l]!.appendKeysOnly(x1, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!)
                if shouldContinue?() == false { return nil }
                terminalQueryRowsSkipped += S; terminalMoERowsSkipped += S
                state.tokenCount += S
                state.committedBoundaryValid = true
                return MLXArray.zeros([1, 0, cfg.hcCount * cfg.hiddenSize], dtype: h.dtype)
            }
            let attnOut: MLXArray
            if let g = gdn[l] {
                g.fusedRecording = optimizations.fusedGDNRecording
                attnOut = g(x1, cache: state.linear[l])
            } else {
                qsa[l]!.stableSmallKeyDomain = stableSmallPrefillAttention && smallPrefillSweep
                qsa[l]!.smallReferenceStart = smallPrefillReferenceStart
                qsa[l]!.smallReferenceEnd = smallPrefillReferenceEnd
                qsa[l]!.indexer.incrementalBlocks = optimizations.incrementalIndexer
                qsa[l]!.boundedIndexer = optimizations.boundedIndexer
                attnOut = qsa[l]!(x1, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!,
                    lastQueryOnly: terminalLastQuery && l == runLayers - 1)
            }
            contextNumericsObserver?(l, "attn", attnOut)
            MemTrace.mark("attn", attnOut)
            if l == dbgLayer { Self.debugDump("attn", attnOut) }
            let lastQuery = terminalLastQuery && l == runLayers - 1
            let attentionInjection: MLXArray
            if lastQuery {
                let first = S - attnOut.dim(1)
                h = h[0..., first..., 0...]
                attentionInjection = inj1![0..., first..., 0...]
                terminalQueryRowsSkipped += first
            } else { attentionInjection = inj1! }
            h = h + (attnOut.expandedDimensions(axis: -2) * attentionInjection.expandedDimensions(axis: -1))
                .reshaped(h.shape)
            contextNumericsObserver?(l, "hAfterAttn", h)
            if l == dbgLayer { Self.debugDump("hAfterAttn", h) }

            let pruneLastMoE = terminalPruning && l == runLayers - 1 && demand == .lastRow
            let (fullMLPInput, fullMLPInjection) = mlpHC[l](h)
            let mlpRow = h.dim(1) - 1
            let x2 = pruneLastMoE ? fullMLPInput[0..., mlpRow..., 0...] : fullMLPInput
            let inj2 = pruneLastMoE ? fullMLPInjection![0..., mlpRow..., 0...] : fullMLPInjection
            if pruneLastMoE {
                h = h[0..., mlpRow..., 0...]
                terminalMoERowsSkipped += S - 1
            }
            if l == dbgLayer { Self.debugDump("x2", x2) }
            contextNumericsObserver?(l, "x2", x2)
            contextNumericsObserver?(l, "inj2", inj2!)
            MemTrace.mark("hc2", x2)
            moe[l]!.routerObserver = routerObserver
            moe[l]!.useLayerWorkspace = optimizations.layerExpertWorkspace
            moe[l]!.disjointOutput = optimizations.disjointSweepOutput
            moe[l]!.boundedRows = optimizations.boundedSweepRows
            // A canonical terminal pass shorter than 256 uses the pool path.
            // Its smaller subpasses must preserve that expert arithmetic too.
            moe[l]!.smallPrefillSweep = smallPrefillSweep && referenceRows == 256
            moe[l]!.routerProjection.minimumRows = stableSmallPrefillRouting && smallPrefillSweep && S < referenceRows ? referenceRows : 0
            if let observe = contextNumericsObserver {
                moe[l]!.contextNumericsObserver = { name, value in observe(l, name, value) }
            } else { moe[l]!.contextNumericsObserver = nil }
            let moeOut = try moe[l]!(x2)
            contextNumericsObserver?(l, "moe", moeOut)
            if l == dbgLayer { Self.debugDump("moe", moeOut) }
            MemTrace.mark("moe", moeOut)
            h = h + (moeOut.expandedDimensions(axis: -2) * inj2!.expandedDimensions(axis: -1))
                .reshaped(h.shape)

            // synchronize the layer so pool references release before the next
            // layer's ensure() scatters (keeps slot writes in place, see PLAN §4.2)
            eval(h)
            // The layer has finished reading the convolution parent. Compact
            // only multi-token passes; a one-token decode parent is bounded
            // to the small convolution window plus one row already.
            if optimizations.compactStateWindows, S > 1 {
                state.linear[l]?.compactWindows()
            }
            MemTrace.mark("layer-end", h)
            perLayerHook?(l, h)
        }
        if shouldContinue?() == false { return nil }
        state.tokenCount += S
        state.committedBoundaryValid = true
        return h
    }

    private func mixScope(_ h: MLXArray, computeRanges: [Range<Int>]? = nil) -> MLXArray {
        let ranges = computeRanges ?? stride(from: 0, to: h.dim(1), by: 4096).map { $0 ..< min(h.dim(1), $0 + 4096) }
        guard optimizations.layerExpertWorkspace, ranges.count > 1 else { return mixer(h).0 }
        var outputs: [MLXArray] = []
        for range in ranges {
            let mixed = mixer(h[0..., range, 0...]).0
            eval(mixed); outputs.append(mixed)
        }
        return concatenated(outputs, axis: 1)
    }

    private func prepareScopeAttention(layer l: Int, hidden: MLXArray, history: [Int64], state: State, lastQueryOnly: Bool = false)
        throws -> (base: MLXArray, input: MLXArray, injection: MLXArray) {
        var h = hidden
        if let p = ple[l] {
            p.boundedTokens = true
            h = try h + p(h, history: history, nNew: h.dim(1), cache: state.linear[l])
        }
        let (x1, inject) = attnHC[l](h)
        let attention: MLXArray
        if let g = gdn[l] {
            g.fusedRecording = optimizations.fusedGDNRecording
            attention = g(x1, cache: state.linear[l])
        } else {
            qsa[l]!.indexer.incrementalBlocks = optimizations.incrementalIndexer
            qsa[l]!.boundedIndexer = true
            attention = qsa[l]!(x1, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!, lastQueryOnly: lastQueryOnly)
        }
        let attentionInjection: MLXArray
        if lastQueryOnly {
            let first = h.dim(1) - attention.dim(1)
            h = h[0..., first..., 0...]
            attentionInjection = inject![0..., first..., 0...]
        } else { attentionInjection = inject! }
        h = h + (attention.expandedDimensions(axis: -2) * attentionInjection.expandedDimensions(axis: -1)).reshaped(h.shape)
        let (x2, inject2) = mlpHC[l](h)
        return (h, x2, inject2!)
    }

    /// Transactional prefill: only a completed whole-model scope is reusable.
    /// The checkpoint owns old recurrent states; append-only sequence caches
    /// restore logical offsets while retaining (and charging) grown capacity.
    package func consumeReadScope(_ ids: [Int], passes: [Int], state: State,
                          vision: [VisionRun], head: MTPHead?, final: Bool,
                          shouldContinue: (() -> Bool)?) -> (logits: MLXArray?, committed: Bool) {
        checkpointCompatibility {
            try consumeReadScopeChecked(ids, passes: passes, state: state, vision: vision,
                head: head, final: final, shouldContinue: shouldContinue)
        }
    }

    package func consumeReadScopeChecked(_ ids: [Int], passes: [Int], state: State,
                          vision: [VisionRun], head: MTPHead?, final: Bool,
                          shouldContinue: (() -> Bool)?) throws -> (logits: MLXArray?, committed: Bool) {
        precondition(!passes.isEmpty && passes.allSatisfy { $0 > 0 } && passes.reduce(0, +) == ids.count)
        try validateForward(ids, state: state)
        var offset = 0
        let ranges = passes.map { n -> Range<Int> in
            defer { offset += n }; return offset ..< offset + n
        }
        let checkpoint = state.checkpoint()
        var committed = false
        defer {
            if !committed { state.restore(checkpoint); state.setRecording(false) }
        }
        let demand: HiddenDemand = head != nil ? .fullMulti
            : final ? .lastRow : optimizations.demandedPrefillOutput ? .stateOnly : .fullMulti
        guard let multi = try runHiddenMulti(ids, state: state, vision: vision,
            computeRanges: ranges, shouldContinue: shouldContinue, demand: demand) else { return (nil, false) }
        if let head {
            for range in ranges {
                if shouldContinue?() == false { return (nil, false) }
                state.lastMulti = try head.consumeChecked(chunk: Array(ids[range]),
                    chunkMulti: multi[0..., range, 0...], prevMulti: state.lastMulti,
                    resident: resident, rope: rope, state: state.mtp!,
                    vision: vision.compactMap { $0.clipped(to: range.lowerBound, range.upperBound) },
                    compactRetainedRow: optimizations.compactMTPRow)
            }
        }
        var logits: MLXArray?
        if final || !optimizations.demandedPrefillOutput {
            let mixed = mixScope(multi, computeRanges: multi.dim(1) == ids.count ? ranges : nil)
            if final { logits = lmHead(mixed[0..., (mixed.dim(1) - 1)..., 0...]); eval(logits!) }
            else { eval(mixed) }
        }
        if shouldContinue?() == false { return (nil, false) }
        committed = true
        return (logits, true)
    }

    /// All state-producing operations complete. The terminal QSA outputs,
    /// MoE and final mixer have no state needed by subsequent prompt passes.
    package func consumePrompt(_ ids: [Int], state: State, vision: [VisionRun] = []) {
        checkpointCompatibility { try consumePromptChecked(ids, state: state, vision: vision) }
    }

    package func consumePromptChecked(_ ids: [Int], state: State, vision: [VisionRun] = []) throws {
        _ = try runHiddenMulti(ids, state: state, vision: vision, demand: .stateOnly)
    }

    /// Like `hiddenStates`, but also returns the pre-final-mixer multi stream
    /// (B,S,hc*H) — the hidden the MTP draft head consumes ("scheme A": the
    /// main model truly emits the pre-mixer stream on the first draft step).
    public func hiddenStatesWithMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) -> (mixed: MLXArray, multi: MLXArray) {
        checkpointCompatibility { try hiddenStatesWithMultiChecked(ids, state: state, vision: vision) }
    }

    public func hiddenStatesWithMultiChecked(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) throws -> (mixed: MLXArray, multi: MLXArray) {
        let multi = try hiddenMulti(ids, state: state, vision: vision)
        return (mixScope(multi), multi)
    }

    /// Logits for the last position only.
    public func lastLogits(_ ids: [Int], state: State, vision: [VisionRun] = []) -> MLXArray {
        checkpointCompatibility { try lastLogitsChecked(ids, state: state, vision: vision) }
    }

    public func lastLogitsChecked(_ ids: [Int], state: State, vision: [VisionRun] = []) throws -> MLXArray {
        let multi = try runHiddenMulti(ids, state: state, vision: vision, demand: .lastRow)!
        let hidden = mixScope(multi)
        let last = hidden[0..., (hidden.dim(1) - 1)..., 0...]
        return lmHead(last)  // (1,1,vocab)
    }

    /// Logits at EVERY position plus the pre-mixer multi stream — the
    /// speculative verify pass needs both. S stays small (draft length + 1).
    public func allLogitsWithMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) -> (logits: MLXArray, multi: MLXArray) {
        checkpointCompatibility { try allLogitsWithMultiChecked(ids, state: state, vision: vision) }
    }

    public func allLogitsWithMultiChecked(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) throws -> (logits: MLXArray, multi: MLXArray) {
        let (mixed, multi) = try hiddenStatesWithMultiChecked(ids, state: state, vision: vision)
        return (lmHead(mixed), multi)
    }
}

/// A zero-copy snapshot of a State, for speculative-decode rollback. The
/// recurrent caches' arrays are REPLACED on every step (the GDN kernel emits
/// a fresh state_out; conv windows are re-sliced), never mutated in place, so
/// holding references is enough. KV/indexer buffers ARE written in place, but
/// only at rows past their offset — rolling the offset back is a full undo.
/// Compact main indexers additionally retain their bounded raw/pooled storage
/// here, so a cancelled long scope can undo released raw history exactly.
public struct StateCheckpoint {
    var lifetime: StateCheckpointLifetime
    var conv: [Int: MLXArray]
    var ssm: [Int: MLXArray]
    var pleConv: [Int: MLXArray]
    var kvOffsets: [Int: Int]
    var indexerOffsets: [Int: Int]
    var indexerSnapshots: [Int: IndexerCache.Snapshot]
    var ngramCtx: [Int64]
    var tokenCount: Int
    var committedBoundaryValid: Bool
    var mtpBoundaryValid: Bool
    var mtpOffset: Int
    var lastMulti: MLXArray?
}

extension Qwen4ExpModel.State {
    package func diagnosticIndexerBases() -> [String: Int] {
        Dictionary(uniqueKeysWithValues: indexer.map { ("index.\($0.key)", $0.value.rawBase) })
    }
    package var diagnosticDraftIndexerBase: Int? { mtp?.indexer.rawBase }
    /// Read-only logical state for exact continuation/ownership diagnostics.
    /// Indexer arrays expose the retained raw range, whose absolute base is
    /// available to package diagnostics. Released rows are represented by
    /// completed keys, not reconstructed or fabricated raw values.
    /// Returned arrays retain storage; release the snapshot before measuring
    /// liveness or memory. Unwritten KV capacity is deliberately excluded.
    public func diagnosticTensors() -> [String: MLXArray] {
        var result: [String: MLXArray] = [:]
        for (l, c) in linear {
            result["conv.\(l)"] = c.convState
            result["ssm.\(l)"] = c.ssmState
            result["ple.\(l)"] = c.pleConvState
        }
        for (l, c) in kv {
            result["key.\(l)"] = c.keys.map { $0[0..., 0..., 0 ..< c.offset, 0...] }
            result["value.\(l)"] = c.values.map { $0[0..., 0..., 0 ..< c.offset, 0...] }
        }
        for (l, c) in indexer { result["index.\(l)"] = c.diagnosticValues() }
        result["ngram"] = MLXArray(ngramCtx)
        result["tokens"] = MLXArray(Int64(tokenCount))
        result["lastMulti"] = lastMulti
        if let c = mtp {
            result["mtp.key"] = c.kv.keys.map { $0[0..., 0..., 0 ..< c.kv.offset, 0...] }
            result["mtp.value"] = c.kv.values.map { $0[0..., 0..., 0 ..< c.kv.offset, 0...] }
            result["mtp.index"] = c.indexer.diagnosticValues()
            result["mtp.offset"] = MLXArray(Int64(c.offset))
        }
        return result
    }

    public func checkpoint() -> StateCheckpoint {
        var conv: [Int: MLXArray] = [:]
        var ssm: [Int: MLXArray] = [:]
        var pleConv: [Int: MLXArray] = [:]
        for (l, c) in linear {
            if let a = c.convState { conv[l] = a }
            if let a = c.ssmState { ssm[l] = a }
            if let a = c.pleConvState { pleConv[l] = a }
        }
        checkpointLifetimes.removeAll { $0.value == nil }
        let lifetime = StateCheckpointLifetime(owner: checkpointIdentity, tokens: tokenCount,
            mtpOffset: mtp?.offset ?? 0)
        checkpointLifetimes.append(WeakStateCheckpointLifetime(lifetime))
        return StateCheckpoint(
            lifetime: lifetime, conv: conv, ssm: ssm, pleConv: pleConv,
            kvOffsets: kv.mapValues { $0.offset },
            indexerOffsets: indexer.mapValues { $0.offset },
            indexerSnapshots: indexer.compactMapValues { $0.snapshot() },
            ngramCtx: ngramCtx, tokenCount: tokenCount,
            committedBoundaryValid: committedBoundaryValid,
            mtpBoundaryValid: mtp == nil || hasValidMTP
                || (tokenCount == 0 && mtp?.offset == 0 && lastMulti == nil),
            mtpOffset: mtp?.offset ?? 0, lastMulti: lastMulti)
    }

    /// Start or stop recording per-position recurrent states in the linear
    /// layers (speculative verify passes only).
    public func setRecording(_ on: Bool) {
        recordingEnabled = on
        recordedTokenIds = nil
        recordingBaseTokenCount = nil
        for cache in indexer.values { cache.preserveRecordingRows(on) }
        for (_, cache) in linear {
            if on { cache.record = true } else { cache.clearRecording() }
        }
    }

    /// After a recording pass over `ids` from checkpoint `c`, keep only its
    /// first `n` tokens: recurrent states become the recorded ones at
    /// position n-1, KV and indexer caches trim to the checkpoint offset
    /// plus n, and the n-gram context is rebuilt from the ids. No model
    /// compute. `n` must be at least 1 and at most ids.count; keeping all of
    /// them only clears the recording.
    public func rollback(keeping n: Int, of ids: [Int], from c: StateCheckpoint, ngramWindow: Int) {
        do { try rollbackChecked(keeping: n, of: ids, from: c, ngramWindow: ngramWindow) }
        catch { preconditionFailure("\(error)") }
    }

    /// Recover only the recorded pass on this state; reject invalid input before mutation.
    public func rollbackChecked(keeping n: Int, of ids: [Int], from c: StateCheckpoint, ngramWindow: Int) throws {
        try validateRollback(keeping: n, ids: ids, checkpoint: c, ngramWindow: ngramWindow)
        if n < ids.count {
            for (_, cache) in linear {
                if !cache.ssmStates.isEmpty { cache.ssmState = cache.ssmStates[n - 1] }
                if !cache.convStates.isEmpty { cache.convState = cache.convStates[n - 1] }
                if !cache.pleConvStates.isEmpty { cache.pleConvState = cache.pleConvStates[n - 1] }
            }
            for (l, cache) in kv { cache.trim(to: (c.kvOffsets[l] ?? 0) + n) }
            for (l, cache) in indexer { cache.trim(to: (c.indexerOffsets[l] ?? 0) + n) }
            let history = c.ngramCtx + ids.prefix(n).map { Int64($0) }
            ngramCtx = Array(history.suffix(ngramWindow))
            tokenCount = c.tokenCount + n
        }
        invalidateCheckpoints(after: tokenCount, mtpOffset: nil)
        setRecording(false)
        if compactStateWindows {
            for cache in linear.values { cache.compactWindows() }
        }
    }

    /// Diagnostic for the rollback gate: the largest relative difference, over
    /// all linear layers, between this state's recurrent tensors and another's
    /// (max |a-b| / max |b|). A wrong window or a stale state reads order one;
    /// re-association reads bf16-ulp small.
    public func recurrentDelta(vs other: Qwen4ExpModel.State) -> (ssm: Double, conv: Double, ple: Double) {
        func delta(_ a: MLXArray?, _ b: MLXArray?) -> Double {
            guard let a, let b else { return (a == nil && b == nil) ? 0 : .infinity }
            guard a.shape == b.shape else { return .infinity }
            let d = abs(a.asType(.float32) - b.asType(.float32)).max().item(Float.self)
            let m = abs(b.asType(.float32)).max().item(Float.self)
            return Double(m > 0 ? d / m : d)
        }
        var s = 0.0, c = 0.0, p = 0.0
        for (l, cache) in linear {
            guard let o = other.linear[l] else { continue }
            s = max(s, delta(cache.ssmState, o.ssmState))
            c = max(c, delta(cache.convState, o.convState))
            p = max(p, delta(cache.pleConvState, o.pleConvState))
        }
        return (s, c, p)
    }

    public func restore(_ c: StateCheckpoint) {
        do { try restoreChecked(c) }
        catch { preconditionFailure("\(error)") }
    }

    /// Restore a live ancestor checkpoint from this exact state. KV storage is
    /// append-only, so snapshots from discarded future branches cannot be reused.
    public func restoreChecked(_ c: StateCheckpoint) throws {
        try validateCheckpoint(c)
        for (l, cache) in linear {
            cache.convState = c.conv[l]
            cache.ssmState = c.ssm[l]
            cache.pleConvState = c.pleConv[l]
        }
        for (l, cache) in kv {
            cache.trim(to: c.kvOffsets[l] ?? 0)
            if let k = cache.keys, let v = cache.values { eval(k, v) }
        }
        for (l, cache) in indexer {
            if let snapshot = c.indexerSnapshots[l] { cache.restore(snapshot) }
            else { cache.trim(to: c.indexerOffsets[l] ?? 0) }
            // Dense attention may not have evaluated raw indexer writes.
            // Detach their graph before a canceled scope releases its inputs.
            cache.materializeStorage()
        }
        ngramCtx = c.ngramCtx
        tokenCount = c.tokenCount
        committedBoundaryValid = c.committedBoundaryValid
        mtp?.trim(to: c.mtpOffset)
        mtp?.materialize()
        lastMulti = c.lastMulti
        invalidateCheckpoints(after: tokenCount, mtpOffset: c.mtpOffset)
        setRecording(false)
    }
}

// PLE cache slot rides on the linear cache of its (linear-attention) layer; if
// the PLE layer were ever a QSA layer this would need its own cache. Reject it
// at init time instead of failing silently.
extension Qwen4ExpModel {
    public func validate() throws {
        try Geometry.check(against: cfg, recordBytes: pool.recordBytes)
        for l in cfg.pleLayerIndices where l < runLayers {
            guard cfg.layerTypes[l] == "linear_attention" else {
                throw ModelError(
                    "PLE layer \(l) is not linear_attention, so its recurrent cache has no home — check --model")
            }
        }
    }
}

````````````

## Artifact SHA-256 9ec7c669fbe7c88a88ec55aedbdc7afb87b696182333324265fdf95f60a5a5f1

Encoding: `utf-8`. Original bytes: 14290.

````````````text
import Foundation

/// Independent controls retained while each candidate is qualified. Defaults
/// stay on the reference implementation until its acceptance gates pass.
public struct InferenceOptimizations: Codable, Equatable {
    public var compactStateWindows = false
    public var compactMTPRow = false
    public var skipUnusedFinalForward = false
    public var tailAwarePrefill = false
    public var demandedPrefillOutput = false
    public var terminalPrefillPruning = false
    /// Independent final-QSA output reduction; a 64-row tail retains matrix
    /// dispatch for attention/output/HC, and shorter passes keep every row.
    /// Requires terminal prefill demand.
    package static let terminalQueryTile = 64
    public var terminalLastQuery = false
    public var compactNgramRows = false
    public var incrementalIndexer = false
    public var compactIndexerRaw = false
    public var valueOnlySamplerThreshold = false
    public var deviceSamplerDraw = false
    public var disjointSweepOutput = false
    public var boundedSweepRows = false
    public var boundedIndexer = false
    public var sharedRoPE = false
    public var fusedRoPE = false
    /// Requires the optional shared-backing layout at model construction.
    public var fusedGDNProjection = false
    public var fusedGDNRecording = false
    public var boundedPLE = false
    public var ngramLookahead = false
    public var layerExpertWorkspace = false
    public var workspaceTokenTile = 256
    public var compactScopeFrontier = false
    public var workspacePiecewiseWrites = false
    /// Experimental bounded layer-major scope; zero keeps chronological passes.
    public var readScopeTokens = 0
    public var reuseFirstMTPEntry = false
    /// Experimental shortening changes verification shapes and can change
    /// greedy output. Excluded from the combined candidate; sampled requests
    /// retain their original shapes. Independent context bounds always apply.
    public var boundedDraftTail = false
    public var adaptiveSpeculation = false
    public var resolvedRuntimeBudget = false
    public var layerLocalFloorCache = false
    public var boundedOutputQueue = false
    public var responsiveGovernor = false
    public var routerTopK = false
    public var denseIndexerBypass = false
    public var indexerBlockTopK = false
    public var overlapSharedExpert = false
    public var overlapResidentExperts = false
    public var deduplicateImages = false
    public var visionAttentionPadding = 0
    /// Independent, bounded original-attention path. Qualification pending.
    public var visionQueryTile = 0
    public var cachedRouterWeights = false
    public var directReadHandles = false
    public var compiledNormFinish = false
    public var selectedTextAttention = false
    public var ngramRingOrder = false
    public var denseExpertLookup = false
    public var sparsePoolPins = false
    public var contiguousSlotWrites = false
    public var wordSlotWrites = false
    public var cpuSlotWrites = false
    /// Exact already-scheduled commit boundary; zero disables common-prefix retention.
    public var prefixCheckpointTokens = 0
    /// Retain the complete committed prompt and its raw last logits. This is
    /// independently qualified before joining integrationCandidate.
    public var completePromptCheckpoint = false

    public var readScopeEnabled: Bool {
        readScopeTokens > 0 && layerExpertWorkspace && compactStateWindows
            && compactMTPRow && boundedIndexer && boundedPLE
    }

    public init() {}

    /// The next joint qualification candidate. Explicit selection only; this
    /// does not change public initializer or environment defaults. Row-backed
    /// embeddings are selected independently at model construction.
    package static var integrationCandidate: Self {
        var result = Self()
        result.compactStateWindows = true
        result.compactMTPRow = true
        result.compactNgramRows = true
        result.skipUnusedFinalForward = true
        result.valueOnlySamplerThreshold = true
        result.deviceSamplerDraw = true
        result.boundedOutputQueue = true
        result.responsiveGovernor = true
        result.prefixCheckpointTokens = 256
        result.completePromptCheckpoint = true
        result.sharedRoPE = true
        result.fusedRoPE = true
        return result
    }

    /// Candidate for eventual automatic selection after combined acceptance.
    /// Public/environment defaults remain unchanged until that gate passes.
    /// Explicit experimental controls and diagnostics can still qualify a new
    /// platform; the kernel's initialization and shape fallbacks also apply.
    package static func deploymentCandidate(on platform: OptimizationPlatform = .current) -> Self {
        var result = integrationCandidate
        result.fusedRoPE = result.fusedRoPE && platform.qualifiedPartialRotation
        return result
    }

    public static func environment(_ env: [String: String] = ProcessInfo.processInfo.environment) throws -> Self {
        try resolving(environment: env, defaults: Self())
    }

    /// Apply explicit overrides to a selected default family. Keeping this
    /// separate lets deployment qualify the actual resolution path while the
    /// public default and the explicit reference initializer remain unchanged.
    package static func resolving(environment env: [String: String], defaults: Self) throws -> Self {
        var result = defaults
        var recognized = Set<String>()
        func flag(_ name: String, fallback: Bool) throws -> Bool {
            recognized.insert(name)
            guard let value = env[name] else { return fallback }
            guard value == "0" || value == "1" else {
                throw ModelError("\(name) must be 0 or 1")
            }
            return value == "1"
        }
        result.compactStateWindows = try flag("SLOTSTREAM_OPT_COMPACT_STATE", fallback: result.compactStateWindows)
        result.completePromptCheckpoint = try flag("SLOTSTREAM_OPT_COMPLETE_PROMPT", fallback: result.completePromptCheckpoint)
        result.compactMTPRow = try flag("SLOTSTREAM_OPT_COMPACT_MTP", fallback: result.compactMTPRow)
        result.skipUnusedFinalForward = try flag("SLOTSTREAM_OPT_FINAL_FORWARD", fallback: result.skipUnusedFinalForward)
        result.tailAwarePrefill = try flag("SLOTSTREAM_OPT_TAIL_SCHEDULE", fallback: result.tailAwarePrefill)
        result.demandedPrefillOutput = try flag("SLOTSTREAM_OPT_OUTPUT_DEMAND", fallback: result.demandedPrefillOutput)
        result.terminalPrefillPruning = try flag("SLOTSTREAM_OPT_TERMINAL_PREFILL", fallback: result.terminalPrefillPruning)
        result.terminalLastQuery = try flag("SLOTSTREAM_OPT_TERMINAL_QUERY", fallback: result.terminalLastQuery)
        guard !result.terminalLastQuery || result.terminalPrefillPruning else {
            throw ModelError("TERMINAL_QUERY requires TERMINAL_PREFILL")
        }
        result.compactNgramRows = try flag("SLOTSTREAM_OPT_NGRAM_ROWS", fallback: result.compactNgramRows)
        result.incrementalIndexer = try flag("SLOTSTREAM_OPT_INDEXER_BLOCKS", fallback: result.incrementalIndexer)
        result.compactIndexerRaw = try flag("SLOTSTREAM_OPT_INDEXER_RAW", fallback: result.compactIndexerRaw)
        guard !result.compactIndexerRaw || result.incrementalIndexer else {
            throw ModelError("INDEXER_RAW requires INDEXER_BLOCKS")
        }
        result.valueOnlySamplerThreshold = try flag("SLOTSTREAM_OPT_SAMPLER_THRESHOLD", fallback: result.valueOnlySamplerThreshold)
        result.deviceSamplerDraw = try flag("SLOTSTREAM_OPT_SAMPLER_DRAW", fallback: result.deviceSamplerDraw)
        result.disjointSweepOutput = try flag("SLOTSTREAM_OPT_SWEEP_PLACEMENT", fallback: result.disjointSweepOutput)
        result.boundedSweepRows = try flag("SLOTSTREAM_OPT_SWEEP_TILES", fallback: result.boundedSweepRows)
        result.boundedIndexer = try flag("SLOTSTREAM_OPT_INDEXER_TILES", fallback: result.boundedIndexer)
        result.sharedRoPE = try flag("SLOTSTREAM_OPT_SHARED_ROPE", fallback: result.sharedRoPE)
        result.fusedRoPE = try flag("SLOTSTREAM_OPT_FUSED_ROPE", fallback: result.fusedRoPE)
        result.fusedGDNProjection = try flag("SLOTSTREAM_OPT_GDN_PROJECTION", fallback: result.fusedGDNProjection)
        result.fusedGDNRecording = try flag("SLOTSTREAM_OPT_GDN_RECORD", fallback: result.fusedGDNRecording)
        result.boundedPLE = try flag("SLOTSTREAM_OPT_PLE_TILES", fallback: result.boundedPLE)
        result.ngramLookahead = try flag("SLOTSTREAM_OPT_NGRAM_LOOKAHEAD", fallback: result.ngramLookahead)
        result.layerExpertWorkspace = try flag("SLOTSTREAM_OPT_LAYER_WORKSPACE", fallback: result.layerExpertWorkspace)
        result.reuseFirstMTPEntry = try flag("SLOTSTREAM_OPT_MTP_FIRST_ENTRY", fallback: result.reuseFirstMTPEntry)
        result.boundedDraftTail = try flag("SLOTSTREAM_OPT_MTP_TAIL", fallback: result.boundedDraftTail)
        result.adaptiveSpeculation = try flag("SLOTSTREAM_OPT_ADAPTIVE_MTP", fallback: result.adaptiveSpeculation)
        result.resolvedRuntimeBudget = try flag("SLOTSTREAM_OPT_RUNTIME_BUDGET", fallback: result.resolvedRuntimeBudget)
        result.layerLocalFloorCache = try flag("SLOTSTREAM_OPT_FLOOR_CACHE", fallback: result.layerLocalFloorCache)
        result.boundedOutputQueue = try flag("SLOTSTREAM_OPT_OUTPUT_QUEUE", fallback: result.boundedOutputQueue)
        result.responsiveGovernor = try flag("SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR", fallback: result.responsiveGovernor)
        result.routerTopK = try flag("SLOTSTREAM_OPT_ROUTER_TOPK", fallback: result.routerTopK)
        result.denseIndexerBypass = try flag("SLOTSTREAM_OPT_INDEXER_DENSE", fallback: result.denseIndexerBypass)
        result.indexerBlockTopK = try flag("SLOTSTREAM_OPT_INDEXER_TOPK", fallback: result.indexerBlockTopK)
        result.overlapSharedExpert = try flag("SLOTSTREAM_OPT_SHARED_OVERLAP", fallback: result.overlapSharedExpert)
        result.overlapResidentExperts = try flag("SLOTSTREAM_OPT_RESIDENT_OVERLAP", fallback: result.overlapResidentExperts)
        result.deduplicateImages = try flag("SLOTSTREAM_OPT_IMAGE_REUSE", fallback: result.deduplicateImages)
        result.directReadHandles = try flag("SLOTSTREAM_OPT_READ_HANDLES", fallback: result.directReadHandles)
        result.compiledNormFinish = try flag("SLOTSTREAM_OPT_COMPILED_NORM", fallback: result.compiledNormFinish)
        result.selectedTextAttention = try flag("SLOTSTREAM_OPT_SELECTED_ATTENTION", fallback: result.selectedTextAttention)
        result.ngramRingOrder = try flag("SLOTSTREAM_OPT_NGRAM_RING", fallback: result.ngramRingOrder)
        result.denseExpertLookup = try flag("SLOTSTREAM_OPT_EXPERT_MAP", fallback: result.denseExpertLookup)
        result.sparsePoolPins = try flag("SLOTSTREAM_OPT_POOL_PINS", fallback: result.sparsePoolPins)
        result.contiguousSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_SLICES", fallback: result.contiguousSlotWrites)
        result.wordSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_WORDS", fallback: result.wordSlotWrites)
        result.cpuSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_CPU", fallback: result.cpuSlotWrites)
        guard !result.cpuSlotWrites || (!result.wordSlotWrites && !result.contiguousSlotWrites) else {
            throw ModelError("SLOT_CPU cannot be combined with SLOT_WORDS or SLOT_SLICES")
        }
        let checkpointKey = "SLOTSTREAM_OPT_PREFIX_CHECKPOINT"
        recognized.insert(checkpointKey)
        if let value = env[checkpointKey] {
            guard let n = Int(value), [0, 256, 512, 1024, 2048, 4096].contains(n) else {
                throw ModelError("\(checkpointKey) must be 0, 256, 512, 1024, 2048 or 4096")
            }
            result.prefixCheckpointTokens = n
        }
        result.cachedRouterWeights = try flag("SLOTSTREAM_OPT_ROUTER_WEIGHTS", fallback: result.cachedRouterWeights)
        let visionPaddingKey = "SLOTSTREAM_OPT_VISION_PADDING"
        recognized.insert(visionPaddingKey)
        if let value = env[visionPaddingKey] {
            guard let n = Int(value), [0, 80, 128].contains(n) else {
                throw ModelError("\(visionPaddingKey) must be 0, 80 or 128")
            }
            result.visionAttentionPadding = n
        }
        let visionTileKey = "SLOTSTREAM_OPT_VISION_QUERY_TILE"
        recognized.insert(visionTileKey)
        if let value = env[visionTileKey] {
            guard let n = Int(value), [0, 256].contains(n) else {
                throw ModelError("\(visionTileKey) must be 0 or 256")
            }
            result.visionQueryTile = n
        }
        guard result.visionQueryTile == 0 || result.visionAttentionPadding == 0 else {
            throw ModelError("VISION_QUERY_TILE and VISION_PADDING are independent candidates")
        }
        result.compactScopeFrontier = try flag("SLOTSTREAM_OPT_SCOPE_FRONTIER", fallback: result.compactScopeFrontier)
        result.workspacePiecewiseWrites = try flag("SLOTSTREAM_OPT_WORKSPACE_PIECES", fallback: result.workspacePiecewiseWrites)
        let tileKey = "SLOTSTREAM_OPT_WORKSPACE_TILE"
        recognized.insert(tileKey)
        if let value = env[tileKey] {
            guard let n = Int(value), [256, 512, 1024, 2048, 4096].contains(n) else {
                throw ModelError("\(tileKey) must be 256, 512, 1024, 2048 or 4096")
            }
            result.workspaceTokenTile = n
        }
        let scopeKey = "SLOTSTREAM_OPT_READ_SCOPE"
        recognized.insert(scopeKey)
        if let value = env[scopeKey] {
            guard let n = Int(value), [0, 1024, 4096, 8192].contains(n) else {
                throw ModelError("\(scopeKey) must be 0, 1024, 4096 or 8192")
            }
            result.readScopeTokens = n
        }
        guard result.readScopeTokens == 0 || result.readScopeEnabled else {
            throw ModelError("read scopes require LAYER_WORKSPACE, COMPACT_STATE, COMPACT_MTP, INDEXER_TILES and PLE_TILES")
        }
        let unknown = env.keys.filter { $0.hasPrefix("SLOTSTREAM_OPT_") && !recognized.contains($0) }.sorted()
        guard unknown.isEmpty else { throw ModelError("unknown optimization controls: \(unknown.joined(separator: ", "))") }
        return result
    }
}

````````````

## Artifact SHA-256 d1021e321894868c4844f2cbe4978c3ca6c6cfa958c9aa64591e9d0ec08e8ff7

Encoding: `utf-8`. Original bytes: 57154.

````````````text
// Memory planning: turn "how much of this Mac may I use" into slot counts.
//
// One policy, used by the CLI (run/serve/doctor), printed at startup, and
// exposed over /api/show — so what the process *does* and what it *says* can
// never drift apart.

import Foundation

/// Model geometry the cache math speaks in. The planner needs these before the
/// checkpoint is opened, so they are constants — `check(against:recordBytes:)`
/// rejects a checkpoint that does not match once the engine has it.
public enum Geometry {
    public static let layers = 48
    public static let expertsPerLayer = 512
    public static let recordBytes = 2_764_800.0
    public static let totalRecords = layers * expertsPerLayer
    /// Prefill can pin up to one full layer of experts (256-token chunk × top-10
    /// covers ~all 512) plus an in-flight miss batch; below this the eviction
    /// scan has no victim. 640 global ≈ 13/layer equivalent.
    public static let floorSlots = 640

    public static func gb(_ globalSlots: Int) -> Double { Double(globalSlots) * recordBytes / 1e9 }
    public static func perLayer(_ globalSlots: Int) -> Double { Double(globalSlots) / Double(layers) }
    /// Convert a raw GB budget without ever converting an attacker-sized
    /// Double directly to Int (which traps in Swift when it is out of range).
    public static func slotsForPoolGB(_ poolGB: Double) -> Int {
        guard poolGB.isFinite else { return poolGB > 0 ? totalRecords : floorSlots }
        if poolGB >= gb(totalRecords) { return totalRecords }
        if poolGB <= gb(floorSlots) { return floorSlots }
        return Int(poolGB * 1e9 / recordBytes)
    }
    /// GB of pool per expert-per-layer (N experts/layer costs N × this).
    public static var gbPerExpertPerLayer: Double { Double(layers) * recordBytes / 1e9 }

    /// The planner sizes memory from the constants above while the engine
    /// allocates from config.json. If they ever disagree, every memory number
    /// the user is shown is wrong, so fail loudly instead of drifting.
    public static func check(against cfg: ModelConfig, recordBytes actual: Int) throws {
        guard cfg.numLayers == layers, cfg.numExperts == expertsPerLayer,
            Double(actual) == recordBytes
        else {
            throw ModelError(
                "model geometry does not match the supported checkpoint: config has "
                    + "\(cfg.numLayers) layers x \(cfg.numExperts) experts x \(actual) "
                    + "B/record, expected \(layers) x \(expertsPerLayer) x "
                    + "\(Int(recordBytes)) B — check --model")
        }
    }
}

public struct PlanError: Error, CustomStringConvertible {
    public let description: String
    public init(_ s: String) { description = s }
}

/// Explicit process controls whose unused reservations can become expert
/// capacity. Kept with the plan so vision loading and the governor cannot
/// silently restore an allocation after its budget has been spent.
public struct RuntimeAllocationPolicy: Equatable, Sendable {
    public let prefillChunkOverride: Int?
    public let prefixCacheEnabled: Bool

    public init(prefillChunkOverride: Int? = nil, prefixCacheEnabled: Bool = true) throws {
        if let chunk = prefillChunkOverride, !(256 ... 4096).contains(chunk) {
            throw PlanError("runtime allocation planning requires a prefill chunk between 256 and 4096")
        }
        self.prefillChunkOverride = prefillChunkOverride
        self.prefixCacheEnabled = prefixCacheEnabled
    }
}

/// The resolved memory decision: which knob decided it, what it costs, and
/// what to expect. Everything user-facing about memory comes from here.
public struct MemoryPlan {
    public enum Source: String {
        case expertsPerLayer = "--experts-per-layer"
        case poolGB = "--pool-gb"
        case memoryGB = "--memory-gb"
        case auto = "auto"
    }

    public let source: Source
    public let slots: Int
    /// Total-process target in GB when the plan came from --memory-gb or auto.
    public let targetGB: Double?
    public let ramGB: Double
    public let workingSetGB: Double
    /// The RAM share auto was allowed (--max-ram-percent, default 70). Carried
    /// so the elastic governor grows back to the user's policy, not the default.
    public let ramPercent: Double
    /// Memory reclaimable at planning time (nil = could not be read).
    public let availableGB: Double?
    /// True when auto sized itself down because of what other apps hold now.
    public let clamped: Bool
    /// Tokens per prefill pass, chosen with the pool from the same budget.
    public let prefillChunk: Int
    /// Conversation state the prefix cache may retain, in tokens. Sized and
    /// charged from the same budget as the pool.
    public let prefixCacheTokens: Int
    /// Whether the MTP draft head loads (self-speculative decode). Charged as
    /// a fixed resident block; the pool is sized from what remains.
    public let mtpEnabled: Bool
    /// Whether an image request may load the tower in this process.
    public let visionEnabled: Bool
    /// A loaded tower is charged inside the total-process target. Merely
    /// accepting images does not take expert capacity from text requests.
    public let visionResidentReserved: Bool
    /// True when this plan was made for a simulated device (`doctor --sim-*`).
    /// Such a plan may be printed and compared, never loaded: a simulated
    /// availability figure still produces a real allocation.
    public var simulated = false
    /// Longest prompt plus reply a request may hold (`--max-context`). State
    /// for the first `ContextPolicy.tokensInFixedFootprint` tokens is inside
    /// the fixed footprint; anything above is charged separately.
    public let maxContextTokens: Int
    public let notes: [String]
    public let runtimeAllocationPolicy: RuntimeAllocationPolicy?
    public let maxPrefillWaitMinutes: Double
    public let contextQualification: Bool

    public init(
        source: Source, slots: Int, targetGB: Double?,
        ramGB: Double, workingSetGB: Double, ramPercent: Double,
        availableGB: Double?, clamped: Bool,
        prefillChunk: Int, prefixCacheTokens: Int, mtpEnabled: Bool = false,
        visionEnabled: Bool = false,
        visionResidentReserved: Bool = false,
        maxContextTokens: Int = ContextPolicy.defaultTokens,
        notes: [String], simulated: Bool = false,
        runtimeAllocationPolicy: RuntimeAllocationPolicy? = nil,
        maxPrefillWaitMinutes: Double = 30, contextQualification: Bool = false
    ) {
        self.source = source
        self.slots = slots
        self.targetGB = targetGB
        self.ramGB = ramGB
        self.workingSetGB = workingSetGB
        self.ramPercent = ramPercent
        self.availableGB = availableGB
        self.clamped = clamped
        self.prefillChunk = prefillChunk
        self.prefixCacheTokens = prefixCacheTokens
        self.mtpEnabled = mtpEnabled
        self.visionEnabled = visionEnabled
        self.visionResidentReserved = visionResidentReserved
        self.maxContextTokens = maxContextTokens
        self.notes = notes
        self.simulated = simulated
        self.runtimeAllocationPolicy = runtimeAllocationPolicy
        self.maxPrefillWaitMinutes = maxPrefillWaitMinutes
        self.contextQualification = contextQualification
    }

    public var expertsPerLayerCached: Double { Geometry.perLayer(slots) }
    public var poolGB: Double { Geometry.gb(slots) }
    public var memoryLedger: ContextMemoryLedger {
        ContextMemoryLedger(slots: slots, context: maxContextTokens, chunk: prefillChunk,
            retentionTokens: prefixCacheTokens, mtp: mtpEnabled, visionResident: visionResidentReserved)
    }
    public var expectedPeakGB: Double { Double(memoryLedger.expectedPeakBytes) / 1e9 }

    public func withRequestPolicy(_ configuration: ContextConfiguration) throws -> MemoryPlan {
        guard configuration.maxContextTokens == maxContextTokens else {
            throw PlanError("request policy must use the context window priced by the memory plan")
        }
        return MemoryPlan(source: source, slots: slots, targetGB: targetGB, ramGB: ramGB,
            workingSetGB: workingSetGB, ramPercent: ramPercent, availableGB: availableGB, clamped: clamped,
            prefillChunk: prefillChunk, prefixCacheTokens: prefixCacheTokens, mtpEnabled: mtpEnabled,
            visionEnabled: visionEnabled, visionResidentReserved: visionResidentReserved,
            maxContextTokens: maxContextTokens, notes: notes, simulated: simulated,
            runtimeAllocationPolicy: runtimeAllocationPolicy,
            maxPrefillWaitMinutes: configuration.maxPrefillWaitMinutes,
            contextQualification: configuration.qualification)
    }
    /// Seconds a prompt filling the whole context takes before its first
    /// token, priced through the prefill schedule this plan runs.
    public var estPrefillSecondsAtMaxContext: Double {
        PrefillSchedule.estSeconds(tokens: maxContextTokens, maxChunk: prefillChunk)
    }
    public var estWarmTokS: Double { Planner.estWarmTokS(expertsPerLayer: expertsPerLayerCached) }
    public var fullyResident: Bool { slots >= Geometry.totalRecords }

    /// The startup announce: device, decision, expectation, override hint.
    public func banner() -> String {
        var l: [String] = []
        l.append("slotstream memory plan (\(source.rawValue))")
        if let a = availableGB, a.isFinite {
            l.append(String(
                format: "  device: %.0f GB RAM (%.1f GB reclaimable now), %.1f GB Metal working set",
                ramGB, a, workingSetGB))
        } else {
            l.append(String(
                format: "  device: %.0f GB RAM, %.1f GB Metal working set", ramGB, workingSetGB))
        }
        if let t = targetGB {
            let hint = source == .auto
                ? "   (override: --memory-gb N | --max-ram-percent P)"
                : ""
            l.append(String(format: "  target: %.1f GB total for this process%@", t, hint))
        }
        if fullyResident {
            l.append(String(
                format: "  cache:  all %d experts per layer resident (%.1f GB pool)",
                Geometry.expertsPerLayer, poolGB))
        } else {
            l.append(String(
                format: "  cache:  ~%.0f of %d experts per layer  (%d global slots = %.1f GB pool)",
                expertsPerLayerCached, Geometry.expertsPerLayer, slots, poolGB))
        }
        l.append(String(
            format: "  expect: ~%.1f GB peak, ~%.0f tok/s warm decode (est. from M5 Pro anchors)",
            expectedPeakGB, estWarmTokS))
        // The decode curve is a function of experts per layer alone. It carries
        // no term for read bandwidth, and it was anchored on a 17.3 GB/s SSD
        // (MEASUREMENTS, M0.5). The first machine measured that was not the dev
        // Mac reads at 1.5 GB/s, where the misses of a single token cost more
        // time than the whole estimated step (MEASUREMENTS, C1). Until the
        // planner can measure this disk and price those reads, the estimate
        // says out loud what it assumes rather than quietly assuming it.
        l.append(
            "  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). "
            + "A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 "
            + "estimate, so on base storage expect well under the number above — see docs/HARDWARE.md")
        l.append(String(
            format: "  prefill: %d tokens per pass (~%.0f tok/s here; costs ~%.1f GB of the target)",
            prefillChunk, Planner.estPrefillTokS(chunk: prefillChunk),
            Planner.prefillCostGB(prefillChunk)))
        if mtpEnabled {
            l.append(String(
                format: "  mtp:    draft head on — speculative decode (%.1f GB resident, charged above)",
                Planner.mtpResidentGB))
        }
        if visionEnabled {
            l.append(visionResidentReserved
                ? String(format: "  vision: tower memory reserved (%.1f GB resident, charged above)", Planner.visionResidentGB)
                : String(format: "  vision: images accepted — first image reserves +%.1f GB inside the target; refused if it cannot fit", Planner.visionResidentGB))
        }
        let extra = Planner.extraContextMemoryGB(maxContextTokens: maxContextTokens)
        l.append(String(
            format: "  context: up to %d tokens per request (prompt + reply%@); a full-length prompt "
                + "takes ~%@ before its first token here, follow-up turns read only what is new",
            maxContextTokens,
            extra > 0 ? String(format: ", +%.1f GB state and transient reserve charged above", extra) : "",
            PrefillSchedule.describe(seconds: estPrefillSecondsAtMaxContext)))
        if prefixCacheTokens > 0 {
            l.append(String(
                format: "  reuse:  up to %d tokens across %d conversations (~%.1f GB), so a "
                    + "follow-up turn re-prefills only what is new",
                prefixCacheTokens, PrefixCache.maxEntries,
                Planner.prefixCacheCostGB(tokens: prefixCacheTokens)))
        }
        for n in notes { l.append("  note:   \(n)") }
        return l.joined(separator: "\n")
    }

    /// Machine-readable form for /api/show.
    public func json() -> [String: Any] {
        func tenth(_ value: Double) -> Double {
            let scaled = value * 10
            return scaled.isFinite ? scaled.rounded() / 10 : value
        }
        var d: [String: Any] = [
            "source": source.rawValue,
            "experts_per_layer_cached": Int(expertsPerLayerCached.rounded()),
            "pool_slots": slots,
            "pool_gb": tenth(poolGB),
            "expected_peak_gb": tenth(expectedPeakGB),
            "device_ram_gb": tenth(ramGB),
            "device_working_set_gb": tenth(workingSetGB),
            "max_ram_percent": ramPercent,
            "availability_clamped": clamped,
            "fully_resident": fullyResident,
            "prefill_chunk": prefillChunk,
            "prefix_cache_max_tokens": prefixCacheTokens,
            "mtp": mtpEnabled,
            "vision": visionEnabled,
            "vision_resident_reserved": visionResidentReserved,
            "vision_charged_gb": visionResidentReserved ? Planner.visionResidentGB : 0,
            "vision_resident_gb": visionEnabled ? Planner.visionResidentGB : 0,
            "max_context_tokens": maxContextTokens,
            "est_prefill_s_at_max_context": estPrefillSecondsAtMaxContext.isFinite
                ? estPrefillSecondsAtMaxContext as Any : NSNull(),
            "model_context_limit": ContextPolicy.modelLimit,
            "implementation_context_limit": ContextPolicy.implementationLimit,
            "mtp_context_limit": ContextPolicy.mtpLimit,
            "vision_context_limit": ContextPolicy.visionLimit,
            "max_prefill_wait_minutes": maxPrefillWaitMinutes,
            "prefill_wait_scope": "accepted_request_to_first_model_token",
            "context_qualification": contextQualification,
            "memory_ledger": memoryLedger.json,
            // Unrounded on purpose: the banner rounds these to whole tok/s,
            // and a caller comparing two plans across a rounding boundary sees
            // a step that is not there. Anything asserting on the plan should
            // read these, not the printed line.
            "est_warm_tok_s": estWarmTokS,
            "est_prefill_tok_s": Planner.estPrefillTokS(chunk: prefillChunk),
        ]
        if let a = availableGB, a.isFinite { d["device_available_gb"] = tenth(a) }
        if let t = targetGB { d["target_gb"] = tenth(t) }
        if let policy = runtimeAllocationPolicy {
            d["runtime_prefix_cache_enabled"] = policy.prefixCacheEnabled
            if let chunk = policy.prefillChunkOverride { d["runtime_prefill_override"] = chunk }
        }
        if !notes.isEmpty { d["notes"] = notes }
        return d
    }
}

public enum Planner {
    /// Reassign only reservations already present in a resolved plan. This
    /// preserves its existing margin, active context and resident charges;
    /// it does not infer extra headroom from a short current request.
    public static func applyingRuntimePolicy(
        _ p: MemoryPlan, policy: RuntimeAllocationPolicy
    ) throws -> MemoryPlan {
        if let previous = p.runtimeAllocationPolicy {
            guard previous == policy else { throw PlanError("runtime allocation policy requires a fresh base plan") }
            return p // Never credit the same reservation twice.
        }
        let chunk = policy.prefillChunkOverride ?? p.prefillChunk
        let prefixTokens = policy.prefixCacheEnabled ? p.prefixCacheTokens : 0
        let freed = prefillCostGB(p.prefillChunk) - prefillCostGB(chunk)
            + prefixCacheCostGB(tokens: p.prefixCacheTokens) - prefixCacheCostGB(tokens: prefixTokens)
        var slots = p.slots
        if p.targetGB != nil, freed != 0 {
            let remaining = p.poolGB + freed
            guard remaining.isFinite, remaining + 1e-9 >= Geometry.gb(Geometry.floorSlots) else {
                throw PlanError("runtime prefill reservation cannot fit above the minimum expert pool; lower the chunk or raise the memory target")
            }
            slots = Geometry.slotsForPoolGB(remaining)
        }
        return MemoryPlan(source: p.source, slots: slots, targetGB: p.targetGB,
            ramGB: p.ramGB, workingSetGB: p.workingSetGB, ramPercent: p.ramPercent,
            availableGB: p.availableGB, clamped: p.clamped, prefillChunk: chunk,
            prefixCacheTokens: prefixTokens, mtpEnabled: p.mtpEnabled,
            visionEnabled: p.visionEnabled, visionResidentReserved: p.visionResidentReserved,
            maxContextTokens: p.maxContextTokens,
            notes: p.notes + (chunk != p.prefillChunk || prefixTokens != p.prefixCacheTokens
                ? ["prefill and prefix retention reservations match the explicit runtime controls"] : []),
            simulated: p.simulated, runtimeAllocationPolicy: policy,
            maxPrefillWaitMinutes: p.maxPrefillWaitMinutes, contextQualification: p.contextQualification)
    }

    /// Non-pool footprint: resident weights, the 256 MB n-gram payload plus
    /// collection overhead, Swift and MLX runtime allocations, one fixed GDN
    /// recurrent state, and a full 32k active context. Expert staging is now
    /// transferred directly into MLX in batches of at most 32 records,
    /// avoiding separate raw + Swift copies and the former multi-GB cold-fill
    /// transient.
    public static let fixedFootprintGB = 5.3
    /// Extra slack when deriving a pool from a total-memory target, so the
    /// promise ("stays under G") survives transients.
    public static let planningMarginGB = 1.0

    /// What a prefill pass costs in transient activations.
    ///
    /// **Recalibrated 2026-08-30, and the old figure was costing real speed.**
    /// The previous model charged `(chunk - 256) x 1.8 MB` because it folded
    /// two different things into one term: the pass activations, which scale
    /// with the *chunk*, and the KV plus indexer state, which scales with the
    /// *context*. Conflating them made a big pass look twice as expensive as it
    /// is, so the planner kept choosing 1024 where 2048 is strictly better.
    ///
    /// Measured directly (`--memory-gb 16`, pool pinned at 77/layer, so peak
    /// minus the 14.1 GB base is the pass): chunk 1024 -> 1.30 GB, 2048 -> 2.19,
    /// 4096 -> 4.30. That is ~1.0 to 1.3 MB per chunk token, linear from zero
    /// rather than from 256. Context state is a separate ~27.6 KB per token and
    /// is genuinely small: going from a 4,016 to an 8,016-token prompt moved
    /// peak by 0.1 GB. 1.30 MB/token is charged here so the estimate errs high
    /// at every measured point.
    public static func prefillCostGB(_ chunk: Int) -> Double {
        Double(chunk) * 1.30e-3
    }

    /// KV plus indexer state for a context of `tokens`, which the pool math
    /// does not model. Separate from the pass cost above because it scales with
    /// the conversation, not with the batch: a 32k prompt carries ~0.9 GB.
    public static func contextStateGB(_ tokens: Int) -> Double {
        Double(tokens) * Double(PrefixCache.bytesPerToken) / 1e9
    }

    /// Context state above what the fixed footprint already covers. Zero at
    /// the default window; an explicitly larger --max-context reduces the
    /// expert pool before allocation instead of consuming the safety margin.
    public static func extraContextStateGB(maxContextTokens: Int) -> Double {
        Double(ContextGeometry.additionalActiveBytes(tokens: maxContextTokens)) / 1e9
    }

    /// The larger window also needs transient headroom. A completed 65,520
    /// token check at chunk 512 peaked at 10.056 GB against the state-only
    /// plan's 9.260 GB (20 ms physical-footprint sampling, not just RSS).
    /// Reserve a full additional window's growth above the fixed footprint
    /// throughout the supported long-context range. This conservative envelope
    /// covers that measured gap without claiming its exact buffer attribution
    /// or interpolating unmeasured peaks. Ordinary windows retain their budget.
    /// See the Hermes measurement and its preserved failed run.
    public static func extraContextMemoryGB(maxContextTokens: Int, mtp: Bool = false) -> Double {
        Double(ContextGeometry.additionalActiveBytes(tokens: maxContextTokens, mtp: mtp)
            + ContextMemoryLedger.transientReserveBytes(context: maxContextTokens, mtp: mtp)) / 1e9
    }

    /// Sizes the prefill pass from the same budget as the pool.
    ///
    /// Prefill is expert-stream-bound: a pass touches nearly every expert of
    /// every layer, so the whole expert set is re-read roughly once per pass
    /// and halving the number of passes halves the bytes moved. Measured on a
    /// 7,960-token prompt: 40 tok/s at 256, 50 at 512, 67 at 1024, 92 to 105 at
    /// 2048 — with byte-identical output at every size.
    ///
    /// The cap is a quarter of the pool budget, raised from a fifth once the
    /// cost above was measured honestly. The deciding experiment held total
    /// memory fixed and traded pool for pass size on a 4,021-token prompt:
    ///
    /// | chunk | pool | prefill | decode | peak |
    /// |---|---|---|---|---|
    /// | 1024 | 77/layer | 65.2 s | 7.3 s | 15.4 GB |
    /// | 2048 | 67/layer | **47.9 s** | **6.6 s** | **14.9 GB** |
    /// | 4096 | 47/layer | 42.9 s | 9.0 s | 14.4 GB |
    ///
    /// 2048 dominates 1024 on every axis, so a fifth was simply too tight; 4096
    /// buys a little more prefill and gives back more decode, so it should only
    /// be reached on a machine whose pool is already past the decode plateau —
    /// which is exactly what a proportional cap does, since there pool memory
    /// is worth nothing and pass memory is worth a lot.
    /// A request this plan is tuned for: prompt tokens, then generated tokens.
    /// Only ever used to choose the prefill pass size — never correctness.
    static let tuningPromptTokens = 2000.0
    static let tuningReplyTokens = 400.0

    /// The prefill pass to run at a given pool budget: the one that finishes a
    /// representative request soonest.
    ///
    /// Pass size is a real trade, not a free choice. A bigger pass prefills
    /// faster but costs pool, and every GB it takes is expert cache the decode
    /// loop no longer has. The old rule — "biggest pass fitting in a quarter of
    /// the budget" — ignored the decode side, so crossing the quarter line
    /// doubled the pass from 2.7 to 5.3 GB and made `--memory-gb 26` plan a
    /// *smaller* cache than 25 (116 against 128 per layer) and a slower decode.
    /// Giving more memory made it slower.
    ///
    /// Scoring `prompt/prefill + reply/decode` prices both sides in the one
    /// unit that matters, seconds, and picks the trade the machine can afford:
    /// past the decode plateau a big pass is nearly free and wins, and below it
    /// the pass only grows when the prefill it buys beats the decode it costs.
    /// Swept a GB at a time from 7 to 90 GB, the estimate never gets worse as
    /// the target grows.
    public static func prefillChunkFor(poolBudgetGB: Double, contextCap: Int = ContextPolicy.defaultTokens) -> Int {
        // 8192 is not a candidate: nothing has measured it, and the prefill
        // schedule would cut it to 4096 on the first pass anyway
        // (PrefillSchedule.measuredQueryKeyProduct), so offering it only
        // charged 10.6 GB for a pass that never ran.
        let candidates = [256] + [512, 1024, 2048, 4096].filter {
            prefillCostGB($0) <= 0.25 * poolBudgetGB
        }
        func seconds(_ c: Int) -> Double {
            let pool = poolBudgetGB - prefillCostGB(c) - prefixCacheGB(poolBudgetGB: poolBudgetGB, contextCap: contextCap)
            let slots = Geometry.slotsForPoolGB(max(0, pool))
            let decode = estWarmTokS(expertsPerLayer: Geometry.perLayer(slots))
            return tuningPromptTokens / estPrefillTokS(chunk: c) + tuningReplyTokens / decode
        }
        // Ties (identical seconds) go to the larger pass: same request time,
        // more headroom on a prompt longer than the one we tuned for.
        return candidates.min { a, b in
            let (sa, sb) = (seconds(a), seconds(b))
            return sa != sb ? sa < sb : a > b
        } ?? 256
    }

    /// How many tokens of conversation state the prefix cache may retain.
    ///
    /// The held state is ~27 KiB per token, and this is a ceiling on the total
    /// across every conversation held, not per conversation.
    ///
    /// It **is** charged against the budget. The first design held one
    /// conversation and evicted on any miss, so exactly one state was ever live
    /// and peak was unchanged; that design was then measured against a real
    /// client and never hit at all — Open WebUI interleaves a title-generation
    /// request between turns and evicted the chat every time. Holding several
    /// conversations is what makes the cache work, and several held states are
    /// genuinely additive memory, so the budget pays for them. A tenth of the
    /// pool budget is the ceiling, capped by the context limit above which
    /// reuse is impossible anyway (a match needs `prompt.count > held.count`,
    /// and a prompt that long is already refused).
    public static func prefixCacheTokensFor(poolBudgetGB: Double, contextCap: Int = 32_768) -> Int {
        let gb = 0.10 * max(0, poolBudgetGB)
        let full = Double(contextCap) * Double(PrefixCache.bytesPerToken) / 1e9
        if gb >= full { return max(0, contextCap) }
        let toks = Int(gb * 1e9 / Double(PrefixCache.bytesPerToken))
        return max(0, min(toks, contextCap))
    }

    /// What that retention ceiling costs, which the plan reserves.
    public static func prefixCacheGB(poolBudgetGB: Double, contextCap: Int = ContextPolicy.defaultTokens) -> Double {
        prefixCacheCostGB(tokens: prefixCacheTokensFor(poolBudgetGB: poolBudgetGB, contextCap: contextCap))
    }

    /// PrefixCache evicts before a miss allocation, so no more than four
    /// states coexist: the active state already in fixedFootprintGB plus three
    /// retained states. Their fixed GDN memory is additive to KV/indexer bytes.
    public static func prefixCacheCostGB(tokens: Int) -> Double {
        guard tokens > 0 else { return 0 }
        let tokenGB = Double(tokens) * Double(PrefixCache.bytesPerToken) / 1e9
        let fixedGB = Double(PrefixCache.maxEntries - 1)
            * Double(PrefixCache.fixedBytesPerEntry) / 1e9
        return tokenGB + fixedGB
    }

    /// Prefill throughput estimate for the banner, from the anchors above.
    /// Prefill throughput estimate, from measurement plus one measured ratio.
    ///
    /// 2048 is the solid anchor: **112.9 tok/s** on an 8,016-token prompt at a
    /// 16 GB target, mean of three interleaved runs. 4096 could not be measured
    /// at *its* natural home (a 36 GB target needs ~33 GB free, which has not
    /// been available), so it is derived from a ratio measured at a matched
    /// pool of 60 experts/layer, where 4096 beat 2048 in all three paired
    /// rounds — 108.8/96.6, 92.2/76.3, 103.9/91.4, a mean 101.6 against 88.1,
    /// or 1.15x. Applied to the anchor that implies ~130; 125 is quoted so the
    /// estimate stays under the evidence rather than over it, and 8192 is not
    /// credited with any further gain because nothing has measured one.
    ///
    /// Caveat this does not model: prefill also depends on pool size, because
    /// a bigger cache means fewer expert misses per pass. The same chunk gives
    /// 88 tok/s at 60 experts/layer and 113 at 67, so treat these as typical
    /// for a machine that would *choose* that chunk, not as a pure function.
    public static func estPrefillTokS(chunk: Int) -> Double {
        // The sweep's ladder on the 8k acceptance prompt at a matched pool of
        // 60 experts per layer (MEASUREMENTS.md, "N2 — the prefill sweep"):
        // 88 / 128 / 169 / 211 / 222 tok/s from 256 to 4096, rounded down.
        // The floor's 256-token pass read 88 at 13 per layer too: below 1024
        // the pass is read-bound and the pool barely matters. Ordinary prose
        // reads about 40% slower than this prompt at every size; these are the
        // acceptance prompt's numbers, as the previous ladder's were.
        switch chunk {
        case ..<512: return 85
        case ..<1024: return 125
        case ..<2048: return 165
        case ..<4096: return 205
        default: return 220
        }
    }
    /// Smallest honest total-memory target: floor pool + footprint + margin.
    public static var minMemoryGB: Double {
        ((Geometry.gb(Geometry.floorSlots) + fixedFootprintGB + planningMarginGB) * 10)
            .rounded(.up) / 10
    }

    /// Memory reclaimable RIGHT NOW without compressing or swapping any other
    /// process's memory: free pages (the raw counter includes speculative) +
    /// purgeable + file-backed cache. Deliberately NOT `kern.memorystatus_level`
    /// (the `memory_pressure` "free percentage"): that counts other apps'
    /// compressible/swappable memory as available, and sizing a GPU pool
    /// against it is exactly how you cause the swap storm. nil if the mach
    /// call fails (then no clamp is applied).
    /// Test seam: when set, stands in for the live availability reading so the
    /// governor can be driven without putting the machine under real memory
    /// pressure. Never set in normal operation.
    ///
    /// **It does not make the resulting allocation imaginary.** The governor
    /// acts on this number, so setting it *above* what the machine has makes it
    /// allocate a pool the machine cannot hold: simulating 60 GB free on a Mac
    /// with 7 GB took a real 25 GB pool and drove tens of GB of swap. Anything
    /// using this seam must bound the value by `deviceAvailableGB()`.
    public nonisolated(unsafe) static var availabilityOverride: Double?

    /// Headroom kept between our expected peak and what is reclaimable, so
    /// claiming it doesn't leave the machine at zero.
    public static func availabilitySlackGB(ramGB: Double) -> Double {
        max(1.5, 0.05 * ramGB)
    }

    /// The share of RAM auto may target before other limits apply. Overridable
    /// per run with --max-ram-percent; it binds on small machines, where the
    /// cache is starved and every GB still buys speed.
    public static let defaultRAMPercent = 70.0

    /// Auto will not target more than this, however large the machine.
    ///
    /// This is the knee of the whole plan, not a politeness limit: 33 GB is the
    /// smallest target at which **both** numbers reach the best the
    /// measurements support — the expert cache clears the decode plateau
    /// (11.2 tok/s at 120 experts/layer, 11.6 at 150, flat after) *and* the
    /// budget still affords the 4096-token prefill pass (125 tok/s against 113
    /// at 2048). Swept a GB at a time, nothing between 34 and 84 GB improves
    /// either number.
    ///
    /// So the old 70%-of-RAM policy was right for a 48 GB Mac by luck — it
    /// landed near this knee — and wrong everywhere above: a 128 GB Mac
    /// targeted 89.6 GB to run at exactly the same estimated speed.
    ///
    /// Not a hard limit: --memory-gb N goes past it deliberately, which is how
    /// a large machine explores full residency (all 512/layer needs about
    /// 84 GB and has never been measured). The one unreproduced hint of a
    /// further decode step, 20 tok/s at 181/layer, is why that door stays open.
    public static let usefulCeilingGB = 33.0

    /// Auto policy: never target more than the cache can use, leave a share of
    /// RAM to the OS and the user's other apps, and stay 2 GB under the Metal
    /// recommended working set — whichever binds first.
    public static func autoTargetGB(
        ramGB: Double, workingSetGB: Double, ramPercent: Double = defaultRAMPercent,
        ceilingGB: Double = usefulCeilingGB
    ) -> Double {
        min(ceilingGB, (ramPercent / 100) * ramGB, workingSetGB - 2.0)
    }

    /// Warm decode estimate, re-anchored 2026-08-30 on measured points.
    ///
    /// The old curve interpolated between 30/layer = 5.6 and 181/layer = 20.0
    /// and **over-promised by 25 to 45% across the middle of its own range**,
    /// which is the part most machines actually land in. Re-measured on 0.1.6
    /// with the pool properly warmed (throughput plateaus by the second
    /// generation, so three samples is enough — verified over 14 consecutive
    /// runs):
    ///
    /// | experts/layer | measured | old estimate |
    /// |---|---|---|
    /// | 30 | 6.0 | 5.6 |
    /// | 60 | 8.2 | 9.2 |
    /// | 120 | 11.2 | 14.8 |
    /// | 150 | 11.6 | 17.3 |
    ///
    /// It is also nearly flat from 120 to 150, so the plateau starts far below
    /// the 181 the old curve assumed. The 20.0 figure at 181/layer could not be
    /// re-verified: that config peaks at 27.4 GB and the machine had 26.6 GB
    /// reclaimable, and forcing it once already drove 13 GB of swap. One run
    /// under that pressure produced a 15 to 18 band, consistent with a
    /// threshold once the working set fits, but it is not a clean measurement.
    ///
    /// So this now interpolates the verified points and **holds flat above
    /// them** rather than extrapolating to an unconfirmed number. It
    /// under-promises above 150/layer on purpose: a plan that quotes a speed
    /// the machine does not reach is worse than one that quotes less.
    /// Where the measured decode curve stops improving: 11.2 tok/s at 120
    /// experts/layer, 11.6 at 150, flat after. Both the estimate and the
    /// prefill-pass sizing key off this one number.
    public static let decodePlateauPerLayer = 150.0

    public static func estWarmTokS(expertsPerLayer e: Double) -> Double {
        let (e0, r0) = (30.0, 6.0)
        let (e1, r1) = (decodePlateauPerLayer, 11.6)
        if e >= e1 { return r1 }
        if e <= e0 { return r0 * (max(e, 1) / e0) }
        let t = log(e / e0) / log(e1 / e0)
        return r0 * pow(r1 / r0, t)
    }

    /// Resident cost of the MTP draft head (mtp.safetensors is 1.47 GB;
    /// activations and cache growth ride the existing margins).
    public static let mtpResidentGB = 1.6

    /// The vision tower's resident cost, paid only by a process that is handed
    /// an image: 333 bf16 tensors, 0.898 GB, measured from the pinned
    /// checkpoint's own header (`VisionTower.residentBytes`), rounded up.
    ///
    /// Engine reserves this inside a target-driven plan before loading the
    /// tower. A raw pool-size request keeps that explicit pool size and reports
    /// the additional resident bytes in its expected peak.
    public static let visionResidentGB = 0.9

    /// Headroom demanded on top of the tower's own bytes before loading it.
    /// The load briefly holds arrays twice while MLX materializes them.
    /// Attention transients depend on the actual dispatch: the established
    /// 72-wide fallback can form an N² matrix and are not bounded by this term.
    public static let visionLoadMarginGB = 1.0
    /// Auto enables the draft head only when the cache still affords this
    /// many experts per layer AFTER paying for it (M9 design note: below
    /// ~120/layer the displaced experts are worth more than the multiplier;
    /// past the ~150/layer plateau they are worth nothing).
    public static let mtpAutoFloorPerLayer = 120.0

    /// Pool budget before the prefill pass takes its share.
    public static func poolBudgetGB(_ targetGB: Double) -> Double {
        targetGB - fixedFootprintGB - planningMarginGB
    }

    public static func slotsForTarget(_ targetGB: Double, contextCap: Int = ContextPolicy.defaultTokens) -> Int {
        let budget = poolBudgetGB(targetGB)
        let pool = budget - prefillCostGB(prefillChunkFor(poolBudgetGB: budget, contextCap: contextCap))
            - prefixCacheGB(poolBudgetGB: budget, contextCap: contextCap)
        return Geometry.slotsForPoolGB(pool)
    }

    /// Resolve the knobs. Precedence: --experts-per-layer > --pool-gb >
    /// --memory-gb > auto. Losing knobs are noted, never silently dropped.
    ///
    /// Auto (and only auto) also clamps to what is reclaimable right now, so a
    /// busy machine degrades gracefully instead of swap-storming — explicit
    /// knobs mean the user chose, so they only get an informational note. On a
    /// quiet machine the clamp never binds and auto stays deterministic.
    public enum MTPMode: String, Sendable, Codable {
        case on, off, auto
    }

    /// Whether this process will answer requests that carry images. `auto` is
    /// "yes when the checkpoint has a tower", which the shipped one does.
    public enum VisionMode: String, Sendable, Codable {
        case on, off, auto
    }

    public static func plan(
        expertsPerLayer: Int?, poolGB: Double?, memoryGB: Double?,
        ramGB: Double? = nil, workingSetGB: Double? = nil,
        availableGB: Double? = nil, ramPercent: Double? = nil,
        mtp: MTPMode = .off, mtpAvailable: Bool = false,
        vision: VisionMode = .auto, visionAvailable: Bool = false,
        visionResidentReserved: Bool = false,
        maxContextTokens: Int = ContextPolicy.defaultTokens,
        simulated: Bool = false
    ) throws -> MemoryPlan {
        try plan(expertsPerLayer: expertsPerLayer, poolGB: poolGB, memoryGB: memoryGB,
            ramGB: ramGB, workingSetGB: workingSetGB, availableGB: availableGB, ramPercent: ramPercent,
            mtp: mtp, mtpAvailable: mtpAvailable, vision: vision, visionAvailable: visionAvailable,
            visionResidentReserved: visionResidentReserved, maxContextTokens: maxContextTokens,
            simulated: simulated, qualification: false, runtimePolicy: nil)
    }

    public static func plan(
        expertsPerLayer: Int?, poolGB: Double?, memoryGB: Double?,
        ramGB: Double? = nil, workingSetGB: Double? = nil,
        availableGB: Double? = nil, ramPercent: Double? = nil,
        mtp: MTPMode = .off, mtpAvailable: Bool = false,
        vision: VisionMode = .auto, visionAvailable: Bool = false,
        visionResidentReserved: Bool = false,
        maxContextTokens: Int = ContextPolicy.defaultTokens,
        simulated: Bool = false, runtimePolicy: RuntimeAllocationPolicy?
    ) throws -> MemoryPlan {
        try plan(expertsPerLayer: expertsPerLayer, poolGB: poolGB, memoryGB: memoryGB,
            ramGB: ramGB, workingSetGB: workingSetGB, availableGB: availableGB, ramPercent: ramPercent,
            mtp: mtp, mtpAvailable: mtpAvailable, vision: vision, visionAvailable: visionAvailable,
            visionResidentReserved: visionResidentReserved, maxContextTokens: maxContextTokens,
            simulated: simulated, qualification: false, runtimePolicy: runtimePolicy)
    }

    public static func plan(
        expertsPerLayer: Int?, poolGB: Double?, memoryGB: Double?,
        ramGB: Double? = nil, workingSetGB: Double? = nil,
        availableGB: Double? = nil, ramPercent: Double? = nil,
        mtp: MTPMode = .off, mtpAvailable: Bool = false,
        vision: VisionMode = .auto, visionAvailable: Bool = false,
        visionResidentReserved: Bool = false,
        maxContextTokens: Int = ContextPolicy.defaultTokens,
        simulated: Bool = false, qualification: Bool, runtimePolicy: RuntimeAllocationPolicy? = nil
    ) throws -> MemoryPlan {
        if let why = ContextPolicy.validationError(maxContextTokens, qualification: qualification) { throw PlanError(why) }
        // The fixed footprint pays for the default context; larger windows
        // reduce the pool budget by their additional active state and measured
        // transient envelope, before sizing either the pool or prefill pass.
        let contextCharge = extraContextMemoryGB(maxContextTokens: maxContextTokens)
            + (visionResidentReserved ? visionResidentGB : 0)
        let mtpContextCharge = extraContextMemoryGB(maxContextTokens: maxContextTokens, mtp: true)
            - extraContextMemoryGB(maxContextTokens: maxContextTokens)
        let mtpTotalCharge = mtpResidentGB + mtpContextCharge
        let ram = ramGB ?? deviceRAMGB()
        let ws = workingSetGB ?? deviceWorkingSetGB()
        let avail = availableGB ?? deviceAvailableGB()
        let pct = ramPercent ?? defaultRAMPercent
        guard ram.isFinite, ram > 0 else {
            throw PlanError("RAM must be a finite number > 0")
        }
        guard ws.isFinite, ws > 0 else {
            throw PlanError("Metal working-set size must be a finite number > 0")
        }
        // +infinity is meaningful here: it is how doctor --sim-ram says
        // "availability is not a constraint on this simulated machine". Only
        // NaN and negatives are garbage.
        if let a = avail, a.isNaN || a < 0 {
            throw PlanError("available memory must be a number >= 0")
        }
        guard pct.isFinite, pct > 0, pct <= 100 else {
            throw PlanError(String(
                format: "--max-ram-percent %.0f is out of range — give a share between 1 and 100",
                pct))
        }
        var notes: [String] = []
        var clamped = false
        if ramPercent != nil, expertsPerLayer != nil || poolGB != nil || memoryGB != nil {
            notes.append("--max-ram-percent ignored (it only bounds auto; an explicit memory knob is already the target)")
        }
        if vision == .on, !visionAvailable {
            throw PlanError(
                "--vision on, but this checkpoint has no vision_tower tensors — it is a "
                    + "text-only model; use --vision auto/off")
        }
        let visionOn = vision != .off && visionAvailable
        guard !visionResidentReserved || visionOn else {
            throw PlanError("a loaded vision tower requires an available, enabled vision model")
        }
        if mtp == .on, !mtpAvailable {
            throw PlanError(
                "--mtp on, but mtp.safetensors is not next to the model — the draft head "
                    + "is a separate 1.5 GB artifact converted from the official release "
                    + "(Tools/mtp_convert.py); convert it first or use --mtp auto/off")
        }

        /// The draft-head decision for a pool of `slots` when the head costs
        /// pool budget (target-driven sources already shrank the pool).
        if mtp == .on, maxContextTokens > ContextPolicy.mtpLimit, !qualification {
            throw PlanError("MTP is qualified only through \(ContextPolicy.mtpLimit) tokens; use --mtp off at this window")
        }
        if mtp == .auto, maxContextTokens > ContextPolicy.mtpLimit {
            notes.append("MTP stays off because this context exceeds its qualified window")
        }
        func resolveMTP(slotsAfterCharge: Int) -> Bool {
            if mtp == .auto, maxContextTokens > ContextPolicy.mtpLimit { return false }
            switch mtp {
            case .off: return false
            case .on: return true
            case .auto:
                return mtpAvailable
                    && Geometry.perLayer(slotsAfterCharge) >= mtpAutoFloorPerLayer
            }
        }

        func finish(
            _ source: MemoryPlan.Source, _ slots: Int, target: Double?, mtpOn: Bool
        ) throws -> MemoryPlan {
            // An explicit pool knob states the cache size, not the whole budget,
            // so size the prefill pass from the pool the user asked for.
            let mtpCharge = mtpOn ? mtpResidentGB + mtpContextCharge : 0
            let budgetForCaches = target.map { poolBudgetGB($0) - mtpCharge - contextCharge }
                ?? Geometry.gb(slots)
            let chunk = prefillChunkFor(poolBudgetGB: budgetForCaches, contextCap: maxContextTokens)
            let capped = min(slots, Geometry.totalRecords)
            let floored = max(capped, Geometry.floorSlots)
            if floored > capped {
                notes.append(String(
                    format: "raised to the floor of %d slots (~%.0f/layer): below it a prefill chunk can pin every slot",
                    Geometry.floorSlots, Geometry.perLayer(Geometry.floorSlots)))
            }
            let peak = Geometry.gb(floored) + fixedFootprintGB + prefillCostGB(chunk)
                + prefixCacheGB(poolBudgetGB: budgetForCaches, contextCap: maxContextTokens) + mtpCharge + contextCharge
            if peak > ws, source != .memoryGB {  // memoryGB branch words its own note
                notes.append(String(
                    format: "expected peak %.1f GB exceeds the %.1f GB Metal working set — expect paging; close other apps or lower the knob",
                    peak, ws))
            }
            // Explicit raw knobs: warn (don't resize) when the machine is busy.
            if source == .expertsPerLayer || source == .poolGB, let a = avail, peak > a {
                notes.append(String(
                    format: "only %.1f GB is reclaimable right now — expect paging until other apps release memory (auto would size to the machine)",
                    a))
            }
            let base = MemoryPlan(
                source: source, slots: floored, targetGB: target,
                ramGB: ram, workingSetGB: ws, ramPercent: pct,
                availableGB: avail, clamped: clamped,
                prefillChunk: chunk,
                prefixCacheTokens: prefixCacheTokensFor(
                    poolBudgetGB: budgetForCaches, contextCap: maxContextTokens),
                mtpEnabled: mtpOn,
                visionEnabled: visionOn,
                visionResidentReserved: visionResidentReserved,
                maxContextTokens: maxContextTokens,
                notes: notes,
                simulated: simulated, contextQualification: qualification)
            let resolved = try runtimePolicy.map { try applyingRuntimePolicy(base, policy: $0) } ?? base
            let bytes = resolved.memoryLedger.expectedPeakBytes
            if maxContextTokens > ContextPolicy.defaultTokens || visionResidentReserved {
                if let target, Double(bytes) > target * 1e9 {
                    throw PlanError("insufficient_memory: context, resident components, minimum pool and prefill workspace exceed the total-memory target")
                }
                let physical = min(ws, (avail ?? ws) - availabilitySlackGB(ramGB: ram))
                if Double(bytes) > physical * 1e9 {
                    throw PlanError("insufficient_memory: requested context and expert pool exceed reclaimable memory with safety headroom or the Metal working set")
                }
            }
            return resolved
        }

        if let n = expertsPerLayer {
            guard n >= 1 else { throw PlanError("--experts-per-layer must be ≥ 1") }
            if poolGB != nil { notes.append("--pool-gb ignored (--experts-per-layer takes precedence)") }
            if memoryGB != nil { notes.append("--memory-gb ignored (--experts-per-layer takes precedence)") }
            let slots = min(n, Geometry.expertsPerLayer) * Geometry.layers
            return try finish(.expertsPerLayer, slots, target: nil, mtpOn: resolveMTP(slotsAfterCharge: slots))
        }
        if let g = poolGB {
            guard g.isFinite, g > 0 else {
                throw PlanError("--pool-gb must be a finite number > 0")
            }
            if memoryGB != nil { notes.append("--memory-gb ignored (--pool-gb takes precedence)") }
            // Preserve a below-floor request so `finish` can explain that it
            // raised it; cap before Double->Int so huge finite input is safe.
            let requested = g >= Geometry.gb(Geometry.totalRecords)
                ? Geometry.totalRecords : Int(g * 1e9 / Geometry.recordBytes)
            return try finish(.poolGB, requested, target: nil, mtpOn: resolveMTP(slotsAfterCharge: requested))
        }
        if let m = memoryGB {
            guard m.isFinite else { throw PlanError("--memory-gb must be finite") }
            guard m >= minMemoryGB else {
                throw PlanError(String(
                    format: "--memory-gb %.1f is below the minimum %.1f GB (floor cache of ~%.0f experts/layer = %.1f GB pool, plus the %.1f GB fixed footprint of resident weights + n-gram cache, plus %.1f GB margin)",
                    m, minMemoryGB, Geometry.perLayer(Geometry.floorSlots),
                    Geometry.gb(Geometry.floorSlots), fixedFootprintGB,
                    planningMarginGB))
            }
            if m > ws {
                notes.append(String(
                    format: "target %.1f GB exceeds the %.1f GB Metal working set; the OS may page — auto would pick %.1f GB here",
                    m, ws, max(minMemoryGB, autoTargetGB(ramGB: ram, workingSetGB: ws, ramPercent: pct))))
            }
            if let a = avail, m > a {
                notes.append(String(
                    format: "only %.1f GB is reclaimable right now — expect paging until other apps release memory",
                    a))
            }
            var mtpOn = resolveMTP(
                slotsAfterCharge: slotsForTarget(max(m - mtpTotalCharge - contextCharge, minMemoryGB), contextCap: maxContextTokens))
            if mtpOn, m - mtpTotalCharge - contextCharge < minMemoryGB {
                if mtp == .on {
                    throw PlanError(String(
                        format: "--memory-gb %.1f cannot fit the %.1f GB draft head above the %.1f GB minimum — raise the target or drop --mtp on",
                        m, mtpTotalCharge, minMemoryGB))
                }
                mtpOn = false
            }
            let slots = slotsForTarget(m - (mtpOn ? mtpTotalCharge : 0) - contextCharge, contextCap: maxContextTokens)
            return try finish(.memoryGB, slots, target: m, mtpOn: mtpOn)
        }

        // auto: the default. The draft head is worth its 1.6 GB only when the
        // cache still reaches ~120+ experts/layer after paying for it, and
        // past the decode knee that RAM buys nothing else — so when the head
        // is on, the ceiling rises by exactly its cost.
        let mtpWanted = mtp != .off && mtpAvailable
            && (mtp == .on || maxContextTokens <= ContextPolicy.mtpLimit)
        func autoRaw(ceilingGB: Double) -> (Double, Bool) {
            let c = autoTargetGB(ramGB: ram, workingSetGB: ws, ramPercent: pct, ceilingGB: ceilingGB)
            var raw = c
            var didClamp = false
            if let a = avail, a - availabilitySlackGB(ramGB: ram) < raw {
                raw = a - availabilitySlackGB(ramGB: ram)
                didClamp = true
            }
            return (raw, didClamp)
        }
        var mtpOn = false
        if mtpWanted {
            let (rawM, _) = autoRaw(ceilingGB: usefulCeilingGB + mtpTotalCharge)
            let targetM = max(minMemoryGB, rawM)
            let charged = targetM - mtpTotalCharge - contextCharge
            mtpOn = charged >= minMemoryGB
                && (mtp == .on
                    || Geometry.perLayer(slotsForTarget(charged, contextCap: maxContextTokens)) >= mtpAutoFloorPerLayer)
        }
        if mtp == .on, !mtpOn {
            throw PlanError("insufficient_memory: auto cannot keep the requested MTP head loaded at this context; close other apps or use --mtp off")
        }
        // `ceiling` is what this machine's auto would pick unclamped (the
        // notes below compare against it); the knee itself rises by the
        // head's cost when the head is on.
        let kneeGB = usefulCeilingGB + (mtpOn ? mtpTotalCharge : 0)
        let ceiling = autoTargetGB(
            ramGB: ram, workingSetGB: ws, ramPercent: pct, ceilingGB: kneeGB)
        let raw: Double
        (raw, clamped) = autoRaw(ceilingGB: kneeGB)
        let target = max(minMemoryGB, raw)
        if mtpOn, target - mtpTotalCharge - contextCharge < minMemoryGB { mtpOn = false }
        // Exactly one note tells the story of why the target is what it is.
        if raw < minMemoryGB, ceiling < minMemoryGB {
            notes.append(String(
                format: "this machine (%.0f GB RAM) is below the comfortable minimum — running at the %.1f GB floor; expect slow decode and close other apps",
                ram, minMemoryGB))
        } else if raw < minMemoryGB {
            notes.append(String(
                format: "only %.1f GB of %.0f GB RAM is reclaimable right now — running at the %.1f GB floor anyway; expect heavy paging until other apps release memory",
                avail ?? 0, ram, minMemoryGB))
        } else if clamped {
            notes.append(String(
                format: "only %.1f GB of %.0f GB RAM is reclaimable right now (other apps hold the rest) — sized down from the usual %.1f GB; close apps and restart for full speed, or force a size with --memory-gb",
                avail ?? 0, ram, ceiling))
        } else if ceiling >= kneeGB,
            min((pct / 100) * ram, ws - 2.0) > 1.25 * kneeGB
        {
            // This machine could hold more and auto declined. Say so, or it
            // reads as slotstream failing to use the hardware.
            notes.append(String(
                format: "this machine could hold more, but decode stops improving around here (measured 11.2 tok/s at 120 experts/layer, 11.6 at 150) — auto caps at %.1f GB rather than spend RAM for nothing; --memory-gb N to go further",
                usefulCeilingGB))
        }
        let slots = slotsForTarget(target - (mtpOn ? mtpTotalCharge : 0) - contextCharge, contextCap: maxContextTokens)
        return try finish(.auto, slots, target: target, mtpOn: mtpOn)
    }

    /// Resolve the first image against the existing policy, before allocating
    /// its tower. The source and target remain the user's original decision.
    public static func loadingVision(_ p: MemoryPlan) throws -> MemoryPlan {
        guard p.visionEnabled else { throw PlanError("vision is disabled") }
        if p.visionResidentReserved { return p }
        var sized: MemoryPlan
        if let target = p.targetGB {
            sized = try plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                ramGB: p.ramGB, workingSetGB: p.workingSetGB, availableGB: p.availableGB,
                mtp: p.mtpEnabled ? .on : .off, mtpAvailable: p.mtpEnabled,
                vision: .on, visionAvailable: true, visionResidentReserved: true,
                maxContextTokens: p.maxContextTokens, simulated: p.simulated, qualification: p.contextQualification,
                runtimePolicy: p.runtimeAllocationPolicy)
        } else { sized = p }
        // Loading a tower never justifies restoring capacity already donated
        // by the governor. Its original target can outlive a pressure shrink.
        return MemoryPlan(source: p.source, slots: min(p.slots, sized.slots), targetGB: p.targetGB,
            ramGB: p.ramGB, workingSetGB: p.workingSetGB, ramPercent: p.ramPercent,
            availableGB: p.availableGB, clamped: p.clamped, prefillChunk: min(p.prefillChunk, sized.prefillChunk),
            prefixCacheTokens: min(p.prefixCacheTokens, sized.prefixCacheTokens), mtpEnabled: p.mtpEnabled,
            visionEnabled: true, visionResidentReserved: true,
            maxContextTokens: p.maxContextTokens,
            notes: p.notes + ["vision tower resident memory reserved before loading"], simulated: p.simulated,
            runtimeAllocationPolicy: p.runtimeAllocationPolicy,
            maxPrefillWaitMinutes: p.maxPrefillWaitMinutes, contextQualification: p.contextQualification)
    }
}

````````````

## Artifact SHA-256 fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655

Encoding: `utf-8`. Original bytes: 12590.

````````````text
import Foundation

public struct ContextConfiguration: Sendable, Equatable {
    public static let defaultWaitMinutes = 30.0
    public let maxContextTokens: Int
    public let maxPrefillWaitMinutes: Double
    /// Explicit diagnostic qualification, never inferred from a mutable cap.
    public let qualification: Bool

    public init(maxContextTokens: Int = ContextPolicy.defaultTokens,
                maxPrefillWaitMinutes: Double = defaultWaitMinutes,
                qualification: Bool = false) throws {
        if let why = ContextPolicy.validationError(maxContextTokens, qualification: qualification) {
            throw RequestFailure(.contextLengthExceeded, why)
        }
        guard maxPrefillWaitMinutes.isFinite, maxPrefillWaitMinutes >= 0,
              maxPrefillWaitMinutes <= Double(UInt64.max) / 60 / 1e9 else {
            throw RequestFailure(.invalidConfiguration,
                "--max-prefill-wait must be finite, nonnegative minutes within the monotonic timer range; 0 disables only the time policy")
        }
        self.maxContextTokens = maxContextTokens
        self.maxPrefillWaitMinutes = maxPrefillWaitMinutes
        self.qualification = qualification
    }
}

public struct RequestFailure: Error, CustomStringConvertible, Codable, Sendable, Equatable {
    public enum Code: String, Codable, Sendable {
        case contextLengthExceeded = "context_length_exceeded"
        case invalidConfiguration = "invalid_configuration"
        case prefillWaitExceeded = "prefill_wait_exceeded"
        case insufficientMemory = "insufficient_memory"
        case prefillDeadlineExceeded = "prefill_deadline_exceeded"
        case clientCancelled = "client_cancelled"
        case inferenceError = "inference_error"
    }
    public let code: Code
    public let message: String
    public var elapsedSeconds: Double?
    public var limitSeconds: Double?
    public var estimatedSeconds: Double?
    public var requiredBytes: Int?
    public var availableBytes: Int?
    public init(_ code: Code, _ message: String) { self.code = code; self.message = message }
    public var description: String { message }
    public var httpStatus: String {
        switch code {
        case .contextLengthExceeded, .invalidConfiguration, .prefillWaitExceeded: return "400 Bad Request"
        case .insufficientMemory, .prefillDeadlineExceeded: return "503 Service Unavailable"
        case .clientCancelled: return "499 Client Closed Request"
        case .inferenceError: return "500 Internal Server Error"
        }
    }
    public var json: [String: Any] {
        var result: [String: Any] = ["code": code.rawValue, "type": code.rawValue, "message": message]
        if let elapsedSeconds { result["elapsed_seconds"] = elapsedSeconds }
        if let limitSeconds { result["limit_seconds"] = limitSeconds }
        if let estimatedSeconds { result["estimated_seconds"] = estimatedSeconds }
        if let requiredBytes { result["required_bytes"] = requiredBytes }
        if let availableBytes { result["available_bytes"] = availableBytes }
        return result
    }
}

/// Atomic admission for allocations that concurrent accepted requests have
/// reserved but may not have materialized yet. Retained preparation stays
/// charged until its controller is released, including time in the queue.
package final class RequestMemoryReservations: @unchecked Sendable {
    private let lock = NSLock()
    private var entries: [UUID: [String: Int]] = [:]
    package init() {}
    package var reservedBytes: Int { lock.withLock { entries.values.reduce(0) { ContextBytes.sum($0, $1.values.reduce(0) { ContextBytes.sum($0, $1) }) } } }
    package func release(_ id: UUID) { lock.withLock { _ = entries.removeValue(forKey: id) } }
    package func releaseDispatch(_ id: UUID) { lock.withLock { entries[id]?["dispatch"] = nil } }

    package func check(_ id: UUID, kind: String?, bytes: Int, slack: Int,
                       available: () -> Double?, phase: String) throws {
        try lock.withLock {
            var own = entries[id] ?? [:]
            if let kind { own[kind] = kind == "dispatch" ? bytes : max(own[kind] ?? 0, bytes) }
            let others = entries.reduce(0) { sum, entry in
                entry.key == id ? sum : ContextBytes.sum(sum, entry.value.values.reduce(0) { ContextBytes.sum($0, $1) })
            }
            let proposed = kind == nil ? 0 : own.values.reduce(0) { ContextBytes.sum($0, $1) }
            let required = ContextBytes.sum(others, proposed, slack)
            guard let gb = available(), gb.isFinite, gb >= 0, gb < Double(Int.max) / 1e9 else {
                throw RequestFailure(.insufficientMemory, "reclaimable memory is unreadable during \(phase)")
            }
            let observed = Int(gb * 1e9)
            guard required < Int.max, observed >= required else {
                var failure = RequestFailure(.insufficientMemory,
                    "insufficient memory for \(phase), queued requests and safety headroom; retry after other requests finish")
                failure.requiredBytes = required; failure.availableBytes = observed
                throw failure
            }
            if kind != nil { entries[id] = own }
        }
    }
}

/// One accepted request owns one monotonic clock, including all queue and
/// preparation work. Neither transport activity nor prefix reuse restarts it.
/// Injectable observations exercise refusal without stressing the machine.
public final class RequestController: @unchecked Sendable {
    public let configuration: ContextConfiguration
    public let slackBytes: Int
    private let clock: () -> UInt64
    private let available: () -> Double?
    private let connected: () -> Bool
    private let pressure: () -> Bool
    private let started: UInt64
    private let lock = NSLock()
    private var failureValue: RequestFailure?
    private var firstToken = false
    private var estimateValue: Double?
    private let reservationID = UUID()
    private var reservations: RequestMemoryReservations?
    public var estimatedPrefillSeconds: Double? { lock.withLock { estimateValue } }

    public init(configuration: ContextConfiguration, slackBytes: Int,
                clock: @escaping () -> UInt64 = { DispatchTime.now().uptimeNanoseconds },
                availableGB: @escaping () -> Double? = { Planner.deviceAvailableGB() },
                connected: @escaping () -> Bool = { true }, pressure: @escaping () -> Bool = { false }) {
        self.configuration = configuration
        self.slackBytes = max(0, slackBytes)
        self.clock = clock; self.available = availableGB; self.connected = connected; self.pressure = pressure
        started = clock()
    }
    deinit { reservations?.release(reservationID) }
    package func attachReservations(_ pool: RequestMemoryReservations) throws {
        try lock.withLock {
            if let reservations, reservations !== pool {
                throw RequestFailure(.invalidConfiguration, "a request cannot move between engine memory budgets")
            }
            reservations = pool
        }
    }
    package func releaseDispatchReservation() {
        lock.withLock { reservations?.releaseDispatch(reservationID) }
    }
    public var elapsedSeconds: Double {
        let now = clock()
        return Double(now >= started ? now - started : 0) / 1e9
    }
    public var failure: RequestFailure? { lock.withLock { failureValue } }
    public var mayRetainState: Bool { failure == nil }
    @discardableResult public func fail(_ error: RequestFailure) -> RequestFailure {
        lock.withLock {
            if failureValue == nil { failureValue = error }
            return failureValue!
        }
    }
    public func cancel() { fail(RequestFailure(.clientCancelled, "the client cancelled this request")) }
    public func sampledFirstToken() { lock.withLock { firstToken = true } }

    /// Check before an allocation, not after it. Only actually reusable bytes
    /// can be subtracted by callers; future reservations never authorize growth.
    public func check(nextAllocationBytes: Int = 0, phase: String = "inference") throws {
        if let failure { throw failure }
        guard nextAllocationBytes >= 0 else {
            throw fail(RequestFailure(.invalidConfiguration, "allocation byte count must be nonnegative"))
        }
        if !connected() { throw fail(RequestFailure(.clientCancelled, "the client disconnected during \(phase)")) }
        let elapsed = elapsedSeconds
        let seconds = configuration.maxPrefillWaitMinutes * 60
        if seconds > 0, !lock.withLock({ firstToken }), elapsed >= seconds {
            var error = RequestFailure(.prefillDeadlineExceeded,
                "request-to-first-token deadline exceeded during \(phase); send less context or raise --max-prefill-wait")
            error.elapsedSeconds = elapsed; error.limitSeconds = seconds
            throw fail(error)
        }
        if pressure() {
            throw fail(RequestFailure(.insufficientMemory, "memory pressure interrupted \(phase); retry after memory becomes available"))
        }
        if let pool = lock.withLock({ reservations }) {
            do {
                try pool.check(reservationID, kind: nextAllocationBytes > 0 ? "dispatch" : nil,
                    bytes: nextAllocationBytes, slack: slackBytes, available: available, phase: phase)
            } catch let error as RequestFailure { throw fail(error) }
            return
        }
        let (required, overflow) = max(0, nextAllocationBytes).addingReportingOverflow(slackBytes)
        guard !overflow else { throw fail(RequestFailure(.insufficientMemory, "allocation size exceeds the supported memory range")) }
        let reading = available()
        if let gb = reading, gb.isFinite, gb >= 0, gb < Double(Int.max) / 1e9 {
            let bytes = Int(gb * 1e9)
            if bytes < required {
                var error = RequestFailure(.insufficientMemory,
                    "insufficient reclaimable memory for \(phase) and safety headroom; close other apps or lower the memory/context target")
                error.requiredBytes = required; error.availableBytes = bytes
                throw fail(error)
            }
        } else if configuration.maxContextTokens > ContextPolicy.defaultTokens && nextAllocationBytes > 0 {
            throw fail(RequestFailure(.insufficientMemory,
                "reclaimable memory is unreadable; refusing additional long-context allocation during \(phase)"))
        }
    }

    /// Conservative temporary-copy allowance for templating/tokenization.
    /// Counting input must not itself serialize an arbitrarily large value.
    public func checkInputBytes(_ bytes: Int) throws {
        guard bytes >= 0 else { throw fail(RequestFailure(.invalidConfiguration, "invalid input byte count")) }
        try reservePreparation(kind: "input", bytes: ContextBytes.product(bytes, 16), phase: "prompt tokenization")
    }

    package func reservePreparedImageBytes(_ bytes: Int) throws {
        try reservePreparation(kind: "pixels", bytes: bytes, phase: "retained image preparation")
    }
    private func reservePreparation(kind: String, bytes: Int, phase: String) throws {
        guard bytes >= 0 else { throw fail(RequestFailure(.invalidConfiguration, "invalid preparation byte count")) }
        try check(phase: phase)
        if let pool = lock.withLock({ reservations }) {
            do { try pool.check(reservationID, kind: kind, bytes: bytes, slack: slackBytes, available: available, phase: phase) }
            catch let error as RequestFailure { throw fail(error) }
        } else { try check(nextAllocationBytes: bytes, phase: phase) }
    }

    public func admit(missingTokens: Int, from position: Int, maxChunk: Int,
                      tailAware: Bool = false) throws {
        try check(phase: "admission")
        let estimate = PrefillSchedule.estimateSeconds(tokens: missingTokens, from: position,
            maxChunk: maxChunk, tailAware: tailAware)
        lock.withLock { estimateValue = estimate }
        let limit = configuration.maxPrefillWaitMinutes * 60
        if limit > 0, let estimate, elapsedSeconds + estimate > limit {
            var error = RequestFailure(.prefillWaitExceeded,
                "estimated missing-context prefill exceeds the remaining wait budget; send less, reuse a valid prefix, or raise --max-prefill-wait")
            error.elapsedSeconds = elapsedSeconds; error.limitSeconds = limit; error.estimatedSeconds = estimate
            throw fail(error)
        }
    }
}

````````````

## Artifact SHA-256 27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b

Encoding: `utf-8`. Original bytes: 11340.

````````````text
// Resident weight loading and the quantized-linear primitive.
//
// Residents = everything except routed experts (switch_mlp) and the n-gram
// store shards; ~3.8 GB at 4-bit, loaded whole via MLX's safetensors reader.

import Foundation
import MLX

/// A linear layer read from the checkpoint: quantized (weight+scales+biases)
/// or plain bf16, decided by whether `<name>.scales` exists.
public struct QLinear {
    public let w: MLXArray
    public let scales: MLXArray?
    public let biases: MLXArray?
    public let groupSize: Int
    public let bits: Int

    package init(w: MLXArray, scales: MLXArray?, biases: MLXArray?, groupSize: Int, bits: Int) {
        self.w = w; self.scales = scales; self.biases = biases
        self.groupSize = groupSize; self.bits = bits
    }

    public var isQuantized: Bool { scales != nil }

    public func callAsFunction(_ x: MLXArray) -> MLXArray {
        if let s = scales {
            return quantizedMM(
                x, w, scales: s, biases: biases, transpose: true,
                groupSize: groupSize, bits: bits)
        }
        return matmul(x, w.transposed())
    }

    /// Keep the established row dispatch for a token-wise projection. Dummy
    /// rows are cropped before any sequence operation or cache update. This
    /// does not pad attention queries, recurrent steps, or logical token IDs.
    package func callAsFunction(_ x: MLXArray, minimumRows: Int) -> MLXArray {
        Self.withReferenceRows(x, minimumRows: minimumRows) { self($0) }
    }

    package static func withReferenceRows(_ x: MLXArray, minimumRows: Int,
                                          _ project: (MLXArray) -> MLXArray) -> MLXArray {
        let rows = x.size / x.dim(-1)
        guard rows > 0, rows < minimumRows, minimumRows <= 256 else { return project(x) }
        let flat = x.reshaped([rows, x.dim(-1)])
        let padded = concatenated([flat, broadcast(flat[(rows - 1)...],
            to: [minimumRows - rows, x.dim(-1)])], axis: 0)
        let output = project(padded)
        return output[0 ..< rows].reshaped(Array(x.shape.dropLast()) + [output.dim(-1)])
    }
}

/// Anything that can hand out named tensors from a checkpoint: the resident
/// trunk (ResidentWeights) or the MTP block's own file (MTPWeights). Layer
/// blocks are built against this so the MTP head can reuse them verbatim.
public protocol TensorSource: AnyObject {
    var config: ModelConfig { get }
    func optionalTensor(_ name: String) -> MLXArray?
}

extension TensorSource {
    public func has(_ name: String) -> Bool { optionalTensor(name) != nil }

    public func tensor(_ name: String) -> MLXArray {
        guard let a = optionalTensor(name) else { fatalError("missing tensor \(name)") }
        return a
    }

    public func linear(_ base: String, groupSize: Int? = nil, bits: Int? = nil) -> QLinear {
        let w = tensor(base + ".weight")
        let s = optionalTensor(base + ".scales")
        let b = optionalTensor(base + ".biases")
        return QLinear(
            w: w, scales: s, biases: b,
            groupSize: groupSize ?? config.qGroup, bits: bits ?? config.qBits)
    }
}

public final class ResidentWeights: TensorSource {
    public let arrays: [String: MLXArray]
    public let config: ModelConfig
    package let packedGDNProjections: [Int: PackedProjectionPair]
    public var packedGDNProjectionLayers: Int { packedGDNProjections.count }
    /// Shared backing already included in named resident tensors; not extra bytes.
    public var packedGDNProjectionPayloadBytes: Int {
        packedGDNProjections.values.reduce(0) { $0 + $1.payloadBytes }
    }
    private let embeddingRows: EmbeddingRows?
    public var usesEmbeddingRows: Bool { embeddingRows != nil }
    package var embeddingReadFault: ReadFault? {
        get { embeddingRows?.readFault }
        set { embeddingRows?.readFault = newValue }
    }
    package var embeddingRowHits: Int { embeddingRows?.uniqueRowHits ?? 0 }
    package var embeddingRowMisses: Int { embeddingRows?.uniqueRowMisses ?? 0 }
    package var embeddingCachedRows: Int { embeddingRows?.cachedRows ?? 0 }
    package var embeddingCachedPayloadBytes: Int { embeddingRows?.cachedPayloadBytes ?? 0 }
    package func clearEmbeddingRows() { embeddingRows?.clear() }

    public convenience init(index: CheckpointIndex, includeLayerExperts: Set<Int> = []) throws {
        try self.init(index: index, includeLayerExperts: includeLayerExperts, embeddingRowCache: nil)
    }

    package init(index: CheckpointIndex, includeLayerExperts: Set<Int> = [], embeddingRowCache: Bool?,
                 packGDNProjections: Bool = false) throws {
        // Golden/debug commands can load the multi-GB resident trunk without
        // constructing Qwen4ExpModel. They need the same cross-process guard as
        // run/serve or they can silently stack underneath another model.
        try ModelProcessGuard.acquire()
        self.config = index.config
        let setting = ProcessInfo.processInfo.environment["SLOTSTREAM_EMBEDDING_ROWS"] ?? "0"
        guard setting == "0" || setting == "1" else { throw ModelError("SLOTSTREAM_EMBEDDING_ROWS must be 0 or 1") }
        let useRows = embeddingRowCache ?? (setting == "1")
        self.embeddingRows = useRows ? try EmbeddingRows(index: index) : nil
        var kept: [String: MLXArray] = [:]
        let files = Set(index.tensors.values.map { $0.file })
        for f in files.sorted(by: { $0.lastPathComponent < $1.lastPathComponent }) {
            let all = try loadArrays(url: f)
            for (rawKey, arr) in all {
                var key = rawKey
                if key.hasPrefix("language_model.") { key.removeFirst("language_model.".count) }
                if key.hasPrefix("mtp.") || key.hasPrefix("vision_tower.") || key.hasPrefix("model.visual.") {
                    continue
                }
                if key.contains("ngram_embedding.shard_") { continue }
                if key.contains(".switch_mlp.") {
                    // routed experts stay on SSD unless explicitly requested (parity rig)
                    let isWanted = includeLayerExperts.contains { key.contains("model.layers.\($0).mlp.switch_mlp.") }
                    if !isWanted { continue }
                }
                kept[key] = arr
            }
        }
        var packed: [Int: PackedProjectionPair] = [:]
        if packGDNProjections {
            func projection(_ base: String) -> QLinear? {
                guard let weight = kept[base + ".weight"] else { return nil }
                return QLinear(w: weight, scales: kept[base + ".scales"], biases: kept[base + ".biases"],
                    groupSize: index.config.qGroup, bits: index.config.qBits)
            }
            for layer in config.layerTypes.indices where config.layerTypes[layer] == "linear_attention" {
                let base = "model.layers.\(layer).linear_attn"
                let a = base + ".in_proj_qkv", b = base + ".in_proj_z"
                guard let first = projection(a), let second = projection(b),
                      let pair = PackedProjectionPair(first, second) else { continue }
                for (name, view) in [(a, pair.first), (b, pair.second)] {
                    kept[name + ".weight"] = view.w
                    kept[name + ".scales"] = view.scales
                    kept[name + ".biases"] = view.biases
                }
                packed[layer] = pair
            }
        }
        self.packedGDNProjections = packed
        // Keep the public tensor dictionary complete. In the experimental row
        // path only lookup tensors stay lazy; explicit external tensor access
        // can still materialize their exact original values. No planner credit
        // is granted for this optional retention change.
        eval(kept.filter { !useRows || !EmbeddingRows.names.contains($0.key) }.map(\.value))
        self.arrays = kept
    }

    public func optionalTensor(_ name: String) -> MLXArray? { arrays[name] }

    /// Dequantized embedding rows for token ids: (B, S) -> (B, S, hidden).
    public func embed(_ ids: MLXArray) -> MLXArray {
        do { return try embedChecked(ids) }
        catch { preconditionFailure("embedding lookup failed: \(error)") }
    }

    /// Error-propagating companion for checked main/draft execution. Larger
    /// callers are split only for independent row lookup/dequantization; no
    /// model arithmetic or chronological prefill boundary is changed.
    public func embedChecked(_ ids: MLXArray) throws -> MLXArray {
        if let embeddingRows {
            guard [.uint8, .uint16, .uint32, .uint64, .int8, .int16, .int32, .int64].contains(ids.dtype) else {
                throw ModelError("embedding row IDs must be integers")
            }
            // Validate before narrowing: a large Int64 must not wrap onto a
            // different, apparently valid token ID.
            let values = ids.asType(.int64).asArray(Int64.self).map(Int.init)
            guard values.allSatisfy({ $0 >= 0 && $0 < config.vocabSize }) else {
                throw ModelError("embedding row ID outside vocabulary")
            }
            return try gatherEmbeddingRows(values, shape: ids.shape, rows: embeddingRows)
        }
        let w = tensor("model.embed_tokens.weight")
        guard let s = arrays["model.embed_tokens.scales"] else {
            return take(w, ids, axis: 0)
        }
        let b = arrays["model.embed_tokens.biases"]
        let rows = take(w, ids, axis: 0)
        let rs = take(s, ids, axis: 0)
        let rb = b.map { take($0, ids, axis: 0) }
        return dequantized(
            rows, scales: rs, biases: rb, groupSize: config.qGroup, bits: config.qBits)
    }

    /// Main and draft callers already own CPU token IDs. Avoid uploading them
    /// merely to synchronize a cast/readback in the row-cache path.
    package func embedChecked(_ ids: [Int], shape: [Int]) throws -> MLXArray {
        guard ids.allSatisfy({ $0 >= 0 && $0 < config.vocabSize }) else {
            throw ModelError("embedding row ID outside vocabulary")
        }
        if let embeddingRows { return try gatherEmbeddingRows(ids, shape: shape, rows: embeddingRows) }
        return try embedChecked(MLXArray(ids.map(Int32.init), shape))
    }

    private func gatherEmbeddingRows(_ values: [Int], shape: [Int], rows: EmbeddingRows) throws -> MLXArray {
        var count = 1
        for dim in shape {
            let next = count.multipliedReportingOverflow(by: dim)
            guard dim >= 0, dim <= Int(Int32.max), !next.overflow else {
                throw ModelError("invalid embedding lookup shape")
            }
            count = next.partialValue
        }
        guard count == values.count else { throw ModelError("embedding lookup shape does not match IDs") }
        if values.isEmpty { return MLXArray.zeros(shape + [config.hiddenSize], dtype: .bfloat16) }
        if values.count <= 4096 { return try rows.gather(values, shape: shape) }
        var parts: [MLXArray] = []
        for lo in stride(from: 0, to: values.count, by: 4096) {
            let end = min(values.count, lo + 4096)
            parts.append(try rows.gather(Array(values[lo ..< end]), shape: [end - lo]))
        }
        return concatenated(parts, axis: 0).reshaped(shape + [config.hiddenSize])
    }
}

````````````

## Artifact SHA-256 0166555aba0d15daf7a0570607978e4c341aec9ab430f5ce3bc25e3370f149da

Encoding: `utf-8`. Original bytes: 17050.

````````````text
import CryptoKit
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationCompletePrompt(modelDir: URL, mtp: Bool) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let index = try CheckpointIndex(dir: modelDir)
        let model = try Qwen4ExpModel(index: index, poolSlots: 640, embeddingRowCache: true)
        if mtp { try model.enableMTP(modelDir: modelDir) }
        let generator = Generator(model: model)
        generator.prefillChunk = 256; generator.prefillCacheLimit = 64 << 20
        generator.speculationEnabled = mtp; generator.draftDepth = 1
        var options = InferenceOptimizations.integrationCandidate
        options.prefixCheckpointTokens = 0
        var params = SampleParams.greedy; params.maxTokens = 4; params.seed = 7
        var c = CheckBuilder("optimization-complete-prompt\(mtp ? "-mtp" : "")")
        c.expect("complete prompt remains default off", try !InferenceOptimizations.environment([:]).completePromptCheckpoint)
        c.expect("explicit complete prompt option", try InferenceOptimizations.environment(["SLOTSTREAM_OPT_COMPLETE_PROMPT": "1"]).completePromptCheckpoint)
        func hash(_ a: MLXArray) -> String {
            "\(a.dtype):\(a.shape):\(SHA256.hash(data: Data(a.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self))))"
        }
        func stateAfter(_ cache: PrefixCache, _ ids: [Int], _ output: [Int], _ vision: VisionPrompt?) throws -> [String: String] {
            guard let hit = cache.take(matching: ids + output + [907], images: vision?.segments ?? []) else {
                throw ModelError("complete-prompt diagnostic lost consumed state")
            }
            var values = hit.state.prefixForkDiagnosticTensors().mapValues(hash)
            hit.state.invalidateMTP()
            values["continuedLogits"] = hash(try model.lastLogitsChecked([907], state: hit.state))
            return values
        }
        let tower = try VisionTower(index: index)
        let bytes = ["iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==",
                     "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA360e5gAAAABJRU5ErkJggg=="].map { Data(base64Encoded: $0)! }
        let images = try bytes.map { try VisionPreprocess.decodeCGImage($0) }
        let plans = try images.map { try tower.plan(for: $0) }
        func vision(_ start: Int?, color: Int = 0) -> VisionPrompt? {
            guard let start else { return nil }
            return VisionPrompt(tower: tower, items: [.init(image: images[color], plan: plans[color])],
                segments: [.init(start: start, count: plans[color].mergedTokens, hash: ImageHash(hashing: bytes[color]))],
                hiddenSize: model.cfg.hiddenSize)
        }
        let cases: [(Int, Int?)] = [(17, nil), (255, nil), (256, nil), (257, nil), (1025, nil),
            (273, 1), (273 + plans[0].mergedTokens, 256 - plans[0].mergedTokens / 2)]
        for (count, imageStart) in cases {
            let label = "\(count)/image=\(String(describing: imageStart))"
            FileHandle.standardError.write(Data("complete prompt \(label)\n".utf8))
            var ids = (0..<count).map { 1000 + ($0 * 79) % 190_000 }
            if let imageStart {
                ids.replaceSubrange(imageStart..<imageStart+plans[0].mergedTokens,
                    with: repeatElement(model.cfg.imageTokenId, count: plans[0].mergedTokens))
            }
            let referenceCache = PrefixCache(maxTokens: 8192)
            options.completePromptCheckpoint = false; model.optimizations = options
            let referenceVision = vision(imageStart)
            let reference = generator.generate(promptIds: ids, params: params, eosIds: [], cache: referenceCache, vision: referenceVision)
            c.expect("\(label): reference completes", reference.1.runtimeError == nil && reference.0.count == params.maxTokens)
            let expected = try stateAfter(referenceCache, ids, reference.0, referenceVision)
            referenceCache.drop()
            options.completePromptCheckpoint = true; model.optimizations = options
            let cache = PrefixCache(maxTokens: 8192)
            for attempt in 0..<3 {
                let vp = vision(imageStart)
                let result = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache, vision: vp)
                c.expect("\(label)/\(attempt): completes", result.1.runtimeError == nil)
                c.equal("\(label)/\(attempt): exact output IDs", result.0, reference.0)
                c.equal("\(label)/\(attempt): complete hits", result.1.completePromptHits, attempt == 0 ? 0 : 1)
                c.equal("\(label)/\(attempt): prefill tokens", result.1.prefillTokens, attempt == 0 ? count : 0)
                c.equal("\(label)/\(attempt): reused tokens", result.1.reusedPrefixTokens, attempt == 0 ? 0 : count)
                c.equal("\(label)/\(attempt): retained prompts", cache.heldCheckpoints, 1)
                c.equal("\(label)/\(attempt): checkpoint errors", result.1.prefixCheckpointErrors, 0)
                if attempt > 0 {
                    c.equal("\(label)/\(attempt): no prefill records", result.1.prefillRecords, 0)
                    c.equal("\(label)/\(attempt): no prefill passes", result.1.prefillPasses, [])
                    c.equal("\(label)/\(attempt): tower skipped", result.1.encodedImages, 0)
                }
                c.equal("\(label)/\(attempt): all state and continued logits exact", try stateAfter(cache, ids, result.0, vp), expected)
            }
            c.expect("\(label): public API remains strictly extend-only", cache.take(matching: ids, images: vision(imageStart)?.segments ?? []) == nil)
            if imageStart != nil {
                let changed = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache, vision: vision(imageStart, color: 1))
                c.equal("\(label): changed pixels refuse reuse", changed.1.completePromptHits, 0)
                c.equal("\(label): changed pixels rebuild prompt", changed.1.prefillTokens, count)
            }
            if count == 17 {
                for filtered in [false, true] {
                    var sample = params; sample.temperature = 0.7
                    sample.topK = filtered ? 40 : 0; sample.topP = filtered ? 0.8 : 1
                    sample.minP = filtered ? 0.05 : 0; sample.presencePenalty = filtered ? 1.1 : 0
                    for seed: UInt64 in [7, 7_046_029_254_386_353_130] {
                        sample.seed = seed
                        let cold = generator.generate(promptIds: ids, params: sample, eosIds: [])
                        let hot = generator.generate(promptIds: ids, params: sample, eosIds: [], cache: cache)
                        c.equal("sample \(filtered)/\(seed): exact output", hot.0, cold.0)
                        c.equal("sample \(filtered)/\(seed): complete hit", hot.1.completePromptHits, 1)
                    }
                }
                // Public maxTokens <= 0 means "up to the response ceiling";
                // test zero emissions through cancellation, never by asking
                // this bounded diagnostic to generate 32,768 tokens.
                for limit in [1] {
                    var limited = params; limited.maxTokens = limit
                    let result = generator.generate(promptIds: ids, params: limited, eosIds: [], cache: cache)
                    c.equal("limit \(limit): exact output count", result.0.count, limit)
                    c.equal("limit \(limit): complete hit", result.1.completePromptHits, 1)
                }
                let noOutput = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache,
                    shouldContinue: { false })
                c.expect("cancel before first output is empty", noOutput.0.isEmpty && noOutput.1.finishReason == "cancelled" && noOutput.1.requestFailure?.code == .clientCancelled)
                c.equal("zero-emission cancellation reuses complete prompt", noOutput.1.completePromptHits, 1)
                let eos = generator.generate(promptIds: ids, params: params, eosIds: [reference.0[0]], cache: cache)
                c.expect("EOS stops without output", eos.0.isEmpty && eos.1.finishReason == "stop")
                var delivered: [Int] = []
                let stopped = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache,
                    onToken: { delivered.append($0); return delivered.count < 2 })
                c.equal("callback cancellation preserves exact prefix", stopped.0, Array(reference.0.prefix(2)))
                let retry = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                c.equal("cancelled request preserves root", retry.0, reference.0)
                c.equal("retry avoids prefill", retry.1.prefillTokens, 0)
                let key = PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                    prefillChunk: generator.prefillChunk, mtp: mtp)
                for wrongKey in [PromptCheckpointKey(model: UUID(), optimizations: model.optimizations,
                    prefillChunk: generator.prefillChunk, mtp: mtp),
                    PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                        prefillChunk: 128, mtp: mtp),
                    PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                        prefillChunk: generator.prefillChunk, mtp: !mtp),
                    PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                        prefillChunk: generator.prefillChunk, mtp: mtp, contextArithmetic: 0)] {
                    c.expect("wrong model, schedule, draft or arithmetic identity refuses complete hit",
                        cache.takeForGeneration(matching: ids, completePromptKey: wrongKey) == nil)
                }
                if let root = cache.takeForGeneration(matching: ids, completePromptKey: key), let raw = root.logits {
                    let rawHash = hash(raw)
                    let unit = PrefixCache.bytesPerToken
                    let stateCharge = max(ids.count, (root.state.allocatedSequenceBytes + unit - 1) / unit)
                    let logitCharge = (raw.nbytes + PrefixCache.logitStorageSlackBytes + unit - 1) / unit
                    let charge = stateCharge + logitCharge
                    for budget in [0, charge, 2 * charge - 1, 2 * charge] {
                        let bounded = PrefixCache(maxTokens: budget)
                        let stored = try bounded.storeCompletePrompt(state: root.state, tokens: ids,
                            reserveTokens: ids.count + params.maxTokens, reserveSequenceBytes: root.state.allocatedSequenceBytes,
                            logits: raw, vocabularySize: model.cfg.vocabSize, key: key)
                        c.equal("logits charged at budget \(budget)", stored, budget >= 2 * charge)
                        c.equal("exact charged capacity at budget \(budget)", bounded.json()["charged_token_capacity"] as? Int,
                            stored ? charge : 0)
                    }
                    let owned = PrefixCache(maxTokens: 8192)
                    c.expect("ownership checkpoint stored", try owned.storeCompletePrompt(state: root.state, tokens: ids,
                        reserveTokens: 4096, reserveSequenceBytes: root.state.allocatedSequenceBytes,
                        logits: raw, vocabularySize: model.cfg.vocabSize, key: key))
                    raw[0] = MLXArray(Float(333))
                    if let first = owned.takeForGeneration(matching: ids, completePromptKey: key), let firstRow = first.logits {
                        c.equal("producer logit context cannot mutate retained row", hash(firstRow), rawHash)
                        firstRow[0] = MLXArray(Float(-333))
                    } else { c.expect("owned checkpoint remains readable", false) }
                    if let second = owned.takeForGeneration(matching: ids, completePromptKey: key), let secondRow = second.logits {
                        c.equal("returned logit context cannot mutate retained row", hash(secondRow), rawHash)
                    } else { c.expect("owned checkpoint remains repeatable", false) }
                    do {
                        _ = try owned.storeCompletePrompt(state: root.state, tokens: ids,
                            reserveTokens: 4096, reserveSequenceBytes: root.state.allocatedSequenceBytes,
                            logits: MLXArray.zeros([2], dtype: .bfloat16), vocabularySize: model.cfg.vocabSize, key: key)
                        c.expect("malformed logits rejected", false)
                    } catch { c.expect("malformed logits rejected", true) }
                    c.equal("invalid logits preserve existing checkpoint", owned.heldCheckpoints, 1)
                    owned.configure(maxTokens: 0)
                    c.equal("pressure releases state and logits", owned.heldTokens, 0)
                    c.equal("pressure preserves borrowed active state", root.state.tokenCount, count)
                } else { c.expect("complete root exposes logits for ownership checks", false) }
                Stream.gpu.synchronize()
                model.pool.unpinAll()
                try model.pool.diagnosticDiscardResidency()
                let fault = ReadFault(afterJobs: 0); model.pool.readFault = fault
                let failed = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                model.pool.readFault = nil
                c.expect("decode read fault fires after complete reuse", fault.hasFired && failed.1.runtimeError != nil)
                c.equal("failed decode reused the prompt", failed.1.completePromptHits, 1)
                let recovered = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                c.equal("decode failure preserves exact reusable root", recovered.0, reference.0)
                c.equal("read-failure retry avoids prefill", recovered.1.prefillTokens, 0)
                var edited = ids; edited[0] += 1
                let edit = generator.generate(promptIds: edited, params: params, eosIds: [], cache: cache)
                c.equal("edited token misses", edit.1.reusedPrefixTokens, 0)
                let auxiliary = generator.generate(promptIds: [17, 23, 31], params: params, eosIds: [], cache: cache)
                c.expect("auxiliary completes", auxiliary.1.runtimeError == nil)
                let interleaved = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                c.equal("interleaved output remains exact", interleaved.0, reference.0)
                c.expect("charged capacity stays bounded", (cache.json()["charged_token_capacity"] as? Int ?? Int.max) <= cache.maxTokens)
            }
            cache.drop()
        }
        if mtp {
            let ids = (0..<17).map { 1000 + $0 * 79 }
            let transition = PrefixCache(maxTokens: 8192)
            options.completePromptCheckpoint = false; model.optimizations = options
            generator.speculationEnabled = false
            let plain = generator.generate(promptIds: ids, params: params, eosIds: [], cache: transition)
            c.expect("draft transition seed succeeds", plain.1.runtimeError == nil)
            guard let consumed = transition.peek(extending: ids) else { throw ModelError("draft transition lost exact consumed IDs") }
            let extended = consumed + [907]
            options.completePromptCheckpoint = true; model.optimizations = options
            generator.speculationEnabled = true
            let fallback = generator.generate(promptIds: extended, params: params, eosIds: [], cache: transition)
            c.equal("plain cached state finishes current request plain", fallback.1.verifyPasses, 0)
            c.equal("plain-to-draft transition really reused state", fallback.1.reusedPrefixTokens, consumed.count)
            let rebuilt = generator.generate(promptIds: extended, params: params, eosIds: [], cache: transition)
            c.equal("complete prompt with missing head is not an MTP hit", rebuilt.1.completePromptHits, 0)
            c.equal("missing draft head is rebuilt from the full prompt", rebuilt.1.prefillTokens, extended.count)
            c.expect("rebuilt draft participates", rebuilt.1.verifyPasses > 0)
            let hot = generator.generate(promptIds: extended, params: params, eosIds: [], cache: transition)
            c.equal("rebuilt draft checkpoint can be reused completely", hot.1.completePromptHits, 1)
            c.equal("reused draft output is exact", hot.0, rebuilt.0)
        }
        c.measure("end_physical_bytes", Double(ProcessMemory.residentBytes()))
        return c.report()
    }
}

````````````

## Artifact SHA-256 7363b347ae2df47ff005cb414722434d8d67783ea85a228d68f3b829153f5f8e

Encoding: `utf-8`. Original bytes: 31279.

````````````text
import Foundation
import Slotstream

extension Diagnostics {
    public static func configurableContext() throws -> CheckReport {
        var c = CheckBuilder("configurable-context")
        let cacheModel = UUID(), cacheOptions = InferenceOptimizations()
        let currentKey = PromptCheckpointKey(model: cacheModel, optimizations: cacheOptions,
            prefillChunk: 256, mtp: false)
        c.equal("prompt cache defaults to the current arithmetic epoch", currentKey.contextArithmetic, 1)
        c.expect("old arithmetic cannot match a current prompt checkpoint", currentKey != PromptCheckpointKey(
            model: cacheModel, optimizations: cacheOptions, prefillChunk: 256, mtp: false, contextArithmetic: 0))
        let caps = [1, 1024, 4096, 8192, 32768, 32769, 65535, 65536, 65537,
                    128255, 128256, 128257, 131071, 131072, 131073, 262143, 262144]
        for cap in caps {
            let bytes = ContextGeometry.sequenceBytes(tokens: cap)
            // Independent allocator geometry, not a restatement of a helper call.
            let rows = ((cap + 1023) / 1024) * 1024
            c.equal("main allocated capacity \(cap)", bytes, rows * 12 * (2 * 2 * 256 + 128) * 2)
            c.equal("MTP allocated capacity \(cap)", ContextGeometry.sequenceBytes(tokens: cap, mtp: true),
                    rows * 13 * (2 * 2 * 256 + 128) * 2)
        }
        c.equal("overflowing capacity is refused", ContextGeometry.sequenceBytes(tokens: Int.max), Int.max)
        c.equal("negative capacity is refused", ContextGeometry.sequenceBytes(tokens: -1), Int.max)
        // These represent separately owned buffers, including different spare
        // main/draft capacities after rollback. A large unrelated buffer cannot
        // pay for a replacement, and old storage is not yet reclaimable.
        let keyRow = 2 * 256 * 2
        let mainGrowth = ContextGeometry.nextBufferAllocationBytes(tokens: 1025,
            rowBytes: keyRow, allocatedBytes: 1024 * keyRow)
        let draftSpare = ContextGeometry.nextBufferAllocationBytes(tokens: 1024,
            rowBytes: keyRow, allocatedBytes: 4096 * keyRow)
        c.equal("main growth charges complete replacement", mainGrowth, 2048 * keyRow)
        c.equal("draft can reuse its own spare rows", draftSpare, 0)
        c.equal("draft spare does not offset main growth", mainGrowth + draftSpare, 2048 * keyRow)
        c.equal("matching buffer reuses existing capacity", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1024, rowBytes: keyRow, allocatedBytes: 1024 * keyRow), 0)
        c.equal("absent pooled indexer needs its own allocation", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1025, rowBytes: 256, allocatedBytes: 0, step: 256), 1280 * 256)
        c.equal("compact raw growth preserves its 256-row step", ContextGeometry.nextBufferAllocationBytes(
            tokens: 304, rowBytes: 256, allocatedBytes: 256 * 256, step: 256), 512 * 256)
        c.equal("compact tail copy is a new allocation", ContextGeometry.nextBufferAllocationBytes(
            tokens: 32, rowBytes: 256, allocatedBytes: 0, step: 256), 256 * 256)
        c.equal("provisional batch crosses the next allocation step", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1023 + 1 + 16, rowBytes: keyRow, allocatedBytes: 1024 * keyRow), 2048 * keyRow)
        c.equal("checkpoint copy cannot spend shared backing", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1000, rowBytes: keyRow, allocatedBytes: 0), 1024 * keyRow)
        c.equal("invalid allocation geometry refuses", ContextGeometry.nextBufferAllocationBytes(
            tokens: Int.max, rowBytes: keyRow, allocatedBytes: 0), Int.max)
        c.equal("negative owned byte count refuses", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1, rowBytes: keyRow, allocatedBytes: -1), Int.max)
        for room in 0 ... 18 {
            let depth = ContextPolicy.maximumDraftDepth(requested: 16, at: 65536 - room, limit: 65536)
            c.equal("provisional context bounds draft depth/\(room)", depth, min(16, max(0, room - 1)))
            if room > 0 { c.expect("pending plus drafts remain inside context/\(room)", 1 + depth <= room) }
        }
        c.equal("Hermes transient anchor remains fixed", ContextMemoryLedger.transientReserveBytes(context: 65536), 905_969_664)
        c.equal("default has no extra reserve", ContextMemoryLedger.transientReserveBytes(context: 32768), 0)
        // Concurrent requests see one unchanged injected reading. Atomic
        // reservations, not real large allocations, decide how many fit.
        let reservations = RequestMemoryReservations()
        let resultLock = NSLock()
        var accepted: [RequestController] = []
        var refusals = 0
        let reservationPolicy = try ContextConfiguration(maxPrefillWaitMinutes: 0)
        DispatchQueue.concurrentPerform(iterations: 8) { _ in
            let control = RequestController(configuration: reservationPolicy, slackBytes: 1_000_000,
                availableGB: { 0.010 })
            do {
                try control.attachReservations(reservations)
                try control.reservePreparedImageBytes(4_000_000)
                resultLock.withLock { accepted.append(control) }
            } catch { resultLock.withLock { refusals += 1 } }
        }
        c.equal("concurrent preparations cannot spend the same headroom", accepted.count, 2)
        c.equal("excess concurrent preparations refuse before allocation", refusals, 6)
        c.equal("queued decoded pixels remain reserved", reservations.reservedBytes, 8_000_000)
        if let active = accepted.first {
            do { try active.check(nextAllocationBytes: 3_000_000, phase: "test active generation") } catch {}
            c.equal("generation cannot spend queued preparation ownership", active.failure?.code, .insufficientMemory)
            c.equal("failed dispatch preserves retained-pixel reservations", reservations.reservedBytes, 8_000_000)
        }
        var retainedPreparation: RequestController? = accepted.popLast()
        accepted.removeAll()
        c.equal("prepared-image owner keeps its lease after request queue release", reservations.reservedBytes, 4_000_000)
        withExtendedLifetime(retainedPreparation) {}
        retainedPreparation = nil
        c.equal("last preparation owner releases its exact reservation", reservations.reservedBytes, 0)
        do {
            let fresh = RequestController(configuration: reservationPolicy, slackBytes: 1_000_000, availableGB: { 0.010 })
            try fresh.attachReservations(reservations)
            try fresh.checkInputBytes(100_000)
            try fresh.checkInputBytes(1)
            c.equal("shorter later input check cannot release retained copies", reservations.reservedBytes, 1_600_000)
            try fresh.check(nextAllocationBytes: 4_000_000, phase: "test dispatch")
            c.equal("prepared and pending dispatch bytes are separately reserved", reservations.reservedBytes, 5_600_000)
            fresh.releaseDispatchReservation()
            c.equal("completed dispatch releases only transient ownership", reservations.reservedBytes, 1_600_000)
        }
        c.equal("request completion returns all reservations", reservations.reservedBytes, 0)
        for cap in caps {
            for target in [8.1, 10, 16, 24, 33] {
                for mtp in [Planner.MTPMode.off, .on, .auto] {
                    do {
                        let p = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44,
                            mtp: mtp, mtpAvailable: true, vision: .off, maxContextTokens: cap,
                            simulated: true, qualification: true)
                        c.expect("fit \(cap)/\(target)/\(mtp)", p.memoryLedger.expectedPeakBytes <= Int(target * 1e9))
                        c.equal("preserve window \(cap)/\(target)/\(mtp)", p.maxContextTokens, cap)
                        if mtp == .on { c.expect("forced MTP stays on \(cap)/\(target)", p.mtpEnabled) }
                    } catch {
                        c.expect("bounded refusal \(cap)/\(target)/\(mtp)", !String(describing: error).isEmpty)
                    }
                }
            }
        }
        let baseline = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 16,
            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44, mtp: .off, vision: .off, simulated: true)
        let small = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 16,
            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44, mtp: .off, vision: .off,
            maxContextTokens: 1024, simulated: true)
        c.expect("short cap refunds retention instead of reserving 32K", small.prefixCacheTokens <= 1024 && small.slots > baseline.slots)
        let machine = Machine.simulated(ramGB: 51.5, workingSetGB: 40.2, availableGB: 44)
        for target in [8.1, 10, 16, 24, 33] {
            let request = PlanRequest(memoryGB: target, mtp: .off, vision: .off, maxContextTokens: ContextPolicy.modelLimit)
            let result = Planner.contextFeasibility(request, on: machine, qualification: true)
            c.expect("solver maximum accepted at \(target)", result.maximumPlan != nil)
            if result.maximumFeasibleWindow < ContextPolicy.modelLimit {
                let next = result.maximumFeasibleWindow + 1
                let p = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                    ramGB: machine.ramGB, workingSetGB: machine.workingSetGB, availableGB: 44,
                    mtp: .off, vision: .off, maxContextTokens: next, simulated: true, qualification: true)
                c.expect("next solver token refused at \(target)", p == nil)
            }
        }
        for chunk in [64, 128, 256, 512, 1024, 2048, 4096] {
            for start in [0, 1, 32768, 65535, 128255, 128256, 128257, 131071, 262079, 262143] {
                let count = ContextPolicy.modelLimit - start
                var position = start
                let passes = PrefillSchedule.passes(tokens: count, from: start, maxChunk: chunk)
                var bounded = !passes.isEmpty
                for n in passes {
                    // Ordinary scheduling has always clamped small batch
                    // overrides up to 256. The 64-row floor applies only
                    // after the 256-row query/key product no longer fits.
                    let floor = 256 * (position + 256) <= 4096 * 8016 ? 256 : 64
                    bounded = bounded && n > 0 && n <= max(floor, chunk)
                        && n * (position + n) <= 4096 * 8016
                    position += n
                }
                c.expect("bounded schedule \(chunk) from \(start)", bounded && position == ContextPolicy.modelLimit)
            }
        }
        c.expect("overflowing schedule is refused", PrefillSchedule.passes(tokens: Int.max, from: Int.max, maxChunk: 4096).isEmpty)
        c.expect("uncalibrated late schedule is unknown", PrefillSchedule.estimateSeconds(tokens: 262144, maxChunk: 4096) == nil)
        c.expect("Hermes schedule retains an estimate", PrefillSchedule.estimateSeconds(tokens: 65536, maxChunk: 4096) != nil)
        let oddLate = PrefillSchedule.computePasses(tokens: 512, from: 200000, maxChunk: 4095)
        c.equal("diagnostic odd late schedule matches the canonical runtime shape", oddLate.map(\.tokens), Array(repeating: 64, count: 8))
        c.equal("diagnostic includes masked canonical columns", oddLate.map(\.keyExtent),
            Array(repeating: 200256, count: 4) + Array(repeating: 200512, count: 4))
        c.expect("diagnostic includes physical query rows", oddLate.allSatisfy { $0.queryRows == 64 })
        let paddedTail = PrefillSchedule.computePasses(tokens: 449, from: 200000, maxChunk: 4095)
        c.equal("diagnostic tail reports its padded query geometry", paddedTail.last?.queryRows, 64)
        c.equal("diagnostic tail preserves its one logical token", paddedTail.last?.tokens, 1)

        var tick: UInt64 = 0
        var available = 10.0
        var connected = true
        var pressure = false
        func controller(wait: Double = 1, cap: Int = 65536) throws -> RequestController {
            try RequestController(configuration: ContextConfiguration(maxContextTokens: cap, maxPrefillWaitMinutes: wait),
                slackBytes: 1_500_000_000, clock: { tick }, availableGB: { available },
                connected: { connected }, pressure: { pressure })
        }
        for invalid in [Double.nan, .infinity, -.infinity, -1, Double.greatestFiniteMagnitude] {
            c.expect("invalid duration \(invalid) refused", (try? ContextConfiguration(maxPrefillWaitMinutes: invalid)) == nil)
        }
        let estimated = try controller()
        do { try estimated.admit(missingTokens: 32768, from: 0, maxChunk: 256) } catch {}
        c.equal("cold estimate refuses before prefill", estimated.failure?.code, .prefillWaitExceeded)
        let reused = try controller()
        try reused.admit(missingTokens: 32, from: 64000, maxChunk: 4096)
        c.expect("fast continuation admits from its real position", reused.failure == nil)
        tick = 61_000_000_000
        do { try reused.check(phase: "image preparation") } catch {}
        c.equal("elapsed preparation still trips deadline", reused.failure?.code, .prefillDeadlineExceeded)
        tick = 0
        let queue = try controller()
        tick = 61_000_000_000
        do { try queue.check(phase: "queue") } catch {}
        c.equal("queue uses same clock", queue.failure?.code, .prefillDeadlineExceeded)
        tick = 0
        let decoding = try controller()
        decoding.sampledFirstToken(); tick = 61_000_000_000
        try decoding.check(phase: "decode")
        c.expect("decode does not inherit the prefill deadline", decoding.failure == nil)
        let timeless = try controller(wait: 0)
        tick += 100_000_000_000; try timeless.check()
        available = 1
        do { try timeless.check(nextAllocationBytes: 1) } catch {}
        c.equal("zero time policy retains memory guard", timeless.failure?.code, .insufficientMemory)
        available = 3
        let growth = try controller(wait: 0)
        do { try growth.check(nextAllocationBytes: 2_000_000_000) } catch {}
        c.equal("next allocation is charged before it starts", growth.failure?.code, .insufficientMemory)
        available = 10; pressure = true
        let pressed = try controller(wait: 0)
        do { try pressed.check() } catch {}
        c.equal("pressure is independent of time", pressed.failure?.code, .insufficientMemory)
        pressure = false; connected = false
        let cancelled = try controller()
        do { try cancelled.check() } catch {}
        c.equal("disconnect is typed cancellation", cancelled.failure?.code, .clientCancelled)
        c.expect("failed request cannot retain state", !cancelled.mayRetainState)
        let unknown = RequestController(configuration: try ContextConfiguration(maxContextTokens: 65536),
            slackBytes: 1_500_000_000, availableGB: { nil })
        do { try unknown.check(nextAllocationBytes: 1) } catch {}
        c.equal("unknown memory refuses long-state growth", unknown.failure?.code, .insufficientMemory)
        var governor = GovernorPolicy.Inputs(currentSlots: 2000, availableGB: 4, ramGB: 51.5,
            workingSetGB: 40.2, maxContextTokens: 65536)
        let empty = GovernorPolicy.desiredPlan(governor)
        governor.ownedAdditionalBytes = 1_000_000_000
        let owned = GovernorPolicy.desiredPlan(governor)
        c.expect("owned memory changes replan credit", (owned?.targetGB ?? 0) > (empty?.targetGB ?? 0))
        c.equal("request cap survives ownership credit", owned?.maxContextTokens, 65536)
        governor.availableGB = 0; governor.currentSlots = Geometry.floorSlots
        governor.maxContextTokens = ContextPolicy.modelLimit; governor.contextQualification = true
        governor.ownedAdditionalBytes = 0
        c.expect("infeasible governor plan is explicit", GovernorPolicy.desiredPlan(governor) == nil)
        for cap in [1, 1024, ContextPolicy.defaultTokens, ContextPolicy.mtpLimit] {
            for mtp in [false, true] {
                let exhausted = GovernorPolicy.Inputs(currentSlots: Geometry.floorSlots,
                    availableGB: 0, ramGB: 51.5, workingSetGB: 40.2,
                    mtpEnabled: mtp, maxContextTokens: cap)
                c.expect("ordinary startup advisory cannot authorize live work/\(cap)/\(mtp)",
                    GovernorPolicy.desiredPlan(exhausted) == nil)
                c.equal("infeasible floor does not invent a smaller arena/\(cap)/\(mtp)",
                    GovernorPolicy.decide(exhausted), .hold)
                var recovered = exhausted
                recovered.availableGB = 10
                if let plan = GovernorPolicy.desiredPlan(recovered) {
                    let physical = min(recovered.workingSetGB, recovered.availableGB
                        + Geometry.gb(recovered.currentSlots) + Planner.fixedFootprintGB
                        + (mtp ? Planner.mtpResidentGB : 0)
                        - Planner.availabilitySlackGB(ramGB: recovered.ramGB))
                    c.expect("recovery fits its credited physical budget/\(cap)/\(mtp)",
                        Double(plan.memoryLedger.expectedPeakBytes) <= physical * 1e9)
                    c.equal("feasible recovery preserves required head/\(cap)/\(mtp)", plan.mtpEnabled, mtp)
                } else {
                    c.expect("ordinary context has a feasible pure recovery/\(cap)/\(mtp)", false)
                }
            }
        }
        c.equal("overflowing public ledger saturates to refusal", ContextMemoryLedger(slots: Int.max,
            context: Int.max, chunk: Int.max, retentionTokens: Int.max, mtp: true, visionResident: true).expectedPeakBytes, Int.max)
        let originalVision = ContextWorkspace.visionBytes(patches: 9216)
        let tiledVision = ContextWorkspace.visionBytes(patches: 9216, queryTile: 256)
        c.expect("vision charge uses actual query bound", originalVision > tiledVision * 4)
        c.equal("unsupported vision mode is refused", ContextWorkspace.visionBytes(patches: 9216, queryTile: 512), Int.max)
        c.expect("late 64 pass retains context-dependent workspace", ContextWorkspace.prefillBytes(pass: 64, context: 262144) > 64 * 1_300_000)
        for override in [1, 64, 128, 256, 257, 511, 513, 1023, 2047, 4095, 4096] {
            for position in [0, 32768, 65535, 65536] {
                c.expect("ordinary window preserves original floor/\(override)/\(position)",
                    PrefillSchedule.chunk(at: position, maxChunk: override) >= 256)
            }
        }
        c.equal("projection shape padding is charged before dispatch", ContextWorkspace.prefillBytes(pass: 64,
            context: 256, minimumProjectionRows: 256), 256 * 1_300_000)
        c.equal("invalid projection shape refuses before dispatch", ContextWorkspace.prefillBytes(pass: 64,
            context: 256, minimumProjectionRows: 257), Int.max)
        c.equal("unbounded 128 final pass is refused", ContextWorkspace.prefillBytes(pass: 128, context: 262144), Int.max)
        c.equal("small attention domain stops at actual prompt end", ContextWorkspace.keyExtent(pass: 64,
            context: 448, referenceEnd: 470), 470)
        c.equal("small attention domain follows exact prefix origin", ContextWorkspace.keyExtent(pass: 64,
            context: 81, referenceStart: 17, referenceEnd: 515), 273)
        c.equal("invalid reference domain fails closed", ContextWorkspace.keyExtent(pass: 64,
            context: 81, referenceStart: 18, referenceEnd: 515), Int.max)
        c.equal("one-row tail preserves matrix query dispatch", ContextWorkspace.queryRows(pass: 1,
            context: 449, referenceEnd: 449), 64)
        c.equal("canonical one-row terminal keeps vector dispatch", ContextWorkspace.queryRows(pass: 1,
            context: 513, referenceEnd: 513), 1)
        c.equal("one-row tail prices its real key domain", ContextWorkspace.keyExtent(pass: 1,
            context: 449, referenceEnd: 449), 449)
        c.expect("padded tail workspace includes physical queries", ContextWorkspace.prefillBytes(pass: 1,
            context: 262143, referenceEnd: 262144, minimumProjectionRows: 256, padSmallQueries: true)
            >= 64 * 262144 * (24 * 8 + 16))
        for override in [64, 68, 127, 128, 136, 137, 255] {
            c.equal("late odd override selects a qualified full-pass shape/\(override)",
                ContextWorkspace.boundedSmallPass(requested: override, at: 200000,
                    referenceStart: 200000, referenceEnd: 262144), override >= 128 ? 128 : 64)
        }
        for origin in [0, 1, 17, 130001, 131073] {
            var position = max(origin, 256273), total = 0
            while position < ContextPolicy.modelLimit {
                let n = ContextWorkspace.boundedSmallPass(requested: 128, at: position,
                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
                guard n > 0 else { c.expect("small-pass schedule advances/\(origin)", false); break }
                let extent = ContextWorkspace.keyExtent(pass: n, context: position + n,
                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
                let queries = ContextWorkspace.queryRows(pass: n, context: position + n,
                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
                c.expect("actual padded product stays bounded/\(origin)/\(position)",
                    queries * extent <= PrefillSchedule.measuredQueryKeyProduct)
                c.expect("small pass never crosses its reference domain/\(origin)/\(position)",
                    n <= 256 - ((position - origin) % 256))
                position += n; total += n
            }
            c.equal("small-pass schedule closes/\(origin)", total, ContextPolicy.modelLimit - max(origin, 256273))
        }
        let busy = Planner.contextFeasibility(PlanRequest(memoryGB: 10, mtp: .off, vision: .off),
            on: Machine.simulated(ramGB: 16, workingSetGB: 12, availableGB: 5))
        c.equal("busy machine never calls an unphysical window feasible", busy.maximumFeasibleWindow, 0)
        for prefix in [false, true] {
            let policy = try RuntimeAllocationPolicy(prefillChunkOverride: 256, prefixCacheEnabled: prefix)
            let result = Planner.contextFeasibility(PlanRequest(memoryGB: 10, mtp: .off, vision: .off),
                on: machine, runtimePolicy: policy, qualification: true)
            c.expect("solver freezes actual retention policy \(prefix)", result.maximumPlan?.runtimeAllocationPolicy == policy)
            if let maximum = result.maximumPlan, maximum.maxContextTokens < ContextPolicy.modelLimit {
                let next = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 10,
                    ramGB: machine.ramGB, workingSetGB: machine.workingSetGB, availableGB: 44,
                    mtp: .off, vision: .off, maxContextTokens: maximum.maxContextTokens + 1,
                    simulated: true, qualification: true, runtimePolicy: policy)
                c.expect("same-policy next token fails \(prefix)", next == nil)
            }
        }
        c.expect("negative scope start is refused", PrefillSchedule.scopePasses(remaining: 10,
            at: -1, maxChunk: 4096, maxScope: 8192, tailAware: false).isEmpty)
        c.expect("overflowing scope is refused", PrefillSchedule.scopePasses(remaining: Int.max,
            at: 262140, maxChunk: 4096, maxScope: 8192, tailAware: false).isEmpty)
        let inputGuard = RequestController(configuration: try ContextConfiguration(), slackBytes: 0, availableGB: { 10 })
        do { try inputGuard.check(nextAllocationBytes: -1) } catch {}
        c.equal("negative public allocation cannot bypass guard", inputGuard.failure?.code, .invalidConfiguration)
        c.equal("negative public workspace scope refuses safely", ContextWorkspace.prefillBytes(pass: 64, context: 1024, scope: Int.min), Int.max)
        var nested = JSONValue.string("payload")
        for _ in 0 ..< 64 { nested = .array([nested]) }
        c.equal("deep input is bounded before template recursion", ContextInputMemory.bytes(nested), Int.max)
        let tool = ToolDefinition(name: "read", description: "description", parameters: .object(["long": .string(String(repeating: "x", count: 5000))]))
        c.expect("tool schema charged before tokenization", ContextInputMemory.bytes(messages: [], tools: [tool]) >= 5000)
        // Freeze a whole-machine reading, then account for what an existing
        // instance actually owns. A feasible restart and settled governor
        // must agree. The preserved legacy startup floor can also return an
        // advisory that exceeds the physical budget; that is a refusal case,
        // never evidence that the live governor should admit work.
        var governorCaps = Set<Int>()
        var advisoryRefusals = Set<String>()
        for cap in [8192, 32768, 65536, 131072, 262144] {
            for prefix in [false, true] {
                let policy = try RuntimeAllocationPolicy(prefillChunkOverride: 256, prefixCacheEnabled: prefix)
                for mode in [0, 1, 2] where mode == 0 || cap <= 65536 {
                    for whole in [10.0, 12.0, 18.0, 44.0] {
                        let label = "governor \(cap)/prefix=\(prefix)/mode=\(mode)/available=\(whole)"
                        let initial = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: nil,
                            ramGB: 51.5, workingSetGB: 40.2, availableGB: whole,
                            mtp: mode == 1 ? .on : .off, mtpAvailable: mode == 1,
                            vision: mode == 2 ? .on : .off, visionAvailable: mode == 2,
                            visionResidentReserved: mode == 2, maxContextTokens: cap,
                            qualification: true, runtimePolicy: policy)
                        guard let initial else { continue }
                        let additional = ContextGeometry.additionalActiveBytes(tokens: cap, mtp: mode == 1)
                        let held = prefix ? min(initial.prefixCacheTokens, 8192) * PrefixCache.bytesPerToken : 0
                        let owned = additional + held + (held > 0 ? PrefixCache.fixedBytesPerEntry : 0)
                        let physical = whole - initial.poolGB - Planner.fixedFootprintGB
                            - (mode == 1 ? Planner.mtpResidentGB : 0)
                            - (mode == 2 ? Planner.visionResidentGB : 0) - Double(owned) / 1e9
                        guard physical >= 0 else { continue }
                        governorCaps.insert(cap)
                        var input = GovernorPolicy.Inputs(currentSlots: initial.slots, availableGB: physical,
                            ramGB: 51.5, workingSetGB: 40.2, mtpEnabled: mode == 1,
                            visionEnabled: mode == 2, visionResidentReserved: mode == 2,
                            maxContextTokens: cap, runtimeAllocationPolicy: policy,
                            ownedAdditionalBytes: owned, contextQualification: true)
                        let settled = GovernorPolicy.desiredPlan(input)
                        let physicalBudget = min(input.workingSetGB,
                            whole - Planner.availabilitySlackGB(ramGB: input.ramGB))
                        let peak = Double(initial.memoryLedger.expectedPeakBytes)
                        let feasible = peak <= physicalBudget * 1e9
                            && (initial.targetGB.map { peak <= $0 * 1e9 } ?? true)
                        if !feasible {
                            advisoryRefusals.insert("\(cap)/\(prefix)/\(mode)/\(whole)")
                            c.expect("\(label): legacy startup advisory is refused live", settled == nil)
                            let target: Int
                            switch GovernorPolicy.decide(input) {
                            case .hold: target = input.currentSlots
                            case .resize(let slots, _): target = slots
                            }
                            c.equal("\(label): infeasible advisory settles at arena floor", target, Geometry.floorSlots)
                            input.availableGB += Geometry.gb(input.currentSlots - target)
                            input.currentSlots = target
                            c.expect("\(label): returning owned pool bytes cannot invent feasibility",
                                GovernorPolicy.desiredPlan(input) == nil)
                            c.equal("\(label): infeasible floor cannot shrink further", GovernorPolicy.decide(input), .hold)
                            continue
                        }
                        c.expect("\(label): same allocation after ownership credit", settled.map { abs($0.slots - initial.slots) <= 1 } ?? false)
                        c.equal("\(label): settled policy holds", GovernorPolicy.decide(input), .hold)
                        c.equal("\(label): chunk policy persists", settled?.prefillChunk, 256)
                        c.equal("\(label): mode persists", settled?.mtpEnabled, mode == 1)
                        if !prefix { c.equal("\(label): no retention resurrection", settled?.prefixCacheTokens, 0) }
                        input.pressure = .critical
                        let decision = GovernorPolicy.decide(input)
                        if case .resize(let slots, _) = decision {
                            c.expect("\(label): pressure gives memory back", slots < input.currentSlots && slots >= Geometry.floorSlots)
                            input.availableGB += Geometry.gb(input.currentSlots - slots)
                            input.currentSlots = slots
                        }
                        input.pressure = nil; input.secondsSincePressure = 1
                        c.equal("\(label): recovery respects cooldown", GovernorPolicy.decide(input), .hold)
                        input.secondsSincePressure = 61; input.secondsSinceResize = 61
                        if case .resize(let slots, _) = GovernorPolicy.decide(input) {
                            input.availableGB -= Geometry.gb(slots - input.currentSlots)
                            input.currentSlots = slots
                        }
                        c.equal("\(label): one recovery step settles", GovernorPolicy.decide(input), .hold)
                        c.equal("\(label): context survives recovery", GovernorPolicy.desiredPlan(input)?.maxContextTokens, cap)
                    }
                }
            }
        }
        c.equal("governor matrix executes every intended cap", governorCaps, Set([8192, 32768, 65536, 131072, 262144]))
        c.equal("governor matrix preserves all four original unphysical advisories", advisoryRefusals,
            Set(["8192/false/0/10.0", "8192/true/0/10.0", "32768/false/0/10.0", "32768/true/0/10.0"]))
        return c.report()
    }
}

````````````

## Artifact SHA-256 f4b9c59e6abc340e8f15b2d523296ab74fcd269cc39c67f514cb18f41a1f6a96

Encoding: `utf-8`. Original bytes: 59604.

````````````text
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Numerical/read-count probe only. Several states coexist for comparison;
    /// its resource and duration observations are not fresh-process A/B claims.
    public static func optimizationReadScope(modelDir: URL, tokens: Int) throws -> CheckReport {
        guard [4096, 8192].contains(tokens) else { throw ModelError("scope probe tokens must be 4096 or 8192") }
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        let ids = (0 ..< tokens).map { 1000 + (($0 * 7919) % 200_000) }
        var c = CheckBuilder("optimization-layer-read-scope")
        c.measure("workspace_token_tile", Double(model.optimizations.workspaceTokenTile))
        func build(chunk: Int, workspace: Bool) -> (Qwen4ExpModel.State, MLXArray, [Int: [Int32]], Int) {
            var options = InferenceOptimizations()
            options.compactStateWindows = true
            options.boundedIndexer = true
            options.boundedPLE = true
            options.layerExpertWorkspace = workspace
            options.workspaceTokenTile = model.optimizations.workspaceTokenTile
            options.compactScopeFrontier = model.optimizations.compactScopeFrontier
            model.optimizations = options
            model.pool.resetStats()
            model.pool.admitOnSweep = false
            var routes: [Int: [Int32]] = [:]
            model.routerObserver = { layer, ids in routes[layer, default: []].append(contentsOf: ids) }
            let state = model.makeState()
            var last = MLXArray(Float(0))
            for lo in stride(from: 0, to: tokens, by: chunk) {
                last = model.lastLogits(Array(ids[lo ..< min(tokens, lo + chunk)]), state: state)
                eval(last)
            }
            model.routerObserver = nil
            return (state, last, routes, model.pool.recordsFetched)
        }
        let (reference, referenceLogits, referenceRoutes, referenceReads) = build(chunk: 4096, workspace: false)
        let (control, controlLogits, controlRoutes, controlReads) = build(chunk: 1024, workspace: false)
        let (candidate, candidateLogits, candidateRoutes, candidateReads) = build(chunk: tokens, workspace: true)
        func relative(_ a: MLXArray, _ b: MLXArray, spread: Bool = false) -> Double {
            guard a.shape == b.shape, a.dtype == b.dtype else { return .infinity }
            let af = a.asType(.float32), bf = b.asType(.float32)
            let delta = abs(af - bf).max().item(Float.self)
            let denominator = spread ? (bf.max() - bf.min()).item(Float.self) : abs(bf).max().item(Float.self)
            return Double(delta / max(denominator, 1e-6))
        }
        let controlDelta = relative(controlLogits, referenceLogits, spread: true)
        let candidateDelta = relative(candidateLogits, referenceLogits, spread: true)
        c.measure("control_logit_spread_fraction", controlDelta)
        c.measure("candidate_logit_spread_fraction", candidateDelta)
        c.expect("logits inside preregistered rechunk band", candidateDelta <= max(3 * controlDelta, 0.01))
        c.equal("greedy final token", argMax(candidateLogits.reshaped([-1])).item(Int.self), argMax(referenceLogits.reshaped([-1])).item(Int.self))
        let rt = reference.diagnosticTensors(), ct = control.diagnosticTensors(), nt = candidate.diagnosticTensors()
        c.equal("candidate state fields", Set(nt.keys), Set(rt.keys))
        for key in rt.keys.sorted() {
            if let controlValue = ct[key], let candidateValue = nt[key] {
                if key == "tokens" || key == "ngram" {
                    c.expect("exact \(key)", (rt[key]! .== candidateValue).all().item(Bool.self))
                } else {
                    let baseline = relative(controlValue, rt[key]!)
                    let changed = relative(candidateValue, rt[key]!)
                    c.measure("control.\(key)", baseline)
                    c.measure("candidate.\(key)", changed)
                    c.expect("state band \(key)", changed <= max(3 * baseline, 0.01))
                }
            }
        }
        func routeDisagreement(_ routes: [Int: [Int32]]) -> Double {
            var different = 0, total = 0
            var stamps = [Int](repeating: 0, count: model.cfg.numExperts)
            var stamp = 0
            for layer in referenceRoutes.keys.sorted() {
                let ref = referenceRoutes[layer]!, got = routes[layer] ?? []
                guard ref.count == got.count else { return .infinity }
                for lo in stride(from: 0, to: ref.count, by: model.cfg.topK) {
                    stamp += 1
                    for i in lo ..< lo + model.cfg.topK { stamps[Int(ref[i])] = stamp }
                    for i in lo ..< lo + model.cfg.topK {
                        if stamps[Int(got[i])] != stamp { different += 1 }
                        total += 1
                    }
                }
            }
            return Double(different) / Double(max(1, total))
        }
        let ctrlRoutes = routeDisagreement(controlRoutes), newRoutes = routeDisagreement(candidateRoutes)
        c.measure("control_route_set_disagreement", ctrlRoutes)
        c.measure("candidate_route_set_disagreement", newRoutes)
        c.expect("routing inside preregistered rechunk band", newRoutes <= max(3 * ctrlRoutes, 0.01))
        c.measure("reference_read_records", Double(referenceReads))
        c.measure("control_read_records", Double(controlReads))
        c.measure("candidate_read_records", Double(candidateReads))
        c.expect("one record at most per layer/expert in a scope", candidateReads <= model.runLayers * model.cfg.numExperts)
        if tokens > 4096 { c.expect("larger scope reads fewer records", candidateReads < referenceReads) }
        c.measure("probe_process_footprint_end_bytes", Double(ProcessMemory.residentBytes()))
        return c.report()
    }

    public static func optimizationScopeLifecycle(modelDir: URL, integratedBase: Bool = false) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640,
            embeddingRowCache: integratedBase ? true : nil)
        let generator = Generator(model: model)
        generator.prefillChunk = 256
        generator.prefillCacheLimit = 128 << 20
        var options = integratedBase ? InferenceOptimizations.integrationCandidate : InferenceOptimizations()
        options.compactStateWindows = true; options.compactMTPRow = true
        options.boundedIndexer = true; options.boundedPLE = true
        options.layerExpertWorkspace = true; options.skipUnusedFinalForward = true
        options.workspaceTokenTile = model.optimizations.workspaceTokenTile
        options.compactScopeFrontier = model.optimizations.compactScopeFrontier
        model.optimizations = options
        var c = CheckBuilder("optimization-scope-lifecycle")
        c.measure("integrated_base", integratedBase ? 1 : 0)
        if integratedBase { c.expect("combined scope lifecycle uses bounded embedding rows", model.resident.usesEmbeddingRows) }
        let prompt = (0 ..< 1280).map { 1000 + (($0 * 7919) % 200_000) }
        var params = SampleParams.greedy; params.maxTokens = 1; params.seed = 7
        func equalState(_ a: Qwen4ExpModel.State, _ b: Qwen4ExpModel.State, _ name: String) {
            let at = a.diagnosticTensors(), bt = b.diagnosticTensors()
            c.equal("\(name): fields", Set(at.keys), Set(bt.keys))
            for key in at.keys.sorted() {
                if let v = bt[key] {
                    c.expect("\(name): \(key)", at[key]!.shape == v.shape && (at[key]! .== v).all().item(Bool.self))
                }
            }
        }
        func seed() -> PrefixCache {
            let cache = PrefixCache(maxTokens: 8192)
            let state = model.makeState()
            eval(model.lastLogits(Array(prompt.prefix(256)), state: state))
            cache.store(state: state, tokens: Array(prompt.prefix(256)))
            return cache
        }
        let referenceCache = seed(), candidateCache = seed()
        let seedState = referenceCache.take(matching: prompt, reserveTokens: 2048)!.state
        let untouched = seed()
        params.maxTokens = 1
        let (referenceIds, referenceStats) = generator.generate(promptIds: prompt, params: params,
            eosIds: [], cache: untouched)
        let referenceState = untouched.take(matching: prompt + referenceIds + [907], reserveTokens: 2048)!.state
        model.optimizations.readScopeTokens = 1024
        for cutLayer in [0, 1, 3, 47] {
            var layer = -1
            model.routerObserver = { current, _ in layer = current }
            let savedLimit = MLX.Memory.cacheLimit
            let (ids, stats) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: candidateCache,
                shouldContinue: { layer < cutLayer })
            model.routerObserver = nil
            c.expect("layer \(cutLayer): cancel emits no token", ids.isEmpty)
            c.equal("layer \(cutLayer): abort counted", stats.abortedReadScopes, 1)
            c.equal("layer \(cutLayer): no partial commit", stats.prefillTokens, 0)
            c.expect("layer \(cutLayer): no completed passes", stats.prefillPasses.isEmpty)
            c.equal("layer \(cutLayer): cache limit restored", MLX.Memory.cacheLimit, savedLimit)
            c.expect("layer \(cutLayer): admission restored", !model.pool.admitOnSweep)
            let hit = candidateCache.take(matching: prompt, reserveTokens: 2048)!
            c.equal("layer \(cutLayer): exact committed prefix", hit.reused, 256)
            equalState(seedState, hit.state, "layer \(cutLayer): restored state")
            candidateCache.store(state: hit.state, tokens: Array(prompt.prefix(256)))
        }
        let (candidateIds, stats) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: candidateCache)
        c.equal("retry exact output", candidateIds, referenceIds)
        c.equal("reference compute schedule", referenceStats.prefillComputePasses, [256, 256, 256, 256])
        c.equal("candidate preserves compute schedule", stats.prefillComputePasses, referenceStats.prefillComputePasses)
        c.equal("candidate commits one read scope", stats.prefillPasses, [1024])
        let candidateState = candidateCache.take(matching: prompt + candidateIds + [907], reserveTokens: 2048)!.state
        equalState(referenceState, candidateState, "retry exact continuation")
        c.expect("capacity remains charged after abort and growth", candidateState.allocatedSequenceBytes > 0)
        if integratedBase {
            c.expect("combined scope lifecycle executes fused rotation", model.fusedRoPERotationsScheduled > 0)
            c.equal("combined scope lifecycle returns an idle pool", model.pool.pinnedSlotCount, 0)
            // A cold read scope must not erase the independently qualified
            // common-prefix checkpoint merely by grouping past its boundary.
            let coldCache = PrefixCache(maxTokens: 8192)
            let cold = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: coldCache)
            c.equal("cold combined scope preserves exact output", cold.0, referenceIds)
            c.equal("cold combined scope stores the requested checkpoint", cold.1.prefixCheckpointStores, 1)
            c.equal("checkpoint splits only the read group", cold.1.prefillPasses, [256, 1024])
            c.equal("checkpoint preserves every compute pass", cold.1.prefillComputePasses, Array(repeating: 256, count: 5))
            if let complete = coldCache.take(matching: prompt + cold.0 + [907], reserveTokens: 2048) {
                equalState(referenceState, complete.state, "cold combined scope exact continuation")
            } else { c.expect("cold combined scope retains complete state", false) }
            let divergent = Array(prompt.prefix(256)) + [999]
            if let common = coldCache.take(matching: divergent, reserveTokens: 2048) {
                c.equal("divergent followup reuses the common checkpoint", common.reused, 256)
                equalState(seedState, common.state, "cold scope checkpoint matches chronological seed")
            } else { c.expect("cold scope retains the divergent followup checkpoint", false) }
            c.equal("cold scope and checkpoint forks release pool pins", model.pool.pinnedSlotCount, 0)
            for disabled in [PrefixCache(maxTokens: 8192, enabled: false), PrefixCache(maxTokens: 0)] {
                let result = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: disabled)
                c.equal("inactive cache preserves the original read groups", result.1.prefillPasses, [1024, 256])
                c.equal("inactive cache creates no checkpoint", result.1.prefixCheckpointStores, 0)
                c.equal("inactive cache retains exact scoped output", result.0, referenceIds)
            }
        }
        return c.report()
    }

    /// Synthetic already-encoded image rows isolate span/offset/state
    /// handling. The separate real-image serving gate covers tower execution.
    public static func optimizationScopeMTPVision(modelDir: URL, integratedBase: Bool = false) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640,
            embeddingRowCache: integratedBase ? true : nil)
        try model.enableMTP(modelDir: modelDir)
        let head = model.mtpHead!
        var options = integratedBase ? InferenceOptimizations.integrationCandidate : InferenceOptimizations()
        options.compactStateWindows = true; options.compactMTPRow = true
        options.boundedIndexer = true; options.boundedPLE = true; options.layerExpertWorkspace = true
        options.workspaceTokenTile = model.optimizations.workspaceTokenTile
        options.compactScopeFrontier = model.optimizations.compactScopeFrontier
        model.optimizations = options
        let ids = (0 ..< 1024).map { 1000 + (($0 * 7919) % 200_000) }
        let rows = MLXArray((0 ..< 640 * model.cfg.hiddenSize).map { Float($0 % 29 - 14) / 32 },
            [640, model.cfg.hiddenSize]).asType(.bfloat16)
        eval(rows)
        let run = VisionRun(start: 128, rows: rows)
        var c = CheckBuilder("optimization-scope-mtp-vision")
        c.measure("integrated_base", integratedBase ? 1 : 0)
        if integratedBase { c.expect("combined MTP/vision scope uses bounded embedding rows", model.resident.usesEmbeddingRows) }
        func equal(_ a: Qwen4ExpModel.State, _ b: Qwen4ExpModel.State, _ name: String) {
            let av = a.diagnosticTensors(), bv = b.diagnosticTensors()
            c.equal("\(name): fields", Set(av.keys), Set(bv.keys))
            for key in av.keys.sorted() {
                if let v = bv[key] { c.expect("\(name): \(key)", av[key]!.shape == v.shape && (av[key]! .== v).all().item(Bool.self)) }
            }
        }
        func consume(_ state: Qwen4ExpModel.State, _ range: Range<Int>) -> MLXArray {
            let chunk = Array(ids[range]), vision = [run.clipped(to: range.lowerBound, range.upperBound)].compactMap { $0 }
            let (mixed, multi) = model.hiddenStatesWithMulti(chunk, state: state, vision: vision)
            state.lastMulti = head.consume(chunk: chunk, chunkMulti: multi, prevMulti: state.lastMulti,
                resident: model.resident, rope: model.sharedRope, state: state.mtp!, vision: vision, compactRetainedRow: true)
            eval(mixed); return mixed
        }
        func seed() -> Qwen4ExpModel.State {
            let state = model.makeState(); state.mtp = MTPState()
            _ = consume(state, 0 ..< 256); return state
        }
        let seedState = seed(), reference = seed(), candidate = seed()
        for lo in stride(from: 256, to: 1024, by: 256) { _ = consume(reference, lo ..< lo + 256) }
        let remaining = Array(ids[256...]), vision = [run.clipped(to: 256, 1024)!]
        var layer = -1, checksAfterLast = 0
        model.routerObserver = { current, _ in layer = current }
        let cancelled = model.consumeReadScope(remaining, passes: [256, 256, 256], state: candidate,
            vision: vision, head: head, final: true, shouldContinue: {
                if layer == model.runLayers - 1 { checksAfterLast += 1; return checksAfterLast < 3 }
                return true
            })
        model.routerObserver = nil
        c.expect("cancel during second draft-head tile", !cancelled.committed && checksAfterLast == 3)
        c.expect("cancel returns no logits", cancelled.logits == nil)
        c.expect("cancel restores valid draft prefix", candidate.hasValidMTP)
        equal(seedState, candidate, "image/MTP rollback")
        let result = model.consumeReadScope(remaining, passes: [256, 256, 256], state: candidate,
            vision: vision, head: head, final: true, shouldContinue: nil)
        c.expect("retry commits scope", result.committed && result.logits != nil)
        c.expect("retry draft aligned", candidate.hasValidMTP)
        equal(reference, candidate, "image/MTP continuation")
        let r = model.lastLogits([907], state: reference), n = model.lastLogits([907], state: candidate)
        c.expect("next target logits exact", (r .== n).all().item(Bool.self))
        if integratedBase {
            c.expect("combined MTP/vision scope executes fused rotation", model.fusedRoPERotationsScheduled > 0)
        }
        return c.report()
    }

    public static func optimizationMTPWork(modelDir: URL) throws -> CheckReport {
        try optimizationMTPWork(modelDir: modelDir, integratedBase: false)
    }

    package static func optimizationMTPWork(modelDir: URL, integratedBase: Bool) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640,
            embeddingRowCache: integratedBase ? true : nil)
        try model.enableMTP(modelDir: modelDir)
        let generator = Generator(model: model)
        model.optimizations = integratedBase ? .integrationCandidate : InferenceOptimizations()
        model.optimizations.compactStateWindows = true
        model.optimizations.compactMTPRow = true
        model.optimizations.fusedGDNRecording = !integratedBase
        var c = CheckBuilder(integratedBase ? "optimization-mtp-work-integrated" : "optimization-mtp-work")
        let prompt = [151644, 8948, 198, 40, 1079, 25, 1237, 460, 11, 279, 1917]
        for depth in [1, 3] {
            generator.draftDepth = depth
            for sampled in [false, true] { for limit in [1, 2, 5] {
                var params = SampleParams.greedy; params.maxTokens = limit; params.seed = 7
                if sampled {
                    params.temperature = 0.7; params.topK = 40
                    params.topP = 0.8; params.minP = 0.05; params.presencePenalty = 1.1
                }
                model.optimizations.reuseFirstMTPEntry = false
                model.optimizations.boundedDraftTail = false
                let (reference, referenceStats) = generator.generate(promptIds: prompt, params: params, eosIds: [])
                for mode in ["first", "tail", "both"] {
                    model.optimizations.reuseFirstMTPEntry = mode != "tail"
                    model.optimizations.boundedDraftTail = mode != "first"
                    let cache = PrefixCache(maxTokens: 4096)
                    let (ids, stats) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cache)
                    let name = "depth \(depth), sampled \(sampled), limit \(limit), \(mode)"
                    c.equal("\(name): emitted count", ids.count, limit)
                    c.equal("\(name): stable fixture output", ids, reference)
                    if sampled && mode != "first" {
                        c.equal("\(name): sampled fallback preserves draft work", stats.draftedTokens, referenceStats.draftedTokens)
                        c.equal("\(name): sampled fallback preserves target shape", stats.decodeModelTokens, referenceStats.decodeModelTokens)
                        c.equal("\(name): sampled fallback preserves verification count", stats.verifyPasses, referenceStats.verifyPasses)
                    }
                    let retained = cache.take(matching: prompt + ids + [907], reserveTokens: 1024)
                    c.expect("\(name): retained committed prefix", retained != nil)
                    guard let hit = retained else { continue }
                    c.expect("\(name): aligned draft", hit.state.hasValidMTP)
                    c.expect("\(name): consumed prefix within emitted tokens",
                        hit.state.tokenCount >= prompt.count && hit.state.tokenCount <= prompt.count + ids.count)
                    c.equal("\(name): reconciliation covers committed positions",
                        stats.reconciledHeadTokens + stats.reusedHeadTokens, hit.state.tokenCount - prompt.count)
                    if limit == 1 { c.equal("\(name): no terminal verification", stats.verifyPasses, 0) }
                    if limit == 2 && mode != "first" && !sampled {
                        c.equal("\(name): terminal output needs zero drafts", stats.draftedTokens, 0)
                        c.equal("\(name): one target position suffices", stats.decodeModelTokens, 1)
                        c.equal("\(name): final emission stays pending", hit.state.tokenCount, prompt.count + 1)
                    }
                    if limit > 1 && mode == "first" {
                        c.equal("\(name): first entry reused each round", stats.reusedHeadTokens, stats.verifyPasses)
                    }
                }
            } }
        }
        return c.report()
    }

    public static func optimizationGDNKernel() -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        var c = CheckBuilder("optimization-gdn-recording-kernel")
        func values(_ shape: [Int], scale: Float) -> MLXArray {
            let count = shape.reduce(1, *)
            return MLXArray((0 ..< count).map { Float(($0 * 7919) % 127 - 63) * scale }, shape)
        }
        for T in [1, 2, 3, 5, 17, 18] {
            for dims in [(2, 4, 32, 8), (2, 4, 128, 128), (1, 2, 33, 8)] {
                let (Hk, Hv, Dk, Dv) = dims
                let B = 2
                let q = values([B, T, Hk, Dk], scale: 0.001).asType(.bfloat16)
                let k = values([B, T, Hk, Dk], scale: 0.001).asType(.bfloat16)
                let v = values([B, T, Hv, Dv], scale: 0.01).asType(.bfloat16)
                let a = values([B, T, Hv], scale: 0.1).asType(.bfloat16)
                let b = -a
                // exp(aLog) overflows for the first head, giving exact zero
                // decay; all other heads retain finite nontrivial memory.
                let aLog = MLXArray((0 ..< Hv).map { $0 == 0 ? Float(100) : Float(-2) })
                let bias = MLXArray.zeros([Hv], dtype: .bfloat16)
                let initial = values([B, Hv, Dv, Dk], scale: 0.01)
                for pattern in 0 ..< 3 {
                    let mask: MLXArray? = pattern == 0 ? nil : MLXArray((0 ..< B * T).map { pattern == 1 && $0 % 2 == 0 }, [B, T])
                    let result = gatedDeltaUpdateRecording(q: q, k: k, v: v, a: a, b: b,
                        aLog: aLog, dtBias: bias, state: initial, mask: mask)
                    eval([result.output] + result.states)
                    var reference = initial
                    var outputs: [MLXArray] = []
                    for t in 0 ..< T {
                        let (y, state) = gatedDeltaUpdate(
                            q: q[0..., t ..< (t + 1)], k: k[0..., t ..< (t + 1)], v: v[0..., t ..< (t + 1)],
                            a: a[0..., t ..< (t + 1)], b: b[0..., t ..< (t + 1)], aLog: aLog, dtBias: bias,
                            state: reference, mask: mask?[0..., t ..< (t + 1)])
                        reference = state; outputs.append(y)
                        c.expect("T\(T) Dk\(Dk) mask\(pattern) state\(t)", (state .== result.states[t]).all().item(Bool.self))
                    }
                    c.expect("T\(T) Dk\(Dk) mask\(pattern) outputs", (concatenated(outputs, axis: 1) .== result.output).all().item(Bool.self))
                    c.equal("T\(T) Dk\(Dk) mask\(pattern) owns every state", result.states.count, T)
                }
            }
        }
        return c.report()
    }

    public static func optimizationLifecycle(modelDir: URL) throws -> CheckReport {
        MLX.Memory.cacheLimit = 512 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        let generator = Generator(model: model)
        model.optimizations.compactStateWindows = true
        model.optimizations.compactMTPRow = true
        model.optimizations.skipUnusedFinalForward = true
        generator.prefillChunk = 256
        generator.prefillCacheLimit = 128 << 20
        var c = CheckBuilder("optimization-lifecycle")
        func equalState(_ a: Qwen4ExpModel.State, _ b: Qwen4ExpModel.State, _ name: String) {
            let at = a.diagnosticTensors(), bt = b.diagnosticTensors()
            c.equal("\(name): fields", Set(at.keys), Set(bt.keys))
            for key in at.keys.sorted() {
                if let v = bt[key] {
                    c.expect("\(name): \(key)", at[key]!.shape == v.shape && (at[key]! .== v).all().item(Bool.self))
                }
            }
        }
        let prompt = (0 ..< 270).map { 1000 + $0 * 7 }
        var params = SampleParams.greedy; params.maxTokens = 2; params.seed = 7
        let rc = PrefixCache(maxTokens: 4096), cc = PrefixCache(maxTokens: 4096)
        let (rids, _) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: rc)
        var completed = 0
        var observedBase = -1
        generator.onPrefillProgressAbsolute = { done, _, _, base in completed = done; observedBase = base }
        let beforeLimit = MLX.Memory.cacheLimit
        let (cancelled, stats) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cc,
                                                    shouldContinue: { completed < 256 })
        c.expect("cancel emits no token", cancelled.isEmpty)
        c.equal("cancel stores whole pass only", stats.prefillTokens, 256)
        c.equal("cancel restores allocator limit", MLX.Memory.cacheLimit, beforeLimit)
        c.expect("cancel clears admission", !model.pool.admitOnSweep)
        c.equal("cancel prefix retained", cc.heldTokens, 256)
        c.equal("initial absolute base", observedBase, 0)
        let (cids, resumed) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cc)
        c.equal("resume exact IDs", cids, rids)
        c.equal("resume uses committed pass", resumed.reusedPrefixTokens, 256)
        c.equal("resume absolute base", observedBase, 256)
        let next = prompt + cids + [907]
        let rs = rc.take(matching: next, reserveTokens: 512)!.state
        let cs = cc.take(matching: next, reserveTokens: 512)!.state
        equalState(rs, cs, "cancel/retry matches uninterrupted")
        c.expect("actual sequence buffers charge their capacity", cs.allocatedSequenceBytes > cs.tokenCount * PrefixCache.bytesPerToken)
        c.expect("capacity reservation covers buffers", model.sequenceCapacityBytes(tokens: cs.tokenCount, mtp: false) >= cs.allocatedSequenceBytes)
        let logicalOnly = PrefixCache(maxTokens: cs.tokenCount)
        logicalOnly.store(state: cs, tokens: Array(next.prefix(cs.tokenCount)))
        c.equal("token-only allowance cannot hide unused buffer capacity", logicalOnly.heldTokens, 0)
        generator.onPrefillProgressAbsolute = nil
        try model.enableMTP(modelDir: modelDir)
        for firstLimit in [1, 3] {
            let cache = PrefixCache(maxTokens: 4096)
            var ids = [1000, 1079, 25, 1237, 460, 11, 279, 1917]
            generator.speculationEnabled = true
            params.maxTokens = firstLimit
            let (first, _) = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
            ids += first + [908]
            let hit = cache.take(matching: ids, reserveTokens: 100)!
            c.expect("on \(firstLimit): aligned draft", hit.state.hasValidMTP)
            cache.store(state: hit.state, tokens: Array(ids.prefix(hit.state.tokenCount)))
            generator.speculationEnabled = false
            params.maxTokens = 3
            let (plain, ps) = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
            c.expect("off \(firstLimit): reused main prefix", ps.reusedPrefixTokens > 0)
            c.equal("off \(firstLimit): no verification", ps.verifyPasses, 0)
            ids += plain + [909]
            let off = cache.take(matching: ids, reserveTokens: 100)!
            c.expect("off \(firstLimit): draft invalidated", off.state.mtp == nil && off.state.lastMulti == nil)
            cache.store(state: off.state, tokens: Array(ids.prefix(off.state.tokenCount)))
            generator.speculationEnabled = true
            let (_, resumed) = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
            c.expect("on again \(firstLimit): reuses main state", resumed.reusedPrefixTokens > 0)
            c.equal("on again \(firstLimit): stale draft never used", resumed.verifyPasses, 0)
            let (_, fresh) = generator.generate(promptIds: [2000, 21, 907, 34], params: params, eosIds: [])
            c.expect("fresh \(firstLimit): speculation available", fresh.verifyPasses > 0)
        }
        return c.report()
    }

    public static func optimizationMTP(modelDir: URL, router: Bool = false) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: router, cachedWeights: false)
    }

    public static func optimizationMTPRouterWeights(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: true)
    }

    public static func optimizationMTPCacheBookkeeping(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: false, bookkeeping: true)
    }

    public static func optimizationMTPCompiledNorm(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: false, compiledNorm: true)
    }

    public static func optimizationMTPReadHandles(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: false, readHandles: true)
    }

    public static func optimizationMTPTerminalPrefill(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: false, terminalPrefill: true)
    }

    public static func optimizationMTPTerminalQuery(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: false,
            terminalPrefill: true, terminalQuery: true)
    }

    public static func optimizationMTPFloorCache(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: false, floorCache: true)
    }

    private static func optimizationMTPImplementation(modelDir: URL, router: Bool, cachedWeights: Bool, bookkeeping: Bool = false, compiledNorm: Bool = false, readHandles: Bool = false, terminalPrefill: Bool = false, floorCache: Bool = false, terminalQuery: Bool = false) throws -> CheckReport {
        MLX.Memory.cacheLimit = 512 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        try model.enableMTP(modelDir: modelDir)
        let generator = Generator(model: model)
        var c = CheckBuilder(floorCache ? "optimization-mtp-floor-cache" : terminalPrefill ? "optimization-mtp-terminal-prefill" : readHandles ? "optimization-mtp-read-handles" : compiledNorm ? "optimization-mtp-compiled-norm" : bookkeeping ? "optimization-mtp-cache-bookkeeping" : cachedWeights ? "optimization-mtp-router-weights" : (router ? "optimization-mtp-router" : "optimization-mtp-row"))
        var candidateRouting = false
        var referenceRoutes: [[Int32]] = [], candidateRoutes: [[Int32]] = []
        if router || cachedWeights || bookkeeping || compiledNorm || readHandles || terminalPrefill || floorCache {
            model.mtpHead!.routerObserver = { ids in
                if candidateRouting { candidateRoutes.append(ids) }
                else { referenceRoutes.append(ids) }
            }
        }
        let prompt = [151644, 8948, 198, 40, 1079, 25, 1237, 460, 11, 279, 1917]
        for limit in [1, 2, 5] {
            var params = SampleParams.greedy; params.maxTokens = limit
            params.seed = 7
            let rc = PrefixCache(maxTokens: 4096), cc = PrefixCache(maxTokens: 4096)
            candidateRouting = false
            model.optimizations = InferenceOptimizations()
            let (ri, _) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: rc)
            candidateRouting = true
            model.optimizations.compactMTPRow = !router && !cachedWeights && !bookkeeping && !compiledNorm && !readHandles && !terminalPrefill && !floorCache
            model.optimizations.routerTopK = router
            model.optimizations.cachedRouterWeights = cachedWeights
            model.optimizations.compiledNormFinish = compiledNorm
            model.optimizations.directReadHandles = readHandles
            model.optimizations.terminalPrefillPruning = terminalPrefill
            model.optimizations.terminalLastQuery = terminalQuery
            model.optimizations.ngramRingOrder = bookkeeping
            model.optimizations.denseExpertLookup = bookkeeping
            model.optimizations.sparsePoolPins = bookkeeping
            model.optimizations.layerLocalFloorCache = floorCache
            let (ci, _) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cc)
            if readHandles { c.equal("MTP handles cover expert and n-gram tensors", model.readHandleCount, 816) }
            if cachedWeights {
                c.equal("MTP limit \(limit): all main/head copies charged", model.cachedRouterBytes,
                    (model.runLayers + 1) * model.cfg.numExperts * model.cfg.hiddenSize * 4)
            }
            c.equal("MTP limit \(limit): exact emitted tokens", ci, ri)
            let r = rc.take(matching: prompt + ri + [907], reserveTokens: 100)!.state
            let g = cc.take(matching: prompt + ci + [907], reserveTokens: 100)!.state
            let rt = r.diagnosticTensors(), gt = g.diagnosticTensors()
            c.equal("MTP limit \(limit): fields", Set(rt.keys), Set(gt.keys))
            for k in rt.keys.sorted() {
                if let v = gt[k] { c.expect("MTP limit \(limit): \(k)", rt[k]!.shape == v.shape && (rt[k]! .== v).all().item(Bool.self)) }
            }
            c.equal("MTP limit \(limit): aligned reference", r.mtp!.offset, r.tokenCount - 1)
            c.equal("MTP limit \(limit): aligned candidate", g.mtp!.offset, g.tokenCount - 1)
            let e = model.resident.embed(MLXArray([Int32(907)], [1, 1])).asType(.bfloat16)
            candidateRouting = false
            model.mtpHead!.usesSpecializedRouter = false
            model.mtpHead!.usesCompiledNorm = false
            let (rs, rm) = model.mtpHead!(embedded: e, hiddenMulti: r.lastMulti!, rope: model.sharedRope, state: r.mtp!)
            candidateRouting = true
            model.mtpHead!.usesSpecializedRouter = router
            model.mtpHead!.usesCompiledNorm = compiledNorm
            let (gs, gm) = model.mtpHead!(embedded: e, hiddenMulti: g.lastMulti!, rope: model.sharedRope, state: g.mtp!)
            c.expect("MTP limit \(limit): future draft sample", (rs .== gs).all().item(Bool.self))
            c.expect("MTP limit \(limit): future draft multi", (rm .== gm).all().item(Bool.self))
        }
        if terminalPrefill {
            let queryStart = model.terminalQueryRowsSkipped, moeStart = model.terminalMoERowsSkipped
            model.optimizations.terminalPrefillPruning = false
            let reference = model.lastLogits(prompt, state: model.makeState())
            model.optimizations.terminalPrefillPruning = true
            let candidate = model.lastLogits(prompt, state: model.makeState())
            c.expect("loaded MTP disables even direct last-row pruning", (reference .== candidate).all().item(Bool.self))
            c.equal("loaded MTP preserves all query rows", model.terminalQueryRowsSkipped, queryStart)
            c.equal("loaded MTP preserves all MoE rows", model.terminalMoERowsSkipped, moeStart)
        }
        if compiledNorm { c.expect("draft norm fusion actually ran", model.mtpHead!.compiledNormFinishes > 0) }
        if router || cachedWeights || bookkeeping || compiledNorm || readHandles || terminalPrefill || floorCache { c.equal("ordered draft router traces", candidateRoutes, referenceRoutes) }
        return c.report()
    }

    public static func optimizationGeneration(modelDir: URL) throws -> CheckReport {
        MLX.Memory.cacheLimit = 512 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        let generator = Generator(model: model)
        generator.speculationEnabled = false
        var c = CheckBuilder("optimization-generation")
        let prompt = [1000, 1013, 2087, 1102]
        func compare(_ a: Qwen4ExpModel.State, _ b: Qwen4ExpModel.State, _ label: String) {
            let at = a.diagnosticTensors(), bt = b.diagnosticTensors()
            c.equal("\(label): fields", Set(at.keys), Set(bt.keys))
            for k in at.keys.sorted() {
                if let v = bt[k] {
                    c.expect("\(label): \(k)", at[k]!.shape == v.shape && (at[k]! .== v).all().item(Bool.self))
                }
            }
        }
        for limit in [1, 2, 4] {
            var params = SampleParams.greedy; params.maxTokens = limit
            let rc = PrefixCache(maxTokens: 4096), cc = PrefixCache(maxTokens: 4096)
            model.optimizations.skipUnusedFinalForward = false
            let (ri, rs) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: rc)
            model.optimizations.skipUnusedFinalForward = true
            let (ci, cs) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cc)
            c.equal("limit \(limit): emitted IDs", ci, ri)
            c.equal("limit \(limit): finish", cs.finishReason, rs.finishReason)
            c.equal("limit \(limit): output count", ci.count, limit)
            let next = prompt + ci + [901]
            let r = rc.take(matching: next, reserveTokens: next.count)!
            let g = cc.take(matching: next, reserveTokens: next.count)!
            c.equal("limit \(limit): reference consumed", r.state.tokenCount, prompt.count + limit)
            c.equal("limit \(limit): final token pending", g.state.tokenCount, prompt.count + limit - 1)
            let last = model.lastLogits([ci.last!], state: g.state); eval(last)
            compare(r.state, g.state, "limit \(limit): pending consumed once")
            let rl = model.lastLogits([901], state: r.state); eval(rl)
            let gl = model.lastLogits([901], state: g.state); eval(gl)
            c.expect("limit \(limit): next logits", (rl .== gl).all().item(Bool.self))
            compare(r.state, g.state, "limit \(limit): continuation")
        }
        for optimized in [false, true] {
            model.optimizations.skipUnusedFinalForward = optimized
            var params = SampleParams.greedy; params.maxTokens = 4
            let cache = PrefixCache(maxTokens: 4096)
            let (ids, stats) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cache,
                                                  onToken: { _ in false })
            c.equal("callback stop \(optimized): one emission", ids.count, 1)
            c.equal("callback stop \(optimized): reason", stats.finishReason, "stop")
            let state = cache.take(matching: prompt + ids, reserveTokens: 10)!.state
            c.equal("callback stop \(optimized): token remains pending", state.tokenCount, prompt.count)
            let (cancelled, _) = generator.generate(promptIds: prompt, params: params, eosIds: [], shouldContinue: { false })
            c.expect("cancel before prefill \(optimized)", cancelled.isEmpty)
            let (empty, _) = generator.generate(promptIds: [], params: params, eosIds: [])
            c.expect("empty prompt \(optimized)", empty.isEmpty)
            let logits = model.lastLogits(prompt, state: model.makeState()); eval(logits)
            let eos = argMax(logits.reshaped([-1])).item(Int.self)
            let (stopped, es) = generator.generate(promptIds: prompt, params: params, eosIds: [eos])
            c.expect("EOS \(optimized)", stopped.isEmpty && es.finishReason == "stop")
        }
        return c.report()
    }

    /// Same model arithmetic, all logical state, and continuation, tested with
    /// both cache ownership modes. Uses one model and a bounded 640-slot pool.
    public static func optimizationState(modelDir: URL, tokens: Int, variant: String = "compact-state") throws -> CheckReport {
        guard tokens >= 1, tokens <= 2112 else { throw ModelError("state check tokens must be 1...2112") }
        var candidateOptions = InferenceOptimizations()
        switch variant {
        case "packed-layout": break
        case "ngram-lookahead": candidateOptions.ngramLookahead = true
        case "slot-slices": candidateOptions.contiguousSlotWrites = true
        case "slot-words": candidateOptions.wordSlotWrites = true
        case "slot-cpu": candidateOptions.cpuSlotWrites = true
        case "floor-cache": candidateOptions.layerLocalFloorCache = true
        case "read-handles": candidateOptions.directReadHandles = true
        case "compiled-norm": candidateOptions.compiledNormFinish = true
        case "compact-state": candidateOptions.compactStateWindows = true
        case "ngram": candidateOptions.compactNgramRows = true
        case "cache-bookkeeping":
            candidateOptions.ngramRingOrder = true
            candidateOptions.denseExpertLookup = true
            candidateOptions.sparsePoolPins = true
        case "indexer": candidateOptions.incrementalIndexer = true
        case "indexer-raw":
            candidateOptions.incrementalIndexer = true
            candidateOptions.compactIndexerRaw = true
        case "indexer-tiles": candidateOptions.boundedIndexer = true
        case "indexer-dense": candidateOptions.denseIndexerBypass = true
        case "indexer-dense-tiles":
            candidateOptions.denseIndexerBypass = true
            candidateOptions.boundedIndexer = true
        case "indexer-topk":
            candidateOptions.indexerBlockTopK = true
            candidateOptions.boundedIndexer = true
        case "rope": candidateOptions.sharedRoPE = true
        case "rope-fused": candidateOptions.fusedRoPE = true
        case "rope-both":
            candidateOptions.sharedRoPE = true
            candidateOptions.fusedRoPE = true
        case "router": candidateOptions.routerTopK = true
        case "router-weights": candidateOptions.cachedRouterWeights = true
        case "shared-overlap": candidateOptions.overlapSharedExpert = true
        case "resident-overlap": candidateOptions.overlapResidentExperts = true
        case "gdn-record": candidateOptions.fusedGDNRecording = true
        case "gdn-projection": candidateOptions.fusedGDNProjection = true
        case "ple": candidateOptions.boundedPLE = true
        case "workspace":
            candidateOptions.layerExpertWorkspace = true
            candidateOptions.workspaceTokenTile = try InferenceOptimizations.environment().workspaceTokenTile
        case "sweep-placement": candidateOptions.disjointSweepOutput = true
        case "sweep-tiles": candidateOptions.boundedSweepRows = true
        case "sweep-both":
            candidateOptions.disjointSweepOutput = true
            candidateOptions.boundedSweepRows = true
        default: throw ModelError("unknown state-check variant: \(variant)")
        }
        MLX.Memory.cacheLimit = 512 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640,
            embeddingRowCache: nil, packGDNProjections: variant == "gdn-projection")
        var c = CheckBuilder("optimization-state-\(variant)")
        if variant == "packed-layout", !model.pool.hasPackedLayout {
            throw ModelError("packed-layout state check requires SLOTSTREAM_EXPERT_LAYOUT")
        }
        let ids = (0 ..< tokens).map { 1000 + (($0 * 7919) % 200_000) }
        var candidateRouting = false
        var referenceRoutes: [Int: [Int32]] = [:], candidateRoutes: [Int: [Int32]] = [:]
        var latestReferenceRoutes: [Int: [Int32]] = [:]
        if variant == "resident-overlap" || variant == "router" || variant == "router-weights" || variant == "cache-bookkeeping" || variant == "compiled-norm" || variant == "read-handles" || variant == "floor-cache" || variant == "indexer-raw" || variant == "packed-layout" || variant == "ngram-lookahead" || variant == "slot-slices" || variant == "slot-words" || variant == "slot-cpu" || variant == "gdn-projection" {
            model.routerObserver = { layer, ids in
                if candidateRouting { candidateRoutes[layer, default: []].append(contentsOf: ids) }
                else {
                    referenceRoutes[layer, default: []].append(contentsOf: ids)
                    latestReferenceRoutes[layer] = ids
                }
            }
        }
        func controls(_ candidate: Bool) {
            candidateRouting = candidate
            // A reference immediately followed by the same one-token candidate
            // otherwise warms all requested experts and never exercises overlap.
            // Deliberately retain half of each observed route at the same pool
            // capacity. Only correctness runs do this; serving remains natural.
            if variant == "resident-overlap", candidate,
               latestReferenceRoutes.count == model.runLayers,
               latestReferenceRoutes.values.allSatisfy({ $0.count == model.cfg.topK }) {
                model.pool.unpinAll(); model.pool.resize(to: 1)
                let absent = (0..<model.cfg.numExperts).first {
                    !latestReferenceRoutes[0]!.contains(Int32($0))
                }!
                _ = model.pool.ensure([ExpertKey(0, absent)])
                model.pool.unpinAll(); model.pool.resize(to: 640)
                let warm = latestReferenceRoutes.keys.sorted().flatMap { layer in
                    latestReferenceRoutes[layer]!.prefix(model.cfg.topK / 2).map { ExpertKey(layer, Int($0)) }
                }
                _ = model.pool.ensure(warm); model.pool.unpinAll()
            }
            if !candidate { latestReferenceRoutes.removeAll(keepingCapacity: true) }
            if variant == "packed-layout" { model.pool.usePackedLayout = candidate }
            if variant == "ngram-lookahead" {
                model.ngram.compactRows = true; model.ngram.compactRows = false
            }
            model.optimizations = candidate ? candidateOptions : InferenceOptimizations()
        }
        func run(_ compact: Bool) -> (Qwen4ExpModel.State, MLXArray) {
            controls(compact)
            let state = model.makeState()
            let logits = model.lastLogits(ids, state: state)
            eval(logits)
            return (state, logits)
        }
        let (reference, refLogits) = run(false)
        let (candidate, gotLogits) = run(true)
        func equal(_ name: String, _ a: MLXArray, _ b: MLXArray) {
            c.expect(name, a.shape == b.shape && a.dtype == b.dtype && (a .== b).all().item(Bool.self))
        }
        func compare(_ label: String) {
            let a = reference.diagnosticTensors(), b = candidate.diagnosticTensors()
            let bases = candidate.diagnosticIndexerBases()
            c.equal("\(label): state fields", Set(a.keys), Set(b.keys))
            for k in a.keys.sorted() {
                if let v = b[k] {
                    let original = a[k]!
                    let base = bases[k] ?? 0
                    let expected = base > 0 ? original[0..., base ..< original.dim(1), 0...] : original
                    equal("\(label): \(k)", expected, v)
                }
            }
        }
        equal("prefill logits", refLogits, gotLogits)
        compare("prefill")
        if variant == "indexer-raw", tokens > model.cfg.indexerBudget {
            c.expect("completed main indexers release raw prefixes", candidate.diagnosticIndexerBases().values.allSatisfy { $0 > 0 })
            c.measure("reference_sequence_bytes", Double(reference.allocatedSequenceBytes))
            c.measure("candidate_sequence_bytes", Double(candidate.allocatedSequenceBytes))
        }
        // Rollback from every possible kept length of a verify pass, followed
        // by a different continuation. Captures GDN/PLE, KV/indexer and history.
        for keep in 1 ... 3 {
            let rc = reference.checkpoint(), cc = candidate.checkpoint()
            let verify = [1137, 732, 2091]
            controls(false)
            reference.setRecording(true)
            let r = model.allLogitsWithMulti(verify, state: reference); eval(r.logits, r.multi)
            reference.rollback(keeping: keep, of: verify, from: rc, ngramWindow: model.cfg.ngramSize - 1)
            controls(true)
            candidate.setRecording(true)
            let g = model.allLogitsWithMulti(verify, state: candidate); eval(g.logits, g.multi)
            candidate.rollback(keeping: keep, of: verify, from: cc, ngramWindow: model.cfg.ngramSize - 1)
            equal("verify \(keep) logits", r.logits, g.logits)
            compare("rollback \(keep)")
            controls(false)
            let rn = model.lastLogits([907], state: reference); eval(rn)
            controls(true)
            let gn = model.lastLogits([907], state: candidate); eval(gn)
            equal("continued logits after keep \(keep)", rn, gn)
            compare("continuation \(keep)")
            reference.restore(rc); candidate.restore(cc)
            compare("restored \(keep)")
        }
        if variant == "indexer-raw" {
            let rc = reference.checkpoint(), cc = candidate.checkpoint()
            let extensionIds = Array(repeating: 907, count: 513)
            controls(false)
            let r = model.lastLogits(extensionIds, state: reference); eval(r)
            controls(true)
            let g = model.lastLogits(extensionIds, state: candidate); eval(g)
            equal("long transaction logits", r, g)
            compare("long transaction")
            if tokens > model.cfg.indexerBudget {
                c.expect("long append releases rows beyond checkpoint offset", candidate.diagnosticIndexerBases().values.allSatisfy { $0 > tokens })
            }
            reference.restore(rc); candidate.restore(cc)
            compare("long transaction restored")
            controls(false); let rNext = model.lastLogits([1137, 908], state: reference); eval(rNext)
            controls(true); let gNext = model.lastLogits([1137, 908], state: candidate); eval(gNext)
            equal("continuation after restoring released history", rNext, gNext)
            compare("restored long continuation")
        }
        if variant == "router" || variant == "router-weights" || variant == "cache-bookkeeping" || variant == "compiled-norm" || variant == "read-handles" || variant == "floor-cache" || variant == "indexer-raw" || variant == "packed-layout" || variant == "ngram-lookahead" || variant == "slot-slices" || variant == "slot-words" || variant == "slot-cpu" || variant == "gdn-projection" {
            c.equal("ordered router traces across prefill, verify and continuation", candidateRoutes, referenceRoutes)
        }
        if variant == "packed-layout" {
            c.expect("candidate performed verified-layout reads",model.pool.packedRecordsRead > 0)
            c.expect("layout stayed valid through all transactions",model.pool.hasPackedLayout)
            c.measure("packed_records_read",Double(model.pool.packedRecordsRead))
        }
        if variant == "ngram-lookahead" {
            c.expect("candidate consumed asynchronous rows",model.ngram.lookaheadRowsConsumed > 0)
            c.expect("all lookahead workers joined",!model.ngram.hasPendingPrefetch)
            c.measure("lookahead_rows_consumed",Double(model.ngram.lookaheadRowsConsumed))
        }
        if variant == "slot-slices" {
            c.expect("candidate used contiguous slot writes", model.pool.slotSliceBatches > 0)
            c.measure("slot_slice_batches", Double(model.pool.slotSliceBatches))
            c.measure("slot_slice_runs", Double(model.pool.slotSliceRuns))
            c.measure("slot_scatter_batches", Double(model.pool.slotScatterBatches))
        }
        if variant == "slot-cpu" {
            c.expect("candidate used CPU slot writes", model.pool.slotCPUBatches > 0)
            c.measure("slot_cpu_batches", Double(model.pool.slotCPUBatches))
        }
        if variant == "slot-words" {
            c.expect("candidate used word slot writes", model.pool.slotWordBatches > 0)
            c.equal("six packed BF16 pieces per used batch", model.pool.slotWordBuffers, model.pool.slotWordBatches * 6)
            c.measure("slot_word_batches", Double(model.pool.slotWordBatches))
            c.measure("slot_word_buffers", Double(model.pool.slotWordBuffers))
        }
        if variant == "router-weights" {
            c.equal("promoted routers charged in full", model.cachedRouterBytes,
                model.runLayers * model.cfg.numExperts * model.cfg.hiddenSize * 4)
            c.measure("additional_cached_router_bytes", Double(model.cachedRouterBytes))
            controls(false)
            let released = model.lastLogits([908], state: reference); eval(released)
            c.equal("disabling router cache releases promoted tensors", model.cachedRouterBytes, 0)
        }
        if variant == "cache-bookkeeping" {
            c.equal("direct map actually allocated", model.pool.denseLookupBytes, model.cfg.numLayers * model.cfg.numExperts * 4)
            controls(false)
            eval(model.lastLogits([908], state: reference))
            c.equal("direct map released after disabling", model.pool.denseLookupBytes, 0)
        }
        if variant == "compiled-norm" {
            c.expect("compiled pointwise normalization actually executed", model.compiledNormFinishes > 0)
            c.measure("compiled_norm_calls", Double(model.compiledNormFinishes))
        }
        if variant == "read-handles" {
            c.equal("all stream tensors have owned descriptors", model.readHandleCount,
                model.cfg.numLayers * 9 + model.cfg.splitNgramParts * 3)
            controls(false); eval(model.lastLogits([908], state: reference))
            c.equal("disabling releases direct read handles", model.readHandleCount, 0)
        }
        if variant == "resident-overlap" {
            c.expect("resident expert operations actually prelaunched", model.residentExpertPrelaunches > 0)
            c.measure("resident_expert_prelaunches", Double(model.residentExpertPrelaunches))
            c.measure("resident_expert_join_seconds", model.residentExpertJoinSeconds)
        }
        if variant == "shared-overlap" {
            c.expect("resident shared projections actually prelaunched", model.sharedExpertPrelaunches > 0)
            c.measure("shared_projection_prelaunches", Double(model.sharedExpertPrelaunches))
        }
        if variant == "gdn-projection" {
            c.equal("every recurrent layer has a shared projection backing", model.resident.packedGDNProjectionLayers,
                model.cfg.layerTypes.filter { $0 == "linear_attention" }.count)
            c.expect("single-token fusion actually scheduled", model.fusedGDNProjectionsScheduled > 0)
            let before = model.fusedGDNProjectionsScheduled
            controls(false); eval(model.lastLogits([908], state: reference))
            c.equal("disabled fusion preserves separate projection dispatch", model.fusedGDNProjectionsScheduled, before)
            c.measure("shared_projection_payload_bytes", Double(model.resident.packedGDNProjectionPayloadBytes))
        }
        if variant == "rope-fused" || variant == "rope-both" {
            c.expect("fused rotations scheduled on evaluated paths", model.fusedRoPERotationsScheduled > 0)
            c.measure("fused_rotations_scheduled", Double(model.fusedRoPERotationsScheduled))
            let before = model.fusedRoPERotationsScheduled
            controls(false); eval(model.lastLogits([908], state: reference))
            c.equal("disabling fusion returns to original dispatch", model.fusedRoPERotationsScheduled, before)
        }
        if variant == "rope" || variant == "rope-both" {
            c.expect("angle tables actually reused", model.ropeTableHits > 0)
            c.measure("rope_table_hits", Double(model.ropeTableHits))
            c.measure("rope_table_builds", Double(model.ropeTableBuilds))
        }
        if variant == "indexer-topk" {
            c.expect("specialized block rows actually scheduled", model.indexerSpecializedRows > 0)
            c.measure("specialized_block_rows", Double(model.indexerSpecializedRows))
        }
        c.measure("prompt_tokens", Double(tokens))
        if variant == "ngram" || variant == "cache-bookkeeping" {
            // Force FIFO eviction, a prefetch larger than capacity, row hits,
            // mode changes, and EOS history boundaries without huge fixtures.
            let index = try CheckpointIndex(dir: modelDir)
            for capacity in [1, 7, 31] {
                let a = NgramStore(index: index, resident: model.resident, cacheCapacity: capacity)
                let b = NgramStore(index: index, resident: model.resident, cacheCapacity: capacity)
                b.compactRows = true
                b.ringEvictionOrder = variant == "cache-bookkeeping"
                for history in [[Int64(model.cfg.eosTokenId), 37, 52, 81], [37, Int64(model.cfg.eosTokenId), 81, 52], [37, 52, 81, 37]] {
                    let av = a.embedding(history: history, nNew: 2)
                    let bv = b.embedding(history: history, nNew: 2)
                    equal("ngram capacity \(capacity), history \(history)", av, bv)
                    c.equal("ngram cache size \(capacity)", a.cachedRowCount, b.cachedRowCount)
                    c.equal("ngram payload halves \(capacity)", a.cachedPayloadBytes, 2 * b.cachedPayloadBytes)
                }
                c.equal("ngram repeated row \(capacity)", a.debugRow(12345), b.debugRow(12345))
                c.equal("ngram row reuse \(capacity)", a.debugRow(12345), b.debugRow(12345))
            }
        }
        c.measure("physical_footprint_bytes", Double(ProcessMemory.residentBytes()))
        return c.report()
    }
}

````````````

## Artifact SHA-256 71b49d3edc91c35572e0e40937860f8112c5ac56b9816ce870e189d4223d641c

Encoding: `utf-8`. Original bytes: 11349.

````````````text
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Three chronological schedules, one model and one bounded pool. The
    /// 512-token control measures existing rechunking drift relative to 256;
    /// the bounded candidate uses up to 4096 tokens. These are numerical and
    /// state gates only, never performance or peak-memory observations.
    public static func optimizationPrefillFamily(modelDir: URL, tokens: Int, scoped: Bool = false, selectedAttention: Bool = false, terminalPrefill: Bool = false, terminalQuery: Bool = false, integratedBase: Bool = false) throws -> CheckReport {
        guard [1024, 2051, 4096, 8192].contains(tokens) else {
            throw ModelError("prefill family tokens must be 1024, 2051, 4096 or 8192")
        }
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640,
            embeddingRowCache: integratedBase ? true : nil)
        var options = integratedBase ? InferenceOptimizations.integrationCandidate : InferenceOptimizations()
        options.compactStateWindows = true
        options.compactMTPRow = true
        options.boundedIndexer = true
        options.boundedPLE = true
        options.workspaceTokenTile = model.optimizations.workspaceTokenTile
        options.compactScopeFrontier = model.optimizations.compactScopeFrontier
        options.workspacePiecewiseWrites = model.optimizations.workspacePiecewiseWrites
        model.optimizations = options
        model.pool.admitOnSweep = false
        var c = CheckBuilder(terminalPrefill ? "optimization-terminal-prefill-family" : selectedAttention ? "optimization-selected-attention-family" : scoped ? "optimization-256-compute-read-scope" : "optimization-chronological-prefill-family")
        c.measure("workspace_token_tile", Double(options.workspaceTokenTile))
        c.measure("compact_scope_frontier", options.compactScopeFrontier ? 1 : 0)
        c.measure("integrated_base", integratedBase ? 1 : 0)
        if integratedBase { c.expect("combined scope base uses bounded embedding rows", model.resident.usesEmbeddingRows) }
        let ids = (0 ..< tokens).map { 1000 + (($0 * 7919) % 200_000) }
        let chunks = [256, 512, (selectedAttention || terminalPrefill) ? 256 : min(4096, tokens)]
        let states = chunks.map { _ in model.makeState() }
        var logits: [MLXArray] = []
        var traces: [[Int: [Int32]]] = []
        for (arm, chunk) in chunks.enumerated() {
            let rotationsBefore = model.fusedRoPERotationsScheduled
            var routes: [Int: [Int32]] = [:]
            model.routerObserver = { layer, ids in routes[layer, default: []].append(contentsOf: ids) }
            model.pool.resetStats()
            let pieceWrites = model.pool.workspacePieceWriteCompletions
            var last = MLXArray(Float(0))
            model.optimizations = options
            model.optimizations.selectedTextAttention = selectedAttention && arm == 2
            model.optimizations.terminalPrefillPruning = terminalPrefill && arm == 2
            model.optimizations.terminalLastQuery = terminalQuery && arm == 2
            if arm == 2 && scoped {
                var lo = 0
                while lo < tokens {
                    let passes = PrefillSchedule.scopePasses(remaining: tokens - lo, at: lo,
                        maxChunk: 256, maxScope: chunk, tailAware: false)
                    let hi = lo + passes.reduce(0, +)
                    model.optimizations.layerExpertWorkspace = passes.count > 1
                    if passes.count > 1 {
                        let result = model.consumeReadScope(Array(ids[lo ..< hi]), passes: passes,
                            state: states[arm], vision: [], head: nil, final: hi == tokens, shouldContinue: nil)
                        c.expect("scope through \(hi) commits", result.committed)
                        if let value = result.logits { last = value }
                    } else { last = model.lastLogits(Array(ids[lo ..< hi]), state: states[arm]) }
                    eval(last); lo = hi
                }
            } else {
                for lo in stride(from: 0, to: tokens, by: chunk) {
                    let hi = min(tokens, lo + chunk)
                    if terminalPrefill && arm == 2 && hi < tokens {
                        model.consumePrompt(Array(ids[lo ..< hi]), state: states[arm])
                    } else {
                        last = model.lastLogits(Array(ids[lo ..< hi]), state: states[arm])
                        eval(last)
                    }
                }
            }
            model.routerObserver = nil
            if integratedBase {
                c.expect("arm\(arm): combined scope base executes fused rotation",
                    model.fusedRoPERotationsScheduled > rotationsBefore)
            }
            c.measure("arm\(arm).chunk", Double(chunk))
            c.measure("arm\(arm).read_records", Double(model.pool.recordsFetched))
            c.measure("arm\(arm).workspace_piece_writes", Double(model.pool.workspacePieceWriteCompletions - pieceWrites))
            if scoped && arm == 2 && options.workspacePiecewiseWrites {
                c.expect("piecewise workspace writes actually complete", model.pool.workspacePieceWriteCompletions > pieceWrites)
            }
            logits.append(last); traces.append(routes)
        }
        if terminalPrefill {
            c.equal("all undemanded terminal queries skipped", model.terminalQueryRowsSkipped,
                terminalQuery ? tokens - min(64, (tokens - 1) % 256 + 1) : tokens - ((tokens - 1) % 256 + 1))
            c.equal("all unused terminal MoE rows skipped", model.terminalMoERowsSkipped, tokens - 1)
            c.equal("last-row final router IDs", Array((traces[2][model.runLayers - 1] ?? []).suffix(model.cfg.topK)),
                Array((traces[0][model.runLayers - 1] ?? []).suffix(model.cfg.topK)))
        }
        if selectedAttention {
            c.expect("selected attention actually executed", model.selectedAttentionTiles > 0)
            c.measure("selected_attention_tiles", Double(model.selectedAttentionTiles))
        }
        model.optimizations = options
        func relative(_ value: MLXArray, _ reference: MLXArray, spread: Bool = false) -> Double {
            guard value.shape == reference.shape, value.dtype == reference.dtype else { return .infinity }
            let a = value.asType(.float32), b = reference.asType(.float32)
            let delta = abs(a - b).max().item(Float.self)
            let denominator = spread ? (b.max() - b.min()).item(Float.self) : abs(b).max().item(Float.self)
            return Double(delta / max(denominator, 1e-6))
        }
        func band(_ label: String, _ values: [MLXArray], spread: Bool = false) {
            let control = relative(values[1], values[0], spread: spread)
            let candidate = relative(values[2], values[0], spread: spread)
            c.measure("\(label).control", control); c.measure("\(label).candidate", candidate)
            if scoped || (terminalPrefill && !spread) {
                c.expect("\(label): exact original 256-token arithmetic", candidate == 0)
            } else {
                c.expect("\(label): existing rechunk band", control.isFinite && candidate.isFinite
                    && candidate <= max(3 * control, 0.01))
            }
        }
        func compare(_ label: String, _ outputs: [MLXArray]) {
            band("\(label).logits", outputs, spread: true)
            c.equal("\(label): greedy final token", argMax(outputs[2].reshaped([-1])).item(Int.self),
                    argMax(outputs[0].reshaped([-1])).item(Int.self))
            let fields = states.map { $0.diagnosticTensors() }
            c.equal("\(label): control fields", Set(fields[1].keys), Set(fields[0].keys))
            c.equal("\(label): candidate fields", Set(fields[2].keys), Set(fields[0].keys))
            for key in fields[0].keys.sorted() {
                guard let control = fields[1][key], let candidate = fields[2][key] else { continue }
                let values = [fields[0][key]!, control, candidate]
                if key == "tokens" || key == "ngram" {
                    c.expect("\(label): exact \(key)", (values[0] .== values[1]).all().item(Bool.self)
                        && (values[0] .== values[2]).all().item(Bool.self))
                } else { band("\(label).\(key)", values) }
            }
        }
        compare("prefill", logits)
        func disagreement(_ got: [Int: [Int32]]) -> Double {
            var missing = 0, count = 0
            for layer in traces[0].keys.sorted() where !terminalPrefill || layer != model.runLayers - 1 {
                let reference = traces[0][layer]!, candidate = got[layer] ?? []
                guard candidate.count == reference.count else { return .infinity }
                for lo in stride(from: 0, to: reference.count, by: model.cfg.topK) {
                    let selected = Set(reference[lo ..< lo + model.cfg.topK])
                    for id in candidate[lo ..< lo + model.cfg.topK] {
                        if !selected.contains(id) { missing += 1 }
                        count += 1
                    }
                }
            }
            return Double(missing) / Double(max(1, count))
        }
        let controlRoutes = disagreement(traces[1]), candidateRoutes = disagreement(traces[2])
        c.measure("routing.control", controlRoutes); c.measure("routing.candidate", candidateRoutes)
        c.expect("route keep sets inside existing rechunk band", candidateRoutes <= max(3 * controlRoutes, 0.01))
        if scoped { c.equal("exact ordered router traces", traces[2], traces[0]) }
        if terminalPrefill {
            c.equal("all state-producing layers retain ordered routes", traces[2].filter { $0.key != model.runLayers - 1 },
                traces[0].filter { $0.key != model.runLayers - 1 })
        }
        // Teacher-forced continuation exposes drift hidden by a final-logit
        // check. The same suffix is actual work in every arm, regardless of
        // its free-generation choice.
        for token in [907, 1337, 2103] {
            logits = states.map { state in
                let value = model.lastLogits([token], state: state); eval(value); return value
            }
            compare("continued-\(token)", logits)
        }
        // Rejected speculative rows must restore the accepted prefix in all
        // schedule families, including a partial four-token indexer block.
        let checkpoints = states.map { $0.checkpoint() }
        let verify = [1137, 732, 2091]
        for keep in 1 ... verify.count {
            for (arm, state) in states.enumerated() {
                state.restore(checkpoints[arm]); state.setRecording(true)
                let verified = model.allLogitsWithMulti(verify, state: state)
                eval(verified.logits, verified.multi)
                state.rollback(keeping: keep, of: verify, from: checkpoints[arm], ngramWindow: model.cfg.ngramSize - 1)
            }
            logits = states.map { state in
                let value = model.lastLogits([907], state: state); eval(value); return value
            }
            compare("rollback-\(keep)", logits)
        }
        return c.report()
    }
}

````````````

## Artifact SHA-256 a57d3ec3d19007bdb48a109214bcc3eb1e6b4e401cb3baaa1296952e39d4bfc6

Encoding: `utf-8`. Original bytes: 18429.

````````````text
// Process and cache safety invariants that are otherwise only observable
// during a 100+ GB model run. Weights-free on purpose: these are the rules a
// long run depends on, checked in milliseconds on every push.

import Foundation
import Slotstream

extension Diagnostics {
    public static func runtime() throws -> CheckReport {
        var c = CheckBuilder("runtime-check")

        if let before = ProcessMemory.vmActivity(), let after = ProcessMemory.vmActivity() {
            c.expect("request VM counters are monotonic", after.swapins >= before.swapins && after.swapouts >= before.swapouts)
            c.expect("request VM reclaimable bytes are available", before.reclaimableBytes > 0)
        } else { c.expect("request VM counters are available", false) }
        c.expect("process physical footprint is readable", ProcessMemory.residentBytes() > 0)
        c.expect("process RSS high-water is readable", ProcessMemory.peakResidentBytes() > 0)
        c.expect("lifetime RSS is separately readable", ProcessMemory.lifetimeRSSPeakBytes() > 0)
        let start = RuntimeClock.now()
        c.expect("monotonic duration is nonnegative", RuntimeClock.seconds(since: start) >= 0)
        let sampler = FootprintSampler()
        let observed = sampler.finish()
        c.expect("footprint sampler includes endpoints", observed.samples >= 2 && observed.peakBytes > 0)
        c.equal("reference optimization defaults", try InferenceOptimizations.environment([:]), InferenceOptimizations())
        let qualified = OptimizationPlatform(machineModel: "Mac17,9", chip: "Apple M5 Pro",
            osBuild: "25G83", nativeARM64: true)
        c.equal("qualified platform keeps the complete joint candidate",
            InferenceOptimizations.deploymentCandidate(on: qualified), .integrationCandidate)
        var fallback = InferenceOptimizations.integrationCandidate
        fallback.fusedRoPE = false
        let unknownPlatforms: [OptimizationPlatform] = [
            .init(machineModel: nil, chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: nil, osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: nil, nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: false),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "23A344", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "24A335", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "25G84", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "26A1", nativeARM64: true),
            .init(machineModel: "Mac14,6", chip: "Apple M2 Max", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Max", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,10", chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro extra", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "", chip: "", osBuild: "", nativeARM64: true),
        ]
        for (i, platform) in unknownPlatforms.enumerated() {
            c.equal("unqualified platform \(i) keeps portable work and original rotation",
                InferenceOptimizations.deploymentCandidate(on: platform), fallback)
        }
        c.equal("platform selection is deterministic", OptimizationPlatform.current, OptimizationPlatform.current)
        c.expect("explicit kernel qualification remains available",
            try InferenceOptimizations.environment(["SLOTSTREAM_OPT_FUSED_ROPE": "1"]).fusedRoPE)
        c.expect("explicit kernel fallback remains available",
            try !InferenceOptimizations.environment(["SLOTSTREAM_OPT_FUSED_ROPE": "0"]).fusedRoPE)
        let candidate = InferenceOptimizations.integrationCandidate
        c.expect("combined candidate preserves the original MTP verification shape",
            !candidate.boundedDraftTail)
        c.equal("absent overrides retain the selected default family",
            try InferenceOptimizations.resolving(environment: [:], defaults: candidate), candidate)
        let candidateFlags: [(String, WritableKeyPath<InferenceOptimizations, Bool>)] = [
            ("SLOTSTREAM_OPT_COMPACT_STATE", \.compactStateWindows),
            ("SLOTSTREAM_OPT_COMPACT_MTP", \.compactMTPRow),
            ("SLOTSTREAM_OPT_NGRAM_ROWS", \.compactNgramRows),
            ("SLOTSTREAM_OPT_FINAL_FORWARD", \.skipUnusedFinalForward),
            ("SLOTSTREAM_OPT_SAMPLER_THRESHOLD", \.valueOnlySamplerThreshold),
            ("SLOTSTREAM_OPT_SAMPLER_DRAW", \.deviceSamplerDraw),
            ("SLOTSTREAM_OPT_OUTPUT_QUEUE", \.boundedOutputQueue),
            ("SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR", \.responsiveGovernor),
            ("SLOTSTREAM_OPT_COMPLETE_PROMPT", \.completePromptCheckpoint),
            ("SLOTSTREAM_OPT_SHARED_ROPE", \.sharedRoPE),
            ("SLOTSTREAM_OPT_FUSED_ROPE", \.fusedRoPE),
        ]
        for (name, field) in candidateFlags {
            var disabled = candidate
            disabled[keyPath: field] = false
            c.equal("explicit zero disables only \(name)",
                try InferenceOptimizations.resolving(environment: [name: "0"], defaults: candidate), disabled)
            c.equal("explicit one restores only \(name)",
                try InferenceOptimizations.resolving(environment: [name: "1"], defaults: disabled), candidate)
        }
        var referenceOverrides = Dictionary(uniqueKeysWithValues: candidateFlags.map { ($0.0, "0") })
        referenceOverrides["SLOTSTREAM_OPT_PREFIX_CHECKPOINT"] = "0"
        c.equal("explicit zeros restore the complete reference inference family",
            try InferenceOptimizations.resolving(environment: referenceOverrides, defaults: candidate),
            InferenceOptimizations())
        var noCheckpoint = candidate
        noCheckpoint.prefixCheckpointTokens = 0
        c.equal("explicit numeric zero disables inherited prefix retention",
            try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0"],
                defaults: candidate), noCheckpoint)
        c.equal("non-optimization environment leaves the family intact",
            try InferenceOptimizations.resolving(environment: ["PATH": "/unused"], defaults: candidate), candidate)
        for env in [["SLOTSTREAM_OPT_COMPLETE_PROMPT": "false"], ["SLOTSTREAM_OPT_TYPO": "0"]] {
            do {
                _ = try InferenceOptimizations.resolving(environment: env, defaults: candidate)
                c.expect("selected defaults still reject invalid override \(env)", false)
            } catch { c.expect("selected defaults still reject invalid override \(env)", true) }
        }
        var scopedDefaults = candidate
        scopedDefaults.readScopeTokens = 4096
        scopedDefaults.layerExpertWorkspace = true
        scopedDefaults.boundedIndexer = true
        scopedDefaults.boundedPLE = true
        c.equal("valid inherited read scope retains its prerequisites",
            try InferenceOptimizations.resolving(environment: [:], defaults: scopedDefaults), scopedDefaults)
        for name in ["SLOTSTREAM_OPT_COMPACT_STATE", "SLOTSTREAM_OPT_COMPACT_MTP",
                     "SLOTSTREAM_OPT_LAYER_WORKSPACE", "SLOTSTREAM_OPT_INDEXER_TILES", "SLOTSTREAM_OPT_PLE_TILES"] {
            do {
                _ = try InferenceOptimizations.resolving(environment: [name: "0"], defaults: scopedDefaults)
                c.expect("inherited scope rejects disabled prerequisite \(name)", false)
            } catch { c.expect("inherited scope rejects disabled prerequisite \(name)", true) }
        }
        scopedDefaults.readScopeTokens = 0
        c.equal("scope can be disabled while retaining its other independent work",
            try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_READ_SCOPE": "0"],
                defaults: {
                    var value = scopedDefaults; value.readScopeTokens = 4096; return value
                }()), scopedDefaults)
        let environmentFunction: ([String: String]) throws -> InferenceOptimizations = InferenceOptimizations.environment
        c.equal("public environment function value keeps its signature and reference default",
            try environmentFunction([:]), InferenceOptimizations())
        c.expect("typed override enables compaction", try InferenceOptimizations.environment([
            "SLOTSTREAM_OPT_COMPACT_STATE": "1"]).compactStateWindows)
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_COMPACT_STATE": "yes"])
            c.expect("malformed override refused", false)
        } catch { c.expect("malformed override refused", true) }

        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_TYPO": "1"])
            c.expect("unknown optimization refused", false)
        } catch { c.expect("unknown optimization refused", true) }

        for value in ["-1", "1", "16384", "bad"] {
            do {
                _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_READ_SCOPE": value])
                c.expect("invalid read scope \(value) refused", false)
            } catch { c.expect("invalid read scope \(value) refused", true) }
        }
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_READ_SCOPE": "8192"])
            c.expect("unbounded read scope refused", false)
        } catch { c.expect("unbounded read scope refused", true) }

        c.equal("explicit workspace tile is recorded", try InferenceOptimizations.environment([
            "SLOTSTREAM_OPT_WORKSPACE_TILE": "2048"]).workspaceTokenTile, 2048)
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_WORKSPACE_TILE": "8192"])
            c.expect("unbounded workspace tile refused", false)
        } catch { c.expect("unbounded workspace tile refused", true) }

        c.equal("terminal output needs no speculative draft", Generator.effectiveDraftDepth(requested: 16, remainingOutputs: 1, bounded: true), 0)
        c.equal("draft count fits remaining output", Generator.effectiveDraftDepth(requested: 16, remainingOutputs: 3, bounded: true), 2)
        c.equal("public depth cannot exceed recording cap", Generator.effectiveDraftDepth(requested: Int.max, remainingOutputs: Int.max, bounded: false), 16)
        c.equal("negative remaining output cannot underflow", Generator.effectiveDraftDepth(requested: Int.min, remainingOutputs: Int.min, bounded: true), 0)

        // The prefix cache holds four conversations, not one: Open WebUI's
        // interleaved title request defeated a single slot.
        // Logical cache fixtures are never forwarded through the model, but
        // still declare exactly the number of represented token IDs.
        func fixture(_ count: Int) -> Qwen4ExpModel.State {
            let state = Qwen4ExpModel.State(); state.tokenCount = count; return state
        }
        let cache = PrefixCache(maxTokens: 100)
        for token in 1 ... PrefixCache.maxEntries {
            cache.store(state: fixture(1), tokens: [token])
        }
        c.equal(
            "prefix cache reaches its four-entry bound",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries)
        cache.store(state: fixture(1), tokens: [PrefixCache.maxEntries])
        c.equal(
            "an identical history replaces instead of duplicating an entry",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries)
        _ = cache.take(matching: [999], reserveTokens: 1)
        c.equal(
            "a miss evicts before allocating a fifth state",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries - 1)
        cache.configure(maxTokens: 2)
        c.expect("a smaller live token ceiling evicts immediately", cache.heldTokens <= 2)
        c.expect("held GB includes fixed recurrent state", cache.heldGB > 0.1)
        let growth = PrefixCache(maxTokens: 20)
        growth.store(state: fixture(4), tokens: [1, 2, 3, 4])
        growth.store(state: fixture(4), tokens: [7, 8, 9, 10])
        growth.store(state: fixture(4), tokens: [11, 12, 13, 14])
        c.expect("growing hit still reuses its state", growth.take(matching: [1, 2, 3, 4, 5], reserveTokens: 17) != nil)
        c.equal("growing hit reserves future state before allocation", growth.heldTokens, 0)
        growth.store(state: fixture(1), tokens: [4])
        c.expect("huge reservation safely misses", growth.take(matching: [9], reserveTokens: Int.max) == nil)
        c.equal("huge reservation releases held state", growth.heldTokens, 0)

        let capacity = PrefixCache(maxTokens: 4096)
        for token in 1 ... 4 { capacity.store(state: fixture(1), tokens: [token]) }
        c.expect("capacity reservation still hits", capacity.take(matching: [1, 2], reserveTokens: 2,
            reserveSequenceBytes: 4096 * PrefixCache.bytesPerToken) != nil)
        c.equal("capacity growth reserves bytes before reuse", capacity.heldTokens, 0)
        capacity.store(state: fixture(1), tokens: [7])
        _ = capacity.take(matching: [9], reserveSequenceBytes: Int.max)
        c.equal("saturated byte reservation evicts safely", capacity.heldTokens, 0)

        // Image keying. Every image expands to a run of the same placeholder
        // id, so ids alone cannot tell two pictures apart; the digest can, and
        // a match has to agree in both directions.
        let a = ImageHash(hashing: Data("picture A".utf8))
        let b = ImageHash(hashing: Data("picture B".utf8))
        c.expect("identical bytes hash alike", a == ImageHash(hashing: Data("picture A".utf8)))
        c.expect("different bytes do not", a != b)
        let held = [ImageSegment(start: 4, count: 8, hash: a)]
        c.expect(
            "the same image at the same offset matches",
            PrefixCache.imagesAgree(entry: held, prompt: held, upTo: 12))
        c.expect(
            "a swapped image does not",
            !PrefixCache.imagesAgree(
                entry: held, prompt: [ImageSegment(start: 4, count: 8, hash: b)], upTo: 12))
        c.expect(
            "an entry ending inside a run still matches that run",
            PrefixCache.imagesAgree(
                entry: [ImageSegment(start: 4, count: 3, hash: a)], prompt: held, upTo: 7))
        c.expect(
            "a text-only entry rejects a prompt with an image inside its range",
            !PrefixCache.imagesAgree(entry: [], prompt: held, upTo: 12))
        c.expect(
            "an image beyond the entry's range is irrelevant to the match",
            PrefixCache.imagesAgree(entry: [], prompt: held, upTo: 4))

        let vcache = PrefixCache(maxTokens: 100)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "a vision conversation is held, not discarded",
            vcache.take(matching: [1, 2, 3, 4], images: held, reserveTokens: 4) != nil)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "the same ids with a different picture miss",
            vcache.take(
                matching: [1, 2, 3, 4], images: [ImageSegment(start: 4, count: 8, hash: b)],
                reserveTokens: 4) == nil)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "the text-only splice never sees a vision entry",
            vcache.peek(extending: [1, 2]) == nil)

        // A client can re-render an assistant turn differently from the exact
        // ids the server generated (fx omits reasoning when it sends history
        // back). `peek` finds the longest retained extension for the splice,
        // but does not consume it before the ordinary cache match.
        let spliceCache = PrefixCache(maxTokens: 100)
        spliceCache.store(state: fixture(3), tokens: [7, 8, 9])
        spliceCache.store(state: fixture(4), tokens: [7, 8, 9, 10])
        c.equal(
            "prefix splice chooses the longest retained extension",
            spliceCache.peek(extending: [7, 8]), [7, 8, 9, 10])
        c.expect(
            "prefix splice is strict, not an identical-history match",
            spliceCache.peek(extending: [7, 8, 9, 10]) == nil)
        c.equal(
            "prefix splice lookup does not consume the retained state",
            spliceCache.take(matching: [7, 8, 9, 10, 11])?.reused, 4)
        spliceCache.enabled = false
        c.expect(
            "a disabled prefix cache offers no splice",
            spliceCache.peek(extending: [7]) == nil)

        // Weights behind a symlink: Foundation refuses to list the link itself,
        // so the index must resolve it first (it did not, before 0.2.1).
        let tmp = FileManager.default.temporaryDirectory
            .appendingPathComponent("slotstream-runtime-check-\(getpid())")
        let real = tmp.appendingPathComponent("real")
        let link = tmp.appendingPathComponent("link")
        try FileManager.default.createDirectory(at: real, withIntermediateDirectories: true)
        FileManager.default.createFile(
            atPath: real.appendingPathComponent("model-00001-of-00001.safetensors").path,
            contents: Data())
        try FileManager.default.createSymbolicLink(at: link, withDestinationURL: real)
        defer { try? FileManager.default.removeItem(at: tmp) }
        c.equal(
            "shard listing works through a symlinked model dir",
            (try? CheckpointIndex.shardFiles(in: link))?.count, 1)

        // The memory promise: a plan never expects to peak past its target.
        for target in [Planner.minMemoryGB, 10, 16, 30] where target >= Planner.minMemoryGB {
            let p = try Planner.plan(
                expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                ramGB: 64, workingSetGB: 64, availableGB: 64)
            c.expect(
                "\(target) GB plan stays inside its target",
                p.expectedPeakGB <= target + 0.01,
                "expected peak \(p.expectedPeakGB) GB")
            c.measure("peak_gb_at_\(Int(target))", p.expectedPeakGB)
        }
        return c.report()
    }
}

````````````

## Artifact SHA-256 dde64818657af9c36991dff28d27c80246321cf30eed039784ef6d4efc4111e4

Encoding: `utf-8`. Original bytes: 3228.

````````````text
{
  "Sources/Slotstream/Context.swift": {
    "kind": "file",
    "sha256": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0",
    "mode": 420,
    "mtime_ns": 1788730104260734034
  },
  "Sources/Slotstream/ContextMemory.swift": {
    "kind": "file",
    "sha256": "1219676f986d33a842fdafa4ea75bf54ed120692903d2a79ff2930550d717683",
    "mode": 420,
    "mtime_ns": 1788724896652527410
  },
  "Sources/Slotstream/Engine.swift": {
    "kind": "file",
    "sha256": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
    "mode": 420,
    "mtime_ns": 1788723862309276323
  },
  "Sources/Slotstream/Generate.swift": {
    "kind": "file",
    "sha256": "9bd9619a98aa62685be2de5148942455456b5d30fcf18e5a384148a4ae313da2",
    "mode": 420,
    "mtime_ns": 1788873117980187994
  },
  "Sources/Slotstream/MTP.swift": {
    "kind": "file",
    "sha256": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
    "mode": 420,
    "mtime_ns": 1788650837208546460
  },
  "Sources/Slotstream/Model.swift": {
    "kind": "file",
    "sha256": "a4cea913e0f438a69e72672d42046bf904717700d8753c1449e5e48b419033a6",
    "mode": 420,
    "mtime_ns": 1788724896653088653
  },
  "Sources/Slotstream/Optimizations.swift": {
    "kind": "file",
    "sha256": "9ec7c669fbe7c88a88ec55aedbdc7afb87b696182333324265fdf95f60a5a5f1",
    "mode": 420,
    "mtime_ns": 1788873117979610110
  },
  "Sources/Slotstream/Plan.swift": {
    "kind": "file",
    "sha256": "d1021e321894868c4844f2cbe4978c3ca6c6cfa958c9aa64591e9d0ec08e8ff7",
    "mode": 420,
    "mtime_ns": 1788764157385993704
  },
  "Sources/Slotstream/PlannerCostModel.swift": {
    "kind": "absent"
  },
  "Sources/Slotstream/RequestControl.swift": {
    "kind": "file",
    "sha256": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
    "mode": 420,
    "mtime_ns": 1788719260521494869
  },
  "Sources/Slotstream/Weights.swift": {
    "kind": "file",
    "sha256": "27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b",
    "mode": 420,
    "mtime_ns": 1788724896653554065
  },
  "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": {
    "kind": "file",
    "sha256": "0166555aba0d15daf7a0570607978e4c341aec9ab430f5ce3bc25e3370f149da",
    "mode": 420,
    "mtime_ns": 1788724931556430829
  },
  "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": {
    "kind": "file",
    "sha256": "7363b347ae2df47ff005cb414722434d8d67783ea85a228d68f3b829153f5f8e",
    "mode": 420,
    "mtime_ns": 1788735173279636597
  },
  "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": {
    "kind": "file",
    "sha256": "f4b9c59e6abc340e8f15b2d523296ab74fcd269cc39c67f514cb18f41a1f6a96",
    "mode": 420,
    "mtime_ns": 1788730413321898870
  },
  "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": {
    "kind": "file",
    "sha256": "71b49d3edc91c35572e0e40937860f8112c5ac56b9816ce870e189d4223d641c",
    "mode": 420,
    "mtime_ns": 1788711955513528143
  },
  "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": {
    "kind": "file",
    "sha256": "a57d3ec3d19007bdb48a109214bcc3eb1e6b4e401cb3baaa1296952e39d4bfc6",
    "mode": 420,
    "mtime_ns": 1788873117980868504
  }
}

````````````

## Artifact SHA-256 253f784504f8db8d28ab66eaec9533b53294871f18af20c727039ad22e63d43e

Encoding: `gzip+base64`. Original bytes: 2997.

````````````text
H4sIAAAAAAAC/9XWOw7CMAwG4D0Sd6iEGLHsPJszMCBxAwYGli7l/iKIIU5bBINjiRygX+38tgKwccxR5JjLdRosDY/b/JiH+zSQB49hNuZ8Mn00wqqNEDEtsQ5k5CRabElJaqxSBheXnZSkMi+Kkq2UpOKrgpAzbd9Wt2iyfrqSFh91GoolJfXuJBHHCgKioHBr6JoYSjqxcdaLQ3ySWWFUNhVqtA919sVLst/Hq/vM+XYOKOmExyo56JkjyYTPoenIWBWG8Jdgiu5J9kyw4HJc/YDoXqGm3LT1KBH1HN9jGLxmdaNrNEkpteHMb2i3Fzrl8Vg+e/iDDz4BFmoDzrULAAA=
````````````

## Artifact SHA-256 85a702f471cb79a2da4b30f82f6b9738677390e3e1ea7a4569bc4d840f0f166f

Encoding: `utf-8`. Original bytes: 17026.

````````````text
coverage ratchet checks pass
{"phase": "starting", "prompt_tokens": 16, "reclaimable_gb": 20.0}
{"prompt_tokens": 16, "passed": false, "error": "ValueError: capacity rung was incomplete, aborted or over its plan"}
{"phase": "waiting for build reservation", "seconds": 0.0}
{"starting": "native/combined-plain"}
{"starting": "native/combined-mtp"}
{"starting": "native/read-failure-serving"}
{"starting": "paired/short-one"}
{"starting": "paired/unique-prose"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-mtp"}
{"starting": "native/read-failure-serving"}
{"starting": "paired/short-one"}
{"starting": "paired/unique-prose"}
{"starting": "paired/sampled-short"}
{"starting": "paired/mtp-resource"}
{"starting": "paired/distinct-tail"}
{"starting": "paired/complete-repeat"}
{"starting": "paired/unique-with-retention"}
{"starting": "paired/actual-default-one-token"}
{"starting": "soak/off"}
{"starting": "soak/on"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-mtp"}
{"starting": "native/read-failure-serving"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-mtp"}
{"starting": "native/read-failure-serving"}
{"starting": "paired/short-one"}
llms-full.txt is current
warning LOG_UNKNOWN_KIND log.md:124 — log entry kind `change` is not recognized
    hint: use one of: ingest, create, update, delete, rename, link, validate, index-rebuild, contradiction
1 issue(s): 0 error(s), 1 warning(s), 0 info
MEASUREMENTS.md is current
PLAN.md is current
claims gate: 95 needle checks, 0 failures
BRAIN GATES PASS
dequant_row.txt: OK
layer_0.bin: OK
layer_1.bin: OK
layer_2.bin: OK
layer_3.bin: OK
ngram_ids.txt: OK
tokens.txt: OK
PASS  request VM counters are monotonic
PASS  request VM reclaimable bytes are available
PASS  process physical footprint is readable
PASS  process RSS high-water is readable
PASS  lifetime RSS is separately readable
PASS  monotonic duration is nonnegative
PASS  footprint sampler includes endpoints
PASS  automatic platform-qualified optimization defaults
PASS  qualified platform keeps the complete joint candidate
PASS  unqualified platform 0 keeps portable work and original rotation
PASS  unqualified platform 1 keeps portable work and original rotation
PASS  unqualified platform 2 keeps portable work and original rotation
PASS  unqualified platform 3 keeps portable work and original rotation
PASS  unqualified platform 4 keeps portable work and original rotation
PASS  unqualified platform 5 keeps portable work and original rotation
PASS  unqualified platform 6 keeps portable work and original rotation
PASS  unqualified platform 7 keeps portable work and original rotation
PASS  unqualified platform 8 keeps portable work and original rotation
PASS  unqualified platform 9 keeps portable work and original rotation
PASS  unqualified platform 10 keeps portable work and original rotation
PASS  unqualified platform 11 keeps portable work and original rotation
PASS  unqualified platform 12 keeps portable work and original rotation
PASS  platform selection is deterministic
PASS  explicit kernel qualification remains available
PASS  explicit kernel fallback remains available
PASS  reference control encoding omits unset automatic policy
PASS  old control JSON remains decodable
PASS  automatic policy survives saved control round trip
PASS  absent overrides preserve an inherited automatic policy
PASS  explicit automatic zero restores the chronological policy
PASS  explicit automatic one enables only that policy
PASS  manual scope control suppresses inherited automatic policy/SLOTSTREAM_OPT_READ_SCOPE
PASS  manual scope control suppresses inherited automatic policy/SLOTSTREAM_OPT_LAYER_WORKSPACE
PASS  manual scope control suppresses inherited automatic policy/SLOTSTREAM_OPT_INDEXER_TILES
PASS  manual scope control suppresses inherited automatic policy/SLOTSTREAM_OPT_PLE_TILES
PASS  manual scope control suppresses inherited automatic policy/SLOTSTREAM_OPT_WORKSPACE_TILE
PASS  manual scope control suppresses inherited automatic policy/SLOTSTREAM_OPT_SCOPE_FRONTIER
PASS  manual scope control suppresses inherited automatic policy/SLOTSTREAM_OPT_WORKSPACE_PIECES
PASS  malformed automatic policy refuses/true
PASS  malformed automatic policy refuses/-1
PASS  malformed automatic policy refuses/2
PASS  malformed automatic policy refuses/
PASS  combined candidate preserves the original MTP verification shape
PASS  absent overrides retain the selected default family
PASS  explicit zero disables only SLOTSTREAM_OPT_COMPACT_STATE
PASS  explicit one restores only SLOTSTREAM_OPT_COMPACT_STATE
PASS  explicit zero disables only SLOTSTREAM_OPT_COMPACT_MTP
PASS  explicit one restores only SLOTSTREAM_OPT_COMPACT_MTP
PASS  explicit zero disables only SLOTSTREAM_OPT_NGRAM_ROWS
PASS  explicit one restores only SLOTSTREAM_OPT_NGRAM_ROWS
PASS  explicit zero disables only SLOTSTREAM_OPT_FINAL_FORWARD
PASS  explicit one restores only SLOTSTREAM_OPT_FINAL_FORWARD
PASS  explicit zero disables only SLOTSTREAM_OPT_SAMPLER_THRESHOLD
PASS  explicit one restores only SLOTSTREAM_OPT_SAMPLER_THRESHOLD
PASS  explicit zero disables only SLOTSTREAM_OPT_SAMPLER_DRAW
PASS  explicit one restores only SLOTSTREAM_OPT_SAMPLER_DRAW
PASS  explicit zero disables only SLOTSTREAM_OPT_OUTPUT_QUEUE
PASS  explicit one restores only SLOTSTREAM_OPT_OUTPUT_QUEUE
PASS  explicit zero disables only SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR
PASS  explicit one restores only SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR
PASS  explicit zero disables only SLOTSTREAM_OPT_COMPLETE_PROMPT
PASS  explicit one restores only SLOTSTREAM_OPT_COMPLETE_PROMPT
PASS  explicit zero disables only SLOTSTREAM_OPT_SHARED_ROPE
PASS  explicit one restores only SLOTSTREAM_OPT_SHARED_ROPE
PASS  explicit zero disables only SLOTSTREAM_OPT_FUSED_ROPE
PASS  explicit one restores only SLOTSTREAM_OPT_FUSED_ROPE
PASS  explicit zeros restore the complete reference inference family
PASS  explicit numeric zero disables inherited prefix retention
PASS  non-optimization environment leaves the family intact
PASS  selected defaults still reject invalid override ["SLOTSTREAM_OPT_COMPLETE_PROMPT": "false"]
PASS  selected defaults still reject invalid override ["SLOTSTREAM_OPT_TYPO": "0"]
PASS  valid inherited read scope retains its prerequisites
PASS  inherited scope rejects disabled prerequisite SLOTSTREAM_OPT_COMPACT_STATE
PASS  inherited scope rejects disabled prerequisite SLOTSTREAM_OPT_COMPACT_MTP
PASS  inherited scope rejects disabled prerequisite SLOTSTREAM_OPT_LAYER_WORKSPACE
PASS  inherited scope rejects disabled prerequisite SLOTSTREAM_OPT_INDEXER_TILES
PASS  inherited scope rejects disabled prerequisite SLOTSTREAM_OPT_PLE_TILES
PASS  scope can be disabled while retaining its other independent work
PASS  public environment function value keeps its signature and automatic default
PASS  typed override enables compaction
PASS  malformed override refused
PASS  unknown optimization refused
PASS  invalid read scope -1 refused
PASS  invalid read scope 1 refused
PASS  invalid read scope 16384 refused
PASS  invalid read scope bad refused
PASS  unbounded read scope refused
PASS  explicit workspace tile is recorded
PASS  unbounded workspace tile refused
PASS  terminal output needs no speculative draft
PASS  draft count fits remaining output
PASS  public depth cannot exceed recording cap
PASS  negative remaining output cannot underflow
PASS  prefix cache reaches its four-entry bound
PASS  an identical history replaces instead of duplicating an entry
PASS  a miss evicts before allocating a fifth state
PASS  a smaller live token ceiling evicts immediately
PASS  held GB includes fixed recurrent state
PASS  growing hit still reuses its state
PASS  growing hit reserves future state before allocation
PASS  huge reservation safely misses
PASS  huge reservation releases held state
PASS  capacity reservation still hits
PASS  capacity growth reserves bytes before reuse
PASS  saturated byte reservation evicts safely
PASS  identical bytes hash alike
PASS  different bytes do not
PASS  the same image at the same offset matches
PASS  a swapped image does not
PASS  an entry ending inside a run still matches that run
PASS  a text-only entry rejects a prompt with an image inside its range
PASS  an image beyond the entry's range is irrelevant to the match
PASS  a vision conversation is held, not discarded
PASS  the same ids with a different picture miss
PASS  the text-only splice never sees a vision entry
PASS  prefix splice chooses the longest retained extension
PASS  prefix splice is strict, not an identical-history match
PASS  prefix splice lookup does not consume the retained state
PASS  a disabled prefix cache offers no splice
PASS  shard listing works through a symlinked model dir
PASS  8.1 GB plan stays inside its target
PASS  10.0 GB plan stays inside its target
PASS  16.0 GB plan stays inside its target
PASS  30.0 GB plan stays inside its target
RUNTIME CHECK PASS
PASS  matching file is accepted
PASS  same-size corruption is rejected
PASS  exact Content-Range is accepted
PASS  wrong range start is rejected
PASS  wrong range total is rejected
PASS  unknown range total is rejected
PASS  every pinned file has a digest
PASS  the draft head is pinned as the one optional file
PASS  an absent optional file is not a repair; an absent required one is
PASS  an empty directory reads as missing
PASS  missing needs the required model
PASS  status carries free disk
PASS  bytesToFetch agrees with required files
PASS  a missing copy is not ready
PULL CHECK PASS
{"bf16_predictions":16711680,"centers":1000000,"roundtrips":60,"malformed_inputs":39583,"pass":true}
MANIFEST CHECKS PASS
{"name": "normal", "pass_": true, "seconds": 0.301, "returncode": 0}
{"name": "cache-miss-reporting", "pass_": true, "seconds": 0.035, "returncode": 0}
{"name": "redirect", "pass_": true, "seconds": 0.032, "returncode": 0}
{"name": "bad-object-fallback", "pass_": true, "seconds": 0.033, "returncode": 0}
{"name": "missing-object-raw-fallback", "pass_": true, "seconds": 0.038, "returncode": 0}
{"name": "raw-wrong-range-fails", "pass_": true, "seconds": 0.015, "returncode": 1}
{"name": "raw-ignored-range-fails", "pass_": true, "seconds": 0.015, "returncode": 1}
{"name": "optional-absent", "pass_": true, "seconds": 0.029, "returncode": 0}
{"name": "optional-corrupt-and-unavailable", "pass_": true, "seconds": 0.032, "returncode": 0}
{"name": "bad-object-fails", "pass_": true, "seconds": 0.013, "returncode": 1}
{"name": "retry-after", "pass_": true, "seconds": 0.03, "returncode": 0}
{"name": "hugging-face-rate-limit", "pass_": true, "seconds": 5.507, "returncode": 0}
{"name": "cancel-during-hugging-face-rate-limit", "pass_": true, "seconds": 0.523, "returncode": 1}
{"name": "transient-retry", "pass_": true, "seconds": 5.615, "returncode": 0}
{"name": "wrong-length-fallback", "pass_": true, "seconds": 11.432, "returncode": 0}
{"name": "short-body-fallback", "pass_": true, "seconds": 35.794, "returncode": 0}
{"name": "content-encoding-fallback", "pass_": true, "seconds": 35.679, "returncode": 0}
{"name": "cancel-preserves-progress", "pass_": true, "seconds": 1.405, "returncode": 1}
{"name": "damaged-resumed-chunk-rejected", "pass_": true, "seconds": 0.035, "returncode": 1}
{"name": "damaged-resumed-chunk-repair", "pass_": true, "seconds": 0.029, "returncode": 0}
{"name": "resume", "pass_": true, "seconds": 0.029, "returncode": 0}
{"name": "already-installed", "pass_": true, "seconds": 0.014, "returncode": 0}
{"name": "valid-symlinks-reused", "pass_": true, "seconds": 0.013, "returncode": 0}
{"name": "corruption-seed", "pass_": true, "seconds": 0.027, "returncode": 0}
{"name": "same-size-final-repair", "pass_": true, "seconds": 0.018, "returncode": 0}
{"name": "invalid-resume-map", "pass_": true, "seconds": 0.026, "returncode": 0}
{"name": "forged-complete-map-without-parts", "pass_": true, "seconds": 0.027, "returncode": 0}
{"name": "oversized-map-is-discarded", "pass_": true, "seconds": 0.026, "returncode": 0}
{"name": "part-symlink-rejected", "pass_": true, "seconds": 0.005, "returncode": 1}
{"name": "part-hardlink-rejected", "pass_": true, "seconds": 0.005, "returncode": 1}
{"name": "part-fifo-rejected", "pass_": true, "seconds": 0.005, "returncode": 1}
{"name": "concurrent-writer-rejected", "pass_": true, "seconds": 0.013, "returncode": 1}
ALL HTTP CHECKS PASS
{"name": "raw-multichunk", "pass_": true, "seconds": 0.748, "returncode": 0}
{"name": "raw-installed-no-http", "pass_": true, "seconds": 0.261, "returncode": 0}
{"name": "raw-source-fallback-missing", "pass_": true, "seconds": 0.349, "returncode": 0}
{"name": "raw-source-fallback-wrong-range", "pass_": true, "seconds": 0.351, "returncode": 0}
{"name": "raw-source-fallback-encoding", "pass_": true, "seconds": 40.852, "returncode": 0}
{"name": "raw-source-fallback-ignore-range", "pass_": true, "seconds": 0.36, "returncode": 0}
{"name": "raw-wrong-range-fails", "pass_": true, "seconds": 0.024, "returncode": 1}
{"name": "raw-corrupt-final-rejected", "pass_": true, "seconds": 0.177, "returncode": 1}
{"name": "raw-optional-inflight-writers", "pass_": true, "seconds": 0.225, "returncode": 0}
{"name": "raw-cancel", "pass_": true, "seconds": 3.314, "returncode": 1}
{"name": "raw-resume", "pass_": true, "seconds": 0.347, "returncode": 0}
{"name": "raw-same-size-repair", "pass_": true, "seconds": 0.474, "returncode": 0}
ALL RAW HTTP CHECKS PASS
SUSTAINED MEMORY PASS 317374464 bytes peak RSS
SLOTPACK GATES PASS
PASS  48GB pristine: 33.0 GB target and starts quiet
PASS  48GB busy: clamped to 15.4 GB, sized-down note
PASS  16GB pristine: 9.8 GB target, no notes
PASS  16GB busy: refuses an unphysical minimum allocation
PASS  8GB Mac: refuses an unphysical minimum allocation
PASS  128GB auto stops at the knee, not at 70% of RAM
PASS  128GB explains the memory it left on the table
PASS  128GB: --memory-gb still reaches full residency
PASS  --sim-ram alone plans instead of erroring
PASS  --max-ram-percent lowers the auto target
PASS  --max-ram-percent cannot exceed the knee
PASS  --max-ram-percent 0 refused
PASS  --max-ram-percent 150 refused
PASS  --max-ram-percent noted when outranked
PASS  more memory never plans slower (7-90 GB sweep)
PASS  explicit total target cannot authorize unavailable memory
PASS  --experts-per-layer 0 refused
PASS  --pool-gb 0 refused
PASS  --memory-gb below minimum refused
PASS  --memory-gb inf is a clean error
PASS  --pool-gb inf is a clean error
PASS  --pool-gb 1e300 saturates safely instead of trapping
PASS  --memory-gb 1e300 refuses physical overcommit without trapping
PASS  huge finite memory plan remains valid JSON
PASS  --sim-ram inf is a clean error
PASS  --sim-working-set inf is a clean error
PASS  --sim-available inf is a clean error
PASS  tiny pool raised to the floor, consistently
PASS  knob precedence noted, never silent
PASS  --model with no safetensors: clean error
PASS  --model with no safetensors: names the fix
PASS  MTP auto on a big quiet machine: knee + head = 34.6
PASS  MTP auto stays off on a 16GB machine
PASS  MTP auto on at --memory-gb 30 (137/layer after the charge)
PASS  MTP auto off at --memory-gb 20 (below the 120/layer floor)
PASS  --mtp on forces the head onto a small machine
PASS  --mtp off suppresses it everywhere
PASS  --mtp on without mtp.safetensors is a clean error
PASS  --mtp on cannot squeeze under the minimum target
PASS  --mtp gibberish refused
PASS  MTP charge visible in json peak
PASS  --model with unparseable config: clean error
PASS  invalid config arithmetic is rejected before it traps
PASS  --model with a corrupt safetensors header
PASS  safetensors dtype/shape byte mismatch rejected
PASS  safetensors header over 100MB rejected before allocation
PASS  --model with a different model's tensors
PASS  serve --max-context 0 refused before load
PASS  plan announces the context cap and the wait
PASS  doctor --json carries max_context_tokens + wait
PASS  serve --max-context above the ceiling names the ceiling, not a knob
PASS  doctor --max-context above the ceiling is the same clean error
PASS  a lower --max-context caps the reuse ceiling too
PASS  prefill-schedule: full model window obeys the product without exemptions
PASS  prefill-schedule agrees with the doctor wait for the same pass
PASS  prefill-schedule: a prefix hit reads only what is new
PASS  prefill-schedule --chunk 0 refused
PASS  context-check --tokens 4 refused before load
PASS  parity rejects an invalid layer count before model load
PASS  parity rejects malformed token ids without trapping
PASS  n-gram golden rejects malformed token ids without trapping
PASS  dequant golden rejects a negative row before model load
PASS  sampler golden rejects an empty vocabulary without trapping
PASS  sampler golden rejects a negative draw count without trapping
planner: passed 64, failed 0
INSTALLER GATES PASS
STATIC GATES PASS

````````````

## Artifact SHA-256 3afa8bcaa3249a86577a6fee625e54b672a192e736b0a1585123260622d7e114

Encoding: `utf-8`. Original bytes: 678.

````````````text
{
  "at": "2026-09-09T01:44:25.474807+00:00",
  "vm": {
    "page_bytes": 16384,
    "reclaimable_bytes": 21356003328,
    "swapins": 44233762,
    "swapouts": 77586649
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
  "jobs": [],
  "apps": {
    "ChatGPT": {
      "processes": 152,
      "footprint_bytes": 8834656760
    },
    "Google Chrome": {
      "processes": 58,
      "footprint_bytes": 11611272512
    },
    "Wispr Flow": {
      "processes": 11,
      "footprint_bytes": 903806120
    }
  },
  "read_errors": []
}

````````````

## Artifact SHA-256 cf03def05d144013db81eec023540fd1be71d5e74c1780595723cdbdcf5b1e89

Encoding: `utf-8`. Original bytes: 583.

````````````text
{
  "at": "2026-09-09T02:04:27.549296+00:00",
  "vm": {
    "page_bytes": 16384,
    "reclaimable_bytes": 18624741376,
    "swapins": 44233790,
    "swapouts": 77586665
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
  "apps": {
    "Google Chrome": {
      "processes": 61,
      "footprint_bytes": 12232494328
    },
    "Wispr Flow": {
      "processes": 11,
      "footprint_bytes": 894549160
    }
  },
  "competing_jobs": []
}

````````````
