---
type: run
id: 01m26sp7gcmn5yhfgqte0pn87s
created: 2026-09-10T23:15:48.363717+00:00
updated: 2026-09-10T23:15:49.082949+00:00
summary: v0.2.14 successful CI, exact public archive, provenance and installer evidence
binary: v0.2.14, public archive SHA-256 2fd5bfab8073b29095148274b0e5857a43dc20bc530bcacb4c9180ccc5ac2b52
captured_at: 2026-09-10
command: GitHub main CI 34539578315; release 34541172114; gh attestation verify; Tools/release_candidate.py; public install.sh
discarded: 'false'
machines: '[[records/machines/github-actions-macos-26]], [[records/machines/macbook-pro-m5-pro-48gb]]'
title: v0.2.14 successful CI, exact public archive, provenance and installer evidence
tool: Slotstream exact native and source qualification capture
---
Closed logs and prospective protocol for v0.2.14. Complete main CI and release publication passed. The public download matched the successful CI candidate exactly, verified its GitHub attestation and reconstructible source, and was installed through the ordinary latest-release installer. Full local model/API acceptance is recorded separately after it completes. The prospective source freeze originally named a concurrent documentation-only child commit; the corrected tag binding names the exact successful-CI parent, with identical compiled-source hashes and the child documentation preserved. Known credential/private-key pattern scanning found no hits in this capture; this is a bounded scan, not a universal privacy proof.

## Exact artifact inventory

```json
[
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/additional-research-content-scan.json",
    "bytes": 47610,
    "sha256": "225dabe246e26167a64a787aea5262a1fbdd3ccffa8ab58528eaae287b3912af"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/coverage/coverage.info",
    "bytes": 1456497,
    "sha256": "5f18656f8282627a79e8eb0088186480e5e2bc5a27dcd5a9b4ee6e3f26364a7a"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/coverage-job.log",
    "bytes": 87742,
    "sha256": "5716d0d51234f0acab9e5ffd845fe0afb27d93c2d8aa501607dd5a614900aa6f"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/install-and-qualify-public.py",
    "bytes": 5118,
    "sha256": "04bcac4591489127f79b7da4dd1a01996ab5786e1f5a6a5775189c1ce26ea371"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/local-acceptance-protocol.json",
    "bytes": 3490,
    "sha256": "203df20d853a355ddb13efcf35a93217ea9b1593297be0b02914a752eac8b7bf"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/local-public-acceptance.py",
    "bytes": 4518,
    "sha256": "6bddcbc80091a77eca847280c35801913036f4e0be6bf1eb9f06f39dc55594ba"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/public-download/extracted/build-identity.json",
    "bytes": 18603,
    "sha256": "41962b7e6a63f095d6bfb7350e5704bf4bf99803cdf753dbc926a07ce94aa83a"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/public-download/release.json",
    "bytes": 6692,
    "sha256": "2e26ea8f0ea11436d704d78861ec7a4c0e7704d834f8c62697407cfabe0b5cc3"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/public-download/slotstream-arm64.tar.gz.sha256",
    "bytes": 90,
    "sha256": "3cd14233bf34c764a76f824925ed1a8b2425cc70829857a7b2077e17917c96cd"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/public-installer.log",
    "bytes": 2299,
    "sha256": "0a74b54db02e0abdcd700fd59fd7417802c9c1423574ad8ec59e3f6f983b1ce6"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/public-library-job.log",
    "bytes": 23401,
    "sha256": "830696b786bbac56453eb90e91f21241c3b819c11130c397dfcdd6f6b1947cc8"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/release-job.log",
    "bytes": 36764,
    "sha256": "85446ed8dc7cf8b89e62fdac8ab13be415a99b38489cd1ec47ae92e1dd51a7f3"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/restore-demo.py",
    "bytes": 3027,
    "sha256": "cbf3772a619ac2bf4650e045e2027ed62005f783c2b8bb2b5ac6a5d9bf04130a"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/successful-main-ci.json",
    "bytes": 8871,
    "sha256": "7e5940b67a6995b990560f1d777389702046a2b8a264e5f9edb525be93c7abad"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/successful-release-run.json",
    "bytes": 1919,
    "sha256": "ebde36293d075ded5b91ac9a2631dbb6a8d31f9639e47398316083ef2321aa00"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/tag-qualification-before-documentation-head-correction.json",
    "bytes": 18768,
    "sha256": "3f3df02bc4f11a25b76a42221c228e9e6e61a477cf80b223b4ea24fbcff97e46"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/tag-qualification.json",
    "bytes": 19433,
    "sha256": "8b9468c2f3d3404ea12cb55fe84d4c1ce3f259112a8a954894251362cc317c94"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/verify-public-attestation.log",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/verify-public-source-archive.log",
    "bytes": 226,
    "sha256": "16c3e2a5f6bfcfbb28e83931d286edcb9b9910b908e0debb8eb0b4f46c1c7b1c"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/weights-free-job.log",
    "bytes": 160703,
    "sha256": "731c093a667b113ed523d4e7421eb7e2bbff3fb206657df2d3eaf864abdbaa27"
  }
]
```

## Artifact SHA-256 225dabe246e26167a64a787aea5262a1fbdd3ccffa8ab58528eaae287b3912af

Encoding: `utf-8`. Original bytes: 47610.

