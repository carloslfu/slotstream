---
type: run
id: 01m1wtm27hcy066r76nx23ve6v
created: 2026-09-07T02:19:41.681876+00:00
updated: 2026-09-07T02:19:41.983207+00:00
summary: Final response correctness and resource ceilings are independent of timing exclusion
binary: No native executable launched
captured_at: 2026-09-07
command: python3 Tools/optimization_prerequisites_test.py; python3 Tools/optimization_soak_test.py; read-only V227 output audit
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Final response correctness and resource ceilings are independent of timing exclusion
tool: Read-only saved-output audit and pure final-prerequisite tests
---
# Final correctness must not disappear with an excluded timing round

V227 reads the preserved serving manifests/results without running a model or
rescoring latency. Across55studies,445completed comparable first/measured output
pairs match, including rows excluded from timing. This does not certify missing
or incomparable responses. Original results and their qualified/discarded
classifications remain unchanged; no new performance result is produced.

The final prerequisite validator previously recomputed equality only on timing-
eligible pairs; startup summaries also excluded differing first outputs. V228
preserves seven executable pure counterexamples and its21-test successor draft.
V229 additionally binds every saved warmup.json by digest, verifies it against
first_request, and enforces its absolute sampled physical ceiling. The original
validator fails11of25 expanded pure cases; the corrected shared validator passes
all25, and the existing11soak-driver tests pass separately.

Prospective final qualification requires all32cells in each of the eight studies
to capture completed first and measured requests. A preflight refusal leaves it
incomplete. HTTP/runtime errors, wrong configuration or equal-work counters,
malformed/truncated response metadata, changed input/output, missing or changed
warmup evidence, and absolute first/measured physical overflows cannot be hidden
by VM/thermal timing exclusion. Complete identical responses with VM activity
remain admissible correctness evidence, while ordinary unchanged timing gates
still require the minimum clean pairs. Every prerequisite receipt must bind all
32warmup JSON files in addition to manifest/completion/results. No final study
or workload contract has yet run or frozen. No prior study is altered or retried.

Only optimization_soak.py and its pure prerequisite tests changed. All143runtime
sources remain V215-exact; frozen ngram_cache_probe.py, prefill_bench.py and
serve_bench.py remain unchanged. No model, GPU, native binary, compiler or server
was launched. This evidence is discarded for performance.

## /tmp/slotstream-optimization-execution/paired-output-audit-v227/report.json

SHA-256 `98d6b8c40ade5d75bfb0d4bebfeb45faaf0d0e86d59fdec2fbdff51fb544c792`; 21464 bytes.

````text
{
  "captured_utc": "2026-09-07T02:07:51.848919+00:00",
  "classification": "read-only audit of all completed comparable outputs including VM-excluded rows; no rescoring, new timing or changed disposition",
  "studies": [
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/all-hit-calibration-v38",
      "results_sha256": "514af1a2af9a54920ea54b8ba8e85881150364110b322752f2f95e34535f4db1",
      "manifest_sha256": "eb92d0681a5cdad2b7e6642a8570d6e0cb9ace8c0a3e26df5ff5c511ff2d99cb",
      "rows": 1,
      "completed_output_comparisons": 0,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/all-hit-calibration-v40",
      "results_sha256": "5451d2a7a324f7c3ac9cb2ffba15fbabd8d04a179d00c9653ca421e51fc2a368",
      "manifest_sha256": "836d5202a45edbea43fca3c6ad8c390cf27cf45833bf2c341c969974dfa3403d",
      "rows": 1,
      "completed_output_comparisons": 0,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/all-hit-pure-compute-v38",
      "results_sha256": "c6c5812b9a1695ef4b070724e8b7a98fc7d4b4bbfbcdc82f6e645e7bd78d6947",
      "manifest_sha256": "3fba369aa86c2813812f9258029ac6fc2b8cc4319b94406da37e12b27b3011dc",
      "rows": 21,
      "completed_output_comparisons": 0,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/all-hit-pure-compute-v39",
      "results_sha256": "40fd688ea478654180eff84f2e6ff0ea799a3eff6c32bf27f9731117dc6d5816",
      "manifest_sha256": "c0335bfaad6c05ca15e817bfca53803a416b6fef71391470772e2b8475635ebd",
      "rows": 1,
      "completed_output_comparisons": 0,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/all-hit-runtime-calibration-v67",
      "results_sha256": "447b1c32638becf39a363df76c2ed9888c9d1ee4f65db7cf53836f7a7f366f9d",
      "manifest_sha256": "cf82747faebf96708dfb27f31f3a35c2c6828a8134b6a7e896c83fec32759cca",
      "rows": 1,
      "completed_output_comparisons": 0,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/cache-bookkeeping-serving-v28",
      "results_sha256": "a3010e1a7be1a9257ca66829483b58233ab6f306c15b7dcd54aee8501729d0c9",
      "manifest_sha256": "6d0a87b4fa70bfbc6960bb9e117c2104873d79100298b844e5bfd117ffb0068c",
      "rows": 14,
      "completed_output_comparisons": 7,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/compiled-norm-serving-v31",
      "results_sha256": "23f2367d7f8e93aaddce7270d37e3b7048491adba51304641772ed283c55879d",
      "manifest_sha256": "ea832326a65119503fa23a02670a6df06c3a754495893ebfdd82848a5517ce5b",
      "rows": 14,
      "completed_output_comparisons": 7,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/complete-prompt-repeat-confirmation-v115",
      "results_sha256": "cbd1c4daba3d9cec1277a8ab09863c1b2783e9a9d32872985ce3b03283c12290",
      "manifest_sha256": "70157d6d03133175ccd4027a53f35aab795c9a8b322da1509eb359ae307a3586",
      "rows": 1,
      "completed_output_comparisons": 0,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/complete-prompt-repeat-confirmation-v118",
      "results_sha256": "4b2a1a17d76190b3cf1f7a81925f7681581ab9baa68fe1bfdeba28111432aa5a",
      "manifest_sha256": "ffe830faf5a5de404b8de133c4d20867baa3773dc313dfddeccfc3e5c2026e13",
      "rows": 11,
      "completed_output_comparisons": 10,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/complete-prompt-repeat-confirmation-v122",
      "results_sha256": "86e3a3e784591c13593ae919747a7e148870aefaaada222978599ee70da4c59e",
      "manifest_sha256": "5b06ad7312d748416583831ed5309b9048dd74196298b5ff0f8052b7954b1365",
      "rows": 32,
      "completed_output_comparisons": 32,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/complete-prompt-repeat-v114",
      "results_sha256": "26bf0bab64eb0c3b9308980cc000da292ab49c14593e0f94f4b1a6954bc6b3d6",
      "manifest_sha256": "292775907527e5636b6bf733f2deb33b5efe2d101b59b08a310eae4fa5af7759",
      "rows": 14,
      "completed_output_comparisons": 14,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/complete-prompt-unique-v136",
      "results_sha256": "8f93c24dc436fabe5c149f046f0222118d405d6fbff87dce15d87ed39ee61987",
      "manifest_sha256": "6eb406bcbba783f1c2fd03a33726c11dfbc4ed19f68a4aa477befc224320602c",
      "rows": 32,
      "completed_output_comparisons": 32,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/contention-refusal-v115",
      "results_sha256": "670719d43da5954e9373d506abba2cfafcb484ca94347499af18350f7e36a98c",
      "manifest_sha256": "fba5c4f664ddd0d2d0cfd4ca1827570860f412cff97a248c6c4f2a07d9d59f3b",
      "rows": 1,
      "completed_output_comparisons": 0,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/cpu-contiguous-serving-v150",
      "results_sha256": "47e99d59274f8487ba3e0c467aac487d0f998f21a262214a732670a9735043f5",
      "manifest_sha256": "14ee4c56e6522e89c06a016519d93446de9eb800fb605dc8e014c340bcf3fc9a",
      "rows": 14,
      "completed_output_comparisons": 14,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/cpu-slot-serving-v108",
      "results_sha256": "9bfed7d8ef42c9cb52daea05689cafd9153d37db6deb25fdf38faa2780071328",
      "manifest_sha256": "65a28868bb18d8e683ddc4f3c9f452f167d41268695a5ade7f2d45b203ddfa51",
      "rows": 14,
      "completed_output_comparisons": 14,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/embedding-resource-serving-v98",
      "results_sha256": "72bf37303c7623701d7e18b467894bb8cead25f955ee79004953219b73e7cfc3",
      "manifest_sha256": "55a6c2f57f85882889f4218821dad3001faae7a22365096225758558313cd5c8",
      "rows": 14,
      "completed_output_comparisons": 14,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/fixed-mtp-serving-v51",
      "results_sha256": "3f8685677c552e6a4d3222e89a524b6a3f5227b857dc4862468a45ab0037734c",
      "manifest_sha256": "18ab468e7b710f711213abe65da9c4f0b3cc7141440ec7d4c313c3d5b6f77aa2",
      "rows": 21,
      "completed_output_comparisons": 14,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/floor-cache-confirmation-v60",
      "results_sha256": "3584f49f2b11fe9bbbff815fd103b2bedca30348d2ad5dd32ebb2227e732ae1e",
      "manifest_sha256": "f096a8b784cafd527728b854fa4b1a8c93adf13e49445115b80958e4e1d64a42",
      "rows": 10,
      "completed_output_comparisons": 5,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/floor-cache-serving-v60",
      "results_sha256": "bc60fd3949f669e14008ec4332b8a678d612bab495f99cc03a51f0a3b8a38189",
      "manifest_sha256": "0fda7db5864bcb013759575a9ed20400cd27dea0c56838b42d38869e1d3ffcb1",
      "rows": 14,
      "completed_output_comparisons": 0,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/gdn-projection-prefill-serving-v156",
      "results_sha256": "0df050dc138b41d5df0c008fe6f740175f920992f9992f776cd92a829fa99596",
      "manifest_sha256": "a2a00686ab9c23a487e9bbe3c184f4f71da834e72b6b63b17ec3f32af9414a71",
      "rows": 14,
      "completed_output_comparisons": 14,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/gdn-projection-short-serving-v156",
      "results_sha256": "79d475f323006ea6d5c793e8307adf848a8d5466fac7ce8ce0a70bd59db66967",
      "manifest_sha256": "3344aec980dd0bc941a32ca939b983aa3b50b119066c051651a9c7547fe41170",
      "rows": 14,
      "completed_output_comparisons": 14,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/governor-serving-v63",
      "results_sha256": "72a4db8c402222133e8914a282e987376cdb653cfc4faaa896938dd4d880096f",
      "manifest_sha256": "f8918c47802288185d37e217af4c644b004c3f059c756d5408d500d75bd883f2",
      "rows": 14,
      "completed_output_comparisons": 7,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/indexer-resource-serving-v67",
      "results_sha256": "31ae45fc715023142b8d892647719f0d9e8bd51f63cc169e38eda42742ba940a",
      "manifest_sha256": "0f13f98c66203b7e08f008755e83ae7964819260eb237be53f2a1dbd56de5609",
      "rows": 6,
      "completed_output_comparisons": 2,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/larger-prefill-scope-feasibility-v98",
      "results_sha256": "0e1b92530a40d03f4c4da22bf8087781bc4980519ac2e5da60fa3d42becb1f94",
      "manifest_sha256": "42abcae949079593a757961d08b168671d6e3752d8049256394c595cabee21d4",
      "rows": 1,
      "completed_output_comparisons": 0,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/output-queue-confirmation-v102",
      "results_sha256": "f834aff84afacea0afda525b9a0a5290ecd311a4298f18d4de1eba707412486f",
      "manifest_sha256": "c5ddeeaa14612b57db605e55aa6e1d6b9a690ba329ae36cf54d0033972457606",
      "rows": 14,
      "completed_output_comparisons": 14,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/packed-layout-serving-v79",
      "results_sha256": "52e4d0c3691b22cec0cf80ba7297ca63e40e85f0d55ada30193ce7e543973710",
      "manifest_sha256": "c62125c09eaa460a25d00a16e500a24a1c0c1f84687b225a7268bcee8bc7f742",
      "rows": 14,
      "completed_output_comparisons": 14,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/pool-request-serving-v46",
      "results_sha256": "b1296daced14ed185231c53379d09967f23786b0af58b65c8be5fa67995a3ad1",
      "manifest_sha256": "308ebcb401af9196e42f120b12870fcd6dbdf6a2a0aa2a0bd15c4d9b338d549e",
      "rows": 14,
      "completed_output_comparisons": 7,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/prefix-checkpoint-confirmation-v95",
      "results_sha256": "9bbaccc849f9908624009d2f19b9739d84d258420fa8c3da8f300b32281ea341",
      "manifest_sha256": "5f8d32773311773256ec1931753af59f354c4c4c1b6772f282de1bc6a615a810",
      "rows": 14,
      "completed_output_comparisons": 14,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/prefix-checkpoint-serving-v89",
      "results_sha256": "9ab891e16591a17673352e4b36ad819439c96790c84b4c116f52de5c842a226d",
      "manifest_sha256": "003ac011e5bfa6183646870f70b3ab2fad6c038ad081ff09fe36deaed67e86f8",
      "rows": 14,
      "completed_output_comparisons": 14,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/read-handles-serving-v32",
      "results_sha256": "8e2276d3205d3074aa1a412d5ed8d2b5b8e85ce22768a7405dfcef410546eed8",
      "manifest_sha256": "8462d3db0421b14a295f224c63194537c8a7f75f95478e051311901225ec25b4",
      "rows": 14,
      "completed_output_comparisons": 7,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/read-recovery-serving-v76",
      "results_sha256": "9d649d1012874c3056a68fa6423e4a70a79a66c12d0ed525eb66f08751201e56",
      "manifest_sha256": "c2f7237723e72a9c7db55ad8ff41a2dc998379277035834ac08a6fe8170c1e1f",
      "rows": 14,
      "completed_output_comparisons": 7,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/resident-overlap-serving-v140",
      "results_sha256": "134d742c68fde112600ce367d4dfc755afe064854c5204f4c09672cbcd2a71ac",
      "manifest_sha256": "c26a995f681ef9cb393e272b5d6178c41e283514fa6990f6d61edea0559c709d",
      "rows": 14,
      "completed_output_comparisons": 14,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/rope-prefill-serving-v152",
      "results_sha256": "69b75bd2d9052dbd10b21e5a2620a884806c3ccaff2fbb74d24e5b8bba417494",
      "manifest_sha256": "cba4c16d00c1edd6a366e01a7cf189815ee14623f23e61a2ea729328bc2a95fa",
      "rows": 14,
      "completed_output_comparisons": 14,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/rope-short-serving-v151",
      "results_sha256": "10a2be2640b626c07e71c5610d5e7f40d1e57f2b4e8f74360b8ab84e3c48f474",
      "manifest_sha256": "8e03868e02ffcdd4c0e00afb5ed85b4f94372364a24e5c721a7c91742500319d",
      "rows": 14,
      "completed_output_comparisons": 14,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/runtime-budget-confirmation-v55",
      "results_sha256": "b1fc6853ef748c4de067950ff15c9a1463fe30a372185f5e6a784405e1b2fd82",
      "manifest_sha256": "dff5b7f9747b4ecd830b61a733003a6c5460af7502faebcdfbf45024950e76f9",
      "rows": 10,
      "completed_output_comparisons": 5,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/runtime-budget-serving-v55",
      "results_sha256": "fe018d3fcab1d7fc5b91c0ebc3e2b50ae07ce1c7aab65249ff68312b1e5d78c7",
      "manifest_sha256": "117ef34d553ff4b9e855d16b909f439ce1fd2774eb738e6c41a15612b9549dc8",
      "rows": 14,
      "completed_output_comparisons": 7,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/sampled-draw-serving-v48",
      "results_sha256": "f91822d0ae0d5834508a180593f40364d6c9f681f352b370a3a27857e779d5db",
      "manifest_sha256": "d69acace7a00dbafd08fcdd03cf40540fce5036bf3fb4f308cea8d94c8c735e9",
      "rows": 21,
      "completed_output_comparisons": 14,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/scope-256-code-serving-v16",
      "results_sha256": "6272d2584fcbf4e211c82a157d0efe893d99ac20c98c0baa90aacca8b513e1a3",
      "manifest_sha256": "922ba007fde5b0fff54279d66a8cee233cbf56215b010bffce87d27126fa3aec",
      "rows": 6,
      "completed_output_comparisons": 3,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/scope-256-tile-1024-code-development-v22",
      "results_sha256": "ccadcba35935684f150423b7264dfa0b90b3564515af00e8c8926a25d1c8d8a9",
      "manifest_sha256": "4a0377263dc1d5c336c76c3ecc8d476bf21babc957ac9e0a1a3c3050f11fc87d",
      "rows": 6,
      "completed_output_comparisons": 3,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/scope-brief-code-serving-v28",
      "results_sha256": "a5159f1b4c84deddc13ddc8e044e3ecb18cc1ca6075225d8fd7179797c41e029",
      "manifest_sha256": "4142376de4ce2695f0b1f48728fad9baf93ee318990cf55cd3669146075298c7",
      "rows": 14,
      "completed_output_comparisons": 7,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/serving-aa-v6",
      "results_sha256": "829348f8f22bd2b2d15c122cd5033235b4eda5f079911a9c10b47af9c3e3ff25",
      "manifest_sha256": "3f627feb6ff8edb9ad39964c4767d1a1170b1be1cd33ebde91b27cb3896425b4",
      "rows": 6,
      "completed_output_comparisons": 3,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/serving-prefill-family-v6",
      "results_sha256": "331eaada75d8efd3a413e49804507eb1bf16a1976533addb8b4e13c13a6267c4",
      "manifest_sha256": "d721350f88150911df18d3b4c37da6edfb922362640d85b4f603292483c01c60",
      "rows": 6,
      "completed_output_comparisons": 3,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/serving-selector-queue-v11",
      "results_sha256": "ef88a5aa43170d5d9fc0a0d02bf736fe27cb4a2346b19190318752fa1210f834",
      "manifest_sha256": "371b65b16d936275668f6d7b6c8912e9d70352b0c09e7db4a7a5b430dc71b79b",
      "rows": 15,
      "completed_output_comparisons": 10,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/serving-smoke-v6",
      "results_sha256": "4daa5bb20b055d45f2c63e2e4f7ae0cf4bf8b107fa70268b0b7ea1313643bfd5",
      "manifest_sha256": "3b4824be07a9823398791bbbecb755332fae80faeb438f6bada3fb29812da793",
      "rows": 2,
      "completed_output_comparisons": 1,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/shared-overlap-serving-v14",
      "results_sha256": "d56c235cb8086e3df13213699399a75ec1a8c3ba02d06c0e525d4c6e8f3d69ff",
      "manifest_sha256": "e84a478366e56213a058906cd19cdfe14dea7a0eb23624d7446160d6d5537584",
      "rows": 10,
      "completed_output_comparisons": 5,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/slot-slices-serving-v86",
      "results_sha256": "5eaf30f4fcdf682e177467709aca7c4e0e8919ba8e1def563b85a2cfb6525dfa",
      "manifest_sha256": "f1e70227a6087c20f1bdd7878b6a54cbf53bfec0df2caca4a5d5b5522db69e4c",
      "rows": 14,
      "completed_output_comparisons": 14,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/slot-words-serving-v87",
      "results_sha256": "fd42fa319fa29171d5a8c19af89c780378184b6babb911f3b63f2d7b56498d21",
      "manifest_sha256": "252b30cf706a61b0689ad70bdd2a4d68fcd19959ac7bfa46c9140ec459dc2c6f",
      "rows": 14,
      "completed_output_comparisons": 14,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/terminal-prefill-serving-v38",
      "results_sha256": "0e0332cee129301bdb5621ac1c5f0e850c7be960b0d34131fc843856e0bd4143",
      "manifest_sha256": "7f37da6b225157ba86ff3cd0c4be99ebffd20aa590b565cb0fdd2d8811c29285",
      "rows": 14,
      "completed_output_comparisons": 7,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/terminal-tail-serving-v155",
      "results_sha256": "f6428b961b551d9412da7ab93958b223d0a2610e9d62ae411db0d642528cf2ad",
      "manifest_sha256": "6195fef382bd708df09ffe1bfcf79e6c0a49dd1e2c3d20e3235870f1877fe7e2",
      "rows": 10,
      "completed_output_comparisons": 8,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/vision-query-1024-serving-v132",
      "results_sha256": "f73a8d312bc261db44ca15ea9feb27a58d28c00fc5a9ae4379d88305cd9d8ddc",
      "manifest_sha256": "8881ef7c2e90538c75ba11d446e1880769ecd767b8c771086c78a8ea482eed61",
      "rows": 9,
      "completed_output_comparisons": 8,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/vision-query-1536-capacity-serving-v160",
      "results_sha256": "a046da9d1d2b44a447d1e56955e044618c12b5331cbee9c7fe3de27080571b0c",
      "manifest_sha256": "584516a5698b9862a8fdbb0bbdd0b344a4d19bd3dbed3da0d344ac4ba18cfcb5",
      "rows": 5,
      "completed_output_comparisons": 0,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/vision-query-1536-fixed-pool-serving-v158",
      "results_sha256": "c21699650d51c7e835109d12b31d125ba45ae45f1c0d9d1fda744b2bd2607e83",
      "manifest_sha256": "6bf503ae6de7a83ec3727e8b83608102361ca3f30074961e28e021bd0080dda6",
      "rows": 1,
      "completed_output_comparisons": 0,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/vision-query-1536-paired-serving-v157",
      "results_sha256": "3c65c27916635c5dc8636a8644024d9c53d0c5a959037a01eb3457e666eb10a8",
      "manifest_sha256": "2cd2e831682d62eef256d73e88e54427a15b27340c7f6b72d51f8be1bfbbdd1a",
      "rows": 1,
      "completed_output_comparisons": 0,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/vision-query-1536-serving-v130",
      "results_sha256": "d0ff5a53a2cbdbca08ef1d637bd88d700adb37424f72634107015040047de7fa",
      "manifest_sha256": "6bdfdaac85c6e92e083237961c425b8c2475888e0015904f697aa37c8f035d04",
      "rows": 1,
      "completed_output_comparisons": 0,
      "mismatches": []
    },
    {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/vision-query-512-serving-v131",
      "results_sha256": "f1130c505e7205f795a017e3768f00f201beab28c8176f0b97731c9fd474e0cb",
      "manifest_sha256": "3d0134e15ca2beb6d4bfcf643f569cbd4772e69db940a36c715f48e8dc63cdf2",
      "rows": 14,
      "completed_output_comparisons": 14,
      "mismatches": []
    }
  ],
  "study_count": 55,
  "comparisons": 445,
  "mismatch_count": 0
}

````

## /tmp/slotstream-optimization-execution/paired-correctness-v228/after/optimization_prerequisites_test.py

SHA-256 `85f3072ee811515d8de0a87b4764687348a0a790f2dcebc6b2629610bb14302c`; 15963 bytes.

````text
"""Receipt binding tests; benchmark statistics are tested by prefill_bench_test."""
import copy
from contextlib import ExitStack
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

from optimization_soak import validate_prerequisites
from prefill_bench import digest


class PrerequisiteTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.identity = {k: c * 64 for k, c in [('binary_sha256', 'a'),
            ('source_archive_sha256', 'b'), ('metallib_sha256', 'c')]}
        self.build = {'identity': self.identity}
        self.decision = [{'candidate': 'combined', 'passed': True, 'checks': {'fixture': True}}]
        self.protocol = {'mtp': 'off', 'env': {'SLOTSTREAM_OPT_FINAL_FORWARD': '1'},
                         'prerequisites': {'native': {}, 'paired': {}}}
        for name, variant in [('combined-plain', 'integrated'), ('combined-mtp', 'integrated-mtp'),
                              ('read-failure-serving', 'read-failure-serving')]:
            entry = self.entry('native', name)
            self.write(entry, 'manifest.json', {'identity': self.identity, 'passed': True, 'exit_code': 0,
                'assertions': 1, 'command': ['/unused/slotstream', 'optimization-state-check', '--variant', variant]})
            self.write(entry, 'stdout.txt', {'passed': True, 'items': [{'passed': True}]})
        for name in ['short-one', 'unique-prose', 'sampled-short', 'mtp-resource', 'distinct-tail',
                     'complete-repeat', 'unique-with-retention', 'actual-default-one-token']:
            entry = self.entry('paired', name)
            gate = {'minimum_pairs': 5, 'replacement_rounds': 0, 'all_outputs_exact': True}
            if name in ['short-one', 'distinct-tail', 'complete-repeat']:
                gate.update(minimum_median_client_reduction=.05, minimum_positive_fraction=.8)
            else:
                gate.update(maximum_median_client_regression=.05, minimum_positive_fraction=0)
            if name in ['unique-prose', 'sampled-short', 'mtp-resource']:
                gate.update(minimum_active_savings_bytes=300_000_000, minimum_sampled_peak_savings_bytes=200_000_000)
            self.write(entry, 'manifest.json', {'protocol': {'rounds': 16,
                'mtp': 'off', 'minimum_output_tokens': 1, 'max_tokens': 1,
                'maximum_sampled_footprint_bytes': 8_100_000_000,
                'arms': {arm: {'chunk': 256, 'env': {}} for arm in ['reference', 'combined']},
                'acceptance': gate,
                'startup_acceptance': {'minimum_pairs': 5, 'maximum_median_first_job_regression': .05,
                    'all_outputs_exact': True}},
                'arm_builds': {arm: self.build for arm in ['reference', 'combined']}})
            self.write(entry, 'completion.json', {'interrupted': False, 'stopped_early': False,
                'planned_cells': 32, 'recorded_cells': 32, 'acceptance': self.decision,
                'startup_acceptance': self.decision})
            self.write(entry, 'results.jsonl', [self.response_row(i, arm)
                for i in range(1, 17) for arm in ['reference', 'combined']])
        self.modify('paired', 'actual-default-one-token', 'manifest.json',
            lambda m: m['protocol'].update(arms={'reference': {'chunk': 256, 'env': {'SLOTSTREAM_OPT_FINAL_FORWARD': '0'}},
                'combined': {'chunk': 256, 'env': {}}}, max_tokens=1, minimum_output_tokens=1,
                prefix_cache={'retention_only': True, 'expected_reused_tokens': {'reference': 0, 'combined': 0}}))
        self.contract_path = self.root / 'qualification-contract.json'
        self.contract = {'format': 'slotstream-qualification-v1', 'build_identity': copy.deepcopy(self.identity),
            'native': {}, 'paired_protocols': {}, 'soak_modes': {}}
        for name, entry in self.protocol['prerequisites']['native'].items():
            manifest = json.loads((Path(entry['directory']) / 'manifest.json').read_text())
            self.contract['native'][name] = {'command': manifest['command'], 'environment': {}}
        for name, entry in self.protocol['prerequisites']['paired'].items():
            self.contract['paired_protocols'][name] = json.loads(
                (Path(entry['directory']) / 'manifest.json').read_text())['protocol']
        for mode in ['off', 'on']:
            self.contract['soak_modes'][mode] = {'mtp': mode, 'env': copy.deepcopy(self.protocol['env'])}
        self.freeze_contract()

    @staticmethod
    def response_row(number, arm):
        return {'round': number, 'arm': arm, 'valid': True,
            'client_seconds': 1.0, 'startup_seconds': 1.0,
            'startup_and_warmup_valid': True, 'text': 'measured',
            'first_request': {'prompt_ids': [17], 'output_ids': [7], 'text': 'first',
                'effective_mtp': False, 'effective_pool_slots': 640, 'complete_seconds_from_launch': 2.0},
            'metrics': {'schema_version': 1, 'prompt_ids': [101, 102], 'output_ids': [7],
                'effective_mtp': False, 'effective_pool_slots': 640, 'effective_prefill_chunk': 256,
                'stats': {'prefillSeconds': .5, 'decodeSeconds': .5, 'requestSeconds': 1.0,
                    'imageEncodeSeconds': 0.0, 'prefillRecords': 1, 'decodeRecords': 0,
                    'prefillTokens': 2, 'decodeTokens': 1, 'promptTokens': 2, 'prefillPasses': [2],
                    'lifetimeRSSPeakBytes': 1_000_000, 'sampledFootprint': {'peakBytes': 2_000_000}}}}

    def execution_mutation(self, change):
        self.modify('paired', 'unique-prose', 'results.jsonl', lambda rows: change(rows[-1]))
        with self.assertRaisesRegex(ValueError, 'paired execution failed'):
            self.validate()

    def test_vm_excluded_measured_output_change_is_a_correctness_failure(self):
        def mutate(row):
            row.update(valid=False, exclusion='swap activity')
            row['metrics']['output_ids'] = [8]
        self.execution_mutation(mutate)

    def test_excluded_first_output_change_is_a_correctness_failure(self):
        def mutate(row):
            row.update(valid=False, startup_and_warmup_valid=False, exclusion='swap activity')
            row['first_request']['output_ids'] = [8]
        self.execution_mutation(mutate)

    def test_vm_excluded_absolute_peak_overflow_still_fails(self):
        def mutate(row):
            row.update(valid=False, exclusion='swap activity')
            row['metrics']['stats']['sampledFootprint']['peakBytes'] = 8_100_000_001
        self.execution_mutation(mutate)

    def test_request_failure_is_not_a_discardable_timing_sample(self):
        self.execution_mutation(lambda row: row.update(valid=False, error='HTTP 500 fixture'))

    def test_preflight_refusal_leaves_the_final_matrix_incomplete(self):
        def mutate(row):
            row.pop('metrics'); row.pop('first_request')
            row.update(valid=False, error='InsufficientHeadroom fixture')
        self.execution_mutation(mutate)

    def test_completed_wrong_configuration_is_not_a_discardable_sample(self):
        def mutate(row):
            row.update(valid=False)
            row['metrics']['effective_prefill_chunk'] = 512
        self.execution_mutation(mutate)

    def test_wrong_or_truncated_token_metadata_is_not_discardable(self):
        self.execution_mutation(lambda row: row['metrics'].update(output_ids=[]))

    def test_vm_excluded_identical_complete_responses_remain_eligible_for_correctness(self):
        self.modify('paired', 'unique-prose', 'results.jsonl',
            lambda rows: rows[-1].update(valid=False, startup_and_warmup_valid=False, exclusion='swap activity'))
        self.assertEqual(len(self.validate()), 12)

    def test_actual_default_guard_rejects_forced_controls_even_when_frozen(self):
        self.actual_default_mutation(lambda p: p['arms']['combined']['env'].update(SLOTSTREAM_OPT_FINAL_FORWARD='1'))

    def test_actual_default_guard_rejects_disabled_retention_even_when_frozen(self):
        self.actual_default_mutation(lambda p: p.pop('prefix_cache'))

    def test_actual_default_guard_rejects_larger_reply_even_when_frozen(self):
        self.actual_default_mutation(lambda p: p.update(max_tokens=16, minimum_output_tokens=16))

    def actual_default_mutation(self, change):
        name = 'actual-default-one-token'
        self.modify('paired', name, 'manifest.json', lambda m: change(m['protocol']))
        entry = self.protocol['prerequisites']['paired'][name]
        self.contract['paired_protocols'][name] = json.loads((Path(entry['directory']) / 'manifest.json').read_text())['protocol']
        self.freeze_contract()
        with self.assertRaisesRegex(ValueError, 'actual-default guard'):
            self.validate()

    def freeze_contract(self):
        self.contract_path.write_text(json.dumps(self.contract))
        self.protocol['qualification_contract'] = {'path': str(self.contract_path),
            'sha256': digest(self.contract_path)}

    def entry(self, kind, name):
        path = self.root / name; path.mkdir()
        entry = {'directory': str(path), 'sha256': {}}
        self.protocol['prerequisites'][kind][name] = entry
        return entry

    def write(self, entry, name, data):
        path = Path(entry['directory']) / name
        path.write_text(''.join(json.dumps(row) + '\n' for row in data)
                        if name.endswith('jsonl') else json.dumps(data))
        entry['sha256'][name] = digest(path)

    def modify(self, kind, name, file, change):
        entry = self.protocol['prerequisites'][kind][name]
        path = Path(entry['directory']) / file
        data = ([json.loads(line) for line in path.read_text().splitlines()]
                if file.endswith('jsonl') else json.loads(path.read_text()))
        change(data); self.write(entry, file, data)

    def validate(self, *, recomputed=None):
        with ExitStack() as stack:
            summary = stack.enter_context(patch('optimization_soak.bench.summaries', return_value=['fixture']))
            acceptance = stack.enter_context(patch('optimization_soak.bench.acceptance_results',
                return_value=self.decision if recomputed is None else recomputed))
            startup = stack.enter_context(patch('optimization_soak.bench.startup_acceptance_results',
                return_value=self.decision))
            result = validate_prerequisites(self.protocol, self.build)
            self.assertEqual((summary.call_count, acceptance.call_count, startup.call_count), (8, 8, 8))
            return result

    def test_complete_same_build_evidence_is_recomputed_and_accepted(self):
        self.assertEqual(len(self.validate()), 12)
        self.protocol['mtp'] = 'on'
        self.assertEqual(self.validate()['qualification_contract'], self.contract)

    def test_different_soak_controls_cannot_borrow_passing_evidence(self):
        self.protocol['env']['SLOTSTREAM_OPT_FINAL_FORWARD'] = '0'
        with self.assertRaisesRegex(ValueError, 'soak workload or controls'): self.validate()

    def test_relabeling_or_changing_a_paired_workload_is_rejected(self):
        # Even a newly signed report from the same binary may not replace the
        # pre-run workload with another prompt, budget, mode or control.
        entry = self.protocol['prerequisites']['paired']['unique-prose']
        before = json.loads((Path(entry['directory']) / 'manifest.json').read_text())
        for field, value in [('fixture_sha256', 'f' * 64), ('memory_gb', 10),
                             ('mtp', 'on'), ('arms', {'combined': {'env': {}}}),
                             ('required_equal_work', [])]:
            self.modify('paired', 'unique-prose', 'manifest.json', lambda d: d['protocol'].update({field: value}))
            with self.assertRaisesRegex(ValueError, 'paired workload or controls'): self.validate()
            self.write(entry, 'manifest.json', before)

    def test_native_environment_must_match_the_same_pre_run_contract(self):
        self.modify('native', 'combined-plain', 'manifest.json',
                    lambda d: d.update(environment={'SLOTSTREAM_OPT_FINAL_FORWARD': '0'}))
        with self.assertRaisesRegex(ValueError, 'native workload or controls'): self.validate()

    def test_contract_identity_build_and_complete_workloads_are_required(self):
        self.contract_path.write_text('{}')
        with self.assertRaisesRegex(ValueError, 'contract identity'): self.validate()
        self.freeze_contract()
        original = copy.deepcopy(self.contract)
        for mutate in [lambda c: c['build_identity'].update(source_archive_sha256='e' * 64),
                       lambda c: c['paired_protocols'].pop('short-one'),
                       lambda c: c['soak_modes'].pop('on')]:
            mutate(self.contract); self.freeze_contract()
            with self.assertRaises(ValueError): self.validate()
            self.contract = copy.deepcopy(original)
        self.freeze_contract()

    def test_missing_and_duplicate_workload_evidence_refused(self):
        with self.assertRaises(ValueError): validate_prerequisites({}, self.build)
        original = copy.deepcopy(self.protocol)
        del self.protocol['prerequisites']['native']['combined-mtp']
        with self.assertRaises(ValueError): self.validate()
        self.protocol = original
        p = self.protocol['prerequisites']['paired']; p['short-one'] = p['unique-prose']
        with self.assertRaisesRegex(ValueError, 'own study'): self.validate()

    def test_changed_receipt_digest_is_rejected(self):
        entry = self.protocol['prerequisites']['native']['combined-plain']
        (Path(entry['directory']) / 'stdout.txt').write_text('{}')
        with self.assertRaisesRegex(ValueError, 'digest differs'): self.validate()

    def test_native_wrong_source_failed_assertion_and_wrong_variant_are_rejected(self):
        original = copy.deepcopy(self.protocol)
        for file, mutate in [
            ('manifest.json', lambda d: d['identity'].update(source_archive_sha256='d' * 64)),
            ('stdout.txt', lambda d: d['items'][0].update(passed=False)),
            ('manifest.json', lambda d: d.update(command=['slotstream', 'optimization-state-check', '--variant', 'integrated-mtp']))]:
            entry = self.protocol['prerequisites']['native']['combined-plain']
            data = json.loads((Path(entry['directory']) / file).read_text())
            self.modify('native', 'combined-plain', file, mutate)
            with self.assertRaises(ValueError): self.validate()
            self.write(entry, file, data)
            self.protocol = copy.deepcopy(original)

    def test_incomplete_duplicate_and_other_build_paired_runs_refused(self):
        entry = self.protocol['prerequisites']['paired']['short-one']
        for file, mutate in [
            ('completion.json', lambda d: d.update(stopped_early=True)),
            ('results.jsonl', lambda d: d.__setitem__(-1, d[0])),
            ('manifest.json', lambda d: d['arm_builds']['combined']['identity'].update(binary_sha256='e' * 64)),
            ('manifest.json', lambda d: d['protocol']['acceptance'].update(minimum_pairs=1)),
            ('manifest.json', lambda d: d['protocol']['acceptance'].update(minimum_median_client_reduction=0))]:
            path = Path(entry['directory']) / file; content = path.read_bytes(); before = entry['sha256'][file]
            self.modify('paired', 'short-one', file, mutate)
            with self.assertRaises(ValueError): self.validate()
            path.write_bytes(content); entry['sha256'][file] = before

    def test_claimed_pass_does_not_override_recomputed_failure(self):
        with self.assertRaisesRegex(ValueError, 'recomputed'):
            self.validate(recomputed=[{'candidate': 'combined', 'passed': False}])


if __name__ == '__main__': unittest.main()

````

## /tmp/slotstream-optimization-execution/paired-correctness-v228/after/optimization_soak.py

SHA-256 `6b454f9a16f81e5f4b125d8d93eb2c4b5e8c48135f17b67c8a8a8320862d78be`; 30025 bytes.

````text
#!/usr/bin/env python3
"""Bounded repeated-request lifetime qualification; no latency improvement claims."""
import argparse
from contextlib import contextmanager
import http.client
import json
import math
import os
from pathlib import Path
import shutil
import signal
import socket
import subprocess
import time

import serve_bench as bench
from prefill_bench import ROOT, digest, model_identity, preflight, vm_snapshot


@contextmanager
def wall_deadline(seconds):
    """Bound the complete live-server interval, including a stalled response.

    Socket timeouts alone bound each blocking read, not a stream that keeps
    delivering small frames. This standalone driver owns its main-thread timer.
    Cleanup happens outside the deadline so the owned server is always reaped.
    """
    if signal.getitimer(signal.ITIMER_REAL) != (0.0, 0.0):
        raise RuntimeError('another real-time alarm is already active')
    previous = signal.getsignal(signal.SIGALRM)
    def expired(signum, frame):
        raise TimeoutError('fixed lifetime duration exhausted')
    signal.signal(signal.SIGALRM, expired)
    try:
        signal.setitimer(signal.ITIMER_REAL, seconds)
        yield
    finally:
        signal.setitimer(signal.ITIMER_REAL, 0)
        signal.signal(signal.SIGALRM, previous)


def clean_resource_observation(row, protocol):
    metrics = row.get('metrics') or {}
    stats = metrics.get('stats') or {}
    errors = bench.resource_exclusions(stats, {
        'maximum_sampled_footprint_bytes': protocol['acceptance']['maximum_sampled_physical_peak_bytes'],
        'require_nominal_power_state': True,
        'images': row.get('has_image', False),
    })
    for before, after in [(row.get('before'), row.get('after')),
                          (stats.get('generatorVMBefore'), stats.get('generatorVMAfter'))]:
        if not isinstance(before, dict) or not isinstance(after, dict) or any(
            type(before.get(k)) is not int or type(after.get(k)) is not int or before[k] != after[k]
            for k in ['swapins', 'swapouts']):
            errors.append('missing or changed VM interval')
    return not errors, errors


