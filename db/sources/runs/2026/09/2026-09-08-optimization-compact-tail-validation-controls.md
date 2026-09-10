---
type: run
id: 01m1zmjy4w0wwe6rxq0rpczjk6
created: 2026-09-08T04:31:56.572553+00:00
updated: 2026-09-08T04:31:56.849743+00:00
summary: New combined validation controls and long-throughput drafts preserve original workload criteria
binary: V349 7fb2cc0c6cccf93e8a589d02ce5aa839eea38140a1cb8f44cefeb10ec3f472f6; model-free comparison/preparation
captured_at: 2026-09-08
command: python3 /tmp/slotstream-optimization-execution/compact-tail-controls-v352/controls_test.py; model-free controls.py materialization
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: New combined validation controls and long-throughput drafts preserve original workload criteria
tool: Slotstream local qualification and exact artifact capture
---
Eight V349 paired drafts preserve all original dimensions, work bounds, request/startup criteria and reference controls. Only NGRAM_ROWS and MTP_TAIL become1 in explicit combined arms; the actual-default arm remains an empty environment. Reverting exactly those two flags reconstructs the unchanged original templates. Six model-free tests reject changed reference controls, missing selections, altered bounds/builds, forced actual defaults and adaptive policy. The first model-free preparation failure is preserved: the old matrix relies on Generator default depth1, whereas the already frozen V340 long reporter requires it explicitly. The corrected separate long MTP draft sets depth1 without changing the eight matrix drafts, and the test verifies no input mutation. Both512-output long drafts preserve the selected control family and the unchanged V340 reporter. No study is launched, no prior timing is reused, and the native/optional-disposition/executor/resource prerequisites remain unresolved. Both60-request lifetimes still require the original V321 capacity correction and all eight final paired proofs; this preparation does not replace them. Exact code, failed initial artifacts, corrected drafts, test output and actual Generator source follow.

## Exact artifact inventory

```json
[
  {
    "path": "/Users/carlos/Projects/slotstream/Sources/Slotstream/Generate.swift",
    "bytes": 74261,
    "sha256": "7036e275990695568a948e279505cc03495da21d8b5f81a5f9160843d59c0c0d"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-controls-v352/controls.py",
    "bytes": 5045,
    "sha256": "8d7c667a27e3695c93d4c626d101400f6883508a170a93e5a2ce7b5e93808470"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-controls-v352/controls_test.py",
    "bytes": 2194,
    "sha256": "e9d99bc68cae19cd2bd8ae1975fd8cc980b7fd17c489fc54e605781ce8da5910"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-controls-v352/drafts/actual-default-one-token.json",
    "bytes": 4996,
    "sha256": "cc1d6c295700949d8cd1d2695bb88f80ddd62ca6376fff7e659fb6b9faed51d5"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-controls-v352/drafts/complete-repeat.json",
    "bytes": 7441,
    "sha256": "221aa4d19941fc0db65bf0979e7e499fe0b8b5f6fc4ebaf727d1e800610e2ef3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-controls-v352/drafts/distinct-tail.json",
    "bytes": 7313,
    "sha256": "2532ba4adc8b1b34fce180c2ed8094591f1612cbbf228ba0d2a0f012d83ab9c0"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-controls-v352/drafts/long-off.json",
    "bytes": 6620,
    "sha256": "9228b41920f5259380ae89d9266998a35a1c969e93b3241fa6ff06324e059c21"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-controls-v352/drafts/long-on.json",
    "bytes": 6696,
    "sha256": "821bf25eadd29ceda1fd1b44c0e3e898c90a7407b5b74a9b856b887980f0e267"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-controls-v352/drafts/mtp-resource.json",
    "bytes": 6698,
    "sha256": "940227cce19e58e0b910330b942ddcd871abb66a73699e8529bd5494e3c2e2b1"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-controls-v352/drafts/sampled-short.json",
    "bytes": 6827,
    "sha256": "d86c723d417a92c0e775ab26f9bb0d0ed32c4e600c13d8348ce887e01ae815cb"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-controls-v352/drafts/short-one.json",
    "bytes": 6595,
    "sha256": "2401db6b56527439bc333f2e7d9de0df21cc407bedcd20670cbb81ed7a12ba6f"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-controls-v352/drafts/unique-prose.json",
    "bytes": 6699,
    "sha256": "a8a70fcb38dae58377d3bd4636d73816aeb1e3eb74091e9967c5c254bac6d226"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-controls-v352/drafts/unique-with-retention.json",
    "bytes": 7423,
    "sha256": "4bedbf93bac4ff6242923878cd980a2998d2f853167473f57d78c7f6ae73b10c"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-controls-v352/initial-controls.py",
    "bytes": 4471,
    "sha256": "d4263eafeb78be2917b91830bf0ca5d2add3c5a970a9fd8eab7853033d8acf14"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-controls-v352/initial-controls_test.py",
    "bytes": 1648,
    "sha256": "ce62c3ccc657cff8e86735aa08d3f2e576ab8c133190d0a1ccd47249f2864344"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-controls-v352/initial-partial-drafts/actual-default-one-token.json",
    "bytes": 4996,
    "sha256": "cc1d6c295700949d8cd1d2695bb88f80ddd62ca6376fff7e659fb6b9faed51d5"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-controls-v352/initial-partial-drafts/complete-repeat.json",
    "bytes": 7441,
    "sha256": "221aa4d19941fc0db65bf0979e7e499fe0b8b5f6fc4ebaf727d1e800610e2ef3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-controls-v352/initial-partial-drafts/distinct-tail.json",
    "bytes": 7313,
    "sha256": "2532ba4adc8b1b34fce180c2ed8094591f1612cbbf228ba0d2a0f012d83ab9c0"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-controls-v352/initial-partial-drafts/long-off.json",
    "bytes": 6620,
    "sha256": "9228b41920f5259380ae89d9266998a35a1c969e93b3241fa6ff06324e059c21"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-controls-v352/initial-partial-drafts/mtp-resource.json",
    "bytes": 6698,
    "sha256": "940227cce19e58e0b910330b942ddcd871abb66a73699e8529bd5494e3c2e2b1"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-controls-v352/initial-partial-drafts/sampled-short.json",
    "bytes": 6827,
    "sha256": "d86c723d417a92c0e775ab26f9bb0d0ed32c4e600c13d8348ce887e01ae815cb"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-controls-v352/initial-partial-drafts/short-one.json",
    "bytes": 6595,
    "sha256": "2401db6b56527439bc333f2e7d9de0df21cc407bedcd20670cbb81ed7a12ba6f"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-controls-v352/initial-partial-drafts/unique-prose.json",
    "bytes": 6699,
    "sha256": "a8a70fcb38dae58377d3bd4636d73816aeb1e3eb74091e9967c5c254bac6d226"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-controls-v352/initial-partial-drafts/unique-with-retention.json",
    "bytes": 7423,
    "sha256": "4bedbf93bac4ff6242923878cd980a2998d2f853167473f57d78c7f6ae73b10c"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-controls-v352/initial-preparation-error.json",
    "bytes": 441,
    "sha256": "45e800559f1bf97ac2f04e34243336da60ecc6fd7ccd6350d53ac9b1846f2ce6"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-controls-v352/initial-tests.stderr.txt",
    "bytes": 694,
    "sha256": "909d5f53ed60a53c54cae02aa723738b9877f54eee512eb44760d3e7375dd258"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-controls-v352/initial-tests.stdout.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-controls-v352/preparation.json",
    "bytes": 23978,
    "sha256": "e651ba674bc3664ed6409643df0b85434aa0699934ed14f596b16a7614d58e3d"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-controls-v352/tests.stderr.txt",
    "bytes": 104,
    "sha256": "881ad7429ac21b2f20439667cbc5c0e84fa133ef8ee81890e8b31c4d71e6592b"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-controls-v352/tests.stdout.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  }
]
```