````````````text
{
  "scope": "Known credential/private-key patterns in the separately completed public decode-attribution records, source archives and decoded traces. Streaming reads; not a universal privacy proof.",
  "decoded_bytes_scanned": 409084839,
  "members": 230,
  "hits_without_values": [],
  "inventory": [
    {
      "path": "analysis.json",
      "bytes": 109534,
      "sha256": "6a87ddead2d5b928c76a015739690e66ca2fb159184929517bedbdf22d6a5b73"
    },
    {
      "path": "final-large-mtp-128-v2-round-1-trace.json.xz",
      "decoded_bytes": 45943293,
      "decoded_sha256": "81105337d3ed1f06261d56571d1681a77a0bcad569a84664d73b31b2e886931a"
    },
    {
      "path": "final-large-mtp-128-v2-round-2-trace.json.xz",
      "decoded_bytes": 45944466,
      "decoded_sha256": "b6cc358fb026454e63e286910bf02b75ec15fb8ec4f92af2af6308db32c4e2a3"
    },
    {
      "path": "final-large-mtp-128-v2-round-4-trace.json.xz",
      "decoded_bytes": 45939287,
      "decoded_sha256": "7fbc67b09c72cb30b99d3417ca53724781b8031507152d574011b19f765121c7"
    },
    {
      "path": "final-large-mtp-512-v2-round-3-trace.json.xz",
      "decoded_bytes": 187160666,
      "decoded_sha256": "b09c996181989fb66a2a709dec9dae83aabff117d6bcf626ecd76781a59fbb38"
    },
    {
      "path": "final-small-128-round-1-trace.json.xz",
      "decoded_bytes": 64851338,
      "decoded_sha256": "40bbc38d08744d3fb8cf90c630d7d433e4ea34d26e460a7a31399cc3ec0f9bc4"
    },
    {
      "path": "manifest.json",
      "bytes": 4282,
      "sha256": "eb9e2eab49d18f2d2279110bea95544f144ac59cf937402c1180e6abdc7e016a"
    },
    {
      "path": "natural-smoke-32-round-1-trace.json.xz",
      "decoded_bytes": 15826175,
      "decoded_sha256": "1a37941aa5f6803f20331b34203c5840481f007965f7a90afb271f1db2ddb69a"
    },
    {
      "path": "profiled-source.tar.gz:source-freeze-final/DecodeTrace.swift",
      "bytes": 1917,
      "sha256": "c576ef3dae6d334811732b504194d49f15dfcf3166965a2a048f8c0061c70e61"
    },
    {
      "path": "profiled-source.tar.gz:source-freeze-final/analyze.py",
      "bytes": 4664,
      "sha256": "0b2fd8948af4c2aa27e69ac2ff831720ea10da54561473315efc289c98500763"
    },
    {
      "path": "profiled-source.tar.gz:source-freeze-final/bench.py",
      "bytes": 6604,
      "sha256": "f5aea9649b5244c8d30eaf386fe5ac53ada731ae266ffb6a6d3d51d627ff51e0"
    },
    {
      "path": "profiled-source.tar.gz:source-freeze-final/long-prose.txt",
      "bytes": 2783,
      "sha256": "735497f5024129f9ebcf41af981eae6ec38035f24df4248c277d413e5c71b2c2"
    },
    {
      "path": "profiled-source.tar.gz:source-freeze-final/manifest.json",
      "bytes": 1385,
      "sha256": "ac4bc0674b1b414bd31a10dead221d993f3dd09704ff4e3020b537cb7e2d5773"
    },
    {
      "path": "profiled-source.tar.gz:source-freeze-final/metal-device.cpp",
      "bytes": 25076,
      "sha256": "8d7eaac7a5c1a92137d1a4593b6e80d190cff3c7f63f807488f0d3be5b57279b"
    },
    {
      "path": "profiled-source.tar.gz:source-freeze-final/metal-eval.cpp",
      "bytes": 3337,
      "sha256": "2c6f688e49562aea840fd89bfee890ac8d32ec86432d093ed23ebe34502dee14"
    },
    {
      "path": "profiled-source.tar.gz:source-freeze-final/primitives.h",
      "bytes": 68965,
      "sha256": "290bda5c04913b51d2d81b2a61117177a7e3450c3ba55af1c10f536360ff221b"
    },
    {
      "path": "profiled-source.tar.gz:source-freeze-final/slotstream.patch",
      "bytes": 17087,
      "sha256": "c0814ec2992f87b7072aa4cc7ae35d0c3bf7602a297a854d01cfbb6da0861a08"
    },
    {
      "path": "profiled-source.tar.gz:source-freeze-final/ssprofile.cpp",
      "bytes": 6135,
      "sha256": "e6f74bb725b9d0bf2e22d0d456efe84bfbc90ec0238e365208985eaef52d657a"
    },
    {
      "path": "profiled-source.tar.gz:source-freeze-final/ssprofile.h",
      "bytes": 493,
      "sha256": "fc63bda14c23cf7b0a74e8b54016d87c715b57b7215c376a4dca039dc6937cd4"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128/driver.log",
      "bytes": 648,
      "sha256": "5fb925389e7d30880695efcf1789ef7e98ce2cc9608ed60d1044b668c983f611"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128/finished.json",
      "bytes": 73,
      "sha256": "cc241a25efecd718872dc54a2da6a9eb632048b09b38383a1212ff450573ea12"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128/manifest.json",
      "bytes": 1285,
      "sha256": "aa93f04eda8fa98a43dc290f538b4112267fb5729fb5b845a31d7c7f57936955"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128/request.json",
      "bytes": 2919,
      "sha256": "559ca7c3b499b0aa4ccf3c4e08322dfeb0dd05dfb3e434bcf2e277d68da40719"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128/results.jsonl",
      "bytes": 31094,
      "sha256": "a2504cf95c748115324088910d43902407fad15c98ec8b8207e92e32db569c4c"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128/round-1-mode-0/measured.ndjson",
      "bytes": 24312,
      "sha256": "27c81a53c49d4159a7af90e4d281c6801cef8aadfa192ba839d444f071085da1"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128/round-1-mode-0/resource-0.json",
      "bytes": 210,
      "sha256": "0e1e698777c11265ad44a75a9fd7151cf4808ac30186468da1507180e3380de0"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128/round-1-mode-0/resource-1.json",
      "bytes": 210,
      "sha256": "af926fe789d6d2ae6deb52417252ca0fe73fc27843a0efe5f3eff77986b4f385"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128/round-1-mode-0/server.log",
      "bytes": 1500,
      "sha256": "9af6c74906d84973b8c844e23ca1990e1376cd292ce8c8b0a1bb4207be4d87f0"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128/round-1-mode-0/warmup.ndjson",
      "bytes": 24349,
      "sha256": "bef5e7def1fe965a8a62eeea3dea728a855241206d5d23c0ab82c9d53dcafb54"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/driver.log",
      "bytes": 1604,
      "sha256": "a95e89efb32f10f2cac5a8f0d578aff909cb6bf85194465dbbd5c9d3cc40c260"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/finished.json",
      "bytes": 73,
      "sha256": "06f78f24dd1a3edd09e5fe116ee02cf42a343abc1cf505e8883f1f66760c7637"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/manifest.json",
      "bytes": 1288,
      "sha256": "1f373a27f83611a360b63fe7003cfdfd5ba9188ce03600d61739c4537e462be1"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/request.json",
      "bytes": 2919,
      "sha256": "559ca7c3b499b0aa4ccf3c4e08322dfeb0dd05dfb3e434bcf2e277d68da40719"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/results.jsonl",
      "bytes": 263145,
      "sha256": "ce9e607813448cdecda52c0b9aa4d4b1053d8e7f7e4593a90b7e275e4f069e0d"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-1-mode-0/measured.ndjson",
      "bytes": 24274,
      "sha256": "c3db3764ce41e0123564c3920229378fd3485e42839feff885404b5b2aa004a8"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-1-mode-0/resource-0.json",
      "bytes": 210,
      "sha256": "6bfa2ece12ad0a5fa1bdddf4ea3e3d26ffdb25440fc3151a944607101f39988d"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-1-mode-0/resource-1.json",
      "bytes": 210,
      "sha256": "4aeb2b5d05975688bbd5b5668a186779bef5408196002734a641cf6bb5cb04cc"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-1-mode-0/server.log",
      "bytes": 1500,
      "sha256": "fddafd5b155dff7f3a016d124025b8f6a9cc17e3cba8231245735059a39fe57e"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-1-mode-0/warmup.ndjson",
      "bytes": 24385,
      "sha256": "a71be5f6bf95b49dcc1c5cf8e91d5781ccc14538844e4fb8583283eccdbe2b1c"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-1-mode-4/analysis-final.json",
      "bytes": 5494,
      "sha256": "7f842c5b50b20cbfa4a4552d17bc9e870eda457175a8afd0991e82478536598c"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-1-mode-4/measured.ndjson",
      "bytes": 24331,
      "sha256": "ced87336194de449d6b960c7a301de4586a004584b90bd43ca6e6a28d6a472e9"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-1-mode-4/resource-0.json",
      "bytes": 210,
      "sha256": "b0dab79898b9e2968e978c910d5cf1d252a4ffb9c2df898189af7d428b55c814"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-1-mode-4/resource-1.json",
      "bytes": 210,
      "sha256": "b3d6407a0753c63167a806c92c37c02c87ba3bfdaa8cc8b404cb1ca600ad5cb0"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-1-mode-4/server.log",
      "bytes": 1500,
      "sha256": "5ab8665e797ca162e61dbf948969db19e58f1c45fbd371691293c5b684a5ed2d"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-1-mode-4/warmup.ndjson",
      "bytes": 24336,
      "sha256": "d1e9e234cfc3a95ac604a65a884bff97fb804965fd2cb8a1e39207b8a442e97b"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-2-mode-0/measured.ndjson",
      "bytes": 24323,
      "sha256": "531afba9b05d6374645c95ebcc104c2f736775755818f5b0df81fe1098074fd3"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-2-mode-0/resource-0.json",
      "bytes": 210,
      "sha256": "f4b749022c65c7bd4edcbb67202f5a230a63969c0f910c38ee9cca0f2393a749"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-2-mode-0/resource-1.json",
      "bytes": 210,
      "sha256": "d8839776c2a0265437e0c52bba7baf98990abe1899bc1dde46c167e9938ffc69"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-2-mode-0/server.log",
      "bytes": 1500,
      "sha256": "af999da9a8c19bd3710029ddcf9ca05d342de0e11e251875421f5bc837994160"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-2-mode-0/warmup.ndjson",
      "bytes": 24258,
      "sha256": "0a2eeef03711b63b24169a8f7ca1633d3aa128e92913970c14ece558ee8c3c63"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-2-mode-4/analysis-final.json",
      "bytes": 5504,
      "sha256": "bd398c6bb76149947055546306af45768cacf56c5b36929d7ae075dfcecc4a6d"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-2-mode-4/measured.ndjson",
      "bytes": 24367,
      "sha256": "bd2e341f8176fe162ea55c275b1461a8526d8ac267d5793bf6f5818cc7486d41"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-2-mode-4/resource-0.json",
      "bytes": 210,
      "sha256": "d1cb0834ecd8d266f7af4ec2c1d07ed5f34dc0bbe138ec88cda963f562dde31b"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-2-mode-4/resource-1.json",
      "bytes": 210,
      "sha256": "a7c90bfa482a4492f8abdbf9cb7c549cafd05847c8b39b96a066391edade555a"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-2-mode-4/server.log",
      "bytes": 1500,
      "sha256": "642fd5640acca3d033a73ab9b2efe6e7d705545d113f01446752d49783ec514d"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-2-mode-4/warmup.ndjson",
      "bytes": 24373,
      "sha256": "cf6454ec810ba0294a0d9c3bd15442f1ab0a2eae7b833280798a7c436b1d24d5"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-3-mode-0/measured.ndjson",
      "bytes": 24287,
      "sha256": "830f14ba9c8d87cb986b91a2f382239bf240255212306ba5ef399695f0361b76"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-3-mode-0/resource-0.json",
      "bytes": 210,
      "sha256": "0664b5bfa813965824ca7498bb8a0852432cb9bd921748f9fec1c31287f9ba8f"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-3-mode-0/resource-1.json",
      "bytes": 210,
      "sha256": "e0a31a8886929c3e3a6f7c600f424c383a612bce90ce23d7a1bc15fb891301cc"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-3-mode-0/server.log",
      "bytes": 1500,
      "sha256": "7066c1225ff94b83ec991d4a1a98bd0dd2a286a8b6f3d3ca3f0bd97357b1643e"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-3-mode-0/warmup.ndjson",
      "bytes": 24374,
      "sha256": "be0a8593d30542ebe50682f68db6cd566689cc4675a0f43fdca9da50adc21484"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-3-mode-4/measured.ndjson",
      "bytes": 24466,
      "sha256": "b30b94233f55c794e59d7a09b4b424888baf355d75447dc97545ae85954de4b1"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-3-mode-4/resource-0.json",
      "bytes": 210,
      "sha256": "6b72c1d0d54d8d8052d28f2fc9bc183e00ad4d945cdf90ef11c8d85a01065d50"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-3-mode-4/resource-1.json",
      "bytes": 210,
      "sha256": "5c96671e1d7c2dcb99d8d56a0b5ca17cd526ddb7b2ac16158b0c811c17def4a8"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-3-mode-4/server.log",
      "bytes": 1500,
      "sha256": "446ce25536b5d934012011b5447c14c0810a2e8ca36b14b45a53a6657f24b5d2"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-3-mode-4/warmup.ndjson",
      "bytes": 24469,
      "sha256": "5a3cdd02b29573c93ff34925c7c74b960b837b77cff56487c0fd9c4e6e660b1c"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-4-mode-0/measured.ndjson",
      "bytes": 24331,
      "sha256": "7bdcc9c98f325d22877e2c74bb420827d1855ac9104d82810f37a4ec956808e0"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-4-mode-0/resource-0.json",
      "bytes": 210,
      "sha256": "0492ac6ff241850d1e67123262492911236283c3c105d80caa383e0f3abf10bd"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-4-mode-0/resource-1.json",
      "bytes": 210,
      "sha256": "2fd7aa8a5f5d09edf1fcc79dedb273f15d7cd2aa2a5f8a10b6a22075dd931f64"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-4-mode-0/server.log",
      "bytes": 1500,
      "sha256": "c99977a8458be92c8c9dcfbc68d78dba9f8742764a341739364f0feb1459e94c"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-4-mode-0/warmup.ndjson",
      "bytes": 24363,
      "sha256": "4a35c3ede9bdd42c3ffafafc70918b906eb4bf5007abef4501954a750e48c557"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-4-mode-4/analysis-final.json",
      "bytes": 5519,
      "sha256": "b3af51fda78f222cdd84be8450fc90368f48a87904e7d2e33a4b9115df5353e8"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-4-mode-4/measured.ndjson",
      "bytes": 24435,
      "sha256": "8a9a739d934c9e1076fcb4dcb3ff40af694d26b5f84e832ef38b5fbe58748e4b"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-4-mode-4/resource-0.json",
      "bytes": 210,
      "sha256": "ebf812e3db490b91c5a8f8e94409e6c49bac36cbffc91e5118d10a7df1aa138d"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-4-mode-4/resource-1.json",
      "bytes": 210,
      "sha256": "71c6fd94f66e4a3b4b3b93ee47c739f7b3936bfa34f462033e267f8e151358cd"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-4-mode-4/server.log",
      "bytes": 1500,
      "sha256": "2e1ade1facf595c48a1f40155f993fc634a3d9a6c86441d2d4a3f3a7d036baa2"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-128-v2/round-4-mode-4/warmup.ndjson",
      "bytes": 24378,
      "sha256": "2b36d4fb089eb36410c851958f6904dad7bbe9c6e939898e6436fb5cdbe292a1"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512/driver.log",
      "bytes": 1046,
      "sha256": "5b9314abbea2e235acb4dd4dddd8bb4fe69fe58a7b4b69aade51b8c323bf249b"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512/finished.json",
      "bytes": 74,
      "sha256": "dad181090af63ec231d948ec49fba4c20630ce44a7ec8f6aa1efe48b2d90ea0b"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512/manifest.json",
      "bytes": 1285,
      "sha256": "33bb24fb0b602ac59e8e7d008bfc9a1e9e20dfc51b4cc2dbc73a7e4bdcc635ac"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512/request.json",
      "bytes": 2919,
      "sha256": "c5cf74868e9db15f0a064fee3e6ac2709993d7b43a066d13111e72f92790836b"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512/results.jsonl",
      "bytes": 52260,
      "sha256": "589d6327ff139064e1cd775f7f0da7d682bd7eaebf25cb572493e6bae09f9626"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512/round-1-mode-0/measured.ndjson",
      "bytes": 73708,
      "sha256": "9aa992c2c3c5a6965b90ee33b7228ff5ff1bdd7ba880ea00fae94c4ef5102a8f"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512/round-1-mode-0/resource-0.json",
      "bytes": 210,
      "sha256": "22cedccbcdcfbc7a939b7ce1369114c958ec3110fa97ab59c98ffb7406e9dbf0"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512/round-1-mode-0/resource-1.json",
      "bytes": 210,
      "sha256": "b54aae5bba1df6ab8cd3efb484b23e1df1be96cca0d66ffc7100457462cd8ed6"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512/round-1-mode-0/server.log",
      "bytes": 1500,
      "sha256": "fca1cc0f7fadcdf2452a105e92081b520c8d93d6ad5ec486a8c05e56c00c2bd8"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512/round-1-mode-0/warmup.ndjson",
      "bytes": 73672,
      "sha256": "9f7c9a8d6650561aee600f85a378997ad2239f63e4b70f59464c7516b80b8fa3"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/driver.log",
      "bytes": 1088,
      "sha256": "dd8542909d4197609fbcaeb228fa3f2a5a6765b90cdc50686f02acfcf747ffc2"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/finished.json",
      "bytes": 73,
      "sha256": "c807794abe81c87b49a5f46084fe62f0838850c66060890e53cddf4353b77468"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/manifest.json",
      "bytes": 1288,
      "sha256": "a0df94453ab7662d9d817be5bce2f34b7709c426fd930640e47ac42aa385aba2"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/request.json",
      "bytes": 2919,
      "sha256": "c5cf74868e9db15f0a064fee3e6ac2709993d7b43a066d13111e72f92790836b"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/results.jsonl",
      "bytes": 310501,
      "sha256": "c332cd9ed39b819118f7e55f3109f8b0f30307fe3c107c5f5f511eb91c0f6a05"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/round-1-mode-0/measured.ndjson",
      "bytes": 73248,
      "sha256": "cd37f1eb3b834ec16d7479b8882085d0955f48897142b51a939c099842782694"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/round-1-mode-0/resource-0.json",
      "bytes": 210,
      "sha256": "69818e4f9de0b7d0fb842f7a722928c3307a6b82e3fae883712ba2ec18760edb"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/round-1-mode-0/resource-1.json",
      "bytes": 210,
      "sha256": "d4c16f39563e0c4df2c424bf63be7f9a59648013def62377bf10fbc8d6f28d34"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/round-1-mode-0/server.log",
      "bytes": 1500,
      "sha256": "e397194793e12e53bd722a3f3a4f7ab4377180ce2b295cff84bb09376a7f84ec"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/round-1-mode-0/warmup.ndjson",
      "bytes": 73345,
      "sha256": "70f1acd98e342aeb60365c2a67180acbf136d7ca62a785ba101e8d7211bf910f"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/round-1-mode-4/measured.ndjson",
      "bytes": 73429,
      "sha256": "de90a0e6230ab393b1846b4c05145389a1c949d036d917b01187eae3fef7b124"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/round-1-mode-4/resource-0.json",
      "bytes": 210,
      "sha256": "46a636efccb63cdf8b720010f24609962b1a6d6404bb1af263250453721cf14c"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/round-1-mode-4/resource-1.json",
      "bytes": 210,
      "sha256": "5a4728b6efcabac9b94c91158aaf38d383be0a42c4b6468fc3b6068478cb4593"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/round-1-mode-4/server.log",
      "bytes": 1500,
      "sha256": "8b3c61704d78b8674291539814fd367e9465dfb68e5d4b995aed566d7acece83"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/round-1-mode-4/warmup.ndjson",
      "bytes": 73435,
      "sha256": "98ac9b16f7b1e9a58433204378892cdf1e3ed5037e2bfa70a156299f6578a66c"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/round-2-mode-0/measured.ndjson",
      "bytes": 73187,
      "sha256": "bbfce61f449f6b5700f860777118949d34617c92b40b0e3e97d332b06580eca6"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/round-2-mode-0/resource-0.json",
      "bytes": 210,
      "sha256": "a1f9b0045892f863e67826ef8dab942c24baa7cdc24c9cde2a0e40b2ccde18d6"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/round-2-mode-0/resource-1.json",
      "bytes": 210,
      "sha256": "86d046c43f12f7897cec988ff111509f23ca4b214e23ab55c354d3cf4ab581af"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/round-2-mode-0/server.log",
      "bytes": 1500,
      "sha256": "d8a8e4e78a7640da673dc7e5e3c51d9a19337f8c95991d31c9f8084c579f2fff"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/round-2-mode-0/warmup.ndjson",
      "bytes": 73257,
      "sha256": "70c2afd0d357eee78920c1d108d4d2f39f88cf4f5c9158aeac6d65aa411078d9"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/round-2-mode-4/measured.ndjson",
      "bytes": 73517,
      "sha256": "737ef70dc8b3cd61654a3c31b5c367dcad5262e70f5f8fcbc4f93ac47c1f9617"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/round-2-mode-4/resource-0.json",
      "bytes": 210,
      "sha256": "a0a4e19d0876b60f5175ece83553876b7fe64caebfd89a9bf352daf2296a7266"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/round-2-mode-4/resource-1.json",
      "bytes": 210,
      "sha256": "f3cf2eafbebb8b94b8c9ed37e01836bee70c661e56726ebf79f9d68a5c1d6be1"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/round-2-mode-4/server.log",
      "bytes": 1500,
      "sha256": "cf865f568039364701fa9cdc47bdfb629c0f23c586bce781cf1bed7d0b629b61"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/round-2-mode-4/warmup.ndjson",
      "bytes": 73880,
      "sha256": "037b05fc6b909467de97d76e14206e5714130eaeb1f49897d355bf65deeb35eb"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/round-3-mode-0/measured.ndjson",
      "bytes": 73365,
      "sha256": "5e238f8c4249a051ba192166028655c1c1bef2d183f9192641c2a03f61992d1d"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/round-3-mode-0/resource-0.json",
      "bytes": 210,
      "sha256": "385f88abdd7834772daf01888b57dda9935f70d10441dcbceb9b423de30386b6"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/round-3-mode-0/resource-1.json",
      "bytes": 210,
      "sha256": "09717bfe5df4d1730a9728efd19909321cb13a232339fb6554f86c96fb988e55"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/round-3-mode-0/server.log",
      "bytes": 1500,
      "sha256": "18636a28ef47470b66366978ec34b3ea58141c64f48d1156ba26cb7b94b22afb"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/round-3-mode-0/warmup.ndjson",
      "bytes": 73401,
      "sha256": "3b56a8a3f5a45b8fd8001fc114c0420376c3300f5a3c80ca66a03802264bb5a1"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/round-3-mode-4/analysis-final.json",
      "bytes": 5522,
      "sha256": "9f712a8742598dd5df92f5efea92b1b648e3efa7e81e10d7dc5c1427565f2150"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/round-3-mode-4/measured.ndjson",
      "bytes": 73403,
      "sha256": "8d70040b6ae9397027337e080e5ba9dde811f721496154486358457f3b8b3ef5"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/round-3-mode-4/resource-0.json",
      "bytes": 210,
      "sha256": "e6d5ba5a92cf97e120cc7347cbbc9793812bb9141dd6f3a305d24f7220727517"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/round-3-mode-4/resource-1.json",
      "bytes": 210,
      "sha256": "05535008b6db46123ba51974976cdb4647c0e5664c2fa8d07b87ec0177815a47"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/round-3-mode-4/server.log",
      "bytes": 1500,
      "sha256": "82aee219b21eaeecba58886f4a184cd1ad5925349ccd3086769a393fa9b29145"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-large-mtp-512-v2/round-3-mode-4/warmup.ndjson",
      "bytes": 73213,
      "sha256": "6de894b298c5a994b1a39ff97b56bfe0453a86d094fe3c960dc7530e67953277"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-small-128/driver.log",
      "bytes": 1139,
      "sha256": "f8d05c485bf9348a076950b1550b4dd5e19092fea9e8227cd259bad8222e5faf"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-small-128/finished.json",
      "bytes": 73,
      "sha256": "44070c21738028a7254ceab0bdf899343ee644517c798820a2bb0e2e485b5944"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-small-128/manifest.json",
      "bytes": 1059,
      "sha256": "9650aafa556a96dbd2af24fe0c6098b93483a64227d6088e033945497d5589f3"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-small-128/request.json",
      "bytes": 2919,
      "sha256": "559ca7c3b499b0aa4ccf3c4e08322dfeb0dd05dfb3e434bcf2e277d68da40719"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-small-128/results.jsonl",
      "bytes": 123460,
      "sha256": "b84ee73838d962a726278c87d0682c5dcbc99baec630c221fe0496ad3129cebe"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-small-128/round-1-mode-0/measured.ndjson",
      "bytes": 24153,
      "sha256": "6b5cd2966aa86ce5557b03692adc45b6f569f23f23989a10a05249fcda78052c"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-small-128/round-1-mode-0/resource-0.json",
      "bytes": 210,
      "sha256": "9777e31c685d5aa34bdb3ecdfac2106469243043d3915e84677b71a220e28228"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-small-128/round-1-mode-0/resource-1.json",
      "bytes": 210,
      "sha256": "37773dfacd3fe08125028c66af775f5871964e92be75812163e6917bb5b756a2"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-small-128/round-1-mode-0/server.log",
      "bytes": 1395,
      "sha256": "ca384179db0f1207cc997a670bff1147f1101a7448716f472a407a2154ad6318"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-small-128/round-1-mode-0/warmup.ndjson",
      "bytes": 24114,
      "sha256": "e91984f4d2dcb9406b673d10fbf65821a2053868c35ba4f627f39480a2c2223a"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-small-128/round-1-mode-4/analysis-final.json",
      "bytes": 4950,
      "sha256": "6bbceeddf0e56fc2ce09e50f7379488f311414da111665e815eab9925d7ce739"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-small-128/round-1-mode-4/measured.ndjson",
      "bytes": 24172,
      "sha256": "de6a7111689e7ad809d1c72b28ca3ba26cb2d2175fd5f0a70a63e59fbd6e5f40"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-small-128/round-1-mode-4/resource-0.json",
      "bytes": 210,
      "sha256": "e5247ba5bcfce0acb3ad9a6d91d7197eb4eb5bf9251f6821f2d5ad569880eb2f"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-small-128/round-1-mode-4/resource-1.json",
      "bytes": 210,
      "sha256": "6913979cca4a3e43f668ef65e6cf5ecec019d90937cdcd5970a4d711a81295af"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-small-128/round-1-mode-4/server.log",
      "bytes": 1395,
      "sha256": "a2c8884207cad67064d11429133e6d6b09d66231a74d4894f5131ecceee15977"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-small-128/round-1-mode-4/warmup.ndjson",
      "bytes": 24125,
      "sha256": "22a1b5e3ebd4c15d91d39eb5f6f934c5eb74523388125e593663e1499e5a0ce8"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-small-128/round-2-mode-0/measured.ndjson",
      "bytes": 24174,
      "sha256": "a2eae509029e71aa2496f103f35943e8228a796ef4fb3decf5b6381a2a87f535"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-small-128/round-2-mode-0/resource-0.json",
      "bytes": 210,
      "sha256": "d1bf5edd8d68115fd5debde59da08cc2e2e2594aad54e1bbbf0431ad252c3b92"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-small-128/round-2-mode-0/resource-1.json",
      "bytes": 210,
      "sha256": "41874510658a4d227b3415ca9a0a9e3fe6c60287fc131458997785c56f4e9bdf"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-small-128/round-2-mode-0/server.log",
      "bytes": 1395,
      "sha256": "58c3a6e29a3bb24c9bc8c0c29f5df1afd9f5f26e29f9ab040b8ef5c6d6eaf22d"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-small-128/round-2-mode-0/warmup.ndjson",
      "bytes": 24093,
      "sha256": "dcb712e7754f30180adafaad5da9afd37c7f12fff82f2cd85a8764c18c200100"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-small-128/round-2-mode-4/measured.ndjson",
      "bytes": 24009,
      "sha256": "88a4388b368970ec502d83f1d52ad4cea0ca8979bc28c721ad3f02b2c7fdc63b"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-small-128/round-2-mode-4/resource-0.json",
      "bytes": 210,
      "sha256": "5d743a14d59fa488caadad8a2cea130aa9e8e1172354611f5f79c7791199d95e"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-small-128/round-2-mode-4/resource-1.json",
      "bytes": 210,
      "sha256": "1172835711b95f6732f7d11ded9ecf8a2d83897344e7f0247b87ed066be7bda2"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-small-128/round-2-mode-4/server.log",
      "bytes": 1395,
      "sha256": "471f88080903c0fe7010bc09506ccc00167fd38afe1787fb3251b4179986fdc5"
    },
    {
      "path": "raw-results-and-driver.tar.gz:final-small-128/round-2-mode-4/warmup.ndjson",
      "bytes": 24090,
      "sha256": "4960b8fd6ad871afc863466f9b8d253f4713fcbd97cb3d9ebff3453624caaa9a"
    },
    {
      "path": "raw-results-and-driver.tar.gz:natural-smoke-32/driver.log",
      "bytes": 441,
      "sha256": "001e019e87306338986a84e5f8f9696dabc5ec4282917e95b53d85e5ac6d3c2b"
    },
    {
      "path": "raw-results-and-driver.tar.gz:natural-smoke-32/finished.json",
      "bytes": 74,
      "sha256": "0b4129f1912b91c1c5f96f0268344e6bf7a2dcd6af21f380d044bf2a73ee88ad"
    },
    {
      "path": "raw-results-and-driver.tar.gz:natural-smoke-32/manifest.json",
      "bytes": 1058,
      "sha256": "1ea2f40a5925ffa7d20f0813408a793eafeae8e7568efb4d136d738d287c4969"
    },
    {
      "path": "raw-results-and-driver.tar.gz:natural-smoke-32/request.json",
      "bytes": 2918,
      "sha256": "be0cb83dbf234689afd64b9417d956352ae037cafed4141c0b017e53737f7a6e"
    },
    {
      "path": "raw-results-and-driver.tar.gz:natural-smoke-32/results.jsonl",
      "bytes": 51882,
      "sha256": "f8de3c0f73cea9afd0cf811a282aeee9207a412679ae093388a56042d4f09534"
    },
    {
      "path": "raw-results-and-driver.tar.gz:natural-smoke-32/round-1-mode-0/measured.ndjson",
      "bytes": 11925,
      "sha256": "8d9b38aed586bc51d9093fc69497abfe5ae3bab19859d07ac8930eca7c6ca4a3"
    },
    {
      "path": "raw-results-and-driver.tar.gz:natural-smoke-32/round-1-mode-0/resource-0.json",
      "bytes": 210,
      "sha256": "e93d6ad43c90f31882934af32d3ca0996998c0e8d6fe0daa33ae8691078e1a1c"
    },
    {
      "path": "raw-results-and-driver.tar.gz:natural-smoke-32/round-1-mode-0/resource-1.json",
      "bytes": 210,
      "sha256": "2790492bebb70be32bc771583f8d9a6651bcc288f680ee4d9a210c19d8f3a5ba"
    },
    {
      "path": "raw-results-and-driver.tar.gz:natural-smoke-32/round-1-mode-0/server.log",
      "bytes": 1395,
      "sha256": "3a0d08e11ea5c5e2af3a1c6996ded800f99c185bc594cd0872205ebbd5b2c83c"
    },
    {
      "path": "raw-results-and-driver.tar.gz:natural-smoke-32/round-1-mode-0/warmup.ndjson",
      "bytes": 11965,
      "sha256": "95f529809c600e523ad388577ad24318829af3dea83c5353ed74dc55882a9433"
    },
    {
      "path": "raw-results-and-driver.tar.gz:natural-smoke-32/round-1-mode-4/analysis-final.json",
      "bytes": 4963,
      "sha256": "8e823257ed4720b373221709849f339d9ab4ef70f228708f0683bec43d8389e7"
    },
    {
      "path": "raw-results-and-driver.tar.gz:natural-smoke-32/round-1-mode-4/measured.ndjson",
      "bytes": 11907,
      "sha256": "b3412cd4feaa2464c12c678fc0b702d76ced2311b4fe8dc31ed59765f8d0e450"
    },
    {
      "path": "raw-results-and-driver.tar.gz:natural-smoke-32/round-1-mode-4/resource-0.json",
      "bytes": 210,
      "sha256": "9ab8271541c419fbd968e8cf70df7efe83484a10ddfdb740513fa19063f54912"
    },
    {
      "path": "raw-results-and-driver.tar.gz:natural-smoke-32/round-1-mode-4/resource-1.json",
      "bytes": 210,
      "sha256": "8fbcdc5771005b7169aec05f54cf5f27838cf81e924368ce27e95726ce906bbb"
    },
    {
      "path": "raw-results-and-driver.tar.gz:natural-smoke-32/round-1-mode-4/server.log",
      "bytes": 1395,
      "sha256": "d70b77b4d09bad3b8c9fbe8b40f5901d63620f8db224ff0b1d0cbc5a41c4e440"
    },
    {
      "path": "raw-results-and-driver.tar.gz:natural-smoke-32/round-1-mode-4/warmup.ndjson",
      "bytes": 11947,
      "sha256": "ce0344e033d8803125bf178c19f826a8228c1cb3f8c4eab6d554aded753bd0cb"
    },
    {
      "path": "raw-results-and-driver.tar.gz:paired-small-128-v1/driver.log",
      "bytes": 591,
      "sha256": "25c1bca7be07f5c38f712f4946108b321cb41f955ebebf93ad932055f4f97eb8"
    },
    {
      "path": "raw-results-and-driver.tar.gz:paired-small-128-v1/finished.json",
      "bytes": 73,
      "sha256": "029ca704114f4fd5d45008b0c47cbf80b9a348469dde9738d1950edca7497cbe"
    },
    {
      "path": "raw-results-and-driver.tar.gz:paired-small-128-v1/manifest.json",
      "bytes": 849,
      "sha256": "4091d7e31f17d3a6fff8d7e8b0a97809928337fb2e9dbf5d99fb7c8d93c2ba10"
    },
    {
      "path": "raw-results-and-driver.tar.gz:paired-small-128-v1/request.json",
      "bytes": 2578,
      "sha256": "343217a3182ddaec4777be36150d96363d8ad9f4211695c703098f2c06386301"
    },
    {
      "path": "raw-results-and-driver.tar.gz:paired-small-128-v1/results.jsonl",
      "bytes": 28322,
      "sha256": "df0cbf110a1b76e812f2815ce41fce1a3050781c2b7ac335ec744813b8d771eb"
    },
    {
      "path": "raw-results-and-driver.tar.gz:paired-small-128-v1/round-1-mode-0/measured.ndjson",
      "bytes": 19884,
      "sha256": "3cec441bbae5fc70d412db5fcb403dbcc27383e81d9725238721661e5ca2e75d"
    },
    {
      "path": "raw-results-and-driver.tar.gz:paired-small-128-v1/round-1-mode-0/server.log",
      "bytes": 1395,
      "sha256": "80eb0b06806f7b7ba0a050aaa08c7ad5db80a62a03a4f330cb2aeca14f932f9a"
    },
    {
      "path": "raw-results-and-driver.tar.gz:paired-small-128-v1/round-1-mode-0/warmup.ndjson",
      "bytes": 19912,
      "sha256": "612cb80dede0cb8fc91903bb2dddffbe5371883caff5029baf82d545344aa255"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-32/driver.log",
      "bytes": 685,
      "sha256": "7d23f4bfa82c30f961f8efa36fdc787471e69a64b879a7c68cd8449a6eb4f0d5"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-32/finished.json",
      "bytes": 74,
      "sha256": "578c8a138e29f61bbf60b67c6c93033c03661644b273488506cde15bf4c48c16"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-32/manifest.json",
      "bytes": 845,
      "sha256": "7c391430253abf6acbdb2aa0f14a2183da7f4d871b61cd58943af4de6be7e9e2"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-32/request.json",
      "bytes": 2577,
      "sha256": "279108fd164538c1103e8af6591c99f75380b5a531102f08d8edb052f9861435"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-32/results.jsonl",
      "bytes": 49769,
      "sha256": "3b89347f647368ef3bebf3269aa694ac1a99b8343f0f51a9e163eb823992e342"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-32/round-1-mode-0/measured.ndjson",
      "bytes": 11673,
      "sha256": "13b333e2305d7e54e96568c34f581f2c74cc58c2b0076ac1a6c17da20ccf6259"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-32/round-1-mode-0/server.log",
      "bytes": 1395,
      "sha256": "a3678fcd94e2d1d0a4e8f4a0a621b4ee9ce3b91a4cb54ab310dc016d432d6f30"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-32/round-1-mode-0/warmup.ndjson",
      "bytes": 11577,
      "sha256": "58ed1894854c9f7ffc1bf1a4ab43b85b91ac499cdffbcd65b813a3ce5499b4b8"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-32/round-1-mode-1/measured.ndjson",
      "bytes": 11667,
      "sha256": "5e6e76365ff4b393c51892c9128b7e1d6fd771aeae14bf6d3c49960b1f88e149"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-32/round-1-mode-1/server.log",
      "bytes": 1395,
      "sha256": "eff9efc04212387f4e7c4c74156c417012f76ebadb5e6ef498835db171d16619"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-32/round-1-mode-1/warmup.ndjson",
      "bytes": 11616,
      "sha256": "c450ea7532fdab4eea005d97cea5e2102f7c67f6cfaf7ef3caa011ed17476c0d"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-cpu-32-v2/driver.log",
      "bytes": 646,
      "sha256": "892808d18d447f4991c9faa63011fefdd2498bc4fef2c27cee5572015ccfe70c"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-cpu-32-v2/finished.json",
      "bytes": 74,
      "sha256": "bd02480fb6deb1d9e4f658487e19cddd5473eee483a073daa1d6508ad48d352c"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-cpu-32-v2/manifest.json",
      "bytes": 1067,
      "sha256": "82ba541f30e5acdb2c99e70c1c1b0ee2d852dd08208b22e1774bff314330bb75"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-cpu-32-v2/request.json",
      "bytes": 2918,
      "sha256": "be0cb83dbf234689afd64b9417d956352ae037cafed4141c0b017e53737f7a6e"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-cpu-32-v2/results.jsonl",
      "bytes": 77857,
      "sha256": "b6ca7875a18da2acd8751677a9c6e20477a03c2c458d81d42fff16c239649c6d"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-cpu-32-v2/round-1-mode-0/measured.ndjson",
      "bytes": 11926,
      "sha256": "a94c239d46ee7f5fb9c5a20cc2ebd5e56d3b229c57f6c8562ab3e243ce8e8836"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-cpu-32-v2/round-1-mode-0/resource-0.json",
      "bytes": 210,
      "sha256": "47cd7e58b71c178cdf21ce63f30d55bcac8747291e9f666eb238923b59e87507"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-cpu-32-v2/round-1-mode-0/resource-1.json",
      "bytes": 210,
      "sha256": "231435882341985cb5121e05eae9f306bfe270e05b26451dce9a5fc43d435ec5"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-cpu-32-v2/round-1-mode-0/server.log",
      "bytes": 1395,
      "sha256": "c487d84c94bc75af347e8ff79e7431aa94d1a2c2eae3efc19a3c92e7695815cd"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-cpu-32-v2/round-1-mode-0/warmup.ndjson",
      "bytes": 11943,
      "sha256": "550482ccf0d67f12efcb3b93b672bdcf5e5741db237cdd9f552a1907742b50e7"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-cpu-32-v2/round-1-mode-1/measured.ndjson",
      "bytes": 11900,
      "sha256": "16d3a9ff79b7a02969a8ed1a95cbee5ffdb7eef1e72ff5a33e68844b854bce77"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-cpu-32-v2/round-1-mode-1/resource-0.json",
      "bytes": 210,
      "sha256": "f5c79e5d662329769c42f58fcc26b2b268d205cf7598612ba8544d4362d59206"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-cpu-32-v2/round-1-mode-1/resource-1.json",
      "bytes": 210,
      "sha256": "a47383614abdcdda7cc9680ea8b13c34d1c7d660530df2cd37050a342b3e315d"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-cpu-32-v2/round-1-mode-1/server.log",
      "bytes": 1395,
      "sha256": "8733ac93c0b19c22dd842d47f304f3359bb29430d460db1d33d94995db0b50b3"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-cpu-32-v2/round-1-mode-1/warmup.ndjson",
      "bytes": 11929,
      "sha256": "09f8dedb55d55f343660f99698b90deabb398f631e9c126d11d5ca3d4a6ca6e2"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-cpu-32-v2/round-1-mode-3/measured.ndjson",
      "bytes": 11925,
      "sha256": "37bc24b3245c4924bc7827264df5aeb0d947e895daa19776b7ce442632ab531e"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-cpu-32-v2/round-1-mode-3/resource-0.json",
      "bytes": 210,
      "sha256": "f309bab145c8e0b935b6ec7c242cad251212b6fe4a6c67e624a16a1a355afff7"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-cpu-32-v2/round-1-mode-3/resource-1.json",
      "bytes": 210,
      "sha256": "5953e5706fcc585f53c2f07237890971b787793300392da065f68972dde1cc62"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-cpu-32-v2/round-1-mode-3/server.log",
      "bytes": 1395,
      "sha256": "635b08e428939c30d40bf82554300ac83f8c2a0b28341edf4eef248d0a48bb4b"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-cpu-32-v2/round-1-mode-3/warmup.ndjson",
      "bytes": 11962,
      "sha256": "31df3058139c955fd8bc83005da835a4d299923af3a9a5af771c9e8fd8e37a5c"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-gpu-32/driver.log",
      "bytes": 569,
      "sha256": "0ddc973ccf13d23a4440a74f35664e8babb28feb18fc2115b5c105ccf6a5700e"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-gpu-32/finished.json",
      "bytes": 73,
      "sha256": "ae2782cebc4b0ae24114dcb7587daf3a241d4c56c78c5912fadf9895221509cb"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-gpu-32/manifest.json",
      "bytes": 832,
      "sha256": "13113a70c1d2a0401693833d127905d71c72817fcfa3827e617e7a46b2ab6e34"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-gpu-32/request.json",
      "bytes": 2577,
      "sha256": "279108fd164538c1103e8af6591c99f75380b5a531102f08d8edb052f9861435"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-gpu-32/results.jsonl",
      "bytes": 2784,
      "sha256": "1b8f36de5e93885be70489d97127631536c67159d45ae126c06cb6e8101a66e1"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-gpu-32/round-1-mode-2/server.log",
      "bytes": 1512,
      "sha256": "0c8ceafd61edf5bdb33c392b9ac022c3eb16256192c2522c75556fecfc52fe60"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-gpu-bounded-8/driver.log",
      "bytes": 232,
      "sha256": "3aa311b5a6b1ce3c27e10cf46562ab4abda8728717edf38d3250062bca6872b9"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-gpu-bounded-8/finished.json",
      "bytes": 73,
      "sha256": "f86283de3de712d065eeebfc42bed5c6e79d6247d1f163bc184acdf1cf309b8d"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-gpu-bounded-8/manifest.json",
      "bytes": 837,
      "sha256": "0a9dbff90d2e2d9b53c9c50b6a7f8e89628f47177b034051c51f1c7eb3ee3a42"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-gpu-bounded-8/request.json",
      "bytes": 2576,
      "sha256": "79ef3bc004c565fa30aa3911df1ce3723b6143bce0a1e8456714ac2ea7f9da92"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-gpu-bounded-8/results.jsonl",
      "bytes": 23677,
      "sha256": "e29a0f2b9a4d2534cf8a483e532d6ea673491802aad6560d439a1f7a0ef5709f"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-gpu-bounded-8/round-1-mode-2/measured.ndjson",
      "bytes": 8575,
      "sha256": "67b73c40b6645416c8195f51ed9722f81c5b081d87cc1793632b924b49a7fcf3"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-gpu-bounded-8/round-1-mode-2/server.log",
      "bytes": 1395,
      "sha256": "4a58e1750b67cc498a63d9c4694a2d2f32659899c7e8746bcdae43095b920d2e"
    },
    {
      "path": "raw-results-and-driver.tar.gz:smoke-gpu-bounded-8/round-1-mode-2/warmup.ndjson",
      "bytes": 8616,
      "sha256": "bcc809abdc0064fc6f876ee90fe17fd5b246c227acdf97a0d36aaa3ab5270d9e"
    },
    {
      "path": "raw-results-and-driver.tar.gz:driver/bench.py",
      "bytes": 7336,
      "sha256": "dec63c60140273f3e4e316543c0c45bcbaac0279f5f905d95d5c02f145305320"
    },
    {
      "path": "raw-results-and-driver.tar.gz:driver/analyze.py",
      "bytes": 4816,
      "sha256": "8260766d7379f86724f08c0ae31f6b653208525cdb7ee24f2d26dee942727869"
    },
    {
      "path": "raw-results-and-driver.tar.gz:driver/summarize_final.py",
      "bytes": 5050,
      "sha256": "3aa778265c6bde087ae44315e308ae96a8bf1f8bea3c6e930925521ad414c280"
    },
    {
      "path": "raw-results-and-driver.tar.gz:driver/capture_final.py",
      "bytes": 3899,
      "sha256": "e6e77589fbee9d78763957db58c896f942ed3960b08871aa68f32e7d35986fe2"
    },
    {
      "path": "raw-results-and-driver.tar.gz:driver/long-prose.txt",
      "bytes": 2783,
      "sha256": "735497f5024129f9ebcf41af981eae6ec38035f24df4248c277d413e5c71b2c2"
    },
    {
      "path": "raw-results-and-driver.tar.gz:driver/Tools/prefill_bench.py",
      "bytes": 19176,
      "sha256": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036"
    },
    {
      "path": "raw-results-and-driver.tar.gz:driver/Tools/serve_bench.py",
      "bytes": 60039,
      "sha256": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb"
    },
    {
      "path": "raw-results-and-driver.tar.gz:build-logs/build.txt",
      "bytes": 12063,
      "sha256": "847f5bdf9ea47cce9728efae96a5284e111da1bb89a8537f2a19cbbe711925da"
    },
    {
      "path": "raw-results-and-driver.tar.gz:build-logs/build-counter-fix.txt",
      "bytes": 941,
      "sha256": "555871b75483d47ef9d82817370d08130f70a8e0169e3a8a399b28c770f65e5d"
    },
    {
      "path": "raw-results-and-driver.tar.gz:build-logs/build-cpu-encoding.txt",
      "bytes": 12784,
      "sha256": "ce8602ec7bda3ca31245b91d9a414013ade0ff644d0f70bc03d7cc085ea4b7a5"
    },
    {
      "path": "raw-results-and-driver.tar.gz:build-logs/build-natural-counters.txt",
      "bytes": 994,
      "sha256": "453b5967642ac768fd9dcba240cc9b68cc35d7259e6ab79bb1dabbfcdc4fc171"
    },
    {
      "path": "restoration-proof.json",
      "bytes": 2443,
      "sha256": "20e5e132d34f72002fe2610130240502daeab3eb1311e248138a2dfbc5a5cea1"
    }
  ]
}

