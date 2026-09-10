---
type: run
id: 01m1yca6mpwnn3q0egmp96sf28
created: 2026-09-07T16:48:07.318046+00:00
updated: 2026-09-07T16:48:07.579178+00:00
summary: Preserved full-verification resource failures and context exit handling repair
binary: V304 af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d
captured_at: 2026-09-07
command: Exact-source consumer, resource verification, harness repair and guarded refusal evidence below
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Preserved full-verification resource failures and context exit handling repair
tool: python3
---
# Full verification remains failed; a real shell truncation bug is fixed

The original exact-V304 full battery runs once under protocol 20ccc35a68c51e05b3f7f4be28efd045e28e95cd318536e7581bb91d57e2064a for 624.111763 seconds. It verifies all 25 pinned weight files (105.3 GB), ngram/template/layer and MTP-head goldens, 64 planner cases, 17 sampler/governor gates, small/large-pool byte identity, live grow/shrink/regrow, prefix reuse, prefill-sweep equivalence, short memory/output and long recall. Its runtime source, binary, Metal and driver identities remain exact, owned workers drain and the model lock is free.

The original resource failures are preserved without replacement. The elastic drill retains exact squeeze output but aborts before full recovery after four global swap-ins, zero swap-outs and an 8,288,996,664-byte peak under its 13 GB ceiling. MTP runtime checks at the existing 12 GB image profile stop after four swap-ins, zero swap-outs and an 8,391,414,272-byte peak. The long 7,972-token prompt still answers SEVENTEEN but fails no-VM with 16 swap-ins and a 7,224,889,136-byte peak. The 2K context command records 44 swap-ins, zero swap-outs, a 7,546,670,680-byte peak and fits:false with an explicit exclusion. These are not qualified resource or speed measurements. Mach host VM counters are global and do not attribute activity to a particular process. The earlier independent long failure with four swap-ins remains separate.

The context command's nonzero exit exposes an additional harness defect: Tools/verify.sh uses set -e but invokes that command unguarded, so it never reports the two context checks or executes the remaining behaviour, symlink, API and vision checks or final summary. Previously existing /tmp outputs are captured with timestamps and are not credited as current successes.

V313 fixes only this shell control flow. It preserves the context exit status and stderr, requires both process success and the original JSON conditions, retains every original memory assertion and continues to the next check. The existing 16-test shell suite passes, including nine context cases covering swap exclusion, misleading success JSON with nonzero exit, invalid observations with zero exit, one-byte memory overrun, stale success replacement, empty/malformed/missing output and preflight refusal. No runtime, binary, request, capacity, no-VM criterion or frozen benchmark driver changes. The validation receipt identifies the observed tool result; it is not a model run.

V314 prepares the exact unchanged remaining source tail under the same outer guard and preserves its selected-script/source hashes. Its actual invocation is refused before child/model launch because only 12.03 GB is reclaimable against the original 21 GB requirement. No unexecuted tail gate is claimed as passed and no guard is weakened. Both this refusal and the original failed battery remain mandatory evidence. Chrome and all user apps stay open. Full acceptance, comparative studies, lifetime stability, empirical calibration, artifact delivery and activation remain unfinished.

## Evidence inventory

````json
[
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/manifest.json",
    "bytes": 11133,
    "sha256": "0cdec6c09d8cbd9edb612c561901cf1159126f9891b14b7b5469a80e3829be58"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/memory.json",
    "bytes": 534738,
    "sha256": "5ce2c345c343fdb85f1a6878410b170938b6c63b01439f0d573b44d6779456a1"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/memory.samples.jsonl",
    "bytes": 413245,
    "sha256": "3e7e57a1653565d86c167d2ae767ecccbd30f876a4b07a336f355ffe3f9baf0f"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/pressure.samples.jsonl",
    "bytes": 5287422,
    "sha256": "1360380cd12d6db820f2fec4532ce22180215c74847c3cd23c58a88a5e942d4d"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/stdout.txt",
    "bytes": 7149,
    "sha256": "0638c802b8639750a1f86ecbdcc1d62238c46880a910a89d481c1dda6409ea11"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/check-1.txt",
    "bytes": 87,
    "sha256": "47e135e10a066f5ae8612148e92bddbc9ed3b585f467dad9261307f96c311234"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/check-10.txt",
    "bytes": 71,
    "sha256": "29c9a3eb030bd06f358d49a86ee2a5f435b93ad3a3710b689ecdc9afb4af0f00"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/check-11.txt",
    "bytes": 221,
    "sha256": "8eb44ada9cd4b01d242142a3685f2d153e41253af42e62594c86e9f535aefae6"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/check-12.txt",
    "bytes": 292,
    "sha256": "4c4914bb3dcec6b643d6db1274eb322f10e2c2a19a5d02eb15779b0ad7e5bb15"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/check-2.txt",
    "bytes": 202,
    "sha256": "41d318695c0502e1ca324367f323bf4c936119ecba79f9fe78dddd3cafe25fb6"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/check-3.txt",
    "bytes": 221,
    "sha256": "04ced7c7068a388f6b95ee668ebc8f9979e8e850540063842f3db651cec30f51"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/check-4.txt",
    "bytes": 83,
    "sha256": "f004e9fdfdc5f1a7ecb88d5c2cbe6963c972bc4a07427b162e62bfa5808f68c1"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/check-5.txt",
    "bytes": 414,
    "sha256": "59e618b90df7c9e223cde55a6b3ea84b22c546fff36be22769d84b9b7fe43b5a"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/check-6.txt",
    "bytes": 1040,
    "sha256": "d7ab9fc3fb0fb97dc49a03630f77ae87dc9531aa0b5a063dcaa94f71c713bc30"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/check-7.txt",
    "bytes": 802,
    "sha256": "531d0a3c307d7bedab693c7c523f69e868e5d47ba331ce2e3b422ae5f81803ec"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/check-8.txt",
    "bytes": 283,
    "sha256": "b84d9d53abd75c38357814ce6c0d57cdb316a2e272e53ca4fa7c54b75a8ae543"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/check-9.txt",
    "bytes": 368,
    "sha256": "25987b2092bd398127a8a597a4f1a4c27fb4851376e728b8666a77b5c0119b45"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/elastic-drill.txt",
    "bytes": 1032,
    "sha256": "123cd727a0c678c29fa4f9e3b5cafd98b26b99a56394e593e50cab2876286d8a"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/model-verification/stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/model-verification/stdout.txt",
    "bytes": 928,
    "sha256": "8bb1e8b3571c298a0729fd5a034699944036ab0aea9870e2b0a24032cea1c908"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/mtp.txt",
    "bytes": 1581,
    "sha256": "32deda2682e069d0dbad779c2fda96f5bfdb7e9e985d5cc3add9ee2921b909ae"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v314/tail/manifest.json",
    "bytes": 8699,
    "sha256": "0990f66726ca5efc13f6b4e5e8d5bd321b329f279e30befa0404bae91cda9980"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v314/tail/pressure.samples.jsonl",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/before-output-capture-run.py",
    "bytes": 5406,
    "sha256": "5324e977b086264c2331e86bdf41153e84d6a16fb9be7bc36b2ee86aba051539"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-after/inventory.json",
    "bytes": 2837,
    "sha256": "a8e8626df8550f8f5d19abf40d7bd576622a7b878d39e6377bb1cb399769cdad"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-after/ssv-vision-serve.log",
    "bytes": 1637,
    "sha256": "eb961483be23d08a98e832da3947712539f86e1472dd588546422cba8e49d7b5"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-after/ssv_big.txt",
    "bytes": 116,
    "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-after/ssv_ctx.json",
    "bytes": 15271,
    "sha256": "4406c710022a6d46c4573dcbe22f4d8345496d71025b131c40c6f518d67dcde3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-after/ssv_long.txt",
    "bytes": 50993,
    "sha256": "32e15bd0df7b057f31b74f94a24c179d4374c19ddc54b77d590e330710fc8f78"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-after/ssv_longmem.err",
    "bytes": 1834,
    "sha256": "09ef2aa12e83980f5bc605539bc49dc0c853f84ce38ddc1ed1b5c0473f3d438f"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-after/ssv_longmem.json",
    "bytes": 47781,
    "sha256": "f7316907168f1ba77705fdfffa844cd241361e3967406c4d9a5e180de729be9e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-after/ssv_longmem.txt",
    "bytes": 10,
    "sha256": "2e9fad2e271de488677d33bde2dd661601317f58b374941e44c1d077da46ebe3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-after/ssv_mem.err",
    "bytes": 1506,
    "sha256": "3e273c369f5e1728c11ccc123d7da7fc5cc3970639e8061e6fe94c2c6f8ea916"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-after/ssv_mem.json",
    "bytes": 7324,
    "sha256": "e3af6d1688321e272e87c06f8c267ca61da528ec7d4b415828b99913d1840f26"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-after/ssv_mem.txt",
    "bytes": 116,
    "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-after/ssv_ngram.txt",
    "bytes": 929,
    "sha256": "7aee6c252d1fc64ffc1d396b5e8d37d3be66e22a785afade923966b9d29a35f3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-after/ssv_q.log",
    "bytes": 1433,
    "sha256": "5366a8dc19f9deeb3cc9225a8636ea4188302b47aa64c7c4d72b92d04d953a42"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-after/ssv_small.txt",
    "bytes": 116,
    "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-before/inventory.json",
    "bytes": 2848,
    "sha256": "6d8edf0167e4c32f572f0d8ccf8c4a69b41d16d085f32eeebf375efac09c4661"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-before/ssv-vision-serve.log",
    "bytes": 1637,
    "sha256": "eb961483be23d08a98e832da3947712539f86e1472dd588546422cba8e49d7b5"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-before/ssv_big.txt",
    "bytes": 116,
    "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-before/ssv_ctx.json",
    "bytes": 15256,
    "sha256": "4f34f26c7c6c0d51f47b02ef4439972ece2b4853e3b5f01c03a9e286faee96e4"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-before/ssv_long.txt",
    "bytes": 50993,
    "sha256": "32e15bd0df7b057f31b74f94a24c179d4374c19ddc54b77d590e330710fc8f78"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-before/ssv_longmem.err",
    "bytes": 1834,
    "sha256": "a85a2ba3e7ae339b12bea241d92a5da73ff825d7fd6058f6745074c77aadafed"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-before/ssv_longmem.json",
    "bytes": 47796,
    "sha256": "01c71a99f637c16f38958a9d4bc70a880227f10e723c24013a3ffbb626b16565"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-before/ssv_longmem.txt",
    "bytes": 10,
    "sha256": "2e9fad2e271de488677d33bde2dd661601317f58b374941e44c1d077da46ebe3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-before/ssv_mem.err",
    "bytes": 1506,
    "sha256": "4c4284b7a89dd0b09d06649ca9f0a6741c5f060303f064978e3fce4625d709a6"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-before/ssv_mem.json",
    "bytes": 7298,
    "sha256": "66e21b1b60d02e3d4ddf7f8d814e55a8dfca375df71927695a8261c13391f8e2"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-before/ssv_mem.txt",
    "bytes": 116,
    "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-before/ssv_ngram.txt",
    "bytes": 929,
    "sha256": "7aee6c252d1fc64ffc1d396b5e8d37d3be66e22a785afade923966b9d29a35f3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-before/ssv_q.log",
    "bytes": 1433,
    "sha256": "5366a8dc19f9deeb3cc9225a8636ea4188302b47aa64c7c4d72b92d04d953a42"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-before/ssv_small.txt",
    "bytes": 116,
    "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/output-capture-preparation.json",
    "bytes": 448,
    "sha256": "7a3fbd41f978e414ffba22b319580111ce27d5f71669934af35e6278de631d85"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/protocol.json",
    "bytes": 37237,
    "sha256": "20ccc35a68c51e05b3f7f4be28efd045e28e95cd318536e7581bb91d57e2064a"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/resource-reassessment.json",
    "bytes": 2331,
    "sha256": "0aeb3b0a546abb336eb624d0204d5b9ad348731a77999f762a81595ecd13b517"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/run.py",
    "bytes": 6604,
    "sha256": "80cfd6b6a9de17e18335e4014a4ebdeb03497c327e6f44b64f548236c5d34c09"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-context-exit-v313/after-verify.sh",
    "bytes": 15770,
    "sha256": "4eb4c0990bb7a92141f9510800457985a9ed0c40b4db601d36acfd30cd9d65e4"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-context-exit-v313/after-verify_binary_test.py",
    "bytes": 14065,
    "sha256": "b9caffe691a91a3ef8eb44aa543bc5d5c95354199f8537b5b73eeab91acbbdbd"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-context-exit-v313/before.json",
    "bytes": 508,
    "sha256": "3341e002d8b24752596a7ab74d6c74b734f8cad6cfe53d56cf387a6d9c85124d"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-context-exit-v313/validation.json",
    "bytes": 802,
    "sha256": "a11abe025ccfe23d80620404330667d16d93d7d14bb9f113f732d541312a7f78"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-context-exit-v313/verify.sh",
    "bytes": 15437,
    "sha256": "ed2485271adf39581150a38fd56b117e9c82dba7b8e1bed857f7fbeb39991065"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-context-exit-v313/verify_binary_test.py",
    "bytes": 9664,
    "sha256": "739bf1d03823ad77f0f7663af5b223474c5518148a1e51065d168a7109b50762"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-after/inventory.json",
    "bytes": 2848,
    "sha256": "ef23015919d193cb1241f60998eaa2d4329d06718e28644096d5cdd7c98a1c5e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-after/ssv-vision-serve.log",
    "bytes": 1637,
    "sha256": "eb961483be23d08a98e832da3947712539f86e1472dd588546422cba8e49d7b5"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-after/ssv_big.txt",
    "bytes": 116,
    "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-after/ssv_ctx.json",
    "bytes": 15271,
    "sha256": "4406c710022a6d46c4573dcbe22f4d8345496d71025b131c40c6f518d67dcde3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-after/ssv_long.txt",
    "bytes": 50993,
    "sha256": "32e15bd0df7b057f31b74f94a24c179d4374c19ddc54b77d590e330710fc8f78"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-after/ssv_longmem.err",
    "bytes": 1834,
    "sha256": "09ef2aa12e83980f5bc605539bc49dc0c853f84ce38ddc1ed1b5c0473f3d438f"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-after/ssv_longmem.json",
    "bytes": 47781,
    "sha256": "f7316907168f1ba77705fdfffa844cd241361e3967406c4d9a5e180de729be9e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-after/ssv_longmem.txt",
    "bytes": 10,
    "sha256": "2e9fad2e271de488677d33bde2dd661601317f58b374941e44c1d077da46ebe3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-after/ssv_mem.err",
    "bytes": 1506,
    "sha256": "3e273c369f5e1728c11ccc123d7da7fc5cc3970639e8061e6fe94c2c6f8ea916"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-after/ssv_mem.json",
    "bytes": 7324,
    "sha256": "e3af6d1688321e272e87c06f8c267ca61da528ec7d4b415828b99913d1840f26"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-after/ssv_mem.txt",
    "bytes": 116,
    "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-after/ssv_ngram.txt",
    "bytes": 929,
    "sha256": "7aee6c252d1fc64ffc1d396b5e8d37d3be66e22a785afade923966b9d29a35f3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-after/ssv_q.log",
    "bytes": 1433,
    "sha256": "5366a8dc19f9deeb3cc9225a8636ea4188302b47aa64c7c4d72b92d04d953a42"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-after/ssv_small.txt",
    "bytes": 116,
    "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-before/inventory.json",
    "bytes": 2848,
    "sha256": "ef23015919d193cb1241f60998eaa2d4329d06718e28644096d5cdd7c98a1c5e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-before/ssv-vision-serve.log",
    "bytes": 1637,
    "sha256": "eb961483be23d08a98e832da3947712539f86e1472dd588546422cba8e49d7b5"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-before/ssv_big.txt",
    "bytes": 116,
    "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-before/ssv_ctx.json",
    "bytes": 15271,
    "sha256": "4406c710022a6d46c4573dcbe22f4d8345496d71025b131c40c6f518d67dcde3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-before/ssv_long.txt",
    "bytes": 50993,
    "sha256": "32e15bd0df7b057f31b74f94a24c179d4374c19ddc54b77d590e330710fc8f78"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-before/ssv_longmem.err",
    "bytes": 1834,
    "sha256": "09ef2aa12e83980f5bc605539bc49dc0c853f84ce38ddc1ed1b5c0473f3d438f"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-before/ssv_longmem.json",
    "bytes": 47781,
    "sha256": "f7316907168f1ba77705fdfffa844cd241361e3967406c4d9a5e180de729be9e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-before/ssv_longmem.txt",
    "bytes": 10,
    "sha256": "2e9fad2e271de488677d33bde2dd661601317f58b374941e44c1d077da46ebe3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-before/ssv_mem.err",
    "bytes": 1506,
    "sha256": "3e273c369f5e1728c11ccc123d7da7fc5cc3970639e8061e6fe94c2c6f8ea916"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-before/ssv_mem.json",
    "bytes": 7324,
    "sha256": "e3af6d1688321e272e87c06f8c267ca61da528ec7d4b415828b99913d1840f26"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-before/ssv_mem.txt",
    "bytes": 116,
    "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-before/ssv_ngram.txt",
    "bytes": 929,
    "sha256": "7aee6c252d1fc64ffc1d396b5e8d37d3be66e22a785afade923966b9d29a35f3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-before/ssv_q.log",
    "bytes": 1433,
    "sha256": "5366a8dc19f9deeb3cc9225a8636ea4188302b47aa64c7c4d72b92d04d953a42"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-before/ssv_small.txt",
    "bytes": 116,
    "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/preparation.json",
    "bytes": 466,
    "sha256": "c135d6ec8f4be13a07d206eecf50c68757e24e4741e9486eb07786560891c99d"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/protocol.json",
    "bytes": 37766,
    "sha256": "cdcff65dcfb1b56c78d276d9d2ab0d8775d602e1bd9e75276c580f8a9e5c58b2"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/run.py",
    "bytes": 7125,
    "sha256": "cdd5fab9215b3fb281fcabec4b440b77ea4fd272a7ed9172d321b4edaf6186cc"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/verification-continuation-v314/verify-remaining.sh",
    "bytes": 5744,
    "sha256": "f4a37f5d5d5eb8b97c0147351e6966aeb1047f77e3e93f9ec6552b896667d79a"
  }
]
````

## /Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/manifest.json

SHA-256 `0cdec6c09d8cbd9edb612c561901cf1159126f9891b14b7b5469a80e3829be58`.

````text
{
  "passed": false,
  "protocol_sha256": "20ccc35a68c51e05b3f7f4be28efd045e28e95cd318536e7581bb91d57e2064a",
  "legacy_output_before": [
    {
      "path": "/tmp/ssv-vision-serve.log",
      "sha256": "eb961483be23d08a98e832da3947712539f86e1472dd588546422cba8e49d7b5",
      "bytes": 1637,
      "mtime_ns": 1788773455723424906,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_big.txt",
      "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1",
      "bytes": 116,
      "mtime_ns": 1788772578005292099,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_ctx.json",
      "sha256": "4f34f26c7c6c0d51f47b02ef4439972ece2b4853e3b5f01c03a9e286faee96e4",
      "bytes": 15256,
      "mtime_ns": 1788773167805967504,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_long.txt",
      "sha256": "32e15bd0df7b057f31b74f94a24c179d4374c19ddc54b77d590e330710fc8f78",
      "bytes": 50993,
      "mtime_ns": 1788773012411742363,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_longmem.err",
      "sha256": "a85a2ba3e7ae339b12bea241d92a5da73ff825d7fd6058f6745074c77aadafed",
      "bytes": 1834,
      "mtime_ns": 1788773129532012904,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_longmem.json",
      "sha256": "01c71a99f637c16f38958a9d4bc70a880227f10e723c24013a3ffbb626b16565",
      "bytes": 47796,
      "mtime_ns": 1788773129531589363,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_longmem.txt",
      "sha256": "2e9fad2e271de488677d33bde2dd661601317f58b374941e44c1d077da46ebe3",
      "bytes": 10,
      "mtime_ns": 1788773129610445054,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_mem.err",
      "sha256": "4c4284b7a89dd0b09d06649ca9f0a6741c5f060303f064978e3fce4625d709a6",
      "bytes": 1506,
      "mtime_ns": 1788773012260306566,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_mem.json",
      "sha256": "66e21b1b60d02e3d4ddf7f8d814e55a8dfca375df71927695a8261c13391f8e2",
      "bytes": 7298,
      "mtime_ns": 1788773012259719066,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_mem.txt",
      "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1",
      "bytes": 116,
      "mtime_ns": 1788773012303498913,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_ngram.txt",
      "sha256": "7aee6c252d1fc64ffc1d396b5e8d37d3be66e22a785afade923966b9d29a35f3",
      "bytes": 929,
      "mtime_ns": 1788772552201051337,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_q.log",
      "sha256": "5366a8dc19f9deeb3cc9225a8636ea4188302b47aa64c7c4d72b92d04d953a42",
      "bytes": 1433,
      "mtime_ns": 1788773176234259971,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_small.txt",
      "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1",
      "bytes": 116,
      "mtime_ns": 1788772591785999258,
      "observed_after_run_start": false
    }
  ],
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 22223601664,
    "swapins": 44119553,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     3998.\nPages active:                                1189719.\nPages inactive:                              1186653.\nPages speculative:                              1134.\nPages throttled:                                   0.\nPages wired down:                             271457.\nPages purgeable:                                5771.\n\"Translation faults\":                    16103538925.\nPages copy-on-write:                       801640505.\nPages zero filled:                       22084407326.\nPages reactivated:                        3604235520.\nPages purged:                               75793101.\nFile-backed pages:                           1346652.\nAnonymous pages:                             1030854.\nPages stored in compressor:                  1176364.\nPages occupied by compressor:                 432455.\nDecompressions:                           1211825178.\nCompressions:                             1530886691.\nPageins:                                  7878260593.\nPageouts:                                   11256324.\nSwapins:                                    44119553.\nSwapouts:                                   77538158.\nPages tagged:                                 180835.\nPages tagged resident:                        141953.\nPages tagged compressed:                       38882.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7904.\nPages tag-storage free:                          319.\nPages tag-storage non-tag pageable:            90073.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5539776.\nTagged compressions:                        11709917.\nTagged decompressions:                      10809556.\n"
  },
  "exit_code": 1,
  "summary": [],
  "skips": [],
  "failures": [
    "FAIL  ELASTIC DRILL FAIL: exit 1 (details: /Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/elastic-drill.txt)",
    "FAIL  speculative decode gates",
    "FAIL  --memory-gb 10 sampled footprint and RSS under target on the long prompt without swap (details: /Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/check-11.txt)"
  ],
  "elapsed_seconds": 624.111763,
  "legacy_output_after": [
    {
      "path": "/tmp/ssv-vision-serve.log",
      "sha256": "eb961483be23d08a98e832da3947712539f86e1472dd588546422cba8e49d7b5",
      "bytes": 1637,
      "mtime_ns": 1788773455723424906,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_big.txt",
      "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1",
      "bytes": 116,
      "mtime_ns": 1788798135087159710,
      "observed_after_run_start": true
    },
    {
      "path": "/tmp/ssv_ctx.json",
      "sha256": "4406c710022a6d46c4573dcbe22f4d8345496d71025b131c40c6f518d67dcde3",
      "bytes": 15271,
      "mtime_ns": 1788798721018224823,
      "observed_after_run_start": true
    },
    {
      "path": "/tmp/ssv_long.txt",
      "sha256": "32e15bd0df7b057f31b74f94a24c179d4374c19ddc54b77d590e330710fc8f78",
      "bytes": 50993,
      "mtime_ns": 1788798561062459645,
      "observed_after_run_start": true
    },
    {
      "path": "/tmp/ssv_longmem.err",
      "sha256": "09ef2aa12e83980f5bc605539bc49dc0c853f84ce38ddc1ed1b5c0473f3d438f",
      "bytes": 1834,
      "mtime_ns": 1788798673421914320,
      "observed_after_run_start": true
    },
    {
      "path": "/tmp/ssv_longmem.json",
      "sha256": "f7316907168f1ba77705fdfffa844cd241361e3967406c4d9a5e180de729be9e",
      "bytes": 47781,
      "mtime_ns": 1788798673421269440,
      "observed_after_run_start": true
    },
    {
      "path": "/tmp/ssv_longmem.txt",
      "sha256": "2e9fad2e271de488677d33bde2dd661601317f58b374941e44c1d077da46ebe3",
      "bytes": 10,
      "mtime_ns": 1788798673493505155,
      "observed_after_run_start": true
    },
    {
      "path": "/tmp/ssv_mem.err",
      "sha256": "3e273c369f5e1728c11ccc123d7da7fc5cc3970639e8061e6fe94c2c6f8ea916",
      "bytes": 1506,
      "mtime_ns": 1788798560947204504,
      "observed_after_run_start": true
    },
    {
      "path": "/tmp/ssv_mem.json",
      "sha256": "e3af6d1688321e272e87c06f8c267ca61da528ec7d4b415828b99913d1840f26",
      "bytes": 7324,
      "mtime_ns": 1788798560946240124,
      "observed_after_run_start": true
    },
    {
      "path": "/tmp/ssv_mem.txt",
      "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1",
      "bytes": 116,
      "mtime_ns": 1788798560987260031,
      "observed_after_run_start": true
    },
    {
      "path": "/tmp/ssv_ngram.txt",
      "sha256": "7aee6c252d1fc64ffc1d396b5e8d37d3be66e22a785afade923966b9d29a35f3",
      "bytes": 929,
      "mtime_ns": 1788798105713058757,
      "observed_after_run_start": true
    },
    {
      "path": "/tmp/ssv_q.log",
      "sha256": "5366a8dc19f9deeb3cc9225a8636ea4188302b47aa64c7c4d72b92d04d953a42",
      "bytes": 1433,
      "mtime_ns": 1788773176234259971,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_small.txt",
      "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1",
      "bytes": 116,
      "mtime_ns": 1788798149298446884,
      "observed_after_run_start": true
    }
  ],
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 27027046400,
    "swapins": 44120778,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   460502.\nPages active:                                 743556.\nPages inactive:                               664567.\nPages speculative:                             77691.\nPages throttled:                                   0.\nPages wired down:                             265697.\nPages purgeable:                                  51.\n\"Translation faults\":                    16125832423.\nPages copy-on-write:                       803233816.\nPages zero filled:                       22106804179.\nPages reactivated:                        3619483142.\nPages purged:                               76335850.\nFile-backed pages:                           1189047.\nAnonymous pages:                              296767.\nPages stored in compressor:                  2016537.\nPages occupied by compressor:                 871873.\nDecompressions:                           1218363519.\nCompressions:                             1539124261.\nPageins:                                  7936132111.\nPageouts:                                   11265730.\nSwapins:                                    44120778.\nSwapouts:                                   77538158.\nPages tagged:                                 172494.\nPages tagged resident:                        110487.\nPages tagged compressed:                       62007.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6869.\nPages tag-storage free:                         1585.\nPages tag-storage non-tag pageable:            89842.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9780416.\nTagged compressions:                        11781902.\nTagged decompressions:                      10855838.\n"
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

## /Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/stdout.txt

SHA-256 `0638c802b8639750a1f86ecbdcc1d62238c46880a910a89d481c1dda6409ea11`.

````text
== frozen build: /Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream ==
== weights provenance (hashes all 105.3 GB vs the pinned revisions; the draft head is optional) ==
PASS  pull --verify: every pinned file matches
== goldens (need bench/parity31 from Tools/parity_ref.py under mlx==0.31.1) ==
PASS  ngram row ids == python reference
PASS  chat template == transformers
PASS  layer parity (0-1 bit-exact gate)
== planner: right thing across machine setups (simulated, no model needed) ==
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
PASS  planner gates
== sampler vs numpy reference + elastic governor policy (no weights needed) ==
PASS  sampler == numpy reference: defaults (t0.8 p0.95 k40)
PASS  sampler == numpy reference: greedy (temperature 0)
PASS  sampler == numpy reference: pure sampling, no filters
PASS  sampler == numpy reference: top-k 1 (degenerate)
PASS  sampler == numpy reference: tight nucleus (top-p 0.1)
PASS  sampler == numpy reference: min-p 0.3
PASS  sampler == numpy reference: presence penalty, accumulating
PASS  sampler == numpy reference: greedy + penalty (API temp-0)
PASS  sampler == numpy reference: vocab 4096
PASS  sampler == numpy reference: real vocab (248,320)
PASS  sampler == numpy reference: top-p 0 (sanitizer)
PASS  sampler == numpy reference: min-p 5 (sanitizer)
PASS  sampler == numpy reference: seed 0 (remapped)
PASS  sampler == numpy reference: exact zero RNG draw skips removed tokens
PASS  sampler == numpy reference: high temp, large vocab
PASS  seeded sampling is reproducible and seed-sensitive
PASS  elastic governor policy (26 branches)
sampler + governor: passed 17, failed 0
PASS  sampler + governor gates
== golden equivalence: streaming must not change the math ==
PASS  8.1 GB cache output == 10 GB cache output
== elastic pool: live resizes must not change the math ==
PASS  grow/shrink/regrow byte-identical (elastic-check)
== elastic governor: shrinks, honors the cooldown, grows back ==
FAIL  ELASTIC DRILL FAIL: exit 1 (details: /Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/elastic-drill.txt)
== conversation prefix cache: bounded, flat with depth, deterministic ==
PASS  prefix reuse within the prefill-rechunk control (prefix-check)
== prefill sweep: matches the pool path, deterministic, blind to the pool ==
PASS  sweep within the prefill-rechunk control, identical cold and warm (sweep-check)
== MTP draft head: parity with the Python reference + speculative gates ==
PASS  mtp head bit-parity vs Python reference (mtp-parity)
FAIL  speculative decode gates
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 14829 tokens across 4 conversations (~0.7 GB), so a follow-up turn re-prefills only what is new
engine ready in 1.2s: expert cache ~23/512 per layer (1091 global slots = 3.0 GB), mtp draft head on, eos [248044, 248046]
Error: MTP check lost real headroom, has unavailable observations or observed swap
MTP CHECK MEMORY {"lifetime_rss_peak_bytes":4790386688,"memory_validated":false,"physical_footprint_end_bytes":5228318872,"sampled_peak_bytes":8391414272,"samples":276,"swapins_after":44120687,"swapins_before":44120683,"swapouts_after":77538158,"swapouts_before":77538158,"target_gb":12}
== memory target keeps its promise ==
PASS  --memory-gb 10 sampled footprint and RSS stay under target without swap
PASS  --memory-gb 10 output is stable
FAIL  --memory-gb 10 sampled footprint and RSS under target on the long prompt without swap (details: /Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/check-11.txt)
PASS  long-context answer still correct (sparse indexer active)

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/check-1.txt

SHA-256 `47e135e10a066f5ae8612148e92bddbc9ed3b585f467dad9261307f96c311234`.

````text
ngram row ids == python reference
diff /tmp/ssv_ngram.txt bench/parity31/ngram_ids.txt

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/check-10.txt

SHA-256 `29c9a3eb030bd06f358d49a86ee2a5f435b93ad3a3710b689ecdc9afb4af0f00`.

````text
--memory-gb 10 output is stable
diff /tmp/ssv_mem.txt /tmp/ssv_big.txt

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/check-11.txt

SHA-256 `8eb44ada9cd4b01d242142a3685f2d153e41253af42e62594c86e9f535aefae6`.

````text
--memory-gb 10 sampled footprint and RSS under target on the long prompt without swap
python3 Tools/memory_gate.py /tmp/ssv_longmem.json --limit-gb 10
{"passed": false, "error": "swap activity during generator interval"}

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/check-12.txt

SHA-256 `4c4914bb3dcec6b643d6db1274eb322f10e2c2a19a5d02eb15779b0ad7e5bb15`.

````text
long-context answer still correct (sparse indexer active)
python3 Tools/long_context_gate.py /tmp/ssv_longmem.json /tmp/ssv_longmem.txt --expected SEVENTEEN --minimum-prompt-tokens 7000 --maximum-output-tokens 16
{"passed": true, "prompt_tokens": 7972, "output_tokens": 4, "completed": true}

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/check-2.txt

SHA-256 `41d318695c0502e1ca324367f323bf4c936119ecba79f9fe78dddd3cafe25fb6`.

````text
chat template == transformers
[ "$(run_binary template-check 2>/dev/null)" = '248045,8678,198,2523,513,10631,13,248046,198,248045,846,198,12675,1017,248046,198,248045,74455,198,248068,271,248069,271' ]

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/check-3.txt

SHA-256 `04ced7c7068a388f6b95ee668ebc8f9979e8e850540063842f3db651cec30f51`.

````text
layer parity (0-1 bit-exact gate)
run_binary parity --tokens '9707,11,1246,525,498,30' --layers 2 --compare bench/parity31
layer  0: max abs 0.00000, rel 0.00000  OK
layer  1: max abs 0.00000, rel 0.00000  OK
PARITY PASS

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/check-4.txt

SHA-256 `f004e9fdfdc5f1a7ecb88d5c2cbe6963c972bc4a07427b162e62bfa5808f68c1`.

````text
8.1 GB cache output == 10 GB cache output
diff /tmp/ssv_big.txt /tmp/ssv_small.txt

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/check-5.txt

SHA-256 `59e618b90df7c9e223cde55a6b3ea84b22c546fff36be22769d84b9b7fe43b5a`.

````text
grow/shrink/regrow byte-identical (elastic-check)
run_binary elastic-check --big-slots 960
engine ready in 0.7s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
  baseline     (640 slots): 5.3s
  after grow   (960 slots): 3.7s
  after shrink (640 slots): 4.1s
  after regrow (800 slots): 4.1s