## Artifact SHA-256 7036e275990695568a948e279505cc03495da21d8b5f81a5f9160843d59c0c0d

Encoding: `gzip+base64`. Original bytes: 74261.

````````````text
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
````````````

## Artifact SHA-256 8d7c667a27e3695c93d4c626d101400f6883508a170a93e5a2ce7b5e93808470

Encoding: `utf-8`. Original bytes: 5045.

````````````text
"""Model-free, exact control re-materialization for V349; never runs a study."""
from pathlib import Path
import copy,importlib.util,json,sys
ROOT=Path('/Users/carlos/Projects/slotstream');BASE=Path('/tmp/slotstream-optimization-execution');HERE=Path(__file__).resolve().parent
sys.path.insert(0,str(ROOT/'Tools'))
import optimization_campaign as c
from prefill_bench import digest
BINARY=ROOT/'.build/optimization/compact-tail-combined-build-v349/candidate/slotstream'
MODEL='/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit'
SELECTED=('SLOTSTREAM_OPT_NGRAM_ROWS','SLOTSTREAM_OPT_MTP_TAIL')

def materialize(name):
 if name not in c.PAIRED:raise ValueError('unknown fixed workload')
 build=c.bench.verified_build(BINARY)
 if build['identity']['binary_sha256']!='7fb2cc0c6cccf93e8a589d02ce5aa839eea38140a1cb8f44cefeb10ec3f472f6':raise ValueError('wrong candidate')
 original=c.materialize(c.read(c.TEMPLATES/(name+'.json')),BINARY,MODEL)
 original['frozen_binary_sha256']=build['identity']['binary_sha256']
 c.validate_paired_protocol(name,original)
 result=copy.deepcopy(original)
 for flag in SELECTED:
  if result['arms']['reference']['env'][flag]!='0':raise ValueError('reference changed')
  if name!='actual-default-one-token':
   if result['arms']['combined']['env'][flag]!='0':raise ValueError('original selected control changed')
   result['arms']['combined']['env'][flag]='1'
  elif result['arms']['combined']['env']!={}:raise ValueError('actual default must have no optimization overrides')
 return result

def validate(name,protocol):
 expected=materialize(name)
 if protocol!=expected:raise ValueError('workload, controls, build or acceptance differs from the bounded amendment')
 # Prove that reverting exactly these two independent controls reconstructs
 # the untouched frozen template; all dimensions and criteria remain identical.
 old=copy.deepcopy(protocol)
 if name!='actual-default-one-token':
  for flag in SELECTED:old['arms']['combined']['env'][flag]='0'
 c.validate_paired_protocol(name,old)
 return True

def materialize_long(protocol,mode):
    spec=importlib.util.spec_from_file_location('long',BASE/'long-decode-measurement-v340/long_decode.py');long=importlib.util.module_from_spec(spec);spec.loader.exec_module(long)
    explicit=copy.deepcopy(protocol)
    if mode=='on':
        for arm in explicit['arms'].values():
            if arm['env'].get('SLOTSTREAM_DRAFT_DEPTH','1')!='1':raise ValueError('long MTP depth changed')
            arm['env']['SLOTSTREAM_DRAFT_DEPTH']='1'
    return long.materialize(explicit,mode)

def prepare():
 out=HERE/'drafts';out.mkdir(exist_ok=False)
 build=c.bench.verified_build(BINARY)
 protocols={n:materialize(n) for n in c.PAIRED}
 for name,p in protocols.items():validate(name,p);c.write_new(out/(name+'.json'),p)
 long_paths={}
 for mode,name in [('off','unique-prose'),('on','mtp-resource')]:
  p=materialize_long(protocols[name],mode)
  for flag in SELECTED:
   assert p['arms']['combined']['env'][flag]=='1' and p['arms']['reference']['env'][flag]=='0'
  destination=out/('long-'+mode+'.json');c.write_new(destination,p);long_paths[mode]={'path':str(destination),'sha256':digest(destination)}
 result={'classification':'Prepared selected-control drafts only. All original workload dimensions, acceptance bounds and actual-default empty environment are preserved; the two qualified optional controls alone become 1 in explicit combined arms. Original templates and all prior results remain immutable. New exact-build native proofs are missing; no launch or final-composition qualification is implied.',
 'model_launched':False,'activation_performed':False,'new_combined_native_qualified':False,'native_blocker':'V350 ordinary interrupted on OS pressure; MTP/recovery unrun.', 'other_optional_dispositions_pending':True,'build':build,'controller_sha256':digest(Path(__file__)),
 'template_sha256':{n:digest(c.TEMPLATES/(n+'.json')) for n in c.PAIRED},'paired_drafts':{n:{'path':str(out/(n+'.json')),'sha256':digest(out/(n+'.json'))} for n in c.PAIRED},
 'long_drafts':long_paths,'long_explicit_depth':'MTP arms explicitly set SLOTSTREAM_DRAFT_DEPTH=1, matching the actual Generator default at Generate.swift lines361-366. Original eight paired templates remain unchanged except the two selected controls.','long_reporter_sha256':digest(BASE/'long-decode-measurement-v340/long_decode.py'),'requires_before_execution':['exact current native proofs','final optional dispositions','explicit proof-bound guarded executor','meaningful resource change and fresh exclusive Mac grant'],
 'remaining_lifetime_binding':'Both 60-request lifetimes retain the original V321 off10/on12GB capacity correction, public planner proof and all eight final paired prerequisites; not rematerialized or executed here.'}
 c.write_new(HERE/'preparation.json',result)
 print(json.dumps({k:result[k] for k in ['model_launched','activation_performed','new_combined_native_qualified','native_blocker','controller_sha256','long_reporter_sha256']},indent=2))