````````````

## Artifact SHA-256 5f18656f8282627a79e8eb0088186480e5e2bc5a27dcd5a9b4ee6e3f26364a7a

Encoding: `gzip+base64`. Original bytes: 1456497.

````````````text
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
````````````

## Artifact SHA-256 5716d0d51234f0acab9e5ffd845fe0afb27d93c2d8aa501607dd5a614900aa6f

Encoding: `gzip+base64`. Original bytes: 87742.

````````````text
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
````````````

## Artifact SHA-256 04bcac4591489127f79b7da4dd1a01996ab5786e1f5a6a5775189c1ce26ea371

Encoding: `utf-8`. Original bytes: 5118.

````````````text
from pathlib import Path
import hashlib, json, os, signal, subprocess, sys, time

ROOT = Path('/Users/carlos/Projects/slotstream')
BASE = ROOT / '.build/release-preparation-v0.2.14'
DIST = BASE / 'public-download'
CI_RUN = '34539578315'
RELEASE_RUN = sys.argv[1]
report = {'release': 'v0.2.14', 'release_run': RELEASE_RUN,
          'main_ci_run': CI_RUN, 'started_at_unix': time.time(), 'stages': []}
def save():
    (BASE / 'public-install-result.json').write_text(json.dumps(report, indent=2) + '\n')
def run(label, command, timeout):
    print(label, flush=True)
    start = time.time()
    log = BASE / (label + '.log')
    with log.open('wb') as out:
        result = subprocess.run(command, cwd=ROOT, stdin=subprocess.DEVNULL,
                                stdout=out, stderr=subprocess.STDOUT, timeout=timeout)
    report['stages'].append({'name': label, 'command': command,
                            'exit_code': result.returncode,
                            'seconds': time.time()-start, 'log': str(log)})
    save()
    if result.returncode:
        raise RuntimeError(f'{label} failed: {log}')

run('await-public-release', ['gh', 'run', 'watch', RELEASE_RUN, '--interval', '15', '--exit-status'], 1800)
ci = json.loads(subprocess.check_output(['gh', 'run', 'view', CI_RUN,
    '--json', 'status,conclusion,headSha,jobs,url'], cwd=ROOT, text=True))
qualified = json.loads((BASE / 'tag-qualification.json').read_text())
assert ci['status'] == 'completed' and ci['conclusion'] == 'success'
assert ci['headSha'] == qualified['release_commit']
report['complete_ci'] = ci
DIST.mkdir(exist_ok=False)
release = json.loads(subprocess.check_output(['gh', 'api', 'repos/carloslfu/slotstream/releases/latest'], text=True))
assert release['tag_name'] == 'v0.2.14' and not release['draft'] and not release['prerelease']
(DIST / 'release.json').write_text(json.dumps(release, indent=2) + '\n')
run('download-public-artifact', ['gh', 'release', 'download', 'v0.2.14', '--pattern',
    'slotstream-arm64.tar.gz*', '--dir', str(DIST)], 600)
ci_dist = BASE / 'successful-ci-candidate'
run('download-successful-ci-candidate', ['gh', 'run', 'download', CI_RUN, '--name',
    'slotstream-ci-candidate', '--dir', str(ci_dist)], 600)
archive = DIST / 'slotstream-arm64.tar.gz'
actual = hashlib.sha256(archive.read_bytes()).hexdigest()
assert actual == hashlib.sha256((ci_dist / archive.name).read_bytes()).hexdigest()
report['archive_sha256'] = actual
report['published_bytes_equal_successful_ci'] = True
save()
run('verify-public-attestation', ['gh', 'attestation', 'verify', str(archive),
    '--repo', 'carloslfu/slotstream'], 600)
stage = DIST / 'extracted'
run('verify-public-source-archive', ['python3', 'Tools/release_candidate.py',
    '--archive', str(archive), '--output', str(stage)], 120)
identity = json.loads((stage / 'build-identity.json').read_text())
assert identity['source'] == qualified['compiled_source_files']
report['public_identity'] = identity
report['source_archive_verified'] = True
save()

# Pause only the precisely identified normal demo process, if it still exists.
# A replacement or unknown process remains untouched and the preflight refuses.
prior = json.loads((BASE / 'demo-before-local-acceptance.json').read_text())
pid = prior['pid']
observed = subprocess.run(['ps', '-p', str(pid), '-o', 'lstart=,command='],
                          capture_output=True, text=True)
report['demo_observation'] = {'exit_code': observed.returncode,
    'ps_identity': observed.stdout.strip(), 'observed_at_unix': time.time()}
if observed.returncode == 0:
    assert observed.stdout.strip() == prior['ps_identity'], 'original demo PID was reused'
    old_binary = Path.home() / '.slotstream/bin/slotstream'
    assert hashlib.sha256(old_binary.read_bytes()).hexdigest() == prior['binary_sha256']
    os.kill(pid, signal.SIGTERM)
    for _ in range(60):
        if subprocess.run(['ps', '-p', str(pid)], stdout=subprocess.DEVNULL).returncode:
            break
        time.sleep(0.5)
    else:
        raise RuntimeError('normal demo did not stop; refusing to start acceptance')
    report['demo_paused_by_release'] = True
else:
    assert observed.returncode == 1 and not observed.stdout.strip()
    report['demo_paused_by_release'] = False
sys.path.insert(0, str(ROOT / 'Tools'))
from prefill_bench import preflight
report['preinstallation_preflight'] = preflight(20.5)
save()

installer = BASE / 'public-install.sh'
assert installer.read_bytes() == (ROOT / 'install.sh').read_bytes()
run('public-installer', ['sh', str(installer)], 600)
installed = (Path.home() / '.slotstream/bin').resolve()
for name in ('slotstream', 'mlx.metallib', 'build-identity.json', 'build-source.tar.gz'):
    assert (installed / name).read_bytes() == (stage / name).read_bytes()
report['installed_directory'] = str(installed)
report['installer_preserved_exact_public_bytes'] = True
save()
run('local-public-acceptance', ['python3', str(BASE / 'local-public-acceptance.py')], 10000)
report['passed'] = True
report['finished_at_unix'] = time.time()
save()
print('Public installation and local acceptance passed', flush=True)

````````````

## Artifact SHA-256 203df20d853a355ddb13efcf35a93217ea9b1593297be0b02914a752eac8b7bf

Encoding: `utf-8`. Original bytes: 3490.

````````````text
{
  "version": "0.2.14",
  "distribution": "GitHub Actions release archive, public checksum and verified GitHub attestation",
  "installation": "Run the public installer against its default latest release URL after checking that latest is v0.2.14. Retain previous release directory.",
  "local_acceptance": [
    {
      "command": "SLOTSTREAM_TEST_BINARY=<installed binary> SLOTSTREAM_VERIFY_OUT=<fresh path> Tools/verify.sh",
      "required": "All 25 original gates pass, no skipped required gate; existing memory preflights and exact workloads unchanged."
    },
    {
      "command": "BIN=<installed binary> Tools/e2e_release.sh 11530",
      "server": "<installed binary> serve --port 11530 --memory-gb 10 --mtp off --no-elastic",
      "required": "All 31 installed-release checks pass, no failed or empty replies counted as parity."
    }
  ],
  "existing_server": "The completed profiling task restored the normal demo server, PID 17362, cwd /Users/carlos/slotstream-demo. Verify its exact process identity and original binary, pause it after public archive verification, then restore normal serving with the released binary after acceptance.",
  "source_binding": "CI make build records source hashes before and after compilation; attested archive contains binary, metallib, identity and source archive.",
  "driver_sha256": {
    "Tools/verify.sh": "4eb4c0990bb7a92141f9510800457985a9ed0c40b4db601d36acfd30cd9d65e4",
    "Tools/e2e_release.sh": "b4762272eca921614d46ec6a4d4bcc28e939bcd22639f7e9bbf5fca0ceaedca7",
    "Tools/planner_gates.sh": "b87f9a9566c64929a7875e96430164c142b49e1f4d50c577c2822334a5992423",
    "Tools/sampler_gates.sh": "7e781d7593224973597906e7031c7ab143ab4dff540dd4bf86542e52cb7ed144",
    "Tools/api_robustness.sh": "a7397ac2f5df3a7eb8f7e1578daef51124c1c7fdabd0526c13518b8048984a96",
    "Tools/vision_serving.py": "6afd42ebefd87619d3ccb6dc96172366483ea94f7e86ecc0215a7bdf3c6b76fb",
    "Tools/vision_ref.py": "fa62575c947392f990841e6ac90656737eb67edb000ab369d7b7a0f66a05ef29",
    "Tools/memory_gate.py": "9d09d3aade7b1e1f9180f3779a651480f2d7b6ab194065820831c136c3c6cc9c",
    "Tools/long_context_gate.py": "b7422f009eaf24b079c87cc3ed847840ea941e4a141d5357fc240ad5945a54ee",
    "Tools/prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "Tools/serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
    "install.sh": "8fc9b91156e1f92d6ef1efcda72ae339fcdf3987a9f7c2021a2c6d02ac19d8f1"
  },
  "performance_scope": "Correctness and release acceptance. Do not reinterpret functional test durations as new paired optimization measurements.",
  "planner_correction": "Validate exact metadata errors independently, then require the same parser error or exact planner/model-allocation memory refusal. Retain all fixtures and print both command diagnostics on failure.",
  "wrapper_sha256": "6bddcbc80091a77eca847280c35801913036f4e0be6bf1eb9f06f39dc55594ba",
  "publication": "Only after complete main CI success; release signs and publishes that exact candidate archive without recompilation.",
  "installer_orchestrator_sha256": "04bcac4591489127f79b7da4dd1a01996ab5786e1f5a6a5775189c1ce26ea371",
  "observed_demo_exit": {
    "observed_at_unix": 1789081390.231928,
    "pid": 17362,
    "process_absent": true,
    "port_11434_has_no_listener": true,
    "note": "Read-only process and port inventory before release found the restored demo already stopped. No process was signaled."
  }
}