ELASTIC CHECK PASS: 4 generations byte-identical across 13→20→13→16 experts/layer

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/check-6.txt

SHA-256 `d7ab9fc3fb0fb97dc49a03630f77ae87dc9531aa0b5a063dcaa94f71c713bc30`.

````text
prefix reuse within the prefill-rechunk control (prefix-check)
run_binary prefix-check
engine ready in 0.7s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
  equivalence at 28 tokens: reuse 1.992% vs prefill-rechunk control 3.416% of logit spread, top-1 same
  equivalence at 100 tokens: reuse 4.374% vs prefill-rechunk control 4.478% of logit spread, top-1 same
  equivalence at 196 tokens: reuse 3.628% vs prefill-rechunk control 5.896% of logit spread, top-1 differs
  shed: retained 24 tokens, dropped, next turn rebuilt 49
  turn 1: 22 prompt tok, 0 reused, prefill 2.39s -> Mars
  turn 2: 49 prompt tok, 24 reused, prefill 2.82s -> No
  turn 3: 70 prompt tok, 50 reused, prefill 3.30s -> Mars has a smaller diameter and mass than Ea
PREFIX CHECK PASS: reuse moves logits 4.37% vs 5.90% for the prefill-rechunk control, flat with depth, top-1 2/3; 2 of 2 turns reused a prefix; cached and edited-history runs deterministic; follow-up prefill 7.41s -> 6.12s (0 of 3 replies differ from a cold rebuild)

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/check-7.txt

SHA-256 `531d0a3c307d7bedab693c7c523f69e868e5d47ba331ce2e3b422ae5f81803ec`.

````text
sweep within the prefill-rechunk control, identical cold and warm (sweep-check)
run_binary sweep-check
engine ready in 1.2s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
  sweep on a cold pool, run twice: identical
  sweep vs pool path: 3.320% of logit spread (prefill-rechunk control 5.089%, bound 15.268%), top-1 same
  sweep whole vs sweep in 256-token passes: 3.145% of spread
  sweep on the warm pool (638 experts copied out of it): identical to the cold sweep
  after a generate that admitted the prompt's hot experts (prefill 549 tokens): pool path identical, sweep identical
SWEEP CHECK PASS: deterministic; 3.320% of spread vs the pool path inside the 15.268% prefill-rechunk bound; identical on a cold and a warm pool; admission leaves the pool consistent

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/check-8.txt

SHA-256 `b84d9d53abd75c38357814ce6c0d57cdb316a2e272e53ca4fa7c54b75a8ae543`.

````text
mtp head bit-parity vs Python reference (mtp-parity)
run_binary mtp-parity
prefill sample: max abs 0.00000  rel 0.00000  OK
prefill multi: max abs 0.00000  rel 0.00000  OK
decode sample: max abs 0.00000  rel 0.00000  OK
decode multi: max abs 0.00000  rel 0.00000  OK
MTP PARITY PASS

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/check-9.txt

SHA-256 `25987b2092bd398127a8a597a4f1a4c27fb4851376e728b8666a77b5c0119b45`.

````text
--memory-gb 10 sampled footprint and RSS stay under target without swap
python3 Tools/memory_gate.py /tmp/ssv_mem.json --limit-gb 10
{"passed": true, "maximum_observed_bytes": 6168907016, "sampled_footprint_bytes": 6168907016, "image_preparation_peak_bytes": 0, "lifetime_rss_bytes": 3175022592, "physical_footprint_end_bytes": 6168907016, "sampling_interval_ms": 20}

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/elastic-drill.txt

SHA-256 `123cd727a0c678c29fa4f9e3b5cafd98b26b99a56394e593e50cab2876286d8a`.

````text
engine ready in 0.8s: expert cache ~36/512 per layer (1726 global slots = 4.8 GB), eos [248044, 248046]
  (machine has 25.4 GB reclaimable; drill capped at a 4.8 GB pool)
  start:  1726 slots (~36/layer) -> Nile, Amazon, Yangtze
elastic: availability dropped — cache ~36 → ~17 experts/layer (4.8 → 2.2 GB pool, cold — refills from SSD)
  squeeze: 796 slots (~17/layer) -> Nile, Amazon, Yangtze
  recovery stimulus: 8.5 GB available -> 1726 desired slots (2.6 GB growth)
  cooldown: held at 796 slots, as designed
  waiting out the 60 s grow cooldown...
ELASTIC DRILL MEMORY {"ceiling_gb":13,"complete":false,"lifetime_rss_peak_bytes":3194929152,"output_ids":[[45,448,11,7919,11,23699,83,2891],[45,448,11,7919,11,23699,83,2891]],"physical_footprint_end_bytes":7278202312,"sampled_peak_bytes":8288996664,"samples":511,"swapins_after":44119573,"swapins_before":44119569,"swapouts_after":77538158,"swapouts_before":77538158,"target_gb":12.554587904}
Error: elastic-drill memory interval is unavailable or contains swap activity

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/model-verification/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/model-verification/stdout.txt

SHA-256 `8bb1e8b3571c298a0729fd5a034699944036ab0aea9870e2b0a24032cea1c908`.

````text
verifying 25 files at /Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit against pipenetwork/Qwen3.8-Flash-Next-MLX-4bit @ aa7c790e804b
  ok    README.md
  ok    LICENSE
  ok    generation_config.json
  ok    config.json
  ok    model.safetensors.index.json
  ok    chat_template.jinja
  ok    merges.txt
  ok    preprocessor_config.json
  ok    tokenizer_config.json
  ok    qwen4_exp.py
  ok    video_preprocessor_config.json
  ok    vocab.json
  ok    tokenizer.json
  ok    mtp.safetensors
  ok    model-00011.safetensors
  ok    model-00003.safetensors
  ok    model-00002.safetensors
  ok    model-00001.safetensors
  ok    model-00004.safetensors
  ok    model-00007.safetensors
  ok    model-00005.safetensors
  ok    model-00008.safetensors
  ok    model-00010.safetensors
  ok    model-00009.safetensors
  ok    model-00006.safetensors
VERIFY PASS: all 25 files match the pinned revision by sha256 (105.3 GB)

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification/mtp.txt

SHA-256 `32deda2682e069d0dbad779c2fda96f5bfdb7e9e985d5cc3add9ee2921b909ae`.

````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (26.9 GB reclaimable now), 40.2 GB Metal working set
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
MTP CHECK MEMORY {"lifetime_rss_peak_bytes":4790386688,"memory_validated":false,"physical_footprint_end_bytes":5228318872,"sampled_peak_bytes":8391414272,"samples":276,"swapins_after":44120687,"swapins_before":44120683,"swapouts_after":77538158,"swapouts_before":77538158,"target_gb":12}

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v314/tail/manifest.json

SHA-256 `0990f66726ca5efc13f6b4e5e8d5bd321b329f279e30befa0404bae91cda9980`.

````text
{
  "passed": false,
  "protocol_sha256": "cdcff65dcfb1b56c78d276d9d2ab0d8775d602e1bd9e75276c580f8a9e5c58b2",
  "legacy_output_before": [
    {
      "path": "/tmp/ssv-vision-serve.log",
      "sha256": "eb961483be23d08a98e832da3947712539f86e1472dd588546422cba8e49d7b5",
      "bytes": 1637,
      "mtime_ns": 1788773455723424906,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_big.txt",
      "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1",
      "bytes": 116,
      "mtime_ns": 1788798135087159710,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_ctx.json",
      "sha256": "4406c710022a6d46c4573dcbe22f4d8345496d71025b131c40c6f518d67dcde3",
      "bytes": 15271,
      "mtime_ns": 1788798721018224823,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_long.txt",
      "sha256": "32e15bd0df7b057f31b74f94a24c179d4374c19ddc54b77d590e330710fc8f78",
      "bytes": 50993,
      "mtime_ns": 1788798561062459645,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_longmem.err",
      "sha256": "09ef2aa12e83980f5bc605539bc49dc0c853f84ce38ddc1ed1b5c0473f3d438f",
      "bytes": 1834,
      "mtime_ns": 1788798673421914320,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_longmem.json",
      "sha256": "f7316907168f1ba77705fdfffa844cd241361e3967406c4d9a5e180de729be9e",
      "bytes": 47781,
      "mtime_ns": 1788798673421269440,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_longmem.txt",
      "sha256": "2e9fad2e271de488677d33bde2dd661601317f58b374941e44c1d077da46ebe3",
      "bytes": 10,
      "mtime_ns": 1788798673493505155,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_mem.err",
      "sha256": "3e273c369f5e1728c11ccc123d7da7fc5cc3970639e8061e6fe94c2c6f8ea916",
      "bytes": 1506,
      "mtime_ns": 1788798560947204504,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_mem.json",
      "sha256": "e3af6d1688321e272e87c06f8c267ca61da528ec7d4b415828b99913d1840f26",
      "bytes": 7324,
      "mtime_ns": 1788798560946240124,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_mem.txt",
      "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1",
      "bytes": 116,
      "mtime_ns": 1788798560987260031,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_ngram.txt",
      "sha256": "7aee6c252d1fc64ffc1d396b5e8d37d3be66e22a785afade923966b9d29a35f3",
      "bytes": 929,
      "mtime_ns": 1788798105713058757,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_q.log",
      "sha256": "5366a8dc19f9deeb3cc9225a8636ea4188302b47aa64c7c4d72b92d04d953a42",
      "bytes": 1433,
      "mtime_ns": 1788773176234259971,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_small.txt",
      "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1",
      "bytes": 116,
      "mtime_ns": 1788798149298446884,
      "observed_after_run_start": false
    }
  ],
  "error": "InsufficientHeadroom: 12.03 GB reclaimable; need 21.00 GB",
  "elapsed_seconds": 0.00634812500000001,
  "legacy_output_after": [
    {
      "path": "/tmp/ssv-vision-serve.log",
      "sha256": "eb961483be23d08a98e832da3947712539f86e1472dd588546422cba8e49d7b5",
      "bytes": 1637,
      "mtime_ns": 1788773455723424906,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_big.txt",
      "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1",
      "bytes": 116,
      "mtime_ns": 1788798135087159710,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_ctx.json",
      "sha256": "4406c710022a6d46c4573dcbe22f4d8345496d71025b131c40c6f518d67dcde3",
      "bytes": 15271,
      "mtime_ns": 1788798721018224823,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_long.txt",
      "sha256": "32e15bd0df7b057f31b74f94a24c179d4374c19ddc54b77d590e330710fc8f78",
      "bytes": 50993,
      "mtime_ns": 1788798561062459645,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_longmem.err",
      "sha256": "09ef2aa12e83980f5bc605539bc49dc0c853f84ce38ddc1ed1b5c0473f3d438f",
      "bytes": 1834,
      "mtime_ns": 1788798673421914320,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_longmem.json",
      "sha256": "f7316907168f1ba77705fdfffa844cd241361e3967406c4d9a5e180de729be9e",
      "bytes": 47781,
      "mtime_ns": 1788798673421269440,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_longmem.txt",
      "sha256": "2e9fad2e271de488677d33bde2dd661601317f58b374941e44c1d077da46ebe3",
      "bytes": 10,
      "mtime_ns": 1788798673493505155,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_mem.err",
      "sha256": "3e273c369f5e1728c11ccc123d7da7fc5cc3970639e8061e6fe94c2c6f8ea916",
      "bytes": 1506,
      "mtime_ns": 1788798560947204504,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_mem.json",
      "sha256": "e3af6d1688321e272e87c06f8c267ca61da528ec7d4b415828b99913d1840f26",
      "bytes": 7324,
      "mtime_ns": 1788798560946240124,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_mem.txt",
      "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1",
      "bytes": 116,
      "mtime_ns": 1788798560987260031,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_ngram.txt",
      "sha256": "7aee6c252d1fc64ffc1d396b5e8d37d3be66e22a785afade923966b9d29a35f3",
      "bytes": 929,
      "mtime_ns": 1788798105713058757,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_q.log",
      "sha256": "5366a8dc19f9deeb3cc9225a8636ea4188302b47aa64c7c4d72b92d04d953a42",
      "bytes": 1433,
      "mtime_ns": 1788773176234259971,
      "observed_after_run_start": false
    },
    {
      "path": "/tmp/ssv_small.txt",
      "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1",
      "bytes": 116,
      "mtime_ns": 1788798149298446884,
      "observed_after_run_start": false
    }
  ],
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 12026331136,
    "swapins": 44121420,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    12890.\nPages active:                                1110484.\nPages inactive:                              1104893.\nPages speculative:                             12488.\nPages throttled:                                   0.\nPages wired down:                             298755.\nPages purgeable:                               18061.\n\"Translation faults\":                    16138010196.\nPages copy-on-write:                       804152126.\nPages zero filled:                       22129643114.\nPages reactivated:                        3619490384.\nPages purged:                               76351130.\nFile-backed pages:                            703078.\nAnonymous pages:                             1524787.\nPages stored in compressor:                  1390154.\nPages occupied by compressor:                 546029.\nDecompressions:                           1218954809.\nCompressions:                             1539124261.\nPageins:                                  7936250726.\nPageouts:                                   11267463.\nSwapins:                                    44121420.\nSwapouts:                                   77538158.\nPages tagged:                                 177456.\nPages tagged resident:                        132073.\nPages tagged compressed:                       45383.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6865.\nPages tag-storage free:                          219.\nPages tag-storage non-tag pageable:            91212.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6774144.\nTagged compressions:                        11781902.\nTagged decompressions:                      10872214.\n"
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

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/before-output-capture-run.py

SHA-256 `5324e977b086264c2331e86bdf41153e84d6a16fb9be7bc36b2ee86aba051539`.

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
B=ROOT/'.build/optimization/joined-state-eval-build-v304/candidate/slotstream'
OUT=ROOT/'.build/optimization/current-candidate-gates-v307/full'
# The reservation must be granted by the peer before invocation; the argument
# binds a concrete handback deadline and never authorizes extending it.
DEADLINE=datetime.datetime.fromisoformat(sys.argv[1].replace('Z','+00:00')).timestamp()
remaining=int(DEADLINE-time.time()-30)
if remaining<1800:raise RuntimeError('full gate requires at least30minutes within the granted interval')
POLICY={'startup_reclaimable_bytes':21_000_000_000,'minimum_live_reclaimable_bytes':3_000_000_000,
 'maximum_owned_rss_bytes':17_500_000_000,'sample_interval_seconds':.2,
 'maximum_build_seconds':min(3600,remaining),'stop_on_new_swapouts':False}
NATIVE_PACKET=ROOT/'.build/optimization/joined-state-eval-campaign-v305'
native=campaign.status(NATIVE_PACKET)['stages'][:3]
assert [r['stage'] for r in native]==['native/'+n for n in campaign.NATIVE] and all(r['status']=='passed' for r in native)
S={'classification':'Full existing verification workload on exact candidate; VM recorded by outer ownership guard. Every original inner memory/performance/correctness gate remains mandatory; no skipped gate can pass.',
 'frozen_at':datetime.datetime.now(datetime.timezone.utc).isoformat(),'deadline_utc':sys.argv[1],
 'build':verified_build(B),'native_prerequisites':native,'native_contract_sha256':digest(NATIVE_PACKET/'qualification-contract.json'),'wrapper_sha256':digest(Path(__file__)),'policy':POLICY,
 'environment':{'SLOTSTREAM_TEST_BINARY':str(B),'SLOTSTREAM_VERIFY_OUT':str(OUT/'verification')},
 'command':['bash',str(ROOT/'Tools/verify.sh')],
 'drivers':{str(f.relative_to(ROOT)):digest(f) for f in sorted((ROOT/'Tools').rglob('*')) if f.is_file() and f.suffix in ['.sh','.py','.mjs','.json','.swift','.txt'] and '__pycache__' not in f.parts},
 'limits':'No build, app closure, default activation or paid service. Existing verified local model only. Source/binary/Metal pinned; files saved before exit.'}
with (P/'protocol.json').open('x') as protocol:protocol.write(json.dumps(S,indent=2)+'\n')
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
   'drivers_unchanged':lambda:all(digest(ROOT/n)==h for n,h in S['drivers'].items()),
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

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-after/inventory.json

SHA-256 `a8e8626df8550f8f5d19abf40d7bd576622a7b878d39e6377bb1cb399769cdad`.

````text
[
  {
    "path": "/tmp/ssv-vision-serve.log",
    "sha256": "eb961483be23d08a98e832da3947712539f86e1472dd588546422cba8e49d7b5",
    "bytes": 1637,
    "mtime_ns": 1788773455723424906,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_big.txt",
    "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1",
    "bytes": 116,
    "mtime_ns": 1788798135087159710,
    "observed_after_run_start": true
  },
  {
    "path": "/tmp/ssv_ctx.json",
    "sha256": "4406c710022a6d46c4573dcbe22f4d8345496d71025b131c40c6f518d67dcde3",
    "bytes": 15271,
    "mtime_ns": 1788798721018224823,
    "observed_after_run_start": true
  },
  {
    "path": "/tmp/ssv_long.txt",
    "sha256": "32e15bd0df7b057f31b74f94a24c179d4374c19ddc54b77d590e330710fc8f78",
    "bytes": 50993,
    "mtime_ns": 1788798561062459645,
    "observed_after_run_start": true
  },
  {
    "path": "/tmp/ssv_longmem.err",
    "sha256": "09ef2aa12e83980f5bc605539bc49dc0c853f84ce38ddc1ed1b5c0473f3d438f",
    "bytes": 1834,
    "mtime_ns": 1788798673421914320,
    "observed_after_run_start": true
  },
  {
    "path": "/tmp/ssv_longmem.json",
    "sha256": "f7316907168f1ba77705fdfffa844cd241361e3967406c4d9a5e180de729be9e",
    "bytes": 47781,
    "mtime_ns": 1788798673421269440,
    "observed_after_run_start": true
  },
  {
    "path": "/tmp/ssv_longmem.txt",
    "sha256": "2e9fad2e271de488677d33bde2dd661601317f58b374941e44c1d077da46ebe3",
    "bytes": 10,
    "mtime_ns": 1788798673493505155,
    "observed_after_run_start": true
  },
  {
    "path": "/tmp/ssv_mem.err",
    "sha256": "3e273c369f5e1728c11ccc123d7da7fc5cc3970639e8061e6fe94c2c6f8ea916",
    "bytes": 1506,
    "mtime_ns": 1788798560947204504,
    "observed_after_run_start": true
  },
  {
    "path": "/tmp/ssv_mem.json",
    "sha256": "e3af6d1688321e272e87c06f8c267ca61da528ec7d4b415828b99913d1840f26",
    "bytes": 7324,
    "mtime_ns": 1788798560946240124,
    "observed_after_run_start": true
  },
  {
    "path": "/tmp/ssv_mem.txt",
    "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1",
    "bytes": 116,
    "mtime_ns": 1788798560987260031,
    "observed_after_run_start": true
  },
  {
    "path": "/tmp/ssv_ngram.txt",
    "sha256": "7aee6c252d1fc64ffc1d396b5e8d37d3be66e22a785afade923966b9d29a35f3",
    "bytes": 929,
    "mtime_ns": 1788798105713058757,
    "observed_after_run_start": true
  },
  {
    "path": "/tmp/ssv_q.log",
    "sha256": "5366a8dc19f9deeb3cc9225a8636ea4188302b47aa64c7c4d72b92d04d953a42",
    "bytes": 1433,
    "mtime_ns": 1788773176234259971,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_small.txt",
    "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1",
    "bytes": 116,
    "mtime_ns": 1788798149298446884,
    "observed_after_run_start": true
  }
]

````

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-after/ssv-vision-serve.log

SHA-256 `eb961483be23d08a98e832da3947712539f86e1472dd588546422cba8e49d7b5`.

````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (27.0 GB reclaimable now), 40.2 GB Metal working set
  target: 14.5 GB total for this process
  cache:  ~23 of 512 experts per layer  (1101 global slots = 3.0 GB pool)
  expect: ~13.5 GB peak, ~5 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 3072 tokens per pass (~205 tok/s here; costs ~4.0 GB of the target)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~3.5 min before its first token here, follow-up turns read only what is new
  reuse:  up to 29658 tokens across 4 conversations (~1.2 GB), so a follow-up turn re-prefills only what is new
  note:   prefill and prefix retention reservations match the explicit runtime controls
engine ready in 0.8s: expert cache ~23/512 per layer (1101 global slots = 3.0 GB), eos [248044, 248046]
slotstream listening on http://127.0.0.1:11468
try it:
  curl localhost:11468/api/chat -d '{"model": "qwen3.8-flash-next:4bit", "messages": [{"role": "user", "content": "hello"}]}'
or point any Ollama or OpenAI client at http://localhost:11468
[4:30:45 AM] prefill: reading 2602 prompt tokens, ~13 s to the first token at this plan (follow-up turns read only what is new)
[4:30:55 AM] prefill: done, 2602 tokens in 10 s (260 tok/s)

````

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-after/ssv_big.txt

SHA-256 `ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1`.

````text
The sky appears blue primarily due to a phenomenon called **Rayleigh scattering**.

### Step-by-Step Explanation:



````

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-after/ssv_ctx.json

SHA-256 `4406c710022a6d46c4573dcbe22f4d8345496d71025b131c40c6f518d67dcde3`.

````text
{"aborted":null,"compute_key_extents":[256,512,768,1024,1280,1536,1792,2048],"compute_passes":[256,256,256,256,256,256,256,256],"compute_query_rows":[256,256,256,256,256,256,256,256],"configured_context":2064,"fits":false,"memory_ledger":{"active_capacity_bytes":84934656,"additional_active_bytes":0,"expected_peak_bytes":8997561600,"fixed_bytes":5300000000,"long_context_reserve_bytes":0,"mtp_resident_bytes":0,"planning_margin_bytes":1000000000,"pool_bytes":3364761600,"prefill_bytes":332800000,"retained_capacity_bytes":0,"retained_recurrent_bytes":0,"version":1,"vision_resident_bytes":0},"model_revision":"aa7c790e804bbf9d491ddb109c3d61bc4a555f7c","optimizations":{"adaptiveSpeculation":false,"boundedDraftTail":false,"boundedIndexer":false,"boundedOutputQueue":true,"boundedPLE":false,"boundedSweepRows":false,"cachedRouterWeights":false,"compactIndexerRaw":false,"compactMTPRow":true,"compactNgramRows":false,"compactScopeFrontier":false,"compactStateWindows":true,"compiledNormFinish":false,"completePromptCheckpoint":true,"contiguousSlotWrites":false,"cpuSlotWrites":false,"deduplicateImages":false,"demandedPrefillOutput":false,"denseExpertLookup":false,"denseIndexerBypass":false,"deviceSamplerDraw":true,"directReadHandles":false,"disjointSweepOutput":false,"fusedGDNProjection":false,"fusedGDNRecording":false,"fusedRoPE":true,"incrementalIndexer":false,"indexerBlockTopK":false,"layerExpertWorkspace":false,"layerLocalFloorCache":false,"ngramLookahead":false,"ngramRingOrder":false,"overlapResidentExperts":false,"overlapSharedExpert":false,"prefixCheckpointTokens":256,"readScopeTokens":0,"resolvedRuntimeBudget":false,"responsiveGovernor":true,"reuseFirstMTPEntry":false,"routerTopK":false,"selectedTextAttention":false,"sharedRoPE":true,"skipUnusedFinalForward":true,"sparsePoolPins":false,"tailAwarePrefill":false,"terminalLastQuery":false,"terminalPrefillPruning":false,"valueOnlySamplerThreshold":true,"visionAttentionPadding":0,"visionQueryTile":0,"wordSlotWrites":false,"workspacePiecewiseWrites":false,"workspaceTokenTile":256},"output_ids":[20,12364,5020,220,23,13,271,248068,271,248069,271,27775,383,279,795,3766],"pass_timings":[{"from":0,"seconds":4.0970660419999998,"tokens":256},{"from":256,"seconds":4.4497477500000002,"tokens":256},{"from":512,"seconds":3.9545352079999994,"tokens":256},{"from":768,"seconds":4.6128779590000004,"tokens":256},{"from":1024,"seconds":4.7384612080000004,"tokens":256},{"from":1280,"seconds":3.9919003750000002,"tokens":256},{"from":1536,"seconds":3.4892883330000011,"tokens":256},{"from":1792,"seconds":5.0650984999999977,"tokens":256}],"passes":[256,256,256,256,256,256,256,256],"peak_rss_gb":3.0997053440000002,"plan_expected_peak_gb":8.9975615999999992,"prefill_chunk":256,"prefill_seconds":34.400163249999999,"prefill_tok_s":59.534601191173131,"prefill_tokens":2048,"process_peak_bound_gb":7.5466706800000001,"prompt_ids":[1905,1716,13,13190,220,15,25,279,11661,383,1500,220,15,4800,220,18,22,7896,506,220,15,25,15,15,11,321,51715,220,15,12364,5020,220,15,13,13190,220,16,25,279,11661,383,1500,220,16,4800,220,21,23,7896,506,220,16,25,15,22,11,321,51715,220,16,18,12364,5020,220,16,13,13190,220,17,25,279,11661,383,1500,220,17,4800,220,24,24,7896,506,220,17,25,16,19,11,321,51715,220,17,21,12364,5020,220,17,13,13190,220,18,25,279,11661,383,1500,220,18,4800,220,16,18,15,7896,506,220,18,25,17,16,11,321,51715,220,18,24,12364,5020,220,18,13,13190,220,19,25,279,11661,383,1500,220,19,4800,220,16,21,16,7896,506,220,19,25,17,23,11,321,51715,220,20,17,12364,5020,220,19,13,13190,220,20,25,279,11661,383,1500,220,20,4800,220,16,24,17,7896,506,220,20,25,18,20,11,321,51715,220,21,20,12364,5020,220,20,13,13190,220,21,25,279,11661,383,1500,220,21,4800,220,17,17,18,7896,506,220,21,25,19,17,11,321,51715,220,22,23,12364,5020,220,21,13,13190,220,22,25,279,11661,383,1500,220,22,4800,220,17,20,19,7896,506,220,22,25,19,24,11,321,51715,220,24,16,12364,5020,220,22,13,13190,220,23,25,279,11661,383,1500,220,23,4800,220,17,23,20,7896,506,220,23,25,20,21,11,321,51715,220,16,15,19,12364,5020,220,23,13,13190,220,24,25,279,11661,383,1500,220,24,4800,220,18,16,21,7896,506,220,24,25,15,18,11,321,51715,220,16,16,22,12364,5020,220,24,13,13190,220,16,15,25,279,11661,383,1500,220,16,15,4800,220,18,19,22,7896,506,220,16,15,25,16,15,11,321,51715,220,16,18,15,12364,5020,220,16,15,13,13190,220,16,16,25,279,11661,383,1500,220,16,16,4800,220,18,22,23,7896,506,220,16,16,25,16,22,11,321,51715,220,16,19,18,12364,5020,220,16,16,13,13190,220,16,17,25,279,11661,383,1500,220,16,17,4800,220,19,15,24,7896,506,220,16,17,25,17,19,11,321,51715,220,16,20,21,12364,5020,220,16,17,13,13190,220,16,18,25,279,11661,383,1500,220,16,18,4800,220,19,19,15,7896,506,220,16,18,25,18,16,11,321,51715,220,16,21,24,12364,5020,220,16,18,13,13190,220,16,19,25,279,11661,383,1500,220,16,19,4800,220,19,22,16,7896,506,220,16,19,25,18,23,11,321,51715,220,16,23,17,12364,5020,220,16,19,13,13190,220,16,20,25,279,11661,383,1500,220,16,20,4800,220,20,15,17,7896,506,220,16,20,25,19,20,11,321,51715,220,16,24,20,12364,5020,220,16,20,13,13190,220,16,21,25,279,11661,383,1500,220,16,21,4800,220,20,18,18,7896,506,220,16,21,25,20,17,11,321,51715,220,17,15,23,12364,5020,220,16,21,13,13190,220,16,22,25,279,11661,383,1500,220,16,22,4800,220,21,19,7896,506,220,16,22,25,20,24,11,321,51715,220,17,17,16,12364,5020,220,16,22,13,13190,220,16,23,25,279,11661,383,1500,220,16,23,4800,220,24,20,7896,506,220,16,23,25,15,21,11,321,51715,220,17,18,19,12364,5020,220,16,23,13,13190,220,16,24,25,279,11661,383,1500,220,16,24,4800,220,16,17,21,7896,506,220,16,24,25,16,18,11,321,51715,220,17,19,22,12364,5020,220,16,24,13,13190,220,17,15,25,279,11661,383,1500,220,17,15,4800,220,16,20,22,7896,506,220,17,15,25,17,15,11,321,51715,220,17,21,15,12364,5020,220,17,15,13,13190,220,17,16,25,279,11661,383,1500,220,17,16,4800,220,16,23,23,7896,506,220,17,16,25,17,22,11,321,51715,220,17,22,18,12364,5020,220,17,16,13,13190,220,17,17,25,279,11661,383,1500,220,17,17,4800,220,17,16,24,7896,506,220,17,17,25,18,19,11,321,51715,220,17,23,21,12364,5020,220,17,17,13,13190,220,17,18,25,279,11661,383,1500,220,17,18,4800,220,17,20,15,7896,506,220,17,18,25,19,16,11,321,51715,220,17,24,24,12364,5020,220,17,18,13,13190,220,17,19,25,279,11661,383,1500,220,17,19,4800,220,17,23,16,7896,506,220,15,25,19,23,11,321,51715,220,18,16,17,12364,5020,220,17,19,13,13190,220,17,20,25,279,11661,383,1500,220,17,20,4800,220,18,16,17,7896,506,220,16,25,20,20,11,321,51715,220,18,17,20,12364,5020,220,17,20,13,13190,220,17,21,25,279,11661,383,1500,220,17,21,4800,220,18,19,18,7896,506,220,17,25,15,17,11,321,51715,220,18,18,23,12364,5020,220,17,21,13,13190,220,17,22,25,279,11661,383,1500,220,17,22,4800,220,18,22,19,7896,506,220,18,25,15,24,11,321,51715,220,18,20,16,12364,5020,220,17,22,13,13190,220,17,23,25,279,11661,383,1500,220,17,23,4800,220,19,15,20,7896,506,220,19,25,16,21,11,321,51715,220,18,21,19,12364,5020,220,17,23,13,13190,220,17,24,25,279,11661,383,1500,220,17,24,4800,220,19,18,21,7896,506,220,20,25,17,18,11,321,51715,220,18,22,22,12364,5020,220,17,24,13,13190,220,18,15,25,279,11661,383,1500,220,18,15,4800,220,19,21,22,7896,506,220,21,25,18,15,11,321,51715,220,18,24,15,12364,5020,220,18,15,13,13190,220,18,16,25,279,11661,383,1500,220,18,16,4800,220,19,24,23,7896,506,220,22,25,18,22,11,321,51715,220,19,15,18,12364,5020,220,18,16,13,13190,220,18,17,25,279,11661,383,1500,220,18,17,4800,220,20,17,24,7896,506,220,23,25,19,19,11,321,51715,220,19,16,21,12364,5020,220,18,17,13,13190,220,18,18,25,279,11661,383,1500,220,18,18,4800,220,21,15,7896,506,220,24,25,20,16,11,321,51715,220,19,17,24,12364,5020,220,18,18,13,13190,220,18,19,25,279,11661,383,1500,220,18,19,4800,220,24,16,7896,506,220,16,15,25,20,23,11,321,51715,220,19,19,17,12364,5020,220,18,19,13,13190,220,18,20,25,279,11661,383,1500,220,18,20,4800,220,16,17,17,7896,506,220,16,16,25,15,20,11,321,51715,220,19,20,20,12364,5020,220,18,20,13,13190,220,18,21,25,279,11661,383,1500,220,18,21,4800,220,16,20,18,7896,506,220,16,17,25,16,17,11,321,51715,220,19,21,23,12364,5020,220,18,21,13,13190,220,18,22,25,279,11661,383,1500,220,18,22,4800,220,16,23,19,7896,506,220,16,18,25,16,24,11,321,51715,220,19,23,16,12364,5020,220,18,22,13,13190,220,18,23,25,279,11661,383,1500,220,18,23,4800,220,17,16,20,7896,506,220,16,19,25,17,21,11,321,51715,220,19,24,19,12364,5020,220,18,23,13,13190,220,18,24,25,279,11661,383,1500,220,18,24,4800,220,17,19,21,7896,506,220,16,20,25,18,18,11,321,51715,220,20,15,22,12364,5020,220,18,24,13,13190,220,19,15,25,279,11661,383,1500,220,19,15,4800,220,17,22,22,7896,506,220,16,21,25,19,15,11,321,51715,220,20,17,15,12364,5020,220,19,15,13,13190,220,19,16,25,279,11661,383,1500,220,19,16,4800,220,18,15,23,7896,506,220,16,22,25,19,22,11,321,51715,220,20,18,18,12364,5020,220,19,16,13,13190,220,19,17,25,279,11661,383,1500,220,19,17,4800,220,18,18,24,7896,506,220,16,23,25,20,19,11,321,51715,220,20,19,21,12364,5020,220,19,17,13,13190,220,19,18,25,279,11661,383,1500,220,19,18,4800,220,18,22,15,7896,506,220,16,24,25,15,16,11,321,51715,220,20,20,24,12364,5020,220,19,18,13,13190,220,19,19,25,279,11661,383,1500,220,19,19,4800,220,19,15,16,7896,506,220,17,15,25,15,23,11,321,51715,220,20,22,17,12364,5020,220,19,19,13,13190,220,19,20,25,279,11661,383,1500,220,19,20,4800,220,19,18,17,7896,506,220,17,16,25,16,20,11,321,51715,220,20,23,20,12364,5020,220,19,20,13,13190,220,19,21,25,279,11661,383,1500,220,19,21,4800,220,19,21,18,7896,506,220,17,17,25,17,17,11,321,51715,220,20,24,23,12364,5020,220,19,21,13,13190,220,19,22,25,279,11661,383,1500,220,19,22,4800,220,19,24,19,7896,506,220,17,18,25,17,24,11,321,51715,220,21,16,16,12364,5020,220,19,22,13,13190,220,19,23,25,279,11661,383,1500,220,19,23,4800,220,20,17,20,7896,506,220,15,25,18,21,11,321,51715,220,21,17,19,12364,5020,220,19,23,13,13190,220,19,24,25,279,11661,383,1500,220,19,24,4800,220,20,21,7896,506,220,16,25,19,18,11,321,51715,220,21,18,22,12364,5020,220,19,24,13,13190,220,20,15,25,279,11661,383,1500,220,20,15,4800,220,23,22,7896,506,220,17,25,20,15,11,321,51715,220,21,20,15,12364,5020,220,20,15,13,13190,220,20,16,25,279,11661,383,1500,220,20,16,4800,220,16,16,23,7896,506,220,18,25,20,22,11,321,51715,220,21,21,18,12364,5020,220,20,16,13,13190,220,20,17,25,279,11661,383,1500,220,20,17,4800,220,16,19,24,7896,506,220,19,25,15,19,11,321,51715,220,21,22,21,12364,5020,220,20,17,13,13190,220,20,18,25,279,11661,383,1500,220,20,18,4800,220,16,23,15,7896,506,220,20,25,16,16,11,321,51715,220,21,23,24,12364,5020,220,20,18,13,13190,220,20,19,25,279,11661,383,1500,220,20,19,4800,220,17,16,16,7896,506,220,21,25,16,23,11,321,51715,220,22,15,17,12364,5020,220,20,19,13,13190,220,20,20,25,279,11661,383,1500,220,20,20,4800,220,17,19,17,7896,506,220,22,25,17,20,11,321,51715,220,22,16],"reply_tokens":16,"retained_after":{"allocated_sequence_bytes":0,"charged_token_capacity":0,"checkpoint_fork_failures":0,"checkpoint_hits":0,"checkpoint_stores":0,"conversations":0,"enabled":false,"evictions":0,"held_gb":0,"held_images":0,"held_tokens":0,"hits":0,"max_conversations":4,"max_tokens":0,"misses":0,"reusable_checkpoints":0},"retained_before":{"allocated_sequence_bytes":0,"charged_token_capacity":0,"checkpoint_fork_failures":0,"checkpoint_hits":0,"checkpoint_stores":0,"conversations":0,"enabled":false,"evictions":0,"held_gb":0,"held_images":0,"held_tokens":0,"hits":0,"max_conversations":4,"max_tokens":0,"misses":0,"reusable_checkpoints":0},"stats":{"abortedReadScopes":0,"acceptedDrafts":0,"adaptiveDraftDepths":[],"adaptivePlainTokens":0,"allocatedSequenceBytes":84934656,"cachedRouterBytes":0,"completePromptHits":0,"completePromptStores":0,"contextArithmetic":"standard","decodeForwardPasses":15,"decodeIOSeconds":1.0320985169999994,"decodeLocalVictims":0,"decodeModelTokens":15,"decodeReadBytes":10625126400,"decodeRecords":3843,"decodeScatterSeconds":0.019348508000000004,"decodeSeconds":3.1622564999999998,"decodeSlotCPUBatches":0,"decodeSlotScatterBatches":703,"decodeSlotSliceBatches":0,"decodeSlotSliceRuns":0,"decodeSlotWordBatches":0,"decodeSlotWordBuffers":0,"decodeTokens":16,"draftedTokens":0,"draftSeconds":0,"embeddingCachedPayloadBytes":47520,"embeddingCachedRows":33,"embeddingRowHits":192,"embeddingRowMisses":33,"embeddingRowsEnabled":true,"encodedImages":0,"expertHitRate":0.46625,"finishReason":"length","firstTokenSeconds":34.408024625000003,"fusedGDNProjectionsScheduled":0,"fusedRoPERotationsScheduled":912,"generatorSystemAfter":{"lowPowerModeEnabled":false,"thermalState":"fair"},"generatorSystemBefore":{"lowPowerModeEnabled":false,"thermalState":"fair"},"generatorVMAfter":{"reclaimableBytes":20604223488,"swapins":44120778,"swapouts":77538158},"generatorVMBefore":{"reclaimableBytes":19574669312,"swapins":44120734,"swapouts":77538158},"imageEncodeSeconds":1.67e-07,"interTokenSeconds":[0.57137691700000004,0.21596395900000001,0.18012300000000001,0.27154774999999998,0.2226505,0.172543958,0.21142466600000001,0.247896792,0.14916708300000001,0.118593083,0.12594491699999999,0.202564666,0.146311833,0.15644216699999999,0.1685015],"lifetimeRSSPeakBytes":3099705344,"memoryPressureCancelled":false,"mlxActiveEndBytes":6144019304,"mlxCacheEndBytes":719987111,"mlxPeakMemoryGB":6.5286884599999997,"ngramCachedRows":7424,"ngramCachePayloadBytes":4751360,"ngramLookaheadDiscarded":0,"ngramLookaheadRows":0,"ngramLookaheadWaitSeconds":0,"ngramPrefetchSeconds":0.21589312600000002,"ngramRowHits":80,"ngramRowMisses":160,"packedGDNProjectionLayers":0,"packedGDNProjectionPayloadBytes":0,"peakMemoryGB":7.5466706800000001,"physicalFootprintEndBytes":7546670680,"prefillComputeKeyExtents":[256,512,768,1024,1280,1536,1792,2048],"prefillComputePasses":[256,256,256,256,256,256,256,256],"prefillComputeQueryRows":[256,256,256,256,256,256,256,256],"prefillGPUWaitSeconds":2.2461236280000034,"prefillIOSeconds":23.279393959000011,"prefillLocalVictims":0,"prefillMLXActiveBytes":6234720456,"prefillMLXCacheBytes":539796010,"prefillPasses":[256,256,256,256,256,256,256,256],"prefillPhysicalFootprintBytes":7440584232,"prefillReadBytes":231278284800,"prefillRecords":83651,"prefillRowSortSeconds":0.012948125000000001,"prefillScatterSeconds":0.6296387069999998,"prefillSeconds":34.400163249999999,"prefillSlotCPUBatches":0,"prefillSlotSliceBatches":0,"prefillSlotWordBatches":0,"prefillTokens":2048,"prefixCheckpointErrors":0,"prefixCheckpointForks":0,"prefixCheckpointRefusals":2,"prefixCheckpointStores":0,"prefixSkippedImages":0,"preparationSeconds":3.0829999999999991e-06,"promptTokens":2048,"queueSeconds":1.5e-05,"reconciledHeadTokens":0,"reconciliationSeconds":0,"requestSeconds":37.569476666,"residentExpertJoins":0,"residentExpertJoinSeconds":0,"residentExpertPrelaunches":0,"reusedHeadTokens":0,"reusedImageFeatures":0,"reusedPrefixTokens":0,"ropeTableBuilds":27,"ropeTableHits":609,"sampledFootprint":{"intervalMilliseconds":20,"peakBytes":7546670680,"samples":1880},"sampleSeconds":0.00483075,"sharedExpertPrelaunches":0,"smallPrefillSweeps":0,"terminalMoERowsSkipped":0,"terminalQueryRowsSkipped":0,"tokenCallbackSeconds":5.2519999999999999e-06,"verifyPasses":0,"verifySeconds":0,"visionQueryTile":0,"visionQueryTileCalls":0},"text":"5 filed note 8.\n\n<think>\n\n<\/think>\n\nBased on the data provided","tokens":2048,"verdict":"EXCLUDED: swap activity or missing memory observations during the request","warmup":[]}

````

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-after/ssv_long.txt

SHA-256 `32e15bd0df7b057f31b74f94a24c179d4374c19ddc54b77d590e330710fc8f78`.

````text
The archive records that the vault combination is SEVENTEEN. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. 

Question: what is the vault combination? Answer with one word.

````

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-after/ssv_longmem.err

SHA-256 `09ef2aa12e83980f5bc605539bc49dc0c853f84ce38ddc1ed1b5c0473f3d438f`.

````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (25.3 GB reclaimable now), 40.2 GB Metal working set
  target: 10.0 GB total for this process
  cache:  ~20 of 512 experts per layer  (961 global slots = 2.7 GB pool)
  expect: ~9.0 GB peak, ~4 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 13382 tokens across 4 conversations (~0.7 GB), so a follow-up turn re-prefills only what is new
engine ready in 1.1s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]
prompt tokens: 7972 (~1.6 min to the first token at this plan)
  prefill: reading 7972 prompt tokens, ~1.6 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/7972 tokens (26%), ~1.3 min left
  prefill: 4096/7972 tokens (51%), ~49 s left
  prefill: 6144/7972 tokens (77%), ~23 s left
  prefill: done, 7972 tokens in 1.7 min (79 tok/s)