if __name__=='__main__':prepare()

````````````

## Artifact SHA-256 e9d99bc68cae19cd2bd8ae1975fd8cc980b7fd17c489fc54e605781ce8da5910

Encoding: `utf-8`. Original bytes: 2194.

````````````text
import copy,unittest
import controls as m

class ExactAmendment(unittest.TestCase):
 def test_all_eight_reconstruct_original_templates(self):
  for n in m.c.PAIRED:self.assertTrue(m.validate(n,m.materialize(n)))
 def test_actual_default_remains_unforced(self):
  p=m.materialize('actual-default-one-token');self.assertEqual(p['arms']['combined']['env'],{})
  p['arms']['combined']['env']['SLOTSTREAM_OPT_NGRAM_ROWS']='1'
  with self.assertRaises(ValueError):m.validate('actual-default-one-token',p)
 def test_reference_and_composition_changes_rejected(self):
  for side,value in [('reference','1'),('combined','0')]:
   for flag in m.SELECTED:
    p=m.materialize('mtp-resource');p['arms'][side]['env'][flag]=value
    with self.assertRaises(ValueError):m.validate('mtp-resource',p)
 def test_changed_criteria_workload_or_build_rejected(self):
  for field,value in [('max_tokens',2),('memory_gb',20),('rounds',32),('frozen_binary_sha256','wrong')]:
   p=m.materialize('unique-prose');p[field]=value
   with self.assertRaises(ValueError):m.validate('unique-prose',p)
  p=m.materialize('unique-prose');p['acceptance']['maximum_median_client_regression']=.10
  with self.assertRaises(ValueError):m.validate('unique-prose',p)
 def test_mtp_depth_and_adaptive_policy_are_not_added(self):
  p=m.materialize('mtp-resource')
  for arm in p['arms'].values():
   self.assertNotIn('SLOTSTREAM_DRAFT_DEPTH',arm['env']);self.assertEqual(arm['env']['SLOTSTREAM_OPT_ADAPTIVE_MTP'],'0')
  p['arms']['combined']['env']['SLOTSTREAM_OPT_ADAPTIVE_MTP']='1'
  with self.assertRaises(ValueError):m.validate('mtp-resource',p)
 def test_long_mtp_depth_explicit_without_mutating_matrix(self):
  p=m.materialize('mtp-resource');prior=copy.deepcopy(p);long=m.materialize_long(p,'on')
  self.assertEqual(p,prior)
  for arm in long['arms'].values():self.assertEqual(arm['env']['SLOTSTREAM_DRAFT_DEPTH'],'1')
  for flag in m.SELECTED:
   self.assertEqual(long['arms']['combined']['env'][flag],'1');self.assertEqual(long['arms']['reference']['env'][flag],'0')
  p['arms']['combined']['env']['SLOTSTREAM_DRAFT_DEPTH']='2'
  with self.assertRaises(ValueError):m.materialize_long(p,'on')
if __name__=='__main__':unittest.main()

````````````

## Artifact SHA-256 cc1d6c295700949d8cd1d2695bb88f80ddd62ca6376fff7e659fb6b9faed51d5

Encoding: `utf-8`. Original bytes: 4996.

````````````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
  "memory_gb": 8.1,
  "mtp": "off",
  "raw": true,
  "seed": 7,
  "rounds": 16,
  "comparison_basis": "fixed-pool",
  "maximum_sampled_footprint_bytes": 8100000000,
  "require_nominal_power_state": true,
  "between_cells_seconds": 60,
  "model_reservation_wait_seconds": 1800,
  "arms": {
    "reference": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
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
        "SLOTSTREAM_EMBEDDING_ROWS": "0"
      }
    },
    "combined": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
      "chunk": 256,
      "env": {}
    }
  },
  "label": "integrated-actual-default-one-token",
  "classification": "Frozen combined paired qualification",
  "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/prose.txt",
  "fixture_sha256": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b",
  "max_tokens": 1,
  "minimum_output_tokens": 1,
  "acceptance": {
    "minimum_pairs": 5,
    "maximum_median_client_regression": 0.05,
    "minimum_positive_fraction": 0,
    "all_outputs_exact": true,
    "replacement_rounds": 0
  },
  "prefix_cache": {
    "expected_reused_tokens": {
      "reference": 0,
      "combined": 0
    },
    "retention_only": true
  },
  "work_constraints": {
    "reference": {
      "completePromptStores": {
        "min": 0,
        "max": 0
      },
      "completePromptHits": {
        "min": 0,
        "max": 0
      }
    },
    "combined": {
      "completePromptStores": {
        "min": 1,
        "max": 1
      },
      "completePromptHits": {
        "min": 0,
        "max": 0
      }
    }
  },
  "required_equal_work": [
    "prefillTokens",
    "decodeTokens",
    "draftedTokens",
    "verifyPasses"
  ],
  "warmup_fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt",
  "warmup_fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
  "stop_on_workspace_contention": true,
  "initial_workspace_quiet": {
    "stable_seconds": 180,
    "maximum_wait_seconds": 1800
  },
  "startup_acceptance": {
    "minimum_pairs": 5,
    "maximum_median_first_job_regression": 0.05,
    "all_outputs_exact": true
  },
  "frozen_binary_sha256": "7fb2cc0c6cccf93e8a589d02ce5aa839eea38140a1cb8f44cefeb10ec3f472f6"
}

````````````

## Artifact SHA-256 221aa4d19941fc0db65bf0979e7e499fe0b8b5f6fc4ebaf727d1e800610e2ef3

Encoding: `utf-8`. Original bytes: 7441.