````````````

## Artifact SHA-256 6bddcbc80091a77eca847280c35801913036f4e0be6bf1eb9f06f39dc55594ba

Encoding: `utf-8`. Original bytes: 4518.

````````````text
from pathlib import Path
import hashlib, json, os, re, shutil, signal, subprocess, sys, time, urllib.request
ROOT = Path('/Users/carlos/Projects/slotstream')
BASE = ROOT / '.build/release-preparation-v0.2.14'
OUT = BASE / 'installed-public-acceptance'
OUT.mkdir(exist_ok=False)
sys.path.insert(0, str(ROOT / 'Tools'))
from prefill_bench import preflight
from serve_bench import verified_build
binary = (Path.home() / '.slotstream/bin/slotstream').resolve()
env = {k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG')) and k not in ('BIN', 'PYTHON')}
env.update(BIN=str(binary), SLOTSTREAM_TEST_BINARY=str(binary), SLOTSTREAM_VERIFY_OUT=str(OUT / 'verify'))
protocol = json.loads((BASE / 'local-acceptance-protocol.json').read_text())
for name, expected in protocol['driver_sha256'].items():
    assert hashlib.sha256((ROOT / name).read_bytes()).hexdigest() == expected, name
assert subprocess.check_output([str(binary), '--version'], text=True).strip() == '0.2.14'
identity = verified_build(binary)
(OUT / 'identity.json').write_text(json.dumps(identity, indent=2) + '\n')
result = {'binary': str(binary), 'started_at_unix': time.time(), 'stages': []}
def save():
    (OUT / 'result.json').write_text(json.dumps(result, indent=2) + '\n')
def run(command, log, timeout):
    started = time.time()
    with log.open('wb') as target:
        child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=target, stderr=subprocess.STDOUT, start_new_session=True)
        try:
            status = child.wait(timeout=timeout)
        except BaseException:
            os.killpg(child.pid, signal.SIGTERM)
            try: child.wait(timeout=30)
            except subprocess.TimeoutExpired:
                os.killpg(child.pid, signal.SIGKILL); child.wait()
            raise
    return {'command': command, 'exit_code': status, 'seconds': time.time()-started, 'log': str(log)}
print('Starting full public-artifact model acceptance', flush=True)
result['preflight'] = preflight(20.5)
save()
stage = run(['bash', 'Tools/verify.sh'], OUT / 'verify.log', 7200)
text = (OUT / 'verify.log').read_text()
stage['passed'] = stage['exit_code'] == 0 and re.search(r'^passed 25, failed 0$', text, re.M) is not None and re.search(r'^(FAIL|SKIP) ', text, re.M) is None
result['stages'].append(stage)
raw = OUT / 'verify-temporary-results'; raw.mkdir()
for pattern in ('ssv_*.json', 'ssv_*.txt', 'ssv_*.err', 'ssv_*.log', 'ssv-vision-serve.log'):
    for p in Path('/tmp').glob(pattern):
        if p.is_file() and not p.is_symlink() and p.stat().st_mtime >= result['started_at_unix']:
            shutil.copy2(p, raw / p.name)
save()
print('Full model acceptance:', stage['passed'], flush=True)
assert stage['passed'], 'Full acceptance failed; see preserved logs'
print('Starting installed-release API acceptance', flush=True)
result['e2e_preflight'] = preflight(13)
server_command = [str(binary), 'serve', '--port', '11530', '--memory-gb', '10', '--mtp', 'off', '--no-elastic']
server_log = (OUT / 'e2e-server.log').open('wb')
server = subprocess.Popen(server_command, cwd=ROOT, env=env, stdout=server_log, stderr=subprocess.STDOUT, start_new_session=True)
opener = urllib.request.build_opener(urllib.request.ProxyHandler({}))
try:
    for _ in range(180):
        if server.poll() is not None: raise RuntimeError('test server exited during startup')
        try:
            with opener.open('http://127.0.0.1:11530/api/version', timeout=2) as response:
                version = json.load(response)
            assert version['version'] == '0.2.14'
            break
        except (OSError, ValueError): time.sleep(1)
    else: raise RuntimeError('test server did not become ready')
    stage = run(['bash', 'Tools/e2e_release.sh', '11530'], OUT / 'e2e.log', 1800)
    stage['server_command'] = server_command
    text = (OUT / 'e2e.log').read_text()
    stage['passed'] = stage['exit_code'] == 0 and 'e2e: passed 31, failed 0' in text
    result['stages'].append(stage)
finally:
    if server.poll() is None:
        server.terminate()
        try: server.wait(timeout=30)
        except subprocess.TimeoutExpired: server.kill(); server.wait()
    server_log.close()
    result['test_server_stopped'] = server.poll() is not None
    save()
result['finished_at_unix'] = time.time()
result['passed'] = all(s['passed'] for s in result['stages']) and len(result['stages']) == 2
save()
print('Public-artifact acceptance complete:', result['passed'], flush=True)
raise SystemExit(0 if result['passed'] else 1)

````````````

## Artifact SHA-256 41962b7e6a63f095d6bfb7350e5704bf4bf99803cdf753dbc926a07ce94aa83a

Encoding: `utf-8`. Original bytes: 18603.