-- prefill 7972 tok in 101.47s (78.6 tok/s)
-- prefill split: io 68.08s + scatter 0.01s | 300548 records (831.0 GB, 12.2 GB/s)
-- decode 4 tok in 1.54s (2.60 tok/s)
-- decode split: io 0.81s + scatter 0.01s | 1215 records
-- expert cache ~20/512 experts per layer, hit rate 0.367 | ngram rows 24h/40m | sampled footprint peak 7.225 GB | total 103.0s

````

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-after/ssv_longmem.json

SHA-256 `f7316907168f1ba77705fdfffa844cd241361e3967406c4d9a5e180de729be9e`.

````text
{"effective_expected_peak_gb":8.9994969600000001,"effective_mtp":false,"effective_pool_slots":961,"effective_prefill_chunk":256,"effective_prefill_cost_gb":0.33279999999999998,"encode_seconds":0.043512041000000001,"experimental_memory_family":false,"extra_expert_workspace_gb":0,"extra_read_scope_allowance_gb":0,"extra_router_cache_gb":0,"launch_seconds":112.30348650000001,"load_seconds":9.2465720410000003,"optimizations":{"adaptiveSpeculation":false,"boundedDraftTail":false,"boundedIndexer":false,"boundedOutputQueue":true,"boundedPLE":false,"boundedSweepRows":false,"cachedRouterWeights":false,"compactIndexerRaw":false,"compactMTPRow":true,"compactNgramRows":false,"compactScopeFrontier":false,"compactStateWindows":true,"compiledNormFinish":false,"completePromptCheckpoint":true,"contiguousSlotWrites":false,"cpuSlotWrites":false,"deduplicateImages":false,"demandedPrefillOutput":false,"denseExpertLookup":false,"denseIndexerBypass":false,"deviceSamplerDraw":true,"directReadHandles":false,"disjointSweepOutput":false,"fusedGDNProjection":false,"fusedGDNRecording":false,"fusedRoPE":true,"incrementalIndexer":false,"indexerBlockTopK":false,"layerExpertWorkspace":false,"layerLocalFloorCache":false,"ngramLookahead":false,"ngramRingOrder":false,"overlapResidentExperts":false,"overlapSharedExpert":false,"prefixCheckpointTokens":256,"readScopeTokens":0,"resolvedRuntimeBudget":false,"responsiveGovernor":true,"reuseFirstMTPEntry":false,"routerTopK":false,"selectedTextAttention":false,"sharedRoPE":true,"skipUnusedFinalForward":true,"sparsePoolPins":false,"tailAwarePrefill":false,"terminalLastQuery":false,"terminalPrefillPruning":false,"valueOnlySamplerThreshold":true,"visionAttentionPadding":0,"visionQueryTile":0,"wordSlotWrites":false,"workspacePiecewiseWrites":false,"workspaceTokenTile":256},"output_ids":[896,6571,36,923],"plan":{"availability_clamped":false,"context_qualification":false,"device_available_gb":25.300000000000001,"device_ram_gb":51.5,"device_working_set_gb":40.200000000000003,"est_prefill_s_at_max_context":385.50588235294038,"est_prefill_tok_s":85,"est_warm_tok_s":4.0041666666666664,"expected_peak_gb":9,"experts_per_layer_cached":20,"fully_resident":false,"implementation_context_limit":65536,"max_context_tokens":32768,"max_prefill_wait_minutes":30,"max_ram_percent":70,"memory_ledger":{"active_capacity_bytes":905969664,"additional_active_bytes":0,"expected_peak_bytes":8999496960,"fixed_bytes":5300000000,"long_context_reserve_bytes":0,"mtp_resident_bytes":0,"planning_margin_bytes":1000000000,"pool_bytes":2656972800,"prefill_bytes":332800000,"retained_capacity_bytes":369985536,"retained_recurrent_bytes":339738624,"version":1,"vision_resident_bytes":0},"model_context_limit":262144,"mtp":false,"mtp_context_limit":65536,"pool_gb":2.7000000000000002,"pool_slots":961,"prefill_chunk":256,"prefill_wait_scope":"accepted_request_to_first_model_token","prefix_cache_max_tokens":13382,"runtime_prefix_cache_enabled":true,"source":"--memory-gb","target_gb":10,"vision":true,"vision_charged_gb":0,"vision_context_limit":65536,"vision_resident_gb":0.90000000000000002,"vision_resident_reserved":false},"prompt_ids":[248045,846,198,760,17593,7189,421,279,33439,10286,369,4890,6571,36,923,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,4558,14162,25,1092,369,279,33439,10286,30,21134,440,799,3299,13,248046,198,248045,74455,198,248068,271,248069,271],"sampling":{"greedy":true,"requested_max_tokens":"16","seed":"default"},"schema_version":1,"stats":{"abortedReadScopes":0,"acceptedDrafts":0,"adaptiveDraftDepths":[],"adaptivePlainTokens":0,"allocatedSequenceBytes":226492416,"cachedRouterBytes":0,"completePromptHits":0,"completePromptStores":0,"contextArithmetic":"standard","decodeForwardPasses":4,"decodeIOSeconds":0.81036200700000083,"decodeLocalVictims":0,"decodeModelTokens":4,"decodeReadBytes":3359232000,"decodeRecords":1215,"decodeScatterSeconds":0.005080085000000001,"decodeSeconds":1.540870875,"decodeSlotCPUBatches":0,"decodeSlotScatterBatches":192,"decodeSlotSliceBatches":0,"decodeSlotSliceRuns":0,"decodeSlotWordBatches":0,"decodeSlotWordBuffers":0,"decodeTokens":4,"draftedTokens":0,"draftSeconds":0,"embeddingCachedPayloadBytes":84960,"embeddingCachedRows":59,"embeddingRowHits":920,"embeddingRowMisses":59,"embeddingRowsEnabled":true,"encodedImages":0,"expertHitRate":0.3671875,"finishReason":"stop","firstTextSeconds":101.47328475,"firstTokenSeconds":101.473104875,"fusedGDNProjectionsScheduled":0,"fusedRoPERotationsScheduled":1536,"generatorSystemAfter":{"lowPowerModeEnabled":false,"thermalState":"fair"},"generatorSystemBefore":{"lowPowerModeEnabled":false,"thermalState":"fair"},"generatorVMAfter":{"reclaimableBytes":21380530176,"swapins":44120707,"swapouts":77538158},"generatorVMBefore":{"reclaimableBytes":20393934848,"swapins":44120691,"swapouts":77538158},"imageEncodeSeconds":4.1000000000000003e-08,"interTokenSeconds":[0.59595808400000005,0.38868566700000001,0.34795208300000002],"lifetimeRSSPeakBytes":3126296576,"memoryPressureCancelled":false,"mlxActiveEndBytes":5722671768,"mlxCacheEndBytes":538606215,"mlxPeakMemoryGB":6.2833595559999997,"ngramCachedRows":1192,"ngramCachePayloadBytes":762880,"ngramLookaheadDiscarded":0,"ngramLookaheadRows":0,"ngramLookaheadWaitSeconds":0,"ngramPrefetchSeconds":0.032217294,"ngramRowHits":24,"ngramRowMisses":40,"packedGDNProjectionLayers":0,"packedGDNProjectionPayloadBytes":0,"peakMemoryGB":7.2093571040000004,"physicalFootprintEndBytes":7209357104,"prefillComputeKeyExtents":[256,512,768,1024,1280,1536,1792,2048,2304,2560,2816,3072,3328,3584,3840,4096,4352,4608,4864,5120,5376,5632,5888,6144,6400,6656,6912,7168,7424,7680,7936,7972],"prefillComputePasses":[256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,36],"prefillComputeQueryRows":[256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,36],"prefillGPUWaitSeconds":7.8501545680000175,"prefillIOSeconds":68.077866301999848,"prefillLocalVictims":0,"prefillMLXActiveBytes":5722074264,"prefillMLXCacheBytes":535987502,"prefillPasses":[256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,36],"prefillPhysicalFootprintBytes":7205719856,"prefillReadBytes":830955110400,"prefillRecords":300548,"prefillRowSortSeconds":0.049211010000000055,"prefillScatterSeconds":0.010002626000000002,"prefillSeconds":101.468526583,"prefillSlotCPUBatches":0,"prefillSlotSliceBatches":0,"prefillSlotWordBatches":0,"prefillTokens":7972,"prefixCheckpointErrors":0,"prefixCheckpointForks":0,"prefixCheckpointRefusals":1,"prefixCheckpointStores":1,"prefixSkippedImages":0,"preparationSeconds":0.043548583999999994,"promptTokens":7972,"queueSeconds":4.583e-06,"reconciledHeadTokens":0,"reconciliationSeconds":0,"requestSeconds":103.056491959,"residentExpertJoins":0,"residentExpertJoinSeconds":0,"residentExpertPrelaunches":0,"reusedHeadTokens":0,"reusedImageFeatures":0,"reusedPrefixTokens":0,"ropeTableBuilds":61,"ropeTableHits":1043,"sampledFootprint":{"intervalMilliseconds":20,"peakBytes":7224889136,"samples":5152},"sampleSeconds":0.0023479579999999998,"sharedExpertPrelaunches":0,"smallPrefillSweeps":0,"terminalMoERowsSkipped":0,"terminalQueryRowsSkipped":0,"tokenCallbackSeconds":0.00036849999999999996,"verifyPasses":0,"verifySeconds":0,"visionQueryTile":0,"visionQueryTileCalls":0},"text":"SEVENTEEN"}
````

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-after/ssv_longmem.txt

SHA-256 `2e9fad2e271de488677d33bde2dd661601317f58b374941e44c1d077da46ebe3`.

````text
SEVENTEEN

````

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-after/ssv_mem.err

SHA-256 `3e273c369f5e1728c11ccc123d7da7fc5cc3970639e8061e6fe94c2c6f8ea916`.

````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (25.4 GB reclaimable now), 40.2 GB Metal working set
  target: 10.0 GB total for this process
  cache:  ~20 of 512 experts per layer  (961 global slots = 2.7 GB pool)
  expect: ~9.0 GB peak, ~4 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 13382 tokens across 4 conversations (~0.7 GB), so a follow-up turn re-prefills only what is new
engine ready in 1.2s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]
prompt tokens: 18 (~0 s to the first token at this plan)

-- prefill 18 tok in 1.24s (14.6 tok/s)
-- prefill split: io 0.74s + scatter 0.00s | 3420 records (9.5 GB, 12.8 GB/s)
-- decode 24 tok in 3.67s (6.54 tok/s)
-- decode split: io 1.67s + scatter 0.02s | 6252 records
-- expert cache ~20/512 experts per layer, hit rate 0.434 | ngram rows 0h/368m | sampled footprint peak 6.169 GB | total 4.9s

````

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-after/ssv_mem.json

SHA-256 `e3af6d1688321e272e87c06f8c267ca61da528ec7d4b415828b99913d1840f26`.

````text
{"effective_expected_peak_gb":8.9994969600000001,"effective_mtp":false,"effective_pool_slots":961,"effective_prefill_chunk":256,"effective_prefill_cost_gb":0.33279999999999998,"encode_seconds":0.011641500000000001,"experimental_memory_family":false,"extra_expert_workspace_gb":0,"extra_read_scope_allowance_gb":0,"extra_router_cache_gb":0,"launch_seconds":14.142910166,"load_seconds":9.2195342910000004,"optimizations":{"adaptiveSpeculation":false,"boundedDraftTail":false,"boundedIndexer":false,"boundedOutputQueue":true,"boundedPLE":false,"boundedSweepRows":false,"cachedRouterWeights":false,"compactIndexerRaw":false,"compactMTPRow":true,"compactNgramRows":false,"compactScopeFrontier":false,"compactStateWindows":true,"compiledNormFinish":false,"completePromptCheckpoint":true,"contiguousSlotWrites":false,"cpuSlotWrites":false,"deduplicateImages":false,"demandedPrefillOutput":false,"denseExpertLookup":false,"denseIndexerBypass":false,"deviceSamplerDraw":true,"directReadHandles":false,"disjointSweepOutput":false,"fusedGDNProjection":false,"fusedGDNRecording":false,"fusedRoPE":true,"incrementalIndexer":false,"indexerBlockTopK":false,"layerExpertWorkspace":false,"layerLocalFloorCache":false,"ngramLookahead":false,"ngramRingOrder":false,"overlapResidentExperts":false,"overlapSharedExpert":false,"prefixCheckpointTokens":256,"readScopeTokens":0,"resolvedRuntimeBudget":false,"responsiveGovernor":true,"reuseFirstMTPEntry":false,"routerTopK":false,"selectedTextAttention":false,"sharedRoPE":true,"skipUnusedFinalForward":true,"sparsePoolPins":false,"tailAwarePrefill":false,"terminalLastQuery":false,"terminalPrefillPruning":false,"valueOnlySamplerThreshold":true,"visionAttentionPadding":0,"visionQueryTile":0,"wordSlotWrites":false,"workspacePiecewiseWrites":false,"workspaceTokenTile":256},"output_ids":[760,12515,7701,6105,15048,4016,310,264,24057,2512,2972,28232,60845,69377,159034,271,13962,14392,13909,12,8046,68868,25,271],"plan":{"availability_clamped":false,"context_qualification":false,"device_available_gb":25.399999999999999,"device_ram_gb":51.5,"device_working_set_gb":40.200000000000003,"est_prefill_s_at_max_context":385.50588235294038,"est_prefill_tok_s":85,"est_warm_tok_s":4.0041666666666664,"expected_peak_gb":9,"experts_per_layer_cached":20,"fully_resident":false,"implementation_context_limit":65536,"max_context_tokens":32768,"max_prefill_wait_minutes":30,"max_ram_percent":70,"memory_ledger":{"active_capacity_bytes":905969664,"additional_active_bytes":0,"expected_peak_bytes":8999496960,"fixed_bytes":5300000000,"long_context_reserve_bytes":0,"mtp_resident_bytes":0,"planning_margin_bytes":1000000000,"pool_bytes":2656972800,"prefill_bytes":332800000,"retained_capacity_bytes":369985536,"retained_recurrent_bytes":339738624,"version":1,"vision_resident_bytes":0},"model_context_limit":262144,"mtp":false,"mtp_context_limit":65536,"pool_gb":2.7000000000000002,"pool_slots":961,"prefill_chunk":256,"prefill_wait_scope":"accepted_request_to_first_model_token","prefix_cache_max_tokens":13382,"runtime_prefix_cache_enabled":true,"source":"--memory-gb","target_gb":10,"vision":true,"vision_charged_gb":0,"vision_context_limit":65536,"vision_resident_gb":0.90000000000000002,"vision_resident_reserved":false},"prompt_ids":[248045,846,198,9930,369,279,12515,6105,30,248046,198,248045,74455,198,248068,271,248069,271],"sampling":{"greedy":true,"requested_max_tokens":"24","seed":"default"},"schema_version":1,"stats":{"abortedReadScopes":0,"acceptedDrafts":0,"adaptiveDraftDepths":[],"adaptivePlainTokens":0,"allocatedSequenceBytes":28311552,"cachedRouterBytes":0,"completePromptHits":0,"completePromptStores":1,"contextArithmetic":"standard","decodeForwardPasses":23,"decodeIOSeconds":1.6734944880000004,"decodeLocalVictims":0,"decodeModelTokens":23,"decodeReadBytes":17285529600,"decodeRecords":6252,"decodeScatterSeconds":0.019828660000000019,"decodeSeconds":3.6720429999999999,"decodeSlotCPUBatches":0,"decodeSlotScatterBatches":1092,"decodeSlotSliceBatches":0,"decodeSlotSliceRuns":0,"decodeSlotWordBatches":0,"decodeSlotWordBuffers":0,"decodeTokens":24,"draftedTokens":0,"draftSeconds":0,"embeddingCachedPayloadBytes":48960,"embeddingCachedRows":34,"embeddingRowHits":3,"embeddingRowMisses":34,"embeddingRowsEnabled":true,"encodedImages":0,"expertHitRate":0.43369565217391304,"finishReason":"length","firstTextSeconds":1.2398992499999999,"firstTokenSeconds":1.2396129170000001,"fusedGDNProjectionsScheduled":0,"fusedRoPERotationsScheduled":576,"generatorSystemAfter":{"lowPowerModeEnabled":false,"thermalState":"fair"},"generatorSystemBefore":{"lowPowerModeEnabled":false,"thermalState":"fair"},"generatorVMAfter":{"reclaimableBytes":19549061120,"swapins":44120687,"swapouts":77538158},"generatorVMBefore":{"reclaimableBytes":20337000448,"swapins":44120687,"swapouts":77538158},"imageEncodeSeconds":1.67e-07,"interTokenSeconds":[0.21483745900000001,0.227587875,0.15421162499999999,0.135535292,0.160679708,0.14128754099999999,0.13770312500000001,0.121132792,0.143649625,0.14362770799999999,0.17100795899999999,0.18917100000000001,0.12255408399999999,0.13135733299999999,0.197554958,0.16560433299999999,0.127062125,0.13379687500000001,0.12006412499999999,0.21079933300000001,0.14174824999999999,0.191848458,0.18875779200000001],"lifetimeRSSPeakBytes":3175022592,"memoryPressureCancelled":false,"mlxActiveEndBytes":5522447512,"mlxCacheEndBytes":35234484,"mlxPeakMemoryGB":5.6205251140000003,"ngramCachedRows":656,"ngramCachePayloadBytes":419840,"ngramLookaheadDiscarded":0,"ngramLookaheadRows":0,"ngramLookaheadWaitSeconds":0,"ngramPrefetchSeconds":0.016073083000000002,"ngramRowHits":0,"ngramRowMisses":368,"packedGDNProjectionLayers":0,"packedGDNProjectionPayloadBytes":0,"peakMemoryGB":6.1689070160000004,"physicalFootprintEndBytes":6168907016,"prefillComputeKeyExtents":[18],"prefillComputePasses":[18],"prefillComputeQueryRows":[18],"prefillGPUWaitSeconds":0,"prefillIOSeconds":0.73648537799999991,"prefillLocalVictims":0,"prefillMLXActiveBytes":5378829464,"prefillMLXCacheBytes":35070908,"prefillPasses":[18],"prefillPhysicalFootprintBytes":6021745904,"prefillReadBytes":9455616000,"prefillRecords":3420,"prefillRowSortSeconds":0,"prefillScatterSeconds":0.003819874,"prefillSeconds":1.23556675,"prefillSlotCPUBatches":0,"prefillSlotSliceBatches":0,"prefillSlotWordBatches":0,"prefillTokens":18,"prefixCheckpointErrors":0,"prefixCheckpointForks":0,"prefixCheckpointRefusals":0,"prefixCheckpointStores":0,"prefixSkippedImages":0,"preparationSeconds":0.011671582999999999,"promptTokens":18,"queueSeconds":5.1669999999999998e-06,"reconciledHeadTokens":0,"reconciliationSeconds":0,"requestSeconds":4.9230227920000003,"residentExpertJoins":0,"residentExpertJoinSeconds":0,"residentExpertPrelaunches":0,"reusedHeadTokens":0,"reusedImageFeatures":0,"reusedPrefixTokens":0,"ropeTableBuilds":24,"ropeTableHits":264,"sampledFootprint":{"intervalMilliseconds":20,"peakBytes":6168907016,"samples":247},"sampleSeconds":0.0058787090000000002,"sharedExpertPrelaunches":0,"smallPrefillSweeps":0,"terminalMoERowsSkipped":0,"terminalQueryRowsSkipped":0,"tokenCallbackSeconds":0.0012391239999999999,"verifyPasses":0,"verifySeconds":0,"visionQueryTile":0,"visionQueryTileCalls":0},"text":"The sky appears blue primarily due to a phenomenon called **Rayleigh scattering**.\n\n### Step-by-Step Explanation:\n\n"}
````

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-after/ssv_mem.txt

SHA-256 `ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1`.

````text
The sky appears blue primarily due to a phenomenon called **Rayleigh scattering**.

### Step-by-Step Explanation:



````

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-after/ssv_ngram.txt

SHA-256 `7aee6c252d1fc64ffc1d396b5e8d37d3be66e22a785afade923966b9d29a35f3`.

````text
16410909,39682429,55103279,60931720,87006904,116506179,131512017,152932897,169641436,182022480,209277433,237891023,256841529,277007269,290665954,300984276
18158303,36390029,45652312,70783524,98191154,114024957,127804916,159566246,175132467,192583600,217919476,237199054,259336807,261799367,289359313,307699687
14018266,20311704,43480436,63941281,95787780,113074662,139009389,153597172,176521398,195310421,213995347,230817794,250415398,270032340,289909058,309324234
19328306,31622976,57795084,66463709,93919746,116410415,120151274,145148395,173389511,188877183,200309508,238866090,246672398,274484811,290423659,310127336
5058702,22280190,50893597,78955315,97296665,116744385,125916430,144813497,168457659,191037312,207392458,222765427,244080806,265398615,299171972,308041519
12491660,20431478,44408400,65983911,98770238,116367196,122763968,157962372,172188198,192734484,216716967,225308066,255605896,265905913,289339931,306513116

````

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-after/ssv_q.log

SHA-256 `5366a8dc19f9deeb3cc9225a8636ea4188302b47aa64c7c4d72b92d04d953a42`.

````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (29.6 GB reclaimable now), 40.2 GB Metal working set
  target: 10.0 GB total for this process
  cache:  ~20 of 512 experts per layer  (961 global slots = 2.7 GB pool)
  expect: ~9.0 GB peak, ~4 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 13382 tokens across 4 conversations (~0.7 GB), so a follow-up turn re-prefills only what is new
engine ready in 0.8s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]
elastic: off — an explicit size is pinned; omit the size flag for elastic auto
slotstream listening on http://127.0.0.1:11467
try it:
  curl localhost:11467/api/chat -d '{"model": "qwen3.8-flash-next:4bit", "messages": [{"role": "user", "content": "hello"}]}'
or point any Ollama or OpenAI client at http://localhost:11467

````

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-after/ssv_small.txt

SHA-256 `ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1`.

````text
The sky appears blue primarily due to a phenomenon called **Rayleigh scattering**.

### Step-by-Step Explanation:



````

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-before/inventory.json

SHA-256 `6d8edf0167e4c32f572f0d8ccf8c4a69b41d16d085f32eeebf375efac09c4661`.

````text
[
  {
    "path": "/tmp/ssv-vision-serve.log",
    "sha256": "eb961483be23d08a98e832da3947712539f86e1472dd588546422cba8e49d7b5",
    "bytes": 1637,
    "mtime_ns": 1788773455723424906,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_big.txt",
    "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1",
    "bytes": 116,
    "mtime_ns": 1788772578005292099,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_ctx.json",
    "sha256": "4f34f26c7c6c0d51f47b02ef4439972ece2b4853e3b5f01c03a9e286faee96e4",
    "bytes": 15256,
    "mtime_ns": 1788773167805967504,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_long.txt",
    "sha256": "32e15bd0df7b057f31b74f94a24c179d4374c19ddc54b77d590e330710fc8f78",
    "bytes": 50993,
    "mtime_ns": 1788773012411742363,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_longmem.err",
    "sha256": "a85a2ba3e7ae339b12bea241d92a5da73ff825d7fd6058f6745074c77aadafed",
    "bytes": 1834,
    "mtime_ns": 1788773129532012904,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_longmem.json",
    "sha256": "01c71a99f637c16f38958a9d4bc70a880227f10e723c24013a3ffbb626b16565",
    "bytes": 47796,
    "mtime_ns": 1788773129531589363,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_longmem.txt",
    "sha256": "2e9fad2e271de488677d33bde2dd661601317f58b374941e44c1d077da46ebe3",
    "bytes": 10,
    "mtime_ns": 1788773129610445054,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_mem.err",
    "sha256": "4c4284b7a89dd0b09d06649ca9f0a6741c5f060303f064978e3fce4625d709a6",
    "bytes": 1506,
    "mtime_ns": 1788773012260306566,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_mem.json",
    "sha256": "66e21b1b60d02e3d4ddf7f8d814e55a8dfca375df71927695a8261c13391f8e2",
    "bytes": 7298,
    "mtime_ns": 1788773012259719066,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_mem.txt",
    "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1",
    "bytes": 116,
    "mtime_ns": 1788773012303498913,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_ngram.txt",
    "sha256": "7aee6c252d1fc64ffc1d396b5e8d37d3be66e22a785afade923966b9d29a35f3",
    "bytes": 929,
    "mtime_ns": 1788772552201051337,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_q.log",
    "sha256": "5366a8dc19f9deeb3cc9225a8636ea4188302b47aa64c7c4d72b92d04d953a42",
    "bytes": 1433,
    "mtime_ns": 1788773176234259971,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_small.txt",
    "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1",
    "bytes": 116,
    "mtime_ns": 1788772591785999258,
    "observed_after_run_start": false
  }
]

````

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-before/ssv-vision-serve.log

SHA-256 `eb961483be23d08a98e832da3947712539f86e1472dd588546422cba8e49d7b5`.