````````````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
  "memory_gb": 8.1,
  "mtp": "off",
  "raw": true,
  "seed": 7,
  "rounds": 16,
  "comparison_basis": "fixed-pool",
  "maximum_sampled_footprint_bytes": 8100000000,
  "require_nominal_power_state": true,
  "between_cells_seconds": 60,
  "model_reservation_wait_seconds": 1800,
  "arms": {
    "reference": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
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
        "SLOTSTREAM_EMBEDDING_ROWS": "0"
      }
    },
    "combined": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "1",
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
        "SLOTSTREAM_OPT_MTP_TAIL": "1",
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
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "256",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1"
      }
    }
  },
  "label": "integrated-complete-repeat",
  "classification": "Frozen combined paired qualification",
  "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/prose.txt",
  "fixture_sha256": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b",
  "max_tokens": 16,
  "minimum_output_tokens": 16,
  "acceptance": {
    "minimum_pairs": 5,
    "minimum_median_client_reduction": 0.05,
    "minimum_positive_fraction": 0.8,
    "all_outputs_exact": true,
    "replacement_rounds": 0
  },
  "prefix_cache": {
    "expected_reused_tokens": {
      "reference": 0,
      "combined": 440
    },
    "complete_prompt": true,
    "expected_warmup_checkpoint_stores": {
      "reference": 0,
      "combined": 1
    }
  },
  "work_constraints": {
    "reference": {
      "completePromptHits": {
        "min": 0,
        "max": 0
      },
      "completePromptStores": {
        "min": 0,
        "max": 0
      }
    },
    "combined": {
      "completePromptHits": {
        "min": 1,
        "max": 1
      },
      "completePromptStores": {
        "min": 0,
        "max": 0
      },
      "prefillTokens": {
        "min": 0,
        "max": 0
      },
      "prefillRecords": {
        "min": 0,
        "max": 0
      }
    }
  },
  "required_equal_work": [
    "decodeTokens",
    "draftedTokens",
    "verifyPasses"
  ],
  "stop_on_workspace_contention": true,
  "initial_workspace_quiet": {
    "stable_seconds": 180,
    "maximum_wait_seconds": 1800
  },
  "startup_acceptance": {
    "minimum_pairs": 5,
    "maximum_median_first_job_regression": 0.05,
    "all_outputs_exact": true
  },
  "frozen_binary_sha256": "7fb2cc0c6cccf93e8a589d02ce5aa839eea38140a1cb8f44cefeb10ec3f472f6"
}

````````````

## Artifact SHA-256 2532ba4adc8b1b34fce180c2ed8094591f1612cbbf228ba0d2a0f012d83ab9c0

Encoding: `utf-8`. Original bytes: 7313.

````````````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
  "memory_gb": 8.1,
  "mtp": "off",
  "raw": true,
  "seed": 7,
  "rounds": 16,
  "comparison_basis": "fixed-pool",
  "maximum_sampled_footprint_bytes": 8100000000,
  "require_nominal_power_state": true,
  "between_cells_seconds": 60,
  "model_reservation_wait_seconds": 1800,
  "arms": {
    "reference": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
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
        "SLOTSTREAM_EMBEDDING_ROWS": "0"
      }
    },
    "combined": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "1",
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
        "SLOTSTREAM_OPT_MTP_TAIL": "1",
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
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "256",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1"
      }
    }
  },
  "label": "integrated-distinct-tail",
  "classification": "Frozen combined paired qualification",
  "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/prose-distinct-tail.txt",
  "fixture_sha256": "d13b427927e9266ae8a9949b85a704ff6439df50aea54bfd7b5bf46f12b7c784",
  "max_tokens": 16,
  "minimum_output_tokens": 16,
  "acceptance": {
    "minimum_pairs": 5,
    "minimum_median_client_reduction": 0.05,
    "minimum_positive_fraction": 0.8,
    "all_outputs_exact": true,
    "replacement_rounds": 0
  },
  "prefix_cache": {
    "expected_reused_tokens": {
      "reference": 0,
      "combined": 256
    },
    "partial_prefix": true
  },
  "warmup_fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/prose.txt",
  "warmup_fixture_sha256": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b",
  "work_constraints": {
    "reference": {
      "completePromptHits": {
        "min": 0,
        "max": 0
      },
      "prefillTokens": {
        "min": 445,
        "max": 445
      }
    },
    "combined": {
      "completePromptHits": {
        "min": 0,
        "max": 0
      },
      "prefillTokens": {
        "min": 189,
        "max": 189
      }
    }
  },
  "stop_on_workspace_contention": true,
  "initial_workspace_quiet": {
    "stable_seconds": 180,
    "maximum_wait_seconds": 1800
  },
  "startup_acceptance": {
    "minimum_pairs": 5,
    "maximum_median_first_job_regression": 0.05,
    "all_outputs_exact": true
  },
  "frozen_binary_sha256": "7fb2cc0c6cccf93e8a589d02ce5aa839eea38140a1cb8f44cefeb10ec3f472f6"
}

````````````

## Artifact SHA-256 9228b41920f5259380ae89d9266998a35a1c969e93b3241fa6ff06324e059c21

Encoding: `utf-8`. Original bytes: 6620.

````````````text
{
  "label": "long-decode-off",
  "classification": "Prospective bounded 512-output study; final composition proofs and guarded executor required",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "frozen_binary_sha256": "7fb2cc0c6cccf93e8a589d02ce5aa839eea38140a1cb8f44cefeb10ec3f472f6",
  "arms": {
    "reference": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
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
        "SLOTSTREAM_EMBEDDING_ROWS": "0"
      }
    },
    "combined": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
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
        "SLOTSTREAM_OPT_MTP_TAIL": "1",
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
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1"
      }
    }
  },
  "mtp": "off",
  "memory_gb": 10,
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
  "maximum_sampled_footprint_bytes": 10000000000,
  "abort_on_resource_failure": true,
  "stop_on_workspace_contention": true,
  "initial_workspace_quiet": {
    "stable_seconds": 180,
    "maximum_wait_seconds": 1800
  },
  "between_cells_seconds": 60,
  "model_reservation_wait_seconds": 1800,
  "timeout_seconds": 600,
  "acceptance": {
    "minimum_pairs": 8,
    "maximum_median_client_regression": 0.05,
    "minimum_positive_fraction": 0,
    "all_outputs_exact": true,
    "replacement_rounds": 0
  }
}

````````````

## Artifact SHA-256 821bf25eadd29ceda1fd1b44c0e3e898c90a7407b5b74a9b856b887980f0e267

Encoding: `utf-8`. Original bytes: 6696.