def assess(protocol, rows):
    gate = protocol['acceptance']
    names = [item['name'] for item in protocol['sequence']]
    cycles = protocol['measured_cycles']
    warmup = protocol['warmup_cycles']
    expected = [(cycle, name) for cycle in range(-warmup, cycles) for name in names]
    coordinates = [(row['cycle'], row['name']) for row in rows]
    if len(coordinates) != len(set(coordinates)) or any(c not in expected for c in coordinates):
        raise ValueError('duplicate or undeclared soak request')
    checks = {'fixed_sequence_completed': coordinates == expected,
              'all_requests_succeeded': all(row.get('succeeded') is True for row in rows)}
    # Runtime failures and absolute overflows are failures even during warmup.
    peaks = [bench.sampled_request_peak((r.get('metrics') or {}).get('stats') or {}) for r in rows]
    checks['physical_ceiling'] = bool(peaks) and all(type(p) is int and 0 < p <=
        gate['maximum_sampled_physical_peak_bytes'] for p in peaks)
    details = []
    for name in names:
        selected = [r for r in rows if r['cycle'] >= 0 and r['name'] == name]
        clean = [r for r in selected if clean_resource_observation(r, protocol)[0]]
        early = [r for r in clean if r['cycle'] < cycles // 2]
        late = [r for r in clean if r['cycle'] >= cycles // 2]
        one = {'minimum_clean_observations': len(clean) >= gate['minimum_clean_observations_per_position'],
               'early_observations': len(early) >= gate['minimum_clean_early_observations_per_position'],
               'late_observations': len(late) >= gate['minimum_clean_late_observations_per_position']}
        outputs = [(r.get('metrics', {}).get('output_ids'), r.get('text')) for r in selected]
        one['exact_replay'] = bool(outputs) and bool(outputs[0][0]) and all(v == outputs[0] for v in outputs)
        growth = {}
        for field, limit in [('mlxActiveEndBytes', gate['maximum_active_growth_bytes_per_position']),
                             ('physicalFootprintEndBytes', gate['maximum_physical_end_growth_bytes_per_position'])]:
            a = [r['metrics']['stats'].get(field) for r in early]
            b = [r['metrics']['stats'].get(field) for r in late]
            valid = bool(a) and bool(b) and all(type(v) is int and v > 0 for v in a + b)
            growth[field] = max(b) - min(a) if valid else None
            one[field] = valid and growth[field] <= limit
        embedding_bytes = [(r.get('metrics') or {}).get('stats', {}).get('embeddingCachedPayloadBytes')
                           for r in selected]
        one['bounded_embedding_rows'] = bool(embedding_bytes) and all(
            type(value) is int and 0 <= value <= gate['maximum_cached_embedding_payload_bytes']
            for value in embedding_bytes)
        one['embedding_rows_enabled'] = bool(selected) and all(
            (r.get('metrics') or {}).get('stats', {}).get('embeddingRowsEnabled') is True for r in selected)
        one['bounded_prefix_capacity'] = bool(selected) and all(
            r.get('prefix', {}).get('enabled') is True
            and type(r['prefix'].get('conversations')) is int
            and 1 <= r['prefix']['conversations'] <= gate['maximum_prefix_entries']
            and type(r['prefix'].get('charged_token_capacity')) is int
            and type(r['prefix'].get('max_tokens')) is int
            and 0 <= r['prefix']['charged_token_capacity'] <= r['prefix']['max_tokens']
            for r in selected)
        details.append({'name': name, 'passed': all(one.values()), 'checks': one,
                        'clean_cycles': [r['cycle'] for r in clean], 'observed_growth_bytes': growth})
    checks['positions_pass'] = all(d['passed'] for d in details)
    return {'classification': 'Bounded repeated-request lifetime qualification; no throughput or unbounded-lifetime claim',
            'passed': all(checks.values()), 'checks': checks, 'positions': details}


def prefix_snapshot(port):
    connection = http.client.HTTPConnection('127.0.0.1', port, timeout=10)
    try:
        connection.request('POST', '/api/show', b'{}', {'Content-Type': 'application/json'})
        response = connection.getresponse()
        data = response.read(1 << 20)
        if response.status != 200 or len(data) >= 1 << 20:
            raise ValueError('bounded prefix snapshot unavailable')
        return json.loads(data)['details']['prefix_cache']
    finally:
        connection.close()


def qualification_contract(protocol, build):
    """Bind every workload and control to one reviewed pre-run matrix.

    A passing report with the right build and a different directory can still
    be the wrong workload. The separate frozen contract prevents relabeling a
    study or changing the soak's controls after its prerequisites were run.
    """
    binding = protocol.get('qualification_contract')
    if not isinstance(binding, dict) or set(binding) != {'path', 'sha256'}:
        raise ValueError('a frozen qualification contract is required')
    path = Path(binding['path'])
    if not path.is_file() or not 0 < path.stat().st_size <= 2_000_000 or digest(path) != binding['sha256']:
        raise ValueError('qualification contract identity or size differs')
    contract = json.loads(path.read_text())
    keys = {'format', 'build_identity', 'native', 'paired_protocols', 'soak_modes'}
    if not isinstance(contract, dict) or set(contract) != keys or contract['format'] != 'slotstream-qualification-v1':
        raise ValueError('invalid qualification contract format')
    identity_keys = {'binary_sha256', 'source_archive_sha256', 'metallib_sha256'}
    identity = contract['build_identity']
    if not isinstance(identity, dict) or set(identity) != identity_keys or any(
            not isinstance(identity[k], str) or len(identity[k]) != 64
            or identity[k] != build['identity'].get(k) for k in identity_keys):
        raise ValueError('qualification contract belongs to another build')
    modes = contract['soak_modes']
    declared = {k: v for k, v in protocol.items() if k not in {'qualification_contract', 'prerequisites'}}
    if (not isinstance(modes, dict) or set(modes) != {'off', 'on'}
            or declared != modes.get(protocol.get('mtp'))):
        raise ValueError('soak workload or controls differ from the frozen qualification contract')
    return contract


def validate_paired_execution(name, protocol, rows):
    """Timing exclusions never excuse wrong, missing or over-budget requests.

    The final matrix may exclude completed cells from timing for VM/thermal
    activity. Every attempted cell must still deliver the frozen workload and
    the same outputs. A preflight refusal leaves final qualification incomplete.
    This does not rescore or modify earlier component studies.
    """
    def refuse(reason):
        raise ValueError(f'paired execution failed for {name}: {reason}')

    mode = protocol.get('mtp', 'off')
    ceiling = protocol.get('maximum_sampled_footprint_bytes')
    minimum, maximum = protocol.get('minimum_output_tokens'), protocol.get('max_tokens')
    if (type(mode) is not str or mode not in {'off', 'on'} or type(ceiling) is not int or ceiling <= 0
            or type(minimum) is not int or type(maximum) is not int
            or not 1 <= minimum <= maximum <= 512):
        refuse('missing or invalid workload/resource bounds')
    anchors, pools, work = {}, {}, {}
    for row in rows:
        if 'error' in row or row.get('interrupted') is True:
            refuse('failed or interrupted request, regardless of timing eligibility')
        arm = protocol.get('arms', {}).get(row.get('arm'), {})
        metrics, first = row.get('metrics'), row.get('first_request')
        if type(metrics) is not dict or type(first) is not dict:
            refuse('both first and measured responses must be captured')
        for phase, data, text in [('first', first, first.get('text')),
                                  ('measured', metrics, row.get('text'))]:
            prompt, output = data.get('prompt_ids'), data.get('output_ids')
            if (type(prompt) is not list or not prompt or type(output) is not list
                    or not minimum <= len(output) <= maximum
                    or any(type(token) is not int or token < 0 for token in prompt + output)
                    or type(text) is not str):
                refuse(f'{phase} response has missing, malformed or truncated tokens/text')
            if type(data.get('effective_mtp')) is not bool or data['effective_mtp'] != (mode == 'on'):
                refuse(f'{phase} speculative mode differs from the declared workload')
            slots = data.get('effective_pool_slots')
            if type(slots) is not int or slots <= 0:
                refuse(f'{phase} pool size is missing or invalid')
            if protocol.get('comparison_basis', 'fixed-pool') == 'fixed-pool':
                if slots != pools.setdefault(phase, slots):
                    refuse(f'{phase} fixed pool differs between cells')
            observation = (tuple(prompt), tuple(output), text)
            if observation != anchors.setdefault(phase, observation):
                refuse(f'{phase} input/output differs, including a timing-excluded cell')
        if metrics.get('effective_prefill_chunk') != arm.get('chunk'):
            refuse('measured prefill setting differs from the frozen arm')
        if type(metrics.get('stats')) is not dict:
            refuse('measured statistics are missing or malformed')
        prefix = protocol.get('prefix_cache', {})
        complete = (prefix.get('complete_prompt') is True
                    and prefix.get('expected_reused_tokens', {}).get(row['arm'], 0) > 0)
        try:
            stats = bench.validate_metrics(metrics, allow_complete_prompt=complete)
        except (KeyError, TypeError, ValueError) as error:
            refuse(f'invalid measured response: {error}')
        peak = bench.sampled_request_peak(stats)
        if type(peak) is not int or not 0 < peak <= ceiling:
            refuse('absolute measured footprint ceiling, regardless of timing eligibility')
        durations = [row.get('client_seconds'), row.get('startup_seconds'),
                     first.get('complete_seconds_from_launch'), stats.get('requestSeconds')]
        if any(type(value) not in (int, float) or not math.isfinite(value) or value <= 0
               for value in durations):
            refuse('missing or invalid completed-request duration')
        for field in protocol.get('required_equal_work', []):
            value = stats.get(field)
            if type(value) is not int or value < 0 or value != work.setdefault(field, value):
                refuse(f'declared equal work differs: {field}')


def validate_prerequisites(protocol, build):
    """Require the final candidate's native and paired evidence before launch.

    Digests bind the exact reports; same-binary/source/Metal identity prevents
    borrowing a passing gate from an earlier implementation. Paired decisions
    are recomputed from their frozen rows using the ordinary benchmark gates.
    """
    required_native = {'combined-plain', 'combined-mtp', 'read-failure-serving'}
    required_paired = {'short-one', 'unique-prose', 'sampled-short', 'mtp-resource',
                       'distinct-tail', 'complete-repeat', 'unique-with-retention', 'actual-default-one-token'}
    prerequisites = protocol.get('prerequisites')
    if not isinstance(prerequisites, dict) or set(prerequisites) != {'native', 'paired'}:
        raise ValueError('native and paired final-candidate prerequisites are mandatory')
    for kind, names in [('native', required_native), ('paired', required_paired)]:
        if not isinstance(prerequisites[kind], dict) or set(prerequisites[kind]) != names:
            raise ValueError(f'complete {kind} prerequisite set required')
    contract = qualification_contract(protocol, build)
    for field, names in [('native', required_native), ('paired_protocols', required_paired)]:
        if not isinstance(contract[field], dict) or set(contract[field]) != names:
            raise ValueError(f'qualification contract requires every {field} workload')

    def same_identity(identity):
        return isinstance(identity, dict) and all(identity.get(k) == build['identity'].get(k)
            and isinstance(identity.get(k), str) and len(identity[k]) == 64
            for k in ['binary_sha256', 'source_archive_sha256', 'metallib_sha256'])

    def evidence(entry, name):
        path = Path(entry['directory']) / name
        if digest(path) != entry['sha256'][name]:
            raise ValueError(f'prerequisite digest differs: {path}')
        return path

    # Preserve the exact parsed contract with the receipt, not just its path.
    observed = {'qualification_contract': contract}
    for name, entry in prerequisites['native'].items():
        manifest = json.loads(evidence(entry, 'manifest.json').read_text())
        report = json.loads(evidence(entry, 'stdout.txt').read_text())
        items = report.get('items')
        if (not same_identity(manifest.get('identity')) or manifest.get('passed') is not True
                or manifest.get('exit_code') != 0 or report.get('passed') is not True
                or report.get('skipped') is not None or not isinstance(items, list) or not items
                or any(item.get('passed') is not True for item in items)
                or manifest.get('assertions') != len(items)):
            raise ValueError(f'native prerequisite failed or belongs to another build: {name}')
        command = manifest.get('command') or []
        if contract['native'][name] != {'command': command, 'environment': manifest.get('environment', {})}:
            raise ValueError(f'native workload or controls differ from the frozen contract: {name}')
        variants = {'combined-plain': ['integrated', 'integrated-vision-query'],
                    'combined-mtp': ['integrated-mtp', 'integrated-vision-query-mtp'],
                    'read-failure-serving': ['read-failure-serving']}[name]
        if ('optimization-state-check' not in command or '--variant' not in command
                or command.index('--variant') + 1 >= len(command)
                or command[command.index('--variant') + 1] not in variants):
            raise ValueError(f'native prerequisite has the wrong diagnostic: {name}')
        observed[name] = {'passed': True, 'assertions': len(items)}

    paired_directories = [str(Path(entry['directory']).resolve()) for entry in prerequisites['paired'].values()]
    if len(set(paired_directories)) != len(required_paired):
        raise ValueError('each paired workload requires its own study')
    for name, entry in prerequisites['paired'].items():
        manifest = json.loads(evidence(entry, 'manifest.json').read_text())
        completion = json.loads(evidence(entry, 'completion.json').read_text())
        rows = [json.loads(line) for line in evidence(entry, 'results.jsonl').read_text().splitlines()]
        declared = manifest['protocol']
        if declared != contract['paired_protocols'][name]:
            raise ValueError(f'paired workload or controls differ from the frozen contract: {name}')
        if name == 'actual-default-one-token':
            selected = declared.get('arms', {}).get('combined', {})
            prefix = declared.get('prefix_cache', {})
            if (selected.get('env') != {} or declared.get('max_tokens') != 1
                    or declared.get('minimum_output_tokens') != 1
                    or prefix.get('retention_only') is not True
                    or prefix.get('expected_reused_tokens') != {'reference': 0, 'combined': 0}):
                raise ValueError('actual-default guard requires unoverridden defaults, one output token and enabled unique-prompt retention')
        arms = manifest.get('arm_builds') or {}
        if (not arms or any(not same_identity(arm.get('identity')) for arm in arms.values())
                or completion.get('interrupted') is not False or completion.get('stopped_early') is not False
                or declared.get('rounds') != 16 or len(arms) != 2 or 'reference' not in arms
                or completion.get('planned_cells') != 32 or completion.get('recorded_cells') != 32
                or len(rows) != 32 or 'error' in completion):
            raise ValueError(f'paired prerequisite incomplete or belongs to another build: {name}')
        coordinates = [(row['round'], row['arm']) for row in rows]
        if len(set(coordinates)) != 32 or set(coordinates) != {
                (i, arm) for i in range(1, 17) for arm in arms}:
            raise ValueError(f'paired prerequisite has missing or duplicate cells: {name}')
        validate_paired_execution(name, declared, rows)
        if not declared.get('acceptance') or not declared.get('startup_acceptance'):
            raise ValueError(f'paired prerequisite lacks both frozen acceptance gates: {name}')
        gate, first = declared['acceptance'], declared['startup_acceptance']
        required_gate = {'minimum_pairs': 5, 'replacement_rounds': 0, 'all_outputs_exact': True}
        if name in {'short-one', 'distinct-tail', 'complete-repeat'}:
            required_gate.update(minimum_median_client_reduction=.05, minimum_positive_fraction=.8)
        else:
            required_gate.update(maximum_median_client_regression=.05, minimum_positive_fraction=0)
        if name in {'unique-prose', 'sampled-short', 'mtp-resource'}:
            required_gate.update(minimum_active_savings_bytes=300_000_000,
                                 minimum_sampled_peak_savings_bytes=200_000_000)
        if (gate != required_gate or first != {'minimum_pairs': 5,
                'maximum_median_first_job_regression': .05, 'all_outputs_exact': True}):
            raise ValueError(f'paired prerequisite weakens final-matrix bounds: {name}')
        summary = bench.summaries(rows, 'reference', declared.get('comparison_basis', 'fixed-pool'),
                                  declared.get('required_equal_work'))
        accepted = bench.acceptance_results(summary, declared['acceptance'])
        startup = bench.startup_acceptance_results(rows, 'reference', declared['startup_acceptance'])
        if (not accepted or not startup or any(item.get('passed') is not True for item in accepted + startup)
                or accepted != completion.get('acceptance') or startup != completion.get('startup_acceptance')):
            raise ValueError(f'paired prerequisite fails recomputed request/first-job gates: {name}')
        observed[name] = {'passed': True, 'cells': len(rows)}
    return observed


def validate_protocol(protocol):
    integer_fields = ['memory_gb', 'max_context', 'warmup_cycles', 'measured_cycles',
                      'maximum_duration_seconds_per_mode', 'maximum_prompt_tokens', 'maximum_output_tokens']
    if any(type(protocol.get(key)) is not int for key in integer_fields):
        raise ValueError('soak limits require explicit integer values')
    if (protocol.get('classification') != 'Frozen combined lifetime qualification'
            or protocol.get('memory_gb') != 10 or protocol.get('max_context') != 32768
            or protocol.get('mtp') not in ['off', 'on']
            or protocol.get('warmup_cycles') != 2 or protocol.get('measured_cycles') != 8
            or protocol.get('maximum_duration_seconds_per_mode') != 900
            or protocol.get('maximum_prompt_tokens') != 1024 or protocol.get('maximum_output_tokens') != 8):
        raise ValueError('soak requires the explicit bounded and frozen lifetime protocol')
    sequence = protocol.get('sequence')
    if not isinstance(sequence, list) or len(sequence) != 6:
        raise ValueError('soak requires the frozen six-request cycle')
    names = [item.get('name') for item in sequence]
    if any(type(n) is not str or not n.replace('-', '').isalnum() for n in names) or len(set(names)) != len(names):
        raise ValueError('request labels must be unique safe names')
    gate = protocol.get('acceptance') or {}
    limits = {'maximum_sampled_physical_peak_bytes': 10_000_000_000,
              'maximum_active_growth_bytes_per_position': 64 << 20,
              'maximum_physical_end_growth_bytes_per_position': 256 << 20,
              'maximum_cached_embedding_payload_bytes': 11_796_480,
              'maximum_prefix_entries': 4, 'minimum_clean_observations_per_position': 5,
              'minimum_clean_early_observations_per_position': 2,
              'minimum_clean_late_observations_per_position': 2, 'replacement_cycles': 0}
    if any(type(gate.get(k)) is not int or gate[k] != v for k, v in limits.items()):
        raise ValueError('lifetime bounds must match the frozen contract')
    if any(gate.get(k) is not True for k in ['all_expected_requests_complete',
        'exact_per_position_replay_after_warmup', 'prefix_charge_within_declared_capacity',
        'nominal_power_and_unchanged_request_vm_for_resource_observations']):
        raise ValueError('lifetime evidence and exactness requirements cannot be weakened')
    arm = {'reference': {'chunk': 256, 'env': protocol.get('env')}}
    bench.validate_arms(arm)
    requests = {}
    for item in sequence:
        path = Path(item['fixture'])
        if not path.is_file() or not 1 <= path.stat().st_size <= 4096 or digest(path) != item['fixture_sha256']:
            raise ValueError('soak fixture identity/size differs')
        count = item.get('outputs')
        if type(count) is not int or not 1 <= count <= 8:
            raise ValueError('bounded explicit output required')
        request = {'memory_gb': 10, 'raw': item['raw'], 'max_tokens': count, 'seed': 7}
        for key in ['think', 'sampling']:
            if key in item: request[key] = item[key]
        if 'image' in item:
            request['images'] = [{'path': item['image'], 'sha256': item['image_sha256']}]
        requests[item['name']] = bench.request_body(request, path.read_text())
    return requests


def main():
    def interrupted(signum, frame):
        raise KeyboardInterrupt(f'received signal {signum}')
    signal.signal(signal.SIGTERM, interrupted)
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    protocol = json.loads(args.protocol.read_text())
    requests = validate_protocol(protocol)
    build = bench.verified_build(protocol['binary'])
    bench.validate_declared_binary(protocol, {'reference': build})
    if 'frozen_binary_sha256' not in protocol:
        raise ValueError('a frozen binary binding is mandatory')
    prerequisites = validate_prerequisites(protocol, build)
    model = Path(protocol['model']).resolve()
    args.out.mkdir(parents=True, exist_ok=False)
    for name, request in requests.items():
        (args.out / f'request-{name}.json').write_bytes(request)
    for source in [Path(__file__), Path(bench.__file__), ROOT / 'Tools/prefill_bench.py']:
        shutil.copyfile(source, args.out / source.name)
    shutil.copyfile(Path(build['binary']).parent / 'build-source.tar.gz', args.out / 'build-source.tar.gz')
    manifest = {'protocol': protocol, 'protocol_sha256': digest(args.protocol), 'build': build,
                'model': model_identity(model), 'classification': 'One sequential bounded model process',
                'prerequisites': prerequisites, 'passed': False}
    (args.out / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    rows = []
    child = None
    try:
        if bench.competing_jobs(): raise RuntimeError('competing build/storage work; model not launched')
        manifest['before'] = preflight(13)
        with socket.socket() as reservation:
            reservation.bind(('127.0.0.1', 0)); port = reservation.getsockname()[1]
        command = [build['binary'], 'serve', '--port', str(port), '--model', str(model),
                   '--memory-gb', '10', '--max-context', '32768', '--mtp', protocol['mtp'], '--no-elastic']
        env = {k: v for k, v in os.environ.items() if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
        env.update(protocol['env'], SLOTSTREAM_BENCH_DETAILS='1', SLOTSTREAM_PREFILL_CHUNK='256')
        manifest['command'] = command
        start = time.monotonic()
        with wall_deadline(protocol['maximum_duration_seconds_per_mode']), \
                (args.out / 'server.stdout').open('wb') as stdout, \
                (args.out / 'server.stderr').open('wb') as stderr:
            child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=stdout, stderr=stderr, start_new_session=True)
            bench.wait_ready(child, port)
            for cycle in range(-protocol['warmup_cycles'], protocol['measured_cycles']):
                for item in protocol['sequence']:
                    remaining = protocol['maximum_duration_seconds_per_mode'] - (time.monotonic() - start)
                    if remaining <= 0: raise TimeoutError('fixed lifetime duration exhausted')
                    if bench.competing_jobs(): raise RuntimeError('competing build/storage work during soak')
                    row = {'cycle': cycle, 'name': item['name'], 'has_image': 'image' in item,
                           'before': vm_snapshot(), 'succeeded': False}
                    try:
                        measured, wire = bench.exchange(port, requests[item['name']], min(120, remaining),
                                                        allow_complete_prompt=True)
                        row.update(measured, after=vm_snapshot())
                        row['prefix'] = prefix_snapshot(port)
                        (args.out / f'{cycle}-{item["name"]}.ndjson').write_bytes(wire)
                        metrics = row['metrics']; stats = metrics['stats']
                        if (stats.get('runtimeError') is not None or stats['decodeTokens'] != item['outputs']
                                or not 0 < stats['promptTokens'] <= protocol['maximum_prompt_tokens']
                                or metrics['effective_mtp'] != (protocol['mtp'] == 'on')
                                or metrics['effective_prefill_chunk'] != 256):
                            raise ValueError('request output, context or effective mode differs from the protocol')
                        peak = bench.sampled_request_peak(stats)
                        if type(peak) is not int or peak > protocol['acceptance']['maximum_sampled_physical_peak_bytes']:
                            raise ValueError('absolute physical resource bound exceeded or unavailable')
                        row['resource_clean'], row['resource_exclusions'] = clean_resource_observation(row, protocol)
                        row['succeeded'] = True
                    finally:
                        rows.append(row)
                        with (args.out / 'results.jsonl').open('a') as output:
                            output.write(json.dumps(row) + '\n')
                    print(json.dumps({'cycle': cycle, 'name': item['name'], 'resource_clean': row['resource_clean']}), flush=True)
    except (Exception, KeyboardInterrupt) as error:
        manifest['error'] = f'{type(error).__name__}: {error}'
    finally:
        if child is not None: bench.stop_server(child)
        manifest['after'] = vm_snapshot()
    report = assess(protocol, rows)
    manifest['passed'] = report['passed'] and 'error' not in manifest
    (args.out / 'assessment.json').write_text(json.dumps(report, indent=2) + '\n')
    (args.out / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    print(json.dumps({'passed': manifest['passed'], 'recorded_requests': len(rows), 'error': manifest.get('error')}))
    return 0 if manifest['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())

````

## /tmp/slotstream-optimization-execution/paired-correctness-v228/after-result.json

SHA-256 `7019f6e3fde599da8a6c3e13172ee3facc21b40d7b57b043d1912bd79851adda`; 399 bytes.

````text
{
  "command": [
    "python3",
    "/tmp/slotstream-optimization-execution/paired-correctness-v228/after/optimization_prerequisites_test.py"
  ],
  "exit_code": 0,
  "seconds": 0.290586917,
  "pythonpath": "/tmp/slotstream-optimization-execution/paired-correctness-v228/after:/Users/carlos/Projects/slotstream/Tools",
  "classification": "pure prerequisite tests; no model, GPU, build or server"
}

````

## /tmp/slotstream-optimization-execution/paired-correctness-v228/after-stderr.txt

SHA-256 `2af2be15defcc3536343a61e29c610cda91b1f00b358518428922bc3597fb8b9`; 120 bytes.

````text
.....................
----------------------------------------------------------------------
Ran 21 tests in 0.222s

OK

````

## /tmp/slotstream-optimization-execution/paired-correctness-v228/after-stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/paired-correctness-v228/before/expanded_test.py

SHA-256 `85f3072ee811515d8de0a87b4764687348a0a790f2dcebc6b2629610bb14302c`; 15963 bytes.

````text
"""Receipt binding tests; benchmark statistics are tested by prefill_bench_test."""
import copy
from contextlib import ExitStack
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

from optimization_soak import validate_prerequisites
from prefill_bench import digest


class PrerequisiteTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.identity = {k: c * 64 for k, c in [('binary_sha256', 'a'),
            ('source_archive_sha256', 'b'), ('metallib_sha256', 'c')]}
        self.build = {'identity': self.identity}
        self.decision = [{'candidate': 'combined', 'passed': True, 'checks': {'fixture': True}}]
        self.protocol = {'mtp': 'off', 'env': {'SLOTSTREAM_OPT_FINAL_FORWARD': '1'},
                         'prerequisites': {'native': {}, 'paired': {}}}
        for name, variant in [('combined-plain', 'integrated'), ('combined-mtp', 'integrated-mtp'),
                              ('read-failure-serving', 'read-failure-serving')]:
            entry = self.entry('native', name)
            self.write(entry, 'manifest.json', {'identity': self.identity, 'passed': True, 'exit_code': 0,
                'assertions': 1, 'command': ['/unused/slotstream', 'optimization-state-check', '--variant', variant]})
            self.write(entry, 'stdout.txt', {'passed': True, 'items': [{'passed': True}]})
        for name in ['short-one', 'unique-prose', 'sampled-short', 'mtp-resource', 'distinct-tail',
                     'complete-repeat', 'unique-with-retention', 'actual-default-one-token']:
            entry = self.entry('paired', name)
            gate = {'minimum_pairs': 5, 'replacement_rounds': 0, 'all_outputs_exact': True}
            if name in ['short-one', 'distinct-tail', 'complete-repeat']:
                gate.update(minimum_median_client_reduction=.05, minimum_positive_fraction=.8)
            else:
                gate.update(maximum_median_client_regression=.05, minimum_positive_fraction=0)
            if name in ['unique-prose', 'sampled-short', 'mtp-resource']:
                gate.update(minimum_active_savings_bytes=300_000_000, minimum_sampled_peak_savings_bytes=200_000_000)
            self.write(entry, 'manifest.json', {'protocol': {'rounds': 16,
                'mtp': 'off', 'minimum_output_tokens': 1, 'max_tokens': 1,
                'maximum_sampled_footprint_bytes': 8_100_000_000,
                'arms': {arm: {'chunk': 256, 'env': {}} for arm in ['reference', 'combined']},
                'acceptance': gate,
                'startup_acceptance': {'minimum_pairs': 5, 'maximum_median_first_job_regression': .05,
                    'all_outputs_exact': True}},
                'arm_builds': {arm: self.build for arm in ['reference', 'combined']}})
            self.write(entry, 'completion.json', {'interrupted': False, 'stopped_early': False,
                'planned_cells': 32, 'recorded_cells': 32, 'acceptance': self.decision,
                'startup_acceptance': self.decision})
            self.write(entry, 'results.jsonl', [self.response_row(i, arm)
                for i in range(1, 17) for arm in ['reference', 'combined']])
        self.modify('paired', 'actual-default-one-token', 'manifest.json',
            lambda m: m['protocol'].update(arms={'reference': {'chunk': 256, 'env': {'SLOTSTREAM_OPT_FINAL_FORWARD': '0'}},
                'combined': {'chunk': 256, 'env': {}}}, max_tokens=1, minimum_output_tokens=1,
                prefix_cache={'retention_only': True, 'expected_reused_tokens': {'reference': 0, 'combined': 0}}))
        self.contract_path = self.root / 'qualification-contract.json'
        self.contract = {'format': 'slotstream-qualification-v1', 'build_identity': copy.deepcopy(self.identity),
            'native': {}, 'paired_protocols': {}, 'soak_modes': {}}
        for name, entry in self.protocol['prerequisites']['native'].items():
            manifest = json.loads((Path(entry['directory']) / 'manifest.json').read_text())
            self.contract['native'][name] = {'command': manifest['command'], 'environment': {}}
        for name, entry in self.protocol['prerequisites']['paired'].items():
            self.contract['paired_protocols'][name] = json.loads(
                (Path(entry['directory']) / 'manifest.json').read_text())['protocol']
        for mode in ['off', 'on']:
            self.contract['soak_modes'][mode] = {'mtp': mode, 'env': copy.deepcopy(self.protocol['env'])}
        self.freeze_contract()

    @staticmethod
    def response_row(number, arm):
        return {'round': number, 'arm': arm, 'valid': True,
            'client_seconds': 1.0, 'startup_seconds': 1.0,
            'startup_and_warmup_valid': True, 'text': 'measured',
            'first_request': {'prompt_ids': [17], 'output_ids': [7], 'text': 'first',
                'effective_mtp': False, 'effective_pool_slots': 640, 'complete_seconds_from_launch': 2.0},
            'metrics': {'schema_version': 1, 'prompt_ids': [101, 102], 'output_ids': [7],
                'effective_mtp': False, 'effective_pool_slots': 640, 'effective_prefill_chunk': 256,
                'stats': {'prefillSeconds': .5, 'decodeSeconds': .5, 'requestSeconds': 1.0,
                    'imageEncodeSeconds': 0.0, 'prefillRecords': 1, 'decodeRecords': 0,
                    'prefillTokens': 2, 'decodeTokens': 1, 'promptTokens': 2, 'prefillPasses': [2],
                    'lifetimeRSSPeakBytes': 1_000_000, 'sampledFootprint': {'peakBytes': 2_000_000}}}}

    def execution_mutation(self, change):
        self.modify('paired', 'unique-prose', 'results.jsonl', lambda rows: change(rows[-1]))
        with self.assertRaisesRegex(ValueError, 'paired execution failed'):
            self.validate()

    def test_vm_excluded_measured_output_change_is_a_correctness_failure(self):
        def mutate(row):
            row.update(valid=False, exclusion='swap activity')
            row['metrics']['output_ids'] = [8]
        self.execution_mutation(mutate)

    def test_excluded_first_output_change_is_a_correctness_failure(self):
        def mutate(row):
            row.update(valid=False, startup_and_warmup_valid=False, exclusion='swap activity')
            row['first_request']['output_ids'] = [8]
        self.execution_mutation(mutate)

    def test_vm_excluded_absolute_peak_overflow_still_fails(self):
        def mutate(row):
            row.update(valid=False, exclusion='swap activity')
            row['metrics']['stats']['sampledFootprint']['peakBytes'] = 8_100_000_001
        self.execution_mutation(mutate)

    def test_request_failure_is_not_a_discardable_timing_sample(self):
        self.execution_mutation(lambda row: row.update(valid=False, error='HTTP 500 fixture'))

    def test_preflight_refusal_leaves_the_final_matrix_incomplete(self):
        def mutate(row):
            row.pop('metrics'); row.pop('first_request')
            row.update(valid=False, error='InsufficientHeadroom fixture')
        self.execution_mutation(mutate)

    def test_completed_wrong_configuration_is_not_a_discardable_sample(self):
        def mutate(row):
            row.update(valid=False)
            row['metrics']['effective_prefill_chunk'] = 512
        self.execution_mutation(mutate)

    def test_wrong_or_truncated_token_metadata_is_not_discardable(self):
        self.execution_mutation(lambda row: row['metrics'].update(output_ids=[]))

    def test_vm_excluded_identical_complete_responses_remain_eligible_for_correctness(self):
        self.modify('paired', 'unique-prose', 'results.jsonl',
            lambda rows: rows[-1].update(valid=False, startup_and_warmup_valid=False, exclusion='swap activity'))
        self.assertEqual(len(self.validate()), 12)

    def test_actual_default_guard_rejects_forced_controls_even_when_frozen(self):
        self.actual_default_mutation(lambda p: p['arms']['combined']['env'].update(SLOTSTREAM_OPT_FINAL_FORWARD='1'))

    def test_actual_default_guard_rejects_disabled_retention_even_when_frozen(self):
        self.actual_default_mutation(lambda p: p.pop('prefix_cache'))

    def test_actual_default_guard_rejects_larger_reply_even_when_frozen(self):
        self.actual_default_mutation(lambda p: p.update(max_tokens=16, minimum_output_tokens=16))

    def actual_default_mutation(self, change):
        name = 'actual-default-one-token'
        self.modify('paired', name, 'manifest.json', lambda m: change(m['protocol']))
        entry = self.protocol['prerequisites']['paired'][name]
        self.contract['paired_protocols'][name] = json.loads((Path(entry['directory']) / 'manifest.json').read_text())['protocol']
        self.freeze_contract()
        with self.assertRaisesRegex(ValueError, 'actual-default guard'):
            self.validate()

    def freeze_contract(self):
        self.contract_path.write_text(json.dumps(self.contract))
        self.protocol['qualification_contract'] = {'path': str(self.contract_path),
            'sha256': digest(self.contract_path)}

    def entry(self, kind, name):
        path = self.root / name; path.mkdir()
        entry = {'directory': str(path), 'sha256': {}}
        self.protocol['prerequisites'][kind][name] = entry
        return entry

    def write(self, entry, name, data):
        path = Path(entry['directory']) / name
        path.write_text(''.join(json.dumps(row) + '\n' for row in data)
                        if name.endswith('jsonl') else json.dumps(data))
        entry['sha256'][name] = digest(path)

    def modify(self, kind, name, file, change):
        entry = self.protocol['prerequisites'][kind][name]
        path = Path(entry['directory']) / file
        data = ([json.loads(line) for line in path.read_text().splitlines()]
                if file.endswith('jsonl') else json.loads(path.read_text()))
        change(data); self.write(entry, file, data)

    def validate(self, *, recomputed=None):
        with ExitStack() as stack:
            summary = stack.enter_context(patch('optimization_soak.bench.summaries', return_value=['fixture']))
            acceptance = stack.enter_context(patch('optimization_soak.bench.acceptance_results',
                return_value=self.decision if recomputed is None else recomputed))
            startup = stack.enter_context(patch('optimization_soak.bench.startup_acceptance_results',
                return_value=self.decision))
            result = validate_prerequisites(self.protocol, self.build)
            self.assertEqual((summary.call_count, acceptance.call_count, startup.call_count), (8, 8, 8))
            return result

    def test_complete_same_build_evidence_is_recomputed_and_accepted(self):
        self.assertEqual(len(self.validate()), 12)
        self.protocol['mtp'] = 'on'
        self.assertEqual(self.validate()['qualification_contract'], self.contract)

    def test_different_soak_controls_cannot_borrow_passing_evidence(self):
        self.protocol['env']['SLOTSTREAM_OPT_FINAL_FORWARD'] = '0'
        with self.assertRaisesRegex(ValueError, 'soak workload or controls'): self.validate()

    def test_relabeling_or_changing_a_paired_workload_is_rejected(self):
        # Even a newly signed report from the same binary may not replace the
        # pre-run workload with another prompt, budget, mode or control.
        entry = self.protocol['prerequisites']['paired']['unique-prose']
        before = json.loads((Path(entry['directory']) / 'manifest.json').read_text())
        for field, value in [('fixture_sha256', 'f' * 64), ('memory_gb', 10),
                             ('mtp', 'on'), ('arms', {'combined': {'env': {}}}),
                             ('required_equal_work', [])]:
            self.modify('paired', 'unique-prose', 'manifest.json', lambda d: d['protocol'].update({field: value}))
            with self.assertRaisesRegex(ValueError, 'paired workload or controls'): self.validate()
            self.write(entry, 'manifest.json', before)

    def test_native_environment_must_match_the_same_pre_run_contract(self):
        self.modify('native', 'combined-plain', 'manifest.json',
                    lambda d: d.update(environment={'SLOTSTREAM_OPT_FINAL_FORWARD': '0'}))
        with self.assertRaisesRegex(ValueError, 'native workload or controls'): self.validate()

    def test_contract_identity_build_and_complete_workloads_are_required(self):
        self.contract_path.write_text('{}')
        with self.assertRaisesRegex(ValueError, 'contract identity'): self.validate()
        self.freeze_contract()
        original = copy.deepcopy(self.contract)
        for mutate in [lambda c: c['build_identity'].update(source_archive_sha256='e' * 64),
                       lambda c: c['paired_protocols'].pop('short-one'),
                       lambda c: c['soak_modes'].pop('on')]:
            mutate(self.contract); self.freeze_contract()
            with self.assertRaises(ValueError): self.validate()
            self.contract = copy.deepcopy(original)
        self.freeze_contract()

    def test_missing_and_duplicate_workload_evidence_refused(self):
        with self.assertRaises(ValueError): validate_prerequisites({}, self.build)
        original = copy.deepcopy(self.protocol)
        del self.protocol['prerequisites']['native']['combined-mtp']
        with self.assertRaises(ValueError): self.validate()
        self.protocol = original
        p = self.protocol['prerequisites']['paired']; p['short-one'] = p['unique-prose']
        with self.assertRaisesRegex(ValueError, 'own study'): self.validate()

    def test_changed_receipt_digest_is_rejected(self):
        entry = self.protocol['prerequisites']['native']['combined-plain']
        (Path(entry['directory']) / 'stdout.txt').write_text('{}')
        with self.assertRaisesRegex(ValueError, 'digest differs'): self.validate()

    def test_native_wrong_source_failed_assertion_and_wrong_variant_are_rejected(self):
        original = copy.deepcopy(self.protocol)
        for file, mutate in [
            ('manifest.json', lambda d: d['identity'].update(source_archive_sha256='d' * 64)),
            ('stdout.txt', lambda d: d['items'][0].update(passed=False)),
            ('manifest.json', lambda d: d.update(command=['slotstream', 'optimization-state-check', '--variant', 'integrated-mtp']))]:
            entry = self.protocol['prerequisites']['native']['combined-plain']
            data = json.loads((Path(entry['directory']) / file).read_text())
            self.modify('native', 'combined-plain', file, mutate)
            with self.assertRaises(ValueError): self.validate()
            self.write(entry, file, data)
            self.protocol = copy.deepcopy(original)

    def test_incomplete_duplicate_and_other_build_paired_runs_refused(self):
        entry = self.protocol['prerequisites']['paired']['short-one']
        for file, mutate in [
            ('completion.json', lambda d: d.update(stopped_early=True)),
            ('results.jsonl', lambda d: d.__setitem__(-1, d[0])),
            ('manifest.json', lambda d: d['arm_builds']['combined']['identity'].update(binary_sha256='e' * 64)),
            ('manifest.json', lambda d: d['protocol']['acceptance'].update(minimum_pairs=1)),
            ('manifest.json', lambda d: d['protocol']['acceptance'].update(minimum_median_client_reduction=0))]:
            path = Path(entry['directory']) / file; content = path.read_bytes(); before = entry['sha256'][file]
            self.modify('paired', 'short-one', file, mutate)
            with self.assertRaises(ValueError): self.validate()
            path.write_bytes(content); entry['sha256'][file] = before

    def test_claimed_pass_does_not_override_recomputed_failure(self):
        with self.assertRaisesRegex(ValueError, 'recomputed'):
            self.validate(recomputed=[{'candidate': 'combined', 'passed': False}])


if __name__ == '__main__': unittest.main()

````

## /tmp/slotstream-optimization-execution/paired-correctness-v228/before/optimization_prerequisites_test.py

SHA-256 `5e9c12aadce395881631a1ca5ed909997e8e95ec14c5e01ee671d1248c7ac67f`; 12471 bytes.

````text
"""Receipt binding tests; benchmark statistics are tested by prefill_bench_test."""
import copy
from contextlib import ExitStack
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

from optimization_soak import validate_prerequisites
from prefill_bench import digest


class PrerequisiteTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.identity = {k: c * 64 for k, c in [('binary_sha256', 'a'),
            ('source_archive_sha256', 'b'), ('metallib_sha256', 'c')]}
        self.build = {'identity': self.identity}
        self.decision = [{'candidate': 'combined', 'passed': True, 'checks': {'fixture': True}}]
        self.protocol = {'mtp': 'off', 'env': {'SLOTSTREAM_OPT_FINAL_FORWARD': '1'},
                         'prerequisites': {'native': {}, 'paired': {}}}
        for name, variant in [('combined-plain', 'integrated'), ('combined-mtp', 'integrated-mtp'),
                              ('read-failure-serving', 'read-failure-serving')]:
            entry = self.entry('native', name)
            self.write(entry, 'manifest.json', {'identity': self.identity, 'passed': True, 'exit_code': 0,
                'assertions': 1, 'command': ['/unused/slotstream', 'optimization-state-check', '--variant', variant]})
            self.write(entry, 'stdout.txt', {'passed': True, 'items': [{'passed': True}]})
        for name in ['short-one', 'unique-prose', 'sampled-short', 'mtp-resource', 'distinct-tail',
                     'complete-repeat', 'unique-with-retention', 'actual-default-one-token']:
            entry = self.entry('paired', name)
            gate = {'minimum_pairs': 5, 'replacement_rounds': 0, 'all_outputs_exact': True}
            if name in ['short-one', 'distinct-tail', 'complete-repeat']:
                gate.update(minimum_median_client_reduction=.05, minimum_positive_fraction=.8)
            else:
                gate.update(maximum_median_client_regression=.05, minimum_positive_fraction=0)
            if name in ['unique-prose', 'sampled-short', 'mtp-resource']:
                gate.update(minimum_active_savings_bytes=300_000_000, minimum_sampled_peak_savings_bytes=200_000_000)
            self.write(entry, 'manifest.json', {'protocol': {'rounds': 16,
                'acceptance': gate,
                'startup_acceptance': {'minimum_pairs': 5, 'maximum_median_first_job_regression': .05,
                    'all_outputs_exact': True}},
                'arm_builds': {arm: self.build for arm in ['reference', 'combined']}})
            self.write(entry, 'completion.json', {'interrupted': False, 'stopped_early': False,
                'planned_cells': 32, 'recorded_cells': 32, 'acceptance': self.decision,
                'startup_acceptance': self.decision})
            self.write(entry, 'results.jsonl', [{'round': i, 'arm': arm}
                for i in range(1, 17) for arm in ['reference', 'combined']])
        self.modify('paired', 'actual-default-one-token', 'manifest.json',
            lambda m: m['protocol'].update(arms={'reference': {'env': {'SLOTSTREAM_OPT_FINAL_FORWARD': '0'}},
                'combined': {'env': {}}}, max_tokens=1, minimum_output_tokens=1,
                prefix_cache={'retention_only': True, 'expected_reused_tokens': {'reference': 0, 'combined': 0}}))
        self.contract_path = self.root / 'qualification-contract.json'
        self.contract = {'format': 'slotstream-qualification-v1', 'build_identity': copy.deepcopy(self.identity),
            'native': {}, 'paired_protocols': {}, 'soak_modes': {}}
        for name, entry in self.protocol['prerequisites']['native'].items():
            manifest = json.loads((Path(entry['directory']) / 'manifest.json').read_text())
            self.contract['native'][name] = {'command': manifest['command'], 'environment': {}}
        for name, entry in self.protocol['prerequisites']['paired'].items():
            self.contract['paired_protocols'][name] = json.loads(
                (Path(entry['directory']) / 'manifest.json').read_text())['protocol']
        for mode in ['off', 'on']:
            self.contract['soak_modes'][mode] = {'mtp': mode, 'env': copy.deepcopy(self.protocol['env'])}
        self.freeze_contract()

    def test_actual_default_guard_rejects_forced_controls_even_when_frozen(self):
        self.actual_default_mutation(lambda p: p['arms']['combined']['env'].update(SLOTSTREAM_OPT_FINAL_FORWARD='1'))

    def test_actual_default_guard_rejects_disabled_retention_even_when_frozen(self):
        self.actual_default_mutation(lambda p: p.pop('prefix_cache'))

    def test_actual_default_guard_rejects_larger_reply_even_when_frozen(self):
        self.actual_default_mutation(lambda p: p.update(max_tokens=16, minimum_output_tokens=16))

    def actual_default_mutation(self, change):
        name = 'actual-default-one-token'
        self.modify('paired', name, 'manifest.json', lambda m: change(m['protocol']))
        entry = self.protocol['prerequisites']['paired'][name]
        self.contract['paired_protocols'][name] = json.loads((Path(entry['directory']) / 'manifest.json').read_text())['protocol']
        self.freeze_contract()
        with self.assertRaisesRegex(ValueError, 'actual-default guard'):
            self.validate()

    def freeze_contract(self):
        self.contract_path.write_text(json.dumps(self.contract))
        self.protocol['qualification_contract'] = {'path': str(self.contract_path),
            'sha256': digest(self.contract_path)}

    def entry(self, kind, name):
        path = self.root / name; path.mkdir()
        entry = {'directory': str(path), 'sha256': {}}
        self.protocol['prerequisites'][kind][name] = entry
        return entry

    def write(self, entry, name, data):
        path = Path(entry['directory']) / name
        path.write_text(''.join(json.dumps(row) + '\n' for row in data)
                        if name.endswith('jsonl') else json.dumps(data))
        entry['sha256'][name] = digest(path)

    def modify(self, kind, name, file, change):
        entry = self.protocol['prerequisites'][kind][name]
        path = Path(entry['directory']) / file
        data = ([json.loads(line) for line in path.read_text().splitlines()]
                if file.endswith('jsonl') else json.loads(path.read_text()))
        change(data); self.write(entry, file, data)

    def validate(self, *, recomputed=None):
        with ExitStack() as stack:
            summary = stack.enter_context(patch('optimization_soak.bench.summaries', return_value=['fixture']))
            acceptance = stack.enter_context(patch('optimization_soak.bench.acceptance_results',
                return_value=self.decision if recomputed is None else recomputed))
            startup = stack.enter_context(patch('optimization_soak.bench.startup_acceptance_results',
                return_value=self.decision))
            result = validate_prerequisites(self.protocol, self.build)
            self.assertEqual((summary.call_count, acceptance.call_count, startup.call_count), (8, 8, 8))
            return result

    def test_complete_same_build_evidence_is_recomputed_and_accepted(self):
        self.assertEqual(len(self.validate()), 12)
        self.protocol['mtp'] = 'on'
        self.assertEqual(self.validate()['qualification_contract'], self.contract)

    def test_different_soak_controls_cannot_borrow_passing_evidence(self):
        self.protocol['env']['SLOTSTREAM_OPT_FINAL_FORWARD'] = '0'
        with self.assertRaisesRegex(ValueError, 'soak workload or controls'): self.validate()

    def test_relabeling_or_changing_a_paired_workload_is_rejected(self):
        # Even a newly signed report from the same binary may not replace the
        # pre-run workload with another prompt, budget, mode or control.
        entry = self.protocol['prerequisites']['paired']['unique-prose']
        before = json.loads((Path(entry['directory']) / 'manifest.json').read_text())
        for field, value in [('fixture_sha256', 'f' * 64), ('memory_gb', 10),
                             ('mtp', 'on'), ('arms', {'combined': {'env': {}}}),
                             ('required_equal_work', [])]:
            self.modify('paired', 'unique-prose', 'manifest.json', lambda d: d['protocol'].update({field: value}))
            with self.assertRaisesRegex(ValueError, 'paired workload or controls'): self.validate()
            self.write(entry, 'manifest.json', before)

    def test_native_environment_must_match_the_same_pre_run_contract(self):
        self.modify('native', 'combined-plain', 'manifest.json',
                    lambda d: d.update(environment={'SLOTSTREAM_OPT_FINAL_FORWARD': '0'}))
        with self.assertRaisesRegex(ValueError, 'native workload or controls'): self.validate()

    def test_contract_identity_build_and_complete_workloads_are_required(self):
        self.contract_path.write_text('{}')
        with self.assertRaisesRegex(ValueError, 'contract identity'): self.validate()
        self.freeze_contract()
        original = copy.deepcopy(self.contract)
        for mutate in [lambda c: c['build_identity'].update(source_archive_sha256='e' * 64),
                       lambda c: c['paired_protocols'].pop('short-one'),
                       lambda c: c['soak_modes'].pop('on')]:
            mutate(self.contract); self.freeze_contract()
            with self.assertRaises(ValueError): self.validate()
            self.contract = copy.deepcopy(original)
        self.freeze_contract()

    def test_missing_and_duplicate_workload_evidence_refused(self):
        with self.assertRaises(ValueError): validate_prerequisites({}, self.build)
        original = copy.deepcopy(self.protocol)
        del self.protocol['prerequisites']['native']['combined-mtp']
        with self.assertRaises(ValueError): self.validate()
        self.protocol = original
        p = self.protocol['prerequisites']['paired']; p['short-one'] = p['unique-prose']
        with self.assertRaisesRegex(ValueError, 'own study'): self.validate()

    def test_changed_receipt_digest_is_rejected(self):
        entry = self.protocol['prerequisites']['native']['combined-plain']
        (Path(entry['directory']) / 'stdout.txt').write_text('{}')
        with self.assertRaisesRegex(ValueError, 'digest differs'): self.validate()

    def test_native_wrong_source_failed_assertion_and_wrong_variant_are_rejected(self):
        original = copy.deepcopy(self.protocol)
        for file, mutate in [
            ('manifest.json', lambda d: d['identity'].update(source_archive_sha256='d' * 64)),
            ('stdout.txt', lambda d: d['items'][0].update(passed=False)),
            ('manifest.json', lambda d: d.update(command=['slotstream', 'optimization-state-check', '--variant', 'integrated-mtp']))]:
            entry = self.protocol['prerequisites']['native']['combined-plain']
            data = json.loads((Path(entry['directory']) / file).read_text())
            self.modify('native', 'combined-plain', file, mutate)
            with self.assertRaises(ValueError): self.validate()
            self.write(entry, file, data)
            self.protocol = copy.deepcopy(original)

    def test_incomplete_duplicate_and_other_build_paired_runs_refused(self):
        entry = self.protocol['prerequisites']['paired']['short-one']
        for file, mutate in [
            ('completion.json', lambda d: d.update(stopped_early=True)),
            ('results.jsonl', lambda d: d.__setitem__(-1, d[0])),
            ('manifest.json', lambda d: d['arm_builds']['combined']['identity'].update(binary_sha256='e' * 64)),
            ('manifest.json', lambda d: d['protocol']['acceptance'].update(minimum_pairs=1)),
            ('manifest.json', lambda d: d['protocol']['acceptance'].update(minimum_median_client_reduction=0))]:
            path = Path(entry['directory']) / file; content = path.read_bytes(); before = entry['sha256'][file]
            self.modify('paired', 'short-one', file, mutate)
            with self.assertRaises(ValueError): self.validate()
            path.write_bytes(content); entry['sha256'][file] = before

    def test_claimed_pass_does_not_override_recomputed_failure(self):
        with self.assertRaisesRegex(ValueError, 'recomputed'):
            self.validate(recomputed=[{'candidate': 'combined', 'passed': False}])


if __name__ == '__main__': unittest.main()

````

## /tmp/slotstream-optimization-execution/paired-correctness-v228/before/optimization_soak.py

SHA-256 `59737c1d9b85222c05517690230d519fc3904a18c7989ae89131539b468667c8`; 25572 bytes.

````text
#!/usr/bin/env python3
"""Bounded repeated-request lifetime qualification; no latency improvement claims."""
import argparse
from contextlib import contextmanager
import http.client
import json
import os
from pathlib import Path
import shutil
import signal
import socket
import subprocess
import time

import serve_bench as bench
from prefill_bench import ROOT, digest, model_identity, preflight, vm_snapshot


@contextmanager
def wall_deadline(seconds):
    """Bound the complete live-server interval, including a stalled response.

    Socket timeouts alone bound each blocking read, not a stream that keeps
    delivering small frames. This standalone driver owns its main-thread timer.
    Cleanup happens outside the deadline so the owned server is always reaped.
    """
    if signal.getitimer(signal.ITIMER_REAL) != (0.0, 0.0):
        raise RuntimeError('another real-time alarm is already active')
    previous = signal.getsignal(signal.SIGALRM)
    def expired(signum, frame):
        raise TimeoutError('fixed lifetime duration exhausted')
    signal.signal(signal.SIGALRM, expired)
    try:
        signal.setitimer(signal.ITIMER_REAL, seconds)
        yield
    finally:
        signal.setitimer(signal.ITIMER_REAL, 0)
        signal.signal(signal.SIGALRM, previous)


def clean_resource_observation(row, protocol):
    metrics = row.get('metrics') or {}
    stats = metrics.get('stats') or {}
    errors = bench.resource_exclusions(stats, {
        'maximum_sampled_footprint_bytes': protocol['acceptance']['maximum_sampled_physical_peak_bytes'],
        'require_nominal_power_state': True,
        'images': row.get('has_image', False),
    })
    for before, after in [(row.get('before'), row.get('after')),
                          (stats.get('generatorVMBefore'), stats.get('generatorVMAfter'))]:
        if not isinstance(before, dict) or not isinstance(after, dict) or any(
            type(before.get(k)) is not int or type(after.get(k)) is not int or before[k] != after[k]
            for k in ['swapins', 'swapouts']):
            errors.append('missing or changed VM interval')
    return not errors, errors


def assess(protocol, rows):
    gate = protocol['acceptance']
    names = [item['name'] for item in protocol['sequence']]
    cycles = protocol['measured_cycles']
    warmup = protocol['warmup_cycles']
    expected = [(cycle, name) for cycle in range(-warmup, cycles) for name in names]
    coordinates = [(row['cycle'], row['name']) for row in rows]
    if len(coordinates) != len(set(coordinates)) or any(c not in expected for c in coordinates):
        raise ValueError('duplicate or undeclared soak request')
    checks = {'fixed_sequence_completed': coordinates == expected,
              'all_requests_succeeded': all(row.get('succeeded') is True for row in rows)}
    # Runtime failures and absolute overflows are failures even during warmup.
    peaks = [bench.sampled_request_peak((r.get('metrics') or {}).get('stats') or {}) for r in rows]
    checks['physical_ceiling'] = bool(peaks) and all(type(p) is int and 0 < p <=
        gate['maximum_sampled_physical_peak_bytes'] for p in peaks)
    details = []
    for name in names:
        selected = [r for r in rows if r['cycle'] >= 0 and r['name'] == name]
        clean = [r for r in selected if clean_resource_observation(r, protocol)[0]]
        early = [r for r in clean if r['cycle'] < cycles // 2]
        late = [r for r in clean if r['cycle'] >= cycles // 2]
        one = {'minimum_clean_observations': len(clean) >= gate['minimum_clean_observations_per_position'],
               'early_observations': len(early) >= gate['minimum_clean_early_observations_per_position'],
               'late_observations': len(late) >= gate['minimum_clean_late_observations_per_position']}
        outputs = [(r.get('metrics', {}).get('output_ids'), r.get('text')) for r in selected]
        one['exact_replay'] = bool(outputs) and bool(outputs[0][0]) and all(v == outputs[0] for v in outputs)
        growth = {}
        for field, limit in [('mlxActiveEndBytes', gate['maximum_active_growth_bytes_per_position']),
                             ('physicalFootprintEndBytes', gate['maximum_physical_end_growth_bytes_per_position'])]:
            a = [r['metrics']['stats'].get(field) for r in early]
            b = [r['metrics']['stats'].get(field) for r in late]
            valid = bool(a) and bool(b) and all(type(v) is int and v > 0 for v in a + b)
            growth[field] = max(b) - min(a) if valid else None
            one[field] = valid and growth[field] <= limit
        embedding_bytes = [(r.get('metrics') or {}).get('stats', {}).get('embeddingCachedPayloadBytes')
                           for r in selected]
        one['bounded_embedding_rows'] = bool(embedding_bytes) and all(
            type(value) is int and 0 <= value <= gate['maximum_cached_embedding_payload_bytes']
            for value in embedding_bytes)
        one['embedding_rows_enabled'] = bool(selected) and all(
            (r.get('metrics') or {}).get('stats', {}).get('embeddingRowsEnabled') is True for r in selected)
        one['bounded_prefix_capacity'] = bool(selected) and all(
            r.get('prefix', {}).get('enabled') is True
            and type(r['prefix'].get('conversations')) is int
            and 1 <= r['prefix']['conversations'] <= gate['maximum_prefix_entries']
            and type(r['prefix'].get('charged_token_capacity')) is int
            and type(r['prefix'].get('max_tokens')) is int
            and 0 <= r['prefix']['charged_token_capacity'] <= r['prefix']['max_tokens']
            for r in selected)
        details.append({'name': name, 'passed': all(one.values()), 'checks': one,
                        'clean_cycles': [r['cycle'] for r in clean], 'observed_growth_bytes': growth})
    checks['positions_pass'] = all(d['passed'] for d in details)
    return {'classification': 'Bounded repeated-request lifetime qualification; no throughput or unbounded-lifetime claim',
            'passed': all(checks.values()), 'checks': checks, 'positions': details}


def prefix_snapshot(port):
    connection = http.client.HTTPConnection('127.0.0.1', port, timeout=10)
    try:
        connection.request('POST', '/api/show', b'{}', {'Content-Type': 'application/json'})
        response = connection.getresponse()
        data = response.read(1 << 20)
        if response.status != 200 or len(data) >= 1 << 20:
            raise ValueError('bounded prefix snapshot unavailable')
        return json.loads(data)['details']['prefix_cache']
    finally:
        connection.close()


def qualification_contract(protocol, build):
    """Bind every workload and control to one reviewed pre-run matrix.

    A passing report with the right build and a different directory can still
    be the wrong workload. The separate frozen contract prevents relabeling a
    study or changing the soak's controls after its prerequisites were run.
    """
    binding = protocol.get('qualification_contract')
    if not isinstance(binding, dict) or set(binding) != {'path', 'sha256'}:
        raise ValueError('a frozen qualification contract is required')
    path = Path(binding['path'])
    if not path.is_file() or not 0 < path.stat().st_size <= 2_000_000 or digest(path) != binding['sha256']:
        raise ValueError('qualification contract identity or size differs')
    contract = json.loads(path.read_text())
    keys = {'format', 'build_identity', 'native', 'paired_protocols', 'soak_modes'}
    if not isinstance(contract, dict) or set(contract) != keys or contract['format'] != 'slotstream-qualification-v1':
        raise ValueError('invalid qualification contract format')
    identity_keys = {'binary_sha256', 'source_archive_sha256', 'metallib_sha256'}
    identity = contract['build_identity']
    if not isinstance(identity, dict) or set(identity) != identity_keys or any(
            not isinstance(identity[k], str) or len(identity[k]) != 64
            or identity[k] != build['identity'].get(k) for k in identity_keys):
        raise ValueError('qualification contract belongs to another build')
    modes = contract['soak_modes']
    declared = {k: v for k, v in protocol.items() if k not in {'qualification_contract', 'prerequisites'}}
    if (not isinstance(modes, dict) or set(modes) != {'off', 'on'}
            or declared != modes.get(protocol.get('mtp'))):
        raise ValueError('soak workload or controls differ from the frozen qualification contract')
    return contract


def validate_prerequisites(protocol, build):
    """Require the final candidate's native and paired evidence before launch.

    Digests bind the exact reports; same-binary/source/Metal identity prevents
    borrowing a passing gate from an earlier implementation. Paired decisions
    are recomputed from their frozen rows using the ordinary benchmark gates.
    """
    required_native = {'combined-plain', 'combined-mtp', 'read-failure-serving'}
    required_paired = {'short-one', 'unique-prose', 'sampled-short', 'mtp-resource',
                       'distinct-tail', 'complete-repeat', 'unique-with-retention', 'actual-default-one-token'}
    prerequisites = protocol.get('prerequisites')
    if not isinstance(prerequisites, dict) or set(prerequisites) != {'native', 'paired'}:
        raise ValueError('native and paired final-candidate prerequisites are mandatory')
    for kind, names in [('native', required_native), ('paired', required_paired)]:
        if not isinstance(prerequisites[kind], dict) or set(prerequisites[kind]) != names:
            raise ValueError(f'complete {kind} prerequisite set required')
    contract = qualification_contract(protocol, build)
    for field, names in [('native', required_native), ('paired_protocols', required_paired)]:
        if not isinstance(contract[field], dict) or set(contract[field]) != names:
            raise ValueError(f'qualification contract requires every {field} workload')

    def same_identity(identity):
        return isinstance(identity, dict) and all(identity.get(k) == build['identity'].get(k)
            and isinstance(identity.get(k), str) and len(identity[k]) == 64
            for k in ['binary_sha256', 'source_archive_sha256', 'metallib_sha256'])

    def evidence(entry, name):
        path = Path(entry['directory']) / name
        if digest(path) != entry['sha256'][name]:
            raise ValueError(f'prerequisite digest differs: {path}')
        return path

    # Preserve the exact parsed contract with the receipt, not just its path.
    observed = {'qualification_contract': contract}
    for name, entry in prerequisites['native'].items():
        manifest = json.loads(evidence(entry, 'manifest.json').read_text())
        report = json.loads(evidence(entry, 'stdout.txt').read_text())
        items = report.get('items')
        if (not same_identity(manifest.get('identity')) or manifest.get('passed') is not True
                or manifest.get('exit_code') != 0 or report.get('passed') is not True
                or report.get('skipped') is not None or not isinstance(items, list) or not items
                or any(item.get('passed') is not True for item in items)
                or manifest.get('assertions') != len(items)):
            raise ValueError(f'native prerequisite failed or belongs to another build: {name}')
        command = manifest.get('command') or []
        if contract['native'][name] != {'command': command, 'environment': manifest.get('environment', {})}:
            raise ValueError(f'native workload or controls differ from the frozen contract: {name}')
        variants = {'combined-plain': ['integrated', 'integrated-vision-query'],
                    'combined-mtp': ['integrated-mtp', 'integrated-vision-query-mtp'],
                    'read-failure-serving': ['read-failure-serving']}[name]
        if ('optimization-state-check' not in command or '--variant' not in command
                or command.index('--variant') + 1 >= len(command)
                or command[command.index('--variant') + 1] not in variants):
            raise ValueError(f'native prerequisite has the wrong diagnostic: {name}')
        observed[name] = {'passed': True, 'assertions': len(items)}

    paired_directories = [str(Path(entry['directory']).resolve()) for entry in prerequisites['paired'].values()]
    if len(set(paired_directories)) != len(required_paired):
        raise ValueError('each paired workload requires its own study')
    for name, entry in prerequisites['paired'].items():
        manifest = json.loads(evidence(entry, 'manifest.json').read_text())
        completion = json.loads(evidence(entry, 'completion.json').read_text())
        rows = [json.loads(line) for line in evidence(entry, 'results.jsonl').read_text().splitlines()]
        declared = manifest['protocol']
        if declared != contract['paired_protocols'][name]:
            raise ValueError(f'paired workload or controls differ from the frozen contract: {name}')
        if name == 'actual-default-one-token':
            selected = declared.get('arms', {}).get('combined', {})
            prefix = declared.get('prefix_cache', {})
            if (selected.get('env') != {} or declared.get('max_tokens') != 1
                    or declared.get('minimum_output_tokens') != 1
                    or prefix.get('retention_only') is not True
                    or prefix.get('expected_reused_tokens') != {'reference': 0, 'combined': 0}):
                raise ValueError('actual-default guard requires unoverridden defaults, one output token and enabled unique-prompt retention')
        arms = manifest.get('arm_builds') or {}
        if (not arms or any(not same_identity(arm.get('identity')) for arm in arms.values())
                or completion.get('interrupted') is not False or completion.get('stopped_early') is not False
                or declared.get('rounds') != 16 or len(arms) != 2 or 'reference' not in arms
                or completion.get('planned_cells') != 32 or completion.get('recorded_cells') != 32
                or len(rows) != 32 or 'error' in completion):
            raise ValueError(f'paired prerequisite incomplete or belongs to another build: {name}')
        coordinates = [(row['round'], row['arm']) for row in rows]
        if len(set(coordinates)) != 32 or set(coordinates) != {
                (i, arm) for i in range(1, 17) for arm in arms}:
            raise ValueError(f'paired prerequisite has missing or duplicate cells: {name}')
        if not declared.get('acceptance') or not declared.get('startup_acceptance'):
            raise ValueError(f'paired prerequisite lacks both frozen acceptance gates: {name}')
        gate, first = declared['acceptance'], declared['startup_acceptance']
        required_gate = {'minimum_pairs': 5, 'replacement_rounds': 0, 'all_outputs_exact': True}
        if name in {'short-one', 'distinct-tail', 'complete-repeat'}:
            required_gate.update(minimum_median_client_reduction=.05, minimum_positive_fraction=.8)
        else:
            required_gate.update(maximum_median_client_regression=.05, minimum_positive_fraction=0)
        if name in {'unique-prose', 'sampled-short', 'mtp-resource'}:
            required_gate.update(minimum_active_savings_bytes=300_000_000,
                                 minimum_sampled_peak_savings_bytes=200_000_000)
        if (gate != required_gate or first != {'minimum_pairs': 5,
                'maximum_median_first_job_regression': .05, 'all_outputs_exact': True}):
            raise ValueError(f'paired prerequisite weakens final-matrix bounds: {name}')
        summary = bench.summaries(rows, 'reference', declared.get('comparison_basis', 'fixed-pool'),
                                  declared.get('required_equal_work'))
        accepted = bench.acceptance_results(summary, declared['acceptance'])
        startup = bench.startup_acceptance_results(rows, 'reference', declared['startup_acceptance'])
        if (not accepted or not startup or any(item.get('passed') is not True for item in accepted + startup)
                or accepted != completion.get('acceptance') or startup != completion.get('startup_acceptance')):
            raise ValueError(f'paired prerequisite fails recomputed request/first-job gates: {name}')
        observed[name] = {'passed': True, 'cells': len(rows)}
    return observed


def validate_protocol(protocol):
    integer_fields = ['memory_gb', 'max_context', 'warmup_cycles', 'measured_cycles',
                      'maximum_duration_seconds_per_mode', 'maximum_prompt_tokens', 'maximum_output_tokens']
    if any(type(protocol.get(key)) is not int for key in integer_fields):
        raise ValueError('soak limits require explicit integer values')
    if (protocol.get('classification') != 'Frozen combined lifetime qualification'
            or protocol.get('memory_gb') != 10 or protocol.get('max_context') != 32768
            or protocol.get('mtp') not in ['off', 'on']
            or protocol.get('warmup_cycles') != 2 or protocol.get('measured_cycles') != 8
            or protocol.get('maximum_duration_seconds_per_mode') != 900
            or protocol.get('maximum_prompt_tokens') != 1024 or protocol.get('maximum_output_tokens') != 8):
        raise ValueError('soak requires the explicit bounded and frozen lifetime protocol')
    sequence = protocol.get('sequence')
    if not isinstance(sequence, list) or len(sequence) != 6:
        raise ValueError('soak requires the frozen six-request cycle')
    names = [item.get('name') for item in sequence]
    if any(type(n) is not str or not n.replace('-', '').isalnum() for n in names) or len(set(names)) != len(names):
        raise ValueError('request labels must be unique safe names')
    gate = protocol.get('acceptance') or {}
    limits = {'maximum_sampled_physical_peak_bytes': 10_000_000_000,
              'maximum_active_growth_bytes_per_position': 64 << 20,
              'maximum_physical_end_growth_bytes_per_position': 256 << 20,
              'maximum_cached_embedding_payload_bytes': 11_796_480,
              'maximum_prefix_entries': 4, 'minimum_clean_observations_per_position': 5,
              'minimum_clean_early_observations_per_position': 2,
              'minimum_clean_late_observations_per_position': 2, 'replacement_cycles': 0}
    if any(type(gate.get(k)) is not int or gate[k] != v for k, v in limits.items()):
        raise ValueError('lifetime bounds must match the frozen contract')
    if any(gate.get(k) is not True for k in ['all_expected_requests_complete',
        'exact_per_position_replay_after_warmup', 'prefix_charge_within_declared_capacity',
        'nominal_power_and_unchanged_request_vm_for_resource_observations']):
        raise ValueError('lifetime evidence and exactness requirements cannot be weakened')
    arm = {'reference': {'chunk': 256, 'env': protocol.get('env')}}
    bench.validate_arms(arm)
    requests = {}
    for item in sequence:
        path = Path(item['fixture'])
        if not path.is_file() or not 1 <= path.stat().st_size <= 4096 or digest(path) != item['fixture_sha256']:
            raise ValueError('soak fixture identity/size differs')
        count = item.get('outputs')
        if type(count) is not int or not 1 <= count <= 8:
            raise ValueError('bounded explicit output required')
        request = {'memory_gb': 10, 'raw': item['raw'], 'max_tokens': count, 'seed': 7}
        for key in ['think', 'sampling']:
            if key in item: request[key] = item[key]
        if 'image' in item:
            request['images'] = [{'path': item['image'], 'sha256': item['image_sha256']}]
        requests[item['name']] = bench.request_body(request, path.read_text())
    return requests


def main():
    def interrupted(signum, frame):
        raise KeyboardInterrupt(f'received signal {signum}')
    signal.signal(signal.SIGTERM, interrupted)
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    protocol = json.loads(args.protocol.read_text())
    requests = validate_protocol(protocol)
    build = bench.verified_build(protocol['binary'])
    bench.validate_declared_binary(protocol, {'reference': build})
    if 'frozen_binary_sha256' not in protocol:
        raise ValueError('a frozen binary binding is mandatory')
    prerequisites = validate_prerequisites(protocol, build)
    model = Path(protocol['model']).resolve()
    args.out.mkdir(parents=True, exist_ok=False)
    for name, request in requests.items():
        (args.out / f'request-{name}.json').write_bytes(request)
    for source in [Path(__file__), Path(bench.__file__), ROOT / 'Tools/prefill_bench.py']:
        shutil.copyfile(source, args.out / source.name)
    shutil.copyfile(Path(build['binary']).parent / 'build-source.tar.gz', args.out / 'build-source.tar.gz')
    manifest = {'protocol': protocol, 'protocol_sha256': digest(args.protocol), 'build': build,
                'model': model_identity(model), 'classification': 'One sequential bounded model process',
                'prerequisites': prerequisites, 'passed': False}
    (args.out / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    rows = []
    child = None
    try:
        if bench.competing_jobs(): raise RuntimeError('competing build/storage work; model not launched')
        manifest['before'] = preflight(13)
        with socket.socket() as reservation:
            reservation.bind(('127.0.0.1', 0)); port = reservation.getsockname()[1]
        command = [build['binary'], 'serve', '--port', str(port), '--model', str(model),
                   '--memory-gb', '10', '--max-context', '32768', '--mtp', protocol['mtp'], '--no-elastic']
        env = {k: v for k, v in os.environ.items() if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
        env.update(protocol['env'], SLOTSTREAM_BENCH_DETAILS='1', SLOTSTREAM_PREFILL_CHUNK='256')
        manifest['command'] = command
        start = time.monotonic()
        with wall_deadline(protocol['maximum_duration_seconds_per_mode']), \
                (args.out / 'server.stdout').open('wb') as stdout, \
                (args.out / 'server.stderr').open('wb') as stderr:
            child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=stdout, stderr=stderr, start_new_session=True)
            bench.wait_ready(child, port)
            for cycle in range(-protocol['warmup_cycles'], protocol['measured_cycles']):
                for item in protocol['sequence']:
                    remaining = protocol['maximum_duration_seconds_per_mode'] - (time.monotonic() - start)
                    if remaining <= 0: raise TimeoutError('fixed lifetime duration exhausted')
                    if bench.competing_jobs(): raise RuntimeError('competing build/storage work during soak')
                    row = {'cycle': cycle, 'name': item['name'], 'has_image': 'image' in item,
                           'before': vm_snapshot(), 'succeeded': False}
                    try:
                        measured, wire = bench.exchange(port, requests[item['name']], min(120, remaining),
                                                        allow_complete_prompt=True)
                        row.update(measured, after=vm_snapshot())
                        row['prefix'] = prefix_snapshot(port)
                        (args.out / f'{cycle}-{item["name"]}.ndjson').write_bytes(wire)
                        metrics = row['metrics']; stats = metrics['stats']
                        if (stats.get('runtimeError') is not None or stats['decodeTokens'] != item['outputs']
                                or not 0 < stats['promptTokens'] <= protocol['maximum_prompt_tokens']
                                or metrics['effective_mtp'] != (protocol['mtp'] == 'on')
                                or metrics['effective_prefill_chunk'] != 256):
                            raise ValueError('request output, context or effective mode differs from the protocol')
                        peak = bench.sampled_request_peak(stats)
                        if type(peak) is not int or peak > protocol['acceptance']['maximum_sampled_physical_peak_bytes']:
                            raise ValueError('absolute physical resource bound exceeded or unavailable')
                        row['resource_clean'], row['resource_exclusions'] = clean_resource_observation(row, protocol)
                        row['succeeded'] = True
                    finally:
                        rows.append(row)
                        with (args.out / 'results.jsonl').open('a') as output:
                            output.write(json.dumps(row) + '\n')
                    print(json.dumps({'cycle': cycle, 'name': item['name'], 'resource_clean': row['resource_clean']}), flush=True)
    except (Exception, KeyboardInterrupt) as error:
        manifest['error'] = f'{type(error).__name__}: {error}'
    finally:
        if child is not None: bench.stop_server(child)
        manifest['after'] = vm_snapshot()
    report = assess(protocol, rows)
    manifest['passed'] = report['passed'] and 'error' not in manifest
    (args.out / 'assessment.json').write_text(json.dumps(report, indent=2) + '\n')
    (args.out / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    print(json.dumps({'passed': manifest['passed'], 'recorded_requests': len(rows), 'error': manifest.get('error')}))
    return 0 if manifest['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())

````

## /tmp/slotstream-optimization-execution/paired-correctness-v228/before-result.json

SHA-256 `213dedc795b6462b5bbedf73cac951733eea48299b0f23f0cb2a8593dbea1f8b`; 382 bytes.

````text
{
  "command": [
    "python3",
    "/tmp/slotstream-optimization-execution/paired-correctness-v228/before/expanded_test.py"
  ],
  "exit_code": 1,
  "seconds": 0.32220525,
  "pythonpath": "/tmp/slotstream-optimization-execution/paired-correctness-v228/before:/Users/carlos/Projects/slotstream/Tools",
  "classification": "pure prerequisite tests; no model, GPU, build or server"
}

````

## /tmp/slotstream-optimization-execution/paired-correctness-v228/before-stderr.txt

SHA-256 `526b5b5bcc4ae875592dc3d8fd9a4138b9d7152b0e00e9ef6f5fcadae2cc0ccb`; 4870 bytes.

````text
......F..F....F.FF.FF
======================================================================
FAIL: test_completed_wrong_configuration_is_not_a_discardable_sample (__main__.PrerequisiteTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/paired-correctness-v228/before/expanded_test.py", line 121, in test_completed_wrong_configuration_is_not_a_discardable_sample
    self.execution_mutation(mutate)
  File "/tmp/slotstream-optimization-execution/paired-correctness-v228/before/expanded_test.py", line 88, in execution_mutation
    self.validate()
AssertionError: ValueError not raised

======================================================================
FAIL: test_excluded_first_output_change_is_a_correctness_failure (__main__.PrerequisiteTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/paired-correctness-v228/before/expanded_test.py", line 100, in test_excluded_first_output_change_is_a_correctness_failure
    self.execution_mutation(mutate)
  File "/tmp/slotstream-optimization-execution/paired-correctness-v228/before/expanded_test.py", line 88, in execution_mutation
    self.validate()
AssertionError: ValueError not raised

======================================================================
FAIL: test_preflight_refusal_leaves_the_final_matrix_incomplete (__main__.PrerequisiteTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/paired-correctness-v228/before/expanded_test.py", line 115, in test_preflight_refusal_leaves_the_final_matrix_incomplete
    self.execution_mutation(mutate)
  File "/tmp/slotstream-optimization-execution/paired-correctness-v228/before/expanded_test.py", line 88, in execution_mutation
    self.validate()
AssertionError: ValueError not raised

======================================================================
FAIL: test_request_failure_is_not_a_discardable_timing_sample (__main__.PrerequisiteTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/paired-correctness-v228/before/expanded_test.py", line 109, in test_request_failure_is_not_a_discardable_timing_sample
    self.execution_mutation(lambda row: row.update(valid=False, error='HTTP 500 fixture'))
  File "/tmp/slotstream-optimization-execution/paired-correctness-v228/before/expanded_test.py", line 88, in execution_mutation
    self.validate()
AssertionError: ValueError not raised

======================================================================
FAIL: test_vm_excluded_absolute_peak_overflow_still_fails (__main__.PrerequisiteTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/paired-correctness-v228/before/expanded_test.py", line 106, in test_vm_excluded_absolute_peak_overflow_still_fails
    self.execution_mutation(mutate)
  File "/tmp/slotstream-optimization-execution/paired-correctness-v228/before/expanded_test.py", line 88, in execution_mutation
    self.validate()
AssertionError: ValueError not raised

======================================================================
FAIL: test_vm_excluded_measured_output_change_is_a_correctness_failure (__main__.PrerequisiteTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/paired-correctness-v228/before/expanded_test.py", line 94, in test_vm_excluded_measured_output_change_is_a_correctness_failure
    self.execution_mutation(mutate)
  File "/tmp/slotstream-optimization-execution/paired-correctness-v228/before/expanded_test.py", line 88, in execution_mutation
    self.validate()
AssertionError: ValueError not raised

======================================================================
FAIL: test_wrong_or_truncated_token_metadata_is_not_discardable (__main__.PrerequisiteTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/paired-correctness-v228/before/expanded_test.py", line 124, in test_wrong_or_truncated_token_metadata_is_not_discardable
    self.execution_mutation(lambda row: row['metrics'].update(output_ids=[]))
  File "/tmp/slotstream-optimization-execution/paired-correctness-v228/before/expanded_test.py", line 88, in execution_mutation
    self.validate()
AssertionError: ValueError not raised

----------------------------------------------------------------------
Ran 21 tests in 0.236s

FAILED (failures=7)

````

## /tmp/slotstream-optimization-execution/paired-correctness-v228/before-stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/paired-correctness-v229/after/optimization_prerequisites_test.py

SHA-256 `a5ec0aa30fd4a2b9467a4b9adee29529507bec4e158b91dc2295c1e669f8c881`; 18076 bytes.

````text
"""Receipt binding tests; benchmark statistics are tested by prefill_bench_test."""
import copy
from contextlib import ExitStack
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

from optimization_soak import validate_prerequisites
from prefill_bench import digest


class PrerequisiteTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.identity = {k: c * 64 for k, c in [('binary_sha256', 'a'),
            ('source_archive_sha256', 'b'), ('metallib_sha256', 'c')]}
        self.build = {'identity': self.identity}
        self.decision = [{'candidate': 'combined', 'passed': True, 'checks': {'fixture': True}}]
        self.protocol = {'mtp': 'off', 'env': {'SLOTSTREAM_OPT_FINAL_FORWARD': '1'},
                         'prerequisites': {'native': {}, 'paired': {}}}
        for name, variant in [('combined-plain', 'integrated'), ('combined-mtp', 'integrated-mtp'),
                              ('read-failure-serving', 'read-failure-serving')]:
            entry = self.entry('native', name)
            self.write(entry, 'manifest.json', {'identity': self.identity, 'passed': True, 'exit_code': 0,
                'assertions': 1, 'command': ['/unused/slotstream', 'optimization-state-check', '--variant', variant]})
            self.write(entry, 'stdout.txt', {'passed': True, 'items': [{'passed': True}]})
        for name in ['short-one', 'unique-prose', 'sampled-short', 'mtp-resource', 'distinct-tail',
                     'complete-repeat', 'unique-with-retention', 'actual-default-one-token']:
            entry = self.entry('paired', name)
            gate = {'minimum_pairs': 5, 'replacement_rounds': 0, 'all_outputs_exact': True}
            if name in ['short-one', 'distinct-tail', 'complete-repeat']:
                gate.update(minimum_median_client_reduction=.05, minimum_positive_fraction=.8)
            else:
                gate.update(maximum_median_client_regression=.05, minimum_positive_fraction=0)
            if name in ['unique-prose', 'sampled-short', 'mtp-resource']:
                gate.update(minimum_active_savings_bytes=300_000_000, minimum_sampled_peak_savings_bytes=200_000_000)
            self.write(entry, 'manifest.json', {'protocol': {'rounds': 16,
                'mtp': 'off', 'minimum_output_tokens': 1, 'max_tokens': 1,
                'maximum_sampled_footprint_bytes': 8_100_000_000,
                'arms': {arm: {'chunk': 256, 'env': {}} for arm in ['reference', 'combined']},
                'acceptance': gate,
                'startup_acceptance': {'minimum_pairs': 5, 'maximum_median_first_job_regression': .05,
                    'all_outputs_exact': True}},
                'arm_builds': {arm: self.build for arm in ['reference', 'combined']}})
            self.write(entry, 'completion.json', {'interrupted': False, 'stopped_early': False,
                'planned_cells': 32, 'recorded_cells': 32, 'acceptance': self.decision,
                'startup_acceptance': self.decision})
            rows = [self.response_row(i, arm) for i in range(1, 17) for arm in ['reference', 'combined']]
            self.write(entry, 'results.jsonl', rows)
            for row in rows:
                self.write(entry, f"{row['round']}-{row['arm']}/warmup.json", self.warmup_response(row))
        self.modify('paired', 'actual-default-one-token', 'manifest.json',
            lambda m: m['protocol'].update(arms={'reference': {'chunk': 256, 'env': {'SLOTSTREAM_OPT_FINAL_FORWARD': '0'}},
                'combined': {'chunk': 256, 'env': {}}}, max_tokens=1, minimum_output_tokens=1,
                prefix_cache={'retention_only': True, 'expected_reused_tokens': {'reference': 0, 'combined': 0}}))
        self.contract_path = self.root / 'qualification-contract.json'
        self.contract = {'format': 'slotstream-qualification-v1', 'build_identity': copy.deepcopy(self.identity),
            'native': {}, 'paired_protocols': {}, 'soak_modes': {}}
        for name, entry in self.protocol['prerequisites']['native'].items():
            manifest = json.loads((Path(entry['directory']) / 'manifest.json').read_text())
            self.contract['native'][name] = {'command': manifest['command'], 'environment': {}}
        for name, entry in self.protocol['prerequisites']['paired'].items():
            self.contract['paired_protocols'][name] = json.loads(
                (Path(entry['directory']) / 'manifest.json').read_text())['protocol']
        for mode in ['off', 'on']:
            self.contract['soak_modes'][mode] = {'mtp': mode, 'env': copy.deepcopy(self.protocol['env'])}
        self.freeze_contract()

    @staticmethod
    def response_row(number, arm):
        return {'round': number, 'arm': arm, 'valid': True,
            'client_seconds': 1.0, 'startup_seconds': 1.0,
            'startup_and_warmup_valid': True, 'text': 'measured',
            'first_request': {'prompt_ids': [17], 'output_ids': [7], 'text': 'first',
                'effective_mtp': False, 'effective_pool_slots': 640, 'complete_seconds_from_launch': 2.0},
            'metrics': {'schema_version': 1, 'prompt_ids': [101, 102], 'output_ids': [7],
                'effective_mtp': False, 'effective_pool_slots': 640, 'effective_prefill_chunk': 256,
                'stats': {'prefillSeconds': .5, 'decodeSeconds': .5, 'requestSeconds': 1.0,
                    'imageEncodeSeconds': 0.0, 'prefillRecords': 1, 'decodeRecords': 0,
                    'prefillTokens': 2, 'decodeTokens': 1, 'promptTokens': 2, 'prefillPasses': [2],
                    'lifetimeRSSPeakBytes': 1_000_000, 'sampledFootprint': {'peakBytes': 2_000_000}}}}

    def execution_mutation(self, change):
        self.modify('paired', 'unique-prose', 'results.jsonl', lambda rows: change(rows[-1]))
        with self.assertRaisesRegex(ValueError, 'paired execution failed'):
            self.validate()

    @staticmethod
    def warmup_response(row):
        metrics = copy.deepcopy(row['metrics'])
        metrics.update({key: row['first_request'][key] for key in
            ['prompt_ids', 'output_ids', 'effective_mtp', 'effective_pool_slots']})
        count = len(metrics['prompt_ids'])
        metrics['stats'].update(promptTokens=count, prefillTokens=count, prefillPasses=[count])
        return {'text': row['first_request']['text'], 'metrics': metrics}

    def test_vm_excluded_warmup_peak_overflow_still_fails(self):
        self.modify('paired', 'unique-prose', 'results.jsonl',
            lambda rows: rows[-1].update(valid=False, startup_and_warmup_valid=False, exclusion='swap activity'))
        self.modify('paired', 'unique-prose', '16-combined/warmup.json',
            lambda warm: warm['metrics']['stats']['sampledFootprint'].update(peakBytes=8_100_000_001))
        with self.assertRaisesRegex(ValueError, 'paired execution failed'):
            self.validate()

    def test_warmup_body_must_match_the_captured_first_request(self):
        self.modify('paired', 'unique-prose', '16-combined/warmup.json',
            lambda warm: warm['metrics'].update(output_ids=[8]))
        with self.assertRaisesRegex(ValueError, 'hashed warmup response'):
            self.validate()

    def test_every_warmup_body_requires_an_unchanged_digest(self):
        entry = self.protocol['prerequisites']['paired']['unique-prose']
        path = Path(entry['directory'])/'16-combined/warmup.json'
        path.write_text('{}')
        with self.assertRaisesRegex(ValueError, 'digest differs'):
            self.validate()

    def test_warmup_body_without_a_digest_is_not_accepted(self):
        entry = self.protocol['prerequisites']['paired']['unique-prose']
        del entry['sha256']['16-combined/warmup.json']
        with self.assertRaisesRegex(ValueError, 'digest differs'):
            self.validate()

    def test_vm_excluded_measured_output_change_is_a_correctness_failure(self):
        def mutate(row):
            row.update(valid=False, exclusion='swap activity')
            row['metrics']['output_ids'] = [8]
        self.execution_mutation(mutate)

    def test_excluded_first_output_change_is_a_correctness_failure(self):
        def mutate(row):
            row.update(valid=False, startup_and_warmup_valid=False, exclusion='swap activity')
            row['first_request']['output_ids'] = [8]
        self.execution_mutation(mutate)

    def test_vm_excluded_absolute_peak_overflow_still_fails(self):
        def mutate(row):
            row.update(valid=False, exclusion='swap activity')
            row['metrics']['stats']['sampledFootprint']['peakBytes'] = 8_100_000_001
        self.execution_mutation(mutate)

    def test_request_failure_is_not_a_discardable_timing_sample(self):
        self.execution_mutation(lambda row: row.update(valid=False, error='HTTP 500 fixture'))

    def test_preflight_refusal_leaves_the_final_matrix_incomplete(self):
        def mutate(row):
            row.pop('metrics'); row.pop('first_request')
            row.update(valid=False, error='InsufficientHeadroom fixture')
        self.execution_mutation(mutate)

    def test_completed_wrong_configuration_is_not_a_discardable_sample(self):
        def mutate(row):
            row.update(valid=False)
            row['metrics']['effective_prefill_chunk'] = 512
        self.execution_mutation(mutate)

    def test_wrong_or_truncated_token_metadata_is_not_discardable(self):
        self.execution_mutation(lambda row: row['metrics'].update(output_ids=[]))

    def test_vm_excluded_identical_complete_responses_remain_eligible_for_correctness(self):
        self.modify('paired', 'unique-prose', 'results.jsonl',
            lambda rows: rows[-1].update(valid=False, startup_and_warmup_valid=False, exclusion='swap activity'))
        self.assertEqual(len(self.validate()), 12)

    def test_actual_default_guard_rejects_forced_controls_even_when_frozen(self):
        self.actual_default_mutation(lambda p: p['arms']['combined']['env'].update(SLOTSTREAM_OPT_FINAL_FORWARD='1'))

    def test_actual_default_guard_rejects_disabled_retention_even_when_frozen(self):
        self.actual_default_mutation(lambda p: p.pop('prefix_cache'))

    def test_actual_default_guard_rejects_larger_reply_even_when_frozen(self):
        self.actual_default_mutation(lambda p: p.update(max_tokens=16, minimum_output_tokens=16))

    def actual_default_mutation(self, change):
        name = 'actual-default-one-token'
        self.modify('paired', name, 'manifest.json', lambda m: change(m['protocol']))
        entry = self.protocol['prerequisites']['paired'][name]
        self.contract['paired_protocols'][name] = json.loads((Path(entry['directory']) / 'manifest.json').read_text())['protocol']
        self.freeze_contract()
        with self.assertRaisesRegex(ValueError, 'actual-default guard'):
            self.validate()

    def freeze_contract(self):
        self.contract_path.write_text(json.dumps(self.contract))
        self.protocol['qualification_contract'] = {'path': str(self.contract_path),
            'sha256': digest(self.contract_path)}

    def entry(self, kind, name):
        path = self.root / name; path.mkdir()
        entry = {'directory': str(path), 'sha256': {}}
        self.protocol['prerequisites'][kind][name] = entry
        return entry

    def write(self, entry, name, data):
        path = Path(entry['directory']) / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(''.join(json.dumps(row) + '\n' for row in data)
                        if name.endswith('jsonl') else json.dumps(data))
        entry['sha256'][name] = digest(path)

    def modify(self, kind, name, file, change):
        entry = self.protocol['prerequisites'][kind][name]
        path = Path(entry['directory']) / file
        data = ([json.loads(line) for line in path.read_text().splitlines()]
                if file.endswith('jsonl') else json.loads(path.read_text()))
        change(data); self.write(entry, file, data)

    def validate(self, *, recomputed=None):
        with ExitStack() as stack:
            summary = stack.enter_context(patch('optimization_soak.bench.summaries', return_value=['fixture']))
            acceptance = stack.enter_context(patch('optimization_soak.bench.acceptance_results',
                return_value=self.decision if recomputed is None else recomputed))
            startup = stack.enter_context(patch('optimization_soak.bench.startup_acceptance_results',
                return_value=self.decision))
            result = validate_prerequisites(self.protocol, self.build)
            self.assertEqual((summary.call_count, acceptance.call_count, startup.call_count), (8, 8, 8))
            return result

    def test_complete_same_build_evidence_is_recomputed_and_accepted(self):
        self.assertEqual(len(self.validate()), 12)
        self.protocol['mtp'] = 'on'
        self.assertEqual(self.validate()['qualification_contract'], self.contract)

    def test_different_soak_controls_cannot_borrow_passing_evidence(self):
        self.protocol['env']['SLOTSTREAM_OPT_FINAL_FORWARD'] = '0'
        with self.assertRaisesRegex(ValueError, 'soak workload or controls'): self.validate()

    def test_relabeling_or_changing_a_paired_workload_is_rejected(self):
        # Even a newly signed report from the same binary may not replace the
        # pre-run workload with another prompt, budget, mode or control.
        entry = self.protocol['prerequisites']['paired']['unique-prose']
        before = json.loads((Path(entry['directory']) / 'manifest.json').read_text())
        for field, value in [('fixture_sha256', 'f' * 64), ('memory_gb', 10),
                             ('mtp', 'on'), ('arms', {'combined': {'env': {}}}),
                             ('required_equal_work', [])]:
            self.modify('paired', 'unique-prose', 'manifest.json', lambda d: d['protocol'].update({field: value}))
            with self.assertRaisesRegex(ValueError, 'paired workload or controls'): self.validate()
            self.write(entry, 'manifest.json', before)

    def test_native_environment_must_match_the_same_pre_run_contract(self):
        self.modify('native', 'combined-plain', 'manifest.json',
                    lambda d: d.update(environment={'SLOTSTREAM_OPT_FINAL_FORWARD': '0'}))
        with self.assertRaisesRegex(ValueError, 'native workload or controls'): self.validate()

    def test_contract_identity_build_and_complete_workloads_are_required(self):
        self.contract_path.write_text('{}')
        with self.assertRaisesRegex(ValueError, 'contract identity'): self.validate()
        self.freeze_contract()
        original = copy.deepcopy(self.contract)
        for mutate in [lambda c: c['build_identity'].update(source_archive_sha256='e' * 64),
                       lambda c: c['paired_protocols'].pop('short-one'),
                       lambda c: c['soak_modes'].pop('on')]:
            mutate(self.contract); self.freeze_contract()
            with self.assertRaises(ValueError): self.validate()
            self.contract = copy.deepcopy(original)
        self.freeze_contract()

    def test_missing_and_duplicate_workload_evidence_refused(self):
        with self.assertRaises(ValueError): validate_prerequisites({}, self.build)
        original = copy.deepcopy(self.protocol)
        del self.protocol['prerequisites']['native']['combined-mtp']
        with self.assertRaises(ValueError): self.validate()
        self.protocol = original
        p = self.protocol['prerequisites']['paired']; p['short-one'] = p['unique-prose']
        with self.assertRaisesRegex(ValueError, 'own study'): self.validate()

    def test_changed_receipt_digest_is_rejected(self):
        entry = self.protocol['prerequisites']['native']['combined-plain']
        (Path(entry['directory']) / 'stdout.txt').write_text('{}')
        with self.assertRaisesRegex(ValueError, 'digest differs'): self.validate()

    def test_native_wrong_source_failed_assertion_and_wrong_variant_are_rejected(self):
        original = copy.deepcopy(self.protocol)
        for file, mutate in [
            ('manifest.json', lambda d: d['identity'].update(source_archive_sha256='d' * 64)),
            ('stdout.txt', lambda d: d['items'][0].update(passed=False)),
            ('manifest.json', lambda d: d.update(command=['slotstream', 'optimization-state-check', '--variant', 'integrated-mtp']))]:
            entry = self.protocol['prerequisites']['native']['combined-plain']
            data = json.loads((Path(entry['directory']) / file).read_text())
            self.modify('native', 'combined-plain', file, mutate)
            with self.assertRaises(ValueError): self.validate()
            self.write(entry, file, data)
            self.protocol = copy.deepcopy(original)

    def test_incomplete_duplicate_and_other_build_paired_runs_refused(self):
        entry = self.protocol['prerequisites']['paired']['short-one']
        for file, mutate in [
            ('completion.json', lambda d: d.update(stopped_early=True)),
            ('results.jsonl', lambda d: d.__setitem__(-1, d[0])),
            ('manifest.json', lambda d: d['arm_builds']['combined']['identity'].update(binary_sha256='e' * 64)),
            ('manifest.json', lambda d: d['protocol']['acceptance'].update(minimum_pairs=1)),
            ('manifest.json', lambda d: d['protocol']['acceptance'].update(minimum_median_client_reduction=0))]:
            path = Path(entry['directory']) / file; content = path.read_bytes(); before = entry['sha256'][file]
            self.modify('paired', 'short-one', file, mutate)
            with self.assertRaises(ValueError): self.validate()
            path.write_bytes(content); entry['sha256'][file] = before

    def test_claimed_pass_does_not_override_recomputed_failure(self):
        with self.assertRaisesRegex(ValueError, 'recomputed'):
            self.validate(recomputed=[{'candidate': 'combined', 'passed': False}])


if __name__ == '__main__': unittest.main()

````

## /tmp/slotstream-optimization-execution/paired-correctness-v229/after/optimization_soak.py

SHA-256 `8ebbd4fdd6badd2ea34585d15365053f9212b73597c736f461fe17fe3d88e8aa`; 31030 bytes.

````text
#!/usr/bin/env python3
"""Bounded repeated-request lifetime qualification; no latency improvement claims."""
import argparse
from contextlib import contextmanager
import http.client
import json
import math
import os
from pathlib import Path
import shutil
import signal
import socket
import subprocess
import time

import serve_bench as bench
from prefill_bench import ROOT, digest, model_identity, preflight, vm_snapshot


@contextmanager
def wall_deadline(seconds):
    """Bound the complete live-server interval, including a stalled response.

    Socket timeouts alone bound each blocking read, not a stream that keeps
    delivering small frames. This standalone driver owns its main-thread timer.
    Cleanup happens outside the deadline so the owned server is always reaped.
    """
    if signal.getitimer(signal.ITIMER_REAL) != (0.0, 0.0):
        raise RuntimeError('another real-time alarm is already active')
    previous = signal.getsignal(signal.SIGALRM)
    def expired(signum, frame):
        raise TimeoutError('fixed lifetime duration exhausted')
    signal.signal(signal.SIGALRM, expired)
    try:
        signal.setitimer(signal.ITIMER_REAL, seconds)
        yield
    finally:
        signal.setitimer(signal.ITIMER_REAL, 0)
        signal.signal(signal.SIGALRM, previous)


def clean_resource_observation(row, protocol):
    metrics = row.get('metrics') or {}
    stats = metrics.get('stats') or {}
    errors = bench.resource_exclusions(stats, {
        'maximum_sampled_footprint_bytes': protocol['acceptance']['maximum_sampled_physical_peak_bytes'],
        'require_nominal_power_state': True,
        'images': row.get('has_image', False),
    })
    for before, after in [(row.get('before'), row.get('after')),
                          (stats.get('generatorVMBefore'), stats.get('generatorVMAfter'))]:
        if not isinstance(before, dict) or not isinstance(after, dict) or any(
            type(before.get(k)) is not int or type(after.get(k)) is not int or before[k] != after[k]
            for k in ['swapins', 'swapouts']):
            errors.append('missing or changed VM interval')
    return not errors, errors


def assess(protocol, rows):
    gate = protocol['acceptance']
    names = [item['name'] for item in protocol['sequence']]
    cycles = protocol['measured_cycles']
    warmup = protocol['warmup_cycles']
    expected = [(cycle, name) for cycle in range(-warmup, cycles) for name in names]
    coordinates = [(row['cycle'], row['name']) for row in rows]
    if len(coordinates) != len(set(coordinates)) or any(c not in expected for c in coordinates):
        raise ValueError('duplicate or undeclared soak request')
    checks = {'fixed_sequence_completed': coordinates == expected,
              'all_requests_succeeded': all(row.get('succeeded') is True for row in rows)}
    # Runtime failures and absolute overflows are failures even during warmup.
    peaks = [bench.sampled_request_peak((r.get('metrics') or {}).get('stats') or {}) for r in rows]
    checks['physical_ceiling'] = bool(peaks) and all(type(p) is int and 0 < p <=
        gate['maximum_sampled_physical_peak_bytes'] for p in peaks)
    details = []
    for name in names:
        selected = [r for r in rows if r['cycle'] >= 0 and r['name'] == name]
        clean = [r for r in selected if clean_resource_observation(r, protocol)[0]]
        early = [r for r in clean if r['cycle'] < cycles // 2]
        late = [r for r in clean if r['cycle'] >= cycles // 2]
        one = {'minimum_clean_observations': len(clean) >= gate['minimum_clean_observations_per_position'],
               'early_observations': len(early) >= gate['minimum_clean_early_observations_per_position'],
               'late_observations': len(late) >= gate['minimum_clean_late_observations_per_position']}
        outputs = [(r.get('metrics', {}).get('output_ids'), r.get('text')) for r in selected]
        one['exact_replay'] = bool(outputs) and bool(outputs[0][0]) and all(v == outputs[0] for v in outputs)
        growth = {}
        for field, limit in [('mlxActiveEndBytes', gate['maximum_active_growth_bytes_per_position']),
                             ('physicalFootprintEndBytes', gate['maximum_physical_end_growth_bytes_per_position'])]:
            a = [r['metrics']['stats'].get(field) for r in early]
            b = [r['metrics']['stats'].get(field) for r in late]
            valid = bool(a) and bool(b) and all(type(v) is int and v > 0 for v in a + b)
            growth[field] = max(b) - min(a) if valid else None
            one[field] = valid and growth[field] <= limit
        embedding_bytes = [(r.get('metrics') or {}).get('stats', {}).get('embeddingCachedPayloadBytes')
                           for r in selected]
        one['bounded_embedding_rows'] = bool(embedding_bytes) and all(
            type(value) is int and 0 <= value <= gate['maximum_cached_embedding_payload_bytes']
            for value in embedding_bytes)
        one['embedding_rows_enabled'] = bool(selected) and all(
            (r.get('metrics') or {}).get('stats', {}).get('embeddingRowsEnabled') is True for r in selected)
        one['bounded_prefix_capacity'] = bool(selected) and all(
            r.get('prefix', {}).get('enabled') is True
            and type(r['prefix'].get('conversations')) is int
            and 1 <= r['prefix']['conversations'] <= gate['maximum_prefix_entries']
            and type(r['prefix'].get('charged_token_capacity')) is int
            and type(r['prefix'].get('max_tokens')) is int
            and 0 <= r['prefix']['charged_token_capacity'] <= r['prefix']['max_tokens']
            for r in selected)
        details.append({'name': name, 'passed': all(one.values()), 'checks': one,
                        'clean_cycles': [r['cycle'] for r in clean], 'observed_growth_bytes': growth})
    checks['positions_pass'] = all(d['passed'] for d in details)
    return {'classification': 'Bounded repeated-request lifetime qualification; no throughput or unbounded-lifetime claim',
            'passed': all(checks.values()), 'checks': checks, 'positions': details}


def prefix_snapshot(port):
    connection = http.client.HTTPConnection('127.0.0.1', port, timeout=10)
    try:
        connection.request('POST', '/api/show', b'{}', {'Content-Type': 'application/json'})
        response = connection.getresponse()
        data = response.read(1 << 20)
        if response.status != 200 or len(data) >= 1 << 20:
            raise ValueError('bounded prefix snapshot unavailable')
        return json.loads(data)['details']['prefix_cache']
    finally:
        connection.close()


def qualification_contract(protocol, build):
    """Bind every workload and control to one reviewed pre-run matrix.

    A passing report with the right build and a different directory can still
    be the wrong workload. The separate frozen contract prevents relabeling a
    study or changing the soak's controls after its prerequisites were run.
    """
    binding = protocol.get('qualification_contract')
    if not isinstance(binding, dict) or set(binding) != {'path', 'sha256'}:
        raise ValueError('a frozen qualification contract is required')
    path = Path(binding['path'])
    if not path.is_file() or not 0 < path.stat().st_size <= 2_000_000 or digest(path) != binding['sha256']:
        raise ValueError('qualification contract identity or size differs')
    contract = json.loads(path.read_text())
    keys = {'format', 'build_identity', 'native', 'paired_protocols', 'soak_modes'}
    if not isinstance(contract, dict) or set(contract) != keys or contract['format'] != 'slotstream-qualification-v1':
        raise ValueError('invalid qualification contract format')
    identity_keys = {'binary_sha256', 'source_archive_sha256', 'metallib_sha256'}
    identity = contract['build_identity']
    if not isinstance(identity, dict) or set(identity) != identity_keys or any(
            not isinstance(identity[k], str) or len(identity[k]) != 64
            or identity[k] != build['identity'].get(k) for k in identity_keys):
        raise ValueError('qualification contract belongs to another build')
    modes = contract['soak_modes']
    declared = {k: v for k, v in protocol.items() if k not in {'qualification_contract', 'prerequisites'}}
    if (not isinstance(modes, dict) or set(modes) != {'off', 'on'}
            or declared != modes.get(protocol.get('mtp'))):
        raise ValueError('soak workload or controls differ from the frozen qualification contract')
    return contract


def validate_paired_execution(name, protocol, rows, warmups):
    """Timing exclusions never excuse wrong, missing or over-budget requests.

    The final matrix may exclude completed cells from timing for VM/thermal
    activity. Every attempted cell must still deliver the frozen workload and
    the same outputs. A preflight refusal leaves final qualification incomplete.
    This does not rescore or modify earlier component studies.
    """
    def refuse(reason):
        raise ValueError(f'paired execution failed for {name}: {reason}')

    mode = protocol.get('mtp', 'off')
    ceiling = protocol.get('maximum_sampled_footprint_bytes')
    minimum, maximum = protocol.get('minimum_output_tokens'), protocol.get('max_tokens')
    if (type(mode) is not str or mode not in {'off', 'on'} or type(ceiling) is not int or ceiling <= 0
            or type(minimum) is not int or type(maximum) is not int
            or not 1 <= minimum <= maximum <= 512):
        refuse('missing or invalid workload/resource bounds')
    anchors, pools, work = {}, {}, {}
    for row in rows:
        if 'error' in row or row.get('interrupted') is True:
            refuse('failed or interrupted request, regardless of timing eligibility')
        arm = protocol.get('arms', {}).get(row.get('arm'), {})
        metrics, first = row.get('metrics'), row.get('first_request')
        if type(metrics) is not dict or type(first) is not dict:
            refuse('both first and measured responses must be captured')
        for phase, data, text in [('first', first, first.get('text')),
                                  ('measured', metrics, row.get('text'))]:
            prompt, output = data.get('prompt_ids'), data.get('output_ids')
            if (type(prompt) is not list or not prompt or type(output) is not list
                    or not minimum <= len(output) <= maximum
                    or any(type(token) is not int or token < 0 for token in prompt + output)
                    or type(text) is not str):
                refuse(f'{phase} response has missing, malformed or truncated tokens/text')
            if type(data.get('effective_mtp')) is not bool or data['effective_mtp'] != (mode == 'on'):
                refuse(f'{phase} speculative mode differs from the declared workload')
            slots = data.get('effective_pool_slots')
            if type(slots) is not int or slots <= 0:
                refuse(f'{phase} pool size is missing or invalid')
            if protocol.get('comparison_basis', 'fixed-pool') == 'fixed-pool':
                if slots != pools.setdefault(phase, slots):
                    refuse(f'{phase} fixed pool differs between cells')
            observation = (tuple(prompt), tuple(output), text)
            if observation != anchors.setdefault(phase, observation):
                refuse(f'{phase} input/output differs, including a timing-excluded cell')
        if metrics.get('effective_prefill_chunk') != arm.get('chunk'):
            refuse('measured prefill setting differs from the frozen arm')
        if type(metrics.get('stats')) is not dict:
            refuse('measured statistics are missing or malformed')
        warm = warmups[(row['round'], row['arm'])]
        warm_metrics = warm.get('metrics') if type(warm) is dict else None
        if (type(warm_metrics) is not dict or type(warm_metrics.get('stats')) is not dict
                or warm.get('text') != first.get('text')
                or any(warm_metrics.get(field) != first.get(field) for field in
                       ['prompt_ids', 'output_ids', 'effective_mtp', 'effective_pool_slots'])
                or warm_metrics.get('effective_prefill_chunk') != arm.get('chunk')):
            refuse('hashed warmup response differs from its captured first request')
        prefix = protocol.get('prefix_cache', {})
        complete = (prefix.get('complete_prompt') is True
                    and prefix.get('expected_reused_tokens', {}).get(row['arm'], 0) > 0)
        try:
            stats = bench.validate_metrics(metrics, allow_complete_prompt=complete)
            warm_stats = bench.validate_metrics(warm_metrics)
        except (KeyError, TypeError, ValueError) as error:
            refuse(f'invalid measured response: {error}')
        peaks = [bench.sampled_request_peak(s) for s in [stats, warm_stats]]
        if any(type(peak) is not int or not 0 < peak <= ceiling for peak in peaks):
            refuse('absolute first/measured footprint ceiling, regardless of timing eligibility')
        durations = [row.get('client_seconds'), row.get('startup_seconds'),
                     first.get('complete_seconds_from_launch'), stats.get('requestSeconds')]
        if any(type(value) not in (int, float) or not math.isfinite(value) or value <= 0
               for value in durations):
            refuse('missing or invalid completed-request duration')
        for field in protocol.get('required_equal_work', []):
            value = stats.get(field)
            if type(value) is not int or value < 0 or value != work.setdefault(field, value):
                refuse(f'declared equal work differs: {field}')


def validate_prerequisites(protocol, build):
    """Require the final candidate's native and paired evidence before launch.

    Digests bind the exact reports; same-binary/source/Metal identity prevents
    borrowing a passing gate from an earlier implementation. Paired decisions
    are recomputed from their frozen rows using the ordinary benchmark gates.
    """
    required_native = {'combined-plain', 'combined-mtp', 'read-failure-serving'}
    required_paired = {'short-one', 'unique-prose', 'sampled-short', 'mtp-resource',
                       'distinct-tail', 'complete-repeat', 'unique-with-retention', 'actual-default-one-token'}
    prerequisites = protocol.get('prerequisites')
    if not isinstance(prerequisites, dict) or set(prerequisites) != {'native', 'paired'}:
        raise ValueError('native and paired final-candidate prerequisites are mandatory')
    for kind, names in [('native', required_native), ('paired', required_paired)]:
        if not isinstance(prerequisites[kind], dict) or set(prerequisites[kind]) != names:
            raise ValueError(f'complete {kind} prerequisite set required')
    contract = qualification_contract(protocol, build)
    for field, names in [('native', required_native), ('paired_protocols', required_paired)]:
        if not isinstance(contract[field], dict) or set(contract[field]) != names:
            raise ValueError(f'qualification contract requires every {field} workload')

    def same_identity(identity):
        return isinstance(identity, dict) and all(identity.get(k) == build['identity'].get(k)
            and isinstance(identity.get(k), str) and len(identity[k]) == 64
            for k in ['binary_sha256', 'source_archive_sha256', 'metallib_sha256'])

    def evidence(entry, name):
        path = Path(entry['directory']) / name
        expected = entry.get('sha256', {}).get(name)
        if type(expected) is not str or not path.is_file() or digest(path) != expected:
            raise ValueError(f'prerequisite digest differs: {path}')
        return path

    # Preserve the exact parsed contract with the receipt, not just its path.
    observed = {'qualification_contract': contract}
    for name, entry in prerequisites['native'].items():
        manifest = json.loads(evidence(entry, 'manifest.json').read_text())
        report = json.loads(evidence(entry, 'stdout.txt').read_text())
        items = report.get('items')
        if (not same_identity(manifest.get('identity')) or manifest.get('passed') is not True
                or manifest.get('exit_code') != 0 or report.get('passed') is not True
                or report.get('skipped') is not None or not isinstance(items, list) or not items
                or any(item.get('passed') is not True for item in items)
                or manifest.get('assertions') != len(items)):
            raise ValueError(f'native prerequisite failed or belongs to another build: {name}')
        command = manifest.get('command') or []
        if contract['native'][name] != {'command': command, 'environment': manifest.get('environment', {})}:
            raise ValueError(f'native workload or controls differ from the frozen contract: {name}')
        variants = {'combined-plain': ['integrated', 'integrated-vision-query'],
                    'combined-mtp': ['integrated-mtp', 'integrated-vision-query-mtp'],
                    'read-failure-serving': ['read-failure-serving']}[name]
        if ('optimization-state-check' not in command or '--variant' not in command
                or command.index('--variant') + 1 >= len(command)
                or command[command.index('--variant') + 1] not in variants):
            raise ValueError(f'native prerequisite has the wrong diagnostic: {name}')
        observed[name] = {'passed': True, 'assertions': len(items)}

    paired_directories = [str(Path(entry['directory']).resolve()) for entry in prerequisites['paired'].values()]
    if len(set(paired_directories)) != len(required_paired):
        raise ValueError('each paired workload requires its own study')
    for name, entry in prerequisites['paired'].items():
        manifest = json.loads(evidence(entry, 'manifest.json').read_text())
        completion = json.loads(evidence(entry, 'completion.json').read_text())
        rows = [json.loads(line) for line in evidence(entry, 'results.jsonl').read_text().splitlines()]
        declared = manifest['protocol']
        if declared != contract['paired_protocols'][name]:
            raise ValueError(f'paired workload or controls differ from the frozen contract: {name}')
        if name == 'actual-default-one-token':
            selected = declared.get('arms', {}).get('combined', {})
            prefix = declared.get('prefix_cache', {})
            if (selected.get('env') != {} or declared.get('max_tokens') != 1
                    or declared.get('minimum_output_tokens') != 1
                    or prefix.get('retention_only') is not True
                    or prefix.get('expected_reused_tokens') != {'reference': 0, 'combined': 0}):
                raise ValueError('actual-default guard requires unoverridden defaults, one output token and enabled unique-prompt retention')
        arms = manifest.get('arm_builds') or {}
        if (not arms or any(not same_identity(arm.get('identity')) for arm in arms.values())
                or completion.get('interrupted') is not False or completion.get('stopped_early') is not False
                or declared.get('rounds') != 16 or len(arms) != 2 or 'reference' not in arms
                or completion.get('planned_cells') != 32 or completion.get('recorded_cells') != 32
                or len(rows) != 32 or 'error' in completion):
            raise ValueError(f'paired prerequisite incomplete or belongs to another build: {name}')
        coordinates = [(row['round'], row['arm']) for row in rows]
        if len(set(coordinates)) != 32 or set(coordinates) != {
                (i, arm) for i in range(1, 17) for arm in arms}:
            raise ValueError(f'paired prerequisite has missing or duplicate cells: {name}')
        warmups = {(row['round'], row['arm']): json.loads(evidence(entry,
            f"{row['round']}-{row['arm']}/warmup.json").read_text()) for row in rows}
        validate_paired_execution(name, declared, rows, warmups)
        if not declared.get('acceptance') or not declared.get('startup_acceptance'):
            raise ValueError(f'paired prerequisite lacks both frozen acceptance gates: {name}')
        gate, first = declared['acceptance'], declared['startup_acceptance']
        required_gate = {'minimum_pairs': 5, 'replacement_rounds': 0, 'all_outputs_exact': True}
        if name in {'short-one', 'distinct-tail', 'complete-repeat'}:
            required_gate.update(minimum_median_client_reduction=.05, minimum_positive_fraction=.8)
        else:
            required_gate.update(maximum_median_client_regression=.05, minimum_positive_fraction=0)
        if name in {'unique-prose', 'sampled-short', 'mtp-resource'}:
            required_gate.update(minimum_active_savings_bytes=300_000_000,
                                 minimum_sampled_peak_savings_bytes=200_000_000)
        if (gate != required_gate or first != {'minimum_pairs': 5,
                'maximum_median_first_job_regression': .05, 'all_outputs_exact': True}):
            raise ValueError(f'paired prerequisite weakens final-matrix bounds: {name}')
        summary = bench.summaries(rows, 'reference', declared.get('comparison_basis', 'fixed-pool'),
                                  declared.get('required_equal_work'))
        accepted = bench.acceptance_results(summary, declared['acceptance'])
        startup = bench.startup_acceptance_results(rows, 'reference', declared['startup_acceptance'])
        if (not accepted or not startup or any(item.get('passed') is not True for item in accepted + startup)
                or accepted != completion.get('acceptance') or startup != completion.get('startup_acceptance')):
            raise ValueError(f'paired prerequisite fails recomputed request/first-job gates: {name}')
        observed[name] = {'passed': True, 'cells': len(rows)}
    return observed


def validate_protocol(protocol):
    integer_fields = ['memory_gb', 'max_context', 'warmup_cycles', 'measured_cycles',
                      'maximum_duration_seconds_per_mode', 'maximum_prompt_tokens', 'maximum_output_tokens']
    if any(type(protocol.get(key)) is not int for key in integer_fields):
        raise ValueError('soak limits require explicit integer values')
    if (protocol.get('classification') != 'Frozen combined lifetime qualification'
            or protocol.get('memory_gb') != 10 or protocol.get('max_context') != 32768
            or protocol.get('mtp') not in ['off', 'on']
            or protocol.get('warmup_cycles') != 2 or protocol.get('measured_cycles') != 8
            or protocol.get('maximum_duration_seconds_per_mode') != 900
            or protocol.get('maximum_prompt_tokens') != 1024 or protocol.get('maximum_output_tokens') != 8):
        raise ValueError('soak requires the explicit bounded and frozen lifetime protocol')
    sequence = protocol.get('sequence')
    if not isinstance(sequence, list) or len(sequence) != 6:
        raise ValueError('soak requires the frozen six-request cycle')
    names = [item.get('name') for item in sequence]
    if any(type(n) is not str or not n.replace('-', '').isalnum() for n in names) or len(set(names)) != len(names):
        raise ValueError('request labels must be unique safe names')
    gate = protocol.get('acceptance') or {}
    limits = {'maximum_sampled_physical_peak_bytes': 10_000_000_000,
              'maximum_active_growth_bytes_per_position': 64 << 20,
              'maximum_physical_end_growth_bytes_per_position': 256 << 20,
              'maximum_cached_embedding_payload_bytes': 11_796_480,
              'maximum_prefix_entries': 4, 'minimum_clean_observations_per_position': 5,
              'minimum_clean_early_observations_per_position': 2,
              'minimum_clean_late_observations_per_position': 2, 'replacement_cycles': 0}
    if any(type(gate.get(k)) is not int or gate[k] != v for k, v in limits.items()):
        raise ValueError('lifetime bounds must match the frozen contract')
    if any(gate.get(k) is not True for k in ['all_expected_requests_complete',
        'exact_per_position_replay_after_warmup', 'prefix_charge_within_declared_capacity',
        'nominal_power_and_unchanged_request_vm_for_resource_observations']):
        raise ValueError('lifetime evidence and exactness requirements cannot be weakened')
    arm = {'reference': {'chunk': 256, 'env': protocol.get('env')}}
    bench.validate_arms(arm)
    requests = {}
    for item in sequence:
        path = Path(item['fixture'])
        if not path.is_file() or not 1 <= path.stat().st_size <= 4096 or digest(path) != item['fixture_sha256']:
            raise ValueError('soak fixture identity/size differs')
        count = item.get('outputs')
        if type(count) is not int or not 1 <= count <= 8:
            raise ValueError('bounded explicit output required')
        request = {'memory_gb': 10, 'raw': item['raw'], 'max_tokens': count, 'seed': 7}
        for key in ['think', 'sampling']:
            if key in item: request[key] = item[key]
        if 'image' in item:
            request['images'] = [{'path': item['image'], 'sha256': item['image_sha256']}]
        requests[item['name']] = bench.request_body(request, path.read_text())
    return requests


def main():
    def interrupted(signum, frame):
        raise KeyboardInterrupt(f'received signal {signum}')
    signal.signal(signal.SIGTERM, interrupted)
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    protocol = json.loads(args.protocol.read_text())
    requests = validate_protocol(protocol)
    build = bench.verified_build(protocol['binary'])
    bench.validate_declared_binary(protocol, {'reference': build})
    if 'frozen_binary_sha256' not in protocol:
        raise ValueError('a frozen binary binding is mandatory')
    prerequisites = validate_prerequisites(protocol, build)
    model = Path(protocol['model']).resolve()
    args.out.mkdir(parents=True, exist_ok=False)
    for name, request in requests.items():
        (args.out / f'request-{name}.json').write_bytes(request)
    for source in [Path(__file__), Path(bench.__file__), ROOT / 'Tools/prefill_bench.py']:
        shutil.copyfile(source, args.out / source.name)
    shutil.copyfile(Path(build['binary']).parent / 'build-source.tar.gz', args.out / 'build-source.tar.gz')
    manifest = {'protocol': protocol, 'protocol_sha256': digest(args.protocol), 'build': build,
                'model': model_identity(model), 'classification': 'One sequential bounded model process',
                'prerequisites': prerequisites, 'passed': False}
    (args.out / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    rows = []
    child = None
    try:
        if bench.competing_jobs(): raise RuntimeError('competing build/storage work; model not launched')
        manifest['before'] = preflight(13)
        with socket.socket() as reservation:
            reservation.bind(('127.0.0.1', 0)); port = reservation.getsockname()[1]
        command = [build['binary'], 'serve', '--port', str(port), '--model', str(model),
                   '--memory-gb', '10', '--max-context', '32768', '--mtp', protocol['mtp'], '--no-elastic']
        env = {k: v for k, v in os.environ.items() if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
        env.update(protocol['env'], SLOTSTREAM_BENCH_DETAILS='1', SLOTSTREAM_PREFILL_CHUNK='256')
        manifest['command'] = command
        start = time.monotonic()
        with wall_deadline(protocol['maximum_duration_seconds_per_mode']), \
                (args.out / 'server.stdout').open('wb') as stdout, \
                (args.out / 'server.stderr').open('wb') as stderr:
            child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=stdout, stderr=stderr, start_new_session=True)
            bench.wait_ready(child, port)
            for cycle in range(-protocol['warmup_cycles'], protocol['measured_cycles']):
                for item in protocol['sequence']:
                    remaining = protocol['maximum_duration_seconds_per_mode'] - (time.monotonic() - start)
                    if remaining <= 0: raise TimeoutError('fixed lifetime duration exhausted')
                    if bench.competing_jobs(): raise RuntimeError('competing build/storage work during soak')
                    row = {'cycle': cycle, 'name': item['name'], 'has_image': 'image' in item,
                           'before': vm_snapshot(), 'succeeded': False}
                    try:
                        measured, wire = bench.exchange(port, requests[item['name']], min(120, remaining),
                                                        allow_complete_prompt=True)
                        row.update(measured, after=vm_snapshot())
                        row['prefix'] = prefix_snapshot(port)
                        (args.out / f'{cycle}-{item["name"]}.ndjson').write_bytes(wire)
                        metrics = row['metrics']; stats = metrics['stats']
                        if (stats.get('runtimeError') is not None or stats['decodeTokens'] != item['outputs']
                                or not 0 < stats['promptTokens'] <= protocol['maximum_prompt_tokens']
                                or metrics['effective_mtp'] != (protocol['mtp'] == 'on')
                                or metrics['effective_prefill_chunk'] != 256):
                            raise ValueError('request output, context or effective mode differs from the protocol')
                        peak = bench.sampled_request_peak(stats)
                        if type(peak) is not int or peak > protocol['acceptance']['maximum_sampled_physical_peak_bytes']:
                            raise ValueError('absolute physical resource bound exceeded or unavailable')
                        row['resource_clean'], row['resource_exclusions'] = clean_resource_observation(row, protocol)
                        row['succeeded'] = True
                    finally:
                        rows.append(row)
                        with (args.out / 'results.jsonl').open('a') as output:
                            output.write(json.dumps(row) + '\n')
                    print(json.dumps({'cycle': cycle, 'name': item['name'], 'resource_clean': row['resource_clean']}), flush=True)
    except (Exception, KeyboardInterrupt) as error:
        manifest['error'] = f'{type(error).__name__}: {error}'
    finally:
        if child is not None: bench.stop_server(child)
        manifest['after'] = vm_snapshot()
    report = assess(protocol, rows)
    manifest['passed'] = report['passed'] and 'error' not in manifest
    (args.out / 'assessment.json').write_text(json.dumps(report, indent=2) + '\n')
    (args.out / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    print(json.dumps({'passed': manifest['passed'], 'recorded_requests': len(rows), 'error': manifest.get('error')}))
    return 0 if manifest['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())

````

## /tmp/slotstream-optimization-execution/paired-correctness-v229/after-result.json

SHA-256 `0ece7c97144050848a1567e94c7a42ca6061e98d43a92d6cb6c3bda4b5970d32`; 434 bytes.

````text
{
  "command": [
    "python3",
    "/tmp/slotstream-optimization-execution/paired-correctness-v229/after/optimization_prerequisites_test.py"
  ],
  "exit_code": 0,
  "seconds": 2.2109160829999994,
  "pythonpath": "/tmp/slotstream-optimization-execution/paired-correctness-v229/after:/Users/carlos/Projects/slotstream/Tools",
  "classification": "pure prerequisite tests with hashed warmup receipts; no model, GPU, build or server"
}

````

## /tmp/slotstream-optimization-execution/paired-correctness-v229/after-stderr.txt

SHA-256 `44a09c9cb42ffcb7d97cbafb5e8701435df1d15b7195788915062bb40e3437f5`; 124 bytes.

````text
.........................
----------------------------------------------------------------------
Ran 25 tests in 2.136s

OK

````

## /tmp/slotstream-optimization-execution/paired-correctness-v229/after-stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/paired-correctness-v229/applied.json

SHA-256 `732c3a5f2e94edec28675d8f262f72848e384fa6947d9fc2e9792c55f51c4c82`; 880 bytes.

````text
{
  "state": "APPLIED",
  "files": [
    {
      "path": "Tools/optimization_soak.py",
      "before_sha256": "59737c1d9b85222c05517690230d519fc3904a18c7989ae89131539b468667c8",
      "after_sha256": "8ebbd4fdd6badd2ea34585d15365053f9212b73597c736f461fe17fe3d88e8aa"
    },
    {
      "path": "Tools/optimization_prerequisites_test.py",
      "before_sha256": "5e9c12aadce395881631a1ca5ed909997e8e95ec14c5e01ee671d1248c7ac67f",
      "after_sha256": "a5ec0aa30fd4a2b9467a4b9adee29529507bec4e158b91dc2295c1e669f8c881"
    }
  ],
  "scope": "Prospective final eight-study prerequisite; no frozen component/serving driver or runtime change",
  "requires": "All32first+measured responses per study complete; all32warmup.json digests bound in prerequisite receipt; VM/power affect timing eligibility only; exact workload/output and absolute peaks required for every captured cell."
}

````

## /tmp/slotstream-optimization-execution/paired-correctness-v229/before/expanded_test.py

SHA-256 `a5ec0aa30fd4a2b9467a4b9adee29529507bec4e158b91dc2295c1e669f8c881`; 18076 bytes.

````text
"""Receipt binding tests; benchmark statistics are tested by prefill_bench_test."""
import copy
from contextlib import ExitStack
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

from optimization_soak import validate_prerequisites
from prefill_bench import digest


class PrerequisiteTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.identity = {k: c * 64 for k, c in [('binary_sha256', 'a'),
            ('source_archive_sha256', 'b'), ('metallib_sha256', 'c')]}
        self.build = {'identity': self.identity}
        self.decision = [{'candidate': 'combined', 'passed': True, 'checks': {'fixture': True}}]
        self.protocol = {'mtp': 'off', 'env': {'SLOTSTREAM_OPT_FINAL_FORWARD': '1'},
                         'prerequisites': {'native': {}, 'paired': {}}}
        for name, variant in [('combined-plain', 'integrated'), ('combined-mtp', 'integrated-mtp'),
                              ('read-failure-serving', 'read-failure-serving')]:
            entry = self.entry('native', name)
            self.write(entry, 'manifest.json', {'identity': self.identity, 'passed': True, 'exit_code': 0,
                'assertions': 1, 'command': ['/unused/slotstream', 'optimization-state-check', '--variant', variant]})
            self.write(entry, 'stdout.txt', {'passed': True, 'items': [{'passed': True}]})
        for name in ['short-one', 'unique-prose', 'sampled-short', 'mtp-resource', 'distinct-tail',
                     'complete-repeat', 'unique-with-retention', 'actual-default-one-token']:
            entry = self.entry('paired', name)
            gate = {'minimum_pairs': 5, 'replacement_rounds': 0, 'all_outputs_exact': True}
            if name in ['short-one', 'distinct-tail', 'complete-repeat']:
                gate.update(minimum_median_client_reduction=.05, minimum_positive_fraction=.8)
            else:
                gate.update(maximum_median_client_regression=.05, minimum_positive_fraction=0)
            if name in ['unique-prose', 'sampled-short', 'mtp-resource']:
                gate.update(minimum_active_savings_bytes=300_000_000, minimum_sampled_peak_savings_bytes=200_000_000)
            self.write(entry, 'manifest.json', {'protocol': {'rounds': 16,
                'mtp': 'off', 'minimum_output_tokens': 1, 'max_tokens': 1,
                'maximum_sampled_footprint_bytes': 8_100_000_000,
                'arms': {arm: {'chunk': 256, 'env': {}} for arm in ['reference', 'combined']},
                'acceptance': gate,
                'startup_acceptance': {'minimum_pairs': 5, 'maximum_median_first_job_regression': .05,
                    'all_outputs_exact': True}},
                'arm_builds': {arm: self.build for arm in ['reference', 'combined']}})
            self.write(entry, 'completion.json', {'interrupted': False, 'stopped_early': False,
                'planned_cells': 32, 'recorded_cells': 32, 'acceptance': self.decision,
                'startup_acceptance': self.decision})
            rows = [self.response_row(i, arm) for i in range(1, 17) for arm in ['reference', 'combined']]
            self.write(entry, 'results.jsonl', rows)
            for row in rows:
                self.write(entry, f"{row['round']}-{row['arm']}/warmup.json", self.warmup_response(row))
        self.modify('paired', 'actual-default-one-token', 'manifest.json',
            lambda m: m['protocol'].update(arms={'reference': {'chunk': 256, 'env': {'SLOTSTREAM_OPT_FINAL_FORWARD': '0'}},
                'combined': {'chunk': 256, 'env': {}}}, max_tokens=1, minimum_output_tokens=1,
                prefix_cache={'retention_only': True, 'expected_reused_tokens': {'reference': 0, 'combined': 0}}))
        self.contract_path = self.root / 'qualification-contract.json'
        self.contract = {'format': 'slotstream-qualification-v1', 'build_identity': copy.deepcopy(self.identity),
            'native': {}, 'paired_protocols': {}, 'soak_modes': {}}
        for name, entry in self.protocol['prerequisites']['native'].items():
            manifest = json.loads((Path(entry['directory']) / 'manifest.json').read_text())
            self.contract['native'][name] = {'command': manifest['command'], 'environment': {}}
        for name, entry in self.protocol['prerequisites']['paired'].items():
            self.contract['paired_protocols'][name] = json.loads(
                (Path(entry['directory']) / 'manifest.json').read_text())['protocol']
        for mode in ['off', 'on']:
            self.contract['soak_modes'][mode] = {'mtp': mode, 'env': copy.deepcopy(self.protocol['env'])}
        self.freeze_contract()

    @staticmethod
    def response_row(number, arm):
        return {'round': number, 'arm': arm, 'valid': True,
            'client_seconds': 1.0, 'startup_seconds': 1.0,
            'startup_and_warmup_valid': True, 'text': 'measured',
            'first_request': {'prompt_ids': [17], 'output_ids': [7], 'text': 'first',
                'effective_mtp': False, 'effective_pool_slots': 640, 'complete_seconds_from_launch': 2.0},
            'metrics': {'schema_version': 1, 'prompt_ids': [101, 102], 'output_ids': [7],
                'effective_mtp': False, 'effective_pool_slots': 640, 'effective_prefill_chunk': 256,
                'stats': {'prefillSeconds': .5, 'decodeSeconds': .5, 'requestSeconds': 1.0,
                    'imageEncodeSeconds': 0.0, 'prefillRecords': 1, 'decodeRecords': 0,
                    'prefillTokens': 2, 'decodeTokens': 1, 'promptTokens': 2, 'prefillPasses': [2],
                    'lifetimeRSSPeakBytes': 1_000_000, 'sampledFootprint': {'peakBytes': 2_000_000}}}}

    def execution_mutation(self, change):
        self.modify('paired', 'unique-prose', 'results.jsonl', lambda rows: change(rows[-1]))
        with self.assertRaisesRegex(ValueError, 'paired execution failed'):
            self.validate()

    @staticmethod
    def warmup_response(row):
        metrics = copy.deepcopy(row['metrics'])
        metrics.update({key: row['first_request'][key] for key in
            ['prompt_ids', 'output_ids', 'effective_mtp', 'effective_pool_slots']})
        count = len(metrics['prompt_ids'])
        metrics['stats'].update(promptTokens=count, prefillTokens=count, prefillPasses=[count])
        return {'text': row['first_request']['text'], 'metrics': metrics}

    def test_vm_excluded_warmup_peak_overflow_still_fails(self):
        self.modify('paired', 'unique-prose', 'results.jsonl',
            lambda rows: rows[-1].update(valid=False, startup_and_warmup_valid=False, exclusion='swap activity'))
        self.modify('paired', 'unique-prose', '16-combined/warmup.json',
            lambda warm: warm['metrics']['stats']['sampledFootprint'].update(peakBytes=8_100_000_001))
        with self.assertRaisesRegex(ValueError, 'paired execution failed'):
            self.validate()

    def test_warmup_body_must_match_the_captured_first_request(self):
        self.modify('paired', 'unique-prose', '16-combined/warmup.json',
            lambda warm: warm['metrics'].update(output_ids=[8]))
        with self.assertRaisesRegex(ValueError, 'hashed warmup response'):
            self.validate()

    def test_every_warmup_body_requires_an_unchanged_digest(self):
        entry = self.protocol['prerequisites']['paired']['unique-prose']
        path = Path(entry['directory'])/'16-combined/warmup.json'
        path.write_text('{}')
        with self.assertRaisesRegex(ValueError, 'digest differs'):
            self.validate()

    def test_warmup_body_without_a_digest_is_not_accepted(self):
        entry = self.protocol['prerequisites']['paired']['unique-prose']
        del entry['sha256']['16-combined/warmup.json']
        with self.assertRaisesRegex(ValueError, 'digest differs'):
            self.validate()

    def test_vm_excluded_measured_output_change_is_a_correctness_failure(self):
        def mutate(row):
            row.update(valid=False, exclusion='swap activity')
            row['metrics']['output_ids'] = [8]
        self.execution_mutation(mutate)

    def test_excluded_first_output_change_is_a_correctness_failure(self):
        def mutate(row):
            row.update(valid=False, startup_and_warmup_valid=False, exclusion='swap activity')
            row['first_request']['output_ids'] = [8]
        self.execution_mutation(mutate)

    def test_vm_excluded_absolute_peak_overflow_still_fails(self):
        def mutate(row):
            row.update(valid=False, exclusion='swap activity')
            row['metrics']['stats']['sampledFootprint']['peakBytes'] = 8_100_000_001
        self.execution_mutation(mutate)

    def test_request_failure_is_not_a_discardable_timing_sample(self):
        self.execution_mutation(lambda row: row.update(valid=False, error='HTTP 500 fixture'))

    def test_preflight_refusal_leaves_the_final_matrix_incomplete(self):
        def mutate(row):
            row.pop('metrics'); row.pop('first_request')
            row.update(valid=False, error='InsufficientHeadroom fixture')
        self.execution_mutation(mutate)

    def test_completed_wrong_configuration_is_not_a_discardable_sample(self):
        def mutate(row):
            row.update(valid=False)
            row['metrics']['effective_prefill_chunk'] = 512
        self.execution_mutation(mutate)

    def test_wrong_or_truncated_token_metadata_is_not_discardable(self):
        self.execution_mutation(lambda row: row['metrics'].update(output_ids=[]))

    def test_vm_excluded_identical_complete_responses_remain_eligible_for_correctness(self):
        self.modify('paired', 'unique-prose', 'results.jsonl',
            lambda rows: rows[-1].update(valid=False, startup_and_warmup_valid=False, exclusion='swap activity'))
        self.assertEqual(len(self.validate()), 12)

    def test_actual_default_guard_rejects_forced_controls_even_when_frozen(self):
        self.actual_default_mutation(lambda p: p['arms']['combined']['env'].update(SLOTSTREAM_OPT_FINAL_FORWARD='1'))

    def test_actual_default_guard_rejects_disabled_retention_even_when_frozen(self):
        self.actual_default_mutation(lambda p: p.pop('prefix_cache'))

    def test_actual_default_guard_rejects_larger_reply_even_when_frozen(self):
        self.actual_default_mutation(lambda p: p.update(max_tokens=16, minimum_output_tokens=16))

    def actual_default_mutation(self, change):
        name = 'actual-default-one-token'
        self.modify('paired', name, 'manifest.json', lambda m: change(m['protocol']))
        entry = self.protocol['prerequisites']['paired'][name]
        self.contract['paired_protocols'][name] = json.loads((Path(entry['directory']) / 'manifest.json').read_text())['protocol']
        self.freeze_contract()
        with self.assertRaisesRegex(ValueError, 'actual-default guard'):
            self.validate()

    def freeze_contract(self):
        self.contract_path.write_text(json.dumps(self.contract))
        self.protocol['qualification_contract'] = {'path': str(self.contract_path),
            'sha256': digest(self.contract_path)}

    def entry(self, kind, name):
        path = self.root / name; path.mkdir()
        entry = {'directory': str(path), 'sha256': {}}
        self.protocol['prerequisites'][kind][name] = entry
        return entry

    def write(self, entry, name, data):
        path = Path(entry['directory']) / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(''.join(json.dumps(row) + '\n' for row in data)
                        if name.endswith('jsonl') else json.dumps(data))
        entry['sha256'][name] = digest(path)

    def modify(self, kind, name, file, change):
        entry = self.protocol['prerequisites'][kind][name]
        path = Path(entry['directory']) / file
        data = ([json.loads(line) for line in path.read_text().splitlines()]
                if file.endswith('jsonl') else json.loads(path.read_text()))
        change(data); self.write(entry, file, data)

    def validate(self, *, recomputed=None):
        with ExitStack() as stack:
            summary = stack.enter_context(patch('optimization_soak.bench.summaries', return_value=['fixture']))
            acceptance = stack.enter_context(patch('optimization_soak.bench.acceptance_results',
                return_value=self.decision if recomputed is None else recomputed))
            startup = stack.enter_context(patch('optimization_soak.bench.startup_acceptance_results',
                return_value=self.decision))
            result = validate_prerequisites(self.protocol, self.build)
            self.assertEqual((summary.call_count, acceptance.call_count, startup.call_count), (8, 8, 8))
            return result

    def test_complete_same_build_evidence_is_recomputed_and_accepted(self):
        self.assertEqual(len(self.validate()), 12)
        self.protocol['mtp'] = 'on'
        self.assertEqual(self.validate()['qualification_contract'], self.contract)

    def test_different_soak_controls_cannot_borrow_passing_evidence(self):
        self.protocol['env']['SLOTSTREAM_OPT_FINAL_FORWARD'] = '0'
        with self.assertRaisesRegex(ValueError, 'soak workload or controls'): self.validate()

    def test_relabeling_or_changing_a_paired_workload_is_rejected(self):
        # Even a newly signed report from the same binary may not replace the
        # pre-run workload with another prompt, budget, mode or control.
        entry = self.protocol['prerequisites']['paired']['unique-prose']
        before = json.loads((Path(entry['directory']) / 'manifest.json').read_text())
        for field, value in [('fixture_sha256', 'f' * 64), ('memory_gb', 10),
                             ('mtp', 'on'), ('arms', {'combined': {'env': {}}}),
                             ('required_equal_work', [])]:
            self.modify('paired', 'unique-prose', 'manifest.json', lambda d: d['protocol'].update({field: value}))
            with self.assertRaisesRegex(ValueError, 'paired workload or controls'): self.validate()
            self.write(entry, 'manifest.json', before)

    def test_native_environment_must_match_the_same_pre_run_contract(self):
        self.modify('native', 'combined-plain', 'manifest.json',
                    lambda d: d.update(environment={'SLOTSTREAM_OPT_FINAL_FORWARD': '0'}))
        with self.assertRaisesRegex(ValueError, 'native workload or controls'): self.validate()

    def test_contract_identity_build_and_complete_workloads_are_required(self):
        self.contract_path.write_text('{}')
        with self.assertRaisesRegex(ValueError, 'contract identity'): self.validate()
        self.freeze_contract()
        original = copy.deepcopy(self.contract)
        for mutate in [lambda c: c['build_identity'].update(source_archive_sha256='e' * 64),
                       lambda c: c['paired_protocols'].pop('short-one'),
                       lambda c: c['soak_modes'].pop('on')]:
            mutate(self.contract); self.freeze_contract()
            with self.assertRaises(ValueError): self.validate()
            self.contract = copy.deepcopy(original)
        self.freeze_contract()

    def test_missing_and_duplicate_workload_evidence_refused(self):
        with self.assertRaises(ValueError): validate_prerequisites({}, self.build)
        original = copy.deepcopy(self.protocol)
        del self.protocol['prerequisites']['native']['combined-mtp']
        with self.assertRaises(ValueError): self.validate()
        self.protocol = original
        p = self.protocol['prerequisites']['paired']; p['short-one'] = p['unique-prose']
        with self.assertRaisesRegex(ValueError, 'own study'): self.validate()

    def test_changed_receipt_digest_is_rejected(self):
        entry = self.protocol['prerequisites']['native']['combined-plain']
        (Path(entry['directory']) / 'stdout.txt').write_text('{}')
        with self.assertRaisesRegex(ValueError, 'digest differs'): self.validate()

    def test_native_wrong_source_failed_assertion_and_wrong_variant_are_rejected(self):
        original = copy.deepcopy(self.protocol)
        for file, mutate in [
            ('manifest.json', lambda d: d['identity'].update(source_archive_sha256='d' * 64)),
            ('stdout.txt', lambda d: d['items'][0].update(passed=False)),
            ('manifest.json', lambda d: d.update(command=['slotstream', 'optimization-state-check', '--variant', 'integrated-mtp']))]:
            entry = self.protocol['prerequisites']['native']['combined-plain']
            data = json.loads((Path(entry['directory']) / file).read_text())
            self.modify('native', 'combined-plain', file, mutate)
            with self.assertRaises(ValueError): self.validate()
            self.write(entry, file, data)
            self.protocol = copy.deepcopy(original)

    def test_incomplete_duplicate_and_other_build_paired_runs_refused(self):
        entry = self.protocol['prerequisites']['paired']['short-one']
        for file, mutate in [
            ('completion.json', lambda d: d.update(stopped_early=True)),
            ('results.jsonl', lambda d: d.__setitem__(-1, d[0])),
            ('manifest.json', lambda d: d['arm_builds']['combined']['identity'].update(binary_sha256='e' * 64)),
            ('manifest.json', lambda d: d['protocol']['acceptance'].update(minimum_pairs=1)),
            ('manifest.json', lambda d: d['protocol']['acceptance'].update(minimum_median_client_reduction=0))]:
            path = Path(entry['directory']) / file; content = path.read_bytes(); before = entry['sha256'][file]
            self.modify('paired', 'short-one', file, mutate)
            with self.assertRaises(ValueError): self.validate()
            path.write_bytes(content); entry['sha256'][file] = before

    def test_claimed_pass_does_not_override_recomputed_failure(self):
        with self.assertRaisesRegex(ValueError, 'recomputed'):
            self.validate(recomputed=[{'candidate': 'combined', 'passed': False}])


if __name__ == '__main__': unittest.main()

````

## /tmp/slotstream-optimization-execution/paired-correctness-v229/before/optimization_prerequisites_test.py

SHA-256 `5e9c12aadce395881631a1ca5ed909997e8e95ec14c5e01ee671d1248c7ac67f`; 12471 bytes.

````text
"""Receipt binding tests; benchmark statistics are tested by prefill_bench_test."""
import copy
from contextlib import ExitStack
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

from optimization_soak import validate_prerequisites
from prefill_bench import digest


class PrerequisiteTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.identity = {k: c * 64 for k, c in [('binary_sha256', 'a'),
            ('source_archive_sha256', 'b'), ('metallib_sha256', 'c')]}
        self.build = {'identity': self.identity}
        self.decision = [{'candidate': 'combined', 'passed': True, 'checks': {'fixture': True}}]
        self.protocol = {'mtp': 'off', 'env': {'SLOTSTREAM_OPT_FINAL_FORWARD': '1'},
                         'prerequisites': {'native': {}, 'paired': {}}}
        for name, variant in [('combined-plain', 'integrated'), ('combined-mtp', 'integrated-mtp'),
                              ('read-failure-serving', 'read-failure-serving')]:
            entry = self.entry('native', name)
            self.write(entry, 'manifest.json', {'identity': self.identity, 'passed': True, 'exit_code': 0,
                'assertions': 1, 'command': ['/unused/slotstream', 'optimization-state-check', '--variant', variant]})
            self.write(entry, 'stdout.txt', {'passed': True, 'items': [{'passed': True}]})
        for name in ['short-one', 'unique-prose', 'sampled-short', 'mtp-resource', 'distinct-tail',
                     'complete-repeat', 'unique-with-retention', 'actual-default-one-token']:
            entry = self.entry('paired', name)
            gate = {'minimum_pairs': 5, 'replacement_rounds': 0, 'all_outputs_exact': True}
            if name in ['short-one', 'distinct-tail', 'complete-repeat']:
                gate.update(minimum_median_client_reduction=.05, minimum_positive_fraction=.8)
            else:
                gate.update(maximum_median_client_regression=.05, minimum_positive_fraction=0)
            if name in ['unique-prose', 'sampled-short', 'mtp-resource']:
                gate.update(minimum_active_savings_bytes=300_000_000, minimum_sampled_peak_savings_bytes=200_000_000)
            self.write(entry, 'manifest.json', {'protocol': {'rounds': 16,
                'acceptance': gate,
                'startup_acceptance': {'minimum_pairs': 5, 'maximum_median_first_job_regression': .05,
                    'all_outputs_exact': True}},
                'arm_builds': {arm: self.build for arm in ['reference', 'combined']}})
            self.write(entry, 'completion.json', {'interrupted': False, 'stopped_early': False,
                'planned_cells': 32, 'recorded_cells': 32, 'acceptance': self.decision,
                'startup_acceptance': self.decision})
            self.write(entry, 'results.jsonl', [{'round': i, 'arm': arm}
                for i in range(1, 17) for arm in ['reference', 'combined']])
        self.modify('paired', 'actual-default-one-token', 'manifest.json',
            lambda m: m['protocol'].update(arms={'reference': {'env': {'SLOTSTREAM_OPT_FINAL_FORWARD': '0'}},
                'combined': {'env': {}}}, max_tokens=1, minimum_output_tokens=1,
                prefix_cache={'retention_only': True, 'expected_reused_tokens': {'reference': 0, 'combined': 0}}))
        self.contract_path = self.root / 'qualification-contract.json'
        self.contract = {'format': 'slotstream-qualification-v1', 'build_identity': copy.deepcopy(self.identity),
            'native': {}, 'paired_protocols': {}, 'soak_modes': {}}
        for name, entry in self.protocol['prerequisites']['native'].items():
            manifest = json.loads((Path(entry['directory']) / 'manifest.json').read_text())
            self.contract['native'][name] = {'command': manifest['command'], 'environment': {}}
        for name, entry in self.protocol['prerequisites']['paired'].items():
            self.contract['paired_protocols'][name] = json.loads(
                (Path(entry['directory']) / 'manifest.json').read_text())['protocol']
        for mode in ['off', 'on']:
            self.contract['soak_modes'][mode] = {'mtp': mode, 'env': copy.deepcopy(self.protocol['env'])}
        self.freeze_contract()

    def test_actual_default_guard_rejects_forced_controls_even_when_frozen(self):
        self.actual_default_mutation(lambda p: p['arms']['combined']['env'].update(SLOTSTREAM_OPT_FINAL_FORWARD='1'))

    def test_actual_default_guard_rejects_disabled_retention_even_when_frozen(self):
        self.actual_default_mutation(lambda p: p.pop('prefix_cache'))

    def test_actual_default_guard_rejects_larger_reply_even_when_frozen(self):
        self.actual_default_mutation(lambda p: p.update(max_tokens=16, minimum_output_tokens=16))

    def actual_default_mutation(self, change):
        name = 'actual-default-one-token'
        self.modify('paired', name, 'manifest.json', lambda m: change(m['protocol']))
        entry = self.protocol['prerequisites']['paired'][name]
        self.contract['paired_protocols'][name] = json.loads((Path(entry['directory']) / 'manifest.json').read_text())['protocol']
        self.freeze_contract()
        with self.assertRaisesRegex(ValueError, 'actual-default guard'):
            self.validate()

    def freeze_contract(self):
        self.contract_path.write_text(json.dumps(self.contract))
        self.protocol['qualification_contract'] = {'path': str(self.contract_path),
            'sha256': digest(self.contract_path)}

    def entry(self, kind, name):
        path = self.root / name; path.mkdir()
        entry = {'directory': str(path), 'sha256': {}}
        self.protocol['prerequisites'][kind][name] = entry
        return entry

    def write(self, entry, name, data):
        path = Path(entry['directory']) / name
        path.write_text(''.join(json.dumps(row) + '\n' for row in data)
                        if name.endswith('jsonl') else json.dumps(data))
        entry['sha256'][name] = digest(path)

    def modify(self, kind, name, file, change):
        entry = self.protocol['prerequisites'][kind][name]
        path = Path(entry['directory']) / file
        data = ([json.loads(line) for line in path.read_text().splitlines()]
                if file.endswith('jsonl') else json.loads(path.read_text()))
        change(data); self.write(entry, file, data)

    def validate(self, *, recomputed=None):
        with ExitStack() as stack:
            summary = stack.enter_context(patch('optimization_soak.bench.summaries', return_value=['fixture']))
            acceptance = stack.enter_context(patch('optimization_soak.bench.acceptance_results',
                return_value=self.decision if recomputed is None else recomputed))
            startup = stack.enter_context(patch('optimization_soak.bench.startup_acceptance_results',
                return_value=self.decision))
            result = validate_prerequisites(self.protocol, self.build)
            self.assertEqual((summary.call_count, acceptance.call_count, startup.call_count), (8, 8, 8))
            return result

    def test_complete_same_build_evidence_is_recomputed_and_accepted(self):
        self.assertEqual(len(self.validate()), 12)
        self.protocol['mtp'] = 'on'
        self.assertEqual(self.validate()['qualification_contract'], self.contract)

    def test_different_soak_controls_cannot_borrow_passing_evidence(self):
        self.protocol['env']['SLOTSTREAM_OPT_FINAL_FORWARD'] = '0'
        with self.assertRaisesRegex(ValueError, 'soak workload or controls'): self.validate()

    def test_relabeling_or_changing_a_paired_workload_is_rejected(self):
        # Even a newly signed report from the same binary may not replace the
        # pre-run workload with another prompt, budget, mode or control.
        entry = self.protocol['prerequisites']['paired']['unique-prose']
        before = json.loads((Path(entry['directory']) / 'manifest.json').read_text())
        for field, value in [('fixture_sha256', 'f' * 64), ('memory_gb', 10),
                             ('mtp', 'on'), ('arms', {'combined': {'env': {}}}),
                             ('required_equal_work', [])]:
            self.modify('paired', 'unique-prose', 'manifest.json', lambda d: d['protocol'].update({field: value}))
            with self.assertRaisesRegex(ValueError, 'paired workload or controls'): self.validate()
            self.write(entry, 'manifest.json', before)

    def test_native_environment_must_match_the_same_pre_run_contract(self):
        self.modify('native', 'combined-plain', 'manifest.json',
                    lambda d: d.update(environment={'SLOTSTREAM_OPT_FINAL_FORWARD': '0'}))
        with self.assertRaisesRegex(ValueError, 'native workload or controls'): self.validate()

    def test_contract_identity_build_and_complete_workloads_are_required(self):
        self.contract_path.write_text('{}')
        with self.assertRaisesRegex(ValueError, 'contract identity'): self.validate()
        self.freeze_contract()
        original = copy.deepcopy(self.contract)
        for mutate in [lambda c: c['build_identity'].update(source_archive_sha256='e' * 64),
                       lambda c: c['paired_protocols'].pop('short-one'),
                       lambda c: c['soak_modes'].pop('on')]:
            mutate(self.contract); self.freeze_contract()
            with self.assertRaises(ValueError): self.validate()
            self.contract = copy.deepcopy(original)
        self.freeze_contract()

    def test_missing_and_duplicate_workload_evidence_refused(self):
        with self.assertRaises(ValueError): validate_prerequisites({}, self.build)
        original = copy.deepcopy(self.protocol)
        del self.protocol['prerequisites']['native']['combined-mtp']
        with self.assertRaises(ValueError): self.validate()
        self.protocol = original
        p = self.protocol['prerequisites']['paired']; p['short-one'] = p['unique-prose']
        with self.assertRaisesRegex(ValueError, 'own study'): self.validate()

    def test_changed_receipt_digest_is_rejected(self):
        entry = self.protocol['prerequisites']['native']['combined-plain']
        (Path(entry['directory']) / 'stdout.txt').write_text('{}')
        with self.assertRaisesRegex(ValueError, 'digest differs'): self.validate()

    def test_native_wrong_source_failed_assertion_and_wrong_variant_are_rejected(self):
        original = copy.deepcopy(self.protocol)
        for file, mutate in [
            ('manifest.json', lambda d: d['identity'].update(source_archive_sha256='d' * 64)),
            ('stdout.txt', lambda d: d['items'][0].update(passed=False)),
            ('manifest.json', lambda d: d.update(command=['slotstream', 'optimization-state-check', '--variant', 'integrated-mtp']))]:
            entry = self.protocol['prerequisites']['native']['combined-plain']
            data = json.loads((Path(entry['directory']) / file).read_text())
            self.modify('native', 'combined-plain', file, mutate)
            with self.assertRaises(ValueError): self.validate()
            self.write(entry, file, data)
            self.protocol = copy.deepcopy(original)

    def test_incomplete_duplicate_and_other_build_paired_runs_refused(self):
        entry = self.protocol['prerequisites']['paired']['short-one']
        for file, mutate in [
            ('completion.json', lambda d: d.update(stopped_early=True)),
            ('results.jsonl', lambda d: d.__setitem__(-1, d[0])),
            ('manifest.json', lambda d: d['arm_builds']['combined']['identity'].update(binary_sha256='e' * 64)),
            ('manifest.json', lambda d: d['protocol']['acceptance'].update(minimum_pairs=1)),
            ('manifest.json', lambda d: d['protocol']['acceptance'].update(minimum_median_client_reduction=0))]:
            path = Path(entry['directory']) / file; content = path.read_bytes(); before = entry['sha256'][file]
            self.modify('paired', 'short-one', file, mutate)
            with self.assertRaises(ValueError): self.validate()
            path.write_bytes(content); entry['sha256'][file] = before

    def test_claimed_pass_does_not_override_recomputed_failure(self):
        with self.assertRaisesRegex(ValueError, 'recomputed'):
            self.validate(recomputed=[{'candidate': 'combined', 'passed': False}])


if __name__ == '__main__': unittest.main()

````

## /tmp/slotstream-optimization-execution/paired-correctness-v229/before/optimization_soak.py

SHA-256 `59737c1d9b85222c05517690230d519fc3904a18c7989ae89131539b468667c8`; 25572 bytes.

````text
#!/usr/bin/env python3
"""Bounded repeated-request lifetime qualification; no latency improvement claims."""
import argparse
from contextlib import contextmanager
import http.client
import json
import os
from pathlib import Path
import shutil
import signal
import socket
import subprocess
import time

import serve_bench as bench
from prefill_bench import ROOT, digest, model_identity, preflight, vm_snapshot


@contextmanager
def wall_deadline(seconds):
    """Bound the complete live-server interval, including a stalled response.

    Socket timeouts alone bound each blocking read, not a stream that keeps
    delivering small frames. This standalone driver owns its main-thread timer.
    Cleanup happens outside the deadline so the owned server is always reaped.
    """
    if signal.getitimer(signal.ITIMER_REAL) != (0.0, 0.0):
        raise RuntimeError('another real-time alarm is already active')
    previous = signal.getsignal(signal.SIGALRM)
    def expired(signum, frame):
        raise TimeoutError('fixed lifetime duration exhausted')
    signal.signal(signal.SIGALRM, expired)
    try:
        signal.setitimer(signal.ITIMER_REAL, seconds)
        yield
    finally:
        signal.setitimer(signal.ITIMER_REAL, 0)
        signal.signal(signal.SIGALRM, previous)


def clean_resource_observation(row, protocol):
    metrics = row.get('metrics') or {}
    stats = metrics.get('stats') or {}
    errors = bench.resource_exclusions(stats, {
        'maximum_sampled_footprint_bytes': protocol['acceptance']['maximum_sampled_physical_peak_bytes'],
        'require_nominal_power_state': True,
        'images': row.get('has_image', False),
    })
    for before, after in [(row.get('before'), row.get('after')),
                          (stats.get('generatorVMBefore'), stats.get('generatorVMAfter'))]:
        if not isinstance(before, dict) or not isinstance(after, dict) or any(
            type(before.get(k)) is not int or type(after.get(k)) is not int or before[k] != after[k]
            for k in ['swapins', 'swapouts']):
            errors.append('missing or changed VM interval')
    return not errors, errors


def assess(protocol, rows):
    gate = protocol['acceptance']
    names = [item['name'] for item in protocol['sequence']]
    cycles = protocol['measured_cycles']
    warmup = protocol['warmup_cycles']
    expected = [(cycle, name) for cycle in range(-warmup, cycles) for name in names]
    coordinates = [(row['cycle'], row['name']) for row in rows]
    if len(coordinates) != len(set(coordinates)) or any(c not in expected for c in coordinates):
        raise ValueError('duplicate or undeclared soak request')
    checks = {'fixed_sequence_completed': coordinates == expected,
              'all_requests_succeeded': all(row.get('succeeded') is True for row in rows)}
    # Runtime failures and absolute overflows are failures even during warmup.
    peaks = [bench.sampled_request_peak((r.get('metrics') or {}).get('stats') or {}) for r in rows]
    checks['physical_ceiling'] = bool(peaks) and all(type(p) is int and 0 < p <=
        gate['maximum_sampled_physical_peak_bytes'] for p in peaks)
    details = []
    for name in names:
        selected = [r for r in rows if r['cycle'] >= 0 and r['name'] == name]
        clean = [r for r in selected if clean_resource_observation(r, protocol)[0]]
        early = [r for r in clean if r['cycle'] < cycles // 2]
        late = [r for r in clean if r['cycle'] >= cycles // 2]
        one = {'minimum_clean_observations': len(clean) >= gate['minimum_clean_observations_per_position'],
               'early_observations': len(early) >= gate['minimum_clean_early_observations_per_position'],
               'late_observations': len(late) >= gate['minimum_clean_late_observations_per_position']}
        outputs = [(r.get('metrics', {}).get('output_ids'), r.get('text')) for r in selected]
        one['exact_replay'] = bool(outputs) and bool(outputs[0][0]) and all(v == outputs[0] for v in outputs)
        growth = {}
        for field, limit in [('mlxActiveEndBytes', gate['maximum_active_growth_bytes_per_position']),
                             ('physicalFootprintEndBytes', gate['maximum_physical_end_growth_bytes_per_position'])]:
            a = [r['metrics']['stats'].get(field) for r in early]
            b = [r['metrics']['stats'].get(field) for r in late]
            valid = bool(a) and bool(b) and all(type(v) is int and v > 0 for v in a + b)
            growth[field] = max(b) - min(a) if valid else None
            one[field] = valid and growth[field] <= limit
        embedding_bytes = [(r.get('metrics') or {}).get('stats', {}).get('embeddingCachedPayloadBytes')
                           for r in selected]
        one['bounded_embedding_rows'] = bool(embedding_bytes) and all(
            type(value) is int and 0 <= value <= gate['maximum_cached_embedding_payload_bytes']
            for value in embedding_bytes)
        one['embedding_rows_enabled'] = bool(selected) and all(
            (r.get('metrics') or {}).get('stats', {}).get('embeddingRowsEnabled') is True for r in selected)
        one['bounded_prefix_capacity'] = bool(selected) and all(
            r.get('prefix', {}).get('enabled') is True
            and type(r['prefix'].get('conversations')) is int
            and 1 <= r['prefix']['conversations'] <= gate['maximum_prefix_entries']
            and type(r['prefix'].get('charged_token_capacity')) is int
            and type(r['prefix'].get('max_tokens')) is int
            and 0 <= r['prefix']['charged_token_capacity'] <= r['prefix']['max_tokens']
            for r in selected)
        details.append({'name': name, 'passed': all(one.values()), 'checks': one,
                        'clean_cycles': [r['cycle'] for r in clean], 'observed_growth_bytes': growth})
    checks['positions_pass'] = all(d['passed'] for d in details)
    return {'classification': 'Bounded repeated-request lifetime qualification; no throughput or unbounded-lifetime claim',
            'passed': all(checks.values()), 'checks': checks, 'positions': details}


def prefix_snapshot(port):
    connection = http.client.HTTPConnection('127.0.0.1', port, timeout=10)
    try:
        connection.request('POST', '/api/show', b'{}', {'Content-Type': 'application/json'})
        response = connection.getresponse()
        data = response.read(1 << 20)
        if response.status != 200 or len(data) >= 1 << 20:
            raise ValueError('bounded prefix snapshot unavailable')
        return json.loads(data)['details']['prefix_cache']
    finally:
        connection.close()


def qualification_contract(protocol, build):
    """Bind every workload and control to one reviewed pre-run matrix.

    A passing report with the right build and a different directory can still
    be the wrong workload. The separate frozen contract prevents relabeling a
    study or changing the soak's controls after its prerequisites were run.
    """
    binding = protocol.get('qualification_contract')
    if not isinstance(binding, dict) or set(binding) != {'path', 'sha256'}:
        raise ValueError('a frozen qualification contract is required')
    path = Path(binding['path'])
    if not path.is_file() or not 0 < path.stat().st_size <= 2_000_000 or digest(path) != binding['sha256']:
        raise ValueError('qualification contract identity or size differs')
    contract = json.loads(path.read_text())
    keys = {'format', 'build_identity', 'native', 'paired_protocols', 'soak_modes'}
    if not isinstance(contract, dict) or set(contract) != keys or contract['format'] != 'slotstream-qualification-v1':
        raise ValueError('invalid qualification contract format')
    identity_keys = {'binary_sha256', 'source_archive_sha256', 'metallib_sha256'}
    identity = contract['build_identity']
    if not isinstance(identity, dict) or set(identity) != identity_keys or any(
            not isinstance(identity[k], str) or len(identity[k]) != 64
            or identity[k] != build['identity'].get(k) for k in identity_keys):
        raise ValueError('qualification contract belongs to another build')
    modes = contract['soak_modes']
    declared = {k: v for k, v in protocol.items() if k not in {'qualification_contract', 'prerequisites'}}
    if (not isinstance(modes, dict) or set(modes) != {'off', 'on'}
            or declared != modes.get(protocol.get('mtp'))):
        raise ValueError('soak workload or controls differ from the frozen qualification contract')
    return contract


def validate_prerequisites(protocol, build):
    """Require the final candidate's native and paired evidence before launch.

    Digests bind the exact reports; same-binary/source/Metal identity prevents
    borrowing a passing gate from an earlier implementation. Paired decisions
    are recomputed from their frozen rows using the ordinary benchmark gates.
    """
    required_native = {'combined-plain', 'combined-mtp', 'read-failure-serving'}
    required_paired = {'short-one', 'unique-prose', 'sampled-short', 'mtp-resource',
                       'distinct-tail', 'complete-repeat', 'unique-with-retention', 'actual-default-one-token'}
    prerequisites = protocol.get('prerequisites')
    if not isinstance(prerequisites, dict) or set(prerequisites) != {'native', 'paired'}:
        raise ValueError('native and paired final-candidate prerequisites are mandatory')
    for kind, names in [('native', required_native), ('paired', required_paired)]:
        if not isinstance(prerequisites[kind], dict) or set(prerequisites[kind]) != names:
            raise ValueError(f'complete {kind} prerequisite set required')
    contract = qualification_contract(protocol, build)
    for field, names in [('native', required_native), ('paired_protocols', required_paired)]:
        if not isinstance(contract[field], dict) or set(contract[field]) != names:
            raise ValueError(f'qualification contract requires every {field} workload')

    def same_identity(identity):
        return isinstance(identity, dict) and all(identity.get(k) == build['identity'].get(k)
            and isinstance(identity.get(k), str) and len(identity[k]) == 64
            for k in ['binary_sha256', 'source_archive_sha256', 'metallib_sha256'])

    def evidence(entry, name):
        path = Path(entry['directory']) / name
        if digest(path) != entry['sha256'][name]:
            raise ValueError(f'prerequisite digest differs: {path}')
        return path

    # Preserve the exact parsed contract with the receipt, not just its path.
    observed = {'qualification_contract': contract}
    for name, entry in prerequisites['native'].items():
        manifest = json.loads(evidence(entry, 'manifest.json').read_text())
        report = json.loads(evidence(entry, 'stdout.txt').read_text())
        items = report.get('items')
        if (not same_identity(manifest.get('identity')) or manifest.get('passed') is not True
                or manifest.get('exit_code') != 0 or report.get('passed') is not True
                or report.get('skipped') is not None or not isinstance(items, list) or not items
                or any(item.get('passed') is not True for item in items)
                or manifest.get('assertions') != len(items)):
            raise ValueError(f'native prerequisite failed or belongs to another build: {name}')
        command = manifest.get('command') or []
        if contract['native'][name] != {'command': command, 'environment': manifest.get('environment', {})}:
            raise ValueError(f'native workload or controls differ from the frozen contract: {name}')
        variants = {'combined-plain': ['integrated', 'integrated-vision-query'],
                    'combined-mtp': ['integrated-mtp', 'integrated-vision-query-mtp'],
                    'read-failure-serving': ['read-failure-serving']}[name]
        if ('optimization-state-check' not in command or '--variant' not in command
                or command.index('--variant') + 1 >= len(command)
                or command[command.index('--variant') + 1] not in variants):
            raise ValueError(f'native prerequisite has the wrong diagnostic: {name}')
        observed[name] = {'passed': True, 'assertions': len(items)}

    paired_directories = [str(Path(entry['directory']).resolve()) for entry in prerequisites['paired'].values()]
    if len(set(paired_directories)) != len(required_paired):
        raise ValueError('each paired workload requires its own study')
    for name, entry in prerequisites['paired'].items():
        manifest = json.loads(evidence(entry, 'manifest.json').read_text())
        completion = json.loads(evidence(entry, 'completion.json').read_text())
        rows = [json.loads(line) for line in evidence(entry, 'results.jsonl').read_text().splitlines()]
        declared = manifest['protocol']
        if declared != contract['paired_protocols'][name]:
            raise ValueError(f'paired workload or controls differ from the frozen contract: {name}')
        if name == 'actual-default-one-token':
            selected = declared.get('arms', {}).get('combined', {})
            prefix = declared.get('prefix_cache', {})
            if (selected.get('env') != {} or declared.get('max_tokens') != 1
                    or declared.get('minimum_output_tokens') != 1
                    or prefix.get('retention_only') is not True
                    or prefix.get('expected_reused_tokens') != {'reference': 0, 'combined': 0}):
                raise ValueError('actual-default guard requires unoverridden defaults, one output token and enabled unique-prompt retention')
        arms = manifest.get('arm_builds') or {}
        if (not arms or any(not same_identity(arm.get('identity')) for arm in arms.values())
                or completion.get('interrupted') is not False or completion.get('stopped_early') is not False
                or declared.get('rounds') != 16 or len(arms) != 2 or 'reference' not in arms
                or completion.get('planned_cells') != 32 or completion.get('recorded_cells') != 32
                or len(rows) != 32 or 'error' in completion):
            raise ValueError(f'paired prerequisite incomplete or belongs to another build: {name}')
        coordinates = [(row['round'], row['arm']) for row in rows]
        if len(set(coordinates)) != 32 or set(coordinates) != {
                (i, arm) for i in range(1, 17) for arm in arms}:
            raise ValueError(f'paired prerequisite has missing or duplicate cells: {name}')
        if not declared.get('acceptance') or not declared.get('startup_acceptance'):
            raise ValueError(f'paired prerequisite lacks both frozen acceptance gates: {name}')
        gate, first = declared['acceptance'], declared['startup_acceptance']
        required_gate = {'minimum_pairs': 5, 'replacement_rounds': 0, 'all_outputs_exact': True}
        if name in {'short-one', 'distinct-tail', 'complete-repeat'}:
            required_gate.update(minimum_median_client_reduction=.05, minimum_positive_fraction=.8)
        else:
            required_gate.update(maximum_median_client_regression=.05, minimum_positive_fraction=0)
        if name in {'unique-prose', 'sampled-short', 'mtp-resource'}:
            required_gate.update(minimum_active_savings_bytes=300_000_000,
                                 minimum_sampled_peak_savings_bytes=200_000_000)
        if (gate != required_gate or first != {'minimum_pairs': 5,
                'maximum_median_first_job_regression': .05, 'all_outputs_exact': True}):
            raise ValueError(f'paired prerequisite weakens final-matrix bounds: {name}')
        summary = bench.summaries(rows, 'reference', declared.get('comparison_basis', 'fixed-pool'),
                                  declared.get('required_equal_work'))
        accepted = bench.acceptance_results(summary, declared['acceptance'])
        startup = bench.startup_acceptance_results(rows, 'reference', declared['startup_acceptance'])
        if (not accepted or not startup or any(item.get('passed') is not True for item in accepted + startup)
                or accepted != completion.get('acceptance') or startup != completion.get('startup_acceptance')):
            raise ValueError(f'paired prerequisite fails recomputed request/first-job gates: {name}')
        observed[name] = {'passed': True, 'cells': len(rows)}
    return observed


def validate_protocol(protocol):
    integer_fields = ['memory_gb', 'max_context', 'warmup_cycles', 'measured_cycles',
                      'maximum_duration_seconds_per_mode', 'maximum_prompt_tokens', 'maximum_output_tokens']
    if any(type(protocol.get(key)) is not int for key in integer_fields):
        raise ValueError('soak limits require explicit integer values')
    if (protocol.get('classification') != 'Frozen combined lifetime qualification'
            or protocol.get('memory_gb') != 10 or protocol.get('max_context') != 32768
            or protocol.get('mtp') not in ['off', 'on']
            or protocol.get('warmup_cycles') != 2 or protocol.get('measured_cycles') != 8
            or protocol.get('maximum_duration_seconds_per_mode') != 900
            or protocol.get('maximum_prompt_tokens') != 1024 or protocol.get('maximum_output_tokens') != 8):
        raise ValueError('soak requires the explicit bounded and frozen lifetime protocol')
    sequence = protocol.get('sequence')
    if not isinstance(sequence, list) or len(sequence) != 6:
        raise ValueError('soak requires the frozen six-request cycle')
    names = [item.get('name') for item in sequence]
    if any(type(n) is not str or not n.replace('-', '').isalnum() for n in names) or len(set(names)) != len(names):
        raise ValueError('request labels must be unique safe names')
    gate = protocol.get('acceptance') or {}
    limits = {'maximum_sampled_physical_peak_bytes': 10_000_000_000,
              'maximum_active_growth_bytes_per_position': 64 << 20,
              'maximum_physical_end_growth_bytes_per_position': 256 << 20,
              'maximum_cached_embedding_payload_bytes': 11_796_480,
              'maximum_prefix_entries': 4, 'minimum_clean_observations_per_position': 5,
              'minimum_clean_early_observations_per_position': 2,
              'minimum_clean_late_observations_per_position': 2, 'replacement_cycles': 0}
    if any(type(gate.get(k)) is not int or gate[k] != v for k, v in limits.items()):
        raise ValueError('lifetime bounds must match the frozen contract')
    if any(gate.get(k) is not True for k in ['all_expected_requests_complete',
        'exact_per_position_replay_after_warmup', 'prefix_charge_within_declared_capacity',
        'nominal_power_and_unchanged_request_vm_for_resource_observations']):
        raise ValueError('lifetime evidence and exactness requirements cannot be weakened')
    arm = {'reference': {'chunk': 256, 'env': protocol.get('env')}}
    bench.validate_arms(arm)
    requests = {}
    for item in sequence:
        path = Path(item['fixture'])
        if not path.is_file() or not 1 <= path.stat().st_size <= 4096 or digest(path) != item['fixture_sha256']:
            raise ValueError('soak fixture identity/size differs')
        count = item.get('outputs')
        if type(count) is not int or not 1 <= count <= 8:
            raise ValueError('bounded explicit output required')
        request = {'memory_gb': 10, 'raw': item['raw'], 'max_tokens': count, 'seed': 7}
        for key in ['think', 'sampling']:
            if key in item: request[key] = item[key]
        if 'image' in item:
            request['images'] = [{'path': item['image'], 'sha256': item['image_sha256']}]
        requests[item['name']] = bench.request_body(request, path.read_text())
    return requests


def main():
    def interrupted(signum, frame):
        raise KeyboardInterrupt(f'received signal {signum}')
    signal.signal(signal.SIGTERM, interrupted)
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    protocol = json.loads(args.protocol.read_text())
    requests = validate_protocol(protocol)
    build = bench.verified_build(protocol['binary'])
    bench.validate_declared_binary(protocol, {'reference': build})
    if 'frozen_binary_sha256' not in protocol:
        raise ValueError('a frozen binary binding is mandatory')
    prerequisites = validate_prerequisites(protocol, build)
    model = Path(protocol['model']).resolve()
    args.out.mkdir(parents=True, exist_ok=False)
    for name, request in requests.items():
        (args.out / f'request-{name}.json').write_bytes(request)
    for source in [Path(__file__), Path(bench.__file__), ROOT / 'Tools/prefill_bench.py']:
        shutil.copyfile(source, args.out / source.name)
    shutil.copyfile(Path(build['binary']).parent / 'build-source.tar.gz', args.out / 'build-source.tar.gz')
    manifest = {'protocol': protocol, 'protocol_sha256': digest(args.protocol), 'build': build,
                'model': model_identity(model), 'classification': 'One sequential bounded model process',
                'prerequisites': prerequisites, 'passed': False}
    (args.out / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    rows = []
    child = None
    try:
        if bench.competing_jobs(): raise RuntimeError('competing build/storage work; model not launched')
        manifest['before'] = preflight(13)
        with socket.socket() as reservation:
            reservation.bind(('127.0.0.1', 0)); port = reservation.getsockname()[1]
        command = [build['binary'], 'serve', '--port', str(port), '--model', str(model),
                   '--memory-gb', '10', '--max-context', '32768', '--mtp', protocol['mtp'], '--no-elastic']
        env = {k: v for k, v in os.environ.items() if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
        env.update(protocol['env'], SLOTSTREAM_BENCH_DETAILS='1', SLOTSTREAM_PREFILL_CHUNK='256')
        manifest['command'] = command
        start = time.monotonic()
        with wall_deadline(protocol['maximum_duration_seconds_per_mode']), \
                (args.out / 'server.stdout').open('wb') as stdout, \
                (args.out / 'server.stderr').open('wb') as stderr:
            child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=stdout, stderr=stderr, start_new_session=True)
            bench.wait_ready(child, port)
            for cycle in range(-protocol['warmup_cycles'], protocol['measured_cycles']):
                for item in protocol['sequence']:
                    remaining = protocol['maximum_duration_seconds_per_mode'] - (time.monotonic() - start)
                    if remaining <= 0: raise TimeoutError('fixed lifetime duration exhausted')
                    if bench.competing_jobs(): raise RuntimeError('competing build/storage work during soak')
                    row = {'cycle': cycle, 'name': item['name'], 'has_image': 'image' in item,
                           'before': vm_snapshot(), 'succeeded': False}
                    try:
                        measured, wire = bench.exchange(port, requests[item['name']], min(120, remaining),
                                                        allow_complete_prompt=True)
                        row.update(measured, after=vm_snapshot())
                        row['prefix'] = prefix_snapshot(port)
                        (args.out / f'{cycle}-{item["name"]}.ndjson').write_bytes(wire)
                        metrics = row['metrics']; stats = metrics['stats']
                        if (stats.get('runtimeError') is not None or stats['decodeTokens'] != item['outputs']
                                or not 0 < stats['promptTokens'] <= protocol['maximum_prompt_tokens']
                                or metrics['effective_mtp'] != (protocol['mtp'] == 'on')
                                or metrics['effective_prefill_chunk'] != 256):
                            raise ValueError('request output, context or effective mode differs from the protocol')
                        peak = bench.sampled_request_peak(stats)
                        if type(peak) is not int or peak > protocol['acceptance']['maximum_sampled_physical_peak_bytes']:
                            raise ValueError('absolute physical resource bound exceeded or unavailable')
                        row['resource_clean'], row['resource_exclusions'] = clean_resource_observation(row, protocol)
                        row['succeeded'] = True
                    finally:
                        rows.append(row)
                        with (args.out / 'results.jsonl').open('a') as output:
                            output.write(json.dumps(row) + '\n')
                    print(json.dumps({'cycle': cycle, 'name': item['name'], 'resource_clean': row['resource_clean']}), flush=True)
    except (Exception, KeyboardInterrupt) as error:
        manifest['error'] = f'{type(error).__name__}: {error}'
    finally:
        if child is not None: bench.stop_server(child)
        manifest['after'] = vm_snapshot()
    report = assess(protocol, rows)
    manifest['passed'] = report['passed'] and 'error' not in manifest
    (args.out / 'assessment.json').write_text(json.dumps(report, indent=2) + '\n')
    (args.out / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    print(json.dumps({'passed': manifest['passed'], 'recorded_requests': len(rows), 'error': manifest.get('error')}))
    return 0 if manifest['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())

````

## /tmp/slotstream-optimization-execution/paired-correctness-v229/before-result.json

SHA-256 `3553b670064120aef1732d1f9c26bb89a8dd467fc38628b93c6c23097576fb1d`; 411 bytes.

````text
{
  "command": [
    "python3",
    "/tmp/slotstream-optimization-execution/paired-correctness-v229/before/expanded_test.py"
  ],
  "exit_code": 1,
  "seconds": 2.184499458,
  "pythonpath": "/tmp/slotstream-optimization-execution/paired-correctness-v229/before:/Users/carlos/Projects/slotstream/Tools",
  "classification": "pure prerequisite tests with hashed warmup receipts; no model, GPU, build or server"
}

````

## /tmp/slotstream-optimization-execution/paired-correctness-v229/before-stderr.txt

SHA-256 `0d547489fc588f56c4c179505e2d22d1d198f74ff41c65f1869cf5759ac1a3b5`; 6814 bytes.

````text
......F..FF....F.FF.FFFFF
======================================================================
FAIL: test_completed_wrong_configuration_is_not_a_discardable_sample (__main__.PrerequisiteTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/paired-correctness-v229/before/expanded_test.py", line 159, in test_completed_wrong_configuration_is_not_a_discardable_sample
    self.execution_mutation(mutate)
  File "/tmp/slotstream-optimization-execution/paired-correctness-v229/before/expanded_test.py", line 90, in execution_mutation
    self.validate()
AssertionError: ValueError not raised

======================================================================
FAIL: test_every_warmup_body_requires_an_unchanged_digest (__main__.PrerequisiteTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/paired-correctness-v229/before/expanded_test.py", line 120, in test_every_warmup_body_requires_an_unchanged_digest
    self.validate()
AssertionError: ValueError not raised

======================================================================
FAIL: test_excluded_first_output_change_is_a_correctness_failure (__main__.PrerequisiteTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/paired-correctness-v229/before/expanded_test.py", line 138, in test_excluded_first_output_change_is_a_correctness_failure
    self.execution_mutation(mutate)
  File "/tmp/slotstream-optimization-execution/paired-correctness-v229/before/expanded_test.py", line 90, in execution_mutation
    self.validate()
AssertionError: ValueError not raised

======================================================================
FAIL: test_preflight_refusal_leaves_the_final_matrix_incomplete (__main__.PrerequisiteTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/paired-correctness-v229/before/expanded_test.py", line 153, in test_preflight_refusal_leaves_the_final_matrix_incomplete
    self.execution_mutation(mutate)
  File "/tmp/slotstream-optimization-execution/paired-correctness-v229/before/expanded_test.py", line 90, in execution_mutation
    self.validate()
AssertionError: ValueError not raised

======================================================================
FAIL: test_request_failure_is_not_a_discardable_timing_sample (__main__.PrerequisiteTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/paired-correctness-v229/before/expanded_test.py", line 147, in test_request_failure_is_not_a_discardable_timing_sample
    self.execution_mutation(lambda row: row.update(valid=False, error='HTTP 500 fixture'))
  File "/tmp/slotstream-optimization-execution/paired-correctness-v229/before/expanded_test.py", line 90, in execution_mutation
    self.validate()
AssertionError: ValueError not raised

======================================================================
FAIL: test_vm_excluded_absolute_peak_overflow_still_fails (__main__.PrerequisiteTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/paired-correctness-v229/before/expanded_test.py", line 144, in test_vm_excluded_absolute_peak_overflow_still_fails
    self.execution_mutation(mutate)
  File "/tmp/slotstream-optimization-execution/paired-correctness-v229/before/expanded_test.py", line 90, in execution_mutation
    self.validate()
AssertionError: ValueError not raised

======================================================================
FAIL: test_vm_excluded_measured_output_change_is_a_correctness_failure (__main__.PrerequisiteTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/paired-correctness-v229/before/expanded_test.py", line 132, in test_vm_excluded_measured_output_change_is_a_correctness_failure
    self.execution_mutation(mutate)
  File "/tmp/slotstream-optimization-execution/paired-correctness-v229/before/expanded_test.py", line 90, in execution_mutation
    self.validate()
AssertionError: ValueError not raised

======================================================================
FAIL: test_vm_excluded_warmup_peak_overflow_still_fails (__main__.PrerequisiteTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/paired-correctness-v229/before/expanded_test.py", line 107, in test_vm_excluded_warmup_peak_overflow_still_fails
    self.validate()
AssertionError: ValueError not raised

======================================================================
FAIL: test_warmup_body_must_match_the_captured_first_request (__main__.PrerequisiteTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/paired-correctness-v229/before/expanded_test.py", line 113, in test_warmup_body_must_match_the_captured_first_request
    self.validate()
AssertionError: ValueError not raised

======================================================================
FAIL: test_warmup_body_without_a_digest_is_not_accepted (__main__.PrerequisiteTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/paired-correctness-v229/before/expanded_test.py", line 126, in test_warmup_body_without_a_digest_is_not_accepted
    self.validate()
AssertionError: ValueError not raised

======================================================================
FAIL: test_wrong_or_truncated_token_metadata_is_not_discardable (__main__.PrerequisiteTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/paired-correctness-v229/before/expanded_test.py", line 162, in test_wrong_or_truncated_token_metadata_is_not_discardable
    self.execution_mutation(lambda row: row['metrics'].update(output_ids=[]))
  File "/tmp/slotstream-optimization-execution/paired-correctness-v229/before/expanded_test.py", line 90, in execution_mutation
    self.validate()
AssertionError: ValueError not raised

----------------------------------------------------------------------
Ran 25 tests in 2.101s

FAILED (failures=11)

````

## /tmp/slotstream-optimization-execution/paired-correctness-v229/before-stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/paired-correctness-v229/closure-audit.json

SHA-256 `d87de9b63af05ea4295695c71d63c091cd8a0f52cd7486a3e2acf1c7538764bf`; 395 bytes.

````text
{
  "runtime_sources": 143,
  "all_match_v215": true,
  "frozen_drivers": {
    "ngram_cache_probe.py": "01e295b269d94350730c46a59edf7a62b562c9c45f6456c2d9947862835a57e7",
    "prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb"
  },
  "all_frozen_drivers_match": true
}

````

## /tmp/slotstream-optimization-execution/paired-correctness-v229/shared-prerequisites-result.json

SHA-256 `fe52cdac89ace877dd3d27b50df76f1533a703595b810d1f58096c9d9dabb82b`; 136 bytes.

````text
{
  "command": [
    "python3",
    "Tools/optimization_prerequisites_test.py"
  ],
  "exit_code": 0,
  "seconds": 2.6350338339999997
}

````

## /tmp/slotstream-optimization-execution/paired-correctness-v229/shared-prerequisites-stderr.txt

SHA-256 `7d7777c38df23f726d5c9008201b51554f8aabe270a810dd5fc9ecba9c63a705`; 124 bytes.

````text
.........................
----------------------------------------------------------------------
Ran 25 tests in 2.560s

OK

````

## /tmp/slotstream-optimization-execution/paired-correctness-v229/shared-prerequisites-stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/paired-correctness-v229/shared-soak-result.json

SHA-256 `f71bb8fb077221a6a2d5c3144a7186d85649374aa7eabd32a19c4e8939076303`; 127 bytes.

````text
{
  "command": [
    "python3",
    "Tools/optimization_soak_test.py"
  ],
  "exit_code": 0,
  "seconds": 0.1699493750000003
}

````

## /tmp/slotstream-optimization-execution/paired-correctness-v229/shared-soak-stderr.txt

SHA-256 `47d6ad1719dcc615c8a045e73a56c7b1e582b15b434fd3c18b49aa5e059921b7`; 110 bytes.

````text
...........
----------------------------------------------------------------------
Ran 11 tests in 0.085s

OK

````

## /tmp/slotstream-optimization-execution/paired-correctness-v229/shared-soak-stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````