````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (27.0 GB reclaimable now), 40.2 GB Metal working set
  target: 14.5 GB total for this process
  cache:  ~23 of 512 experts per layer  (1101 global slots = 3.0 GB pool)
  expect: ~13.5 GB peak, ~5 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 3072 tokens per pass (~205 tok/s here; costs ~4.0 GB of the target)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~3.5 min before its first token here, follow-up turns read only what is new
  reuse:  up to 29658 tokens across 4 conversations (~1.2 GB), so a follow-up turn re-prefills only what is new
  note:   prefill and prefix retention reservations match the explicit runtime controls
engine ready in 0.8s: expert cache ~23/512 per layer (1101 global slots = 3.0 GB), eos [248044, 248046]
slotstream listening on http://127.0.0.1:11468
try it:
  curl localhost:11468/api/chat -d '{"model": "qwen3.8-flash-next:4bit", "messages": [{"role": "user", "content": "hello"}]}'
or point any Ollama or OpenAI client at http://localhost:11468
[4:30:45 AM] prefill: reading 2602 prompt tokens, ~13 s to the first token at this plan (follow-up turns read only what is new)
[4:30:55 AM] prefill: done, 2602 tokens in 10 s (260 tok/s)

````

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-before/ssv_big.txt

SHA-256 `ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1`.

````text
The sky appears blue primarily due to a phenomenon called **Rayleigh scattering**.

### Step-by-Step Explanation:



````

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-before/ssv_ctx.json

SHA-256 `4f34f26c7c6c0d51f47b02ef4439972ece2b4853e3b5f01c03a9e286faee96e4`.

````text
{"aborted":null,"compute_key_extents":[256,512,768,1024,1280,1536,1792,2048],"compute_passes":[256,256,256,256,256,256,256,256],"compute_query_rows":[256,256,256,256,256,256,256,256],"configured_context":2064,"fits":true,"memory_ledger":{"active_capacity_bytes":84934656,"additional_active_bytes":0,"expected_peak_bytes":8997561600,"fixed_bytes":5300000000,"long_context_reserve_bytes":0,"mtp_resident_bytes":0,"planning_margin_bytes":1000000000,"pool_bytes":3364761600,"prefill_bytes":332800000,"retained_capacity_bytes":0,"retained_recurrent_bytes":0,"version":1,"vision_resident_bytes":0},"model_revision":"aa7c790e804bbf9d491ddb109c3d61bc4a555f7c","optimizations":{"adaptiveSpeculation":false,"boundedDraftTail":false,"boundedIndexer":false,"boundedOutputQueue":true,"boundedPLE":false,"boundedSweepRows":false,"cachedRouterWeights":false,"compactIndexerRaw":false,"compactMTPRow":true,"compactNgramRows":false,"compactScopeFrontier":false,"compactStateWindows":true,"compiledNormFinish":false,"completePromptCheckpoint":true,"contiguousSlotWrites":false,"cpuSlotWrites":false,"deduplicateImages":false,"demandedPrefillOutput":false,"denseExpertLookup":false,"denseIndexerBypass":false,"deviceSamplerDraw":true,"directReadHandles":false,"disjointSweepOutput":false,"fusedGDNProjection":false,"fusedGDNRecording":false,"fusedRoPE":true,"incrementalIndexer":false,"indexerBlockTopK":false,"layerExpertWorkspace":false,"layerLocalFloorCache":false,"ngramLookahead":false,"ngramRingOrder":false,"overlapResidentExperts":false,"overlapSharedExpert":false,"prefixCheckpointTokens":256,"readScopeTokens":0,"resolvedRuntimeBudget":false,"responsiveGovernor":true,"reuseFirstMTPEntry":false,"routerTopK":false,"selectedTextAttention":false,"sharedRoPE":true,"skipUnusedFinalForward":true,"sparsePoolPins":false,"tailAwarePrefill":false,"terminalLastQuery":false,"terminalPrefillPruning":false,"valueOnlySamplerThreshold":true,"visionAttentionPadding":0,"visionQueryTile":0,"wordSlotWrites":false,"workspacePiecewiseWrites":false,"workspaceTokenTile":256},"output_ids":[20,12364,5020,220,23,13,271,248068,271,248069,271,27775,383,279,795,3766],"pass_timings":[{"from":0,"seconds":3.2300841249999999,"tokens":256},{"from":256,"seconds":3.1122467080000003,"tokens":256},{"from":512,"seconds":3.7955722079999994,"tokens":256},{"from":768,"seconds":3.2836905840000004,"tokens":256},{"from":1024,"seconds":3.1522131249999994,"tokens":256},{"from":1280,"seconds":3.2127255410000011,"tokens":256},{"from":1536,"seconds":3.2202058339999979,"tokens":256},{"from":1792,"seconds":3.995013041,"tokens":256}],"passes":[256,256,256,256,256,256,256,256],"peak_rss_gb":3.1151063040000002,"plan_expected_peak_gb":8.9975615999999992,"prefill_chunk":256,"prefill_seconds":27.001832958000001,"prefill_tok_s":75.846702821455168,"prefill_tokens":2048,"process_peak_bound_gb":7.4927999920000001,"prompt_ids":[1905,1716,13,13190,220,15,25,279,11661,383,1500,220,15,4800,220,18,22,7896,506,220,15,25,15,15,11,321,51715,220,15,12364,5020,220,15,13,13190,220,16,25,279,11661,383,1500,220,16,4800,220,21,23,7896,506,220,16,25,15,22,11,321,51715,220,16,18,12364,5020,220,16,13,13190,220,17,25,279,11661,383,1500,220,17,4800,220,24,24,7896,506,220,17,25,16,19,11,321,51715,220,17,21,12364,5020,220,17,13,13190,220,18,25,279,11661,383,1500,220,18,4800,220,16,18,15,7896,506,220,18,25,17,16,11,321,51715,220,18,24,12364,5020,220,18,13,13190,220,19,25,279,11661,383,1500,220,19,4800,220,16,21,16,7896,506,220,19,25,17,23,11,321,51715,220,20,17,12364,5020,220,19,13,13190,220,20,25,279,11661,383,1500,220,20,4800,220,16,24,17,7896,506,220,20,25,18,20,11,321,51715,220,21,20,12364,5020,220,20,13,13190,220,21,25,279,11661,383,1500,220,21,4800,220,17,17,18,7896,506,220,21,25,19,17,11,321,51715,220,22,23,12364,5020,220,21,13,13190,220,22,25,279,11661,383,1500,220,22,4800,220,17,20,19,7896,506,220,22,25,19,24,11,321,51715,220,24,16,12364,5020,220,22,13,13190,220,23,25,279,11661,383,1500,220,23,4800,220,17,23,20,7896,506,220,23,25,20,21,11,321,51715,220,16,15,19,12364,5020,220,23,13,13190,220,24,25,279,11661,383,1500,220,24,4800,220,18,16,21,7896,506,220,24,25,15,18,11,321,51715,220,16,16,22,12364,5020,220,24,13,13190,220,16,15,25,279,11661,383,1500,220,16,15,4800,220,18,19,22,7896,506,220,16,15,25,16,15,11,321,51715,220,16,18,15,12364,5020,220,16,15,13,13190,220,16,16,25,279,11661,383,1500,220,16,16,4800,220,18,22,23,7896,506,220,16,16,25,16,22,11,321,51715,220,16,19,18,12364,5020,220,16,16,13,13190,220,16,17,25,279,11661,383,1500,220,16,17,4800,220,19,15,24,7896,506,220,16,17,25,17,19,11,321,51715,220,16,20,21,12364,5020,220,16,17,13,13190,220,16,18,25,279,11661,383,1500,220,16,18,4800,220,19,19,15,7896,506,220,16,18,25,18,16,11,321,51715,220,16,21,24,12364,5020,220,16,18,13,13190,220,16,19,25,279,11661,383,1500,220,16,19,4800,220,19,22,16,7896,506,220,16,19,25,18,23,11,321,51715,220,16,23,17,12364,5020,220,16,19,13,13190,220,16,20,25,279,11661,383,1500,220,16,20,4800,220,20,15,17,7896,506,220,16,20,25,19,20,11,321,51715,220,16,24,20,12364,5020,220,16,20,13,13190,220,16,21,25,279,11661,383,1500,220,16,21,4800,220,20,18,18,7896,506,220,16,21,25,20,17,11,321,51715,220,17,15,23,12364,5020,220,16,21,13,13190,220,16,22,25,279,11661,383,1500,220,16,22,4800,220,21,19,7896,506,220,16,22,25,20,24,11,321,51715,220,17,17,16,12364,5020,220,16,22,13,13190,220,16,23,25,279,11661,383,1500,220,16,23,4800,220,24,20,7896,506,220,16,23,25,15,21,11,321,51715,220,17,18,19,12364,5020,220,16,23,13,13190,220,16,24,25,279,11661,383,1500,220,16,24,4800,220,16,17,21,7896,506,220,16,24,25,16,18,11,321,51715,220,17,19,22,12364,5020,220,16,24,13,13190,220,17,15,25,279,11661,383,1500,220,17,15,4800,220,16,20,22,7896,506,220,17,15,25,17,15,11,321,51715,220,17,21,15,12364,5020,220,17,15,13,13190,220,17,16,25,279,11661,383,1500,220,17,16,4800,220,16,23,23,7896,506,220,17,16,25,17,22,11,321,51715,220,17,22,18,12364,5020,220,17,16,13,13190,220,17,17,25,279,11661,383,1500,220,17,17,4800,220,17,16,24,7896,506,220,17,17,25,18,19,11,321,51715,220,17,23,21,12364,5020,220,17,17,13,13190,220,17,18,25,279,11661,383,1500,220,17,18,4800,220,17,20,15,7896,506,220,17,18,25,19,16,11,321,51715,220,17,24,24,12364,5020,220,17,18,13,13190,220,17,19,25,279,11661,383,1500,220,17,19,4800,220,17,23,16,7896,506,220,15,25,19,23,11,321,51715,220,18,16,17,12364,5020,220,17,19,13,13190,220,17,20,25,279,11661,383,1500,220,17,20,4800,220,18,16,17,7896,506,220,16,25,20,20,11,321,51715,220,18,17,20,12364,5020,220,17,20,13,13190,220,17,21,25,279,11661,383,1500,220,17,21,4800,220,18,19,18,7896,506,220,17,25,15,17,11,321,51715,220,18,18,23,12364,5020,220,17,21,13,13190,220,17,22,25,279,11661,383,1500,220,17,22,4800,220,18,22,19,7896,506,220,18,25,15,24,11,321,51715,220,18,20,16,12364,5020,220,17,22,13,13190,220,17,23,25,279,11661,383,1500,220,17,23,4800,220,19,15,20,7896,506,220,19,25,16,21,11,321,51715,220,18,21,19,12364,5020,220,17,23,13,13190,220,17,24,25,279,11661,383,1500,220,17,24,4800,220,19,18,21,7896,506,220,20,25,17,18,11,321,51715,220,18,22,22,12364,5020,220,17,24,13,13190,220,18,15,25,279,11661,383,1500,220,18,15,4800,220,19,21,22,7896,506,220,21,25,18,15,11,321,51715,220,18,24,15,12364,5020,220,18,15,13,13190,220,18,16,25,279,11661,383,1500,220,18,16,4800,220,19,24,23,7896,506,220,22,25,18,22,11,321,51715,220,19,15,18,12364,5020,220,18,16,13,13190,220,18,17,25,279,11661,383,1500,220,18,17,4800,220,20,17,24,7896,506,220,23,25,19,19,11,321,51715,220,19,16,21,12364,5020,220,18,17,13,13190,220,18,18,25,279,11661,383,1500,220,18,18,4800,220,21,15,7896,506,220,24,25,20,16,11,321,51715,220,19,17,24,12364,5020,220,18,18,13,13190,220,18,19,25,279,11661,383,1500,220,18,19,4800,220,24,16,7896,506,220,16,15,25,20,23,11,321,51715,220,19,19,17,12364,5020,220,18,19,13,13190,220,18,20,25,279,11661,383,1500,220,18,20,4800,220,16,17,17,7896,506,220,16,16,25,15,20,11,321,51715,220,19,20,20,12364,5020,220,18,20,13,13190,220,18,21,25,279,11661,383,1500,220,18,21,4800,220,16,20,18,7896,506,220,16,17,25,16,17,11,321,51715,220,19,21,23,12364,5020,220,18,21,13,13190,220,18,22,25,279,11661,383,1500,220,18,22,4800,220,16,23,19,7896,506,220,16,18,25,16,24,11,321,51715,220,19,23,16,12364,5020,220,18,22,13,13190,220,18,23,25,279,11661,383,1500,220,18,23,4800,220,17,16,20,7896,506,220,16,19,25,17,21,11,321,51715,220,19,24,19,12364,5020,220,18,23,13,13190,220,18,24,25,279,11661,383,1500,220,18,24,4800,220,17,19,21,7896,506,220,16,20,25,18,18,11,321,51715,220,20,15,22,12364,5020,220,18,24,13,13190,220,19,15,25,279,11661,383,1500,220,19,15,4800,220,17,22,22,7896,506,220,16,21,25,19,15,11,321,51715,220,20,17,15,12364,5020,220,19,15,13,13190,220,19,16,25,279,11661,383,1500,220,19,16,4800,220,18,15,23,7896,506,220,16,22,25,19,22,11,321,51715,220,20,18,18,12364,5020,220,19,16,13,13190,220,19,17,25,279,11661,383,1500,220,19,17,4800,220,18,18,24,7896,506,220,16,23,25,20,19,11,321,51715,220,20,19,21,12364,5020,220,19,17,13,13190,220,19,18,25,279,11661,383,1500,220,19,18,4800,220,18,22,15,7896,506,220,16,24,25,15,16,11,321,51715,220,20,20,24,12364,5020,220,19,18,13,13190,220,19,19,25,279,11661,383,1500,220,19,19,4800,220,19,15,16,7896,506,220,17,15,25,15,23,11,321,51715,220,20,22,17,12364,5020,220,19,19,13,13190,220,19,20,25,279,11661,383,1500,220,19,20,4800,220,19,18,17,7896,506,220,17,16,25,16,20,11,321,51715,220,20,23,20,12364,5020,220,19,20,13,13190,220,19,21,25,279,11661,383,1500,220,19,21,4800,220,19,21,18,7896,506,220,17,17,25,17,17,11,321,51715,220,20,24,23,12364,5020,220,19,21,13,13190,220,19,22,25,279,11661,383,1500,220,19,22,4800,220,19,24,19,7896,506,220,17,18,25,17,24,11,321,51715,220,21,16,16,12364,5020,220,19,22,13,13190,220,19,23,25,279,11661,383,1500,220,19,23,4800,220,20,17,20,7896,506,220,15,25,18,21,11,321,51715,220,21,17,19,12364,5020,220,19,23,13,13190,220,19,24,25,279,11661,383,1500,220,19,24,4800,220,20,21,7896,506,220,16,25,19,18,11,321,51715,220,21,18,22,12364,5020,220,19,24,13,13190,220,20,15,25,279,11661,383,1500,220,20,15,4800,220,23,22,7896,506,220,17,25,20,15,11,321,51715,220,21,20,15,12364,5020,220,20,15,13,13190,220,20,16,25,279,11661,383,1500,220,20,16,4800,220,16,16,23,7896,506,220,18,25,20,22,11,321,51715,220,21,21,18,12364,5020,220,20,16,13,13190,220,20,17,25,279,11661,383,1500,220,20,17,4800,220,16,19,24,7896,506,220,19,25,15,19,11,321,51715,220,21,22,21,12364,5020,220,20,17,13,13190,220,20,18,25,279,11661,383,1500,220,20,18,4800,220,16,23,15,7896,506,220,20,25,16,16,11,321,51715,220,21,23,24,12364,5020,220,20,18,13,13190,220,20,19,25,279,11661,383,1500,220,20,19,4800,220,17,16,16,7896,506,220,21,25,16,23,11,321,51715,220,22,15,17,12364,5020,220,20,19,13,13190,220,20,20,25,279,11661,383,1500,220,20,20,4800,220,17,19,17,7896,506,220,22,25,17,20,11,321,51715,220,22,16],"reply_tokens":16,"retained_after":{"allocated_sequence_bytes":0,"charged_token_capacity":0,"checkpoint_fork_failures":0,"checkpoint_hits":0,"checkpoint_stores":0,"conversations":0,"enabled":false,"evictions":0,"held_gb":0,"held_images":0,"held_tokens":0,"hits":0,"max_conversations":4,"max_tokens":0,"misses":0,"reusable_checkpoints":0},"retained_before":{"allocated_sequence_bytes":0,"charged_token_capacity":0,"checkpoint_fork_failures":0,"checkpoint_hits":0,"checkpoint_stores":0,"conversations":0,"enabled":false,"evictions":0,"held_gb":0,"held_images":0,"held_tokens":0,"hits":0,"max_conversations":4,"max_tokens":0,"misses":0,"reusable_checkpoints":0},"stats":{"abortedReadScopes":0,"acceptedDrafts":0,"adaptiveDraftDepths":[],"adaptivePlainTokens":0,"allocatedSequenceBytes":84934656,"cachedRouterBytes":0,"completePromptHits":0,"completePromptStores":0,"contextArithmetic":"standard","decodeForwardPasses":15,"decodeIOSeconds":0.93093021199999948,"decodeLocalVictims":0,"decodeModelTokens":15,"decodeReadBytes":10625126400,"decodeRecords":3843,"decodeScatterSeconds":0.013498117999999998,"decodeSeconds":2.5563068750000002,"decodeSlotCPUBatches":0,"decodeSlotScatterBatches":703,"decodeSlotSliceBatches":0,"decodeSlotSliceRuns":0,"decodeSlotWordBatches":0,"decodeSlotWordBuffers":0,"decodeTokens":16,"draftedTokens":0,"draftSeconds":0,"embeddingCachedPayloadBytes":47520,"embeddingCachedRows":33,"embeddingRowHits":192,"embeddingRowMisses":33,"embeddingRowsEnabled":true,"encodedImages":0,"expertHitRate":0.46625,"finishReason":"length","firstTokenSeconds":27.009917792,"fusedGDNProjectionsScheduled":0,"fusedRoPERotationsScheduled":912,"generatorSystemAfter":{"lowPowerModeEnabled":false,"thermalState":"nominal"},"generatorSystemBefore":{"lowPowerModeEnabled":false,"thermalState":"nominal"},"generatorVMAfter":{"reclaimableBytes":23783948288,"swapins":44114145,"swapouts":77536010},"generatorVMBefore":{"reclaimableBytes":23942119424,"swapins":44114145,"swapouts":77536010},"imageEncodeSeconds":4.1999999999999999e-08,"interTokenSeconds":[0.40090033400000002,0.159279583,0.15245504200000001,0.20936908400000001,0.19868395899999999,0.14688458300000001,0.16875820799999999,0.19592899999999999,0.108916083,0.091336709000000002,0.104519959,0.17106299999999999,0.13432333299999999,0.15445004100000001,0.15829733300000001],"lifetimeRSSPeakBytes":3115106304,"memoryPressureCancelled":false,"mlxActiveEndBytes":6144035688,"mlxCacheEndBytes":714059883,"mlxPeakMemoryGB":6.5332902920000002,"ngramCachedRows":7424,"ngramCachePayloadBytes":4751360,"ngramLookaheadDiscarded":0,"ngramLookaheadRows":0,"ngramLookaheadWaitSeconds":0,"ngramPrefetchSeconds":0.13963878999999996,"ngramRowHits":80,"ngramRowMisses":160,"packedGDNProjectionLayers":0,"packedGDNProjectionPayloadBytes":0,"peakMemoryGB":7.4925706160000001,"physicalFootprintEndBytes":7492570616,"prefillComputeKeyExtents":[256,512,768,1024,1280,1536,1792,2048],"prefillComputePasses":[256,256,256,256,256,256,256,256],"prefillComputeQueryRows":[256,256,256,256,256,256,256,256],"prefillGPUWaitSeconds":2.3213256030000009,"prefillIOSeconds":17.272764688000013,"prefillLocalVictims":0,"prefillMLXActiveBytes":6234671304,"prefillMLXCacheBytes":541175098,"prefillPasses":[256,256,256,256,256,256,256,256],"prefillPhysicalFootprintBytes":7393562104,"prefillReadBytes":231278284800,"prefillRecords":83651,"prefillRowSortSeconds":0.009328160000000004,"prefillScatterSeconds":0.60989304400000011,"prefillSeconds":27.001832958000001,"prefillSlotCPUBatches":0,"prefillSlotSliceBatches":0,"prefillSlotWordBatches":0,"prefillTokens":2048,"prefixCheckpointErrors":0,"prefixCheckpointForks":0,"prefixCheckpointRefusals":2,"prefixCheckpointStores":0,"prefixSkippedImages":0,"preparationSeconds":9.7089999999999997e-06,"promptTokens":2048,"queueSeconds":1.3833e-05,"reconciledHeadTokens":0,"reconciliationSeconds":0,"requestSeconds":29.565445,"residentExpertJoins":0,"residentExpertJoinSeconds":0,"residentExpertPrelaunches":0,"reusedHeadTokens":0,"reusedImageFeatures":0,"reusedPrefixTokens":0,"ropeTableBuilds":27,"ropeTableHits":609,"sampledFootprint":{"intervalMilliseconds":20,"peakBytes":7492799992,"samples":1480},"sampleSeconds":0.0045334590000000001,"sharedExpertPrelaunches":0,"smallPrefillSweeps":0,"terminalMoERowsSkipped":0,"terminalQueryRowsSkipped":0,"tokenCallbackSeconds":4.5430000000000004e-06,"verifyPasses":0,"verifySeconds":0,"visionQueryTile":0,"visionQueryTileCalls":0},"text":"5 filed note 8.\n\n<think>\n\n<\/think>\n\nBased on the data provided","tokens":2048,"verdict":"OK","warmup":[]}

````

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-before/ssv_long.txt

SHA-256 `32e15bd0df7b057f31b74f94a24c179d4374c19ddc54b77d590e330710fc8f78`.

````text
The archive records that the vault combination is SEVENTEEN. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. 

Question: what is the vault combination? Answer with one word.

````

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-before/ssv_longmem.err

SHA-256 `a85a2ba3e7ae339b12bea241d92a5da73ff825d7fd6058f6745074c77aadafed`.

````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (28.6 GB reclaimable now), 40.2 GB Metal working set
  target: 10.0 GB total for this process
  cache:  ~20 of 512 experts per layer  (961 global slots = 2.7 GB pool)
  expect: ~9.0 GB peak, ~4 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 13382 tokens across 4 conversations (~0.7 GB), so a follow-up turn re-prefills only what is new
engine ready in 1.3s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]
prompt tokens: 7972 (~1.6 min to the first token at this plan)
  prefill: reading 7972 prompt tokens, ~1.6 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/7972 tokens (26%), ~1.4 min left
  prefill: 4096/7972 tokens (51%), ~53 s left
  prefill: 6144/7972 tokens (77%), ~25 s left
  prefill: done, 7972 tokens in 1.8 min (75 tok/s)

-- prefill 7972 tok in 106.09s (75.1 tok/s)
-- prefill split: io 67.69s + scatter 0.01s | 300548 records (831.0 GB, 12.3 GB/s)
-- decode 4 tok in 0.75s (5.30 tok/s)
-- decode split: io 0.30s + scatter 0.00s | 1215 records
-- expert cache ~20/512 experts per layer, hit rate 0.367 | ngram rows 24h/40m | sampled footprint peak 7.219 GB | total 106.9s

````

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-before/ssv_longmem.json

SHA-256 `01c71a99f637c16f38958a9d4bc70a880227f10e723c24013a3ffbb626b16565`.

````text
{"effective_expected_peak_gb":8.9994969600000001,"effective_mtp":false,"effective_pool_slots":961,"effective_prefill_chunk":256,"effective_prefill_cost_gb":0.33279999999999998,"encode_seconds":0.055205708999999999,"experimental_memory_family":false,"extra_expert_workspace_gb":0,"extra_read_scope_allowance_gb":0,"extra_router_cache_gb":0,"launch_seconds":117.04192170899999,"load_seconds":10.135908417,"optimizations":{"adaptiveSpeculation":false,"boundedDraftTail":false,"boundedIndexer":false,"boundedOutputQueue":true,"boundedPLE":false,"boundedSweepRows":false,"cachedRouterWeights":false,"compactIndexerRaw":false,"compactMTPRow":true,"compactNgramRows":false,"compactScopeFrontier":false,"compactStateWindows":true,"compiledNormFinish":false,"completePromptCheckpoint":true,"contiguousSlotWrites":false,"cpuSlotWrites":false,"deduplicateImages":false,"demandedPrefillOutput":false,"denseExpertLookup":false,"denseIndexerBypass":false,"deviceSamplerDraw":true,"directReadHandles":false,"disjointSweepOutput":false,"fusedGDNProjection":false,"fusedGDNRecording":false,"fusedRoPE":true,"incrementalIndexer":false,"indexerBlockTopK":false,"layerExpertWorkspace":false,"layerLocalFloorCache":false,"ngramLookahead":false,"ngramRingOrder":false,"overlapResidentExperts":false,"overlapSharedExpert":false,"prefixCheckpointTokens":256,"readScopeTokens":0,"resolvedRuntimeBudget":false,"responsiveGovernor":true,"reuseFirstMTPEntry":false,"routerTopK":false,"selectedTextAttention":false,"sharedRoPE":true,"skipUnusedFinalForward":true,"sparsePoolPins":false,"tailAwarePrefill":false,"terminalLastQuery":false,"terminalPrefillPruning":false,"valueOnlySamplerThreshold":true,"visionAttentionPadding":0,"visionQueryTile":0,"wordSlotWrites":false,"workspacePiecewiseWrites":false,"workspaceTokenTile":256},"output_ids":[896,6571,36,923],"plan":{"availability_clamped":false,"context_qualification":false,"device_available_gb":28.600000000000001,"device_ram_gb":51.5,"device_working_set_gb":40.200000000000003,"est_prefill_s_at_max_context":385.50588235294038,"est_prefill_tok_s":85,"est_warm_tok_s":4.0041666666666664,"expected_peak_gb":9,"experts_per_layer_cached":20,"fully_resident":false,"implementation_context_limit":65536,"max_context_tokens":32768,"max_prefill_wait_minutes":30,"max_ram_percent":70,"memory_ledger":{"active_capacity_bytes":905969664,"additional_active_bytes":0,"expected_peak_bytes":8999496960,"fixed_bytes":5300000000,"long_context_reserve_bytes":0,"mtp_resident_bytes":0,"planning_margin_bytes":1000000000,"pool_bytes":2656972800,"prefill_bytes":332800000,"retained_capacity_bytes":369985536,"retained_recurrent_bytes":339738624,"version":1,"vision_resident_bytes":0},"model_context_limit":262144,"mtp":false,"mtp_context_limit":65536,"pool_gb":2.7000000000000002,"pool_slots":961,"prefill_chunk":256,"prefill_wait_scope":"accepted_request_to_first_model_token","prefix_cache_max_tokens":13382,"runtime_prefix_cache_enabled":true,"source":"--memory-gb","target_gb":10,"vision":true,"vision_charged_gb":0,"vision_context_limit":65536,"vision_resident_gb":0.90000000000000002,"vision_resident_reserved":false},"prompt_ids":[248045,846,198,760,17593,7189,421,279,33439,10286,369,4890,6571,36,923,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,4558,14162,25,1092,369,279,33439,10286,30,21134,440,799,3299,13,248046,198,248045,74455,198,248068,271,248069,271],"sampling":{"greedy":true,"requested_max_tokens":"16","seed":"default"},"schema_version":1,"stats":{"abortedReadScopes":0,"acceptedDrafts":0,"adaptiveDraftDepths":[],"adaptivePlainTokens":0,"allocatedSequenceBytes":226492416,"cachedRouterBytes":0,"completePromptHits":0,"completePromptStores":0,"contextArithmetic":"standard","decodeForwardPasses":4,"decodeIOSeconds":0.29660445599999979,"decodeLocalVictims":0,"decodeModelTokens":4,"decodeReadBytes":3359232000,"decodeRecords":1215,"decodeScatterSeconds":0.0038069200000000036,"decodeSeconds":0.75411341700000001,"decodeSlotCPUBatches":0,"decodeSlotScatterBatches":192,"decodeSlotSliceBatches":0,"decodeSlotSliceRuns":0,"decodeSlotWordBatches":0,"decodeSlotWordBuffers":0,"decodeTokens":4,"draftedTokens":0,"draftSeconds":0,"embeddingCachedPayloadBytes":84960,"embeddingCachedRows":59,"embeddingRowHits":920,"embeddingRowMisses":59,"embeddingRowsEnabled":true,"encodedImages":0,"expertHitRate":0.3671875,"finishReason":"stop","firstTextSeconds":106.096685542,"firstTokenSeconds":106.09649275,"fusedGDNProjectionsScheduled":0,"fusedRoPERotationsScheduled":1536,"generatorSystemAfter":{"lowPowerModeEnabled":false,"thermalState":"nominal"},"generatorSystemBefore":{"lowPowerModeEnabled":false,"thermalState":"nominal"},"generatorVMAfter":{"reclaimableBytes":23783063552,"swapins":44114145,"swapouts":77535166},"generatorVMBefore":{"reclaimableBytes":23483875328,"swapins":44114133,"swapouts":77535166},"imageEncodeSeconds":4.1000000000000003e-08,"interTokenSeconds":[0.290761084,0.157727583,0.14304241700000001],"lifetimeRSSPeakBytes":3121184768,"memoryPressureCancelled":false,"mlxActiveEndBytes":5722671832,"mlxCacheEndBytes":539552247,"mlxPeakMemoryGB":6.2833264519999998,"ngramCachedRows":1192,"ngramCachePayloadBytes":762880,"ngramLookaheadDiscarded":0,"ngramLookaheadRows":0,"ngramLookaheadWaitSeconds":0,"ngramPrefetchSeconds":0.026058210000000009,"ngramRowHits":24,"ngramRowMisses":40,"packedGDNProjectionLayers":0,"packedGDNProjectionPayloadBytes":0,"peakMemoryGB":7.2043434079999997,"physicalFootprintEndBytes":7204343408,"prefillComputeKeyExtents":[256,512,768,1024,1280,1536,1792,2048,2304,2560,2816,3072,3328,3584,3840,4096,4352,4608,4864,5120,5376,5632,5888,6144,6400,6656,6912,7168,7424,7680,7936,7972],"prefillComputePasses":[256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,36],"prefillComputeQueryRows":[256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,36],"prefillGPUWaitSeconds":9.2326799659999921,"prefillIOSeconds":67.689718874999954,"prefillLocalVictims":0,"prefillMLXActiveBytes":5722067096,"prefillMLXCacheBytes":536934174,"prefillPasses":[256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,36],"prefillPhysicalFootprintBytes":7200362096,"prefillReadBytes":830955110400,"prefillRecords":300548,"prefillRowSortSeconds":0.047112572000000033,"prefillScatterSeconds":0.007357248999999998,"prefillSeconds":106.091977583,"prefillSlotCPUBatches":0,"prefillSlotSliceBatches":0,"prefillSlotWordBatches":0,"prefillTokens":7972,"prefixCheckpointErrors":0,"prefixCheckpointForks":0,"prefixCheckpointRefusals":1,"prefixCheckpointStores":1,"prefixSkippedImages":0,"preparationSeconds":0.055234916000000002,"promptTokens":7972,"queueSeconds":4.0840000000000002e-06,"reconciledHeadTokens":0,"reconciliationSeconds":0,"requestSeconds":106.905533084,"residentExpertJoins":0,"residentExpertJoinSeconds":0,"residentExpertPrelaunches":0,"reusedHeadTokens":0,"reusedImageFeatures":0,"reusedPrefixTokens":0,"ropeTableBuilds":61,"ropeTableHits":1043,"sampledFootprint":{"intervalMilliseconds":20,"peakBytes":7219154520,"samples":5344},"sampleSeconds":0.0013361250000000001,"sharedExpertPrelaunches":0,"smallPrefillSweeps":0,"terminalMoERowsSkipped":0,"terminalQueryRowsSkipped":0,"tokenCallbackSeconds":0.00036058299999999999,"verifyPasses":0,"verifySeconds":0,"visionQueryTile":0,"visionQueryTileCalls":0},"text":"SEVENTEEN"}
````

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-before/ssv_longmem.txt

SHA-256 `2e9fad2e271de488677d33bde2dd661601317f58b374941e44c1d077da46ebe3`.

````text
SEVENTEEN

````

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-before/ssv_mem.err

SHA-256 `4c4284b7a89dd0b09d06649ca9f0a6741c5f060303f064978e3fce4625d709a6`.

````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (28.6 GB reclaimable now), 40.2 GB Metal working set
  target: 10.0 GB total for this process
  cache:  ~20 of 512 experts per layer  (961 global slots = 2.7 GB pool)
  expect: ~9.0 GB peak, ~4 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 13382 tokens across 4 conversations (~0.7 GB), so a follow-up turn re-prefills only what is new
engine ready in 1.2s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]
prompt tokens: 18 (~0 s to the first token at this plan)

-- prefill 18 tok in 1.19s (15.2 tok/s)
-- prefill split: io 0.70s + scatter 0.00s | 3420 records (9.5 GB, 13.4 GB/s)
-- decode 24 tok in 3.60s (6.68 tok/s)
-- decode split: io 1.64s + scatter 0.02s | 6252 records
-- expert cache ~20/512 experts per layer, hit rate 0.434 | ngram rows 0h/368m | sampled footprint peak 6.166 GB | total 4.8s

````

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-before/ssv_mem.json