````````````text
{
  "label": "long-decode-on",
  "classification": "Prospective bounded 512-output study; final composition proofs and guarded executor required",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "frozen_binary_sha256": "7fb2cc0c6cccf93e8a589d02ce5aa839eea38140a1cb8f44cefeb10ec3f472f6",
  "arms": {
    "reference": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
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
        "SLOTSTREAM_DRAFT_DEPTH": "1"
      }
    },
    "combined": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
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
        "SLOTSTREAM_OPT_MTP_TAIL": "1",
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
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1",
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
  "between_cells_seconds": 60,
  "model_reservation_wait_seconds": 1800,
  "timeout_seconds": 600,
  "acceptance": {
    "minimum_pairs": 8,
    "maximum_median_client_regression": 0.05,
    "minimum_positive_fraction": 0,
    "all_outputs_exact": true,
    "replacement_rounds": 0
  }
}

````````````

## Artifact SHA-256 940227cce19e58e0b910330b942ddcd871abb66a73699e8529bd5494e3c2e2b1

Encoding: `utf-8`. Original bytes: 6698.

````````````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
  "memory_gb": 10,
  "mtp": "on",
  "raw": true,
  "seed": 7,
  "rounds": 16,
  "comparison_basis": "fixed-pool",
  "maximum_sampled_footprint_bytes": 10000000000,
  "require_nominal_power_state": true,
  "between_cells_seconds": 60,
  "model_reservation_wait_seconds": 1800,
  "arms": {
    "reference": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
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
        "SLOTSTREAM_EMBEDDING_ROWS": "0"
      }
    },
    "combined": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
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
        "SLOTSTREAM_OPT_MTP_TAIL": "1",
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
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1"
      }
    }
  },
  "label": "integrated-mtp-resource",
  "classification": "Frozen combined paired qualification",
  "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt",
  "fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
  "max_tokens": 16,
  "minimum_output_tokens": 16,
  "acceptance": {
    "minimum_pairs": 5,
    "maximum_median_client_regression": 0.05,
    "minimum_positive_fraction": 0,
    "all_outputs_exact": true,
    "replacement_rounds": 0,
    "minimum_active_savings_bytes": 300000000,
    "minimum_sampled_peak_savings_bytes": 200000000
  },
  "initial_workspace_quiet": {
    "stable_seconds": 180,
    "maximum_wait_seconds": 1800
  },
  "stop_on_workspace_contention": true,
  "startup_acceptance": {
    "minimum_pairs": 5,
    "maximum_median_first_job_regression": 0.05,
    "all_outputs_exact": true
  },
  "frozen_binary_sha256": "7fb2cc0c6cccf93e8a589d02ce5aa839eea38140a1cb8f44cefeb10ec3f472f6"
}

````````````

## Artifact SHA-256 d86c723d417a92c0e775ab26f9bb0d0ed32c4e600c13d8348ce887e01ae815cb

Encoding: `utf-8`. Original bytes: 6827.

````````````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
  "memory_gb": 8.1,
  "mtp": "off",
  "raw": true,
  "seed": 7,
  "rounds": 16,
  "comparison_basis": "fixed-pool",
  "maximum_sampled_footprint_bytes": 8100000000,
  "require_nominal_power_state": true,
  "between_cells_seconds": 60,
  "model_reservation_wait_seconds": 1800,
  "arms": {
    "reference": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
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
        "SLOTSTREAM_EMBEDDING_ROWS": "0"
      }
    },
    "combined": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
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
        "SLOTSTREAM_OPT_MTP_TAIL": "1",
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
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1"
      }
    }
  },
  "label": "integrated-sampled-short",
  "classification": "Frozen combined paired qualification",
  "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt",
  "fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
  "max_tokens": 16,
  "minimum_output_tokens": 16,
  "acceptance": {
    "minimum_pairs": 5,
    "maximum_median_client_regression": 0.05,
    "minimum_positive_fraction": 0,
    "all_outputs_exact": true,
    "replacement_rounds": 0,
    "minimum_active_savings_bytes": 300000000,
    "minimum_sampled_peak_savings_bytes": 200000000
  },
  "sampling": {
    "temperature": 0.7,
    "top_k": 40,
    "top_p": 0.8,
    "min_p": 0.05,
    "presence_penalty": 1.1
  },
  "initial_workspace_quiet": {
    "stable_seconds": 180,
    "maximum_wait_seconds": 1800
  },
  "stop_on_workspace_contention": true,
  "startup_acceptance": {
    "minimum_pairs": 5,
    "maximum_median_first_job_regression": 0.05,
    "all_outputs_exact": true
  },
  "frozen_binary_sha256": "7fb2cc0c6cccf93e8a589d02ce5aa839eea38140a1cb8f44cefeb10ec3f472f6"
}

````````````

## Artifact SHA-256 2401db6b56527439bc333f2e7d9de0df21cc407bedcd20670cbb81ed7a12ba6f

Encoding: `utf-8`. Original bytes: 6595.

````````````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
  "memory_gb": 8.1,
  "mtp": "off",
  "raw": true,
  "seed": 7,
  "rounds": 16,
  "comparison_basis": "fixed-pool",
  "maximum_sampled_footprint_bytes": 8100000000,
  "require_nominal_power_state": true,
  "between_cells_seconds": 60,
  "model_reservation_wait_seconds": 1800,
  "arms": {
    "reference": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
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
        "SLOTSTREAM_EMBEDDING_ROWS": "0"
      }
    },
    "combined": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
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
        "SLOTSTREAM_OPT_MTP_TAIL": "1",
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
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1"
      }
    }
  },
  "label": "integrated-short-one",
  "classification": "Frozen combined paired qualification",
  "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt",
  "fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
  "max_tokens": 1,
  "minimum_output_tokens": 1,
  "acceptance": {
    "minimum_pairs": 5,
    "minimum_median_client_reduction": 0.05,
    "minimum_positive_fraction": 0.8,
    "all_outputs_exact": true,
    "replacement_rounds": 0
  },
  "initial_workspace_quiet": {
    "stable_seconds": 180,
    "maximum_wait_seconds": 1800
  },
  "stop_on_workspace_contention": true,
  "startup_acceptance": {
    "minimum_pairs": 5,
    "maximum_median_first_job_regression": 0.05,
    "all_outputs_exact": true
  },
  "frozen_binary_sha256": "7fb2cc0c6cccf93e8a589d02ce5aa839eea38140a1cb8f44cefeb10ec3f472f6"
}

````````````

## Artifact SHA-256 a8a70fcb38dae58377d3bd4636d73816aeb1e3eb74091e9967c5c254bac6d226

Encoding: `utf-8`. Original bytes: 6699.

