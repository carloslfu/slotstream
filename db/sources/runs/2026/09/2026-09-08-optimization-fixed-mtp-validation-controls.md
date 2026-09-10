---
type: run
id: 01m20kdd1e636zg2mndbmen5gq
created: 2026-09-08T13:30:41.070258+00:00
updated: 2026-09-08T13:30:41.743420+00:00
summary: Final study drafts preserve compact rows and the original MTP schedule
binary: V360 7a132a2fc2270d8f3695e7d740abbebd22ac0d79b80562c7c47aa73a143e24ea
captured_at: 2026-09-08
command: V363 controls_test.py -v, then controls.py; no study launch
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Final study drafts preserve compact rows and the original MTP schedule
tool: Slotstream exact native and source qualification capture
---
V363 prepares all eight original paired-workload drafts and both original 512-output long-decoding drafts for exact V360. Explicit combined arms select only the added NGRAM_ROWS=1 relative to the frozen baseline templates; rejected MTP_TAIL stays0 in both arms. The actual-default combined environment remains empty. Reverting the one selected cache control reconstructs the original templates exactly, including all prompts, output counts, memory targets, round counts, work conditions, startup/request bounds, cooldowns and zero-replacement policy.

Seven model-free tests pass. They reject changed reference/composition/default controls, budgets, workload dimensions, build identity, acceptance thresholds, adaptive policy and fixed depth. The added test requires MTP tail off across every explicit matrix arm and both long studies, and rejects re-enabling it. Long MTP still explicitly fixes draft depth1 without mutating the original eight-workload matrix. The V340 long reporter SHA-256 remains 0de842221b705401cc724b10506bf2af2012be33b253a674bee4ab1af4772820.