SHA-256 `66e21b1b60d02e3d4ddf7f8d814e55a8dfca375df71927695a8261c13391f8e2`.

````text
{"effective_expected_peak_gb":8.9994969600000001,"effective_mtp":false,"effective_pool_slots":961,"effective_prefill_chunk":256,"effective_prefill_cost_gb":0.33279999999999998,"encode_seconds":0.012501708,"experimental_memory_family":false,"extra_expert_workspace_gb":0,"extra_read_scope_allowance_gb":0,"extra_router_cache_gb":0,"launch_seconds":14.431002416,"load_seconds":9.6325932909999992,"optimizations":{"adaptiveSpeculation":false,"boundedDraftTail":false,"boundedIndexer":false,"boundedOutputQueue":true,"boundedPLE":false,"boundedSweepRows":false,"cachedRouterWeights":false,"compactIndexerRaw":false,"compactMTPRow":true,"compactNgramRows":false,"compactScopeFrontier":false,"compactStateWindows":true,"compiledNormFinish":false,"completePromptCheckpoint":true,"contiguousSlotWrites":false,"cpuSlotWrites":false,"deduplicateImages":false,"demandedPrefillOutput":false,"denseExpertLookup":false,"denseIndexerBypass":false,"deviceSamplerDraw":true,"directReadHandles":false,"disjointSweepOutput":false,"fusedGDNProjection":false,"fusedGDNRecording":false,"fusedRoPE":true,"incrementalIndexer":false,"indexerBlockTopK":false,"layerExpertWorkspace":false,"layerLocalFloorCache":false,"ngramLookahead":false,"ngramRingOrder":false,"overlapResidentExperts":false,"overlapSharedExpert":false,"prefixCheckpointTokens":256,"readScopeTokens":0,"resolvedRuntimeBudget":false,"responsiveGovernor":true,"reuseFirstMTPEntry":false,"routerTopK":false,"selectedTextAttention":false,"sharedRoPE":true,"skipUnusedFinalForward":true,"sparsePoolPins":false,"tailAwarePrefill":false,"terminalLastQuery":false,"terminalPrefillPruning":false,"valueOnlySamplerThreshold":true,"visionAttentionPadding":0,"visionQueryTile":0,"wordSlotWrites":false,"workspacePiecewiseWrites":false,"workspaceTokenTile":256},"output_ids":[760,12515,7701,6105,15048,4016,310,264,24057,2512,2972,28232,60845,69377,159034,271,13962,14392,13909,12,8046,68868,25,271],"plan":{"availability_clamped":false,"context_qualification":false,"device_available_gb":28.600000000000001,"device_ram_gb":51.5,"device_working_set_gb":40.200000000000003,"est_prefill_s_at_max_context":385.50588235294038,"est_prefill_tok_s":85,"est_warm_tok_s":4.0041666666666664,"expected_peak_gb":9,"experts_per_layer_cached":20,"fully_resident":false,"implementation_context_limit":65536,"max_context_tokens":32768,"max_prefill_wait_minutes":30,"max_ram_percent":70,"memory_ledger":{"active_capacity_bytes":905969664,"additional_active_bytes":0,"expected_peak_bytes":8999496960,"fixed_bytes":5300000000,"long_context_reserve_bytes":0,"mtp_resident_bytes":0,"planning_margin_bytes":1000000000,"pool_bytes":2656972800,"prefill_bytes":332800000,"retained_capacity_bytes":369985536,"retained_recurrent_bytes":339738624,"version":1,"vision_resident_bytes":0},"model_context_limit":262144,"mtp":false,"mtp_context_limit":65536,"pool_gb":2.7000000000000002,"pool_slots":961,"prefill_chunk":256,"prefill_wait_scope":"accepted_request_to_first_model_token","prefix_cache_max_tokens":13382,"runtime_prefix_cache_enabled":true,"source":"--memory-gb","target_gb":10,"vision":true,"vision_charged_gb":0,"vision_context_limit":65536,"vision_resident_gb":0.90000000000000002,"vision_resident_reserved":false},"prompt_ids":[248045,846,198,9930,369,279,12515,6105,30,248046,198,248045,74455,198,248068,271,248069,271],"sampling":{"greedy":true,"requested_max_tokens":"24","seed":"default"},"schema_version":1,"stats":{"abortedReadScopes":0,"acceptedDrafts":0,"adaptiveDraftDepths":[],"adaptivePlainTokens":0,"allocatedSequenceBytes":28311552,"cachedRouterBytes":0,"completePromptHits":0,"completePromptStores":1,"contextArithmetic":"standard","decodeForwardPasses":23,"decodeIOSeconds":1.6357976620000008,"decodeLocalVictims":0,"decodeModelTokens":23,"decodeReadBytes":17285529600,"decodeRecords":6252,"decodeScatterSeconds":0.020932148000000029,"decodeSeconds":3.59526375,"decodeSlotCPUBatches":0,"decodeSlotScatterBatches":1092,"decodeSlotSliceBatches":0,"decodeSlotSliceRuns":0,"decodeSlotWordBatches":0,"decodeSlotWordBuffers":0,"decodeTokens":24,"draftedTokens":0,"draftSeconds":0,"embeddingCachedPayloadBytes":48960,"embeddingCachedRows":34,"embeddingRowHits":3,"embeddingRowMisses":34,"embeddingRowsEnabled":true,"encodedImages":0,"expertHitRate":0.43369565217391304,"finishReason":"length","firstTextSeconds":1.1906010410000001,"firstTokenSeconds":1.1903270829999999,"fusedGDNProjectionsScheduled":0,"fusedRoPERotationsScheduled":576,"generatorSystemAfter":{"lowPowerModeEnabled":false,"thermalState":"nominal"},"generatorSystemBefore":{"lowPowerModeEnabled":false,"thermalState":"nominal"},"generatorVMAfter":{"reclaimableBytes":22874685440,"swapins":44114133,"swapouts":77535166},"generatorVMBefore":{"reclaimableBytes":23615324160,"swapins":44114133,"swapouts":77535166},"imageEncodeSeconds":1.66e-07,"interTokenSeconds":[0.20298108300000001,0.184968417,0.14259116699999999,0.128835792,0.15936987499999999,0.13550287499999999,0.12914241700000001,0.119295,0.13821824999999999,0.13645125,0.17043249999999999,0.18523041700000001,0.11339866699999999,0.135127,0.20040454199999999,0.160747584,0.13290637499999999,0.13721029200000001,0.124449667,0.21463625,0.14947391700000001,0.19569545899999999,0.197754917],"lifetimeRSSPeakBytes":3172106240,"memoryPressureCancelled":false,"mlxActiveEndBytes":5522447512,"mlxCacheEndBytes":35234484,"mlxPeakMemoryGB":5.6205251140000003,"ngramCachedRows":656,"ngramCachePayloadBytes":419840,"ngramLookaheadDiscarded":0,"ngramLookaheadRows":0,"ngramLookaheadWaitSeconds":0,"ngramPrefetchSeconds":0.016267794000000002,"ngramRowHits":0,"ngramRowMisses":368,"packedGDNProjectionLayers":0,"packedGDNProjectionPayloadBytes":0,"peakMemoryGB":6.1661216879999996,"physicalFootprintEndBytes":6166121688,"prefillComputeKeyExtents":[18],"prefillComputePasses":[18],"prefillComputeQueryRows":[18],"prefillGPUWaitSeconds":0,"prefillIOSeconds":0.70394792100000025,"prefillLocalVictims":0,"prefillMLXActiveBytes":5378829464,"prefillMLXCacheBytes":35070908,"prefillPasses":[18],"prefillPhysicalFootprintBytes":6019042496,"prefillReadBytes":9455616000,"prefillRecords":3420,"prefillRowSortSeconds":0,"prefillScatterSeconds":0.0037974159999999996,"prefillSeconds":1.186212584,"prefillSlotCPUBatches":0,"prefillSlotSliceBatches":0,"prefillSlotWordBatches":0,"prefillTokens":18,"prefixCheckpointErrors":0,"prefixCheckpointForks":0,"prefixCheckpointRefusals":0,"prefixCheckpointStores":0,"prefixSkippedImages":0,"preparationSeconds":0.012525834,"promptTokens":18,"queueSeconds":4.6659999999999999e-06,"reconciledHeadTokens":0,"reconciliationSeconds":0,"requestSeconds":4.7979097089999998,"residentExpertJoins":0,"residentExpertJoinSeconds":0,"residentExpertPrelaunches":0,"reusedHeadTokens":0,"reusedImageFeatures":0,"reusedPrefixTokens":0,"ropeTableBuilds":24,"ropeTableHits":264,"sampledFootprint":{"intervalMilliseconds":20,"peakBytes":6166121688,"samples":241},"sampleSeconds":0.005517125000000001,"sharedExpertPrelaunches":0,"smallPrefillSweeps":0,"terminalMoERowsSkipped":0,"terminalQueryRowsSkipped":0,"tokenCallbackSeconds":0.0012559590000000001,"verifyPasses":0,"verifySeconds":0,"visionQueryTile":0,"visionQueryTileCalls":0},"text":"The sky appears blue primarily due to a phenomenon called **Rayleigh scattering**.\n\n### Step-by-Step Explanation:\n\n"}
````

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-before/ssv_mem.txt

SHA-256 `ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1`.

````text
The sky appears blue primarily due to a phenomenon called **Rayleigh scattering**.

### Step-by-Step Explanation:



````

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-before/ssv_ngram.txt

SHA-256 `7aee6c252d1fc64ffc1d396b5e8d37d3be66e22a785afade923966b9d29a35f3`.

````text
16410909,39682429,55103279,60931720,87006904,116506179,131512017,152932897,169641436,182022480,209277433,237891023,256841529,277007269,290665954,300984276
18158303,36390029,45652312,70783524,98191154,114024957,127804916,159566246,175132467,192583600,217919476,237199054,259336807,261799367,289359313,307699687
14018266,20311704,43480436,63941281,95787780,113074662,139009389,153597172,176521398,195310421,213995347,230817794,250415398,270032340,289909058,309324234
19328306,31622976,57795084,66463709,93919746,116410415,120151274,145148395,173389511,188877183,200309508,238866090,246672398,274484811,290423659,310127336
5058702,22280190,50893597,78955315,97296665,116744385,125916430,144813497,168457659,191037312,207392458,222765427,244080806,265398615,299171972,308041519
12491660,20431478,44408400,65983911,98770238,116367196,122763968,157962372,172188198,192734484,216716967,225308066,255605896,265905913,289339931,306513116

````

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-before/ssv_q.log

SHA-256 `5366a8dc19f9deeb3cc9225a8636ea4188302b47aa64c7c4d72b92d04d953a42`.

````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (29.6 GB reclaimable now), 40.2 GB Metal working set
  target: 10.0 GB total for this process
  cache:  ~20 of 512 experts per layer  (961 global slots = 2.7 GB pool)
  expect: ~9.0 GB peak, ~4 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 13382 tokens across 4 conversations (~0.7 GB), so a follow-up turn re-prefills only what is new
engine ready in 0.8s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]
elastic: off — an explicit size is pinned; omit the size flag for elastic auto
slotstream listening on http://127.0.0.1:11467
try it:
  curl localhost:11467/api/chat -d '{"model": "qwen3.8-flash-next:4bit", "messages": [{"role": "user", "content": "hello"}]}'
or point any Ollama or OpenAI client at http://localhost:11467

````

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-before/ssv_small.txt

SHA-256 `ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1`.

````text
The sky appears blue primarily due to a phenomenon called **Rayleigh scattering**.

### Step-by-Step Explanation:



````

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/output-capture-preparation.json

SHA-256 `7a3fbd41f978e414ffba22b319580111ce27d5f71669934af35e6278de631d85`.

````text
{
  "launched": false,
  "before_sha256": "5324e977b086264c2331e86bdf41153e84d6a16fb9be7bc36b2ee86aba051539",
  "after_sha256": "80cfd6b6a9de17e18335e4014a4ebdeb03497c327e6f44b64f548236c5d34c09",
  "change": "Prospectively capture the original verification script fixed temporary outputs before and after execution, with hashes and modification times; symlinks are recorded without traversal. Original driver, workload and thresholds unchanged."
}

````

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/protocol.json

SHA-256 `20ccc35a68c51e05b3f7f4be28efd045e28e95cd318536e7581bb91d57e2064a`.

