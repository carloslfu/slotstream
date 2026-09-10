---
type: run
id: 01m224yx0xngn4wwmngqm3h1ty
created: 2026-09-09T03:56:34.717855+00:00
updated: 2026-09-09T03:56:35.296053+00:00
summary: Optimization native tests resume after verified memory recovery
binary: /Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream
captured_at: 2026-09-08
command: V444 original combined-plain native begins after its unchanged startup check; V459 checks.py and run.py prepare/check only
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Optimization native tests resume after verified memory recovery
tool: Slotstream exact native and source qualification capture
---
The user requested continuation after a material increase in available memory. V444 ordinary integration starts with 29,569,335,296 reclaimable bytes, compared with 17,534,091,264 at the blocked audit. V459 preserves both V439 pressure-stopped lifecycle/MTP identities and prepares only fresh full successors for those two cases. Its original workload/policy/commands/assessment/run functions remain AST-identical; 11 model-free checks pass. The two passing V439 geometry cases are not scheduled again. Every next launch independently retains the original resource guards and complete time allowance. No performance result, final default selection or activation is claimed.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-resumed-native-v459/checks.py",
    "bytes": 4192,
    "sha256": "df974d9d60f0a82e443f3e3b468a1deff9e545f65261fee26c625091c063bc6e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-resumed-native-v459/checks.stderr",
    "bytes": 962,
    "sha256": "37ee428b1c13035e48ac807fd22239eba9c9e46939641af02f9707f3f922746f"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-resumed-native-v459/checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-resumed-native-v459/preparation.json",
    "bytes": 30975,
    "sha256": "838729106816afdaa83240e4731a362ab71b04a86e1a0e84dcddc0ba483f81d6"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-resumed-native-v459/run.py",
    "bytes": 13907,
    "sha256": "8128cc7717c7cb20d67123a17dd948de20c344df4def07aa16fc743025ce61f3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/resource-resume-v458/current-native-attempt.json",
    "bytes": 23156,
    "sha256": "c530d0c0d169df0ddfcf9869c2d69d7dbb2cf7a43b9596d0edddd601c02af6cf"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/resource-resume-v458/previous-resource.json",
    "bytes": 2546,
    "sha256": "44bf464198c7a7ebdde08a36dd1a9997d939689d31071916a5f25744a7e48fb8"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/resource-resume-v458/resource-change.json",
    "bytes": 1093,
    "sha256": "1dda4a620b4bac4ee90300ff28e0d10dab38af20eb1a7863ba3c1f98d15e164e"
  }
]
```

## Artifact SHA-256 df974d9d60f0a82e443f3e3b468a1deff9e545f65261fee26c625091c063bc6e

Encoding: `utf-8`. Original bytes: 4192.

````````````text
import copy,importlib.util,json,unittest
from pathlib import Path
HERE=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('automatic_scope_native_driver',HERE/'run.py');driver=importlib.util.module_from_spec(spec);spec.loader.exec_module(driver)
OLD=driver.ROOT/'.build/optimization/scope-allocation-scope-native-v404'
METRICS={'scope-lifecycle':{'automatic_planner_geometries':3,'automatic_memory_fallbacks':2},'scope-mtp-vision':{'automatic_mtp_planner_geometries':3,'automatic_mtp_prompt_tokens':4096}}
class Checks(unittest.TestCase):
 def report(self,name,new=True):
  r=json.loads((OLD/name/'stdout.txt').read_text())
  if new:
   r['measurements'].update(METRICS.get(name,{}))
   r['items'] += [{'name':key,'passed':True} for key in sorted(driver.required_new_assertions(name))]
  return r
 def test_original_family_reports_still_pass(self):
  for name in ['scope-family-2051','scope-family-4096']:
   self.assertTrue(driver.assess(name,self.report(name))['qualified'])
 def test_complete_synthetic_delivery_is_accepted_without_launch(self):
  for name in METRICS:
   self.assertTrue(driver.assess(name,self.report(name))['qualified'])
 def test_original_reports_cannot_substitute_for_new_native_cases(self):
  for name in METRICS:
   with self.assertRaises(ValueError):driver.assess(name,self.report(name,new=False))
 def test_summary_metrics_without_new_assertions_are_rejected(self):
  for name,m in METRICS.items():
   r=self.report(name,new=False);r['measurements'].update(m)
   with self.assertRaises(ValueError):driver.assess(name,r)
 def test_each_new_metric_must_match_exactly(self):
  for name,metrics in METRICS.items():
   for key,value in metrics.items():
    for bad in [None,0,value-1]:
     with self.subTest(name=name,key=key,bad=bad):
      r=self.report(name);r['measurements'][key]=bad
      with self.assertRaises(ValueError):driver.assess(name,r)
 def test_each_new_assertion_is_mandatory(self):
  for name in METRICS:
   r=self.report(name)
   for key in driver.required_new_assertions(name):
    d=copy.deepcopy(r);d['items']=[i for i in d['items'] if i['name']!=key]
    with self.subTest(name=name,key=key),self.assertRaises(ValueError):driver.assess(name,d)
 def test_original_assertions_cannot_disappear_or_fail(self):
  for name in driver.NATIVE:
   for mutation in ['drop','fail','skip']:
    r=self.report(name)
    if mutation=='drop':r['items'].pop(0)
    elif mutation=='fail':r['items'][0]['passed']=False
    else:r['skipped']='synthetic skip'
    with self.subTest(name=name,mutation=mutation),self.assertRaises(ValueError):driver.assess(name,r)
 def test_all_original_workloads_and_resource_limits_preserved(self):
  original=json.loads((HERE.parent/'scope-allocation-scope-native-v404/preparation.json').read_text())
  self.assertEqual(original['native_specs'],{k:list(v) for k,v in driver.NATIVE.items()})
  self.assertEqual(original['policies'],{k:driver.policy(k) for k in driver.NATIVE})
  self.assertEqual(original['seconds'],{k:driver.seconds(k) for k in driver.NATIVE})
  for name,command in driver.commands().items():
   rewritten=[arg.replace('automatic-scope-build-v436','scope-allocation-build-v402') for arg in command]
   self.assertEqual(rewritten,original['commands'][name])

 def test_material_resource_change_and_prior_cleanup_are_verified(self):
  self.assertGreaterEqual(driver.validate_resume()['current_reclaimable_bytes'],22_200_000_000)
 def test_original_execution_and_assessment_functions_are_identical(self):
  import ast
  prior=ast.parse((HERE.parent/'automatic-scope-native-v439/run.py').read_text())
  current=ast.parse((HERE/'run.py').read_text())
  a={n.name:ast.dump(n,include_attributes=False) for n in prior.body if isinstance(n,ast.FunctionDef)}
  b={n.name:ast.dump(n,include_attributes=False) for n in current.body if isinstance(n,ast.FunctionDef)}
  for name in ['seconds','policy','commands','required_new_assertions','assess','run']:
   self.assertEqual(a[name],b[name],name)
 def test_only_pressure_stopped_cases_are_eligible_for_new_launch(self):
  self.assertEqual(driver.RESUMED_CASES,('scope-lifecycle','scope-mtp-vision'))
if __name__=='__main__':unittest.main(verbosity=2)

````````````

## Artifact SHA-256 37ee428b1c13035e48ac807fd22239eba9c9e46939641af02f9707f3f922746f

Encoding: `utf-8`. Original bytes: 962.

````````````text
test_all_original_workloads_and_resource_limits_preserved (__main__.Checks) ... ok
test_complete_synthetic_delivery_is_accepted_without_launch (__main__.Checks) ... ok
test_each_new_assertion_is_mandatory (__main__.Checks) ... ok
test_each_new_metric_must_match_exactly (__main__.Checks) ... ok
test_material_resource_change_and_prior_cleanup_are_verified (__main__.Checks) ... ok
test_only_pressure_stopped_cases_are_eligible_for_new_launch (__main__.Checks) ... ok
test_original_assertions_cannot_disappear_or_fail (__main__.Checks) ... ok
test_original_execution_and_assessment_functions_are_identical (__main__.Checks) ... ok
test_original_family_reports_still_pass (__main__.Checks) ... ok
test_original_reports_cannot_substitute_for_new_native_cases (__main__.Checks) ... ok
test_summary_metrics_without_new_assertions_are_rejected (__main__.Checks) ... ok

----------------------------------------------------------------------
Ran 11 tests in 0.123s

OK

````````````

## Artifact SHA-256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

Encoding: `utf-8`. Original bytes: 0.

````````````text

````````````

## Artifact SHA-256 838729106816afdaa83240e4731a362ab71b04a86e1a0e84dcddc0ba483f81d6

Encoding: `utf-8`. Original bytes: 30975.

````````````text
{
  "prepared_at": "2026-09-09T03:54:47.521585+00:00",
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
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
        "Sources/Slotstream/Context.swift": "58760b11bde1b5c684b457e116e49dd74920929f1a55bf6bf71319b013344f9e",
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
        "Sources/Slotstream/Generate.swift": "09f19ca477799aa70abbaf1aff6d6d956e4b9e5f126bd08d24a171b9c4e7d1a7",
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
        "Sources/Slotstream/Optimizations.swift": "898129b2443590de5a398a8be1a0ee2f9867b947f61da8664c31445f028c68ce",
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
        "Sources/Slotstream/RequestControl.swift": "69026aa98b5f75af9dda77f130547ee2b1c3312bebafacc2c301ff25f237c52d",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "3073de4167c10667101cf3e46e332632b38303d94b50896d3e4c05dd3eafafd3",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "236415bb0c4650ee8ea5c2c906157cd3e736ebeb718a68f59ca6da4e03ce64cb",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "b84030864644d223b17e2ade318929b9359b2f4a23f7b9cf74aa3e98eee5f4a2",
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
      "source_archive_sha256": "1f8ee35ea3c3a8551b8b9cede882e27798cf06667ae93fe1138a5441fc91d3c1",
      "binary_sha256": "d626d992404099949e57114c3520dc3bf6ca4aef9d6b5860e0b99f4113256b1f",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "dependencies": {
    "/tmp/slotstream-optimization-execution/resource-resume-v458/resource-change.json": "1dda4a620b4bac4ee90300ff28e0d10dab38af20eb1a7863ba3c1f98d15e164e",
    "/tmp/slotstream-optimization-execution/resource-resume-v458/current-native-attempt.json": "c530d0c0d169df0ddfcf9869c2d69d7dbb2cf7a43b9596d0edddd601c02af6cf",
    "/tmp/slotstream-optimization-execution/resource-resume-v458/previous-resource.json": "44bf464198c7a7ebdde08a36dd1a9997d939689d31071916a5f25744a7e48fb8",
    "/tmp/slotstream-optimization-execution/automatic-scope-native-v439/run.py": "3591d272684e5fe081160fedf58585bf69ae5df98ebeefa750d65eaa840f7bb5",
    "/tmp/slotstream-optimization-execution/automatic-scope-native-v439/preparation.json": "812425a2899db09de616d4527ca56165fa4eb77b43bad2140abcec10a0309f6c",
    "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-native-v439/scope-lifecycle/qualification.json": "446cd79bfd38a1f49a84315abf54a4eff075ecf88f8e84b7e27f94d3dc87e772",
    "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-native-v439/scope-lifecycle/receipt.json": "fe4a430fb2ffd9d4a4eb47144e601b704db36193e8dbbc72646f618b6c938f04",
    "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-native-v439/scope-mtp-vision/qualification.json": "dbdb7a98a569791034466d08f6ea127e3e31c710682f208ada25a968f9f60e37",
    "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-native-v439/scope-mtp-vision/receipt.json": "3bfdb1876b8e9ea381c411e23f8f93044be71e4403091cba966bc8e7d87d7e42",
    "/private/tmp/slotstream-optimization-execution/automatic-scope-resumed-native-v459/checks.py": "df974d9d60f0a82e443f3e3b468a1deff9e545f65261fee26c625091c063bc6e",
    "/private/tmp/slotstream-optimization-execution/automatic-scope-resumed-native-v459/checks.stderr": "37ee428b1c13035e48ac807fd22239eba9c9e46939641af02f9707f3f922746f",
    "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-metadata-v438/manifest.json": "428e15b61a25cf635ec9b132d26dd38f5bbb966f1cda7a36a15fe8c828e70b71",
    "/tmp/slotstream-optimization-execution/automatic-scope-integration-v435/preparation.json": "812adfe2182e4aefdb2ac7c0d80c8cd537bc2788782d50224954a30bb0b2dec5",
    "/tmp/slotstream-optimization-execution/automatic-scope-integration-v430/preparation.json": "329fd1f9e1881c44350f490a2eb4ec075df74c101d6e8dfe9947f8f74babe3cc",
    "/Users/carlos/Projects/slotstream/.build/optimization/scope-allocation-scope-native-v404/scope-family-2051/stdout.txt": "7c02a1ac8903d1473cdd697e34ad3be4b7530c5a073f79d33dee29b9606b7cba",
    "/Users/carlos/Projects/slotstream/.build/optimization/scope-allocation-scope-native-v404/scope-family-2051/qualification.json": "8cd30e8d89dabde5b1de4c4dde1e4e41130562292e38a55512eb2f0bc03e0a6d",
    "/Users/carlos/Projects/slotstream/.build/optimization/scope-allocation-scope-native-v404/scope-family-4096/stdout.txt": "74f4557310de989b4646be90bf741687dfc35cc1744678124bf9389069ce8281",
    "/Users/carlos/Projects/slotstream/.build/optimization/scope-allocation-scope-native-v404/scope-family-4096/qualification.json": "82010ddb8f748c3f58828c49337898d3ec8e51610e66e8de782549b302e99366",
    "/Users/carlos/Projects/slotstream/.build/optimization/scope-allocation-scope-native-v404/scope-lifecycle/stdout.txt": "8fa7f1453578aa2f44316791bae5fd2842d054c3ac9dec5f61a9b38f3f633bcb",
    "/Users/carlos/Projects/slotstream/.build/optimization/scope-allocation-scope-native-v404/scope-lifecycle/qualification.json": "547e334aec58e4ca68a132f1a56fca4e5bf15865c4df4d2111c57cae30515c18",
    "/Users/carlos/Projects/slotstream/.build/optimization/scope-allocation-scope-native-v404/scope-mtp-vision/stdout.txt": "d4242ea70c73d797b70d7b1c39e9d690e6d2217f63db68f3fa0b2d8d3f5bacb4",
    "/Users/carlos/Projects/slotstream/.build/optimization/scope-allocation-scope-native-v404/scope-mtp-vision/qualification.json": "1af924a22f91db639ac14499e08a3d86cf2f5e0eaa956bcf045d349e30edc6d1",
    "/tmp/slotstream-optimization-execution/optional-current-serving-v330/run.py": "5793aa8bcb3af55fb99c9da698475ee54272ee791ccef30141c94ba6c405b95f",
    "/tmp/slotstream-optimization-execution/pressure-footprint-v341/guard_with_footprint.py": "72836a3c6bc03366b6f546c21d1f32636f01373d29a49e2ae2246e5090a0f215",
    "/tmp/slotstream-optimization-execution/pressure-footprint-v341/pressure_footprint.py": "2ff6061c46f588979da498ea67e93b8e6f887a845b6daab2e115da72a367f73e",
    "/tmp/slotstream-optimization-execution/automatic-scope-build-v436/lease-result.json": "7dfedd13ce6b5cb0d552bf18cb74523400d8d7fb240f7421fdd186d6ad2828d3",
    "/tmp/slotstream-optimization-execution/automatic-scope-build-v436/protocol.json": "a0a194f3fbe98bfd06f80822b865235af5ae713e929e791823cf0098b4deb320",
    "/tmp/slotstream-optimization-execution/scope-buffer-cache-correction-v391/preparation.json": "7f7ab8715855a99f3fbd2077aef1df4b95e2b09d592901f76b9c6c59ff291e1e",
    "/tmp/slotstream-optimization-execution/scope-allocation-accounting-v401/preparation.json": "f383a7bcdeccc4d32baf4efd2d62522a2311d42e9771a0f726e54f709d100be2",
    "/tmp/slotstream-optimization-execution/resumed-scope-qualification-v364/run.py": "04067e049e71577bd292dc2f36aca85ad22d3ee965b79971c405f1c2c0d03014",
    "/tmp/slotstream-optimization-execution/resumed-scope-qualification-v364/preparation.json": "8f660464145f4109c808edab8699159da51dbc8da7700494535c113dc0138b00",
    "/tmp/slotstream-optimization-execution/scope-buffer-cache-native-v394/run.py": "c862dbb0d105d350160047c7e14daa71d8e2e8be7836c1e22679e707f1b13097",
    "/tmp/slotstream-optimization-execution/scope-buffer-cache-native-v394/preparation.json": "0a2fc29a47ba7e5604bc092e18f85b894e8e3150217cd8fb4245fac3477e4960",
    "/Users/carlos/Projects/slotstream/Tools/optimization_campaign.py": "ae49f185713b26f0999b77126df0c480dda017f09f9b315a020b1693bf52d1c4",
    "/Users/carlos/Projects/slotstream/Tools/optimization_soak.py": "61ea2ddff2c8bb72ea6bdb226c96cdfe69ae086ab9bf8384f06f2a80f3907f0e",
    "/Users/carlos/Projects/slotstream/Tools/serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
    "/Users/carlos/Projects/slotstream/Tools/prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "/Users/carlos/Projects/slotstream/Tools/optimization_readiness.py": "56a654ab367b7eca3ee6ab0270641fb2af70ce2bd4a242b8036da506229f283c",
    "/Users/carlos/Projects/slotstream/Tools/optimization_serial_build.py": "f33cba39a2a427b76353c57075128a9278a7cb3f22d3f086d7be8c25179bf6cf",
    "/Users/carlos/Projects/slotstream/Tools/optimization_build.py": "dee7d43c4fd70aac9145cfe33ea9d3d446e803fbca5dbf54e07d577d27deca6f",
    "/Users/carlos/Projects/slotstream/Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
    "/Users/carlos/Projects/slotstream/Tools/thermal_readiness.py": "461dc8513bf8a23c7af5d999edf3c2ed1cbdb3d80d7869124603fa5babade048"
  },
  "executor_sha256": "8128cc7717c7cb20d67123a17dd948de20c344df4def07aa16fc743025ce61f3",
  "native_specs": {
    "scope-family-2051": [
      "scope-integrated-family",
      "optimization-256-compute-read-scope",
      817
    ],
    "scope-family-4096": [
      "scope-integrated-family",
      "optimization-256-compute-read-scope",
      817
    ],
    "scope-lifecycle": [
      "scope-integrated-lifecycle",
      "optimization-scope-lifecycle",
      832
    ],
    "scope-mtp-vision": [
      "scope-integrated-mtp-vision",
      "optimization-scope-mtp-vision",
      249
    ]
  },
  "commands": {
    "scope-family-2051": [
      "/usr/bin/env",
      "SLOTSTREAM_OPT_WORKSPACE_TILE=1024",
      "SLOTSTREAM_OPT_SCOPE_FRONTIER=1",
      "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
      "optimization-state-check",
      "--variant",
      "scope-integrated-family",
      "--tokens",
      "2051",
      "--model",
      "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "--json"
    ],
    "scope-family-4096": [
      "/usr/bin/env",
      "SLOTSTREAM_OPT_WORKSPACE_TILE=1024",
      "SLOTSTREAM_OPT_SCOPE_FRONTIER=1",
      "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
      "optimization-state-check",
      "--variant",
      "scope-integrated-family",
      "--tokens",
      "4096",
      "--model",
      "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "--json"
    ],
    "scope-lifecycle": [
      "/usr/bin/env",
      "SLOTSTREAM_OPT_WORKSPACE_TILE=1024",
      "SLOTSTREAM_OPT_SCOPE_FRONTIER=1",
      "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
      "optimization-state-check",
      "--variant",
      "scope-integrated-lifecycle",
      "--model",
      "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "--json"
    ],
    "scope-mtp-vision": [
      "/usr/bin/env",
      "SLOTSTREAM_OPT_WORKSPACE_TILE=1024",
      "SLOTSTREAM_OPT_SCOPE_FRONTIER=1",
      "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
      "optimization-state-check",
      "--variant",
      "scope-integrated-mtp-vision",
      "--model",
      "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "--json"
    ]
  },
  "environment": {},
  "seconds": {
    "scope-family-2051": 1800,
    "scope-family-4096": 1800,
    "scope-lifecycle": 1800,
    "scope-mtp-vision": 1800
  },
  "policies": {
    "scope-family-2051": {
      "startup_reclaimable_bytes": 20112000000,
      "minimum_live_reclaimable_bytes": 3000000000,
      "maximum_owned_rss_bytes": 17112000000,
      "sample_interval_seconds": 0.2,
      "maximum_build_seconds": 1800,
      "stop_on_new_swapouts": false
    },
    "scope-family-4096": {
      "startup_reclaimable_bytes": 20112000000,
      "minimum_live_reclaimable_bytes": 3000000000,
      "maximum_owned_rss_bytes": 17112000000,
      "sample_interval_seconds": 0.2,
      "maximum_build_seconds": 1800,
      "stop_on_new_swapouts": false
    },
    "scope-lifecycle": {
      "startup_reclaimable_bytes": 20112000000,
      "minimum_live_reclaimable_bytes": 3000000000,
      "maximum_owned_rss_bytes": 17112000000,
      "sample_interval_seconds": 0.2,
      "maximum_build_seconds": 1800,
      "stop_on_new_swapouts": false
    },
    "scope-mtp-vision": {
      "startup_reclaimable_bytes": 20112000000,
      "minimum_live_reclaimable_bytes": 3000000000,
      "maximum_owned_rss_bytes": 17112000000,
      "sample_interval_seconds": 0.2,
      "maximum_build_seconds": 1800,
      "stop_on_new_swapouts": false
    }
  },
  "classification": "Resource-qualified successor for only the V439 pressure-stopped lifecycle and MTP/vision cases. Prior reports stay unchanged; the two already-passing geometry cases retain their V439 identity. Exact V436 build from V435 automatic scheduling/local options and V416/V419 memory guards. Retains all four original V404 cases, source-bound original assertion coverage, workspace1024/frontier1, 1800 seconds plus30 cleanup, original20.112GB startup/17.112GB owned/3GB live envelope and original guard policy. Expanded actual-Generator lifecycle and MTP cases must report all three planner geometries, both memory fallbacks, aligned4096 MTP prefill, and pass every assertion. Native correctness only; serving process-cap/benefit and complete final gates are separate. No default adoption."
}

````````````

## Artifact SHA-256 8128cc7717c7cb20d67123a17dd948de20c344df4def07aa16fc743025ce61f3

Encoding: `utf-8`. Original bytes: 13907.

````````````text
"""Original complete native cases on the exact compiled scope-cache correction."""
from pathlib import Path
from collections import Counter
import argparse,datetime,fcntl,importlib.util,inspect,json,os,signal,sys,threading,time
ROOT=Path('/Users/carlos/Projects/slotstream');BASE=Path('/tmp/slotstream-optimization-execution');HERE=Path(__file__).resolve().parent
OUT=ROOT/'.build/optimization/automatic-scope-resumed-native-v459'
sys.path.insert(0,str(ROOT/'Tools'));sys.path.insert(0,str(BASE/'pressure-footprint-v341'))
import optimization_campaign as c
import thermal_readiness
from optimization_readiness import pressure_snapshot,require_normal
from prefill_bench import digest,preflight,vm_snapshot
from serve_bench import competing_jobs,verified_build
from guard_with_footprint import guarded_run
CORE=BASE/'optional-current-serving-v330/run.py'
spec=importlib.util.spec_from_file_location('original_execution',CORE);original=importlib.util.module_from_spec(spec);spec.loader.exec_module(original)
require,now,allowance,readiness=original.require,original.now,original.allowance,original.readiness
EXECUTE_SOURCE=inspect.getsource(original.execute)
exec(compile(EXECUTE_SOURCE,str(CORE)+'::execute','exec'),globals())
NATIVE={
 'scope-family-2051':('scope-integrated-family','optimization-256-compute-read-scope',817),
 'scope-family-4096':('scope-integrated-family','optimization-256-compute-read-scope',817),
 'scope-lifecycle':('scope-integrated-lifecycle','optimization-scope-lifecycle',832),
 'scope-mtp-vision':('scope-integrated-mtp-vision','optimization-scope-mtp-vision',249),
}
BINARY=ROOT/'.build/optimization/automatic-scope-build-v436/candidate/slotstream'
MODEL='/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit'
BUILD=BASE/'automatic-scope-build-v436'
SCOPE_ENV={'SLOTSTREAM_OPT_WORKSPACE_TILE':'1024','SLOTSTREAM_OPT_SCOPE_FRONTIER':'1'}
def seconds(name): return 1800 if name.startswith('scope-') else 900
def policy(name): return dict(c.NATIVE_POLICY,startup_reclaimable_bytes=20_112_000_000,maximum_owned_rss_bytes=17_112_000_000,maximum_build_seconds=seconds(name))
def commands():
 result={}
 for name,item in NATIVE.items():
  command=[str(BINARY),'optimization-state-check','--variant',item[0]]
  if name.startswith('scope-family-'): command+=['--tokens',name.rsplit('-',1)[1]]
  command+=['--model',MODEL,'--json']
  if name.startswith('scope-'):command=['/usr/bin/env']+[k+'='+v for k,v in SCOPE_ENV.items()]+command
  result[name]=command
 return result
def dependencies():
 files=[BASE/'resource-resume-v458/resource-change.json',BASE/'resource-resume-v458/current-native-attempt.json',BASE/'resource-resume-v458/previous-resource.json',BASE/'automatic-scope-native-v439/run.py',BASE/'automatic-scope-native-v439/preparation.json']+[ROOT/'.build/optimization/automatic-scope-native-v439'/name/file for name in ['scope-lifecycle','scope-mtp-vision'] for file in ['qualification.json','receipt.json']]+[HERE/'checks.py',HERE/'checks.stderr',ROOT/'.build/optimization/automatic-scope-metadata-v438/manifest.json',BASE/'automatic-scope-integration-v435/preparation.json',BASE/'automatic-scope-integration-v430/preparation.json'] + [ROOT/'.build/optimization/scope-allocation-scope-native-v404'/name/file for name in NATIVE for file in ['stdout.txt','qualification.json']] + [CORE,BASE/'pressure-footprint-v341/guard_with_footprint.py',BASE/'pressure-footprint-v341/pressure_footprint.py',BUILD/'lease-result.json',BUILD/'protocol.json',BASE/'scope-buffer-cache-correction-v391/preparation.json',BASE/'scope-allocation-accounting-v401/preparation.json',BASE/'resumed-scope-qualification-v364/run.py',BASE/'resumed-scope-qualification-v364/preparation.json',BASE/'scope-buffer-cache-native-v394/run.py',BASE/'scope-buffer-cache-native-v394/preparation.json']+[ROOT/'Tools'/x for x in c.DRIVERS+('thermal_readiness.py',)]
 return {str(p):digest(p) for p in files}
RESUMED_CASES=('scope-lifecycle','scope-mtp-vision')
def validate_resume():
 proof=c.read(BASE/'resource-resume-v458/resource-change.json')
 require(proof['previous_reclaimable_bytes']<20_112_000_000 and proof['current_reclaimable_bytes']>=22_200_000_000,'material startup resource change absent')
 require(all(digest(Path(p))==sha for p,sha in proof['resources'].items()),'resource observations changed')
 for name in RESUMED_CASES:
  prior=c.read(ROOT/'.build/optimization/automatic-scope-native-v439'/name/'qualification.json')
  require(prior.get('qualified') is False and 'OS memory pressure is not normal (observed level=2)' in prior.get('error',''),'predecessor is not the preserved pressure stop')
  require(prior.get('remaining_jobs')==[] and prior.get('within_reservation') is True,'prior cleanup proof absent')
 return proof
def prepare():
 validate_resume()
 require(not (HERE/'preparation.json').exists() and not OUT.exists(),'already prepared/attempted')
 build=verified_build(BINARY);lease=c.read(BUILD/'lease-result.json');protocol=c.read(BUILD/'protocol.json')
 require(lease['passed'] and lease['restored'],'build did not pass/restore')
 pure=c.read(ROOT/'.build/optimization/automatic-scope-metadata-v438/manifest.json')
 require(pure.get('passed') is True and pure['candidate']==build,'new candidate pure/CLI tests must pass before native preparation')
 require(build['identity']['source']==protocol['candidate_source'],'compiled source differs from the corrected candidate')
 value={'prepared_at':now(),'build':build,'dependencies':dependencies(),'executor_sha256':digest(Path(__file__)),'native_specs':NATIVE,'commands':commands(),'environment':{},'seconds':{n:seconds(n) for n in NATIVE},'policies':{n:policy(n) for n in NATIVE},'classification':'Resource-qualified successor for only the V439 pressure-stopped lifecycle and MTP/vision cases. Prior reports stay unchanged; the two already-passing geometry cases retain their V439 identity. Exact V436 build from V435 automatic scheduling/local options and V416/V419 memory guards. Retains all four original V404 cases, source-bound original assertion coverage, workspace1024/frontier1, 1800 seconds plus30 cleanup, original20.112GB startup/17.112GB owned/3GB live envelope and original guard policy. Expanded actual-Generator lifecycle and MTP cases must report all three planner geometries, both memory fallbacks, aligned4096 MTP prefill, and pass every assertion. Native correctness only; serving process-cap/benefit and complete final gates are separate. No default adoption.'}
 c.write_new(HERE/'preparation.json',value)
 return {'prepared':True,'model_launched':False,'cases':list(NATIVE),'build_sha256':build['identity']['binary_sha256']}
def load():
 validate_resume()
 value=c.read(HERE/'preparation.json')
 require(value['executor_sha256']==digest(Path(__file__)) and value['dependencies']==dependencies(),'executor/dependencies changed')
 require(verified_build(BINARY)==value['build'],'binary/source/metal identity changed')
 require(value['native_specs']=={k:list(v) for k,v in NATIVE.items()} and value['seconds']=={n:seconds(n) for n in NATIVE} and value['policies']=={n:policy(n) for n in NATIVE},'native workload/policy changed')
 require(value['environment']=={} and value['commands']==commands(),'native commands changed')
 return value
def required_new_assertions(name):
 required=set()
 if name=='scope-lifecycle':
  required|={f'automatic planner shape {label}/{chunk}' for chunk in [256,512,1024] for label in ['retains exact output','retains all numerical passes','retains exact ordered routes','actually shares reads','reduces actual expert reads']}
  required|={f'automatic {kind} fallback {label}' for kind in ['process target','live headroom'] for label in ['retains exact output','retains original read groups','retains exact routes']}
  required|={'automatic followup reuses the exact common prefix','automatic prefix followup shares the remaining reads',
    'automatic grouped cancellation emits nothing and commits no rows','automatic grouped checked read fault actually fires',
    'automatic grouped read error returns no partial output','automatic checked read-error retry has exact output',
    'automatic checked read-error retry completes a real scope','automatic short request retains exact output'}
  required|={f'scope allocation refusal/seeded={seeded}/shared={shared}: {label}' for seeded in ['false','true'] for shared in ['false','true'] for label in ['typed memory refusal','refused the actual prefill allocation','no forward math','no expert reads','releases shared reservation ownership']}
 if name=='scope-mtp-vision':
  required|={f'automatic MTP {label}/{chunk}' for chunk in [256,512,1024] for label in ['has exact greedy continuation','retains all prefill compute shapes','actually executes grouped prefill','reduces actual expert reads','retains both complete states']}
  required|={f'automatic MTP head restores configured indexer dispatch/{chunk}/{automatic}' for chunk in [256,512,1024] for automatic in ['false','true']}
 return required
def assess(name,report):
 items=report.get('items',[]);names={x['name'] for x in items}
 require(report.get('name')==NATIVE[name][1] and report.get('passed') is True and report.get('skipped') is None and len(items)>=NATIVE[name][2] and all(x.get('passed') is True for x in items),'complete native assertions absent or failing')
 if name.startswith('combined'):
  required={f'{arm}: original MTP verification shape selected' for arm in ['false','true']}
  required|={f'{arm}/{case}: {label}' for arm in ['false','true'] for case in ['cached17','boundary255','boundary256','boundary257','long1025','image-before','image-crossing'] for label in ['selected n-gram cache format','n-gram cache contains real rows','exact n-gram cache payload accounting']}
  if name=='combined-mtp':
   required|={f'{arm}: {label}' for arm in ['false','true'] for label in ['terminal draft work is explicit','terminal target work is explicit','terminal verification executes once','terminal forward executes once','bounded output preserves the longer greedy prefix']}
   required.add('two-token MTP integrated output matches reference')
  require(required<=names,'original full composition assertions missing')
 if name.startswith('scope-'):
  m=report.get('measurements',{});require(m.get('integrated_base')==1,'scope integrated base absent')
  if name.startswith('scope-family-'):
   tokens=int(name.rsplit('-',1)[1]);require(m.get('workspace_token_tile')==1024 and m.get('compact_scope_frontier')==1 and [m.get(f'arm{i}.chunk') for i in range(3)]==[256,512,min(4096,tokens)],'original scope geometry differs')
   require({'workspace allocation actually observed','workspace retains no disposable MLX buffers'}|{f'arm{i}: caller buffer-cache limit restored' for i in range(3)} <= names,'new cache behavior assertions absent')
  if name=='scope-mtp-vision':
   require({'direct scope cancellation restores buffer-cache limit','direct scope success restores buffer-cache limit','direct scope read error returned','direct scope read fault fired','direct scope error restores buffer-cache limit','direct scope read-error retry commits','direct scope read-error retry restores buffer-cache limit'} <= names,'direct checked lifecycle assertions absent')
 baseline=ROOT/'.build/optimization/scope-allocation-scope-native-v404'/name
 require(c.read(baseline/'qualification.json').get('qualified') is True,'original complete native baseline absent')
 old=c.read(baseline/'stdout.txt')
 require(not (Counter(x['name'] for x in old['items'])-Counter(x['name'] for x in items)), 'original native assertion coverage dropped')
 expected={
  'scope-lifecycle':{'automatic_planner_geometries':3,'automatic_memory_fallbacks':2},
  'scope-mtp-vision':{'automatic_mtp_planner_geometries':3,'automatic_mtp_prompt_tokens':4096},
 }.get(name,{})
 require(all(report.get('measurements',{}).get(key)==value for key,value in expected.items()),'automatic scheduling/fallback/MTP geometry proof absent')
 require(required_new_assertions(name)<=names,'new automatic native assertion coverage absent')
 return {'passed':True,'completed':True,'qualified':True,'assertions':len(items),'original_assertion_coverage_preserved':True,'automatic_native_metrics':expected}

def run(name,deadline):
 allowance(deadline,seconds(name)+30);value=load();target=OUT/name
 require(not target.exists(),'attempted native cannot retry')
 limit,before,thermal=readiness(deadline,seconds(name)+30,20.112)
 attempt={'started_at':now(),'deadline_utc':deadline,'command':value['commands'][name],'environment':{},'build':value['build'],'before':before,'thermal_prelaunch':thermal,'policy':policy(name),'preparation_sha256':digest(HERE/'preparation.json'),'classification':value['classification']}
 def assessment(code):
  load();require(code==0,'native process failed');return assess(name,c.read(target/'stdout.txt'))
 result=execute(attempt['command'],target,seconds(name),policy(name),assessment,limit,attempt)
 result['execution_receipt_sha256']=digest(target/'receipt.json');c.write_new(target/'qualification.json',result)
 return result
def main():
 parser=argparse.ArgumentParser();parser.add_argument('action',choices=['prepare','check','native']);parser.add_argument('--name',choices=list(NATIVE));parser.add_argument('--deadline');args=parser.parse_args()
 with (HERE/'.run.lock').open('a') as lock:
  fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
  if args.action=='prepare':result=prepare()
  elif args.action=='check':load();result={'passed':True,'unrun':[n for n in NATIVE if not (OUT/n).exists()]}
  else:require(args.name in RESUMED_CASES and args.deadline is not None,'only a named pressure-stopped successor case/deadline is eligible');result=run(args.name,args.deadline)
 print(json.dumps({k:v for k,v in result.items() if k not in ['before','after']},indent=2),flush=True)
 return 0 if args.action!='native' or result.get('qualified') else 1
if __name__=='__main__':raise SystemExit(main())

````````````

## Artifact SHA-256 c530d0c0d169df0ddfcf9869c2d69d7dbb2cf7a43b9596d0edddd601c02af6cf

Encoding: `utf-8`. Original bytes: 23156.

````````````text
{
  "started_at": "2026-09-09T03:53:05.481943+00:00",
  "deadline_utc": "2026-09-09T04:30:00Z",
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "integrated",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "environment": {},
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
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
        "Sources/Slotstream/Context.swift": "58760b11bde1b5c684b457e116e49dd74920929f1a55bf6bf71319b013344f9e",
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
        "Sources/Slotstream/Generate.swift": "09f19ca477799aa70abbaf1aff6d6d956e4b9e5f126bd08d24a171b9c4e7d1a7",
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
        "Sources/Slotstream/Optimizations.swift": "898129b2443590de5a398a8be1a0ee2f9867b947f61da8664c31445f028c68ce",
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
        "Sources/Slotstream/RequestControl.swift": "69026aa98b5f75af9dda77f130547ee2b1c3312bebafacc2c301ff25f237c52d",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "3073de4167c10667101cf3e46e332632b38303d94b50896d3e4c05dd3eafafd3",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "236415bb0c4650ee8ea5c2c906157cd3e736ebeb718a68f59ca6da4e03ce64cb",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "b84030864644d223b17e2ade318929b9359b2f4a23f7b9cf74aa3e98eee5f4a2",
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
      "source_archive_sha256": "1f8ee35ea3c3a8551b8b9cede882e27798cf06667ae93fe1138a5441fc91d3c1",
      "binary_sha256": "d626d992404099949e57114c3520dc3bf6ca4aef9d6b5860e0b99f4113256b1f",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 29569335296,
    "swapins": 44352185,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   182109.\nPages active:                                1150984.\nPages inactive:                               861217.\nPages speculative:                            288785.\nPages throttled:                                   0.\nPages wired down:                             248058.\nPages purgeable:                               26642.\n\"Translation faults\":                    18069337309.\nPages copy-on-write:                       989698150.\nPages zero filled:                       25816452435.\nPages reactivated:                        4939161047.\nPages purged:                               93829978.\nFile-backed pages:                           1596018.\nAnonymous pages:                              704968.\nPages stored in compressor:                   856274.\nPages occupied by compressor:                 352071.\nDecompressions:                           1460134571.\nCompressions:                             1799446643.\nPageins:                                  9229817641.\nPageouts:                                   11597863.\nSwapins:                                    44352185.\nSwapouts:                                   77895019.\nPages tagged:                                 168570.\nPages tagged resident:                        137239.\nPages tagged compressed:                       31331.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7160.\nPages tag-storage free:                         2642.\nPages tag-storage non-tag pageable:            88494.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5363584.\nTagged compressions:                        14644225.\nTagged decompressions:                      13605467.\n"
  },
  "thermal_prelaunch": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-09T03:53:05.481823+00:00",
    "conditions": {
      "thermalState": "nominal",
      "lowPowerModeEnabled": false
    },
    "ready": true,
    "scope": "One pre-launch policy observation; all original request and qualification gates remain required."
  },
  "policy": {
    "startup_reclaimable_bytes": 13000000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 10000000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 900,
    "stop_on_new_swapouts": false
  },
  "preparation_sha256": "dd06ee5e063c0d41b14bb498d30db23a6afe09522a56ad9c8d0ca24d87c6c52d",
  "classification": "Exact V436 automatic scope/local options and atomic fallback integration, preserving all three original V405 integrated workloads; the four scope workloads use separate V439 with their original scope-native envelope, original assertion minima (raised only by new cache-restoration checks), fixed MTP verification, workspace1024/frontier1 and full 900/1800-second work allowances plus30-second cleanup. All native runs use stricter22.2GB admission and the original live guard plus V341 failure-footprint observer. Native correctness only: no timing qualification, final composition selection or activation."
}

````````````

## Artifact SHA-256 44bf464198c7a7ebdde08a36dd1a9997d939689d31071916a5f25744a7e48fb8

Encoding: `utf-8`. Original bytes: 2546.

````````````text
{
  "at": "2026-09-09T02:15:31.730786+00:00",
  "vm": {
    "page_bytes": 16384,
    "reclaimable_bytes": 17534091264,
    "swapins": 44233790,
    "swapouts": 77586665,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   310017.\nPages active:                                 904726.\nPages inactive:                               871248.\nPages speculative:                             33878.\nPages throttled:                                   0.\nPages wired down:                             267557.\nPages purgeable:                               21188.\n\"Translation faults\":                    18003242152.\nPages copy-on-write:                       985654928.\nPages zero filled:                       25660102728.\nPages reactivated:                        4838790910.\nPages purged:                               91888037.\nFile-backed pages:                            738991.\nAnonymous pages:                             1070861.\nPages stored in compressor:                  1406625.\nPages occupied by compressor:                 697153.\nDecompressions:                           1451518550.\nCompressions:                             1790112190.\nPageins:                                  9125359050.\nPageouts:                                   11588982.\nSwapins:                                    44233790.\nSwapouts:                                   77586665.\nPages tagged:                                 178100.\nPages tagged resident:                        136790.\nPages tagged compressed:                       41310.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7038.\nPages tag-storage free:                          969.\nPages tag-storage non-tag pageable:            90289.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6566400.\nTagged compressions:                        14518982.\nTagged decompressions:                      13480818.\n"
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
  "competing_jobs": [],
  "app_process_counts": {
    "Chrome": 56,
    "Wispr": 11
  },
  "colima": {
    "exit_code": 1,
    "stdout": "",
    "stderr": "time=\"2026-09-08T21:15:31-05:00\" level=fatal msg=\"colima is not running\"\n"
  },
  "next_native_required_bytes": 22200000000
}

````````````

## Artifact SHA-256 1dda4a620b4bac4ee90300ff28e0d10dab38af20eb1a7863ba3c1f98d15e164e

Encoding: `utf-8`. Original bytes: 1093.

````````````text
{
  "previous_reclaimable_bytes": 17534091264,
  "current_reclaimable_bytes": 29569335296,
  "current_started_at": "2026-09-09T03:53:05.481943+00:00",
  "current_thermal_prelaunch": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-09T03:53:05.481823+00:00",
    "conditions": {
      "thermalState": "nominal",
      "lowPowerModeEnabled": false
    },
    "ready": true,
    "scope": "One pre-launch policy observation; all original request and qualification gates remain required."
  },
  "resources": {
    "/tmp/slotstream-optimization-execution/resource-resume-v458/previous-resource.json": "44bf464198c7a7ebdde08a36dd1a9997d939689d31071916a5f25744a7e48fb8",
    "/tmp/slotstream-optimization-execution/resource-resume-v458/current-native-attempt.json": "c530d0c0d169df0ddfcf9869c2d69d7dbb2cf7a43b9596d0edddd601c02af6cf"
  },
  "reason": "User requested continuation after an observed material resource increase. Prior stopped identities are preserved. Each new native launch still independently requires the original live/startup/owned/pressure controls."
}

````````````