````````````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
  "memory_gb": 8.1,
  "mtp": "off",
  "raw": true,
  "seed": 7,
  "rounds": 16,
  "comparison_basis": "fixed-pool",
  "maximum_sampled_footprint_bytes": 8100000000,
  "require_nominal_power_state": true,
  "between_cells_seconds": 60,
  "model_reservation_wait_seconds": 1800,
  "arms": {
    "reference": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
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
        "SLOTSTREAM_EMBEDDING_ROWS": "0"
      }
    },
    "combined": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
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
        "SLOTSTREAM_OPT_MTP_TAIL": "1",
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
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1"
      }
    }
  },
  "label": "integrated-unique-prose",
  "classification": "Frozen combined paired qualification",
  "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/prose.txt",
  "fixture_sha256": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b",
  "max_tokens": 16,
  "minimum_output_tokens": 16,
  "acceptance": {
    "minimum_pairs": 5,
    "maximum_median_client_regression": 0.05,
    "minimum_positive_fraction": 0,
    "all_outputs_exact": true,
    "replacement_rounds": 0,
    "minimum_active_savings_bytes": 300000000,
    "minimum_sampled_peak_savings_bytes": 200000000
  },
  "initial_workspace_quiet": {
    "stable_seconds": 180,
    "maximum_wait_seconds": 1800
  },
  "stop_on_workspace_contention": true,
  "startup_acceptance": {
    "minimum_pairs": 5,
    "maximum_median_first_job_regression": 0.05,
    "all_outputs_exact": true
  },
  "frozen_binary_sha256": "7fb2cc0c6cccf93e8a589d02ce5aa839eea38140a1cb8f44cefeb10ec3f472f6"
}

````````````

## Artifact SHA-256 4bedbf93bac4ff6242923878cd980a2998d2f853167473f57d78c7f6ae73b10c

Encoding: `utf-8`. Original bytes: 7423.

````````````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
  "memory_gb": 8.1,
  "mtp": "off",
  "raw": true,
  "seed": 7,
  "rounds": 16,
  "comparison_basis": "fixed-pool",
  "maximum_sampled_footprint_bytes": 8100000000,
  "require_nominal_power_state": true,
  "between_cells_seconds": 60,
  "model_reservation_wait_seconds": 1800,
  "arms": {
    "reference": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
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
        "SLOTSTREAM_EMBEDDING_ROWS": "0"
      }
    },
    "combined": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "1",
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
        "SLOTSTREAM_OPT_MTP_TAIL": "1",
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
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "256",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1"
      }
    }
  },
  "label": "integrated-unique-with-retention",
  "classification": "Frozen combined paired qualification",
  "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/prose.txt",
  "fixture_sha256": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b",
  "max_tokens": 16,
  "minimum_output_tokens": 16,
  "acceptance": {
    "minimum_pairs": 5,
    "maximum_median_client_regression": 0.05,
    "minimum_positive_fraction": 0,
    "all_outputs_exact": true,
    "replacement_rounds": 0
  },
  "prefix_cache": {
    "expected_reused_tokens": {
      "reference": 0,
      "combined": 0
    },
    "retention_only": true
  },
  "work_constraints": {
    "reference": {
      "completePromptStores": {
        "min": 0,
        "max": 0
      },
      "completePromptHits": {
        "min": 0,
        "max": 0
      }
    },
    "combined": {
      "completePromptStores": {
        "min": 1,
        "max": 1
      },
      "completePromptHits": {
        "min": 0,
        "max": 0
      }
    }
  },
  "required_equal_work": [
    "prefillTokens",
    "decodeTokens",
    "draftedTokens",
    "verifyPasses"
  ],
  "warmup_fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt",
  "warmup_fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
  "stop_on_workspace_contention": true,
  "initial_workspace_quiet": {
    "stable_seconds": 180,
    "maximum_wait_seconds": 1800
  },
  "startup_acceptance": {
    "minimum_pairs": 5,
    "maximum_median_first_job_regression": 0.05,
    "all_outputs_exact": true
  },
  "frozen_binary_sha256": "7fb2cc0c6cccf93e8a589d02ce5aa839eea38140a1cb8f44cefeb10ec3f472f6"
}

````````````

## Artifact SHA-256 d4263eafeb78be2917b91830bf0ca5d2add3c5a970a9fd8eab7853033d8acf14

Encoding: `utf-8`. Original bytes: 4471.

````````````text
"""Model-free, exact control re-materialization for V349; never runs a study."""
from pathlib import Path
import copy,importlib.util,json,sys
ROOT=Path('/Users/carlos/Projects/slotstream');BASE=Path('/tmp/slotstream-optimization-execution');HERE=Path(__file__).resolve().parent
sys.path.insert(0,str(ROOT/'Tools'))
import optimization_campaign as c
from prefill_bench import digest
BINARY=ROOT/'.build/optimization/compact-tail-combined-build-v349/candidate/slotstream'
MODEL='/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit'
SELECTED=('SLOTSTREAM_OPT_NGRAM_ROWS','SLOTSTREAM_OPT_MTP_TAIL')

def materialize(name):
 if name not in c.PAIRED:raise ValueError('unknown fixed workload')
 build=c.bench.verified_build(BINARY)
 if build['identity']['binary_sha256']!='7fb2cc0c6cccf93e8a589d02ce5aa839eea38140a1cb8f44cefeb10ec3f472f6':raise ValueError('wrong candidate')
 original=c.materialize(c.read(c.TEMPLATES/(name+'.json')),BINARY,MODEL)
 original['frozen_binary_sha256']=build['identity']['binary_sha256']
 c.validate_paired_protocol(name,original)
 result=copy.deepcopy(original)
 for flag in SELECTED:
  if result['arms']['reference']['env'][flag]!='0':raise ValueError('reference changed')
  if name!='actual-default-one-token':
   if result['arms']['combined']['env'][flag]!='0':raise ValueError('original selected control changed')
   result['arms']['combined']['env'][flag]='1'
  elif result['arms']['combined']['env']!={}:raise ValueError('actual default must have no optimization overrides')
 return result

def validate(name,protocol):
 expected=materialize(name)
 if protocol!=expected:raise ValueError('workload, controls, build or acceptance differs from the bounded amendment')
 # Prove that reverting exactly these two independent controls reconstructs
 # the untouched frozen template; all dimensions and criteria remain identical.
 old=copy.deepcopy(protocol)
 if name!='actual-default-one-token':
  for flag in SELECTED:old['arms']['combined']['env'][flag]='0'
 c.validate_paired_protocol(name,old)
 return True