````text
{
  "classification": "Full existing verification workload on exact candidate; VM recorded by outer ownership guard. Every original inner memory/performance/correctness gate remains mandatory; no skipped gate can pass.",
  "frozen_at": "2026-09-07T16:21:36.951837+00:00",
  "deadline_utc": "2026-09-07T18:00:00Z",
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
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
      "source_archive_sha256": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
      "binary_sha256": "af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d",
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
  "native_contract_sha256": "dd1bada1296a7e69a034e7c674a92779b7d0f362dcd3dcfdb2cd2308baf8dbd0",
  "wrapper_sha256": "80cfd6b6a9de17e18335e4014a4ebdeb03497c327e6f44b64f548236c5d34c09",
  "policy": {
    "startup_reclaimable_bytes": 21000000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 17500000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 3600,
    "stop_on_new_swapouts": false
  },
  "environment": {
    "SLOTSTREAM_TEST_BINARY": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
    "SLOTSTREAM_VERIFY_OUT": "/Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full/verification"
  },
  "command": [
    "bash",
    "/Users/carlos/Projects/slotstream/Tools/verify.sh"
  ],
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
    "Tools/optimization_results.py": "1842f0f1b0c39845272cd0babaf89a11a835035b20e6feb6191efb040c727b35",
    "Tools/optimization_results_test.py": "766c73cfabbc10c42549fe77a6f6f9a20a67e33c5d346b217587af6b688f38a1",
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

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/resource-reassessment.json

SHA-256 `0aeb3b0a546abb336eb624d0204d5b9ad348731a77999f762a81595ecd13b517`.

````text
{
  "captured_at": "2026-09-07T16:46:57.938083+00:00",
  "full_manifest_sha256": "0cdec6c09d8cbd9edb612c561901cf1159126f9891b14b7b5469a80e3829be58",
  "classification": "Read-only re-evaluation of preserved original outputs. No model rerun and no failed/excluded observation replaced. Global VM counters do not identify a responsible process.",
  "rows": [
    {
      "file": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-after/ssv_mem.json",
      "sha256": "e3af6d1688321e272e87c06f8c267ca61da528ec7d4b415828b99913d1840f26",
      "memory_gate": {
        "passed": true,
        "maximum_observed_bytes": 6168907016,
        "sampled_footprint_bytes": 6168907016,
        "image_preparation_peak_bytes": 0,
        "lifetime_rss_bytes": 3175022592,
        "physical_footprint_end_bytes": 6168907016,
        "sampling_interval_ms": 20
      },
      "sampled_peak_bytes": 6168907016,
      "lifetime_rss_bytes": 3175022592,
      "physical_end_bytes": 6168907016,
      "swapins": 0,
      "swapouts": 0,
      "fits": null,
      "aborted": null,
      "verdict": null
    },
    {
      "file": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-after/ssv_longmem.json",
      "sha256": "f7316907168f1ba77705fdfffa844cd241361e3967406c4d9a5e180de729be9e",
      "memory_gate": {
        "passed": false,
        "error": "swap activity during generator interval"
      },
      "sampled_peak_bytes": 7224889136,
      "lifetime_rss_bytes": 3126296576,
      "physical_end_bytes": 7209357104,
      "swapins": 16,
      "swapouts": 0,
      "fits": null,
      "aborted": null,
      "verdict": null
    },
    {
      "file": "/tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/legacy-output-after/ssv_ctx.json",
      "sha256": "4406c710022a6d46c4573dcbe22f4d8345496d71025b131c40c6f518d67dcde3",
      "memory_gate": {
        "passed": false,
        "error": "swap activity during generator interval"
      },
      "sampled_peak_bytes": 7546670680,
      "lifetime_rss_bytes": 3099705344,
      "physical_end_bytes": 7546670680,
      "swapins": 44,
      "swapouts": 0,
      "fits": false,
      "aborted": null,
      "verdict": "EXCLUDED: swap activity or missing memory observations during the request"
    }
  ]
}

````

## /tmp/slotstream-optimization-execution/current-candidate-gates-v307/full/run.py

SHA-256 `80cfd6b6a9de17e18335e4014a4ebdeb03497c327e6f44b64f548236c5d34c09`.

````text
from pathlib import Path
import datetime,json,os,re,shutil,signal,sys,time
ROOT=Path('/Users/carlos/Projects/slotstream');P=Path(__file__).parent
sys.path.insert(0,str(ROOT/'Tools'))
from prefill_bench import digest,preflight,vm_snapshot
from serve_bench import competing_jobs,verified_build
from optimization_readiness import pressure_snapshot,require_normal
from optimization_serial_build import guarded_run
import optimization_campaign as campaign
B=ROOT/'.build/optimization/joined-state-eval-build-v304/candidate/slotstream'
OUT=ROOT/'.build/optimization/current-candidate-gates-v307/full'
# The reservation must be granted by the peer before invocation; the argument
# binds a concrete handback deadline and never authorizes extending it.
DEADLINE=datetime.datetime.fromisoformat(sys.argv[1].replace('Z','+00:00')).timestamp()
remaining=int(DEADLINE-time.time()-30)
if remaining<1800:raise RuntimeError('full gate requires at least30minutes within the granted interval')
POLICY={'startup_reclaimable_bytes':21_000_000_000,'minimum_live_reclaimable_bytes':3_000_000_000,
 'maximum_owned_rss_bytes':17_500_000_000,'sample_interval_seconds':.2,
 'maximum_build_seconds':min(3600,remaining),'stop_on_new_swapouts':False}
NATIVE_PACKET=ROOT/'.build/optimization/joined-state-eval-campaign-v305'
native=campaign.status(NATIVE_PACKET)['stages'][:3]
assert [r['stage'] for r in native]==['native/'+n for n in campaign.NATIVE] and all(r['status']=='passed' for r in native)
S={'classification':'Full existing verification workload on exact candidate; VM recorded by outer ownership guard. Every original inner memory/performance/correctness gate remains mandatory; no skipped gate can pass.',
 'frozen_at':datetime.datetime.now(datetime.timezone.utc).isoformat(),'deadline_utc':sys.argv[1],
 'build':verified_build(B),'native_prerequisites':native,'native_contract_sha256':digest(NATIVE_PACKET/'qualification-contract.json'),'wrapper_sha256':digest(Path(__file__)),'policy':POLICY,
 'environment':{'SLOTSTREAM_TEST_BINARY':str(B),'SLOTSTREAM_VERIFY_OUT':str(OUT/'verification')},
 'command':['bash',str(ROOT/'Tools/verify.sh')],
 'drivers':{str(f.relative_to(ROOT)):digest(f) for f in sorted((ROOT/'Tools').rglob('*')) if f.is_file() and f.suffix in ['.sh','.py','.mjs','.json','.swift','.txt'] and '__pycache__' not in f.parts},
 'limits':'No build, app closure, default activation or paid service. Existing verified local model only. Source/binary/Metal pinned; files saved before exit.'}
with (P/'protocol.json').open('x') as protocol:protocol.write(json.dumps(S,indent=2)+'\n')
OUT.mkdir(exist_ok=False);started=time.monotonic();r={'passed':False,'protocol_sha256':digest(P/'protocol.json')}
def interrupted(number,_frame):raise KeyboardInterrupt(f'full qualification interrupted by signal{number}')
signal.signal(signal.SIGINT,interrupted);signal.signal(signal.SIGTERM,interrupted)
# Capture legacy fixed output files on both sides of this exact run. An
# unchanged/stale output is retained as history, never asserted to be new evidence.
legacy_names=sorted(set(re.findall(r'/tmp/(ssv[\w.-]+)',(ROOT/'Tools/verify.sh').read_text())))
def capture_legacy(phase):
 folder=P/('legacy-output-'+phase);folder.mkdir(exist_ok=False);rows=[]
 for name in legacy_names:
  path=Path('/tmp')/name
  if path.is_symlink():
   rows.append({'path':str(path),'kind':'symlink','target':os.readlink(path)});continue
  if not path.is_file():continue
  stat=path.stat();sha=digest(path);shutil.copy2(path,folder/name)
  rows.append({'path':str(path),'sha256':sha,'bytes':stat.st_size,'mtime_ns':stat.st_mtime_ns,
               'observed_after_run_start':stat.st_mtime_ns>=int(legacy_started_wall*1e9)})
 (folder/'inventory.json').write_text(json.dumps(rows,indent=2)+'\n');return rows
legacy_started_wall=time.time()
r['legacy_output_before']=capture_legacy('before')
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
  # Preserve exact fixed outputs, including failed-check artifacts.
  try:r['legacy_output_after']=capture_legacy('after')
  except BaseException as error:r.setdefault('cleanup_errors',{})['legacy_output_capture']=str(error)
  # Primary result is durable before independent restoration checks.
  (OUT/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
  for n,f in {'after':vm_snapshot,'pressure':pressure_snapshot,'candidate_unchanged':lambda:verified_build(B)==S['build'],
   'drivers_unchanged':lambda:all(digest(ROOT/n)==h for n,h in S['drivers'].items()),
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

## /tmp/slotstream-optimization-execution/verification-context-exit-v313/after-verify.sh

SHA-256 `4eb4c0990bb7a92141f9510800457985a9ed0c40b4db601d36acfd30cd9d65e4`.

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
CONTEXT_STATUS=0
# A resource exclusion is a failed gate, not permission to omit the rest of
# the battery. Preserve both process status and diagnostics under set -e.
run_model "$BIN" context-check --tokens 2048 --memory-gb $BIG_MEMORY --sample-footprint --json \
  2>"$VERIFY_OUT/context-check.stderr.txt" > /tmp/ssv_ctx.json || CONTEXT_STATUS=$?
printf '%s\n' "$CONTEXT_STATUS" > "$VERIFY_OUT/context-check.exit-status.txt"
check "context-check: 2k rung reads inside the plan and reports it" \
      "[ \"\$CONTEXT_STATUS\" -eq 0 ] && python3 -c 'import json; d=json.loads(open(\"/tmp/ssv_ctx.json\").read().strip().splitlines()[-1]); assert d[\"fits\"] and d[\"aborted\"] is None and d[\"prefill_tokens\"]==2048, d'"

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

## /tmp/slotstream-optimization-execution/verification-context-exit-v313/after-verify_binary_test.py

SHA-256 `b9caffe691a91a3ef8eb44aa543bc5d5c95354199f8537b5b73eeab91acbbdbd`.

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


class VerifyContextStatus(unittest.TestCase):
    def test_context_failures_are_recorded_without_truncating_the_battery(self):
        valid = {
            'fits': True, 'aborted': None, 'prefill_tokens': 2048,
            'stats': {
                'sampledFootprint': {'peakBytes': 8_000_000_000, 'samples': 10,
                                     'intervalMilliseconds': 50},
                'lifetimeRSSPeakBytes': 8_000_000_000,
                'physicalFootprintEndBytes': 7_000_000_000,
                'generatorVMBefore': {'swapins': 10, 'swapouts': 20},
                'generatorVMAfter': {'swapins': 10, 'swapouts': 20},
            },
        }
        excluded = json.loads(json.dumps(valid))
        excluded['fits'] = False
        excluded['stats']['generatorVMAfter']['swapins'] += 4
        oversized = json.loads(json.dumps(valid))
        oversized['stats']['sampledFootprint']['peakBytes'] = 10_000_000_001
        cases = [
            ('success', json.dumps(valid), 0, 0, 2, 0),
            ('swap exclusion', json.dumps(excluded), 1, 0, 0, 2),
            ('nonzero overrides success JSON', json.dumps(valid), 23, 0, 1, 1),
            ('zero cannot override failed observations', json.dumps(excluded), 0, 0, 0, 2),
            ('memory ceiling remains mandatory', json.dumps(oversized), 0, 0, 1, 1),
            ('empty output replaces stale success', '', 23, 0, 0, 2),
            ('malformed output', '{broken', 0, 0, 0, 2),
            ('missing fields', '{}', 0, 0, 0, 2),
            ('failed preflight prevents generation', '', 0, 2, 0, 2),
        ]
        for name, output, status, preflight, passed, failed in cases:
            with self.subTest(name=name), tempfile.TemporaryDirectory(prefix='slotstream-context-status-') as directory:
                root = Path(directory)
                results = root/"results space's; $(touch injected)"
                fixture = root/"binary space's"
                fixture.write_text('''#!/usr/bin/env python3
import os,sys
assert sys.argv[1:] == ['context-check','--tokens','2048','--memory-gb','10','--sample-footprint','--json']
sys.stdout.write(os.environ['VERIFY_CONTEXT_TEXT'])
sys.stderr.write('context diagnostic\\n')
raise SystemExit(int(os.environ['VERIFY_CONTEXT_EXIT']))
''')
                fixture.chmod(0o755)
                context_json = root/'context.json'
                context_json.write_text(json.dumps(valid))
                header = SCRIPT[SCRIPT.index('BIN='):SCRIPT.index('QPID=""')]
                start = SCRIPT.index('CONTEXT_STATUS=0')
                end = SCRIPT.index('echo "== serving robustness', start)
                block = SCRIPT[start:end].replace('/tmp/ssv_ctx.json', str(context_json))
                block = block.replace('Tools/memory_gate.py', str(Path(__file__).with_name('memory_gate.py').resolve()))
                script = 'set -eo pipefail\n'+header+'''
safety_before() { return "$VERIFY_CONTEXT_PREFLIGHT"; }
BIG_MEMORY=10
'''+block+'''
printf 'AFTER_CONTEXT\\nCOUNTS %s %s\\n' "$PASS" "$FAIL"
[ "$FAIL" -eq 0 ]
'''
                env = {k: v for k, v in os.environ.items()
                       if k != 'BIN' and not k.startswith(('SLOTSTREAM_', 'SS_DEBUG', 'VERIFY_CONTEXT_'))}
                env.update(SLOTSTREAM_TEST_BINARY=str(fixture), SLOTSTREAM_VERIFY_OUT=str(results),
                           VERIFY_CONTEXT_TEXT=output, VERIFY_CONTEXT_EXIT=str(status),
                           VERIFY_CONTEXT_PREFLIGHT=str(preflight))
                process = subprocess.run(['bash', '-c', script], cwd=root, env=env,
                                         text=True, capture_output=True, timeout=10)
                self.assertIn('AFTER_CONTEXT', process.stdout, process.stdout+process.stderr)
                self.assertIn(f'COUNTS {passed} {failed}', process.stdout)
                self.assertEqual(process.returncode, int(failed != 0), process.stdout+process.stderr)
                self.assertEqual(context_json.read_text(), output)
                self.assertEqual((results/'context-check.exit-status.txt').read_text(), f'{preflight or status}\n')
                self.assertEqual((results/'context-check.stderr.txt').read_text(),
                                 '' if preflight else 'context diagnostic\n')
                self.assertEqual(len(list(results.glob('check-*.txt'))), 2)
                self.assertFalse((root/'injected').exists())


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

## /tmp/slotstream-optimization-execution/verification-context-exit-v313/before.json

SHA-256 `3341e002d8b24752596a7ab74d6c74b734f8cad6cfe53d56cf387a6d9c85124d`.

````text
{
  "captured_at": "2026-09-07T16:42:06.198198+00:00",
  "files": {
    "Tools/verify.sh": "ed2485271adf39581150a38fd56b117e9c82dba7b8e1bed857f7fbeb39991065",
    "Tools/verify_binary_test.py": "739bf1d03823ad77f0f7663af5b223474c5518148a1e51065d168a7109b50762"
  },
  "failure_evidence": "/Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v307/full",
  "scope": "Harness only. No runtime, comparison driver, budget, request, no-VM criterion or qualification threshold changes."
}

````

## /tmp/slotstream-optimization-execution/verification-context-exit-v313/validation.json

SHA-256 `a11abe025ccfe23d80620404330667d16d93d7d14bb9f113f732d541312a7f78`.

````text
{
  "observed_at": "2026-09-07T16:44:52.987719+00:00",
  "scope": "Harness correction only; process exit status, fits/abort/token count, and all memory assertions preserved.",
  "validation": {
    "command": [
      "python3",
      "-m",
      "unittest",
      "-v",
      "Tools/verify_binary_test.py"
    ],
    "tests": 16,
    "context_subcases": 9,
    "passed": true,
    "elapsed_seconds": 7.635976958,
    "tool_output_chunk": "fc5e84",
    "shell_syntax_passed": true
  },
  "after": {
    "Tools/verify.sh": "4eb4c0990bb7a92141f9510800457985a9ed0c40b4db601d36acfd30cd9d65e4",
    "Tools/verify_binary_test.py": "b9caffe691a91a3ef8eb44aa543bc5d5c95354199f8537b5b73eeab91acbbdbd"
  },
  "runtime_edited": false,
  "no_vm_criteria_changed": false,
  "prior_failed_full_run_preserved": true
}

````

## /tmp/slotstream-optimization-execution/verification-context-exit-v313/verify.sh

SHA-256 `ed2485271adf39581150a38fd56b117e9c82dba7b8e1bed857f7fbeb39991065`.

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

## /tmp/slotstream-optimization-execution/verification-context-exit-v313/verify_binary_test.py

SHA-256 `739bf1d03823ad77f0f7663af5b223474c5518148a1e51065d168a7109b50762`.

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

## /tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-after/inventory.json

SHA-256 `ef23015919d193cb1241f60998eaa2d4329d06718e28644096d5cdd7c98a1c5e`.

````text
[
  {
    "path": "/tmp/ssv-vision-serve.log",
    "sha256": "eb961483be23d08a98e832da3947712539f86e1472dd588546422cba8e49d7b5",
    "bytes": 1637,
    "mtime_ns": 1788773455723424906,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_big.txt",
    "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1",
    "bytes": 116,
    "mtime_ns": 1788798135087159710,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_ctx.json",
    "sha256": "4406c710022a6d46c4573dcbe22f4d8345496d71025b131c40c6f518d67dcde3",
    "bytes": 15271,
    "mtime_ns": 1788798721018224823,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_long.txt",
    "sha256": "32e15bd0df7b057f31b74f94a24c179d4374c19ddc54b77d590e330710fc8f78",
    "bytes": 50993,
    "mtime_ns": 1788798561062459645,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_longmem.err",
    "sha256": "09ef2aa12e83980f5bc605539bc49dc0c853f84ce38ddc1ed1b5c0473f3d438f",
    "bytes": 1834,
    "mtime_ns": 1788798673421914320,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_longmem.json",
    "sha256": "f7316907168f1ba77705fdfffa844cd241361e3967406c4d9a5e180de729be9e",
    "bytes": 47781,
    "mtime_ns": 1788798673421269440,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_longmem.txt",
    "sha256": "2e9fad2e271de488677d33bde2dd661601317f58b374941e44c1d077da46ebe3",
    "bytes": 10,
    "mtime_ns": 1788798673493505155,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_mem.err",
    "sha256": "3e273c369f5e1728c11ccc123d7da7fc5cc3970639e8061e6fe94c2c6f8ea916",
    "bytes": 1506,
    "mtime_ns": 1788798560947204504,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_mem.json",
    "sha256": "e3af6d1688321e272e87c06f8c267ca61da528ec7d4b415828b99913d1840f26",
    "bytes": 7324,
    "mtime_ns": 1788798560946240124,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_mem.txt",
    "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1",
    "bytes": 116,
    "mtime_ns": 1788798560987260031,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_ngram.txt",
    "sha256": "7aee6c252d1fc64ffc1d396b5e8d37d3be66e22a785afade923966b9d29a35f3",
    "bytes": 929,
    "mtime_ns": 1788798105713058757,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_q.log",
    "sha256": "5366a8dc19f9deeb3cc9225a8636ea4188302b47aa64c7c4d72b92d04d953a42",
    "bytes": 1433,
    "mtime_ns": 1788773176234259971,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_small.txt",
    "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1",
    "bytes": 116,
    "mtime_ns": 1788798149298446884,
    "observed_after_run_start": false
  }
]

````

## /tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-after/ssv-vision-serve.log

SHA-256 `eb961483be23d08a98e832da3947712539f86e1472dd588546422cba8e49d7b5`.

````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (27.0 GB reclaimable now), 40.2 GB Metal working set
  target: 14.5 GB total for this process
  cache:  ~23 of 512 experts per layer  (1101 global slots = 3.0 GB pool)
  expect: ~13.5 GB peak, ~5 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 3072 tokens per pass (~205 tok/s here; costs ~4.0 GB of the target)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~3.5 min before its first token here, follow-up turns read only what is new
  reuse:  up to 29658 tokens across 4 conversations (~1.2 GB), so a follow-up turn re-prefills only what is new
  note:   prefill and prefix retention reservations match the explicit runtime controls
engine ready in 0.8s: expert cache ~23/512 per layer (1101 global slots = 3.0 GB), eos [248044, 248046]
slotstream listening on http://127.0.0.1:11468
try it:
  curl localhost:11468/api/chat -d '{"model": "qwen3.8-flash-next:4bit", "messages": [{"role": "user", "content": "hello"}]}'
or point any Ollama or OpenAI client at http://localhost:11468
[4:30:45 AM] prefill: reading 2602 prompt tokens, ~13 s to the first token at this plan (follow-up turns read only what is new)
[4:30:55 AM] prefill: done, 2602 tokens in 10 s (260 tok/s)

````

## /tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-after/ssv_big.txt

SHA-256 `ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1`.

````text
The sky appears blue primarily due to a phenomenon called **Rayleigh scattering**.

### Step-by-Step Explanation:



````

## /tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-after/ssv_ctx.json

SHA-256 `4406c710022a6d46c4573dcbe22f4d8345496d71025b131c40c6f518d67dcde3`.

````text
{"aborted":null,"compute_key_extents":[256,512,768,1024,1280,1536,1792,2048],"compute_passes":[256,256,256,256,256,256,256,256],"compute_query_rows":[256,256,256,256,256,256,256,256],"configured_context":2064,"fits":false,"memory_ledger":{"active_capacity_bytes":84934656,"additional_active_bytes":0,"expected_peak_bytes":8997561600,"fixed_bytes":5300000000,"long_context_reserve_bytes":0,"mtp_resident_bytes":0,"planning_margin_bytes":1000000000,"pool_bytes":3364761600,"prefill_bytes":332800000,"retained_capacity_bytes":0,"retained_recurrent_bytes":0,"version":1,"vision_resident_bytes":0},"model_revision":"aa7c790e804bbf9d491ddb109c3d61bc4a555f7c","optimizations":{"adaptiveSpeculation":false,"boundedDraftTail":false,"boundedIndexer":false,"boundedOutputQueue":true,"boundedPLE":false,"boundedSweepRows":false,"cachedRouterWeights":false,"compactIndexerRaw":false,"compactMTPRow":true,"compactNgramRows":false,"compactScopeFrontier":false,"compactStateWindows":true,"compiledNormFinish":false,"completePromptCheckpoint":true,"contiguousSlotWrites":false,"cpuSlotWrites":false,"deduplicateImages":false,"demandedPrefillOutput":false,"denseExpertLookup":false,"denseIndexerBypass":false,"deviceSamplerDraw":true,"directReadHandles":false,"disjointSweepOutput":false,"fusedGDNProjection":false,"fusedGDNRecording":false,"fusedRoPE":true,"incrementalIndexer":false,"indexerBlockTopK":false,"layerExpertWorkspace":false,"layerLocalFloorCache":false,"ngramLookahead":false,"ngramRingOrder":false,"overlapResidentExperts":false,"overlapSharedExpert":false,"prefixCheckpointTokens":256,"readScopeTokens":0,"resolvedRuntimeBudget":false,"responsiveGovernor":true,"reuseFirstMTPEntry":false,"routerTopK":false,"selectedTextAttention":false,"sharedRoPE":true,"skipUnusedFinalForward":true,"sparsePoolPins":false,"tailAwarePrefill":false,"terminalLastQuery":false,"terminalPrefillPruning":false,"valueOnlySamplerThreshold":true,"visionAttentionPadding":0,"visionQueryTile":0,"wordSlotWrites":false,"workspacePiecewiseWrites":false,"workspaceTokenTile":256},"output_ids":[20,12364,5020,220,23,13,271,248068,271,248069,271,27775,383,279,795,3766],"pass_timings":[{"from":0,"seconds":4.0970660419999998,"tokens":256},{"from":256,"seconds":4.4497477500000002,"tokens":256},{"from":512,"seconds":3.9545352079999994,"tokens":256},{"from":768,"seconds":4.6128779590000004,"tokens":256},{"from":1024,"seconds":4.7384612080000004,"tokens":256},{"from":1280,"seconds":3.9919003750000002,"tokens":256},{"from":1536,"seconds":3.4892883330000011,"tokens":256},{"from":1792,"seconds":5.0650984999999977,"tokens":256}],"passes":[256,256,256,256,256,256,256,256],"peak_rss_gb":3.0997053440000002,"plan_expected_peak_gb":8.9975615999999992,"prefill_chunk":256,"prefill_seconds":34.400163249999999,"prefill_tok_s":59.534601191173131,"prefill_tokens":2048,"process_peak_bound_gb":7.5466706800000001,"prompt_ids":[1905,1716,13,13190,220,15,25,279,11661,383,1500,220,15,4800,220,18,22,7896,506,220,15,25,15,15,11,321,51715,220,15,12364,5020,220,15,13,13190,220,16,25,279,11661,383,1500,220,16,4800,220,21,23,7896,506,220,16,25,15,22,11,321,51715,220,16,18,12364,5020,220,16,13,13190,220,17,25,279,11661,383,1500,220,17,4800,220,24,24,7896,506,220,17,25,16,19,11,321,51715,220,17,21,12364,5020,220,17,13,13190,220,18,25,279,11661,383,1500,220,18,4800,220,16,18,15,7896,506,220,18,25,17,16,11,321,51715,220,18,24,12364,5020,220,18,13,13190,220,19,25,279,11661,383,1500,220,19,4800,220,16,21,16,7896,506,220,19,25,17,23,11,321,51715,220,20,17,12364,5020,220,19,13,13190,220,20,25,279,11661,383,1500,220,20,4800,220,16,24,17,7896,506,220,20,25,18,20,11,321,51715,220,21,20,12364,5020,220,20,13,13190,220,21,25,279,11661,383,1500,220,21,4800,220,17,17,18,7896,506,220,21,25,19,17,11,321,51715,220,22,23,12364,5020,220,21,13,13190,220,22,25,279,11661,383,1500,220,22,4800,220,17,20,19,7896,506,220,22,25,19,24,11,321,51715,220,24,16,12364,5020,220,22,13,13190,220,23,25,279,11661,383,1500,220,23,4800,220,17,23,20,7896,506,220,23,25,20,21,11,321,51715,220,16,15,19,12364,5020,220,23,13,13190,220,24,25,279,11661,383,1500,220,24,4800,220,18,16,21,7896,506,220,24,25,15,18,11,321,51715,220,16,16,22,12364,5020,220,24,13,13190,220,16,15,25,279,11661,383,1500,220,16,15,4800,220,18,19,22,7896,506,220,16,15,25,16,15,11,321,51715,220,16,18,15,12364,5020,220,16,15,13,13190,220,16,16,25,279,11661,383,1500,220,16,16,4800,220,18,22,23,7896,506,220,16,16,25,16,22,11,321,51715,220,16,19,18,12364,5020,220,16,16,13,13190,220,16,17,25,279,11661,383,1500,220,16,17,4800,220,19,15,24,7896,506,220,16,17,25,17,19,11,321,51715,220,16,20,21,12364,5020,220,16,17,13,13190,220,16,18,25,279,11661,383,1500,220,16,18,4800,220,19,19,15,7896,506,220,16,18,25,18,16,11,321,51715,220,16,21,24,12364,5020,220,16,18,13,13190,220,16,19,25,279,11661,383,1500,220,16,19,4800,220,19,22,16,7896,506,220,16,19,25,18,23,11,321,51715,220,16,23,17,12364,5020,220,16,19,13,13190,220,16,20,25,279,11661,383,1500,220,16,20,4800,220,20,15,17,7896,506,220,16,20,25,19,20,11,321,51715,220,16,24,20,12364,5020,220,16,20,13,13190,220,16,21,25,279,11661,383,1500,220,16,21,4800,220,20,18,18,7896,506,220,16,21,25,20,17,11,321,51715,220,17,15,23,12364,5020,220,16,21,13,13190,220,16,22,25,279,11661,383,1500,220,16,22,4800,220,21,19,7896,506,220,16,22,25,20,24,11,321,51715,220,17,17,16,12364,5020,220,16,22,13,13190,220,16,23,25,279,11661,383,1500,220,16,23,4800,220,24,20,7896,506,220,16,23,25,15,21,11,321,51715,220,17,18,19,12364,5020,220,16,23,13,13190,220,16,24,25,279,11661,383,1500,220,16,24,4800,220,16,17,21,7896,506,220,16,24,25,16,18,11,321,51715,220,17,19,22,12364,5020,220,16,24,13,13190,220,17,15,25,279,11661,383,1500,220,17,15,4800,220,16,20,22,7896,506,220,17,15,25,17,15,11,321,51715,220,17,21,15,12364,5020,220,17,15,13,13190,220,17,16,25,279,11661,383,1500,220,17,16,4800,220,16,23,23,7896,506,220,17,16,25,17,22,11,321,51715,220,17,22,18,12364,5020,220,17,16,13,13190,220,17,17,25,279,11661,383,1500,220,17,17,4800,220,17,16,24,7896,506,220,17,17,25,18,19,11,321,51715,220,17,23,21,12364,5020,220,17,17,13,13190,220,17,18,25,279,11661,383,1500,220,17,18,4800,220,17,20,15,7896,506,220,17,18,25,19,16,11,321,51715,220,17,24,24,12364,5020,220,17,18,13,13190,220,17,19,25,279,11661,383,1500,220,17,19,4800,220,17,23,16,7896,506,220,15,25,19,23,11,321,51715,220,18,16,17,12364,5020,220,17,19,13,13190,220,17,20,25,279,11661,383,1500,220,17,20,4800,220,18,16,17,7896,506,220,16,25,20,20,11,321,51715,220,18,17,20,12364,5020,220,17,20,13,13190,220,17,21,25,279,11661,383,1500,220,17,21,4800,220,18,19,18,7896,506,220,17,25,15,17,11,321,51715,220,18,18,23,12364,5020,220,17,21,13,13190,220,17,22,25,279,11661,383,1500,220,17,22,4800,220,18,22,19,7896,506,220,18,25,15,24,11,321,51715,220,18,20,16,12364,5020,220,17,22,13,13190,220,17,23,25,279,11661,383,1500,220,17,23,4800,220,19,15,20,7896,506,220,19,25,16,21,11,321,51715,220,18,21,19,12364,5020,220,17,23,13,13190,220,17,24,25,279,11661,383,1500,220,17,24,4800,220,19,18,21,7896,506,220,20,25,17,18,11,321,51715,220,18,22,22,12364,5020,220,17,24,13,13190,220,18,15,25,279,11661,383,1500,220,18,15,4800,220,19,21,22,7896,506,220,21,25,18,15,11,321,51715,220,18,24,15,12364,5020,220,18,15,13,13190,220,18,16,25,279,11661,383,1500,220,18,16,4800,220,19,24,23,7896,506,220,22,25,18,22,11,321,51715,220,19,15,18,12364,5020,220,18,16,13,13190,220,18,17,25,279,11661,383,1500,220,18,17,4800,220,20,17,24,7896,506,220,23,25,19,19,11,321,51715,220,19,16,21,12364,5020,220,18,17,13,13190,220,18,18,25,279,11661,383,1500,220,18,18,4800,220,21,15,7896,506,220,24,25,20,16,11,321,51715,220,19,17,24,12364,5020,220,18,18,13,13190,220,18,19,25,279,11661,383,1500,220,18,19,4800,220,24,16,7896,506,220,16,15,25,20,23,11,321,51715,220,19,19,17,12364,5020,220,18,19,13,13190,220,18,20,25,279,11661,383,1500,220,18,20,4800,220,16,17,17,7896,506,220,16,16,25,15,20,11,321,51715,220,19,20,20,12364,5020,220,18,20,13,13190,220,18,21,25,279,11661,383,1500,220,18,21,4800,220,16,20,18,7896,506,220,16,17,25,16,17,11,321,51715,220,19,21,23,12364,5020,220,18,21,13,13190,220,18,22,25,279,11661,383,1500,220,18,22,4800,220,16,23,19,7896,506,220,16,18,25,16,24,11,321,51715,220,19,23,16,12364,5020,220,18,22,13,13190,220,18,23,25,279,11661,383,1500,220,18,23,4800,220,17,16,20,7896,506,220,16,19,25,17,21,11,321,51715,220,19,24,19,12364,5020,220,18,23,13,13190,220,18,24,25,279,11661,383,1500,220,18,24,4800,220,17,19,21,7896,506,220,16,20,25,18,18,11,321,51715,220,20,15,22,12364,5020,220,18,24,13,13190,220,19,15,25,279,11661,383,1500,220,19,15,4800,220,17,22,22,7896,506,220,16,21,25,19,15,11,321,51715,220,20,17,15,12364,5020,220,19,15,13,13190,220,19,16,25,279,11661,383,1500,220,19,16,4800,220,18,15,23,7896,506,220,16,22,25,19,22,11,321,51715,220,20,18,18,12364,5020,220,19,16,13,13190,220,19,17,25,279,11661,383,1500,220,19,17,4800,220,18,18,24,7896,506,220,16,23,25,20,19,11,321,51715,220,20,19,21,12364,5020,220,19,17,13,13190,220,19,18,25,279,11661,383,1500,220,19,18,4800,220,18,22,15,7896,506,220,16,24,25,15,16,11,321,51715,220,20,20,24,12364,5020,220,19,18,13,13190,220,19,19,25,279,11661,383,1500,220,19,19,4800,220,19,15,16,7896,506,220,17,15,25,15,23,11,321,51715,220,20,22,17,12364,5020,220,19,19,13,13190,220,19,20,25,279,11661,383,1500,220,19,20,4800,220,19,18,17,7896,506,220,17,16,25,16,20,11,321,51715,220,20,23,20,12364,5020,220,19,20,13,13190,220,19,21,25,279,11661,383,1500,220,19,21,4800,220,19,21,18,7896,506,220,17,17,25,17,17,11,321,51715,220,20,24,23,12364,5020,220,19,21,13,13190,220,19,22,25,279,11661,383,1500,220,19,22,4800,220,19,24,19,7896,506,220,17,18,25,17,24,11,321,51715,220,21,16,16,12364,5020,220,19,22,13,13190,220,19,23,25,279,11661,383,1500,220,19,23,4800,220,20,17,20,7896,506,220,15,25,18,21,11,321,51715,220,21,17,19,12364,5020,220,19,23,13,13190,220,19,24,25,279,11661,383,1500,220,19,24,4800,220,20,21,7896,506,220,16,25,19,18,11,321,51715,220,21,18,22,12364,5020,220,19,24,13,13190,220,20,15,25,279,11661,383,1500,220,20,15,4800,220,23,22,7896,506,220,17,25,20,15,11,321,51715,220,21,20,15,12364,5020,220,20,15,13,13190,220,20,16,25,279,11661,383,1500,220,20,16,4800,220,16,16,23,7896,506,220,18,25,20,22,11,321,51715,220,21,21,18,12364,5020,220,20,16,13,13190,220,20,17,25,279,11661,383,1500,220,20,17,4800,220,16,19,24,7896,506,220,19,25,15,19,11,321,51715,220,21,22,21,12364,5020,220,20,17,13,13190,220,20,18,25,279,11661,383,1500,220,20,18,4800,220,16,23,15,7896,506,220,20,25,16,16,11,321,51715,220,21,23,24,12364,5020,220,20,18,13,13190,220,20,19,25,279,11661,383,1500,220,20,19,4800,220,17,16,16,7896,506,220,21,25,16,23,11,321,51715,220,22,15,17,12364,5020,220,20,19,13,13190,220,20,20,25,279,11661,383,1500,220,20,20,4800,220,17,19,17,7896,506,220,22,25,17,20,11,321,51715,220,22,16],"reply_tokens":16,"retained_after":{"allocated_sequence_bytes":0,"charged_token_capacity":0,"checkpoint_fork_failures":0,"checkpoint_hits":0,"checkpoint_stores":0,"conversations":0,"enabled":false,"evictions":0,"held_gb":0,"held_images":0,"held_tokens":0,"hits":0,"max_conversations":4,"max_tokens":0,"misses":0,"reusable_checkpoints":0},"retained_before":{"allocated_sequence_bytes":0,"charged_token_capacity":0,"checkpoint_fork_failures":0,"checkpoint_hits":0,"checkpoint_stores":0,"conversations":0,"enabled":false,"evictions":0,"held_gb":0,"held_images":0,"held_tokens":0,"hits":0,"max_conversations":4,"max_tokens":0,"misses":0,"reusable_checkpoints":0},"stats":{"abortedReadScopes":0,"acceptedDrafts":0,"adaptiveDraftDepths":[],"adaptivePlainTokens":0,"allocatedSequenceBytes":84934656,"cachedRouterBytes":0,"completePromptHits":0,"completePromptStores":0,"contextArithmetic":"standard","decodeForwardPasses":15,"decodeIOSeconds":1.0320985169999994,"decodeLocalVictims":0,"decodeModelTokens":15,"decodeReadBytes":10625126400,"decodeRecords":3843,"decodeScatterSeconds":0.019348508000000004,"decodeSeconds":3.1622564999999998,"decodeSlotCPUBatches":0,"decodeSlotScatterBatches":703,"decodeSlotSliceBatches":0,"decodeSlotSliceRuns":0,"decodeSlotWordBatches":0,"decodeSlotWordBuffers":0,"decodeTokens":16,"draftedTokens":0,"draftSeconds":0,"embeddingCachedPayloadBytes":47520,"embeddingCachedRows":33,"embeddingRowHits":192,"embeddingRowMisses":33,"embeddingRowsEnabled":true,"encodedImages":0,"expertHitRate":0.46625,"finishReason":"length","firstTokenSeconds":34.408024625000003,"fusedGDNProjectionsScheduled":0,"fusedRoPERotationsScheduled":912,"generatorSystemAfter":{"lowPowerModeEnabled":false,"thermalState":"fair"},"generatorSystemBefore":{"lowPowerModeEnabled":false,"thermalState":"fair"},"generatorVMAfter":{"reclaimableBytes":20604223488,"swapins":44120778,"swapouts":77538158},"generatorVMBefore":{"reclaimableBytes":19574669312,"swapins":44120734,"swapouts":77538158},"imageEncodeSeconds":1.67e-07,"interTokenSeconds":[0.57137691700000004,0.21596395900000001,0.18012300000000001,0.27154774999999998,0.2226505,0.172543958,0.21142466600000001,0.247896792,0.14916708300000001,0.118593083,0.12594491699999999,0.202564666,0.146311833,0.15644216699999999,0.1685015],"lifetimeRSSPeakBytes":3099705344,"memoryPressureCancelled":false,"mlxActiveEndBytes":6144019304,"mlxCacheEndBytes":719987111,"mlxPeakMemoryGB":6.5286884599999997,"ngramCachedRows":7424,"ngramCachePayloadBytes":4751360,"ngramLookaheadDiscarded":0,"ngramLookaheadRows":0,"ngramLookaheadWaitSeconds":0,"ngramPrefetchSeconds":0.21589312600000002,"ngramRowHits":80,"ngramRowMisses":160,"packedGDNProjectionLayers":0,"packedGDNProjectionPayloadBytes":0,"peakMemoryGB":7.5466706800000001,"physicalFootprintEndBytes":7546670680,"prefillComputeKeyExtents":[256,512,768,1024,1280,1536,1792,2048],"prefillComputePasses":[256,256,256,256,256,256,256,256],"prefillComputeQueryRows":[256,256,256,256,256,256,256,256],"prefillGPUWaitSeconds":2.2461236280000034,"prefillIOSeconds":23.279393959000011,"prefillLocalVictims":0,"prefillMLXActiveBytes":6234720456,"prefillMLXCacheBytes":539796010,"prefillPasses":[256,256,256,256,256,256,256,256],"prefillPhysicalFootprintBytes":7440584232,"prefillReadBytes":231278284800,"prefillRecords":83651,"prefillRowSortSeconds":0.012948125000000001,"prefillScatterSeconds":0.6296387069999998,"prefillSeconds":34.400163249999999,"prefillSlotCPUBatches":0,"prefillSlotSliceBatches":0,"prefillSlotWordBatches":0,"prefillTokens":2048,"prefixCheckpointErrors":0,"prefixCheckpointForks":0,"prefixCheckpointRefusals":2,"prefixCheckpointStores":0,"prefixSkippedImages":0,"preparationSeconds":3.0829999999999991e-06,"promptTokens":2048,"queueSeconds":1.5e-05,"reconciledHeadTokens":0,"reconciliationSeconds":0,"requestSeconds":37.569476666,"residentExpertJoins":0,"residentExpertJoinSeconds":0,"residentExpertPrelaunches":0,"reusedHeadTokens":0,"reusedImageFeatures":0,"reusedPrefixTokens":0,"ropeTableBuilds":27,"ropeTableHits":609,"sampledFootprint":{"intervalMilliseconds":20,"peakBytes":7546670680,"samples":1880},"sampleSeconds":0.00483075,"sharedExpertPrelaunches":0,"smallPrefillSweeps":0,"terminalMoERowsSkipped":0,"terminalQueryRowsSkipped":0,"tokenCallbackSeconds":5.2519999999999999e-06,"verifyPasses":0,"verifySeconds":0,"visionQueryTile":0,"visionQueryTileCalls":0},"text":"5 filed note 8.\n\n<think>\n\n<\/think>\n\nBased on the data provided","tokens":2048,"verdict":"EXCLUDED: swap activity or missing memory observations during the request","warmup":[]}

````

## /tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-after/ssv_long.txt

SHA-256 `32e15bd0df7b057f31b74f94a24c179d4374c19ddc54b77d590e330710fc8f78`.

````text
The archive records that the vault combination is SEVENTEEN. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. 

Question: what is the vault combination? Answer with one word.

````

## /tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-after/ssv_longmem.err

SHA-256 `09ef2aa12e83980f5bc605539bc49dc0c853f84ce38ddc1ed1b5c0473f3d438f`.

````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (25.3 GB reclaimable now), 40.2 GB Metal working set
  target: 10.0 GB total for this process
  cache:  ~20 of 512 experts per layer  (961 global slots = 2.7 GB pool)
  expect: ~9.0 GB peak, ~4 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 13382 tokens across 4 conversations (~0.7 GB), so a follow-up turn re-prefills only what is new
engine ready in 1.1s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]
prompt tokens: 7972 (~1.6 min to the first token at this plan)
  prefill: reading 7972 prompt tokens, ~1.6 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/7972 tokens (26%), ~1.3 min left
  prefill: 4096/7972 tokens (51%), ~49 s left
  prefill: 6144/7972 tokens (77%), ~23 s left
  prefill: done, 7972 tokens in 1.7 min (79 tok/s)

-- prefill 7972 tok in 101.47s (78.6 tok/s)
-- prefill split: io 68.08s + scatter 0.01s | 300548 records (831.0 GB, 12.2 GB/s)
-- decode 4 tok in 1.54s (2.60 tok/s)
-- decode split: io 0.81s + scatter 0.01s | 1215 records
-- expert cache ~20/512 experts per layer, hit rate 0.367 | ngram rows 24h/40m | sampled footprint peak 7.225 GB | total 103.0s

````

## /tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-after/ssv_longmem.json

SHA-256 `f7316907168f1ba77705fdfffa844cd241361e3967406c4d9a5e180de729be9e`.

````text
{"effective_expected_peak_gb":8.9994969600000001,"effective_mtp":false,"effective_pool_slots":961,"effective_prefill_chunk":256,"effective_prefill_cost_gb":0.33279999999999998,"encode_seconds":0.043512041000000001,"experimental_memory_family":false,"extra_expert_workspace_gb":0,"extra_read_scope_allowance_gb":0,"extra_router_cache_gb":0,"launch_seconds":112.30348650000001,"load_seconds":9.2465720410000003,"optimizations":{"adaptiveSpeculation":false,"boundedDraftTail":false,"boundedIndexer":false,"boundedOutputQueue":true,"boundedPLE":false,"boundedSweepRows":false,"cachedRouterWeights":false,"compactIndexerRaw":false,"compactMTPRow":true,"compactNgramRows":false,"compactScopeFrontier":false,"compactStateWindows":true,"compiledNormFinish":false,"completePromptCheckpoint":true,"contiguousSlotWrites":false,"cpuSlotWrites":false,"deduplicateImages":false,"demandedPrefillOutput":false,"denseExpertLookup":false,"denseIndexerBypass":false,"deviceSamplerDraw":true,"directReadHandles":false,"disjointSweepOutput":false,"fusedGDNProjection":false,"fusedGDNRecording":false,"fusedRoPE":true,"incrementalIndexer":false,"indexerBlockTopK":false,"layerExpertWorkspace":false,"layerLocalFloorCache":false,"ngramLookahead":false,"ngramRingOrder":false,"overlapResidentExperts":false,"overlapSharedExpert":false,"prefixCheckpointTokens":256,"readScopeTokens":0,"resolvedRuntimeBudget":false,"responsiveGovernor":true,"reuseFirstMTPEntry":false,"routerTopK":false,"selectedTextAttention":false,"sharedRoPE":true,"skipUnusedFinalForward":true,"sparsePoolPins":false,"tailAwarePrefill":false,"terminalLastQuery":false,"terminalPrefillPruning":false,"valueOnlySamplerThreshold":true,"visionAttentionPadding":0,"visionQueryTile":0,"wordSlotWrites":false,"workspacePiecewiseWrites":false,"workspaceTokenTile":256},"output_ids":[896,6571,36,923],"plan":{"availability_clamped":false,"context_qualification":false,"device_available_gb":25.300000000000001,"device_ram_gb":51.5,"device_working_set_gb":40.200000000000003,"est_prefill_s_at_max_context":385.50588235294038,"est_prefill_tok_s":85,"est_warm_tok_s":4.0041666666666664,"expected_peak_gb":9,"experts_per_layer_cached":20,"fully_resident":false,"implementation_context_limit":65536,"max_context_tokens":32768,"max_prefill_wait_minutes":30,"max_ram_percent":70,"memory_ledger":{"active_capacity_bytes":905969664,"additional_active_bytes":0,"expected_peak_bytes":8999496960,"fixed_bytes":5300000000,"long_context_reserve_bytes":0,"mtp_resident_bytes":0,"planning_margin_bytes":1000000000,"pool_bytes":2656972800,"prefill_bytes":332800000,"retained_capacity_bytes":369985536,"retained_recurrent_bytes":339738624,"version":1,"vision_resident_bytes":0},"model_context_limit":262144,"mtp":false,"mtp_context_limit":65536,"pool_gb":2.7000000000000002,"pool_slots":961,"prefill_chunk":256,"prefill_wait_scope":"accepted_request_to_first_model_token","prefix_cache_max_tokens":13382,"runtime_prefix_cache_enabled":true,"source":"--memory-gb","target_gb":10,"vision":true,"vision_charged_gb":0,"vision_context_limit":65536,"vision_resident_gb":0.90000000000000002,"vision_resident_reserved":false},"prompt_ids":[248045,846,198,760,17593,7189,421,279,33439,10286,369,4890,6571,36,923,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,4558,14162,25,1092,369,279,33439,10286,30,21134,440,799,3299,13,248046,198,248045,74455,198,248068,271,248069,271],"sampling":{"greedy":true,"requested_max_tokens":"16","seed":"default"},"schema_version":1,"stats":{"abortedReadScopes":0,"acceptedDrafts":0,"adaptiveDraftDepths":[],"adaptivePlainTokens":0,"allocatedSequenceBytes":226492416,"cachedRouterBytes":0,"completePromptHits":0,"completePromptStores":0,"contextArithmetic":"standard","decodeForwardPasses":4,"decodeIOSeconds":0.81036200700000083,"decodeLocalVictims":0,"decodeModelTokens":4,"decodeReadBytes":3359232000,"decodeRecords":1215,"decodeScatterSeconds":0.005080085000000001,"decodeSeconds":1.540870875,"decodeSlotCPUBatches":0,"decodeSlotScatterBatches":192,"decodeSlotSliceBatches":0,"decodeSlotSliceRuns":0,"decodeSlotWordBatches":0,"decodeSlotWordBuffers":0,"decodeTokens":4,"draftedTokens":0,"draftSeconds":0,"embeddingCachedPayloadBytes":84960,"embeddingCachedRows":59,"embeddingRowHits":920,"embeddingRowMisses":59,"embeddingRowsEnabled":true,"encodedImages":0,"expertHitRate":0.3671875,"finishReason":"stop","firstTextSeconds":101.47328475,"firstTokenSeconds":101.473104875,"fusedGDNProjectionsScheduled":0,"fusedRoPERotationsScheduled":1536,"generatorSystemAfter":{"lowPowerModeEnabled":false,"thermalState":"fair"},"generatorSystemBefore":{"lowPowerModeEnabled":false,"thermalState":"fair"},"generatorVMAfter":{"reclaimableBytes":21380530176,"swapins":44120707,"swapouts":77538158},"generatorVMBefore":{"reclaimableBytes":20393934848,"swapins":44120691,"swapouts":77538158},"imageEncodeSeconds":4.1000000000000003e-08,"interTokenSeconds":[0.59595808400000005,0.38868566700000001,0.34795208300000002],"lifetimeRSSPeakBytes":3126296576,"memoryPressureCancelled":false,"mlxActiveEndBytes":5722671768,"mlxCacheEndBytes":538606215,"mlxPeakMemoryGB":6.2833595559999997,"ngramCachedRows":1192,"ngramCachePayloadBytes":762880,"ngramLookaheadDiscarded":0,"ngramLookaheadRows":0,"ngramLookaheadWaitSeconds":0,"ngramPrefetchSeconds":0.032217294,"ngramRowHits":24,"ngramRowMisses":40,"packedGDNProjectionLayers":0,"packedGDNProjectionPayloadBytes":0,"peakMemoryGB":7.2093571040000004,"physicalFootprintEndBytes":7209357104,"prefillComputeKeyExtents":[256,512,768,1024,1280,1536,1792,2048,2304,2560,2816,3072,3328,3584,3840,4096,4352,4608,4864,5120,5376,5632,5888,6144,6400,6656,6912,7168,7424,7680,7936,7972],"prefillComputePasses":[256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,36],"prefillComputeQueryRows":[256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,36],"prefillGPUWaitSeconds":7.8501545680000175,"prefillIOSeconds":68.077866301999848,"prefillLocalVictims":0,"prefillMLXActiveBytes":5722074264,"prefillMLXCacheBytes":535987502,"prefillPasses":[256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,36],"prefillPhysicalFootprintBytes":7205719856,"prefillReadBytes":830955110400,"prefillRecords":300548,"prefillRowSortSeconds":0.049211010000000055,"prefillScatterSeconds":0.010002626000000002,"prefillSeconds":101.468526583,"prefillSlotCPUBatches":0,"prefillSlotSliceBatches":0,"prefillSlotWordBatches":0,"prefillTokens":7972,"prefixCheckpointErrors":0,"prefixCheckpointForks":0,"prefixCheckpointRefusals":1,"prefixCheckpointStores":1,"prefixSkippedImages":0,"preparationSeconds":0.043548583999999994,"promptTokens":7972,"queueSeconds":4.583e-06,"reconciledHeadTokens":0,"reconciliationSeconds":0,"requestSeconds":103.056491959,"residentExpertJoins":0,"residentExpertJoinSeconds":0,"residentExpertPrelaunches":0,"reusedHeadTokens":0,"reusedImageFeatures":0,"reusedPrefixTokens":0,"ropeTableBuilds":61,"ropeTableHits":1043,"sampledFootprint":{"intervalMilliseconds":20,"peakBytes":7224889136,"samples":5152},"sampleSeconds":0.0023479579999999998,"sharedExpertPrelaunches":0,"smallPrefillSweeps":0,"terminalMoERowsSkipped":0,"terminalQueryRowsSkipped":0,"tokenCallbackSeconds":0.00036849999999999996,"verifyPasses":0,"verifySeconds":0,"visionQueryTile":0,"visionQueryTileCalls":0},"text":"SEVENTEEN"}
````

## /tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-after/ssv_longmem.txt

SHA-256 `2e9fad2e271de488677d33bde2dd661601317f58b374941e44c1d077da46ebe3`.

````text
SEVENTEEN

````

## /tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-after/ssv_mem.err

SHA-256 `3e273c369f5e1728c11ccc123d7da7fc5cc3970639e8061e6fe94c2c6f8ea916`.

````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (25.4 GB reclaimable now), 40.2 GB Metal working set
  target: 10.0 GB total for this process
  cache:  ~20 of 512 experts per layer  (961 global slots = 2.7 GB pool)
  expect: ~9.0 GB peak, ~4 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 13382 tokens across 4 conversations (~0.7 GB), so a follow-up turn re-prefills only what is new
engine ready in 1.2s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]
prompt tokens: 18 (~0 s to the first token at this plan)

-- prefill 18 tok in 1.24s (14.6 tok/s)
-- prefill split: io 0.74s + scatter 0.00s | 3420 records (9.5 GB, 12.8 GB/s)
-- decode 24 tok in 3.67s (6.54 tok/s)
-- decode split: io 1.67s + scatter 0.02s | 6252 records
-- expert cache ~20/512 experts per layer, hit rate 0.434 | ngram rows 0h/368m | sampled footprint peak 6.169 GB | total 4.9s

````

## /tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-after/ssv_mem.json

SHA-256 `e3af6d1688321e272e87c06f8c267ca61da528ec7d4b415828b99913d1840f26`.

````text
{"effective_expected_peak_gb":8.9994969600000001,"effective_mtp":false,"effective_pool_slots":961,"effective_prefill_chunk":256,"effective_prefill_cost_gb":0.33279999999999998,"encode_seconds":0.011641500000000001,"experimental_memory_family":false,"extra_expert_workspace_gb":0,"extra_read_scope_allowance_gb":0,"extra_router_cache_gb":0,"launch_seconds":14.142910166,"load_seconds":9.2195342910000004,"optimizations":{"adaptiveSpeculation":false,"boundedDraftTail":false,"boundedIndexer":false,"boundedOutputQueue":true,"boundedPLE":false,"boundedSweepRows":false,"cachedRouterWeights":false,"compactIndexerRaw":false,"compactMTPRow":true,"compactNgramRows":false,"compactScopeFrontier":false,"compactStateWindows":true,"compiledNormFinish":false,"completePromptCheckpoint":true,"contiguousSlotWrites":false,"cpuSlotWrites":false,"deduplicateImages":false,"demandedPrefillOutput":false,"denseExpertLookup":false,"denseIndexerBypass":false,"deviceSamplerDraw":true,"directReadHandles":false,"disjointSweepOutput":false,"fusedGDNProjection":false,"fusedGDNRecording":false,"fusedRoPE":true,"incrementalIndexer":false,"indexerBlockTopK":false,"layerExpertWorkspace":false,"layerLocalFloorCache":false,"ngramLookahead":false,"ngramRingOrder":false,"overlapResidentExperts":false,"overlapSharedExpert":false,"prefixCheckpointTokens":256,"readScopeTokens":0,"resolvedRuntimeBudget":false,"responsiveGovernor":true,"reuseFirstMTPEntry":false,"routerTopK":false,"selectedTextAttention":false,"sharedRoPE":true,"skipUnusedFinalForward":true,"sparsePoolPins":false,"tailAwarePrefill":false,"terminalLastQuery":false,"terminalPrefillPruning":false,"valueOnlySamplerThreshold":true,"visionAttentionPadding":0,"visionQueryTile":0,"wordSlotWrites":false,"workspacePiecewiseWrites":false,"workspaceTokenTile":256},"output_ids":[760,12515,7701,6105,15048,4016,310,264,24057,2512,2972,28232,60845,69377,159034,271,13962,14392,13909,12,8046,68868,25,271],"plan":{"availability_clamped":false,"context_qualification":false,"device_available_gb":25.399999999999999,"device_ram_gb":51.5,"device_working_set_gb":40.200000000000003,"est_prefill_s_at_max_context":385.50588235294038,"est_prefill_tok_s":85,"est_warm_tok_s":4.0041666666666664,"expected_peak_gb":9,"experts_per_layer_cached":20,"fully_resident":false,"implementation_context_limit":65536,"max_context_tokens":32768,"max_prefill_wait_minutes":30,"max_ram_percent":70,"memory_ledger":{"active_capacity_bytes":905969664,"additional_active_bytes":0,"expected_peak_bytes":8999496960,"fixed_bytes":5300000000,"long_context_reserve_bytes":0,"mtp_resident_bytes":0,"planning_margin_bytes":1000000000,"pool_bytes":2656972800,"prefill_bytes":332800000,"retained_capacity_bytes":369985536,"retained_recurrent_bytes":339738624,"version":1,"vision_resident_bytes":0},"model_context_limit":262144,"mtp":false,"mtp_context_limit":65536,"pool_gb":2.7000000000000002,"pool_slots":961,"prefill_chunk":256,"prefill_wait_scope":"accepted_request_to_first_model_token","prefix_cache_max_tokens":13382,"runtime_prefix_cache_enabled":true,"source":"--memory-gb","target_gb":10,"vision":true,"vision_charged_gb":0,"vision_context_limit":65536,"vision_resident_gb":0.90000000000000002,"vision_resident_reserved":false},"prompt_ids":[248045,846,198,9930,369,279,12515,6105,30,248046,198,248045,74455,198,248068,271,248069,271],"sampling":{"greedy":true,"requested_max_tokens":"24","seed":"default"},"schema_version":1,"stats":{"abortedReadScopes":0,"acceptedDrafts":0,"adaptiveDraftDepths":[],"adaptivePlainTokens":0,"allocatedSequenceBytes":28311552,"cachedRouterBytes":0,"completePromptHits":0,"completePromptStores":1,"contextArithmetic":"standard","decodeForwardPasses":23,"decodeIOSeconds":1.6734944880000004,"decodeLocalVictims":0,"decodeModelTokens":23,"decodeReadBytes":17285529600,"decodeRecords":6252,"decodeScatterSeconds":0.019828660000000019,"decodeSeconds":3.6720429999999999,"decodeSlotCPUBatches":0,"decodeSlotScatterBatches":1092,"decodeSlotSliceBatches":0,"decodeSlotSliceRuns":0,"decodeSlotWordBatches":0,"decodeSlotWordBuffers":0,"decodeTokens":24,"draftedTokens":0,"draftSeconds":0,"embeddingCachedPayloadBytes":48960,"embeddingCachedRows":34,"embeddingRowHits":3,"embeddingRowMisses":34,"embeddingRowsEnabled":true,"encodedImages":0,"expertHitRate":0.43369565217391304,"finishReason":"length","firstTextSeconds":1.2398992499999999,"firstTokenSeconds":1.2396129170000001,"fusedGDNProjectionsScheduled":0,"fusedRoPERotationsScheduled":576,"generatorSystemAfter":{"lowPowerModeEnabled":false,"thermalState":"fair"},"generatorSystemBefore":{"lowPowerModeEnabled":false,"thermalState":"fair"},"generatorVMAfter":{"reclaimableBytes":19549061120,"swapins":44120687,"swapouts":77538158},"generatorVMBefore":{"reclaimableBytes":20337000448,"swapins":44120687,"swapouts":77538158},"imageEncodeSeconds":1.67e-07,"interTokenSeconds":[0.21483745900000001,0.227587875,0.15421162499999999,0.135535292,0.160679708,0.14128754099999999,0.13770312500000001,0.121132792,0.143649625,0.14362770799999999,0.17100795899999999,0.18917100000000001,0.12255408399999999,0.13135733299999999,0.197554958,0.16560433299999999,0.127062125,0.13379687500000001,0.12006412499999999,0.21079933300000001,0.14174824999999999,0.191848458,0.18875779200000001],"lifetimeRSSPeakBytes":3175022592,"memoryPressureCancelled":false,"mlxActiveEndBytes":5522447512,"mlxCacheEndBytes":35234484,"mlxPeakMemoryGB":5.6205251140000003,"ngramCachedRows":656,"ngramCachePayloadBytes":419840,"ngramLookaheadDiscarded":0,"ngramLookaheadRows":0,"ngramLookaheadWaitSeconds":0,"ngramPrefetchSeconds":0.016073083000000002,"ngramRowHits":0,"ngramRowMisses":368,"packedGDNProjectionLayers":0,"packedGDNProjectionPayloadBytes":0,"peakMemoryGB":6.1689070160000004,"physicalFootprintEndBytes":6168907016,"prefillComputeKeyExtents":[18],"prefillComputePasses":[18],"prefillComputeQueryRows":[18],"prefillGPUWaitSeconds":0,"prefillIOSeconds":0.73648537799999991,"prefillLocalVictims":0,"prefillMLXActiveBytes":5378829464,"prefillMLXCacheBytes":35070908,"prefillPasses":[18],"prefillPhysicalFootprintBytes":6021745904,"prefillReadBytes":9455616000,"prefillRecords":3420,"prefillRowSortSeconds":0,"prefillScatterSeconds":0.003819874,"prefillSeconds":1.23556675,"prefillSlotCPUBatches":0,"prefillSlotSliceBatches":0,"prefillSlotWordBatches":0,"prefillTokens":18,"prefixCheckpointErrors":0,"prefixCheckpointForks":0,"prefixCheckpointRefusals":0,"prefixCheckpointStores":0,"prefixSkippedImages":0,"preparationSeconds":0.011671582999999999,"promptTokens":18,"queueSeconds":5.1669999999999998e-06,"reconciledHeadTokens":0,"reconciliationSeconds":0,"requestSeconds":4.9230227920000003,"residentExpertJoins":0,"residentExpertJoinSeconds":0,"residentExpertPrelaunches":0,"reusedHeadTokens":0,"reusedImageFeatures":0,"reusedPrefixTokens":0,"ropeTableBuilds":24,"ropeTableHits":264,"sampledFootprint":{"intervalMilliseconds":20,"peakBytes":6168907016,"samples":247},"sampleSeconds":0.0058787090000000002,"sharedExpertPrelaunches":0,"smallPrefillSweeps":0,"terminalMoERowsSkipped":0,"terminalQueryRowsSkipped":0,"tokenCallbackSeconds":0.0012391239999999999,"verifyPasses":0,"verifySeconds":0,"visionQueryTile":0,"visionQueryTileCalls":0},"text":"The sky appears blue primarily due to a phenomenon called **Rayleigh scattering**.\n\n### Step-by-Step Explanation:\n\n"}
````

## /tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-after/ssv_mem.txt

SHA-256 `ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1`.

````text
The sky appears blue primarily due to a phenomenon called **Rayleigh scattering**.

### Step-by-Step Explanation:



````

## /tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-after/ssv_ngram.txt

SHA-256 `7aee6c252d1fc64ffc1d396b5e8d37d3be66e22a785afade923966b9d29a35f3`.

````text
16410909,39682429,55103279,60931720,87006904,116506179,131512017,152932897,169641436,182022480,209277433,237891023,256841529,277007269,290665954,300984276
18158303,36390029,45652312,70783524,98191154,114024957,127804916,159566246,175132467,192583600,217919476,237199054,259336807,261799367,289359313,307699687
14018266,20311704,43480436,63941281,95787780,113074662,139009389,153597172,176521398,195310421,213995347,230817794,250415398,270032340,289909058,309324234
19328306,31622976,57795084,66463709,93919746,116410415,120151274,145148395,173389511,188877183,200309508,238866090,246672398,274484811,290423659,310127336
5058702,22280190,50893597,78955315,97296665,116744385,125916430,144813497,168457659,191037312,207392458,222765427,244080806,265398615,299171972,308041519
12491660,20431478,44408400,65983911,98770238,116367196,122763968,157962372,172188198,192734484,216716967,225308066,255605896,265905913,289339931,306513116

````

## /tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-after/ssv_q.log

SHA-256 `5366a8dc19f9deeb3cc9225a8636ea4188302b47aa64c7c4d72b92d04d953a42`.

````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (29.6 GB reclaimable now), 40.2 GB Metal working set
  target: 10.0 GB total for this process
  cache:  ~20 of 512 experts per layer  (961 global slots = 2.7 GB pool)
  expect: ~9.0 GB peak, ~4 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 13382 tokens across 4 conversations (~0.7 GB), so a follow-up turn re-prefills only what is new
engine ready in 0.8s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]
elastic: off — an explicit size is pinned; omit the size flag for elastic auto
slotstream listening on http://127.0.0.1:11467
try it:
  curl localhost:11467/api/chat -d '{"model": "qwen3.8-flash-next:4bit", "messages": [{"role": "user", "content": "hello"}]}'