````````````text
{
  "source": {
    "Makefile": "1de4b2db83678e0705ebd955698b6d5fe053e0e3dc86a9326523ac23d219c567",
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
    "Sources/Slotstream/Context.swift": "af310ab4ca9eb15b81b02e364164e07d0b56090997b6965538aa1583ac864a0f",
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
    "Sources/Slotstream/Generate.swift": "ea743f98a23cfada2157290dcc591e85a977db7d537dd57ee6cb76925d6dd9ec",
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
    "Sources/Slotstream/Optimizations.swift": "c4e09b8b6846abd3f6ac680c8c6723e9f123f84469ca4426afbab4375a2eb91c",
    "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
    "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
    "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
    "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
    "Sources/Slotstream/Plan.swift": "5b4ccdd593c3d4e74d874613014663fe8e2805c034a6e3990fa35523ed4e0223",
    "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
    "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
    "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
    "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
    "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
    "Sources/Slotstream/RequestControl.swift": "1e393e5ccc31528e2215c9a7ba72ece6b411d2772e1bd2225191b5ed46d87ecc",
    "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
    "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
    "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
    "Sources/Slotstream/Server.swift": "c20776840aa9551958d8fed92389c8fc32318c97639bd14d93609233dc449334",
    "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
    "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
    "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
    "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
    "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
    "Sources/Slotstream/Version.swift": "28819ff10769800812f83f7fc8bb83bccf19c29ce29bf9f06c4ffbe2be49ae14",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "fec6dda4397daa0b5293e3d9cc617cadc17e409a5627ed8a15b9b2bea205deca",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "35d99deb614da4ffdfef075eabdc5a1c8b3518bf9accf265796e09f2c7c281ee",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
    "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
    "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
    "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "f40d8e711121f12cbcd95f8880d483ac36995faeab06af714d201fa1671348f1",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "b76e9185930a90d2509f9d7dfc247afee3ff2a083a1bc6bb3da6d090653d290f",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "d3bef4297f9502a90866c04785c74ecb24659dc38d3f0062d90eaa72431a79df",
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
    "Sources/SlotstreamTestKit/OpenAIChecks.swift": "7b25dbc7700bc8dd23d896278f8dca2102ad59d473cb1f374958743a1a1a0b08",
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
    "Sources/slotstream-cli/main.swift": "8e44c6205300d28fd8874c0b1185c7260c510dc8c4324b79678aa6051fce10cf",
    "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "f5329fcd9e5080de2a83c62c518ccf16ee2bb060d6f7c1e893d2fc43f521ab79",
  "binary_sha256": "49d36b8057a79c013ef0d91b93b67ea0a987efb32e6dd5df6f03b6843b76e9f7",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}

````````````

## Artifact SHA-256 2e26ea8f0ea11436d704d78861ec7a4c0e7704d834f8c62697407cfabe0b5cc3

Encoding: `utf-8`. Original bytes: 6692.

````````````text
{
  "url": "https://api.github.com/repos/carloslfu/slotstream/releases/386682506",
  "assets_url": "https://api.github.com/repos/carloslfu/slotstream/releases/386682506/assets",
  "upload_url": "https://uploads.github.com/repos/carloslfu/slotstream/releases/386682506/assets{?name,label}",
  "html_url": "https://github.com/carloslfu/slotstream/releases/tag/v0.2.14",
  "id": 386682506,
  "author": {
    "login": "github-actions[bot]",
    "id": 41898282,
    "node_id": "MDM6Qm90NDE4OTgyODI=",
    "avatar_url": "https://avatars.githubusercontent.com/in/15368?v=4",
    "gravatar_id": "",
    "url": "https://api.github.com/users/github-actions%5Bbot%5D",
    "html_url": "https://github.com/apps/github-actions",
    "followers_url": "https://api.github.com/users/github-actions%5Bbot%5D/followers",
    "following_url": "https://api.github.com/users/github-actions%5Bbot%5D/following{/other_user}",
    "gists_url": "https://api.github.com/users/github-actions%5Bbot%5D/gists{/gist_id}",
    "starred_url": "https://api.github.com/users/github-actions%5Bbot%5D/starred{/owner}{/repo}",
    "subscriptions_url": "https://api.github.com/users/github-actions%5Bbot%5D/subscriptions",
    "organizations_url": "https://api.github.com/users/github-actions%5Bbot%5D/orgs",
    "repos_url": "https://api.github.com/users/github-actions%5Bbot%5D/repos",
    "events_url": "https://api.github.com/users/github-actions%5Bbot%5D/events{/privacy}",
    "received_events_url": "https://api.github.com/users/github-actions%5Bbot%5D/received_events",
    "type": "Bot",
    "user_view_type": "public",
    "site_admin": false
  },
  "node_id": "RE_kwDOUGx0ws4XDE6K",
  "tag_name": "v0.2.14",
  "target_commitish": "main",
  "name": "v0.2.14",
  "draft": false,
  "immutable": false,
  "prerelease": false,
  "created_at": "2026-09-10T22:52:39Z",
  "updated_at": "2026-09-10T23:14:09Z",
  "published_at": "2026-09-10T23:14:09Z",
  "assets": [
    {
      "url": "https://api.github.com/repos/carloslfu/slotstream/releases/assets/556001918",
      "id": 556001918,
      "node_id": "RA_kwDOUGx0ws4hI-p-",
      "name": "slotstream-arm64.tar.gz",
      "label": "",
      "uploader": {
        "login": "github-actions[bot]",
        "id": 41898282,
        "node_id": "MDM6Qm90NDE4OTgyODI=",
        "avatar_url": "https://avatars.githubusercontent.com/in/15368?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/github-actions%5Bbot%5D",
        "html_url": "https://github.com/apps/github-actions",
        "followers_url": "https://api.github.com/users/github-actions%5Bbot%5D/followers",
        "following_url": "https://api.github.com/users/github-actions%5Bbot%5D/following{/other_user}",
        "gists_url": "https://api.github.com/users/github-actions%5Bbot%5D/gists{/gist_id}",
        "starred_url": "https://api.github.com/users/github-actions%5Bbot%5D/starred{/owner}{/repo}",
        "subscriptions_url": "https://api.github.com/users/github-actions%5Bbot%5D/subscriptions",
        "organizations_url": "https://api.github.com/users/github-actions%5Bbot%5D/orgs",
        "repos_url": "https://api.github.com/users/github-actions%5Bbot%5D/repos",
        "events_url": "https://api.github.com/users/github-actions%5Bbot%5D/events{/privacy}",
        "received_events_url": "https://api.github.com/users/github-actions%5Bbot%5D/received_events",
        "type": "Bot",
        "user_view_type": "public",
        "site_admin": false
      },
      "content_type": "application/x-gtar",
      "state": "uploaded",
      "size": 54199881,
      "digest": "sha256:2fd5bfab8073b29095148274b0e5857a43dc20bc530bcacb4c9180ccc5ac2b52",
      "download_count": 0,
      "created_at": "2026-09-10T23:14:06Z",
      "updated_at": "2026-09-10T23:14:08Z",
      "browser_download_url": "https://github.com/carloslfu/slotstream/releases/download/v0.2.14/slotstream-arm64.tar.gz"
    },
    {
      "url": "https://api.github.com/repos/carloslfu/slotstream/releases/assets/556001919",
      "id": 556001919,
      "node_id": "RA_kwDOUGx0ws4hI-p_",
      "name": "slotstream-arm64.tar.gz.sha256",
      "label": "",
      "uploader": {
        "login": "github-actions[bot]",
        "id": 41898282,
        "node_id": "MDM6Qm90NDE4OTgyODI=",
        "avatar_url": "https://avatars.githubusercontent.com/in/15368?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/github-actions%5Bbot%5D",
        "html_url": "https://github.com/apps/github-actions",
        "followers_url": "https://api.github.com/users/github-actions%5Bbot%5D/followers",
        "following_url": "https://api.github.com/users/github-actions%5Bbot%5D/following{/other_user}",
        "gists_url": "https://api.github.com/users/github-actions%5Bbot%5D/gists{/gist_id}",
        "starred_url": "https://api.github.com/users/github-actions%5Bbot%5D/starred{/owner}{/repo}",
        "subscriptions_url": "https://api.github.com/users/github-actions%5Bbot%5D/subscriptions",
        "organizations_url": "https://api.github.com/users/github-actions%5Bbot%5D/orgs",
        "repos_url": "https://api.github.com/users/github-actions%5Bbot%5D/repos",
        "events_url": "https://api.github.com/users/github-actions%5Bbot%5D/events{/privacy}",
        "received_events_url": "https://api.github.com/users/github-actions%5Bbot%5D/received_events",
        "type": "Bot",
        "user_view_type": "public",
        "site_admin": false
      },
      "content_type": "application/octet-stream",
      "state": "uploaded",
      "size": 90,
      "digest": "sha256:3cd14233bf34c764a76f824925ed1a8b2425cc70829857a7b2077e17917c96cd",
      "download_count": 0,
      "created_at": "2026-09-10T23:14:06Z",
      "updated_at": "2026-09-10T23:14:06Z",
      "browser_download_url": "https://github.com/carloslfu/slotstream/releases/download/v0.2.14/slotstream-arm64.tar.gz.sha256"
    }
  ],
  "tarball_url": "https://api.github.com/repos/carloslfu/slotstream/tarball/v0.2.14",
  "zipball_url": "https://api.github.com/repos/carloslfu/slotstream/zipball/v0.2.14",
  "body": "Built and tested by CI from commit ac7d7e53ca2397bb8840a97f028509fbb0a8f688 (build and complete CI log: https://github.com/carloslfu/slotstream/actions/runs/34539578315).\n\nThis release publishes that exact archive after source verification and signing (release log: https://github.com/carloslfu/slotstream/actions/runs/34541172114).\n\nsha256: 2fd5bfab8073b29095148274b0e5857a43dc20bc530bcacb4c9180ccc5ac2b52\n\nVerify provenance: gh attestation verify slotstream-arm64.tar.gz --repo carloslfu/slotstream\n\nInstall or upgrade: curl -fsSL https://raw.githubusercontent.com/carloslfu/slotstream/main/install.sh | sh"
}

````````````

## Artifact SHA-256 3cd14233bf34c764a76f824925ed1a8b2425cc70829857a7b2077e17917c96cd

Encoding: `utf-8`. Original bytes: 90.

````````````text
2fd5bfab8073b29095148274b0e5857a43dc20bc530bcacb4c9180ccc5ac2b52  slotstream-arm64.tar.gz

````````````

## Artifact SHA-256 0a74b54db02e0abdcd700fd59fd7417802c9c1423574ad8ec59e3f6f983b1ce6

Encoding: `gzip+base64`. Original bytes: 2299.

````````````text
H4sIAAAAAAAC/63Wy2rEIBQG4H0g73BABlpojRqtY6Gb7ktXfQCnkSFgFaK9PH6TToeEXmfGY7b68R+PJunia/DRdn3YQvIxpzw4+wRn3maXMgzOO5vcBdhNfM6gGNzdnlfkZnwAbdSE3JNLgupN+bDEusarFRhlK1xPIntmVSM2l1ON6gmqRg8PbKf9I3ig3OVDAxVd7zwkUO/zIYGGXu09DJFzKmavHOQtbRdescjnfqCI3HzJV2gK+XmeCY4pzLd6i8xWfbxf/hrHXTc+n2cMVZp/8x3FKvNrP06CNV/et3JT6wP370B4fWq9P7ucTd/Lqg8pW+9dt/xHYVRQLiFHaB6SG1LzaAcfU0PnOc2mD1Vwb/kalivH2S+uegceUtkA+wgAAA==
````````````

## Artifact SHA-256 830696b786bbac56453eb90e91f21241c3b819c11130c397dfcdd6f6b1947cc8

Encoding: `utf-8`. Original bytes: 23401.

````````````text
public-library	Set up job	﻿2026-09-10T22:53:12.2168200Z Current runner version: '2.337.0'
public-library	Set up job	2026-09-10T22:53:12.2185270Z ##[group]Runner Image Provisioner
public-library	Set up job	2026-09-10T22:53:12.2185860Z Hosted Compute Agent
public-library	Set up job	2026-09-10T22:53:12.2186250Z Version: 20260828.587
public-library	Set up job	2026-09-10T22:53:12.2186680Z Commit: abac92662cab4cc7352de4f9f9d2e2419aad9c29
public-library	Set up job	2026-09-10T22:53:12.2187160Z Build Date: 2026-08-28T16:44:25Z
public-library	Set up job	2026-09-10T22:53:12.2187680Z Worker ID: {183b746f-2e5e-41b7-a81b-7807d4cbef5f}
public-library	Set up job	2026-09-10T22:53:12.2188190Z Azure Region: westus
public-library	Set up job	2026-09-10T22:53:12.2188580Z ##[endgroup]
public-library	Set up job	2026-09-10T22:53:12.2189460Z ##[group]Operating System
public-library	Set up job	2026-09-10T22:53:12.2189890Z macOS
public-library	Set up job	2026-09-10T22:53:12.2190300Z 26.6.2
public-library	Set up job	2026-09-10T22:53:12.2190630Z 25G83
public-library	Set up job	2026-09-10T22:53:12.2190980Z ##[endgroup]
public-library	Set up job	2026-09-10T22:53:12.2191340Z ##[group]Runner Image
public-library	Set up job	2026-09-10T22:53:12.2191730Z Image: macos-26-arm64
public-library	Set up job	2026-09-10T22:53:12.2192110Z Version: 20260907.0351.1
public-library	Set up job	2026-09-10T22:53:12.2192860Z Included Software: https://github.com/actions/runner-images/blob/macos-26-arm64/20260907.0351/images/macos/macos-26-arm64-Readme.md
public-library	Set up job	2026-09-10T22:53:12.2194200Z Image Release: https://github.com/actions/runner-images/releases/tag/macos-26-arm64%2F20260907.0351
public-library	Set up job	2026-09-10T22:53:12.2194880Z ##[endgroup]
public-library	Set up job	2026-09-10T22:53:12.2195630Z ##[group]GITHUB_TOKEN Permissions
public-library	Set up job	2026-09-10T22:53:12.2196780Z Contents: read
public-library	Set up job	2026-09-10T22:53:12.2197150Z Metadata: read
public-library	Set up job	2026-09-10T22:53:12.2197530Z ##[endgroup]
public-library	Set up job	2026-09-10T22:53:12.2198930Z Secret source: Actions
public-library	Set up job	2026-09-10T22:53:12.2199530Z Cache mode: write
public-library	Set up job	2026-09-10T22:53:12.2199980Z Prepare workflow directory
public-library	Set up job	2026-09-10T22:53:12.2427480Z Prepare all required actions
public-library	Set up job	2026-09-10T22:53:12.2465670Z Getting action download info
public-library	Set up job	2026-09-10T22:53:12.5035920Z Download action repository 'actions/checkout@v7' (SHA:3d3c42e5aac5ba805825da76410c181273ba90b1)
public-library	Set up job	2026-09-10T22:53:12.7731970Z Complete job name: public-library
public-library	Run actions/checkout@v7	﻿2026-09-10T22:53:12.8153570Z ##[group]Run actions/checkout@v7
public-library	Run actions/checkout@v7	2026-09-10T22:53:12.8154200Z with:
public-library	Run actions/checkout@v7	2026-09-10T22:53:12.8154550Z   repository: carloslfu/slotstream
public-library	Run actions/checkout@v7	2026-09-10T22:53:12.8157440Z   token: ***
public-library	Run actions/checkout@v7	2026-09-10T22:53:12.8157780Z   ssh-strict: true
public-library	Run actions/checkout@v7	2026-09-10T22:53:12.8158100Z   ssh-user: git
public-library	Run actions/checkout@v7	2026-09-10T22:53:12.8158430Z   persist-credentials: true
public-library	Run actions/checkout@v7	2026-09-10T22:53:12.8158780Z   clean: true
public-library	Run actions/checkout@v7	2026-09-10T22:53:12.8159100Z   sparse-checkout-cone-mode: true
public-library	Run actions/checkout@v7	2026-09-10T22:53:12.8159470Z   fetch-depth: 1
public-library	Run actions/checkout@v7	2026-09-10T22:53:12.8159780Z   fetch-tags: false
public-library	Run actions/checkout@v7	2026-09-10T22:53:12.8160110Z   show-progress: true
public-library	Run actions/checkout@v7	2026-09-10T22:53:12.8160440Z   lfs: false
public-library	Run actions/checkout@v7	2026-09-10T22:53:12.8160750Z   submodules: false
public-library	Run actions/checkout@v7	2026-09-10T22:53:12.8161090Z   set-safe-directory: true
public-library	Run actions/checkout@v7	2026-09-10T22:53:12.8161460Z   allow-unsafe-pr-checkout: false
public-library	Run actions/checkout@v7	2026-09-10T22:53:12.8161940Z ##[endgroup]
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.1450700Z Syncing repository: carloslfu/slotstream
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.1454870Z ##[group]Getting Git version info
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.1455510Z Working directory is '/Users/runner/work/slotstream/slotstream'
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.1456500Z [command]/opt/homebrew/bin/git version
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.1899330Z git version 2.55.0
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.1910130Z ##[endgroup]
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.1915110Z Copying '/Users/runner/.gitconfig' to '/Users/runner/work/_temp/9588784a-6674-4977-a51d-dc4b1f8238cb/.gitconfig'
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.1921050Z Temporarily overriding HOME='/Users/runner/work/_temp/9588784a-6674-4977-a51d-dc4b1f8238cb' before making global git config changes
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.1922040Z Adding repository directory to the temporary git global config as a safe directory
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.1936350Z [command]/opt/homebrew/bin/git config --global --add safe.directory /Users/runner/work/slotstream/slotstream
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.2033300Z Deleting the contents of '/Users/runner/work/slotstream/slotstream'
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.2035530Z ##[group]Determining repository object format
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.2037010Z ##[endgroup]
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.2037670Z ##[group]Initializing the repository
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.2039980Z [command]/opt/homebrew/bin/git init /Users/runner/work/slotstream/slotstream
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.2248780Z hint: Using 'master' as the name for the initial branch. This default branch name
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.2255340Z hint: will change to "main" in Git 3.0. To configure the initial branch name
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.2256250Z hint: to use in all of your new repositories, which will suppress this warning,
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.2256950Z hint: call:
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.2257400Z hint:
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.2258060Z hint: 	git config --global init.defaultBranch <name>
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.2259460Z hint:
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.2260120Z hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.2260960Z hint: 'development'. The just-created branch can be renamed via this command:
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.2261690Z hint:
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.2262150Z hint: 	git branch -m <name>
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.2262710Z hint:
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.2264510Z hint: Disable this message with "git config set advice.defaultBranchName false"
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.2265670Z Initialized empty Git repository in /Users/runner/work/slotstream/slotstream/.git/
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.2267510Z [command]/opt/homebrew/bin/git remote add origin https://github.com/carloslfu/slotstream
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.2336690Z ##[endgroup]
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.2337350Z ##[group]Disabling automatic garbage collection
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.2339170Z [command]/opt/homebrew/bin/git config --local gc.auto 0
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.2399380Z ##[endgroup]
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.2401020Z ##[group]Setting up auth
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.2401540Z Removing SSH command configuration
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.2403410Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp core\.sshCommand
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.2479770Z [command]/opt/homebrew/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :"
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.3364980Z Removing HTTP extra header
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.3368590Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.3422170Z [command]/opt/homebrew/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :"
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.4067250Z Removing includeIf entries pointing to credentials config files
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.4070690Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp ^includeIf\.gitdir:
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.4129840Z [command]/opt/homebrew/bin/git submodule foreach --recursive git config --local --show-origin --name-only --get-regexp remote.origin.url
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.5303470Z [command]/opt/homebrew/bin/git config --file /Users/runner/work/_temp/git-credentials-6a50f5e7-d070-40d4-aa9c-fe7692cf202c.config http.https://github.com/.extraheader AUTHORIZATION: basic ***
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.5305910Z [command]/opt/homebrew/bin/git config --local includeIf.gitdir:/Users/runner/work/slotstream/slotstream/.git.path /Users/runner/work/_temp/git-credentials-6a50f5e7-d070-40d4-aa9c-fe7692cf202c.config
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.5308050Z [command]/opt/homebrew/bin/git config --local includeIf.gitdir:/Users/runner/work/slotstream/slotstream/.git/worktrees/*.path /Users/runner/work/_temp/git-credentials-6a50f5e7-d070-40d4-aa9c-fe7692cf202c.config
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.5358590Z [command]/opt/homebrew/bin/git config --local includeIf.gitdir:/github/workspace/.git.path /github/runner_temp/git-credentials-6a50f5e7-d070-40d4-aa9c-fe7692cf202c.config
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.5410200Z [command]/opt/homebrew/bin/git config --local includeIf.gitdir:/github/workspace/.git/worktrees/*.path /github/runner_temp/git-credentials-6a50f5e7-d070-40d4-aa9c-fe7692cf202c.config
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.5460720Z ##[endgroup]
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.5461360Z ##[group]Fetching the repository
public-library	Run actions/checkout@v7	2026-09-10T22:53:13.5464930Z [command]/opt/homebrew/bin/git -c protocol.version=2 fetch --no-tags --prune --no-recurse-submodules --depth=1 origin +ac7d7e53ca2397bb8840a97f028509fbb0a8f688:refs/remotes/origin/main
public-library	Run actions/checkout@v7	2026-09-10T22:53:19.8420090Z From https://github.com/carloslfu/slotstream
public-library	Run actions/checkout@v7	2026-09-10T22:53:19.8449600Z  * [new ref]         ac7d7e53ca2397bb8840a97f028509fbb0a8f688 -> origin/main
public-library	Run actions/checkout@v7	2026-09-10T22:53:19.8654960Z [command]/opt/homebrew/bin/git branch --list --remote origin/main
public-library	Run actions/checkout@v7	2026-09-10T22:53:19.8672220Z   origin/main
public-library	Run actions/checkout@v7	2026-09-10T22:53:19.8674030Z [command]/opt/homebrew/bin/git rev-parse refs/remotes/origin/main
public-library	Run actions/checkout@v7	2026-09-10T22:53:19.8674750Z ac7d7e53ca2397bb8840a97f028509fbb0a8f688
public-library	Run actions/checkout@v7	2026-09-10T22:53:19.8676250Z ##[endgroup]
public-library	Run actions/checkout@v7	2026-09-10T22:53:19.8676970Z ##[group]Determining the checkout info
public-library	Run actions/checkout@v7	2026-09-10T22:53:19.8677730Z ##[endgroup]
public-library	Run actions/checkout@v7	2026-09-10T22:53:19.8678260Z [command]/opt/homebrew/bin/git sparse-checkout disable
public-library	Run actions/checkout@v7	2026-09-10T22:53:19.8679780Z [command]/opt/homebrew/bin/git config --local --unset-all extensions.worktreeConfig
public-library	Run actions/checkout@v7	2026-09-10T22:53:19.8725900Z ##[group]Checking out the ref
public-library	Run actions/checkout@v7	2026-09-10T22:53:19.8727040Z [command]/opt/homebrew/bin/git checkout --progress --force -B main refs/remotes/origin/main
public-library	Run actions/checkout@v7	2026-09-10T22:53:20.9753660Z Updating files:  77% (913/1181)
public-library	Run actions/checkout@v7	2026-09-10T22:53:20.9997920Z Updating files:  78% (922/1181)
public-library	Run actions/checkout@v7	2026-09-10T22:53:21.0439760Z Updating files:  79% (933/1181)
public-library	Run actions/checkout@v7	2026-09-10T22:53:21.0533290Z Updating files:  80% (945/1181)
public-library	Run actions/checkout@v7	2026-09-10T22:53:21.0643110Z Updating files:  81% (957/1181)
public-library	Run actions/checkout@v7	2026-09-10T22:53:21.0913040Z Updating files:  82% (969/1181)
public-library	Run actions/checkout@v7	2026-09-10T22:53:21.1224200Z Updating files:  83% (981/1181)
public-library	Run actions/checkout@v7	2026-09-10T22:53:21.1708810Z Updating files:  84% (993/1181)
public-library	Run actions/checkout@v7	2026-09-10T22:53:21.1831750Z Updating files:  85% (1004/1181)
public-library	Run actions/checkout@v7	2026-09-10T22:53:21.2110140Z Updating files:  86% (1016/1181)
public-library	Run actions/checkout@v7	2026-09-10T22:53:21.2436790Z Updating files:  87% (1028/1181)
public-library	Run actions/checkout@v7	2026-09-10T22:53:21.2742960Z Updating files:  88% (1040/1181)
public-library	Run actions/checkout@v7	2026-09-10T22:53:21.3206230Z Updating files:  89% (1052/1181)
public-library	Run actions/checkout@v7	2026-09-10T22:53:21.4634890Z Updating files:  90% (1063/1181)
public-library	Run actions/checkout@v7	2026-09-10T22:53:21.5119140Z Updating files:  91% (1075/1181)
public-library	Run actions/checkout@v7	2026-09-10T22:53:21.5513190Z Updating files:  92% (1087/1181)
public-library	Run actions/checkout@v7	2026-09-10T22:53:21.6286310Z Updating files:  93% (1099/1181)
public-library	Run actions/checkout@v7	2026-09-10T22:53:21.7062150Z Updating files:  94% (1111/1181)
public-library	Run actions/checkout@v7	2026-09-10T22:53:21.7503170Z Updating files:  95% (1122/1181)
public-library	Run actions/checkout@v7	2026-09-10T22:53:21.7830090Z Updating files:  96% (1134/1181)
public-library	Run actions/checkout@v7	2026-09-10T22:53:21.7934520Z Updating files:  97% (1146/1181)
public-library	Run actions/checkout@v7	2026-09-10T22:53:21.7950320Z Updating files:  98% (1158/1181)
public-library	Run actions/checkout@v7	2026-09-10T22:53:21.7968380Z Updating files:  99% (1170/1181)
public-library	Run actions/checkout@v7	2026-09-10T22:53:21.7969050Z Updating files: 100% (1181/1181)
public-library	Run actions/checkout@v7	2026-09-10T22:53:21.7969670Z Updating files: 100% (1181/1181), done.
public-library	Run actions/checkout@v7	2026-09-10T22:53:21.8021670Z Switched to a new branch 'main'
public-library	Run actions/checkout@v7	2026-09-10T22:53:21.8031610Z branch 'main' set up to track 'origin/main'.
public-library	Run actions/checkout@v7	2026-09-10T22:53:21.8098210Z ##[endgroup]
public-library	Run actions/checkout@v7	2026-09-10T22:53:21.8299080Z [command]/opt/homebrew/bin/git log -1 --format=%H
public-library	Run actions/checkout@v7	2026-09-10T22:53:21.8381900Z ac7d7e53ca2397bb8840a97f028509fbb0a8f688
public-library	toolchain	﻿2026-09-10T22:53:21.8593820Z ##[group]Run sudo xcode-select -s "$(ls -d /Applications/Xcode*.app | sort -V | tail -1)"
public-library	toolchain	2026-09-10T22:53:21.8594300Z ^[[36;1msudo xcode-select -s "$(ls -d /Applications/Xcode*.app | sort -V | tail -1)"^[[0m
public-library	toolchain	2026-09-10T22:53:21.8636410Z shell: /bin/bash -e {0}
public-library	toolchain	2026-09-10T22:53:21.8636670Z ##[endgroup]
public-library	the library is importable from outside the package	﻿2026-09-10T22:53:21.9341970Z ##[group]Run Tools/consumer_smoke.sh
public-library	the library is importable from outside the package	2026-09-10T22:53:21.9342300Z ^[[36;1mTools/consumer_smoke.sh^[[0m
public-library	the library is importable from outside the package	2026-09-10T22:53:21.9370130Z shell: /bin/bash -e {0}
public-library	the library is importable from outside the package	2026-09-10T22:53:21.9370310Z ##[endgroup]
public-library	the library is importable from outside the package	2026-09-10T22:57:15.5006730Z consumer ok: 53/layer, 48 s for 8k tokens, 25 pinned files, diagnostics 22 assertions
public-library	Post Run actions/checkout@v7	﻿2026-09-10T22:57:16.6176670Z Post job cleanup.
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:16.9158470Z [command]/opt/homebrew/bin/git version
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:16.9366170Z git version 2.55.0
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:16.9387400Z Copying '/Users/runner/.gitconfig' to '/Users/runner/work/_temp/050fe5cd-d4fd-4038-88e2-9a1ab697d83c/.gitconfig'
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:16.9393930Z Temporarily overriding HOME='/Users/runner/work/_temp/050fe5cd-d4fd-4038-88e2-9a1ab697d83c' before making global git config changes
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:16.9394810Z Adding repository directory to the temporary git global config as a safe directory
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:16.9399080Z [command]/opt/homebrew/bin/git config --global --add safe.directory /Users/runner/work/slotstream/slotstream
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:16.9507970Z Removing SSH command configuration
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:16.9510460Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp core\.sshCommand
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:17.0337450Z [command]/opt/homebrew/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :"
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:17.1682460Z Removing HTTP extra header
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:17.1686280Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:17.1741660Z [command]/opt/homebrew/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :"
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:17.2406390Z Removing includeIf entries pointing to credentials config files
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:17.2410640Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp ^includeIf\.gitdir:
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:17.2458750Z includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git.path
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:17.2459230Z includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git/worktrees/*.path
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:17.2459760Z includeif.gitdir:/github/workspace/.git.path
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:17.2460280Z includeif.gitdir:/github/workspace/.git/worktrees/*.path
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:17.2464620Z [command]/opt/homebrew/bin/git config --local --get-all includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git.path
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:17.2510910Z /Users/runner/work/_temp/git-credentials-6a50f5e7-d070-40d4-aa9c-fe7692cf202c.config
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:17.2517320Z [command]/opt/homebrew/bin/git config --local --unset includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git.path \/Users\/runner\/work\/_temp\/git\-credentials\-6a50f5e7\-d070\-40d4\-aa9c\-fe7692cf202c\.config
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:17.2575070Z [command]/opt/homebrew/bin/git config --local --get-all includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git/worktrees/*.path
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:17.2626240Z /Users/runner/work/_temp/git-credentials-6a50f5e7-d070-40d4-aa9c-fe7692cf202c.config
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:17.2636670Z [command]/opt/homebrew/bin/git config --local --unset includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git/worktrees/*.path \/Users\/runner\/work\/_temp\/git\-credentials\-6a50f5e7\-d070\-40d4\-aa9c\-fe7692cf202c\.config
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:17.2693170Z [command]/opt/homebrew/bin/git config --local --get-all includeif.gitdir:/github/workspace/.git.path
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:17.2742790Z /github/runner_temp/git-credentials-6a50f5e7-d070-40d4-aa9c-fe7692cf202c.config
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:17.2747840Z [command]/opt/homebrew/bin/git config --local --unset includeif.gitdir:/github/workspace/.git.path \/github\/runner_temp\/git\-credentials\-6a50f5e7\-d070\-40d4\-aa9c\-fe7692cf202c\.config
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:17.2799000Z [command]/opt/homebrew/bin/git config --local --get-all includeif.gitdir:/github/workspace/.git/worktrees/*.path
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:17.2847560Z /github/runner_temp/git-credentials-6a50f5e7-d070-40d4-aa9c-fe7692cf202c.config
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:17.2853500Z [command]/opt/homebrew/bin/git config --local --unset includeif.gitdir:/github/workspace/.git/worktrees/*.path \/github\/runner_temp\/git\-credentials\-6a50f5e7\-d070\-40d4\-aa9c\-fe7692cf202c\.config
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:17.2918220Z [command]/opt/homebrew/bin/git submodule foreach --recursive git config --local --show-origin --name-only --get-regexp remote.origin.url
public-library	Post Run actions/checkout@v7	2026-09-10T22:57:17.3607650Z Removing credentials config '/Users/runner/work/_temp/git-credentials-6a50f5e7-d070-40d4-aa9c-fe7692cf202c.config'
public-library	Complete job	﻿2026-09-10T22:57:17.3735890Z Cleaning up orphan processes

````````````

## Artifact SHA-256 85446ed8dc7cf8b89e62fdac8ab13be415a99b38489cd1ec47ae92e1dd51a7f3

Encoding: `utf-8`. Original bytes: 36764.

````````````text
publish	Set up job	﻿2026-09-10T23:13:41.3944760Z Current runner version: '2.337.0'
publish	Set up job	2026-09-10T23:13:41.3971130Z ##[group]Runner Image Provisioner
publish	Set up job	2026-09-10T23:13:41.3971810Z Hosted Compute Agent
publish	Set up job	2026-09-10T23:13:41.3972260Z Version: 20260828.587
publish	Set up job	2026-09-10T23:13:41.3972740Z Commit: abac92662cab4cc7352de4f9f9d2e2419aad9c29
publish	Set up job	2026-09-10T23:13:41.3973210Z Build Date: 2026-08-28T16:44:25Z
publish	Set up job	2026-09-10T23:13:41.3973640Z Worker ID: {cbb44352-8ddf-4be1-bda0-0492d86f3454}
publish	Set up job	2026-09-10T23:13:41.3974110Z Azure Region: westus
publish	Set up job	2026-09-10T23:13:41.3974460Z ##[endgroup]
publish	Set up job	2026-09-10T23:13:41.3975530Z ##[group]Operating System
publish	Set up job	2026-09-10T23:13:41.3975930Z macOS
publish	Set up job	2026-09-10T23:13:41.3976250Z 26.6.2
publish	Set up job	2026-09-10T23:13:41.3976580Z 25G83
publish	Set up job	2026-09-10T23:13:41.3976970Z ##[endgroup]
publish	Set up job	2026-09-10T23:13:41.3977360Z ##[group]Runner Image
publish	Set up job	2026-09-10T23:13:41.3977770Z Image: macos-26-arm64
publish	Set up job	2026-09-10T23:13:41.3978250Z Version: 20260831.0337.3
publish	Set up job	2026-09-10T23:13:41.3979060Z Included Software: https://github.com/actions/runner-images/blob/macos-26-arm64/20260831.0337/images/macos/macos-26-arm64-Readme.md
publish	Set up job	2026-09-10T23:13:41.3980770Z Image Release: https://github.com/actions/runner-images/releases/tag/macos-26-arm64%2F20260831.0337
publish	Set up job	2026-09-10T23:13:41.3981510Z ##[endgroup]
publish	Set up job	2026-09-10T23:13:41.3982960Z ##[group]GITHUB_TOKEN Permissions
publish	Set up job	2026-09-10T23:13:41.3984790Z Actions: read
publish	Set up job	2026-09-10T23:13:41.3985210Z Attestations: write
publish	Set up job	2026-09-10T23:13:41.3985580Z Contents: write
publish	Set up job	2026-09-10T23:13:41.3985950Z Metadata: read
publish	Set up job	2026-09-10T23:13:41.3986330Z ##[endgroup]
publish	Set up job	2026-09-10T23:13:41.3988190Z Secret source: Actions
publish	Set up job	2026-09-10T23:13:41.3988780Z Cache mode: write
publish	Set up job	2026-09-10T23:13:41.3989260Z Prepare workflow directory
publish	Set up job	2026-09-10T23:13:41.4319170Z Prepare all required actions
publish	Set up job	2026-09-10T23:13:41.4411840Z Getting action download info
publish	Set up job	2026-09-10T23:13:41.6232820Z Download action repository 'actions/checkout@v7' (SHA:3d3c42e5aac5ba805825da76410c181273ba90b1)
publish	Set up job	2026-09-10T23:13:42.0152500Z Download action repository 'actions/attest-build-provenance@v4' (SHA:4d101475d8b20a2381f78447822ac1eab6504dd8)
publish	Set up job	2026-09-10T23:13:42.5831270Z Getting action download info
publish	Set up job	2026-09-10T23:13:42.6564980Z Download action repository 'actions/attest@508db95dd578ae2727ebd6217d5ba78e4fbda05d' (SHA:508db95dd578ae2727ebd6217d5ba78e4fbda05d)
publish	Set up job	2026-09-10T23:13:43.7712730Z Complete job name: publish
publish	Run actions/checkout@v7	﻿2026-09-10T23:13:43.8653150Z ##[group]Run actions/checkout@v7
publish	Run actions/checkout@v7	2026-09-10T23:13:43.8654340Z with:
publish	Run actions/checkout@v7	2026-09-10T23:13:43.8654900Z   repository: carloslfu/slotstream
publish	Run actions/checkout@v7	2026-09-10T23:13:43.8661160Z   token: ***
publish	Run actions/checkout@v7	2026-09-10T23:13:43.8661820Z   ssh-strict: true
publish	Run actions/checkout@v7	2026-09-10T23:13:43.8662360Z   ssh-user: git
publish	Run actions/checkout@v7	2026-09-10T23:13:43.8662910Z   persist-credentials: true
publish	Run actions/checkout@v7	2026-09-10T23:13:43.8663510Z   clean: true
publish	Run actions/checkout@v7	2026-09-10T23:13:43.8664050Z   sparse-checkout-cone-mode: true
publish	Run actions/checkout@v7	2026-09-10T23:13:43.8664690Z   fetch-depth: 1
publish	Run actions/checkout@v7	2026-09-10T23:13:43.8665220Z   fetch-tags: false
publish	Run actions/checkout@v7	2026-09-10T23:13:43.8665760Z   show-progress: true
publish	Run actions/checkout@v7	2026-09-10T23:13:43.8666310Z   lfs: false
publish	Run actions/checkout@v7	2026-09-10T23:13:43.8666820Z   submodules: false
publish	Run actions/checkout@v7	2026-09-10T23:13:43.8667420Z   set-safe-directory: true
publish	Run actions/checkout@v7	2026-09-10T23:13:43.8668230Z   allow-unsafe-pr-checkout: false
publish	Run actions/checkout@v7	2026-09-10T23:13:43.8669410Z ##[endgroup]
publish	Run actions/checkout@v7	2026-09-10T23:13:44.4448680Z Syncing repository: carloslfu/slotstream
publish	Run actions/checkout@v7	2026-09-10T23:13:44.4451880Z ##[group]Getting Git version info
publish	Run actions/checkout@v7	2026-09-10T23:13:44.4452810Z Working directory is '/Users/runner/work/slotstream/slotstream'
publish	Run actions/checkout@v7	2026-09-10T23:13:44.4454340Z [command]/opt/homebrew/bin/git version
publish	Run actions/checkout@v7	2026-09-10T23:13:44.4835430Z git version 2.55.0
publish	Run actions/checkout@v7	2026-09-10T23:13:44.4873650Z ##[endgroup]
publish	Run actions/checkout@v7	2026-09-10T23:13:44.4888770Z Copying '/Users/runner/.gitconfig' to '/Users/runner/work/_temp/04abfda0-85cc-4760-816a-30603686b502/.gitconfig'
publish	Run actions/checkout@v7	2026-09-10T23:13:44.4891310Z Temporarily overriding HOME='/Users/runner/work/_temp/04abfda0-85cc-4760-816a-30603686b502' before making global git config changes
publish	Run actions/checkout@v7	2026-09-10T23:13:44.4893620Z Adding repository directory to the temporary git global config as a safe directory
publish	Run actions/checkout@v7	2026-09-10T23:13:44.4898930Z [command]/opt/homebrew/bin/git config --global --add safe.directory /Users/runner/work/slotstream/slotstream
publish	Run actions/checkout@v7	2026-09-10T23:13:44.5043980Z Deleting the contents of '/Users/runner/work/slotstream/slotstream'
publish	Run actions/checkout@v7	2026-09-10T23:13:44.5048900Z ##[group]Determining repository object format
publish	Run actions/checkout@v7	2026-09-10T23:13:44.5052060Z ##[endgroup]
publish	Run actions/checkout@v7	2026-09-10T23:13:44.5056800Z ##[group]Initializing the repository
publish	Run actions/checkout@v7	2026-09-10T23:13:44.5058330Z [command]/opt/homebrew/bin/git init /Users/runner/work/slotstream/slotstream
publish	Run actions/checkout@v7	2026-09-10T23:13:44.5475520Z hint: Using 'master' as the name for the initial branch. This default branch name
publish	Run actions/checkout@v7	2026-09-10T23:13:44.5480510Z hint: will change to "main" in Git 3.0. To configure the initial branch name
publish	Run actions/checkout@v7	2026-09-10T23:13:44.5483820Z hint: to use in all of your new repositories, which will suppress this warning,
publish	Run actions/checkout@v7	2026-09-10T23:13:44.5486470Z hint: call:
publish	Run actions/checkout@v7	2026-09-10T23:13:44.5488020Z hint:
publish	Run actions/checkout@v7	2026-09-10T23:13:44.5489940Z hint: 	git config --global init.defaultBranch <name>
publish	Run actions/checkout@v7	2026-09-10T23:13:44.5492000Z hint:
publish	Run actions/checkout@v7	2026-09-10T23:13:44.5493990Z hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
publish	Run actions/checkout@v7	2026-09-10T23:13:44.5497070Z hint: 'development'. The just-created branch can be renamed via this command:
publish	Run actions/checkout@v7	2026-09-10T23:13:44.5499690Z hint:
publish	Run actions/checkout@v7	2026-09-10T23:13:44.5501150Z hint: 	git branch -m <name>
publish	Run actions/checkout@v7	2026-09-10T23:13:44.5502920Z hint:
publish	Run actions/checkout@v7	2026-09-10T23:13:44.5505040Z hint: Disable this message with "git config set advice.defaultBranchName false"
publish	Run actions/checkout@v7	2026-09-10T23:13:44.5508820Z Initialized empty Git repository in /Users/runner/work/slotstream/slotstream/.git/
publish	Run actions/checkout@v7	2026-09-10T23:13:44.5515060Z [command]/opt/homebrew/bin/git remote add origin https://github.com/carloslfu/slotstream
publish	Run actions/checkout@v7	2026-09-10T23:13:44.5657520Z ##[endgroup]
publish	Run actions/checkout@v7	2026-09-10T23:13:44.5660270Z ##[group]Disabling automatic garbage collection
publish	Run actions/checkout@v7	2026-09-10T23:13:44.5662870Z [command]/opt/homebrew/bin/git config --local gc.auto 0
publish	Run actions/checkout@v7	2026-09-10T23:13:44.5766880Z ##[endgroup]
publish	Run actions/checkout@v7	2026-09-10T23:13:44.5771610Z ##[group]Setting up auth
publish	Run actions/checkout@v7	2026-09-10T23:13:44.5773980Z Removing SSH command configuration
publish	Run actions/checkout@v7	2026-09-10T23:13:44.5777100Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp core\.sshCommand
publish	Run actions/checkout@v7	2026-09-10T23:13:44.5929890Z [command]/opt/homebrew/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :"
publish	Run actions/checkout@v7	2026-09-10T23:13:44.8103330Z Removing HTTP extra header
publish	Run actions/checkout@v7	2026-09-10T23:13:44.8106020Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
publish	Run actions/checkout@v7	2026-09-10T23:13:44.8188580Z [command]/opt/homebrew/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :"
publish	Run actions/checkout@v7	2026-09-10T23:13:44.9362830Z Removing includeIf entries pointing to credentials config files
publish	Run actions/checkout@v7	2026-09-10T23:13:44.9373790Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp ^includeIf\.gitdir:
publish	Run actions/checkout@v7	2026-09-10T23:13:44.9478730Z [command]/opt/homebrew/bin/git submodule foreach --recursive git config --local --show-origin --name-only --get-regexp remote.origin.url
publish	Run actions/checkout@v7	2026-09-10T23:13:45.2419240Z [command]/opt/homebrew/bin/git config --file /Users/runner/work/_temp/git-credentials-ce0107fb-bac4-405e-93c2-f268b8413a7d.config http.https://github.com/.extraheader AUTHORIZATION: basic ***
publish	Run actions/checkout@v7	2026-09-10T23:13:45.2622290Z [command]/opt/homebrew/bin/git config --local includeIf.gitdir:/Users/runner/work/slotstream/slotstream/.git.path /Users/runner/work/_temp/git-credentials-ce0107fb-bac4-405e-93c2-f268b8413a7d.config
publish	Run actions/checkout@v7	2026-09-10T23:13:45.2651730Z [command]/opt/homebrew/bin/git config --local includeIf.gitdir:/Users/runner/work/slotstream/slotstream/.git/worktrees/*.path /Users/runner/work/_temp/git-credentials-ce0107fb-bac4-405e-93c2-f268b8413a7d.config
publish	Run actions/checkout@v7	2026-09-10T23:13:45.2654020Z [command]/opt/homebrew/bin/git config --local includeIf.gitdir:/github/workspace/.git.path /github/runner_temp/git-credentials-ce0107fb-bac4-405e-93c2-f268b8413a7d.config
publish	Run actions/checkout@v7	2026-09-10T23:13:45.2655860Z [command]/opt/homebrew/bin/git config --local includeIf.gitdir:/github/workspace/.git/worktrees/*.path /github/runner_temp/git-credentials-ce0107fb-bac4-405e-93c2-f268b8413a7d.config
publish	Run actions/checkout@v7	2026-09-10T23:13:45.2657760Z ##[endgroup]
publish	Run actions/checkout@v7	2026-09-10T23:13:45.2658430Z ##[group]Fetching the repository
publish	Run actions/checkout@v7	2026-09-10T23:13:45.2659300Z [command]/opt/homebrew/bin/git -c protocol.version=2 fetch --no-tags --prune --no-recurse-submodules --depth=1 origin +refs/tags/v0.2.14:refs/tags/v0.2.14
publish	Run actions/checkout@v7	2026-09-10T23:13:53.0559950Z From https://github.com/carloslfu/slotstream
publish	Run actions/checkout@v7	2026-09-10T23:13:53.0572030Z  * [new tag]         v0.2.14    -> v0.2.14
publish	Run actions/checkout@v7	2026-09-10T23:13:53.0657510Z [command]/opt/homebrew/bin/git tag --list v0.2.14
publish	Run actions/checkout@v7	2026-09-10T23:13:53.0877230Z v0.2.14
publish	Run actions/checkout@v7	2026-09-10T23:13:53.0892270Z [command]/opt/homebrew/bin/git rev-parse refs/tags/v0.2.14^{commit}
publish	Run actions/checkout@v7	2026-09-10T23:13:53.1046680Z ac7d7e53ca2397bb8840a97f028509fbb0a8f688
publish	Run actions/checkout@v7	2026-09-10T23:13:53.1050770Z ##[endgroup]
publish	Run actions/checkout@v7	2026-09-10T23:13:53.1051420Z ##[group]Determining the checkout info
publish	Run actions/checkout@v7	2026-09-10T23:13:53.1052160Z ##[endgroup]
publish	Run actions/checkout@v7	2026-09-10T23:13:53.1063040Z [command]/opt/homebrew/bin/git sparse-checkout disable
publish	Run actions/checkout@v7	2026-09-10T23:13:53.1311250Z [command]/opt/homebrew/bin/git config --local --unset-all extensions.worktreeConfig
publish	Run actions/checkout@v7	2026-09-10T23:13:53.1457310Z ##[group]Checking out the ref
publish	Run actions/checkout@v7	2026-09-10T23:13:53.1459790Z [command]/opt/homebrew/bin/git checkout --progress --force refs/tags/v0.2.14
publish	Run actions/checkout@v7	2026-09-10T23:13:54.4395340Z Updating files:  60% (719/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:54.5909960Z Updating files:  61% (721/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:54.7035760Z Updating files:  62% (733/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:54.7380660Z Updating files:  63% (745/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:54.7954000Z Updating files:  64% (756/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:54.8252510Z Updating files:  65% (768/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:54.8551010Z Updating files:  66% (780/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:55.0261010Z Updating files:  67% (792/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:55.1114870Z Updating files:  68% (804/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:55.1708300Z Updating files:  69% (815/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:55.2425870Z Updating files:  70% (827/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:55.3401120Z Updating files:  71% (839/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:55.5568240Z Updating files:  72% (851/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:55.5624550Z Updating files:  73% (863/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:55.5671570Z Updating files:  74% (874/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:55.5879110Z Updating files:  75% (886/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:55.6612850Z Updating files:  76% (898/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:55.7041760Z Updating files:  77% (910/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:55.7527690Z Updating files:  78% (922/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:55.8214490Z Updating files:  79% (933/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:55.8398460Z Updating files:  80% (945/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:55.8608310Z Updating files:  81% (957/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:55.9089360Z Updating files:  82% (969/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:55.9662810Z Updating files:  83% (981/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:56.1213490Z Updating files:  84% (993/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:56.1547500Z Updating files:  85% (1004/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:56.1871750Z Updating files:  86% (1016/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:56.2004530Z Updating files:  86% (1019/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:56.2860320Z Updating files:  87% (1028/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:56.3545800Z Updating files:  88% (1040/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:56.4361610Z Updating files:  89% (1052/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:56.7235880Z Updating files:  90% (1063/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:56.7928000Z Updating files:  91% (1075/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:56.8497490Z Updating files:  92% (1087/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:56.9529330Z Updating files:  93% (1099/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:57.0643720Z Updating files:  94% (1111/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:57.1355450Z Updating files:  95% (1122/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:57.1676660Z Updating files:  96% (1134/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:57.1934000Z Updating files:  96% (1141/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:57.2172480Z Updating files:  97% (1146/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:57.2202060Z Updating files:  98% (1158/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:57.2227320Z Updating files:  99% (1170/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:57.2228020Z Updating files: 100% (1181/1181)
publish	Run actions/checkout@v7	2026-09-10T23:13:57.2228560Z Updating files: 100% (1181/1181), done.
publish	Run actions/checkout@v7	2026-09-10T23:13:57.2311770Z HEAD is now at ac7d7e5 Prepare v0.2.14 and publish only the exact successful CI artifact
publish	Run actions/checkout@v7	2026-09-10T23:13:57.2531990Z ##[endgroup]
publish	Run actions/checkout@v7	2026-09-10T23:13:57.2787560Z [command]/opt/homebrew/bin/git log -1 --format=%H
publish	Run actions/checkout@v7	2026-09-10T23:13:57.2932170Z ac7d7e53ca2397bb8840a97f028509fbb0a8f688
publish	archive verifier regression checks	﻿2026-09-10T23:13:57.3410130Z ##[group]Run python3 Tools/release_candidate_test.py
publish	archive verifier regression checks	2026-09-10T23:13:57.3410580Z ^[[36;1mpython3 Tools/release_candidate_test.py^[[0m
publish	archive verifier regression checks	2026-09-10T23:13:57.3469010Z shell: /bin/bash -e {0}
publish	archive verifier regression checks	2026-09-10T23:13:57.3469460Z ##[endgroup]
publish	archive verifier regression checks	2026-09-10T23:13:57.8943260Z .........
publish	archive verifier regression checks	2026-09-10T23:13:57.9069450Z ----------------------------------------------------------------------
publish	archive verifier regression checks	2026-09-10T23:13:57.9219230Z Ran 9 tests in 0.064s
publish	archive verifier regression checks	2026-09-10T23:13:57.9219680Z 
publish	archive verifier regression checks	2026-09-10T23:13:57.9231280Z OK
publish	find and download the successful main CI candidate	﻿2026-09-10T23:13:57.9509430Z ##[group]Run RUN=$(gh run list --repo "$GITHUB_REPOSITORY" --workflow ci.yml \
publish	find and download the successful main CI candidate	2026-09-10T23:13:57.9511780Z ^[[36;1mRUN=$(gh run list --repo "$GITHUB_REPOSITORY" --workflow ci.yml \^[[0m
publish	find and download the successful main CI candidate	2026-09-10T23:13:57.9514000Z ^[[36;1m  --commit "$GITHUB_SHA" --event push --status success --limit 20 \^[[0m
publish	find and download the successful main CI candidate	2026-09-10T23:13:57.9514940Z ^[[36;1m  --json databaseId,headBranch --jq '[.[] | select(.headBranch == "main")][0].databaseId')^[[0m
publish	find and download the successful main CI candidate	2026-09-10T23:13:57.9517050Z ^[[36;1m[[ "$RUN" =~ ^[0-9]+$ ]] || { echo "No successful main CI run for $GITHUB_SHA; wait for CI before tagging" >&2; exit 1; }^[[0m
publish	find and download the successful main CI candidate	2026-09-10T23:13:57.9517920Z ^[[36;1mgh run download "$RUN" --repo "$GITHUB_REPOSITORY" \^[[0m
publish	find and download the successful main CI candidate	2026-09-10T23:13:57.9519600Z ^[[36;1m  --name slotstream-ci-candidate --dir dist^[[0m
publish	find and download the successful main CI candidate	2026-09-10T23:13:57.9520630Z ^[[36;1mecho "run=$RUN" >> "$GITHUB_OUTPUT"^[[0m
publish	find and download the successful main CI candidate	2026-09-10T23:13:57.9627960Z shell: /bin/bash -e {0}
publish	find and download the successful main CI candidate	2026-09-10T23:13:57.9629650Z env:
publish	find and download the successful main CI candidate	2026-09-10T23:13:57.9658030Z   GH_TOKEN: ***
publish	find and download the successful main CI candidate	2026-09-10T23:13:57.9662250Z ##[endgroup]
publish	verify archive identity, source and version	﻿2026-09-10T23:14:01.3953720Z ##[group]Run python3 Tools/release_candidate.py --archive dist/slotstream-arm64.tar.gz --output .build/release
publish	verify archive identity, source and version	2026-09-10T23:14:01.3955730Z ^[[36;1mpython3 Tools/release_candidate.py --archive dist/slotstream-arm64.tar.gz --output .build/release^[[0m
publish	verify archive identity, source and version	2026-09-10T23:14:01.3957360Z ^[[36;1mV=$(.build/release/slotstream --version)^[[0m
publish	verify archive identity, source and version	2026-09-10T23:14:01.3958160Z ^[[36;1mecho "binary $V, tag $GITHUB_REF_NAME"^[[0m
publish	verify archive identity, source and version	2026-09-10T23:14:01.3958840Z ^[[36;1m[ "v$V" = "$GITHUB_REF_NAME" ]^[[0m
publish	verify archive identity, source and version	2026-09-10T23:14:01.4059940Z shell: /bin/bash -e {0}
publish	verify archive identity, source and version	2026-09-10T23:14:01.4060270Z ##[endgroup]
publish	verify archive identity, source and version	2026-09-10T23:14:02.7385130Z {"archive_sha256": "2fd5bfab8073b29095148274b0e5857a43dc20bc530bcacb4c9180ccc5ac2b52", "binary_sha256": "49d36b8057a79c013ef0d91b93b67ea0a987efb32e6dd5df6f03b6843b76e9f7", "source_files": 150, "source_matches_checkout": true}
publish	verify archive identity, source and version	2026-09-10T23:14:02.9076590Z binary 0.2.14, tag v0.2.14
publish	attest provenance	﻿2026-09-10T23:14:02.9472750Z ##[group]Run actions/attest-build-provenance@v4
publish	attest provenance	2026-09-10T23:14:02.9474490Z with:
publish	attest provenance	2026-09-10T23:14:02.9475440Z   subject-path: dist/slotstream-arm64.tar.gz
publish	attest provenance	2026-09-10T23:14:02.9476490Z   push-to-registry: false
publish	attest provenance	2026-09-10T23:14:02.9477310Z   create-storage-record: true
publish	attest provenance	2026-09-10T23:14:02.9478660Z   show-summary: true
publish	attest provenance	2026-09-10T23:14:02.9484960Z   github-token: ***
publish	attest provenance	2026-09-10T23:14:02.9485520Z ##[endgroup]
publish	attest provenance	2026-09-10T23:14:02.9600240Z ##[start-action display=Attest;id=__actions_attest-build-provenance.attest]
publish	attest provenance	2026-09-10T23:14:02.9670000Z ##[group]Run actions/attest@508db95dd578ae2727ebd6217d5ba78e4fbda05d
publish	attest provenance	2026-09-10T23:14:02.9670330Z with:
publish	attest provenance	2026-09-10T23:14:02.9670510Z   subject-path: dist/slotstream-arm64.tar.gz
publish	attest provenance	2026-09-10T23:14:02.9670780Z   push-to-registry: false
publish	attest provenance	2026-09-10T23:14:02.9670990Z   create-storage-record: true
publish	attest provenance	2026-09-10T23:14:02.9671190Z   show-summary: true
publish	attest provenance	2026-09-10T23:14:02.9673210Z   github-token: ***
publish	attest provenance	2026-09-10T23:14:02.9673380Z env:
publish	attest provenance	2026-09-10T23:14:02.9673560Z   NODE_OPTIONS: --max-http-header-size=32768
publish	attest provenance	2026-09-10T23:14:02.9673870Z ##[endgroup]
publish	attest provenance	2026-09-10T23:14:03.3218550Z Attestation type: Build Provenance
publish	attest provenance	2026-09-10T23:14:04.6197360Z Attestation created for slotstream-arm64.tar.gz@sha256:2fd5bfab8073b29095148274b0e5857a43dc20bc530bcacb4c9180ccc5ac2b52
publish	attest provenance	2026-09-10T23:14:04.6291800Z ##[group]^[[36mAttestation signed using certificate from Public Good Sigstore instance^[[39m
publish	attest provenance	2026-09-10T23:14:04.6293620Z -----BEGIN CERTIFICATE-----
publish	attest provenance	2026-09-10T23:14:04.6293990Z MIIHFjCCBpugAwIBAgIUNVS10KRJH102thX3E6U12/nMmUowCgYIKoZIzj0EAwMw
publish	attest provenance	2026-09-10T23:14:04.6294490Z NzEVMBMGA1UEChMMc2lnc3RvcmUuZGV2MR4wHAYDVQQDExVzaWdzdG9yZS1pbnRl
publish	attest provenance	2026-09-10T23:14:04.6294970Z cm1lZGlhdGUwHhcNMjYwOTEwMjMxNDAzWhcNMjYwOTEwMjMyNDAzWjAAMFkwEwYH
publish	attest provenance	2026-09-10T23:14:04.6295600Z KoZIzj0CAQYIKoZIzj0DAQcDQgAEmGQ8Wt/vNQu3nlSj7jhzxHN9BdQzEfQd+RTz
publish	attest provenance	2026-09-10T23:14:04.6296090Z kxgJTpifpUy1nnHpxD4QFCYn9MTYdLj7eYJKVOnpukAVFe4C/KOCBbowggW2MA4G
publish	attest provenance	2026-09-10T23:14:04.6296520Z A1UdDwEB/wQEAwIHgDATBgNVHSUEDDAKBggrBgEFBQcDAzAdBgNVHQ4EFgQUG5rE
publish	attest provenance	2026-09-10T23:14:04.6297050Z YB0eAzwj5kHUh15L0CNG6YgwHwYDVR0jBBgwFoAU39Ppz1YkEZb5qNjpKFWixi4Y
publish	attest provenance	2026-09-10T23:14:04.6297460Z ZD8wZQYDVR0RAQH/BFswWYZXaHR0cHM6Ly9naXRodWIuY29tL2Nhcmxvc2xmdS9z
publish	attest provenance	2026-09-10T23:14:04.6297840Z bG90c3RyZWFtLy5naXRodWIvd29ya2Zsb3dzL3JlbGVhc2UueW1sQHJlZnMvdGFn
publish	attest provenance	2026-09-10T23:14:04.6298340Z cy92MC4yLjE0MDkGCisGAQQBg78wAQEEK2h0dHBzOi8vdG9rZW4uYWN0aW9ucy5n
publish	attest provenance	2026-09-10T23:14:04.6298820Z aXRodWJ1c2VyY29udGVudC5jb20wEgYKKwYBBAGDvzABAgQEcHVzaDA2BgorBgEE
publish	attest provenance	2026-09-10T23:14:04.6299250Z AYO/MAEDBChhYzdkN2U1M2NhMjM5N2JiODg0MGE5N2YwMjg1MDlmYmIwYThmNjg4
publish	attest provenance	2026-09-10T23:14:04.6300520Z MBUGCisGAQQBg78wAQQEB3JlbGVhc2UwIgYKKwYBBAGDvzABBQQUY2FybG9zbGZ1
publish	attest provenance	2026-09-10T23:14:04.6301200Z L3Nsb3RzdHJlYW0wHwYKKwYBBAGDvzABBgQRcmVmcy90YWdzL3YwLjIuMTQwOwYK
publish	attest provenance	2026-09-10T23:14:04.6301680Z KwYBBAGDvzABCAQtDCtodHRwczovL3Rva2VuLmFjdGlvbnMuZ2l0aHVidXNlcmNv
publish	attest provenance	2026-09-10T23:14:04.6302110Z bnRlbnQuY29tMGcGCisGAQQBg78wAQkEWQxXaHR0cHM6Ly9naXRodWIuY29tL2Nh
publish	attest provenance	2026-09-10T23:14:04.6302580Z cmxvc2xmdS9zbG90c3RyZWFtLy5naXRodWIvd29ya2Zsb3dzL3JlbGVhc2UueW1s
publish	attest provenance	2026-09-10T23:14:04.6303030Z QHJlZnMvdGFncy92MC4yLjE0MDgGCisGAQQBg78wAQoEKgwoYWM3ZDdlNTNjYTIz
publish	attest provenance	2026-09-10T23:14:04.6303520Z OTdiYjg4NDBhOTdmMDI4NTA5ZmJiMGE4ZjY4ODAdBgorBgEEAYO/MAELBA8MDWdp
publish	attest provenance	2026-09-10T23:14:04.6303920Z dGh1Yi1ob3N0ZWQwNwYKKwYBBAGDvzABDAQpDCdodHRwczovL2dpdGh1Yi5jb20v
publish	attest provenance	2026-09-10T23:14:04.6304370Z Y2FybG9zbGZ1L3Nsb3RzdHJlYW0wOAYKKwYBBAGDvzABDQQqDChhYzdkN2U1M2Nh
publish	attest provenance	2026-09-10T23:14:04.6304890Z MjM5N2JiODg0MGE5N2YwMjg1MDlmYmIwYThmNjg4MCEGCisGAQQBg78wAQ4EEwwR
publish	attest provenance	2026-09-10T23:14:04.6305310Z cmVmcy90YWdzL3YwLjIuMTQwGgYKKwYBBAGDvzABDwQMDAoxMzQ5Mjg1MDU4MCwG
publish	attest provenance	2026-09-10T23:14:04.6305820Z CisGAQQBg78wARAEHgwcaHR0cHM6Ly9naXRodWIuY29tL2Nhcmxvc2xmdTAXBgor
publish	attest provenance	2026-09-10T23:14:04.6306300Z BgEEAYO/MAERBAkMBzU5OTMxNjgwZwYKKwYBBAGDvzABEgRZDFdodHRwczovL2dp
publish	attest provenance	2026-09-10T23:14:04.6306740Z dGh1Yi5jb20vY2FybG9zbGZ1L3Nsb3RzdHJlYW0vLmdpdGh1Yi93b3JrZmxvd3Mv
publish	attest provenance	2026-09-10T23:14:04.6307230Z cmVsZWFzZS55bWxAcmVmcy90YWdzL3YwLjIuMTQwOAYKKwYBBAGDvzABEwQqDChh
publish	attest provenance	2026-09-10T23:14:04.6307650Z YzdkN2U1M2NhMjM5N2JiODg0MGE5N2YwMjg1MDlmYmIwYThmNjg4MBQGCisGAQQB
publish	attest provenance	2026-09-10T23:14:04.6308740Z g78wARQEBgwEcHVzaDBbBgorBgEEAYO/MAEVBE0MS2h0dHBzOi8vZ2l0aHViLmNv
publish	attest provenance	2026-09-10T23:14:04.6309190Z bS9jYXJsb3NsZnUvc2xvdHN0cmVhbS9hY3Rpb25zL3J1bnMvMzQ1NDExNzIxMTQv
publish	attest provenance	2026-09-10T23:14:04.6309590Z YXR0ZW1wdHMvMTAWBgorBgEEAYO/MAEWBAgMBnB1YmxpYzBSBgorBgEEAYO/MAEY
publish	attest provenance	2026-09-10T23:14:04.6310040Z BEQMQnJlcG86Y2FybG9zbGZ1QDU5OTMxNjgvc2xvdHN0cmVhbUAxMzQ5Mjg1MDU4
publish	attest provenance	2026-09-10T23:14:04.6310470Z OnJlZjpyZWZzL3RhZ3MvdjAuMi4xNDCBigYKKwYBBAHWeQIEAgR8BHoAeAB2AN09
publish	attest provenance	2026-09-10T23:14:04.6310960Z MGrGxxEyYxkeHJlnNwKiSl643jyt/4eKcoAvKe6OAAABoI2ZhecAAAQDAEcwRQIg
publish	attest provenance	2026-09-10T23:14:04.6311520Z URu/0j8+FrfaF8S4gGZpS6POZ+MaEP23UZpb17m4JqECIQCFZ0e/md6JbArtgUyV
publish	attest provenance	2026-09-10T23:14:04.6312060Z CzxpoQMdDAfcPVmwVqGKxdfZLDAKBggqhkjOPQQDAwNpADBmAjEAveEjIvgLDDWO
publish	attest provenance	2026-09-10T23:14:04.6312450Z OE7Mo/OO2uCi4VKe/ikShEheqaTqJ4KEPS3rqVhZh3oSKuWBonzpAjEAupyLmOrr
publish	attest provenance	2026-09-10T23:14:04.6312840Z e7n8aMI29uaIE+V4lENcDkiqqZIp5yXqFbPSBDJJQ03kTPZn9rdqMzrd
publish	attest provenance	2026-09-10T23:14:04.6313210Z -----END CERTIFICATE-----
publish	attest provenance	2026-09-10T23:14:04.6313380Z 
publish	attest provenance	2026-09-10T23:14:04.6313840Z ##[endgroup]
publish	attest provenance	2026-09-10T23:14:04.6314430Z ^[[36mAttestation signature uploaded to Rekor transparency log^[[39m
publish	attest provenance	2026-09-10T23:14:04.6315020Z https://search.sigstore.dev?logIndex=2788210412
publish	attest provenance	2026-09-10T23:14:04.6315390Z ^[[36mAttestation uploaded to repository^[[39m
publish	attest provenance	2026-09-10T23:14:04.6316060Z https://github.com/carloslfu/slotstream/attestations/46717055
publish	attest provenance	2026-09-10T23:14:04.7221130Z ##[end-action id=__actions_attest-build-provenance.attest;outcome=success;conclusion=success;duration_ms=1761]
publish	publish	﻿2026-09-10T23:14:04.7317470Z ##[group]Run SHA=$(cut -d' ' -f1 < dist/slotstream-arm64.tar.gz.sha256)
publish	publish	2026-09-10T23:14:04.7317990Z ^[[36;1mSHA=$(cut -d' ' -f1 < dist/slotstream-arm64.tar.gz.sha256)^[[0m
publish	publish	2026-09-10T23:14:04.7318310Z ^[[36;1mgh release create "$GITHUB_REF_NAME" \^[[0m
publish	publish	2026-09-10T23:14:04.7318720Z ^[[36;1m  dist/slotstream-arm64.tar.gz dist/slotstream-arm64.tar.gz.sha256 \^[[0m
publish	publish	2026-09-10T23:14:04.7319070Z ^[[36;1m  --title "$GITHUB_REF_NAME" \^[[0m
publish	publish	2026-09-10T23:14:04.7319620Z ^[[36;1m  --notes "Built and tested by CI from commit $GITHUB_SHA (build and complete CI log: $GITHUB_SERVER_URL/$GITHUB_REPOSITORY/actions/runs/$BUILD_RUN).^[[0m
publish	publish	2026-09-10T23:14:04.7320340Z ^[[36;1m^[[0m
publish	publish	2026-09-10T23:14:04.7320830Z ^[[36;1mThis release publishes that exact archive after source verification and signing (release log: $GITHUB_SERVER_URL/$GITHUB_REPOSITORY/actions/runs/$GITHUB_RUN_ID).^[[0m
publish	publish	2026-09-10T23:14:04.7321440Z ^[[36;1m^[[0m
publish	publish	2026-09-10T23:14:04.7321590Z ^[[36;1msha256: $SHA^[[0m
publish	publish	2026-09-10T23:14:04.7321780Z ^[[36;1m^[[0m
publish	publish	2026-09-10T23:14:04.7322210Z ^[[36;1mVerify provenance: gh attestation verify slotstream-arm64.tar.gz --repo $GITHUB_REPOSITORY^[[0m
publish	publish	2026-09-10T23:14:04.7322580Z ^[[36;1m^[[0m
publish	publish	2026-09-10T23:14:04.7322980Z ^[[36;1mInstall or upgrade: curl -fsSL https://raw.githubusercontent.com/$GITHUB_REPOSITORY/main/install.sh | sh"^[[0m
publish	publish	2026-09-10T23:14:04.7375970Z shell: /bin/bash -e {0}
publish	publish	2026-09-10T23:14:04.7376680Z env:
publish	publish	2026-09-10T23:14:04.7382120Z   GH_TOKEN: ***
publish	publish	2026-09-10T23:14:04.7382860Z   BUILD_RUN: 34539578315
publish	publish	2026-09-10T23:14:04.7383430Z ##[endgroup]
publish	publish	2026-09-10T23:14:09.4672090Z https://github.com/carloslfu/slotstream/releases/tag/v0.2.14
publish	Post Run actions/checkout@v7	﻿2026-09-10T23:14:09.4806810Z Post job cleanup.
publish	Post Run actions/checkout@v7	2026-09-10T23:14:09.6815280Z [command]/opt/homebrew/bin/git version
publish	Post Run actions/checkout@v7	2026-09-10T23:14:09.6899310Z git version 2.55.0
publish	Post Run actions/checkout@v7	2026-09-10T23:14:09.6961210Z Copying '/Users/runner/.gitconfig' to '/Users/runner/work/_temp/c8eaee42-9bed-46b5-9512-3e1584366a43/.gitconfig'
publish	Post Run actions/checkout@v7	2026-09-10T23:14:09.7062390Z Temporarily overriding HOME='/Users/runner/work/_temp/c8eaee42-9bed-46b5-9512-3e1584366a43' before making global git config changes
publish	Post Run actions/checkout@v7	2026-09-10T23:14:09.7089320Z Adding repository directory to the temporary git global config as a safe directory
publish	Post Run actions/checkout@v7	2026-09-10T23:14:09.7090270Z [command]/opt/homebrew/bin/git config --global --add safe.directory /Users/runner/work/slotstream/slotstream
publish	Post Run actions/checkout@v7	2026-09-10T23:14:09.7091610Z Removing SSH command configuration
publish	Post Run actions/checkout@v7	2026-09-10T23:14:09.7092070Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp core\.sshCommand
publish	Post Run actions/checkout@v7	2026-09-10T23:14:09.7170580Z [command]/opt/homebrew/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :"
publish	Post Run actions/checkout@v7	2026-09-10T23:14:09.8476080Z Removing HTTP extra header
publish	Post Run actions/checkout@v7	2026-09-10T23:14:09.8486210Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
publish	Post Run actions/checkout@v7	2026-09-10T23:14:09.8539740Z [command]/opt/homebrew/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :"
publish	Post Run actions/checkout@v7	2026-09-10T23:14:10.0955610Z Removing includeIf entries pointing to credentials config files
publish	Post Run actions/checkout@v7	2026-09-10T23:14:10.1069330Z [command]/opt/homebrew/bin/git config --local --name-only --get-regexp ^includeIf\.gitdir:
publish	Post Run actions/checkout@v7	2026-09-10T23:14:10.1172260Z includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git.path
publish	Post Run actions/checkout@v7	2026-09-10T23:14:10.1273530Z includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git/worktrees/*.path
publish	Post Run actions/checkout@v7	2026-09-10T23:14:10.1375080Z includeif.gitdir:/github/workspace/.git.path
publish	Post Run actions/checkout@v7	2026-09-10T23:14:10.1476750Z includeif.gitdir:/github/workspace/.git/worktrees/*.path
publish	Post Run actions/checkout@v7	2026-09-10T23:14:10.1596090Z [command]/opt/homebrew/bin/git config --local --get-all includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git.path
publish	Post Run actions/checkout@v7	2026-09-10T23:14:10.1615670Z /Users/runner/work/_temp/git-credentials-ce0107fb-bac4-405e-93c2-f268b8413a7d.config
publish	Post Run actions/checkout@v7	2026-09-10T23:14:10.1617440Z [command]/opt/homebrew/bin/git config --local --unset includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git.path \/Users\/runner\/work\/_temp\/git\-credentials\-ce0107fb\-bac4\-405e\-93c2\-f268b8413a7d\.config
publish	Post Run actions/checkout@v7	2026-09-10T23:14:10.1619260Z [command]/opt/homebrew/bin/git config --local --get-all includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git/worktrees/*.path
publish	Post Run actions/checkout@v7	2026-09-10T23:14:10.1620780Z /Users/runner/work/_temp/git-credentials-ce0107fb-bac4-405e-93c2-f268b8413a7d.config
publish	Post Run actions/checkout@v7	2026-09-10T23:14:10.1623130Z [command]/opt/homebrew/bin/git config --local --unset includeif.gitdir:/Users/runner/work/slotstream/slotstream/.git/worktrees/*.path \/Users\/runner\/work\/_temp\/git\-credentials\-ce0107fb\-bac4\-405e\-93c2\-f268b8413a7d\.config
publish	Post Run actions/checkout@v7	2026-09-10T23:14:10.1627850Z [command]/opt/homebrew/bin/git config --local --get-all includeif.gitdir:/github/workspace/.git.path
publish	Post Run actions/checkout@v7	2026-09-10T23:14:10.1632530Z /github/runner_temp/git-credentials-ce0107fb-bac4-405e-93c2-f268b8413a7d.config
publish	Post Run actions/checkout@v7	2026-09-10T23:14:10.1634020Z [command]/opt/homebrew/bin/git config --local --unset includeif.gitdir:/github/workspace/.git.path \/github\/runner_temp\/git\-credentials\-ce0107fb\-bac4\-405e\-93c2\-f268b8413a7d\.config
publish	Post Run actions/checkout@v7	2026-09-10T23:14:10.1635420Z [command]/opt/homebrew/bin/git config --local --get-all includeif.gitdir:/github/workspace/.git/worktrees/*.path
publish	Post Run actions/checkout@v7	2026-09-10T23:14:10.1636780Z /github/runner_temp/git-credentials-ce0107fb-bac4-405e-93c2-f268b8413a7d.config
publish	Post Run actions/checkout@v7	2026-09-10T23:14:10.1639930Z [command]/opt/homebrew/bin/git config --local --unset includeif.gitdir:/github/workspace/.git/worktrees/*.path \/github\/runner_temp\/git\-credentials\-ce0107fb\-bac4\-405e\-93c2\-f268b8413a7d\.config
publish	Post Run actions/checkout@v7	2026-09-10T23:14:10.1755010Z [command]/opt/homebrew/bin/git submodule foreach --recursive git config --local --show-origin --name-only --get-regexp remote.origin.url
publish	Post Run actions/checkout@v7	2026-09-10T23:14:10.3422670Z Removing credentials config '/Users/runner/work/_temp/git-credentials-ce0107fb-bac4-405e-93c2-f268b8413a7d.config'
publish	Complete job	﻿2026-09-10T23:14:10.3834900Z Cleaning up orphan processes

````````````

## Artifact SHA-256 cbf3772a619ac2bf4650e045e2027ed62005f783c2b8bb2b5ac6a5d9bf04130a

Encoding: `utf-8`. Original bytes: 3027.

````````````text
from pathlib import Path
import hashlib, json, os, subprocess, sys, time, urllib.request

ROOT = Path('/Users/carlos/Projects/slotstream')
BASE = ROOT / '.build/release-preparation-v0.2.14'
sys.path.insert(0, str(ROOT / 'Tools'))
from prefill_bench import preflight
acceptance = json.loads((BASE / 'installed-public-acceptance/result.json').read_text())
assert acceptance['passed'] and acceptance['test_server_stopped']
binary = Path.home() / '.slotstream/bin/slotstream'
assert subprocess.check_output([str(binary), '--version'], text=True).strip() == '0.2.14'
report = {'version': '0.2.14', 'binary': str(binary.resolve()),
          'binary_sha256': hashlib.sha256(binary.read_bytes()).hexdigest(),
          'cwd': '/Users/carlos/slotstream-demo', 'preflight': preflight(20.5),
          'started_at_unix': time.time()}
env = {k:v for k,v in os.environ.items()
       if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG')) and k not in ('BIN', 'PYTHON')}
opener = urllib.request.build_opener(urllib.request.ProxyHandler({}))
command = [str(binary), 'serve']
log = (BASE / 'restored-demo-server.log').open('ab')
server = subprocess.Popen(command, cwd=report['cwd'], env=env,
    stdin=subprocess.DEVNULL, stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
log.close()
report.update(pid=server.pid, command=command)
proof = BASE / 'restored-demo-proof.json'
proof.write_text(json.dumps(report, indent=2) + '\n')
try:
    for _ in range(180):
        if server.poll() is not None:
            raise RuntimeError('normal demo exited during startup')
        try:
            with opener.open('http://127.0.0.1:11434/api/version', timeout=2) as response:
                version = json.load(response)
            assert version['version'] == '0.2.14'
            report['api_version'] = version
            break
        except OSError:
            time.sleep(1)
    else:
        raise RuntimeError('normal demo did not become ready')
    payload = {'model': 'qwen3.8-flash-next:4bit', 'messages': [{'role': 'user',
        'content': 'Reply with exactly OK.'}], 'stream': False, 'think': False,
        'options': {'num_predict': 16, 'temperature': 0}}
    request = urllib.request.Request('http://127.0.0.1:11434/api/chat',
        data=json.dumps(payload).encode(), headers={'Content-Type': 'application/json'})
    with opener.open(request, timeout=180) as response:
        reply = json.load(response)
    assert reply.get('done') is True and reply.get('message', {}).get('content', '').strip()
    assert reply.get('eval_count', 0) > 0 and not reply.get('error')
    report.update(reply=reply, ready=True, finished_at_unix=time.time())
    proof.write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps({'pid': server.pid, 'version': version, 'reply': reply['message']['content']}))
except BaseException:
    if server.poll() is None:
        server.terminate()
        try:
            server.wait(timeout=30)
        except subprocess.TimeoutExpired:
            server.kill(); server.wait()
    raise

````````````

## Artifact SHA-256 7e5940b67a6995b990560f1d777389702046a2b8a264e5f9edb525be93c7abad

Encoding: `utf-8`. Original bytes: 8871.

````````````text
{
  "conclusion": "success",
  "headSha": "ac7d7e53ca2397bb8840a97f028509fbb0a8f688",
  "jobs": [
    {
      "completedAt": "2026-09-10T23:04:54Z",
      "conclusion": "success",
      "databaseId": 103078956757,
      "name": "coverage",
      "startedAt": "2026-09-10T22:53:13Z",
      "status": "completed",
      "steps": [
        {
          "completedAt": "2026-09-10T22:53:15Z",
          "conclusion": "success",
          "name": "Set up job",
          "number": 1,
          "startedAt": "2026-09-10T22:53:14Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-10T22:53:25Z",
          "conclusion": "success",
          "name": "Run actions/checkout@v7",
          "number": 2,
          "startedAt": "2026-09-10T22:53:15Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-10T22:53:26Z",
          "conclusion": "success",
          "name": "toolchain",
          "number": 3,
          "startedAt": "2026-09-10T22:53:25Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-10T22:53:28Z",
          "conclusion": "success",
          "name": "pinned Metal library",
          "number": 4,
          "startedAt": "2026-09-10T22:53:26Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-10T23:04:48Z",
          "conclusion": "success",
          "name": "coverage may not go down",
          "number": 5,
          "startedAt": "2026-09-10T22:53:28Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-10T23:04:49Z",
          "conclusion": "success",
          "name": "coverage report",
          "number": 6,
          "startedAt": "2026-09-10T23:04:48Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-10T23:04:50Z",
          "conclusion": "success",
          "name": "Post Run actions/checkout@v7",
          "number": 12,
          "startedAt": "2026-09-10T23:04:49Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-10T23:04:52Z",
          "conclusion": "success",
          "name": "Complete job",
          "number": 13,
          "startedAt": "2026-09-10T23:04:50Z",
          "status": "completed"
        }
      ],
      "url": "https://github.com/carloslfu/slotstream/actions/runs/34539578315/job/103078956757"
    },
    {
      "completedAt": "2026-09-10T23:11:53Z",
      "conclusion": "success",
      "databaseId": 103078956970,
      "name": "weights-free",
      "startedAt": "2026-09-10T22:53:11Z",
      "status": "completed",
      "steps": [
        {
          "completedAt": "2026-09-10T22:53:12Z",
          "conclusion": "success",
          "name": "Set up job",
          "number": 1,
          "startedAt": "2026-09-10T22:53:11Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-10T22:53:22Z",
          "conclusion": "success",
          "name": "Run actions/checkout@v7",
          "number": 2,
          "startedAt": "2026-09-10T22:53:12Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-10T22:53:37Z",
          "conclusion": "success",
          "name": "harness entry points (before the native build)",
          "number": 3,
          "startedAt": "2026-09-10T22:53:22Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-10T22:53:37Z",
          "conclusion": "success",
          "name": "toolchain",
          "number": 4,
          "startedAt": "2026-09-10T22:53:37Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-10T22:53:38Z",
          "conclusion": "success",
          "name": "pinned Metal library",
          "number": 5,
          "startedAt": "2026-09-10T22:53:37Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-10T23:04:18Z",
          "conclusion": "success",
          "name": "release build",
          "number": 6,
          "startedAt": "2026-09-10T22:53:38Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-10T23:04:21Z",
          "conclusion": "success",
          "name": "preserve the candidate before testing",
          "number": 7,
          "startedAt": "2026-09-10T23:04:18Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-10T23:04:24Z",
          "conclusion": "success",
          "name": "Run actions/upload-artifact@v4",
          "number": 8,
          "startedAt": "2026-09-10T23:04:21Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-10T23:04:37Z",
          "conclusion": "success",
          "name": "planner startup and checkpoint gates (fail early)",
          "number": 9,
          "startedAt": "2026-09-10T23:04:24Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-10T23:04:38Z",
          "conclusion": "success",
          "name": "pinned dbmd (the brain gates inside static_gates.sh need it)",
          "number": 10,
          "startedAt": "2026-09-10T23:04:37Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-10T23:11:07Z",
          "conclusion": "success",
          "name": "static and runtime safety gates",
          "number": 11,
          "startedAt": "2026-09-10T23:04:38Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-10T23:11:26Z",
          "conclusion": "success",
          "name": "sampler and governor goldens",
          "number": 12,
          "startedAt": "2026-09-10T23:11:07Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-10T23:11:48Z",
          "conclusion": "success",
          "name": "check catalogue (every check by name)",
          "number": 13,
          "startedAt": "2026-09-10T23:11:26Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-10T23:11:49Z",
          "conclusion": "success",
          "name": "the tested bytes still match the candidate",
          "number": 14,
          "startedAt": "2026-09-10T23:11:48Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-10T23:11:50Z",
          "conclusion": "success",
          "name": "Post Run actions/checkout@v7",
          "number": 28,
          "startedAt": "2026-09-10T23:11:49Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-10T23:11:52Z",
          "conclusion": "success",
          "name": "Complete job",
          "number": 29,
          "startedAt": "2026-09-10T23:11:50Z",
          "status": "completed"
        }
      ],
      "url": "https://github.com/carloslfu/slotstream/actions/runs/34539578315/job/103078956970"
    },
    {
      "completedAt": "2026-09-10T22:57:20Z",
      "conclusion": "success",
      "databaseId": 103078956977,
      "name": "public-library",
      "startedAt": "2026-09-10T22:53:11Z",
      "status": "completed",
      "steps": [
        {
          "completedAt": "2026-09-10T22:53:12Z",
          "conclusion": "success",
          "name": "Set up job",
          "number": 1,
          "startedAt": "2026-09-10T22:53:12Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-10T22:53:21Z",
          "conclusion": "success",
          "name": "Run actions/checkout@v7",
          "number": 2,
          "startedAt": "2026-09-10T22:53:12Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-10T22:53:21Z",
          "conclusion": "success",
          "name": "toolchain",
          "number": 3,
          "startedAt": "2026-09-10T22:53:21Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-10T22:57:16Z",
          "conclusion": "success",
          "name": "the library is importable from outside the package",
          "number": 4,
          "startedAt": "2026-09-10T22:53:21Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-10T22:57:17Z",
          "conclusion": "success",
          "name": "Post Run actions/checkout@v7",
          "number": 8,
          "startedAt": "2026-09-10T22:57:16Z",
          "status": "completed"
        },
        {
          "completedAt": "2026-09-10T22:57:18Z",
          "conclusion": "success",
          "name": "Complete job",
          "number": 9,
          "startedAt": "2026-09-10T22:57:17Z",
          "status": "completed"
        }
      ],
      "url": "https://github.com/carloslfu/slotstream/actions/runs/34539578315/job/103078956977"
    }
  ],
  "status": "completed",
  "url": "https://github.com/carloslfu/slotstream/actions/runs/34539578315"
}

````````````

## Artifact SHA-256 ebde36293d075ded5b91ac9a2631dbb6a8d31f9639e47398316083ef2321aa00

Encoding: `utf-8`. Original bytes: 1919.

````````````text
{"conclusion":"success","headSha":"ac7d7e53ca2397bb8840a97f028509fbb0a8f688","jobs":[{"completedAt":"2026-09-10T23:14:12Z","conclusion":"success","databaseId":103083925303,"name":"publish","startedAt":"2026-09-10T23:13:40Z","status":"completed","steps":[{"completedAt":"2026-09-10T23:13:43Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-09-10T23:13:41Z","status":"completed"},{"completedAt":"2026-09-10T23:13:57Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-09-10T23:13:43Z","status":"completed"},{"completedAt":"2026-09-10T23:13:57Z","conclusion":"success","name":"archive verifier regression checks","number":3,"startedAt":"2026-09-10T23:13:57Z","status":"completed"},{"completedAt":"2026-09-10T23:14:01Z","conclusion":"success","name":"find and download the successful main CI candidate","number":4,"startedAt":"2026-09-10T23:13:57Z","status":"completed"},{"completedAt":"2026-09-10T23:14:02Z","conclusion":"success","name":"verify archive identity, source and version","number":5,"startedAt":"2026-09-10T23:14:01Z","status":"completed"},{"completedAt":"2026-09-10T23:14:04Z","conclusion":"success","name":"attest provenance","number":6,"startedAt":"2026-09-10T23:14:02Z","status":"completed"},{"completedAt":"2026-09-10T23:14:09Z","conclusion":"success","name":"publish","number":7,"startedAt":"2026-09-10T23:14:04Z","status":"completed"},{"completedAt":"2026-09-10T23:14:10Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":14,"startedAt":"2026-09-10T23:14:09Z","status":"completed"},{"completedAt":"2026-09-10T23:14:11Z","conclusion":"success","name":"Complete job","number":15,"startedAt":"2026-09-10T23:14:10Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/34541172114/job/103083925303"}],"status":"completed","url":"https://github.com/carloslfu/slotstream/actions/runs/34541172114"}

````````````

## Artifact SHA-256 3f3df02bc4f11a25b76a42221c228e9e6e61a477cf80b223b4ea24fbcff97e46

Encoding: `utf-8`. Original bytes: 18768.

````````````text
{
  "release_commit": "3c5004de314bedd7365c64b88ce3276593623fef",
  "qualified_instrumented_commit": "036d725a8b4917926a4cba3184440ff85d3a7db7",
  "compiled_source_files": {
    "Makefile": "1de4b2db83678e0705ebd955698b6d5fe053e0e3dc86a9326523ac23d219c567",
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
    "Sources/Slotstream/Context.swift": "af310ab4ca9eb15b81b02e364164e07d0b56090997b6965538aa1583ac864a0f",
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
    "Sources/Slotstream/Generate.swift": "ea743f98a23cfada2157290dcc591e85a977db7d537dd57ee6cb76925d6dd9ec",
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
    "Sources/Slotstream/Optimizations.swift": "c4e09b8b6846abd3f6ac680c8c6723e9f123f84469ca4426afbab4375a2eb91c",
    "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
    "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
    "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
    "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
    "Sources/Slotstream/Plan.swift": "5b4ccdd593c3d4e74d874613014663fe8e2805c034a6e3990fa35523ed4e0223",
    "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
    "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
    "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
    "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
    "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
    "Sources/Slotstream/RequestControl.swift": "1e393e5ccc31528e2215c9a7ba72ece6b411d2772e1bd2225191b5ed46d87ecc",
    "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
    "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
    "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
    "Sources/Slotstream/Server.swift": "c20776840aa9551958d8fed92389c8fc32318c97639bd14d93609233dc449334",
    "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
    "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
    "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
    "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
    "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
    "Sources/Slotstream/Version.swift": "28819ff10769800812f83f7fc8bb83bccf19c29ce29bf9f06c4ffbe2be49ae14",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "fec6dda4397daa0b5293e3d9cc617cadc17e409a5627ed8a15b9b2bea205deca",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "35d99deb614da4ffdfef075eabdc5a1c8b3518bf9accf265796e09f2c7c281ee",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
    "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
    "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
    "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "f40d8e711121f12cbcd95f8880d483ac36995faeab06af714d201fa1671348f1",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "b76e9185930a90d2509f9d7dfc247afee3ff2a083a1bc6bb3da6d090653d290f",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "d3bef4297f9502a90866c04785c74ecb24659dc38d3f0062d90eaa72431a79df",
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
    "Sources/SlotstreamTestKit/OpenAIChecks.swift": "7b25dbc7700bc8dd23d896278f8dca2102ad59d473cb1f374958743a1a1a0b08",
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
    "Sources/slotstream-cli/main.swift": "8e44c6205300d28fd8874c0b1185c7260c510dc8c4324b79678aa6051fce10cf",
    "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "compiled_source_differences": [
    "Sources/Slotstream/Version.swift"
  ],
  "difference_scope": "Version string only. Test and release workflow corrections are separate from compiled inference sources. Full main CI must pass before tagging.",
  "main_ci_run": 34539578315
}

````````````

## Artifact SHA-256 8b9468c2f3d3404ea12cb55fe84d4c1ce3f259112a8a954894251362cc317c94

Encoding: `utf-8`. Original bytes: 19433.

````````````text
{
  "release_commit": "ac7d7e53ca2397bb8840a97f028509fbb0a8f688",
  "qualified_instrumented_commit": "036d725a8b4917926a4cba3184440ff85d3a7db7",
  "compiled_source_files": {
    "Makefile": "1de4b2db83678e0705ebd955698b6d5fe053e0e3dc86a9326523ac23d219c567",
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
    "Sources/Slotstream/Context.swift": "af310ab4ca9eb15b81b02e364164e07d0b56090997b6965538aa1583ac864a0f",
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
    "Sources/Slotstream/Generate.swift": "ea743f98a23cfada2157290dcc591e85a977db7d537dd57ee6cb76925d6dd9ec",
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
    "Sources/Slotstream/Optimizations.swift": "c4e09b8b6846abd3f6ac680c8c6723e9f123f84469ca4426afbab4375a2eb91c",
    "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
    "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
    "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
    "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
    "Sources/Slotstream/Plan.swift": "5b4ccdd593c3d4e74d874613014663fe8e2805c034a6e3990fa35523ed4e0223",
    "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
    "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
    "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
    "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
    "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
    "Sources/Slotstream/RequestControl.swift": "1e393e5ccc31528e2215c9a7ba72ece6b411d2772e1bd2225191b5ed46d87ecc",
    "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
    "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
    "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
    "Sources/Slotstream/Server.swift": "c20776840aa9551958d8fed92389c8fc32318c97639bd14d93609233dc449334",
    "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
    "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
    "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
    "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
    "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
    "Sources/Slotstream/Version.swift": "28819ff10769800812f83f7fc8bb83bccf19c29ce29bf9f06c4ffbe2be49ae14",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "fec6dda4397daa0b5293e3d9cc617cadc17e409a5627ed8a15b9b2bea205deca",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "35d99deb614da4ffdfef075eabdc5a1c8b3518bf9accf265796e09f2c7c281ee",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
    "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
    "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
    "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "f40d8e711121f12cbcd95f8880d483ac36995faeab06af714d201fa1671348f1",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "b76e9185930a90d2509f9d7dfc247afee3ff2a083a1bc6bb3da6d090653d290f",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "d3bef4297f9502a90866c04785c74ecb24659dc38d3f0062d90eaa72431a79df",
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
    "Sources/SlotstreamTestKit/OpenAIChecks.swift": "7b25dbc7700bc8dd23d896278f8dca2102ad59d473cb1f374958743a1a1a0b08",
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
    "Sources/slotstream-cli/main.swift": "8e44c6205300d28fd8874c0b1185c7260c510dc8c4324b79678aa6051fce10cf",
    "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "compiled_source_differences": [
    "Sources/Slotstream/Version.swift"
  ],
  "difference_scope": "Version string only. Test and release workflow corrections are separate from compiled inference sources. Full main CI must pass before tagging.",
  "main_ci_run": 34539578315,
  "documentation_head": "3c5004de314bedd7365c64b88ce3276593623fef",
  "documentation_only_changes_after_release_commit": [
    "MEASUREMENTS.md",
    "db/index.md",
    "db/log.md",
    "db/records/index.md",
    "db/records/measurements/decode-wall-time-attribution-2026-09-10.md",
    "db/records/measurements/index.jsonl",
    "db/records/measurements/index.md"
  ],
  "commit_binding_note": "The prospective source freeze originally used the concurrently created documentation head. The tag is bound to its parent with successful complete main CI; all compiled-source hashes are identical, and the later documentation is retained for the final evidence push."
}

````````````

## Artifact SHA-256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

Encoding: `utf-8`. Original bytes: 0.

````````````text

````````````

## Artifact SHA-256 16c3e2a5f6bfcfbb28e83931d286edcb9b9910b908e0debb8eb0b4f46c1c7b1c

Encoding: `utf-8`. Original bytes: 226.

````````````text
{"archive_sha256": "2fd5bfab8073b29095148274b0e5857a43dc20bc530bcacb4c9180ccc5ac2b52", "binary_sha256": "49d36b8057a79c013ef0d91b93b67ea0a987efb32e6dd5df6f03b6843b76e9f7", "source_files": 150, "source_matches_checkout": true}

````````````

## Artifact SHA-256 731c093a667b113ed523d4e7421eb7e2bbff3fb206657df2d3eaf864abdbaa27

Encoding: `gzip+base64`. Original bytes: 160703.

````````````text
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
````````````