def prepare():
 out=HERE/'drafts';out.mkdir(exist_ok=False)
 build=c.bench.verified_build(BINARY)
 protocols={n:materialize(n) for n in c.PAIRED}
 for name,p in protocols.items():validate(name,p);c.write_new(out/(name+'.json'),p)
 spec=importlib.util.spec_from_file_location('long',BASE/'long-decode-measurement-v340/long_decode.py');long=importlib.util.module_from_spec(spec);spec.loader.exec_module(long)
 long_paths={}
 for mode,name in [('off','unique-prose'),('on','mtp-resource')]:
  p=long.materialize(protocols[name],mode)
  for flag in SELECTED:
   assert p['arms']['combined']['env'][flag]=='1' and p['arms']['reference']['env'][flag]=='0'
  destination=out/('long-'+mode+'.json');c.write_new(destination,p);long_paths[mode]={'path':str(destination),'sha256':digest(destination)}
 result={'classification':'Prepared selected-control drafts only. All original workload dimensions, acceptance bounds and actual-default empty environment are preserved; the two qualified optional controls alone become 1 in explicit combined arms. Original templates and all prior results remain immutable. New exact-build native proofs are missing; no launch or final-composition qualification is implied.',
 'model_launched':False,'activation_performed':False,'new_combined_native_qualified':False,'native_blocker':'V350 ordinary interrupted on OS pressure; MTP/recovery unrun.', 'other_optional_dispositions_pending':True,'build':build,'controller_sha256':digest(Path(__file__)),
 'template_sha256':{n:digest(c.TEMPLATES/(n+'.json')) for n in c.PAIRED},'paired_drafts':{n:{'path':str(out/(n+'.json')),'sha256':digest(out/(n+'.json'))} for n in c.PAIRED},
 'long_drafts':long_paths,'long_reporter_sha256':digest(BASE/'long-decode-measurement-v340/long_decode.py'),'requires_before_execution':['exact current native proofs','final optional dispositions','explicit proof-bound guarded executor','meaningful resource change and fresh exclusive Mac grant'],
 'remaining_lifetime_binding':'Both 60-request lifetimes retain the original V321 off10/on12GB capacity correction, public planner proof and all eight final paired prerequisites; not rematerialized or executed here.'}
 c.write_new(HERE/'preparation.json',result)
 print(json.dumps({k:result[k] for k in ['model_launched','activation_performed','new_combined_native_qualified','native_blocker','controller_sha256','long_reporter_sha256']},indent=2))
if __name__=='__main__':prepare()

````````````

## Artifact SHA-256 ce62c3ccc657cff8e86735aa08d3f2e576ab8c133190d0a1ccd47249f2864344

Encoding: `utf-8`. Original bytes: 1648.

````````````text
import copy,unittest
import controls as m

class ExactAmendment(unittest.TestCase):
 def test_all_eight_reconstruct_original_templates(self):
  for n in m.c.PAIRED:self.assertTrue(m.validate(n,m.materialize(n)))
 def test_actual_default_remains_unforced(self):
  p=m.materialize('actual-default-one-token');self.assertEqual(p['arms']['combined']['env'],{})
  p['arms']['combined']['env']['SLOTSTREAM_OPT_NGRAM_ROWS']='1'
  with self.assertRaises(ValueError):m.validate('actual-default-one-token',p)
 def test_reference_and_composition_changes_rejected(self):
  for side,value in [('reference','1'),('combined','0')]:
   for flag in m.SELECTED:
    p=m.materialize('mtp-resource');p['arms'][side]['env'][flag]=value
    with self.assertRaises(ValueError):m.validate('mtp-resource',p)
 def test_changed_criteria_workload_or_build_rejected(self):
  for field,value in [('max_tokens',2),('memory_gb',20),('rounds',32),('frozen_binary_sha256','wrong')]:
   p=m.materialize('unique-prose');p[field]=value
   with self.assertRaises(ValueError):m.validate('unique-prose',p)
  p=m.materialize('unique-prose');p['acceptance']['maximum_median_client_regression']=.10
  with self.assertRaises(ValueError):m.validate('unique-prose',p)
 def test_mtp_depth_and_adaptive_policy_are_not_added(self):
  p=m.materialize('mtp-resource')
  for arm in p['arms'].values():
   self.assertEqual(arm['env']['SLOTSTREAM_DRAFT_DEPTH'],'1');self.assertEqual(arm['env']['SLOTSTREAM_OPT_ADAPTIVE_MTP'],'0')
  p['arms']['combined']['env']['SLOTSTREAM_OPT_ADAPTIVE_MTP']='1'
  with self.assertRaises(ValueError):m.validate('mtp-resource',p)
if __name__=='__main__':unittest.main()

````````````

## Artifact SHA-256 45e800559f1bf97ac2f04e34243336da60ecc6fd7ccd6350d53ac9b1846f2ce6

Encoding: `utf-8`. Original bytes: 441.

````````````text
{
  "stage": "model-free protocol preparation",
  "model_launched": false,
  "error": "V340 requires explicit MTP draft depth one; original matrix controls use implicit Generator default one. Initial depth-assumption test fails; partial eight paired and one plain-long draft retained.",
  "correction": "Keep original matrix inputs unchanged, explicitly bind depth one in the separate long MTP draft. No criteria or observations changed."
}

````````````

## Artifact SHA-256 909d5f53ed60a53c54cae02aa723738b9877f54eee512eb44760d3e7375dd258

Encoding: `utf-8`. Original bytes: 694.

````````````text
...E.
======================================================================
ERROR: test_mtp_depth_and_adaptive_policy_are_not_added (__main__.ExactAmendment)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/compact-tail-controls-v352/controls_test.py", line 25, in test_mtp_depth_and_adaptive_policy_are_not_added
    self.assertEqual(arm['env']['SLOTSTREAM_DRAFT_DEPTH'],'1');self.assertEqual(arm['env']['SLOTSTREAM_OPT_ADAPTIVE_MTP'],'0')
KeyError: 'SLOTSTREAM_DRAFT_DEPTH'

----------------------------------------------------------------------
Ran 5 tests in 2.233s

FAILED (errors=1)

````````````

## Artifact SHA-256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

Encoding: `utf-8`. Original bytes: 0.

````````````text

````````````

## Artifact SHA-256 e651ba674bc3664ed6409643df0b85434aa0699934ed14f596b16a7614d58e3d

Encoding: `utf-8`. Original bytes: 23978.