or point any Ollama or OpenAI client at http://localhost:11467

````

## /tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-after/ssv_small.txt

SHA-256 `ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1`.

````text
The sky appears blue primarily due to a phenomenon called **Rayleigh scattering**.

### Step-by-Step Explanation:



````

## /tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-before/inventory.json

SHA-256 `ef23015919d193cb1241f60998eaa2d4329d06718e28644096d5cdd7c98a1c5e`.

````text
[
  {
    "path": "/tmp/ssv-vision-serve.log",
    "sha256": "eb961483be23d08a98e832da3947712539f86e1472dd588546422cba8e49d7b5",
    "bytes": 1637,
    "mtime_ns": 1788773455723424906,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_big.txt",
    "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1",
    "bytes": 116,
    "mtime_ns": 1788798135087159710,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_ctx.json",
    "sha256": "4406c710022a6d46c4573dcbe22f4d8345496d71025b131c40c6f518d67dcde3",
    "bytes": 15271,
    "mtime_ns": 1788798721018224823,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_long.txt",
    "sha256": "32e15bd0df7b057f31b74f94a24c179d4374c19ddc54b77d590e330710fc8f78",
    "bytes": 50993,
    "mtime_ns": 1788798561062459645,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_longmem.err",
    "sha256": "09ef2aa12e83980f5bc605539bc49dc0c853f84ce38ddc1ed1b5c0473f3d438f",
    "bytes": 1834,
    "mtime_ns": 1788798673421914320,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_longmem.json",
    "sha256": "f7316907168f1ba77705fdfffa844cd241361e3967406c4d9a5e180de729be9e",
    "bytes": 47781,
    "mtime_ns": 1788798673421269440,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_longmem.txt",
    "sha256": "2e9fad2e271de488677d33bde2dd661601317f58b374941e44c1d077da46ebe3",
    "bytes": 10,
    "mtime_ns": 1788798673493505155,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_mem.err",
    "sha256": "3e273c369f5e1728c11ccc123d7da7fc5cc3970639e8061e6fe94c2c6f8ea916",
    "bytes": 1506,
    "mtime_ns": 1788798560947204504,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_mem.json",
    "sha256": "e3af6d1688321e272e87c06f8c267ca61da528ec7d4b415828b99913d1840f26",
    "bytes": 7324,
    "mtime_ns": 1788798560946240124,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_mem.txt",
    "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1",
    "bytes": 116,
    "mtime_ns": 1788798560987260031,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_ngram.txt",
    "sha256": "7aee6c252d1fc64ffc1d396b5e8d37d3be66e22a785afade923966b9d29a35f3",
    "bytes": 929,
    "mtime_ns": 1788798105713058757,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_q.log",
    "sha256": "5366a8dc19f9deeb3cc9225a8636ea4188302b47aa64c7c4d72b92d04d953a42",
    "bytes": 1433,
    "mtime_ns": 1788773176234259971,
    "observed_after_run_start": false
  },
  {
    "path": "/tmp/ssv_small.txt",
    "sha256": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1",
    "bytes": 116,
    "mtime_ns": 1788798149298446884,
    "observed_after_run_start": false
  }
]

````

## /tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-before/ssv-vision-serve.log

SHA-256 `eb961483be23d08a98e832da3947712539f86e1472dd588546422cba8e49d7b5`.

````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (27.0 GB reclaimable now), 40.2 GB Metal working set
  target: 14.5 GB total for this process
  cache:  ~23 of 512 experts per layer  (1101 global slots = 3.0 GB pool)
  expect: ~13.5 GB peak, ~5 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 3072 tokens per pass (~205 tok/s here; costs ~4.0 GB of the target)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~3.5 min before its first token here, follow-up turns read only what is new
  reuse:  up to 29658 tokens across 4 conversations (~1.2 GB), so a follow-up turn re-prefills only what is new
  note:   prefill and prefix retention reservations match the explicit runtime controls
engine ready in 0.8s: expert cache ~23/512 per layer (1101 global slots = 3.0 GB), eos [248044, 248046]
slotstream listening on http://127.0.0.1:11468
try it:
  curl localhost:11468/api/chat -d '{"model": "qwen3.8-flash-next:4bit", "messages": [{"role": "user", "content": "hello"}]}'
or point any Ollama or OpenAI client at http://localhost:11468
[4:30:45 AM] prefill: reading 2602 prompt tokens, ~13 s to the first token at this plan (follow-up turns read only what is new)
[4:30:55 AM] prefill: done, 2602 tokens in 10 s (260 tok/s)

````

## /tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-before/ssv_big.txt

SHA-256 `ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1`.

````text
The sky appears blue primarily due to a phenomenon called **Rayleigh scattering**.

### Step-by-Step Explanation:



````

## /tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-before/ssv_ctx.json

SHA-256 `4406c710022a6d46c4573dcbe22f4d8345496d71025b131c40c6f518d67dcde3`.

````text
{"aborted":null,"compute_key_extents":[256,512,768,1024,1280,1536,1792,2048],"compute_passes":[256,256,256,256,256,256,256,256],"compute_query_rows":[256,256,256,256,256,256,256,256],"configured_context":2064,"fits":false,"memory_ledger":{"active_capacity_bytes":84934656,"additional_active_bytes":0,"expected_peak_bytes":8997561600,"fixed_bytes":5300000000,"long_context_reserve_bytes":0,"mtp_resident_bytes":0,"planning_margin_bytes":1000000000,"pool_bytes":3364761600,"prefill_bytes":332800000,"retained_capacity_bytes":0,"retained_recurrent_bytes":0,"version":1,"vision_resident_bytes":0},"model_revision":"aa7c790e804bbf9d491ddb109c3d61bc4a555f7c","optimizations":{"adaptiveSpeculation":false,"boundedDraftTail":false,"boundedIndexer":false,"boundedOutputQueue":true,"boundedPLE":false,"boundedSweepRows":false,"cachedRouterWeights":false,"compactIndexerRaw":false,"compactMTPRow":true,"compactNgramRows":false,"compactScopeFrontier":false,"compactStateWindows":true,"compiledNormFinish":false,"completePromptCheckpoint":true,"contiguousSlotWrites":false,"cpuSlotWrites":false,"deduplicateImages":false,"demandedPrefillOutput":false,"denseExpertLookup":false,"denseIndexerBypass":false,"deviceSamplerDraw":true,"directReadHandles":false,"disjointSweepOutput":false,"fusedGDNProjection":false,"fusedGDNRecording":false,"fusedRoPE":true,"incrementalIndexer":false,"indexerBlockTopK":false,"layerExpertWorkspace":false,"layerLocalFloorCache":false,"ngramLookahead":false,"ngramRingOrder":false,"overlapResidentExperts":false,"overlapSharedExpert":false,"prefixCheckpointTokens":256,"readScopeTokens":0,"resolvedRuntimeBudget":false,"responsiveGovernor":true,"reuseFirstMTPEntry":false,"routerTopK":false,"selectedTextAttention":false,"sharedRoPE":true,"skipUnusedFinalForward":true,"sparsePoolPins":false,"tailAwarePrefill":false,"terminalLastQuery":false,"terminalPrefillPruning":false,"valueOnlySamplerThreshold":true,"visionAttentionPadding":0,"visionQueryTile":0,"wordSlotWrites":false,"workspacePiecewiseWrites":false,"workspaceTokenTile":256},"output_ids":[20,12364,5020,220,23,13,271,248068,271,248069,271,27775,383,279,795,3766],"pass_timings":[{"from":0,"seconds":4.0970660419999998,"tokens":256},{"from":256,"seconds":4.4497477500000002,"tokens":256},{"from":512,"seconds":3.9545352079999994,"tokens":256},{"from":768,"seconds":4.6128779590000004,"tokens":256},{"from":1024,"seconds":4.7384612080000004,"tokens":256},{"from":1280,"seconds":3.9919003750000002,"tokens":256},{"from":1536,"seconds":3.4892883330000011,"tokens":256},{"from":1792,"seconds":5.0650984999999977,"tokens":256}],"passes":[256,256,256,256,256,256,256,256],"peak_rss_gb":3.0997053440000002,"plan_expected_peak_gb":8.9975615999999992,"prefill_chunk":256,"prefill_seconds":34.400163249999999,"prefill_tok_s":59.534601191173131,"prefill_tokens":2048,"process_peak_bound_gb":7.5466706800000001,"prompt_ids":[1905,1716,13,13190,220,15,25,279,11661,383,1500,220,15,4800,220,18,22,7896,506,220,15,25,15,15,11,321,51715,220,15,12364,5020,220,15,13,13190,220,16,25,279,11661,383,1500,220,16,4800,220,21,23,7896,506,220,16,25,15,22,11,321,51715,220,16,18,12364,5020,220,16,13,13190,220,17,25,279,11661,383,1500,220,17,4800,220,24,24,7896,506,220,17,25,16,19,11,321,51715,220,17,21,12364,5020,220,17,13,13190,220,18,25,279,11661,383,1500,220,18,4800,220,16,18,15,7896,506,220,18,25,17,16,11,321,51715,220,18,24,12364,5020,220,18,13,13190,220,19,25,279,11661,383,1500,220,19,4800,220,16,21,16,7896,506,220,19,25,17,23,11,321,51715,220,20,17,12364,5020,220,19,13,13190,220,20,25,279,11661,383,1500,220,20,4800,220,16,24,17,7896,506,220,20,25,18,20,11,321,51715,220,21,20,12364,5020,220,20,13,13190,220,21,25,279,11661,383,1500,220,21,4800,220,17,17,18,7896,506,220,21,25,19,17,11,321,51715,220,22,23,12364,5020,220,21,13,13190,220,22,25,279,11661,383,1500,220,22,4800,220,17,20,19,7896,506,220,22,25,19,24,11,321,51715,220,24,16,12364,5020,220,22,13,13190,220,23,25,279,11661,383,1500,220,23,4800,220,17,23,20,7896,506,220,23,25,20,21,11,321,51715,220,16,15,19,12364,5020,220,23,13,13190,220,24,25,279,11661,383,1500,220,24,4800,220,18,16,21,7896,506,220,24,25,15,18,11,321,51715,220,16,16,22,12364,5020,220,24,13,13190,220,16,15,25,279,11661,383,1500,220,16,15,4800,220,18,19,22,7896,506,220,16,15,25,16,15,11,321,51715,220,16,18,15,12364,5020,220,16,15,13,13190,220,16,16,25,279,11661,383,1500,220,16,16,4800,220,18,22,23,7896,506,220,16,16,25,16,22,11,321,51715,220,16,19,18,12364,5020,220,16,16,13,13190,220,16,17,25,279,11661,383,1500,220,16,17,4800,220,19,15,24,7896,506,220,16,17,25,17,19,11,321,51715,220,16,20,21,12364,5020,220,16,17,13,13190,220,16,18,25,279,11661,383,1500,220,16,18,4800,220,19,19,15,7896,506,220,16,18,25,18,16,11,321,51715,220,16,21,24,12364,5020,220,16,18,13,13190,220,16,19,25,279,11661,383,1500,220,16,19,4800,220,19,22,16,7896,506,220,16,19,25,18,23,11,321,51715,220,16,23,17,12364,5020,220,16,19,13,13190,220,16,20,25,279,11661,383,1500,220,16,20,4800,220,20,15,17,7896,506,220,16,20,25,19,20,11,321,51715,220,16,24,20,12364,5020,220,16,20,13,13190,220,16,21,25,279,11661,383,1500,220,16,21,4800,220,20,18,18,7896,506,220,16,21,25,20,17,11,321,51715,220,17,15,23,12364,5020,220,16,21,13,13190,220,16,22,25,279,11661,383,1500,220,16,22,4800,220,21,19,7896,506,220,16,22,25,20,24,11,321,51715,220,17,17,16,12364,5020,220,16,22,13,13190,220,16,23,25,279,11661,383,1500,220,16,23,4800,220,24,20,7896,506,220,16,23,25,15,21,11,321,51715,220,17,18,19,12364,5020,220,16,23,13,13190,220,16,24,25,279,11661,383,1500,220,16,24,4800,220,16,17,21,7896,506,220,16,24,25,16,18,11,321,51715,220,17,19,22,12364,5020,220,16,24,13,13190,220,17,15,25,279,11661,383,1500,220,17,15,4800,220,16,20,22,7896,506,220,17,15,25,17,15,11,321,51715,220,17,21,15,12364,5020,220,17,15,13,13190,220,17,16,25,279,11661,383,1500,220,17,16,4800,220,16,23,23,7896,506,220,17,16,25,17,22,11,321,51715,220,17,22,18,12364,5020,220,17,16,13,13190,220,17,17,25,279,11661,383,1500,220,17,17,4800,220,17,16,24,7896,506,220,17,17,25,18,19,11,321,51715,220,17,23,21,12364,5020,220,17,17,13,13190,220,17,18,25,279,11661,383,1500,220,17,18,4800,220,17,20,15,7896,506,220,17,18,25,19,16,11,321,51715,220,17,24,24,12364,5020,220,17,18,13,13190,220,17,19,25,279,11661,383,1500,220,17,19,4800,220,17,23,16,7896,506,220,15,25,19,23,11,321,51715,220,18,16,17,12364,5020,220,17,19,13,13190,220,17,20,25,279,11661,383,1500,220,17,20,4800,220,18,16,17,7896,506,220,16,25,20,20,11,321,51715,220,18,17,20,12364,5020,220,17,20,13,13190,220,17,21,25,279,11661,383,1500,220,17,21,4800,220,18,19,18,7896,506,220,17,25,15,17,11,321,51715,220,18,18,23,12364,5020,220,17,21,13,13190,220,17,22,25,279,11661,383,1500,220,17,22,4800,220,18,22,19,7896,506,220,18,25,15,24,11,321,51715,220,18,20,16,12364,5020,220,17,22,13,13190,220,17,23,25,279,11661,383,1500,220,17,23,4800,220,19,15,20,7896,506,220,19,25,16,21,11,321,51715,220,18,21,19,12364,5020,220,17,23,13,13190,220,17,24,25,279,11661,383,1500,220,17,24,4800,220,19,18,21,7896,506,220,20,25,17,18,11,321,51715,220,18,22,22,12364,5020,220,17,24,13,13190,220,18,15,25,279,11661,383,1500,220,18,15,4800,220,19,21,22,7896,506,220,21,25,18,15,11,321,51715,220,18,24,15,12364,5020,220,18,15,13,13190,220,18,16,25,279,11661,383,1500,220,18,16,4800,220,19,24,23,7896,506,220,22,25,18,22,11,321,51715,220,19,15,18,12364,5020,220,18,16,13,13190,220,18,17,25,279,11661,383,1500,220,18,17,4800,220,20,17,24,7896,506,220,23,25,19,19,11,321,51715,220,19,16,21,12364,5020,220,18,17,13,13190,220,18,18,25,279,11661,383,1500,220,18,18,4800,220,21,15,7896,506,220,24,25,20,16,11,321,51715,220,19,17,24,12364,5020,220,18,18,13,13190,220,18,19,25,279,11661,383,1500,220,18,19,4800,220,24,16,7896,506,220,16,15,25,20,23,11,321,51715,220,19,19,17,12364,5020,220,18,19,13,13190,220,18,20,25,279,11661,383,1500,220,18,20,4800,220,16,17,17,7896,506,220,16,16,25,15,20,11,321,51715,220,19,20,20,12364,5020,220,18,20,13,13190,220,18,21,25,279,11661,383,1500,220,18,21,4800,220,16,20,18,7896,506,220,16,17,25,16,17,11,321,51715,220,19,21,23,12364,5020,220,18,21,13,13190,220,18,22,25,279,11661,383,1500,220,18,22,4800,220,16,23,19,7896,506,220,16,18,25,16,24,11,321,51715,220,19,23,16,12364,5020,220,18,22,13,13190,220,18,23,25,279,11661,383,1500,220,18,23,4800,220,17,16,20,7896,506,220,16,19,25,17,21,11,321,51715,220,19,24,19,12364,5020,220,18,23,13,13190,220,18,24,25,279,11661,383,1500,220,18,24,4800,220,17,19,21,7896,506,220,16,20,25,18,18,11,321,51715,220,20,15,22,12364,5020,220,18,24,13,13190,220,19,15,25,279,11661,383,1500,220,19,15,4800,220,17,22,22,7896,506,220,16,21,25,19,15,11,321,51715,220,20,17,15,12364,5020,220,19,15,13,13190,220,19,16,25,279,11661,383,1500,220,19,16,4800,220,18,15,23,7896,506,220,16,22,25,19,22,11,321,51715,220,20,18,18,12364,5020,220,19,16,13,13190,220,19,17,25,279,11661,383,1500,220,19,17,4800,220,18,18,24,7896,506,220,16,23,25,20,19,11,321,51715,220,20,19,21,12364,5020,220,19,17,13,13190,220,19,18,25,279,11661,383,1500,220,19,18,4800,220,18,22,15,7896,506,220,16,24,25,15,16,11,321,51715,220,20,20,24,12364,5020,220,19,18,13,13190,220,19,19,25,279,11661,383,1500,220,19,19,4800,220,19,15,16,7896,506,220,17,15,25,15,23,11,321,51715,220,20,22,17,12364,5020,220,19,19,13,13190,220,19,20,25,279,11661,383,1500,220,19,20,4800,220,19,18,17,7896,506,220,17,16,25,16,20,11,321,51715,220,20,23,20,12364,5020,220,19,20,13,13190,220,19,21,25,279,11661,383,1500,220,19,21,4800,220,19,21,18,7896,506,220,17,17,25,17,17,11,321,51715,220,20,24,23,12364,5020,220,19,21,13,13190,220,19,22,25,279,11661,383,1500,220,19,22,4800,220,19,24,19,7896,506,220,17,18,25,17,24,11,321,51715,220,21,16,16,12364,5020,220,19,22,13,13190,220,19,23,25,279,11661,383,1500,220,19,23,4800,220,20,17,20,7896,506,220,15,25,18,21,11,321,51715,220,21,17,19,12364,5020,220,19,23,13,13190,220,19,24,25,279,11661,383,1500,220,19,24,4800,220,20,21,7896,506,220,16,25,19,18,11,321,51715,220,21,18,22,12364,5020,220,19,24,13,13190,220,20,15,25,279,11661,383,1500,220,20,15,4800,220,23,22,7896,506,220,17,25,20,15,11,321,51715,220,21,20,15,12364,5020,220,20,15,13,13190,220,20,16,25,279,11661,383,1500,220,20,16,4800,220,16,16,23,7896,506,220,18,25,20,22,11,321,51715,220,21,21,18,12364,5020,220,20,16,13,13190,220,20,17,25,279,11661,383,1500,220,20,17,4800,220,16,19,24,7896,506,220,19,25,15,19,11,321,51715,220,21,22,21,12364,5020,220,20,17,13,13190,220,20,18,25,279,11661,383,1500,220,20,18,4800,220,16,23,15,7896,506,220,20,25,16,16,11,321,51715,220,21,23,24,12364,5020,220,20,18,13,13190,220,20,19,25,279,11661,383,1500,220,20,19,4800,220,17,16,16,7896,506,220,21,25,16,23,11,321,51715,220,22,15,17,12364,5020,220,20,19,13,13190,220,20,20,25,279,11661,383,1500,220,20,20,4800,220,17,19,17,7896,506,220,22,25,17,20,11,321,51715,220,22,16],"reply_tokens":16,"retained_after":{"allocated_sequence_bytes":0,"charged_token_capacity":0,"checkpoint_fork_failures":0,"checkpoint_hits":0,"checkpoint_stores":0,"conversations":0,"enabled":false,"evictions":0,"held_gb":0,"held_images":0,"held_tokens":0,"hits":0,"max_conversations":4,"max_tokens":0,"misses":0,"reusable_checkpoints":0},"retained_before":{"allocated_sequence_bytes":0,"charged_token_capacity":0,"checkpoint_fork_failures":0,"checkpoint_hits":0,"checkpoint_stores":0,"conversations":0,"enabled":false,"evictions":0,"held_gb":0,"held_images":0,"held_tokens":0,"hits":0,"max_conversations":4,"max_tokens":0,"misses":0,"reusable_checkpoints":0},"stats":{"abortedReadScopes":0,"acceptedDrafts":0,"adaptiveDraftDepths":[],"adaptivePlainTokens":0,"allocatedSequenceBytes":84934656,"cachedRouterBytes":0,"completePromptHits":0,"completePromptStores":0,"contextArithmetic":"standard","decodeForwardPasses":15,"decodeIOSeconds":1.0320985169999994,"decodeLocalVictims":0,"decodeModelTokens":15,"decodeReadBytes":10625126400,"decodeRecords":3843,"decodeScatterSeconds":0.019348508000000004,"decodeSeconds":3.1622564999999998,"decodeSlotCPUBatches":0,"decodeSlotScatterBatches":703,"decodeSlotSliceBatches":0,"decodeSlotSliceRuns":0,"decodeSlotWordBatches":0,"decodeSlotWordBuffers":0,"decodeTokens":16,"draftedTokens":0,"draftSeconds":0,"embeddingCachedPayloadBytes":47520,"embeddingCachedRows":33,"embeddingRowHits":192,"embeddingRowMisses":33,"embeddingRowsEnabled":true,"encodedImages":0,"expertHitRate":0.46625,"finishReason":"length","firstTokenSeconds":34.408024625000003,"fusedGDNProjectionsScheduled":0,"fusedRoPERotationsScheduled":912,"generatorSystemAfter":{"lowPowerModeEnabled":false,"thermalState":"fair"},"generatorSystemBefore":{"lowPowerModeEnabled":false,"thermalState":"fair"},"generatorVMAfter":{"reclaimableBytes":20604223488,"swapins":44120778,"swapouts":77538158},"generatorVMBefore":{"reclaimableBytes":19574669312,"swapins":44120734,"swapouts":77538158},"imageEncodeSeconds":1.67e-07,"interTokenSeconds":[0.57137691700000004,0.21596395900000001,0.18012300000000001,0.27154774999999998,0.2226505,0.172543958,0.21142466600000001,0.247896792,0.14916708300000001,0.118593083,0.12594491699999999,0.202564666,0.146311833,0.15644216699999999,0.1685015],"lifetimeRSSPeakBytes":3099705344,"memoryPressureCancelled":false,"mlxActiveEndBytes":6144019304,"mlxCacheEndBytes":719987111,"mlxPeakMemoryGB":6.5286884599999997,"ngramCachedRows":7424,"ngramCachePayloadBytes":4751360,"ngramLookaheadDiscarded":0,"ngramLookaheadRows":0,"ngramLookaheadWaitSeconds":0,"ngramPrefetchSeconds":0.21589312600000002,"ngramRowHits":80,"ngramRowMisses":160,"packedGDNProjectionLayers":0,"packedGDNProjectionPayloadBytes":0,"peakMemoryGB":7.5466706800000001,"physicalFootprintEndBytes":7546670680,"prefillComputeKeyExtents":[256,512,768,1024,1280,1536,1792,2048],"prefillComputePasses":[256,256,256,256,256,256,256,256],"prefillComputeQueryRows":[256,256,256,256,256,256,256,256],"prefillGPUWaitSeconds":2.2461236280000034,"prefillIOSeconds":23.279393959000011,"prefillLocalVictims":0,"prefillMLXActiveBytes":6234720456,"prefillMLXCacheBytes":539796010,"prefillPasses":[256,256,256,256,256,256,256,256],"prefillPhysicalFootprintBytes":7440584232,"prefillReadBytes":231278284800,"prefillRecords":83651,"prefillRowSortSeconds":0.012948125000000001,"prefillScatterSeconds":0.6296387069999998,"prefillSeconds":34.400163249999999,"prefillSlotCPUBatches":0,"prefillSlotSliceBatches":0,"prefillSlotWordBatches":0,"prefillTokens":2048,"prefixCheckpointErrors":0,"prefixCheckpointForks":0,"prefixCheckpointRefusals":2,"prefixCheckpointStores":0,"prefixSkippedImages":0,"preparationSeconds":3.0829999999999991e-06,"promptTokens":2048,"queueSeconds":1.5e-05,"reconciledHeadTokens":0,"reconciliationSeconds":0,"requestSeconds":37.569476666,"residentExpertJoins":0,"residentExpertJoinSeconds":0,"residentExpertPrelaunches":0,"reusedHeadTokens":0,"reusedImageFeatures":0,"reusedPrefixTokens":0,"ropeTableBuilds":27,"ropeTableHits":609,"sampledFootprint":{"intervalMilliseconds":20,"peakBytes":7546670680,"samples":1880},"sampleSeconds":0.00483075,"sharedExpertPrelaunches":0,"smallPrefillSweeps":0,"terminalMoERowsSkipped":0,"terminalQueryRowsSkipped":0,"tokenCallbackSeconds":5.2519999999999999e-06,"verifyPasses":0,"verifySeconds":0,"visionQueryTile":0,"visionQueryTileCalls":0},"text":"5 filed note 8.\n\n<think>\n\n<\/think>\n\nBased on the data provided","tokens":2048,"verdict":"EXCLUDED: swap activity or missing memory observations during the request","warmup":[]}