These are prospective drafts, not final campaign qualification. At preparation the V361 full MTP rerun has passed all327 assertions; ordinary and recovery are still pending, alongside optional scope/image/vision dispositions. No paired or long study is frozen against qualification evidence or executed here. The older V352 tail-on drafts and V357 executor are preserved; the latter needs corrected control/native-assessor binding before use. Both original60-request lifetimes and every original final gate remain required. No activation occurs. The native counterexample and correction are recorded in [[sources/runs/2026/09/2026-09-08-optimization-compact-tail-native-counterexample]] and [[sources/runs/2026/09/2026-09-08-optimization-mtp-verification-shape-correction]].

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-controls-v363/controls.py",
    "bytes": 5267,
    "sha256": "4856948acf43d38c37ed6fb786ec6b6c6310da688bb4a3face070ea2de588e67"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-controls-v363/controls_test.py",
    "bytes": 2889,
    "sha256": "2a167574038d922526a0d66ce51c0f935047a1a82ca49e543de20e23934971e0"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-controls-v363/drafts/actual-default-one-token.json",
    "bytes": 5002,
    "sha256": "cf0c7db87df3bc6dbebe137da2d0aae316804de3085d1ff73bb9debd850fbefc"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-controls-v363/drafts/complete-repeat.json",
    "bytes": 7447,
    "sha256": "0cd74548ad0a15d7798e80bc76cd0f50b65382c5aa844f180024a2716870e503"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-controls-v363/drafts/distinct-tail.json",
    "bytes": 7319,
    "sha256": "b8c590ee8ffa0661e1ba8d41507d79a07793e5912d155bc4feb7cacef3ff7a52"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-controls-v363/drafts/long-off.json",
    "bytes": 6626,
    "sha256": "2e374012d227a17d2e4736a04f5a3bc8013943f1045db808631d93f58a96fb8a"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-controls-v363/drafts/long-on.json",
    "bytes": 6702,
    "sha256": "dc9e155026d4229c419e1efa04a249df11bab4194431908d5056efae7d862aec"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-controls-v363/drafts/mtp-resource.json",
    "bytes": 6704,
    "sha256": "8747f2dbfce0be7f4a92f1014c4504d1335737b7c9e88efcde5b482a400e6ed1"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-controls-v363/drafts/sampled-short.json",
    "bytes": 6833,
    "sha256": "3ccdc1daf1d0890a56ba1dcdd67a277e5ccd3e3700d6b50f7b72e51a67ab993f"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-controls-v363/drafts/short-one.json",
    "bytes": 6601,
    "sha256": "ad128e631d0cdc6315062ecf25196bbbf3048d9ff54630e5076bffb547e7c952"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-controls-v363/drafts/unique-prose.json",
    "bytes": 6705,
    "sha256": "59220ab147ea17bdb6b121688f452ce5f3c80263f1d6e5109670f63fe08172a3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-controls-v363/drafts/unique-with-retention.json",
    "bytes": 7429,
    "sha256": "4ba6f2c83f8c8871658f64b434162344aaeb9518e1301c4e6a0cbab9c59a696f"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-controls-v363/preparation.json",
    "bytes": 24137,
    "sha256": "4554b2ba4909ce3cb1fab93a90fb7f834fe3ed72ecf7065f31af50c0d31b8924"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-controls-v363/tests.stderr.txt",
    "bytes": 667,
    "sha256": "41cb8df67bd557e3bd0c07e5bf1c157ee4921f31dc38c04b3cd70443e3b37bcc"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-controls-v363/tests.stdout.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  }
]
```

## Artifact SHA-256 4856948acf43d38c37ed6fb786ec6b6c6310da688bb4a3face070ea2de588e67

Encoding: `utf-8`. Original bytes: 5267.

````````````text
"""Model-free, exact control re-materialization for V360; never runs a study."""
from pathlib import Path
import copy,importlib.util,json,sys
ROOT=Path('/Users/carlos/Projects/slotstream');BASE=Path('/tmp/slotstream-optimization-execution');HERE=Path(__file__).resolve().parent
sys.path.insert(0,str(ROOT/'Tools'))
import optimization_campaign as c
from prefill_bench import digest
BINARY=ROOT/'.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream'
MODEL='/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit'
SELECTED=('SLOTSTREAM_OPT_NGRAM_ROWS',)

def materialize(name):
 if name not in c.PAIRED:raise ValueError('unknown fixed workload')
 build=c.bench.verified_build(BINARY)
 if build['identity']['binary_sha256']!='7a132a2fc2270d8f3695e7d740abbebd22ac0d79b80562c7c47aa73a143e24ea':raise ValueError('wrong candidate')
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
 for arm_name,arm in result['arms'].items():
  if name!='actual-default-one-token' or arm_name=='reference':
   if arm['env']['SLOTSTREAM_OPT_MTP_TAIL']!='0':raise ValueError('rejected MTP tail enabled')
 return result

def validate(name,protocol):
 expected=materialize(name)
 if protocol!=expected:raise ValueError('workload, controls, build or acceptance differs from the bounded amendment')
 # Prove that reverting exactly this independent control reconstructs
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
 result={'classification':'Prepared selected-control drafts only. All original workload dimensions, acceptance bounds and actual-default empty environment are preserved; only compact BF16 rows become 1; rejected MTP tail stays 0 in explicit combined arms. Original templates and all prior results remain immutable. New exact-build native proofs are missing; no launch or final-composition qualification is implied.',
 'model_launched':False,'activation_performed':False,'new_combined_native_qualified':False,'native_blocker':'V361 full MTP327 now passes; ordinary and recovery still pending for this exact build.', 'other_optional_dispositions_pending':True,'build':build,'controller_sha256':digest(Path(__file__)),
 'template_sha256':{n:digest(c.TEMPLATES/(n+'.json')) for n in c.PAIRED},'paired_drafts':{n:{'path':str(out/(n+'.json')),'sha256':digest(out/(n+'.json'))} for n in c.PAIRED},
 'long_drafts':long_paths,'long_explicit_depth':'MTP arms explicitly set SLOTSTREAM_DRAFT_DEPTH=1, matching the actual Generator default at Generate.swift lines361-366. Original eight paired templates remain unchanged except compact BF16 rows; MTP tail remains off.','long_reporter_sha256':digest(BASE/'long-decode-measurement-v340/long_decode.py'),'requires_before_execution':['exact current native proofs','final optional dispositions','explicit proof-bound guarded executor','meaningful resource change and fresh exclusive Mac grant'],
 'remaining_lifetime_binding':'Both 60-request lifetimes retain the original V321 off10/on12GB capacity correction, public planner proof and all eight final paired prerequisites; not rematerialized or executed here.'}
 c.write_new(HERE/'preparation.json',result)
 print(json.dumps({k:result[k] for k in ['model_launched','activation_performed','new_combined_native_qualified','native_blocker','controller_sha256','long_reporter_sha256']},indent=2))
if __name__=='__main__':prepare()

````````````

## Artifact SHA-256 2a167574038d922526a0d66ce51c0f935047a1a82ca49e543de20e23934971e0

Encoding: `utf-8`. Original bytes: 2889.

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
 def test_rejected_tail_stays_off_in_matrix_and_long_studies(self):
  for name in m.c.PAIRED:
   p=m.materialize(name)
   for side in p['arms']:
    if name=='actual-default-one-token' and side=='combined':continue
    self.assertEqual(p['arms'][side]['env']['SLOTSTREAM_OPT_MTP_TAIL'],'0')
    changed=copy.deepcopy(p);changed['arms'][side]['env']['SLOTSTREAM_OPT_MTP_TAIL']='1'
    with self.assertRaises(ValueError):m.validate(name,changed)
  for mode,name in [('off','unique-prose'),('on','mtp-resource')]:
   p=m.materialize_long(m.materialize(name),mode)
   self.assertEqual(p['max_tokens'],512)
   for arm in p['arms'].values():self.assertEqual(arm['env']['SLOTSTREAM_OPT_MTP_TAIL'],'0')
if __name__=='__main__':unittest.main()

````````````

## Artifact SHA-256 cf0c7db87df3bc6dbebe137da2d0aae316804de3085d1ff73bb9debd850fbefc

Encoding: `utf-8`. Original bytes: 5002.

````````````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
  "frozen_binary_sha256": "7a132a2fc2270d8f3695e7d740abbebd22ac0d79b80562c7c47aa73a143e24ea"
}

````````````

## Artifact SHA-256 0cd74548ad0a15d7798e80bc76cd0f50b65382c5aa844f180024a2716870e503

Encoding: `utf-8`. Original bytes: 7447.

````````````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
  "frozen_binary_sha256": "7a132a2fc2270d8f3695e7d740abbebd22ac0d79b80562c7c47aa73a143e24ea"
}

````````````

## Artifact SHA-256 b8c590ee8ffa0661e1ba8d41507d79a07793e5912d155bc4feb7cacef3ff7a52

Encoding: `utf-8`. Original bytes: 7319.

````````````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
  "frozen_binary_sha256": "7a132a2fc2270d8f3695e7d740abbebd22ac0d79b80562c7c47aa73a143e24ea"
}

````````````

## Artifact SHA-256 2e374012d227a17d2e4736a04f5a3bc8013943f1045db808631d93f58a96fb8a

Encoding: `utf-8`. Original bytes: 6626.

````````````text
{
  "label": "long-decode-off",
  "classification": "Prospective bounded 512-output study; final composition proofs and guarded executor required",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "frozen_binary_sha256": "7a132a2fc2270d8f3695e7d740abbebd22ac0d79b80562c7c47aa73a143e24ea",
  "arms": {
    "reference": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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

## Artifact SHA-256 dc9e155026d4229c419e1efa04a249df11bab4194431908d5056efae7d862aec

Encoding: `utf-8`. Original bytes: 6702.

````````````text
{
  "label": "long-decode-on",
  "classification": "Prospective bounded 512-output study; final composition proofs and guarded executor required",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "frozen_binary_sha256": "7a132a2fc2270d8f3695e7d740abbebd22ac0d79b80562c7c47aa73a143e24ea",
  "arms": {
    "reference": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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

## Artifact SHA-256 8747f2dbfce0be7f4a92f1014c4504d1335737b7c9e88efcde5b482a400e6ed1

Encoding: `utf-8`. Original bytes: 6704.

````````````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
  "frozen_binary_sha256": "7a132a2fc2270d8f3695e7d740abbebd22ac0d79b80562c7c47aa73a143e24ea"
}

````````````

## Artifact SHA-256 3ccdc1daf1d0890a56ba1dcdd67a277e5ccd3e3700d6b50f7b72e51a67ab993f

Encoding: `utf-8`. Original bytes: 6833.

````````````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
  "frozen_binary_sha256": "7a132a2fc2270d8f3695e7d740abbebd22ac0d79b80562c7c47aa73a143e24ea"
}

````````````

## Artifact SHA-256 ad128e631d0cdc6315062ecf25196bbbf3048d9ff54630e5076bffb547e7c952

Encoding: `utf-8`. Original bytes: 6601.

````````````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
  "frozen_binary_sha256": "7a132a2fc2270d8f3695e7d740abbebd22ac0d79b80562c7c47aa73a143e24ea"
}

````````````

## Artifact SHA-256 59220ab147ea17bdb6b121688f452ce5f3c80263f1d6e5109670f63fe08172a3

Encoding: `utf-8`. Original bytes: 6705.

````````````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
  "frozen_binary_sha256": "7a132a2fc2270d8f3695e7d740abbebd22ac0d79b80562c7c47aa73a143e24ea"
}

````````````

## Artifact SHA-256 4ba6f2c83f8c8871658f64b434162344aaeb9518e1301c4e6a0cbab9c59a696f

Encoding: `utf-8`. Original bytes: 7429.

````````````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
  "frozen_binary_sha256": "7a132a2fc2270d8f3695e7d740abbebd22ac0d79b80562c7c47aa73a143e24ea"
}

````````````

## Artifact SHA-256 4554b2ba4909ce3cb1fab93a90fb7f834fe3ed72ecf7065f31af50c0d31b8924

Encoding: `utf-8`. Original bytes: 24137.

````````````text
{
  "classification": "Prepared selected-control drafts only. All original workload dimensions, acceptance bounds and actual-default empty environment are preserved; only compact BF16 rows become 1; rejected MTP tail stays 0 in explicit combined arms. Original templates and all prior results remain immutable. New exact-build native proofs are missing; no launch or final-composition qualification is implied.",
  "model_launched": false,
  "activation_performed": false,
  "new_combined_native_qualified": false,
  "native_blocker": "V361 full MTP327 now passes; ordinary and recovery still pending for this exact build.",
  "other_optional_dispositions_pending": true,
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
        "Sources/Slotstream/Generate.swift": "9bd9619a98aa62685be2de5148942455456b5d30fcf18e5a384148a4ae313da2",
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
        "Sources/Slotstream/Optimizations.swift": "c676838c165ca4a9de74fc763bc03282628db4e58ab5f90e211c276d5ffe9729",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "5eb2132959b1db779caa520a3eefe5d6c5ffdd9ed317750c8cee48f02bd05941",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "91a2f69fa21063719c9eed2cb91708bad92fbd0e306a61d50be662774db21767",
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
      "source_archive_sha256": "31f5718f308621dbbac08fe2994e9deb8691de28a1e61fd551857a00c5af5be2",
      "binary_sha256": "7a132a2fc2270d8f3695e7d740abbebd22ac0d79b80562c7c47aa73a143e24ea",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "controller_sha256": "4856948acf43d38c37ed6fb786ec6b6c6310da688bb4a3face070ea2de588e67",
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
      "path": "/private/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-controls-v363/drafts/short-one.json",
      "sha256": "ad128e631d0cdc6315062ecf25196bbbf3048d9ff54630e5076bffb547e7c952"
    },
    "unique-prose": {
      "path": "/private/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-controls-v363/drafts/unique-prose.json",
      "sha256": "59220ab147ea17bdb6b121688f452ce5f3c80263f1d6e5109670f63fe08172a3"
    },
    "sampled-short": {
      "path": "/private/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-controls-v363/drafts/sampled-short.json",
      "sha256": "3ccdc1daf1d0890a56ba1dcdd67a277e5ccd3e3700d6b50f7b72e51a67ab993f"
    },
    "mtp-resource": {
      "path": "/private/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-controls-v363/drafts/mtp-resource.json",
      "sha256": "8747f2dbfce0be7f4a92f1014c4504d1335737b7c9e88efcde5b482a400e6ed1"
    },
    "distinct-tail": {
      "path": "/private/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-controls-v363/drafts/distinct-tail.json",
      "sha256": "b8c590ee8ffa0661e1ba8d41507d79a07793e5912d155bc4feb7cacef3ff7a52"
    },
    "complete-repeat": {
      "path": "/private/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-controls-v363/drafts/complete-repeat.json",
      "sha256": "0cd74548ad0a15d7798e80bc76cd0f50b65382c5aa844f180024a2716870e503"
    },
    "unique-with-retention": {
      "path": "/private/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-controls-v363/drafts/unique-with-retention.json",
      "sha256": "4ba6f2c83f8c8871658f64b434162344aaeb9518e1301c4e6a0cbab9c59a696f"
    },
    "actual-default-one-token": {
      "path": "/private/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-controls-v363/drafts/actual-default-one-token.json",
      "sha256": "cf0c7db87df3bc6dbebe137da2d0aae316804de3085d1ff73bb9debd850fbefc"
    }
  },
  "long_drafts": {
    "off": {
      "path": "/private/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-controls-v363/drafts/long-off.json",
      "sha256": "2e374012d227a17d2e4736a04f5a3bc8013943f1045db808631d93f58a96fb8a"
    },
    "on": {
      "path": "/private/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-controls-v363/drafts/long-on.json",
      "sha256": "dc9e155026d4229c419e1efa04a249df11bab4194431908d5056efae7d862aec"
    }
  },
  "long_explicit_depth": "MTP arms explicitly set SLOTSTREAM_DRAFT_DEPTH=1, matching the actual Generator default at Generate.swift lines361-366. Original eight paired templates remain unchanged except compact BF16 rows; MTP tail remains off.",
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

## Artifact SHA-256 41cb8df67bd557e3bd0c07e5bf1c157ee4921f31dc38c04b3cd70443e3b37bcc

Encoding: `utf-8`. Original bytes: 667.

````````````text
test_actual_default_remains_unforced (__main__.ExactAmendment) ... ok
test_all_eight_reconstruct_original_templates (__main__.ExactAmendment) ... ok
test_changed_criteria_workload_or_build_rejected (__main__.ExactAmendment) ... ok
test_long_mtp_depth_explicit_without_mutating_matrix (__main__.ExactAmendment) ... ok
test_mtp_depth_and_adaptive_policy_are_not_added (__main__.ExactAmendment) ... ok
test_reference_and_composition_changes_rejected (__main__.ExactAmendment) ... ok
test_rejected_tail_stays_off_in_matrix_and_long_studies (__main__.ExactAmendment) ... ok

----------------------------------------------------------------------
Ran 7 tests in 4.364s

OK

````````````

## Artifact SHA-256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

Encoding: `utf-8`. Original bytes: 0.

````````````text

````````````