````````````text
{
  "classification": "Prepared selected-control drafts only. All original workload dimensions, acceptance bounds and actual-default empty environment are preserved; the two qualified optional controls alone become 1 in explicit combined arms. Original templates and all prior results remain immutable. New exact-build native proofs are missing; no launch or final-composition qualification is implied.",
  "model_launched": false,
  "activation_performed": false,
  "new_combined_native_qualified": false,
  "native_blocker": "V350 ordinary interrupted on OS pressure; MTP/recovery unrun.",
  "other_optional_dispositions_pending": true,
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
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
        "Sources/Slotstream/Layers.swift": "7d4c74e589ed681094bd9570e1d550f5c9fe4ecd9e171bb6360d2e0dab4b46a9",
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
        "Sources/Slotstream/Optimizations.swift": "b31945de9dbedd9f0dd4beb39be7d31a6673f18c21619ab1847e5d81ad82c12e",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "512dd096a194f8c56f1d9be16931714035150ca54cbb02cbbb9d0aec5871657d",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "6c34e92eac7476ea5f7a1126ea6bf0eb5eb9b5b9fca8659cc28c2f760476dadf",
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
      "source_archive_sha256": "ff2a4c967bd785261e792d88c63a2d2f71d875e28429c136c258be7e4d58193e",
      "binary_sha256": "7fb2cc0c6cccf93e8a589d02ce5aa839eea38140a1cb8f44cefeb10ec3f472f6",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "controller_sha256": "8d7c667a27e3695c93d4c626d101400f6883508a170a93e5a2ce7b5e93808470",
  "template_sha256": {
    "short-one": "5c736b2eec31378f0b3d2beb64d20561569ce8dfd765e363afde72b0755278a9",
    "unique-prose": "6831b8f47138d175f28ac9716bacaa8c937515a970df709393004bff84a45c35",
    "sampled-short": "ec97a77e98417def8f7489b5fd58ded65790659e15ebe6f4d2328c8688d76a7a",
    "mtp-resource": "5a0c57424e2097b5ec7b4199dd9ae28d40e24f6c4eef24d13098f3ce8d652613",
    "distinct-tail": "7d80ab65e1ed821e24922c050afc4ff24b83f9e3a2b560383efd4e7868aad59e",
    "complete-repeat": "9b8308d23621b55ae70dfb34258571ed00a97c9ea2932127aa787d438085ba6e",
    "unique-with-retention": "0b2593dab6a12e10226dd94d60c43d40b085160b2c23680b79545d7fe41dbb2d",
    "actual-default-one-token": "8481bffb4721fbd594eca609506308480e7979a486c327732cba6ff138daf26b"
  },
  "paired_drafts": {
    "short-one": {
      "path": "/private/tmp/slotstream-optimization-execution/compact-tail-controls-v352/drafts/short-one.json",
      "sha256": "2401db6b56527439bc333f2e7d9de0df21cc407bedcd20670cbb81ed7a12ba6f"
    },
    "unique-prose": {
      "path": "/private/tmp/slotstream-optimization-execution/compact-tail-controls-v352/drafts/unique-prose.json",
      "sha256": "a8a70fcb38dae58377d3bd4636d73816aeb1e3eb74091e9967c5c254bac6d226"
    },
    "sampled-short": {
      "path": "/private/tmp/slotstream-optimization-execution/compact-tail-controls-v352/drafts/sampled-short.json",
      "sha256": "d86c723d417a92c0e775ab26f9bb0d0ed32c4e600c13d8348ce887e01ae815cb"
    },
    "mtp-resource": {
      "path": "/private/tmp/slotstream-optimization-execution/compact-tail-controls-v352/drafts/mtp-resource.json",
      "sha256": "940227cce19e58e0b910330b942ddcd871abb66a73699e8529bd5494e3c2e2b1"
    },
    "distinct-tail": {
      "path": "/private/tmp/slotstream-optimization-execution/compact-tail-controls-v352/drafts/distinct-tail.json",
      "sha256": "2532ba4adc8b1b34fce180c2ed8094591f1612cbbf228ba0d2a0f012d83ab9c0"
    },
    "complete-repeat": {
      "path": "/private/tmp/slotstream-optimization-execution/compact-tail-controls-v352/drafts/complete-repeat.json",
      "sha256": "221aa4d19941fc0db65bf0979e7e499fe0b8b5f6fc4ebaf727d1e800610e2ef3"
    },
    "unique-with-retention": {
      "path": "/private/tmp/slotstream-optimization-execution/compact-tail-controls-v352/drafts/unique-with-retention.json",
      "sha256": "4bedbf93bac4ff6242923878cd980a2998d2f853167473f57d78c7f6ae73b10c"
    },
    "actual-default-one-token": {
      "path": "/private/tmp/slotstream-optimization-execution/compact-tail-controls-v352/drafts/actual-default-one-token.json",
      "sha256": "cc1d6c295700949d8cd1d2695bb88f80ddd62ca6376fff7e659fb6b9faed51d5"
    }
  },
  "long_drafts": {
    "off": {
      "path": "/private/tmp/slotstream-optimization-execution/compact-tail-controls-v352/drafts/long-off.json",
      "sha256": "9228b41920f5259380ae89d9266998a35a1c969e93b3241fa6ff06324e059c21"
    },
    "on": {
      "path": "/private/tmp/slotstream-optimization-execution/compact-tail-controls-v352/drafts/long-on.json",
      "sha256": "821bf25eadd29ceda1fd1b44c0e3e898c90a7407b5b74a9b856b887980f0e267"
    }
  },
  "long_explicit_depth": "MTP arms explicitly set SLOTSTREAM_DRAFT_DEPTH=1, matching the actual Generator default at Generate.swift lines361-366. Original eight paired templates remain unchanged except the two selected controls.",
  "long_reporter_sha256": "0de842221b705401cc724b10506bf2af2012be33b253a674bee4ab1af4772820",
  "requires_before_execution": [
    "exact current native proofs",
    "final optional dispositions",
    "explicit proof-bound guarded executor",
    "meaningful resource change and fresh exclusive Mac grant"
  ],
  "remaining_lifetime_binding": "Both 60-request lifetimes retain the original V321 off10/on12GB capacity correction, public planner proof and all eight final paired prerequisites; not rematerialized or executed here."
}

````````````

## Artifact SHA-256 881ad7429ac21b2f20439667cbc5c0e84fa133ef8ee81890e8b31c4d71e6592b

Encoding: `utf-8`. Original bytes: 104.

````````````text
......
----------------------------------------------------------------------
Ran 6 tests in 2.339s

OK

````````````