````

## /tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-before/ssv_long.txt

SHA-256 `32e15bd0df7b057f31b74f94a24c179d4374c19ddc54b77d590e330710fc8f78`.

````text
The archive records that the vault combination is SEVENTEEN. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. 

Question: what is the vault combination? Answer with one word.

````

## /tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-before/ssv_longmem.err

SHA-256 `09ef2aa12e83980f5bc605539bc49dc0c853f84ce38ddc1ed1b5c0473f3d438f`.

````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (25.3 GB reclaimable now), 40.2 GB Metal working set
  target: 10.0 GB total for this process
  cache:  ~20 of 512 experts per layer  (961 global slots = 2.7 GB pool)
  expect: ~9.0 GB peak, ~4 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 13382 tokens across 4 conversations (~0.7 GB), so a follow-up turn re-prefills only what is new
engine ready in 1.1s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]
prompt tokens: 7972 (~1.6 min to the first token at this plan)
  prefill: reading 7972 prompt tokens, ~1.6 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/7972 tokens (26%), ~1.3 min left
  prefill: 4096/7972 tokens (51%), ~49 s left
  prefill: 6144/7972 tokens (77%), ~23 s left
  prefill: done, 7972 tokens in 1.7 min (79 tok/s)

-- prefill 7972 tok in 101.47s (78.6 tok/s)
-- prefill split: io 68.08s + scatter 0.01s | 300548 records (831.0 GB, 12.2 GB/s)
-- decode 4 tok in 1.54s (2.60 tok/s)
-- decode split: io 0.81s + scatter 0.01s | 1215 records
-- expert cache ~20/512 experts per layer, hit rate 0.367 | ngram rows 24h/40m | sampled footprint peak 7.225 GB | total 103.0s

````

## /tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-before/ssv_longmem.json

SHA-256 `f7316907168f1ba77705fdfffa844cd241361e3967406c4d9a5e180de729be9e`.

````text
{"effective_expected_peak_gb":8.9994969600000001,"effective_mtp":false,"effective_pool_slots":961,"effective_prefill_chunk":256,"effective_prefill_cost_gb":0.33279999999999998,"encode_seconds":0.043512041000000001,"experimental_memory_family":false,"extra_expert_workspace_gb":0,"extra_read_scope_allowance_gb":0,"extra_router_cache_gb":0,"launch_seconds":112.30348650000001,"load_seconds":9.2465720410000003,"optimizations":{"adaptiveSpeculation":false,"boundedDraftTail":false,"boundedIndexer":false,"boundedOutputQueue":true,"boundedPLE":false,"boundedSweepRows":false,"cachedRouterWeights":false,"compactIndexerRaw":false,"compactMTPRow":true,"compactNgramRows":false,"compactScopeFrontier":false,"compactStateWindows":true,"compiledNormFinish":false,"completePromptCheckpoint":true,"contiguousSlotWrites":false,"cpuSlotWrites":false,"deduplicateImages":false,"demandedPrefillOutput":false,"denseExpertLookup":false,"denseIndexerBypass":false,"deviceSamplerDraw":true,"directReadHandles":false,"disjointSweepOutput":false,"fusedGDNProjection":false,"fusedGDNRecording":false,"fusedRoPE":true,"incrementalIndexer":false,"indexerBlockTopK":false,"layerExpertWorkspace":false,"layerLocalFloorCache":false,"ngramLookahead":false,"ngramRingOrder":false,"overlapResidentExperts":false,"overlapSharedExpert":false,"prefixCheckpointTokens":256,"readScopeTokens":0,"resolvedRuntimeBudget":false,"responsiveGovernor":true,"reuseFirstMTPEntry":false,"routerTopK":false,"selectedTextAttention":false,"sharedRoPE":true,"skipUnusedFinalForward":true,"sparsePoolPins":false,"tailAwarePrefill":false,"terminalLastQuery":false,"terminalPrefillPruning":false,"valueOnlySamplerThreshold":true,"visionAttentionPadding":0,"visionQueryTile":0,"wordSlotWrites":false,"workspacePiecewiseWrites":false,"workspaceTokenTile":256},"output_ids":[896,6571,36,923],"plan":{"availability_clamped":false,"context_qualification":false,"device_available_gb":25.300000000000001,"device_ram_gb":51.5,"device_working_set_gb":40.200000000000003,"est_prefill_s_at_max_context":385.50588235294038,"est_prefill_tok_s":85,"est_warm_tok_s":4.0041666666666664,"expected_peak_gb":9,"experts_per_layer_cached":20,"fully_resident":false,"implementation_context_limit":65536,"max_context_tokens":32768,"max_prefill_wait_minutes":30,"max_ram_percent":70,"memory_ledger":{"active_capacity_bytes":905969664,"additional_active_bytes":0,"expected_peak_bytes":8999496960,"fixed_bytes":5300000000,"long_context_reserve_bytes":0,"mtp_resident_bytes":0,"planning_margin_bytes":1000000000,"pool_bytes":2656972800,"prefill_bytes":332800000,"retained_capacity_bytes":369985536,"retained_recurrent_bytes":339738624,"version":1,"vision_resident_bytes":0},"model_context_limit":262144,"mtp":false,"mtp_context_limit":65536,"pool_gb":2.7000000000000002,"pool_slots":961,"prefill_chunk":256,"prefill_wait_scope":"accepted_request_to_first_model_token","prefix_cache_max_tokens":13382,"runtime_prefix_cache_enabled":true,"source":"--memory-gb","target_gb":10,"vision":true,"vision_charged_gb":0,"vision_context_limit":65536,"vision_resident_gb":0.90000000000000002,"vision_resident_reserved":false},"prompt_ids":[248045,846,198,760,17593,7189,421,279,33439,10286,369,4890,6571,36,923,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,4558,14162,25,1092,369,279,33439,10286,30,21134,440,799,3299,13,248046,198,248045,74455,198,248068,271,248069,271],"sampling":{"greedy":true,"requested_max_tokens":"16","seed":"default"},"schema_version":1,"stats":{"abortedReadScopes":0,"acceptedDrafts":0,"adaptiveDraftDepths":[],"adaptivePlainTokens":0,"allocatedSequenceBytes":226492416,"cachedRouterBytes":0,"completePromptHits":0,"completePromptStores":0,"contextArithmetic":"standard","decodeForwardPasses":4,"decodeIOSeconds":0.81036200700000083,"decodeLocalVictims":0,"decodeModelTokens":4,"decodeReadBytes":3359232000,"decodeRecords":1215,"decodeScatterSeconds":0.005080085000000001,"decodeSeconds":1.540870875,"decodeSlotCPUBatches":0,"decodeSlotScatterBatches":192,"decodeSlotSliceBatches":0,"decodeSlotSliceRuns":0,"decodeSlotWordBatches":0,"decodeSlotWordBuffers":0,"decodeTokens":4,"draftedTokens":0,"draftSeconds":0,"embeddingCachedPayloadBytes":84960,"embeddingCachedRows":59,"embeddingRowHits":920,"embeddingRowMisses":59,"embeddingRowsEnabled":true,"encodedImages":0,"expertHitRate":0.3671875,"finishReason":"stop","firstTextSeconds":101.47328475,"firstTokenSeconds":101.473104875,"fusedGDNProjectionsScheduled":0,"fusedRoPERotationsScheduled":1536,"generatorSystemAfter":{"lowPowerModeEnabled":false,"thermalState":"fair"},"generatorSystemBefore":{"lowPowerModeEnabled":false,"thermalState":"fair"},"generatorVMAfter":{"reclaimableBytes":21380530176,"swapins":44120707,"swapouts":77538158},"generatorVMBefore":{"reclaimableBytes":20393934848,"swapins":44120691,"swapouts":77538158},"imageEncodeSeconds":4.1000000000000003e-08,"interTokenSeconds":[0.59595808400000005,0.38868566700000001,0.34795208300000002],"lifetimeRSSPeakBytes":3126296576,"memoryPressureCancelled":false,"mlxActiveEndBytes":5722671768,"mlxCacheEndBytes":538606215,"mlxPeakMemoryGB":6.2833595559999997,"ngramCachedRows":1192,"ngramCachePayloadBytes":762880,"ngramLookaheadDiscarded":0,"ngramLookaheadRows":0,"ngramLookaheadWaitSeconds":0,"ngramPrefetchSeconds":0.032217294,"ngramRowHits":24,"ngramRowMisses":40,"packedGDNProjectionLayers":0,"packedGDNProjectionPayloadBytes":0,"peakMemoryGB":7.2093571040000004,"physicalFootprintEndBytes":7209357104,"prefillComputeKeyExtents":[256,512,768,1024,1280,1536,1792,2048,2304,2560,2816,3072,3328,3584,3840,4096,4352,4608,4864,5120,5376,5632,5888,6144,6400,6656,6912,7168,7424,7680,7936,7972],"prefillComputePasses":[256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,36],"prefillComputeQueryRows":[256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,36],"prefillGPUWaitSeconds":7.8501545680000175,"prefillIOSeconds":68.077866301999848,"prefillLocalVictims":0,"prefillMLXActiveBytes":5722074264,"prefillMLXCacheBytes":535987502,"prefillPasses":[256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,36],"prefillPhysicalFootprintBytes":7205719856,"prefillReadBytes":830955110400,"prefillRecords":300548,"prefillRowSortSeconds":0.049211010000000055,"prefillScatterSeconds":0.010002626000000002,"prefillSeconds":101.468526583,"prefillSlotCPUBatches":0,"prefillSlotSliceBatches":0,"prefillSlotWordBatches":0,"prefillTokens":7972,"prefixCheckpointErrors":0,"prefixCheckpointForks":0,"prefixCheckpointRefusals":1,"prefixCheckpointStores":1,"prefixSkippedImages":0,"preparationSeconds":0.043548583999999994,"promptTokens":7972,"queueSeconds":4.583e-06,"reconciledHeadTokens":0,"reconciliationSeconds":0,"requestSeconds":103.056491959,"residentExpertJoins":0,"residentExpertJoinSeconds":0,"residentExpertPrelaunches":0,"reusedHeadTokens":0,"reusedImageFeatures":0,"reusedPrefixTokens":0,"ropeTableBuilds":61,"ropeTableHits":1043,"sampledFootprint":{"intervalMilliseconds":20,"peakBytes":7224889136,"samples":5152},"sampleSeconds":0.0023479579999999998,"sharedExpertPrelaunches":0,"smallPrefillSweeps":0,"terminalMoERowsSkipped":0,"terminalQueryRowsSkipped":0,"tokenCallbackSeconds":0.00036849999999999996,"verifyPasses":0,"verifySeconds":0,"visionQueryTile":0,"visionQueryTileCalls":0},"text":"SEVENTEEN"}
````

## /tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-before/ssv_longmem.txt

SHA-256 `2e9fad2e271de488677d33bde2dd661601317f58b374941e44c1d077da46ebe3`.

````text
SEVENTEEN

````

## /tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-before/ssv_mem.err

SHA-256 `3e273c369f5e1728c11ccc123d7da7fc5cc3970639e8061e6fe94c2c6f8ea916`.

````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (25.4 GB reclaimable now), 40.2 GB Metal working set
  target: 10.0 GB total for this process
  cache:  ~20 of 512 experts per layer  (961 global slots = 2.7 GB pool)
  expect: ~9.0 GB peak, ~4 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 13382 tokens across 4 conversations (~0.7 GB), so a follow-up turn re-prefills only what is new
engine ready in 1.2s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]
prompt tokens: 18 (~0 s to the first token at this plan)

-- prefill 18 tok in 1.24s (14.6 tok/s)
-- prefill split: io 0.74s + scatter 0.00s | 3420 records (9.5 GB, 12.8 GB/s)
-- decode 24 tok in 3.67s (6.54 tok/s)
-- decode split: io 1.67s + scatter 0.02s | 6252 records
-- expert cache ~20/512 experts per layer, hit rate 0.434 | ngram rows 0h/368m | sampled footprint peak 6.169 GB | total 4.9s

````

## /tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-before/ssv_mem.json

SHA-256 `e3af6d1688321e272e87c06f8c267ca61da528ec7d4b415828b99913d1840f26`.

````text
{"effective_expected_peak_gb":8.9994969600000001,"effective_mtp":false,"effective_pool_slots":961,"effective_prefill_chunk":256,"effective_prefill_cost_gb":0.33279999999999998,"encode_seconds":0.011641500000000001,"experimental_memory_family":false,"extra_expert_workspace_gb":0,"extra_read_scope_allowance_gb":0,"extra_router_cache_gb":0,"launch_seconds":14.142910166,"load_seconds":9.2195342910000004,"optimizations":{"adaptiveSpeculation":false,"boundedDraftTail":false,"boundedIndexer":false,"boundedOutputQueue":true,"boundedPLE":false,"boundedSweepRows":false,"cachedRouterWeights":false,"compactIndexerRaw":false,"compactMTPRow":true,"compactNgramRows":false,"compactScopeFrontier":false,"compactStateWindows":true,"compiledNormFinish":false,"completePromptCheckpoint":true,"contiguousSlotWrites":false,"cpuSlotWrites":false,"deduplicateImages":false,"demandedPrefillOutput":false,"denseExpertLookup":false,"denseIndexerBypass":false,"deviceSamplerDraw":true,"directReadHandles":false,"disjointSweepOutput":false,"fusedGDNProjection":false,"fusedGDNRecording":false,"fusedRoPE":true,"incrementalIndexer":false,"indexerBlockTopK":false,"layerExpertWorkspace":false,"layerLocalFloorCache":false,"ngramLookahead":false,"ngramRingOrder":false,"overlapResidentExperts":false,"overlapSharedExpert":false,"prefixCheckpointTokens":256,"readScopeTokens":0,"resolvedRuntimeBudget":false,"responsiveGovernor":true,"reuseFirstMTPEntry":false,"routerTopK":false,"selectedTextAttention":false,"sharedRoPE":true,"skipUnusedFinalForward":true,"sparsePoolPins":false,"tailAwarePrefill":false,"terminalLastQuery":false,"terminalPrefillPruning":false,"valueOnlySamplerThreshold":true,"visionAttentionPadding":0,"visionQueryTile":0,"wordSlotWrites":false,"workspacePiecewiseWrites":false,"workspaceTokenTile":256},"output_ids":[760,12515,7701,6105,15048,4016,310,264,24057,2512,2972,28232,60845,69377,159034,271,13962,14392,13909,12,8046,68868,25,271],"plan":{"availability_clamped":false,"context_qualification":false,"device_available_gb":25.399999999999999,"device_ram_gb":51.5,"device_working_set_gb":40.200000000000003,"est_prefill_s_at_max_context":385.50588235294038,"est_prefill_tok_s":85,"est_warm_tok_s":4.0041666666666664,"expected_peak_gb":9,"experts_per_layer_cached":20,"fully_resident":false,"implementation_context_limit":65536,"max_context_tokens":32768,"max_prefill_wait_minutes":30,"max_ram_percent":70,"memory_ledger":{"active_capacity_bytes":905969664,"additional_active_bytes":0,"expected_peak_bytes":8999496960,"fixed_bytes":5300000000,"long_context_reserve_bytes":0,"mtp_resident_bytes":0,"planning_margin_bytes":1000000000,"pool_bytes":2656972800,"prefill_bytes":332800000,"retained_capacity_bytes":369985536,"retained_recurrent_bytes":339738624,"version":1,"vision_resident_bytes":0},"model_context_limit":262144,"mtp":false,"mtp_context_limit":65536,"pool_gb":2.7000000000000002,"pool_slots":961,"prefill_chunk":256,"prefill_wait_scope":"accepted_request_to_first_model_token","prefix_cache_max_tokens":13382,"runtime_prefix_cache_enabled":true,"source":"--memory-gb","target_gb":10,"vision":true,"vision_charged_gb":0,"vision_context_limit":65536,"vision_resident_gb":0.90000000000000002,"vision_resident_reserved":false},"prompt_ids":[248045,846,198,9930,369,279,12515,6105,30,248046,198,248045,74455,198,248068,271,248069,271],"sampling":{"greedy":true,"requested_max_tokens":"24","seed":"default"},"schema_version":1,"stats":{"abortedReadScopes":0,"acceptedDrafts":0,"adaptiveDraftDepths":[],"adaptivePlainTokens":0,"allocatedSequenceBytes":28311552,"cachedRouterBytes":0,"completePromptHits":0,"completePromptStores":1,"contextArithmetic":"standard","decodeForwardPasses":23,"decodeIOSeconds":1.6734944880000004,"decodeLocalVictims":0,"decodeModelTokens":23,"decodeReadBytes":17285529600,"decodeRecords":6252,"decodeScatterSeconds":0.019828660000000019,"decodeSeconds":3.6720429999999999,"decodeSlotCPUBatches":0,"decodeSlotScatterBatches":1092,"decodeSlotSliceBatches":0,"decodeSlotSliceRuns":0,"decodeSlotWordBatches":0,"decodeSlotWordBuffers":0,"decodeTokens":24,"draftedTokens":0,"draftSeconds":0,"embeddingCachedPayloadBytes":48960,"embeddingCachedRows":34,"embeddingRowHits":3,"embeddingRowMisses":34,"embeddingRowsEnabled":true,"encodedImages":0,"expertHitRate":0.43369565217391304,"finishReason":"length","firstTextSeconds":1.2398992499999999,"firstTokenSeconds":1.2396129170000001,"fusedGDNProjectionsScheduled":0,"fusedRoPERotationsScheduled":576,"generatorSystemAfter":{"lowPowerModeEnabled":false,"thermalState":"fair"},"generatorSystemBefore":{"lowPowerModeEnabled":false,"thermalState":"fair"},"generatorVMAfter":{"reclaimableBytes":19549061120,"swapins":44120687,"swapouts":77538158},"generatorVMBefore":{"reclaimableBytes":20337000448,"swapins":44120687,"swapouts":77538158},"imageEncodeSeconds":1.67e-07,"interTokenSeconds":[0.21483745900000001,0.227587875,0.15421162499999999,0.135535292,0.160679708,0.14128754099999999,0.13770312500000001,0.121132792,0.143649625,0.14362770799999999,0.17100795899999999,0.18917100000000001,0.12255408399999999,0.13135733299999999,0.197554958,0.16560433299999999,0.127062125,0.13379687500000001,0.12006412499999999,0.21079933300000001,0.14174824999999999,0.191848458,0.18875779200000001],"lifetimeRSSPeakBytes":3175022592,"memoryPressureCancelled":false,"mlxActiveEndBytes":5522447512,"mlxCacheEndBytes":35234484,"mlxPeakMemoryGB":5.6205251140000003,"ngramCachedRows":656,"ngramCachePayloadBytes":419840,"ngramLookaheadDiscarded":0,"ngramLookaheadRows":0,"ngramLookaheadWaitSeconds":0,"ngramPrefetchSeconds":0.016073083000000002,"ngramRowHits":0,"ngramRowMisses":368,"packedGDNProjectionLayers":0,"packedGDNProjectionPayloadBytes":0,"peakMemoryGB":6.1689070160000004,"physicalFootprintEndBytes":6168907016,"prefillComputeKeyExtents":[18],"prefillComputePasses":[18],"prefillComputeQueryRows":[18],"prefillGPUWaitSeconds":0,"prefillIOSeconds":0.73648537799999991,"prefillLocalVictims":0,"prefillMLXActiveBytes":5378829464,"prefillMLXCacheBytes":35070908,"prefillPasses":[18],"prefillPhysicalFootprintBytes":6021745904,"prefillReadBytes":9455616000,"prefillRecords":3420,"prefillRowSortSeconds":0,"prefillScatterSeconds":0.003819874,"prefillSeconds":1.23556675,"prefillSlotCPUBatches":0,"prefillSlotSliceBatches":0,"prefillSlotWordBatches":0,"prefillTokens":18,"prefixCheckpointErrors":0,"prefixCheckpointForks":0,"prefixCheckpointRefusals":0,"prefixCheckpointStores":0,"prefixSkippedImages":0,"preparationSeconds":0.011671582999999999,"promptTokens":18,"queueSeconds":5.1669999999999998e-06,"reconciledHeadTokens":0,"reconciliationSeconds":0,"requestSeconds":4.9230227920000003,"residentExpertJoins":0,"residentExpertJoinSeconds":0,"residentExpertPrelaunches":0,"reusedHeadTokens":0,"reusedImageFeatures":0,"reusedPrefixTokens":0,"ropeTableBuilds":24,"ropeTableHits":264,"sampledFootprint":{"intervalMilliseconds":20,"peakBytes":6168907016,"samples":247},"sampleSeconds":0.0058787090000000002,"sharedExpertPrelaunches":0,"smallPrefillSweeps":0,"terminalMoERowsSkipped":0,"terminalQueryRowsSkipped":0,"tokenCallbackSeconds":0.0012391239999999999,"verifyPasses":0,"verifySeconds":0,"visionQueryTile":0,"visionQueryTileCalls":0},"text":"The sky appears blue primarily due to a phenomenon called **Rayleigh scattering**.\n\n### Step-by-Step Explanation:\n\n"}
````

## /tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-before/ssv_mem.txt

SHA-256 `ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1`.

````text
The sky appears blue primarily due to a phenomenon called **Rayleigh scattering**.

### Step-by-Step Explanation:



````

## /tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-before/ssv_ngram.txt

SHA-256 `7aee6c252d1fc64ffc1d396b5e8d37d3be66e22a785afade923966b9d29a35f3`.

````text
16410909,39682429,55103279,60931720,87006904,116506179,131512017,152932897,169641436,182022480,209277433,237891023,256841529,277007269,290665954,300984276
18158303,36390029,45652312,70783524,98191154,114024957,127804916,159566246,175132467,192583600,217919476,237199054,259336807,261799367,289359313,307699687
14018266,20311704,43480436,63941281,95787780,113074662,139009389,153597172,176521398,195310421,213995347,230817794,250415398,270032340,289909058,309324234
19328306,31622976,57795084,66463709,93919746,116410415,120151274,145148395,173389511,188877183,200309508,238866090,246672398,274484811,290423659,310127336
5058702,22280190,50893597,78955315,97296665,116744385,125916430,144813497,168457659,191037312,207392458,222765427,244080806,265398615,299171972,308041519
12491660,20431478,44408400,65983911,98770238,116367196,122763968,157962372,172188198,192734484,216716967,225308066,255605896,265905913,289339931,306513116

````

## /tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-before/ssv_q.log

SHA-256 `5366a8dc19f9deeb3cc9225a8636ea4188302b47aa64c7c4d72b92d04d953a42`.

````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (29.6 GB reclaimable now), 40.2 GB Metal working set
  target: 10.0 GB total for this process
  cache:  ~20 of 512 experts per layer  (961 global slots = 2.7 GB pool)
  expect: ~9.0 GB peak, ~4 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 13382 tokens across 4 conversations (~0.7 GB), so a follow-up turn re-prefills only what is new
engine ready in 0.8s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]
elastic: off — an explicit size is pinned; omit the size flag for elastic auto
slotstream listening on http://127.0.0.1:11467
try it:
  curl localhost:11467/api/chat -d '{"model": "qwen3.8-flash-next:4bit", "messages": [{"role": "user", "content": "hello"}]}'
or point any Ollama or OpenAI client at http://localhost:11467

````

## /tmp/slotstream-optimization-execution/verification-continuation-v314/legacy-output-before/ssv_small.txt

SHA-256 `ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1`.

````text
The sky appears blue primarily due to a phenomenon called **Rayleigh scattering**.

### Step-by-Step Explanation:



````

## /tmp/slotstream-optimization-execution/verification-continuation-v314/preparation.json

SHA-256 `c135d6ec8f4be13a07d206eecf50c68757e24e4741e9486eb07786560891c99d`.

````text
{
  "selected_script_sha256": "f4a37f5d5d5eb8b97c0147351e6966aeb1047f77e3e93f9ec6552b896667d79a",
  "wrapper_sha256": "cdd5fab9215b3fb281fcabec4b440b77ea4fd272a7ed9172d321b4edaf6186cc",
  "tail_is_exact_source_slice": true,
  "original_source_sha256": "4eb4c0990bb7a92141f9510800457985a9ed0c40b4db601d36acfd30cd9d65e4",
  "native_binary_unchanged": true,
  "gate_workloads_and_budgets_unchanged": true,
  "legacy_failure_replaced": false,
  "model_invoked": false
}

````

## /tmp/slotstream-optimization-execution/verification-continuation-v314/protocol.json

SHA-256 `cdcff65dcfb1b56c78d276d9d2ab0d8775d602e1bd9e75276c580f8a9e5c58b2`.

````text
{
  "classification": "Only the unchanged, previously unexecuted tail of full verification: behavioural quality, symlink model, API robustness, independent vision parity and original vision serving. The earlier full run and its resource failures remain mandatory failed evidence; success here cannot replace them or claim a full verification pass. VM recorded by outer ownership guard; no skipped tail gate can pass.",
  "frozen_at": "2026-09-07T16:44:58.961733+00:00",
  "deadline_utc": "2026-09-07T18:00:00Z",
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
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
      "source_archive_sha256": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
      "binary_sha256": "af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d",
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
  "native_contract_sha256": "dd1bada1296a7e69a034e7c674a92779b7d0f362dcd3dcfdb2cd2308baf8dbd0",
  "wrapper_sha256": "cdd5fab9215b3fb281fcabec4b440b77ea4fd272a7ed9172d321b4edaf6186cc",
  "policy": {
    "startup_reclaimable_bytes": 21000000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 17500000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 1200,
    "stop_on_new_swapouts": false
  },
  "environment": {
    "SLOTSTREAM_TEST_BINARY": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
    "SLOTSTREAM_VERIFY_OUT": "/Users/carlos/Projects/slotstream/.build/optimization/current-candidate-gates-v314/tail/verification"
  },
  "command": [
    "bash",
    "/tmp/slotstream-optimization-execution/verification-continuation-v314/verify-remaining.sh"
  ],
  "selected_script_sha256": "f4a37f5d5d5eb8b97c0147351e6966aeb1047f77e3e93f9ec6552b896667d79a",
  "verify_source_sha256": "4eb4c0990bb7a92141f9510800457985a9ed0c40b4db601d36acfd30cd9d65e4",
  "predecessor_manifest_sha256": "0cdec6c09d8cbd9edb612c561901cf1159126f9891b14b7b5469a80e3829be58",
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
    "Tools/optimization_results.py": "1842f0f1b0c39845272cd0babaf89a11a835035b20e6feb6191efb040c727b35",
    "Tools/optimization_results_test.py": "766c73cfabbc10c42549fe77a6f6f9a20a67e33c5d346b217587af6b688f38a1",
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
    "Tools/verify.sh": "4eb4c0990bb7a92141f9510800457985a9ed0c40b4db601d36acfd30cd9d65e4",
    "Tools/verify_binary_test.py": "b9caffe691a91a3ef8eb44aa543bc5d5c95354199f8537b5b73eeab91acbbdbd",
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

## /tmp/slotstream-optimization-execution/verification-continuation-v314/run.py

SHA-256 `cdd5fab9215b3fb281fcabec4b440b77ea4fd272a7ed9172d321b4edaf6186cc`.

````text
from pathlib import Path
import datetime,json,os,re,shutil,signal,sys,time
ROOT=Path('/Users/carlos/Projects/slotstream');P=Path(__file__).parent
sys.path.insert(0,str(ROOT/'Tools'))
from prefill_bench import digest,preflight,vm_snapshot
from serve_bench import competing_jobs,verified_build
from optimization_readiness import pressure_snapshot,require_normal
from optimization_serial_build import guarded_run
import optimization_campaign as campaign
B=ROOT/'.build/optimization/joined-state-eval-build-v304/candidate/slotstream'
OUT=ROOT/'.build/optimization/current-candidate-gates-v314/tail'
# The reservation must be granted by the peer before invocation; the argument
# binds a concrete handback deadline and never authorizes extending it.
DEADLINE=datetime.datetime.fromisoformat(sys.argv[1].replace('Z','+00:00')).timestamp()
remaining=int(DEADLINE-time.time()-30)
if remaining<900:raise RuntimeError('remaining verification gates require at least15minutes within the granted interval')
POLICY={'startup_reclaimable_bytes':21_000_000_000,'minimum_live_reclaimable_bytes':3_000_000_000,
 'maximum_owned_rss_bytes':17_500_000_000,'sample_interval_seconds':.2,
 'maximum_build_seconds':min(1200,remaining),'stop_on_new_swapouts':False}
NATIVE_PACKET=ROOT/'.build/optimization/joined-state-eval-campaign-v305'
native=campaign.status(NATIVE_PACKET)['stages'][:3]
assert [r['stage'] for r in native]==['native/'+n for n in campaign.NATIVE] and all(r['status']=='passed' for r in native)
S={'classification':'Only the unchanged, previously unexecuted tail of full verification: behavioural quality, symlink model, API robustness, independent vision parity and original vision serving. The earlier full run and its resource failures remain mandatory failed evidence; success here cannot replace them or claim a full verification pass. VM recorded by outer ownership guard; no skipped tail gate can pass.',
 'frozen_at':datetime.datetime.now(datetime.timezone.utc).isoformat(),'deadline_utc':sys.argv[1],
 'build':verified_build(B),'native_prerequisites':native,'native_contract_sha256':digest(NATIVE_PACKET/'qualification-contract.json'),'wrapper_sha256':digest(Path(__file__)),'policy':POLICY,
 'environment':{'SLOTSTREAM_TEST_BINARY':str(B),'SLOTSTREAM_VERIFY_OUT':str(OUT/'verification')},
 'command':['bash',str(P/'verify-remaining.sh')], 'selected_script_sha256':digest(P/'verify-remaining.sh'), 'verify_source_sha256':digest(ROOT/'Tools/verify.sh'), 'predecessor_manifest_sha256':digest(ROOT/'.build/optimization/current-candidate-gates-v307/full/manifest.json'),
 'drivers':{str(f.relative_to(ROOT)):digest(f) for f in sorted((ROOT/'Tools').rglob('*')) if f.is_file() and f.suffix in ['.sh','.py','.mjs','.json','.swift','.txt'] and '__pycache__' not in f.parts},
 'limits':'No build, app closure, default activation or paid service. Existing verified local model only. Source/binary/Metal pinned; files saved before exit.'}
with (P/'protocol.json').open('x') as protocol:protocol.write(json.dumps(S,indent=2)+'\n')
OUT.mkdir(parents=True,exist_ok=False);started=time.monotonic();r={'passed':False,'protocol_sha256':digest(P/'protocol.json')}
def interrupted(number,_frame):raise KeyboardInterrupt(f'full qualification interrupted by signal{number}')
signal.signal(signal.SIGINT,interrupted);signal.signal(signal.SIGTERM,interrupted)
# Capture legacy fixed output files on both sides of this exact run. An
# unchanged/stale output is retained as history, never asserted to be new evidence.
legacy_names=sorted(set(re.findall(r'/tmp/(ssv[\w.-]+)',(ROOT/'Tools/verify.sh').read_text())))
def capture_legacy(phase):
 folder=P/('legacy-output-'+phase);folder.mkdir(exist_ok=False);rows=[]
 for name in legacy_names:
  path=Path('/tmp')/name
  if path.is_symlink():
   rows.append({'path':str(path),'kind':'symlink','target':os.readlink(path)});continue
  if not path.is_file():continue
  stat=path.stat();sha=digest(path);shutil.copy2(path,folder/name)
  rows.append({'path':str(path),'sha256':sha,'bytes':stat.st_size,'mtime_ns':stat.st_mtime_ns,
               'observed_after_run_start':stat.st_mtime_ns>=int(legacy_started_wall*1e9)})
 (folder/'inventory.json').write_text(json.dumps(rows,indent=2)+'\n');return rows
legacy_started_wall=time.time()
r['legacy_output_before']=capture_legacy('before')
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
  # Preserve exact fixed outputs, including failed-check artifacts.
  try:r['legacy_output_after']=capture_legacy('after')
  except BaseException as error:r.setdefault('cleanup_errors',{})['legacy_output_capture']=str(error)
  # Primary result is durable before independent restoration checks.
  (OUT/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
  for n,f in {'after':vm_snapshot,'pressure':pressure_snapshot,'candidate_unchanged':lambda:verified_build(B)==S['build'],
   'drivers_unchanged':lambda:all(digest(ROOT/n)==h for n,h in S['drivers'].items()) and digest(P/'verify-remaining.sh')==S['selected_script_sha256'],
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

## /tmp/slotstream-optimization-execution/verification-continuation-v314/verify-remaining.sh

SHA-256 `f4a37f5d5d5eb8b97c0147351e6966aeb1047f77e3e93f9ec6552b896667d79a`.

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
QPID=""
cleanup() {
  if [ -n "$QPID" ]; then
    kill "$QPID" 2>/dev/null || true
    wait "$QPID" 2>/dev/null || true
  fi
}
trap cleanup EXIT INT TERM


SMALL_MEMORY=8.1
BIG_MEMORY=10
ECBIG=960
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

