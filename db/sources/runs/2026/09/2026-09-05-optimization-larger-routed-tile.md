---
type: run
id: 01m1r26bwk44c21fnm4w5q2qq1
created: 2026-09-05T05:55:49.267371+00:00
updated: 2026-09-05T05:55:49.329087+00:00
summary: Larger routed tile exact checks pass; paired latency pilot excluded for swap activity
binary: Frozen per-experiment identities in body
captured_at: 2026-09-05
command: Exact commands in embedded manifests
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Larger routed-token tile correctness and inconclusive pilot
tool: Native diagnostics and paired inference harness
---
# Larger routed-token tile evidence

Partial unified optimization work; production controls remain off. The 2,048-token routed tile keeps the live reduced-output tile at at most 2,303 tokens by merging only tails shorter than 256. It does not increase the bounded chronological attention passes or public context limit.

The frozen V3 executable passed 117 assertions on the 8,192-token direct-model probe, again with exactly zero candidate state/logit/router deviations against the 4,096-token reference. It passed 593 generator cancellation/retry assertions and 240 synthetic image-span/MTP recovery assertions with the larger tile. These establish the checked numerical/lifecycle properties, not a latency improvement or full physical-envelope qualification.

Every complete pair in the three-round latency pilot is excluded: candidate round 1 and reference rounds 2/3 had swap activity. The raw request times and physical samples are preserved but cannot support a paired speed or resource claim. The pilot remains inconclusive. Further code experiments include a 4,096-token routed tile and releasing the previous/joined scope-frontier components before expert workspace assembly, both requiring separate numerical and resource gates.

Doctor at a 10 GB target prints 961 slots, a 256-token prefill chunk and a 9 GB expected peak. The existing transient estimator predates the compact-state/bounded-indexer changes. Recalibrating the planner to permit larger bounded chronological passes is a separate potentially larger opportunity; no new memory constants have been adopted from the scope probes.

## .build/optimization/candidate-scope-tile-v3/build-identity.json

SHA-256: `9feb5066bdfd8100df10eeadcef325797d60997bf0d4610b9d5ab8047dda6902`

```json
{
  "source": {
    "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
    "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
    "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
    "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
    "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
    "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
    "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
    "Sources/Slotstream/ExpertStore.swift": "e4454bf36b5477602f627026f5a0952186e4cfd136897d4bbdabefeffe4d5ca0",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "10d3e7ccc56d69537c73846a995e67cbdead71a64812b2a0880f527ba2725ad7",
    "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
    "Sources/Slotstream/Layers.swift": "64e246ac21b5a77109305798fae88b112baf4a180a07c5103ee881e7a99722ec",
    "Sources/Slotstream/MTP.swift": "887ca25d9beb7f63273e70bd6827362d861f91ef027f86627f024ebd6d9ab082",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/Model.swift": "5418511dce458c2c82b72eda5698ca27de99c55b3de7a682e96fd19d344fed46",
    "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
    "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
    "Sources/Slotstream/Optimizations.swift": "625a45f3eb709a361d1f5f0e81c259d911b1853a2e21f814d579433b53df1e63",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
    "Sources/Slotstream/PrefixCache.swift": "bb4f3a3480d321eab5eb3ad593e06071a29ae2f3b7ff19e476567a247d9ccbf3",
    "Sources/Slotstream/ProcessMemory.swift": "403a2ea9153b9d912b6a9457cd89bdeef951022d3e67ce0dbef3099f6a55078c",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/Server.swift": "f4607005c12f3b601145d7f5df83e080a7a85fab9d5cd819a92cf3f232154515",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
    "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
    "Sources/Slotstream/Vision.swift": "6a111dd5d1d11bc7be6a994656102d481dda1bbf6a6609a13e1e5c8feff74163",
    "Sources/Slotstream/VisionPrompt.swift": "7323f7bd01f386fc0871d928989b05f96b7c73b62192ea54764b40abbec2e810",
    "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
    "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
    "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
    "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
    "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "5c176aa9f00c8530a068d7bc8cbca8c2ad4732fd2819eb96961a15c265675e60",
    "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
    "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "d8fdab153addf92c9315abaaa4cab3128d799ecd39420b4929128c5b0b53f3fc",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "bcf956d09cd214ad4fbda949b074a43341b9b17bcd0691169209264e43e0f28a",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "e77a0594128eca2a4fc3359c0db7cc2d6a7e9c19c21e122a83ed56248ecb4dc9",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/OptimizationCommands.swift": "5df4e5401cfd2a050e36be72fe057036636a4ef70e8278d31cc1c1c202cd1aaa",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
    "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "c385c3a0445af5aaf21b335fb331bba8ea5b7c573cd1954d3c2667015d5e053c",
  "binary_sha256": "a2726723d87388c00355e42115a5f60affb9993f78f30a3af40f30264a089b08",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}
```

## .build/optimization/scope-tile-t0-t1-v3.json

SHA-256: `2210bcfbbcfcb90843d8917fc07c7a691906fe2d883e86a5f09c6064fbb9b998`

```json
{
  "checks" : [
    {
      "items" : [
        {
          "name" : "a pass never exceeds the measured query-by-key product",
          "passed" : true
        },
        {
          "name" : "a pass never falls below the measured floor",
          "passed" : true
        },
        {
          "name" : "the passes sum to the prompt",
          "passed" : true
        },
        {
          "name" : "reading more tokens never takes less time",
          "passed" : true
        },
        {
          "name" : "the pass shrinks as the context grows",
          "passed" : true
        },
        {
          "name" : "the shrunken pass is still at the floor or above",
          "passed" : true
        },
        {
          "name" : "an empty prompt runs no passes",
          "passed" : true
        },
        {
          "name" : "an empty prompt costs no time",
          "passed" : true
        },
        {
          "name" : "actual tail fits without a third pass",
          "passed" : true
        },
        {
          "name" : "reference tail is preserved as the control",
          "passed" : true
        },
        {
          "name" : "tail schedule covers reused offsets, boundaries and all supported context",
          "passed" : true
        },
        {
          "name" : "read scopes preserve every bounded compute pass",
          "passed" : true
        },
        {
          "name" : "zero remainder makes no pass",
          "passed" : true
        },
        {
          "name" : "huge diagnostic inputs do not overflow",
          "passed" : true
        },
        {
          "name" : "a fully cached prompt runs no passes",
          "passed" : true
        }
      ],
      "measurements" : {
        "chunk_at_0" : 4096,
        "chunk_at_31k" : 1024,
        "worst_query_key_product" : 32505856
      },
      "name" : "prefill-schedule",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "1 is accepted",
          "passed" : true
        },
        {
          "name" : "the ceiling is accepted",
          "passed" : true
        },
        {
          "name" : "0 is refused",
          "passed" : true
        },
        {
          "name" : "-1 is refused",
          "passed" : true
        },
        {
          "name" : "one past the ceiling is refused",
          "passed" : true
        },
        {
          "name" : "the refusal names the ceiling",
          "passed" : true
        },
        {
          "name" : "the refusal says the ceiling is measured, not a memory limit",
          "passed" : true
        },
        {
          "name" : "the refusal names the tool that moves it",
          "passed" : true
        }
      ],
      "measurements" : {
        "max_tokens" : 32768
      },
      "name" : "context-policy",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "process physical footprint is readable",
          "passed" : true
        },
        {
          "name" : "process RSS high-water is readable",
          "passed" : true
        },
        {
          "name" : "lifetime RSS is separately readable",
          "passed" : true
        },
        {
          "name" : "monotonic duration is nonnegative",
          "passed" : true
        },
        {
          "name" : "footprint sampler includes endpoints",
          "passed" : true
        },
        {
          "name" : "reference optimization defaults",
          "passed" : true
        },
        {
          "name" : "typed override enables compaction",
          "passed" : true
        },
        {
          "name" : "malformed override refused",
          "passed" : true
        },
        {
          "name" : "unknown optimization refused",
          "passed" : true
        },
        {
          "name" : "invalid read scope -1 refused",
          "passed" : true
        },
        {
          "name" : "invalid read scope 1 refused",
          "passed" : true
        },
        {
          "name" : "invalid read scope 16384 refused",
          "passed" : true
        },
        {
          "name" : "invalid read scope bad refused",
          "passed" : true
        },
        {
          "name" : "unbounded read scope refused",
          "passed" : true
        },
        {
          "name" : "explicit workspace tile is recorded",
          "passed" : true
        },
        {
          "name" : "unbounded workspace tile refused",
          "passed" : true
        },
        {
          "name" : "terminal output needs no speculative draft",
          "passed" : true
        },
        {
          "name" : "draft count fits remaining output",
          "passed" : true
        },
        {
          "name" : "public depth cannot exceed recording cap",
          "passed" : true
        },
        {
          "name" : "negative remaining output cannot underflow",
          "passed" : true
        },
        {
          "name" : "prefix cache reaches its four-entry bound",
          "passed" : true
        },
        {
          "name" : "an identical history replaces instead of duplicating an entry",
          "passed" : true
        },
        {
          "name" : "a miss evicts before allocating a fifth state",
          "passed" : true
        },
        {
          "name" : "a smaller live token ceiling evicts immediately",
          "passed" : true
        },
        {
          "name" : "held GB includes fixed recurrent state",
          "passed" : true
        },
        {
          "name" : "growing hit still reuses its state",
          "passed" : true
        },
        {
          "name" : "growing hit reserves future state before allocation",
          "passed" : true
        },
        {
          "name" : "huge reservation safely misses",
          "passed" : true
        },
        {
          "name" : "huge reservation releases held state",
          "passed" : true
        },
        {
          "name" : "capacity reservation still hits",
          "passed" : true
        },
        {
          "name" : "capacity growth reserves bytes before reuse",
          "passed" : true
        },
        {
          "name" : "saturated byte reservation evicts safely",
          "passed" : true
        },
        {
          "name" : "identical bytes hash alike",
          "passed" : true
        },
        {
          "name" : "different bytes do not",
          "passed" : true
        },
        {
          "name" : "the same image at the same offset matches",
          "passed" : true
        },
        {
          "name" : "a swapped image does not",
          "passed" : true
        },
        {
          "name" : "an entry ending inside a run still matches that run",
          "passed" : true
        },
        {
          "name" : "a text-only entry rejects a prompt with an image inside its range",
          "passed" : true
        },
        {
          "name" : "an image beyond the entry's range is irrelevant to the match",
          "passed" : true
        },
        {
          "name" : "a vision conversation is held, not discarded",
          "passed" : true
        },
        {
          "name" : "the same ids with a different picture miss",
          "passed" : true
        },
        {
          "name" : "the text-only splice never sees a vision entry",
          "passed" : true
        },
        {
          "name" : "prefix splice chooses the longest retained extension",
          "passed" : true
        },
        {
          "name" : "prefix splice is strict, not an identical-history match",
          "passed" : true
        },
        {
          "name" : "prefix splice lookup does not consume the retained state",
          "passed" : true
        },
        {
          "name" : "a disabled prefix cache offers no splice",
          "passed" : true
        },
        {
          "name" : "shard listing works through a symlinked model dir",
          "passed" : true
        },
        {
          "name" : "8.1 GB plan stays inside its target",
          "passed" : true
        },
        {
          "name" : "10.0 GB plan stays inside its target",
          "passed" : true
        },
        {
          "name" : "16.0 GB plan stays inside its target",
          "passed" : true
        },
        {
          "name" : "30.0 GB plan stays inside its target",
          "passed" : true
        }
      ],
      "measurements" : {
        "peak_gb_at_10" : 8.99949696,
        "peak_gb_at_16" : 14.999033087999997,
        "peak_gb_at_30" : 28.998546688,
        "peak_gb_at_8" : 7.921999103999999
      },
      "name" : "runtime-check",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "quiet machine at target: hold",
          "passed" : true
        },
        {
          "name" : "availability collapses: shrinks",
          "passed" : true
        },
        {
          "name" : "  ...and says why",
          "passed" : true
        },
        {
          "name" : "  ...converges in one step (no ratcheting)",
          "passed" : true
        },
        {
          "name" : "target depends on (available + pool), not on either alone",
          "passed" : true
        },
        {
          "name" : "small drop inside the shrink dead-band: hold",
          "passed" : true
        },
        {
          "name" : "small gain inside the grow dead-band: hold",
          "passed" : true
        },
        {
          "name" : "grow blocked while a resize is recent",
          "passed" : true
        },
        {
          "name" : "grow blocked while pressure is recent",
          "passed" : true
        },
        {
          "name" : "grow allowed once calm and cooled",
          "passed" : true
        },
        {
          "name" : "grow restores the planner's prefill and prefix budgets",
          "passed" : true
        },
        {
          "name" : "  ...and says why",
          "passed" : true
        },
        {
          "name" : "warning pressure sheds >= max(2 GB, 15%)",
          "passed" : true
        },
        {
          "name" : "  ...ignores the resize cooldown",
          "passed" : true
        },
        {
          "name" : "critical pressure sheds >= max(4 GB, 50%)",
          "passed" : true
        },
        {
          "name" : "critical sheds strictly more than warning",
          "passed" : true
        },
        {
          "name" : "repeated critical pressure converges to the floor",
          "passed" : true
        },
        {
          "name" : "floor is never breached",
          "passed" : true
        },
        {
          "name" : "at the floor, more pressure is a no-op",
          "passed" : true
        },
        {
          "name" : "never asks for more slots than the model has",
          "passed" : true
        }
      ],
      "measurements" : {
        "critical_shed_gb" : 10.063872,
        "warning_shed_gb" : 3.0191616000000003
      },
      "name" : "governor-check",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "matching file is accepted",
          "passed" : true
        },
        {
          "name" : "same-size corruption is rejected",
          "passed" : true
        },
        {
          "name" : "exact Content-Range is accepted",
          "passed" : true
        },
        {
          "name" : "wrong range start is rejected",
          "passed" : true
        },
        {
          "name" : "wrong range total is rejected",
          "passed" : true
        },
        {
          "name" : "unknown range total is rejected",
          "passed" : true
        },
        {
          "name" : "every pinned file has a digest",
          "passed" : true
        },
        {
          "name" : "the draft head is pinned as the one optional file",
          "passed" : true
        },
        {
          "name" : "an absent optional file is not a repair; an absent required one is",
          "passed" : true
        },
        {
          "name" : "an empty directory reads as missing",
          "passed" : true
        },
        {
          "name" : "missing needs the whole manifest",
          "passed" : true
        },
        {
          "name" : "status carries free disk",
          "passed" : true
        },
        {
          "name" : "bytesToFetch agrees with the manifest",
          "passed" : true
        },
        {
          "name" : "a missing copy is not ready",
          "passed" : true
        }
      ],
      "measurements" : {
        "free_disk_bytes" : 461475168256,
        "manifest_files" : 25,
        "manifest_required_bytes" : 103793508077,
        "manifest_total_bytes" : 105264463248
      },
      "name" : "pull-check",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "a simulated device is marked",
          "passed" : true
        },
        {
          "name" : "the working set defaults to 75% of RAM",
          "passed" : true
        },
        {
          "name" : "a simulated device produces a plan",
          "passed" : true
        },
        {
          "name" : "the plan carries the simulation",
          "passed" : true
        },
        {
          "name" : "the current machine is not simulated",
          "passed" : true
        },
        {
          "name" : "a real plan is not marked simulated",
          "passed" : true
        },
        {
          "name" : "the current machine reports RAM",
          "passed" : true
        },
        {
          "name" : "the working set is below RAM",
          "passed" : true
        },
        {
          "name" : "a simulated availability is bounded by the real reading",
          "passed" : true
        },
        {
          "name" : "--experts-per-layer wins over --memory-gb",
          "passed" : true
        },
        {
          "name" : "the losing knob is noted",
          "passed" : true
        },
        {
          "name" : "an empty request is auto",
          "passed" : true
        },
        {
          "name" : "any knob makes it not auto",
          "passed" : true
        },
        {
          "name" : "a plan request round-trips through JSON",
          "passed" : true
        },
        {
          "name" : "a device round-trips through JSON",
          "passed" : true
        }
      ],
      "measurements" : {
        "machine_ram_gb" : 51.539607552,
        "machine_working_set_gb" : 40.200896512
      },
      "name" : "machine-planning",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "a normal request parses its method",
          "passed" : true
        },
        {
          "name" : "...and its path",
          "passed" : true
        },
        {
          "name" : "...and its content length",
          "passed" : true
        },
        {
          "name" : "...and lowercases header names",
          "passed" : true
        },
        {
          "name" : "a chunked body is 411, not an empty read",
          "passed" : true
        },
        {
          "name" : "...and the message says what to send instead",
          "passed" : true
        },
        {
          "name" : "an oversized body is 413",
          "passed" : true
        },
        {
          "name" : "a body exactly at the cap is accepted",
          "passed" : true
        },
        {
          "name" : "a malformed Content-Length is 400",
          "passed" : true
        },
        {
          "name" : "a negative Content-Length is 400",
          "passed" : true
        },
        {
          "name" : "no Content-Length means no body",
          "passed" : true
        }
      ],
      "measurements" : {
        "max_body_bytes" : 33554432
      },
      "name" : "http-framing",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "a query string does not change the route",
          "passed" : true
        },
        {
          "name" : "a bare path is unchanged",
          "passed" : true
        },
        {
          "name" : "a trailing slash is the same route",
          "passed" : true
        },
        {
          "name" : "the root keeps its slash",
          "passed" : true
        },
        {
          "name" : "an absolute-form target routes on its path",
          "passed" : true
        },
        {
          "name" : "...including https",
          "passed" : true
        },
        {
          "name" : "...and an authority with no path is the root",
          "passed" : true
        },
        {
          "name" : "...with the query still stripped",
          "passed" : true
        },
        {
          "name" : "no Origin needs no CORS header",
          "passed" : true
        },
        {
          "name" : "an empty Origin needs no CORS header",
          "passed" : true
        },
        {
          "name" : "loopback origin http:\/\/localhost:3000 is echoed",
          "passed" : true
        },
        {
          "name" : "...and varies on Origin",
          "passed" : true
        },
        {
          "name" : "loopback origin http:\/\/127.0.0.1:8080 is echoed",
          "passed" : true
        },
        {
          "name" : "...and varies on Origin",
          "passed" : true
        },
        {
          "name" : "loopback origin https:\/\/localhost is echoed",
          "passed" : true
        },
        {
          "name" : "...and varies on Origin",
          "passed" : true
        },
        {
          "name" : "loopback origin http:\/\/[::1]:5173 is echoed",
          "passed" : true
        },
        {
          "name" : "...and varies on Origin",
          "passed" : true
        },
        {
          "name" : "foreign origin https:\/\/attacker.example is refused",
          "passed" : true
        },
        {
          "name" : "foreign origin http:\/\/evil.localhost.attacker.com is refused",
          "passed" : true
        },
        {
          "name" : "foreign origin file:\/\/\/etc\/passwd is refused",
          "passed" : true
        },
        {
          "name" : "foreign origin http:\/\/192.168.1.10:3000 is refused",
          "passed" : true
        },
        {
          "name" : "foreign origin not a url is refused",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "http-routing",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "846x859 -> 52x54 patches",
          "passed" : true
        },
        {
          "name" : "846x859 -> 702 tokens",
          "passed" : true
        },
        {
          "name" : "1206x1570 -> 1862 tokens",
          "passed" : true
        },
        {
          "name" : "1024x1024 -> 1024 tokens",
          "passed" : true
        },
        {
          "name" : "a 56x56 thumbnail is raised to the 64-token floor",
          "passed" : true
        },
        {
          "name" : "224x224 lands on the same floor",
          "passed" : true
        },
        {
          "name" : "a 4K screenshot is capped at 2304 tokens",
          "passed" : true
        },
        {
          "name" : "and lands on the cap's grid",
          "passed" : true
        },
        {
          "name" : "the cap is the binding bound, not the processor's",
          "passed" : true
        },
        {
          "name" : "round-half-even keeps 0.5 at 0",
          "passed" : true
        },
        {
          "name" : "and sends 1.5 to 2",
          "passed" : true
        },
        {
          "name" : "and 2.5 back to 2",
          "passed" : true
        },
        {
          "name" : "3.5 to 4",
          "passed" : true
        },
        {
          "name" : "a zero dimension is refused",
          "passed" : true
        },
        {
          "name" : "an extreme aspect ratio is refused",
          "passed" : true
        },
        {
          "name" : "199:1 is still accepted",
          "passed" : true
        },
        {
          "name" : "bare base64 loads",
          "passed" : true
        },
        {
          "name" : "a data: URL loads",
          "passed" : true
        },
        {
          "name" : "whitespace around it is tolerated",
          "passed" : true
        },
        {
          "name" : "http:\/\/ is refused",
          "passed" : true
        },
        {
          "name" : "https:\/\/ is refused",
          "passed" : true
        },
        {
          "name" : "file:\/\/ is refused",
          "passed" : true
        },
        {
          "name" : "a filesystem path never returns the file",
          "passed" : true
        },
        {
          "name" : "nor does a file:\/\/ URL",
          "passed" : true
        },
        {
          "name" : "a data: URL that is not base64 is refused",
          "passed" : true
        },
        {
          "name" : "an empty payload is refused",
          "passed" : true
        },
        {
          "name" : "a payload past the size cap is refused before decoding",
          "passed" : true
        },
        {
          "name" : "and says URLs are not fetched",
          "passed" : true
        },
        {
          "name" : "a scheme is recognised",
          "passed" : true
        },
        {
          "name" : "case-insensitively",
          "passed" : true
        },
        {
          "name" : "base64 has none",
          "passed" : true
        },
        {
          "name" : "nor does a windows-ish path",
          "passed" : true
        },
        {
          "name" : "the fixture decodes to an image",
          "passed" : true
        },
        {
          "name" : "half a PNG does not",
          "passed" : true
        },
        {
          "name" : "a transparent pixel composites onto white, not onto black",
          "passed" : true
        },
        {
          "name" : "a whole PNG has its IEND",
          "passed" : true
        },
        {
          "name" : "half a PNG does not",
          "passed" : true
        },
        {
          "name" : "and it is refused rather than decoded",
          "passed" : true
        },
        {
          "name" : "a JPEG missing its EOI is truncated",
          "passed" : true
        },
        {
          "name" : "one with EOI then trailing bytes is not",
          "passed" : true
        },
        {
          "name" : "a container with no known terminator is left to ImageIO",
          "passed" : true
        },
        {
          "name" : "EXIF orientation 1 lands every corner",
          "passed" : true
        },
        {
          "name" : "EXIF orientation 2 lands every corner",
          "passed" : true
        },
        {
          "name" : "EXIF orientation 3 lands every corner",
          "passed" : true
        },
        {
          "name" : "EXIF orientation 4 lands every corner",
          "passed" : true
        },
        {
          "name" : "EXIF orientation 5 lands every corner",
          "passed" : true
        },
        {
          "name" : "EXIF orientation 6 lands every corner",
          "passed" : true
        },
        {
          "name" : "EXIF orientation 7 lands every corner",
          "passed" : true
        },
        {
          "name" : "EXIF orientation 8 lands every corner",
          "passed" : true
        },
        {
          "name" : "an unknown orientation value is left alone",
          "passed" : true
        },
        {
          "name" : "pixel values are one row per patch",
          "passed" : true
        },
        {
          "name" : "patches are ordered by merge block, not by row",
          "passed" : true
        },
        {
          "name" : "a run inside the chunk is re-based whole",
          "passed" : true
        },
        {
          "name" : "a run the chunk starts inside drops its head",
          "passed" : true
        },
        {
          "name" : "a run the chunk ends inside drops its tail",
          "passed" : true
        },
        {
          "name" : "a chunk strictly inside a run keeps the middle",
          "passed" : true
        },
        {
          "name" : "a run before the chunk is skipped",
          "passed" : true
        },
        {
          "name" : "a run after it too",
          "passed" : true
        },
        {
          "name" : "an exactly-abutting run is not overlap",
          "passed" : true
        },
        {
          "name" : "images come out in template order across both shapes",
          "passed" : true
        },
        {
          "name" : "a text-only conversation has none",
          "passed" : true
        },
        {
          "name" : "an ollama images field becomes content parts",
          "passed" : true
        },
        {
          "name" : "the picture leads",
          "passed" : true
        },
        {
          "name" : "and the text survives",
          "passed" : true
        },
        {
          "name" : "the image part carries the bytes unchanged",
          "passed" : true
        },
        {
          "name" : "a text-only part array collapses to a string",
          "passed" : true
        },
        {
          "name" : "a typed turn with images renders as parts",
          "passed" : true
        },
        {
          "name" : "images first",
          "passed" : true
        },
        {
          "name" : "a typed turn without them is still a plain string",
          "passed" : true
        },
        {
          "name" : "auto turns vision on when the checkpoint has a tower",
          "passed" : true
        },
        {
          "name" : "--vision off turns it back off",
          "passed" : true
        },
        {
          "name" : "the tower does not move the announced peak",
          "passed" : true
        },
        {
          "name" : "and the banner says what it will cost when it loads",
          "passed" : true
        },
        {
          "name" : "a text-only checkpoint cannot be forced on",
          "passed" : true
        },
        {
          "name" : "the machine-shaped request carries the mode too",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "vision-check",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "a seed reproduces exactly",
          "passed" : true
        },
        {
          "name" : "a different seed draws differently",
          "passed" : true
        },
        {
          "name" : "every draw is inside the vocabulary",
          "passed" : true
        },
        {
          "name" : "the requested number of draws come back",
          "passed" : true
        },
        {
          "name" : "greedy ignores the seed",
          "passed" : true
        },
        {
          "name" : "greedy repeats one token",
          "passed" : true
        },
        {
          "name" : "out-of-range knobs still draw",
          "passed" : true
        },
        {
          "name" : "out-of-range knobs do not collapse to token 0",
          "passed" : true
        },
        {
          "name" : "an empty draw count returns nothing",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k0 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k0 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k0 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k0 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k0 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k0 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k7 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k7 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k7 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k7 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k7 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k7 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k8 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k8 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k8 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k8 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k8 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k8 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k3 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k3 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k3 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k3 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k3 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k3 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k4 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k4 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k4 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k4 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k4 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k4 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k3 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k3 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k3 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k3 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k3 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k3 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k4 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k4 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k4 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k4 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k4 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k4 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k3 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k3 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k3 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k3 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k3 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k3 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k256 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k256 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k256 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k256 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k256 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k256 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k257 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k257 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k257 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k257 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k257 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k257 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k248319 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k248319 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k248319 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k248319 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k248319 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k248319 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k248320 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k248320 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k248320 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k248320 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k248320 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k248320 p1.0",
          "passed" : true
        }
      ],
      "measurements" : {
        "vocab" : 256
      },
      "name" : "sampler-behaviour",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "one run replaces exactly its own span",
          "passed" : true
        },
        {
          "name" : "and the shape survives",
          "passed" : true
        },
        {
          "name" : "two runs are placed in offset order, whatever order they arrive in",
          "passed" : true
        },
        {
          "name" : "a run covering the whole chunk leaves nothing of the embedding",
          "passed" : true
        },
        {
          "name" : "a run at the head",
          "passed" : true
        },
        {
          "name" : "a run at the tail",
          "passed" : true
        },
        {
          "name" : "leaves the right length",
          "passed" : true
        },
        {
          "name" : "a run entirely inside a chunk keeps every row",
          "passed" : true
        },
        {
          "name" : "a chunk starting inside a run keeps the tail",
          "passed" : true
        },
        {
          "name" : "re-based to the chunk",
          "passed" : true
        },
        {
          "name" : "and it is the run's last two rows, not its first",
          "passed" : true
        },
        {
          "name" : "a run outside the chunk is dropped",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "vision-splice",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "one call: event count",
          "passed" : true
        },
        {
          "name" : "one call: name",
          "passed" : true
        },
        {
          "name" : "one call: input",
          "passed" : true
        },
        {
          "name" : "one call: id",
          "passed" : true
        },
        {
          "name" : "prose: leading text",
          "passed" : true
        },
        {
          "name" : "prose: typed input",
          "passed" : true
        },
        {
          "name" : "two calls: count",
          "passed" : true
        },
        {
          "name" : "two calls: first",
          "passed" : true
        },
        {
          "name" : "two calls: second",
          "passed" : true
        },
        {
          "name" : "two calls: distinct ids",
          "passed" : true
        },
        {
          "name" : "trailing text",
          "passed" : true
        },
        {
          "name" : "unterminated: one malformed event",
          "passed" : true
        },
        {
          "name" : "unterminated: verbatim",
          "passed" : true
        },
        {
          "name" : "unterminated: no tool call emitted",
          "passed" : true
        },
        {
          "name" : "no parameters: input",
          "passed" : true
        },
        {
          "name" : "deltas concatenate to input (read_file)",
          "passed" : true
        },
        {
          "name" : "deltas concatenate to input (read_file)",
          "passed" : true
        },
        {
          "name" : "deltas concatenate to input (read_file)",
          "passed" : true
        },
        {
          "name" : "deltas concatenate to input (list_dir)",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "toolcall-check",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "one call: every split agrees (98 splits)",
          "passed" : true
        },
        {
          "name" : "one call: no partial tag leaks as text",
          "passed" : true
        },
        {
          "name" : "prose: every split agrees (152 splits)",
          "passed" : true
        },
        {
          "name" : "prose: no partial tag leaks as text",
          "passed" : true
        },
        {
          "name" : "two calls: every split agrees (216 splits)",
          "passed" : true
        },
        {
          "name" : "two calls: no partial tag leaks as text",
          "passed" : true
        },
        {
          "name" : "trailing: every split agrees (104 splits)",
          "passed" : true
        },
        {
          "name" : "trailing: no partial tag leaks as text",
          "passed" : true
        },
        {
          "name" : "one call: character-by-character agrees",
          "passed" : true
        },
        {
          "name" : "two calls: character-by-character agrees",
          "passed" : true
        },
        {
          "name" : "holdback: plain text",
          "passed" : true
        },
        {
          "name" : "holdback: partial tag",
          "passed" : true
        },
        {
          "name" : "holdback: bare <",
          "passed" : true
        },
        {
          "name" : "holdback: complete tag not held",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "toolcall-stream-check",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "string: framing newlines",
          "passed" : true
        },
        {
          "name" : "string: inner newline kept",
          "passed" : true
        },
        {
          "name" : "string: blank line kept",
          "passed" : true
        },
        {
          "name" : "string: numeric stays string",
          "passed" : true
        },
        {
          "name" : "integer",
          "passed" : true
        },
        {
          "name" : "integer: negative",
          "passed" : true
        },
        {
          "name" : "integer: not a number falls back",
          "passed" : true
        },
        {
          "name" : "number: integral prints as int",
          "passed" : true
        },
        {
          "name" : "number: fractional",
          "passed" : true
        },
        {
          "name" : "boolean true",
          "passed" : true
        },
        {
          "name" : "boolean false",
          "passed" : true
        },
        {
          "name" : "boolean: junk falls back",
          "passed" : true
        },
        {
          "name" : "array",
          "passed" : true
        },
        {
          "name" : "array: junk falls back",
          "passed" : true
        },
        {
          "name" : "object",
          "passed" : true
        },
        {
          "name" : "object: key order is sorted",
          "passed" : true
        },
        {
          "name" : "unknown: bare word",
          "passed" : true
        },
        {
          "name" : "unknown: integer",
          "passed" : true
        },
        {
          "name" : "unknown: boolean",
          "passed" : true
        },
        {
          "name" : "unknown: object",
          "passed" : true
        },
        {
          "name" : "undeclared parameter is kept",
          "passed" : true
        },
        {
          "name" : "missing required parameter passes through",
          "passed" : true
        },
        {
          "name" : "string: quotes and backslashes escaped",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "toolcall-coercion",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "matching headers pass",
          "passed" : true
        },
        {
          "name" : "wrong specification version",
          "passed" : true
        },
        {
          "name" : "wrong protocol version",
          "passed" : true
        },
        {
          "name" : "absent headers are tolerated",
          "passed" : true
        },
        {
          "name" : "unknown field is refused by name",
          "passed" : true
        },
        {
          "name" : "json responseFormat is refused",
          "passed" : true
        },
        {
          "name" : "text responseFormat is accepted",
          "passed" : true
        },
        {
          "name" : "non-zero frequencyPenalty is refused",
          "passed" : true
        },
        {
          "name" : "frequencyPenalty 0 is accepted",
          "passed" : true
        },
        {
          "name" : "providerOptions is ignored, not refused",
          "passed" : true
        },
        {
          "name" : "includeRawChunks is ignored",
          "passed" : true
        },
        {
          "name" : "provider tools are dropped",
          "passed" : true
        },
        {
          "name" : "function tool name",
          "passed" : true
        },
        {
          "name" : "schema: string parameter",
          "passed" : true
        },
        {
          "name" : "schema: integer parameter",
          "passed" : true
        },
        {
          "name" : "schema: a two-type anyOf stays unknown",
          "passed" : true
        },
        {
          "name" : "toolChoice auto",
          "passed" : true
        },
        {
          "name" : "toolChoice none",
          "passed" : true
        },
        {
          "name" : "toolChoice required",
          "passed" : true
        },
        {
          "name" : "toolChoice tool",
          "passed" : true
        },
        {
          "name" : "toolChoice tool without a name",
          "passed" : true
        },
        {
          "name" : "no reasoning field: thinking off",
          "passed" : true
        },
        {
          "name" : "none: thinking off",
          "passed" : true
        },
        {
          "name" : "minimal: thinking off",
          "passed" : true
        },
        {
          "name" : "low maps to low",
          "passed" : true
        },
        {
          "name" : "medium maps to medium",
          "passed" : true
        },
        {
          "name" : "high maps to xhigh",
          "passed" : true
        },
        {
          "name" : "max maps to xhigh",
          "passed" : true
        },
        {
          "name" : "unknown label: thinking on, template default",
          "passed" : true
        },
        {
          "name" : "unknown label carries no effort",
          "passed" : true
        },
        {
          "name" : "maxOutputTokens",
          "passed" : true
        },
        {
          "name" : "seed",
          "passed" : true
        },
        {
          "name" : "stopSequences",
          "passed" : true
        },
        {
          "name" : "topK",
          "passed" : true
        },
        {
          "name" : "agent temperature",
          "passed" : true
        },
        {
          "name" : "agent top-p",
          "passed" : true
        },
        {
          "name" : "agent presence penalty",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "gateway-request",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "six systems become one",
          "passed" : true
        },
        {
          "name" : "systems joined by a blank line",
          "passed" : true
        },
        {
          "name" : "system comes first",
          "passed" : true
        },
        {
          "name" : "system after user is refused",
          "passed" : true
        },
        {
          "name" : "an image file part becomes the turn's picture",
          "passed" : true
        },
        {
          "name" : "a non-image file part is refused",
          "passed" : true
        },
        {
          "name" : "an image file part without data is refused",
          "passed" : true
        },
        {
          "name" : "a tool result may still not carry media",
          "passed" : true
        },
        {
          "name" : "tool loop: message count",
          "passed" : true
        },
        {
          "name" : "tool loop: assistant text",
          "passed" : true
        },
        {
          "name" : "tool loop: one call",
          "passed" : true
        },
        {
          "name" : "tool loop: call name",
          "passed" : true
        },
        {
          "name" : "tool loop: object input accepted",
          "passed" : true
        },
        {
          "name" : "tool loop: result role",
          "passed" : true
        },
        {
          "name" : "tool loop: result text",
          "passed" : true
        },
        {
          "name" : "tool loop: result id kept",
          "passed" : true
        },
        {
          "name" : "tool-call input as a JSON string",
          "passed" : true
        },
        {
          "name" : "output text",
          "passed" : true
        },
        {
          "name" : "output error-text",
          "passed" : true
        },
        {
          "name" : "output json is compact JSON",
          "passed" : true
        },
        {
          "name" : "output execution-denied",
          "passed" : true
        },
        {
          "name" : "output content joins text items",
          "passed" : true
        },
        {
          "name" : "assistant-final prompt is refused",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "gateway-prompt",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "cap 512: four entries",
          "passed" : true
        },
        {
          "name" : "cap 1024: four entries",
          "passed" : true
        },
        {
          "name" : "cap 2048: four entries",
          "passed" : true
        },
        {
          "name" : "cap 4096: four entries",
          "passed" : true
        },
        {
          "name" : "cap 8192: four entries",
          "passed" : true
        },
        {
          "name" : "cap 8193: four entries",
          "passed" : true
        },
        {
          "name" : "cap 12288: four entries",
          "passed" : true
        },
        {
          "name" : "cap 16384: four entries",
          "passed" : true
        },
        {
          "name" : "cap 24576: four entries",
          "passed" : true
        },
        {
          "name" : "cap 32768: four entries",
          "passed" : true
        },
        {
          "name" : "max_tokens < context_window at every cap",
          "passed" : true
        },
        {
          "name" : "no alias window exceeds the live cap",
          "passed" : true
        },
        {
          "name" : "object is a list",
          "passed" : true
        },
        {
          "name" : "every entry is a language model",
          "passed" : true
        },
        {
          "name" : "every entry advertises tool-use",
          "passed" : true
        },
        {
          "name" : "a vision server advertises the vision tag",
          "passed" : true
        },
        {
          "name" : "a text-only server does not",
          "passed" : true
        },
        {
          "name" : "no web-search or caching tags either way",
          "passed" : true
        },
        {
          "name" : "served model sorts first",
          "passed" : true
        },
        {
          "name" : "served model rank",
          "passed" : true
        },
        {
          "name" : "aliases rank below it",
          "passed" : true
        },
        {
          "name" : "catalogue lists moonshotai\/kimi-k3",
          "passed" : true
        },
        {
          "name" : "catalogue lists openai\/gpt-5.6-luna",
          "passed" : true
        },
        {
          "name" : "catalogue lists google\/gemini-2.5-flash",
          "passed" : true
        },
        {
          "name" : "served model offers effort",
          "passed" : true
        },
        {
          "name" : "aliases offer no effort",
          "passed" : true
        },
        {
          "name" : "compactor window is bounded",
          "passed" : true
        },
        {
          "name" : "compactor reply budget is small",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "gateway-catalog",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "frame starts with `data: `",
          "passed" : true
        },
        {
          "name" : "frame ends with a blank line",
          "passed" : true
        },
        {
          "name" : "frame has no interior newline",
          "passed" : true
        },
        {
          "name" : "keepalive is a comment fx skips",
          "passed" : true
        },
        {
          "name" : "finishReason is an object",
          "passed" : true
        },
        {
          "name" : "finishReason.unified",
          "passed" : true
        },
        {
          "name" : "finishReason.raw",
          "passed" : true
        },
        {
          "name" : "usage.inputTokens is nested",
          "passed" : true
        },
        {
          "name" : "inputTokens.total",
          "passed" : true
        },
        {
          "name" : "inputTokens.cacheRead is the prefix hit",
          "passed" : true
        },
        {
          "name" : "inputTokens.noCache is what was prefilled",
          "passed" : true
        },
        {
          "name" : "outputTokens.total",
          "passed" : true
        },
        {
          "name" : "outputTokens.text",
          "passed" : true
        },
        {
          "name" : "outputTokens.reasoning",
          "passed" : true
        },
        {
          "name" : "cold prompt: noCache equals total",
          "passed" : true
        },
        {
          "name" : "a call makes the turn tool-calls",
          "passed" : true
        },
        {
          "name" : "the token limit is length",
          "passed" : true
        },
        {
          "name" : "end of sequence is stop",
          "passed" : true
        },
        {
          "name" : "every unified value is one fx accepts",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "gateway-events",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "the turn that produced it is accepted",
          "passed" : true
        },
        {
          "name" : "reasoning in the generated text is ignored",
          "passed" : true
        },
        {
          "name" : "different arguments are refused",
          "passed" : true
        },
        {
          "name" : "a different tool is refused",
          "passed" : true
        },
        {
          "name" : "different text is refused",
          "passed" : true
        },
        {
          "name" : "a missing call is refused",
          "passed" : true
        },
        {
          "name" : "an extra call is refused",
          "passed" : true
        },
        {
          "name" : "an unterminated block is refused",
          "passed" : true
        },
        {
          "name" : "trailing whitespace is tolerated",
          "passed" : true
        },
        {
          "name" : "a plain text turn matches",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "chat-splice",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "a bare null does not bridge to NSNull",
          "passed" : true
        },
        {
          "name" : "a null inside an object does not bridge to NSNull",
          "passed" : true
        },
        {
          "name" : "a null inside an array does not bridge to NSNull",
          "passed" : true
        },
        {
          "name" : "a deeply nested null does not bridge to NSNull",
          "passed" : true
        },
        {
          "name" : "the null bridge value is not NSNull",
          "passed" : true
        },
        {
          "name" : "a null inside a tool schema survives parsing",
          "passed" : true
        },
        {
          "name" : "the rendered tool spec carries no NSNull",
          "passed" : true
        },
        {
          "name" : "a null tool-call argument renders without NSNull",
          "passed" : true
        },
        {
          "name" : "the null argument is kept, not dropped",
          "passed" : true
        },
        {
          "name" : "a json tool result renders null as text",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "gateway-null-bridge",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "action is a string",
          "passed" : true
        },
        {
          "name" : "timeout_ms is an integer",
          "passed" : true
        },
        {
          "name" : "an optional string resolves to string",
          "passed" : true
        },
        {
          "name" : "an optional working directory resolves to string",
          "passed" : true
        },
        {
          "name" : "an optional enum resolves to string",
          "passed" : true
        },
        {
          "name" : "an optional integer resolves to integer",
          "passed" : true
        },
        {
          "name" : "an optional boolean resolves to boolean",
          "passed" : true
        },
        {
          "name" : "a genuine two-type union stays unknown",
          "passed" : true
        },
        {
          "name" : "a numeric-looking command stays a string",
          "passed" : true
        },
        {
          "name" : "a numeric-looking cwd stays a string",
          "passed" : true
        },
        {
          "name" : "timeout_ms is still a number",
          "passed" : true
        },
        {
          "name" : "the emitted input is what fx expects",
          "passed" : true
        },
        {
          "name" : "a missing required field is not invented",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "gateway-anyof-types",
      "passed" : true
    }
  ],
  "failed" : 0,
  "passed" : 21,
  "skipped" : 0
}
```

## .build/optimization/read-scope-generation-protocol-v3.json

SHA-256: `3872e6f68ea714847b86ae5e21339a1931fe7d163b3d3d7a06171a0209c84acb`

```json
{
  "label": "read-scope-generation-tile-pilot-v3",
  "classification": "exploratory mechanism A/B; not fixed-total-memory adoption",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-tile-v3/slotstream",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
      "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
      "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
      "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/ExpertStore.swift": "e4454bf36b5477602f627026f5a0952186e4cfd136897d4bbdabefeffe4d5ca0",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "10d3e7ccc56d69537c73846a995e67cbdead71a64812b2a0880f527ba2725ad7",
      "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
      "Sources/Slotstream/Layers.swift": "64e246ac21b5a77109305798fae88b112baf4a180a07c5103ee881e7a99722ec",
      "Sources/Slotstream/MTP.swift": "887ca25d9beb7f63273e70bd6827362d861f91ef027f86627f024ebd6d9ab082",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
      "Sources/Slotstream/Model.swift": "5418511dce458c2c82b72eda5698ca27de99c55b3de7a682e96fd19d344fed46",
      "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
      "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
      "Sources/Slotstream/Optimizations.swift": "625a45f3eb709a361d1f5f0e81c259d911b1853a2e21f814d579433b53df1e63",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
      "Sources/Slotstream/PrefixCache.swift": "bb4f3a3480d321eab5eb3ad593e06071a29ae2f3b7ff19e476567a247d9ccbf3",
      "Sources/Slotstream/ProcessMemory.swift": "403a2ea9153b9d912b6a9457cd89bdeef951022d3e67ce0dbef3099f6a55078c",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/Server.swift": "f4607005c12f3b601145d7f5df83e080a7a85fab9d5cd819a92cf3f232154515",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "6a111dd5d1d11bc7be6a994656102d481dda1bbf6a6609a13e1e5c8feff74163",
      "Sources/Slotstream/VisionPrompt.swift": "7323f7bd01f386fc0871d928989b05f96b7c73b62192ea54764b40abbec2e810",
      "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
      "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
      "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "5c176aa9f00c8530a068d7bc8cbca8c2ad4732fd2819eb96961a15c265675e60",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "d8fdab153addf92c9315abaaa4cab3128d799ecd39420b4929128c5b0b53f3fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "bcf956d09cd214ad4fbda949b074a43341b9b17bcd0691169209264e43e0f28a",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "e77a0594128eca2a4fc3359c0db7cc2d6a7e9c19c21e122a83ed56248ecb4dc9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "5df4e5401cfd2a050e36be72fe057036636a4ef70e8278d31cc1c1c202cd1aaa",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
      "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "c385c3a0445af5aaf21b335fb331bba8ea5b7c573cd1954d3c2667015d5e053c",
    "binary_sha256": "a2726723d87388c00355e42115a5f60affb9993f78f30a3af40f30264a089b08",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "prerequisites": [
    "v3 8192-token scope state/logits/routes rechunk-band probe",
    "v3 scope lifecycle at tile 2048",
    "v3 synthetic image-span/MTP scope recovery at tile 2048"
  ],
  "arms": {
    "reference": {
      "SLOTSTREAM_OPT_COMPACT_STATE": "1",
      "SLOTSTREAM_OPT_COMPACT_MTP": "1",
      "SLOTSTREAM_OPT_INDEXER_TILES": "1",
      "SLOTSTREAM_OPT_PLE_TILES": "1",
      "SLOTSTREAM_OPT_FINAL_FORWARD": "1"
    },
    "scope": {
      "SLOTSTREAM_OPT_COMPACT_STATE": "1",
      "SLOTSTREAM_OPT_COMPACT_MTP": "1",
      "SLOTSTREAM_OPT_INDEXER_TILES": "1",
      "SLOTSTREAM_OPT_PLE_TILES": "1",
      "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
      "SLOTSTREAM_OPT_LAYER_WORKSPACE": "1",
      "SLOTSTREAM_OPT_READ_SCOPE": "8192",
      "SLOTSTREAM_OPT_WORKSPACE_TILE": "2048"
    }
  },
  "fixture": "Tools/fixtures/optimization/acceptance.txt",
  "fixture_sha256": "32e15bd0df7b057f31b74f94a24c179d4374c19ddc54b77d590e330710fc8f78",
  "memory_gb": 8.1,
  "fixed_actual_pool_slots": 640,
  "max_compute_chunk": 4096,
  "candidate_scope_limit": 8192,
  "total_memory_matched": false,
  "extra_allowances": "forced compute chunk plus full expert workspace plus conservative scope frontier/checkpoint; reported by harness",
  "rounds": 3,
  "order": [
    "reference,scope",
    "scope,reference",
    "reference,scope"
  ],
  "mtp": "off",
  "max_tokens": 1,
  "seed": 7,
  "primary_metric": "paired requestSeconds reduction",
  "secondary": [
    "prefillSeconds",
    "expert records/bytes",
    "sampled physical footprint",
    "allocator peaks"
  ],
  "pilot_useful_benefit": 0.1,
  "required_clean_pairs": 3,
  "candidate_sampled_physical_ceiling_gb": 12,
  "invalid_pair_rules": [
    "either cell failed/incomplete",
    "either cell has any swap counter change",
    "prompt/pool/effective MTP mismatch"
  ],
  "numerical": "exact output IDs required; full scope state/logits/routing checked separately; no refreshed goldens",
  "claim_limit": "advance to fixed-total-memory confirmation only; no production adoption from this pilot; file cache uncontrolled; per-process expert/prefix caches cold",
  "workspace_token_tile": 2048,
  "workspace_live_tile_bound": 2303,
  "hypothesis": "More routed rows per expert/GEMM improve GPU weight reuse; same bounded chronological compute schedule and same disk read scope."
}
```

## .build/optimization/doctor-10-v3.json

SHA-256: `8adf75975da3dee69ceed97947fc17cfd88403d4d95059943d1648a6c0d9917b`

```json
{
  "availability_clamped" : false,
  "device_available_gb" : 31.800000000000001,
  "device_ram_gb" : 51.5,
  "device_working_set_gb" : 40.200000000000003,
  "est_prefill_s_at_max_context" : 385.50588235294038,
  "est_prefill_tok_s" : 85,
  "est_warm_tok_s" : 4.0041666666666664,
  "expected_peak_gb" : 9,
  "experts_per_layer_cached" : 20,
  "fully_resident" : false,
  "max_context_tokens" : 32768,
  "max_ram_percent" : 70,
  "mtp" : false,
  "pool_gb" : 2.7000000000000002,
  "pool_slots" : 961,
  "prefill_chunk" : 256,
  "prefix_cache_max_tokens" : 13382,
  "source" : "--memory-gb",
  "target_gb" : 10,
  "vision" : true,
  "vision_resident_gb" : 0.90000000000000002
}
```

## .build/optimization/scope-tile-8192-v3/manifest.json

SHA-256: `29b824123d5e5294a968ff28dc7abcb7ce3c313a19d7d6e4775e9f8a128746f7`

```json
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-tile-v3/slotstream",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
      "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
      "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
      "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/ExpertStore.swift": "e4454bf36b5477602f627026f5a0952186e4cfd136897d4bbdabefeffe4d5ca0",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "10d3e7ccc56d69537c73846a995e67cbdead71a64812b2a0880f527ba2725ad7",
      "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
      "Sources/Slotstream/Layers.swift": "64e246ac21b5a77109305798fae88b112baf4a180a07c5103ee881e7a99722ec",
      "Sources/Slotstream/MTP.swift": "887ca25d9beb7f63273e70bd6827362d861f91ef027f86627f024ebd6d9ab082",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
      "Sources/Slotstream/Model.swift": "5418511dce458c2c82b72eda5698ca27de99c55b3de7a682e96fd19d344fed46",
      "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
      "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
      "Sources/Slotstream/Optimizations.swift": "625a45f3eb709a361d1f5f0e81c259d911b1853a2e21f814d579433b53df1e63",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
      "Sources/Slotstream/PrefixCache.swift": "bb4f3a3480d321eab5eb3ad593e06071a29ae2f3b7ff19e476567a247d9ccbf3",
      "Sources/Slotstream/ProcessMemory.swift": "403a2ea9153b9d912b6a9457cd89bdeef951022d3e67ce0dbef3099f6a55078c",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/Server.swift": "f4607005c12f3b601145d7f5df83e080a7a85fab9d5cd819a92cf3f232154515",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "6a111dd5d1d11bc7be6a994656102d481dda1bbf6a6609a13e1e5c8feff74163",
      "Sources/Slotstream/VisionPrompt.swift": "7323f7bd01f386fc0871d928989b05f96b7c73b62192ea54764b40abbec2e810",
      "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
      "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
      "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "5c176aa9f00c8530a068d7bc8cbca8c2ad4732fd2819eb96961a15c265675e60",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "d8fdab153addf92c9315abaaa4cab3128d799ecd39420b4929128c5b0b53f3fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "bcf956d09cd214ad4fbda949b074a43341b9b17bcd0691169209264e43e0f28a",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "e77a0594128eca2a4fc3359c0db7cc2d6a7e9c19c21e122a83ed56248ecb4dc9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "5df4e5401cfd2a050e36be72fe057036636a4ef70e8278d31cc1c1c202cd1aaa",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
      "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "c385c3a0445af5aaf21b335fb331bba8ea5b7c573cd1954d3c2667015d5e053c",
    "binary_sha256": "a2726723d87388c00355e42115a5f60affb9993f78f30a3af40f30264a089b08",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 13.0,
  "timeout_seconds": 600,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-tile-v3/slotstream",
    "optimization-state-check",
    "--variant",
    "scope",
    "--tokens",
    "8192",
    "--json"
  ],
  "environment": {
    "SLOTSTREAM_OPT_WORKSPACE_TILE": "2048"
  },
  "classification": "correctness only; not timing evidence",
  "passed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 29611606016,
    "swapins": 41653704,
    "swapouts": 69884827,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                  1331128.\nPages active:                                 318192.\nPages inactive:                               586584.\nPages speculative:                            131647.\nPages throttled:                                   0.\nPages wired down:                             240059.\nPages purgeable:                               10323.\n\"Translation faults\":                    13654587654.\nPages copy-on-write:                       621455221.\nPages zero filled:                       13719876931.\nPages reactivated:                        2039818294.\nPages purged:                               59930113.\nFile-backed pages:                            465898.\nAnonymous pages:                              570525.\nPages stored in compressor:                  1532646.\nPages occupied by compressor:                 468612.\nDecompressions:                            941935260.\nCompressions:                             1233440053.\nPageins:                                  5585410121.\nPageouts:                                   10601894.\nSwapins:                                    41653704.\nSwapouts:                                   69884827.\nPages tagged:                                 170786.\nPages tagged resident:                        120248.\nPages tagged compressed:                       50538.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6914.\nPages tag-storage free:                         9571.\nPages tag-storage non-tag pageable:            81811.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8272832.\nTagged compressions:                         9104873.\nTagged decompressions:                       8359853.\n"
  },
  "exit_code": 0,
  "assertions": 117,
  "duration_seconds": 79.002901334,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31615926272,
    "swapins": 41653708,
    "swapouts": 69884827,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   462158.\nPages active:                                 901085.\nPages inactive:                               671827.\nPages speculative:                            227935.\nPages throttled:                                   0.\nPages wired down:                             247852.\nPages purgeable:                                6812.\n\"Translation faults\":                    13655482862.\nPages copy-on-write:                       621482489.\nPages zero filled:                       13807261551.\nPages reactivated:                        2044915416.\nPages purged:                               59959679.\nFile-backed pages:                           1460713.\nAnonymous pages:                              340134.\nPages stored in compressor:                  1751820.\nPages occupied by compressor:                 571070.\nDecompressions:                            942130567.\nCompressions:                             1233966869.\nPageins:                                  5590061162.\nPageouts:                                   10602343.\nSwapins:                                    41653708.\nSwapouts:                                   69884827.\nPages tagged:                                 168296.\nPages tagged resident:                        114143.\nPages tagged compressed:                       54153.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6912.\nPages tag-storage free:                         3851.\nPages tag-storage non-tag pageable:            87533.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9063296.\nTagged compressions:                         9110036.\nTagged decompressions:                       8361345.\n"
  }
}
```

## .build/optimization/scope-tile-8192-v3/stdout.txt

SHA-256: `8e8ba363f40cde3c19832e66211e056252d57bb44fd1354fdf1f0504270e3098`

```text
{
  "items" : [
    {
      "name" : "logits inside preregistered rechunk band",
      "passed" : true
    },
    {
      "name" : "greedy final token",
      "passed" : true
    },
    {
      "name" : "candidate state fields",
      "passed" : true
    },
    {
      "name" : "state band conv.0",
      "passed" : true
    },
    {
      "name" : "state band conv.1",
      "passed" : true
    },
    {
      "name" : "state band conv.10",
      "passed" : true
    },
    {
      "name" : "state band conv.12",
      "passed" : true
    },
    {
      "name" : "state band conv.13",
      "passed" : true
    },
    {
      "name" : "state band conv.14",
      "passed" : true
    },
    {
      "name" : "state band conv.16",
      "passed" : true
    },
    {
      "name" : "state band conv.17",
      "passed" : true
    },
    {
      "name" : "state band conv.18",
      "passed" : true
    },
    {
      "name" : "state band conv.2",
      "passed" : true
    },
    {
      "name" : "state band conv.20",
      "passed" : true
    },
    {
      "name" : "state band conv.21",
      "passed" : true
    },
    {
      "name" : "state band conv.22",
      "passed" : true
    },
    {
      "name" : "state band conv.24",
      "passed" : true
    },
    {
      "name" : "state band conv.25",
      "passed" : true
    },
    {
      "name" : "state band conv.26",
      "passed" : true
    },
    {
      "name" : "state band conv.28",
      "passed" : true
    },
    {
      "name" : "state band conv.29",
      "passed" : true
    },
    {
      "name" : "state band conv.30",
      "passed" : true
    },
    {
      "name" : "state band conv.32",
      "passed" : true
    },
    {
      "name" : "state band conv.33",
      "passed" : true
    },
    {
      "name" : "state band conv.34",
      "passed" : true
    },
    {
      "name" : "state band conv.36",
      "passed" : true
    },
    {
      "name" : "state band conv.37",
      "passed" : true
    },
    {
      "name" : "state band conv.38",
      "passed" : true
    },
    {
      "name" : "state band conv.4",
      "passed" : true
    },
    {
      "name" : "state band conv.40",
      "passed" : true
    },
    {
      "name" : "state band conv.41",
      "passed" : true
    },
    {
      "name" : "state band conv.42",
      "passed" : true
    },
    {
      "name" : "state band conv.44",
      "passed" : true
    },
    {
      "name" : "state band conv.45",
      "passed" : true
    },
    {
      "name" : "state band conv.46",
      "passed" : true
    },
    {
      "name" : "state band conv.5",
      "passed" : true
    },
    {
      "name" : "state band conv.6",
      "passed" : true
    },
    {
      "name" : "state band conv.8",
      "passed" : true
    },
    {
      "name" : "state band conv.9",
      "passed" : true
    },
    {
      "name" : "state band index.11",
      "passed" : true
    },
    {
      "name" : "state band index.15",
      "passed" : true
    },
    {
      "name" : "state band index.19",
      "passed" : true
    },
    {
      "name" : "state band index.23",
      "passed" : true
    },
    {
      "name" : "state band index.27",
      "passed" : true
    },
    {
      "name" : "state band index.3",
      "passed" : true
    },
    {
      "name" : "state band index.31",
      "passed" : true
    },
    {
      "name" : "state band index.35",
      "passed" : true
    },
    {
      "name" : "state band index.39",
      "passed" : true
    },
    {
      "name" : "state band index.43",
      "passed" : true
    },
    {
      "name" : "state band index.47",
      "passed" : true
    },
    {
      "name" : "state band index.7",
      "passed" : true
    },
    {
      "name" : "state band key.11",
      "passed" : true
    },
    {
      "name" : "state band key.15",
      "passed" : true
    },
    {
      "name" : "state band key.19",
      "passed" : true
    },
    {
      "name" : "state band key.23",
      "passed" : true
    },
    {
      "name" : "state band key.27",
      "passed" : true
    },
    {
      "name" : "state band key.3",
      "passed" : true
    },
    {
      "name" : "state band key.31",
      "passed" : true
    },
    {
      "name" : "state band key.35",
      "passed" : true
    },
    {
      "name" : "state band key.39",
      "passed" : true
    },
    {
      "name" : "state band key.43",
      "passed" : true
    },
    {
      "name" : "state band key.47",
      "passed" : true
    },
    {
      "name" : "state band key.7",
      "passed" : true
    },
    {
      "name" : "exact ngram",
      "passed" : true
    },
    {
      "name" : "state band ple.1",
      "passed" : true
    },
    {
      "name" : "state band ssm.0",
      "passed" : true
    },
    {
      "name" : "state band ssm.1",
      "passed" : true
    },
    {
      "name" : "state band ssm.10",
      "passed" : true
    },
    {
      "name" : "state band ssm.12",
      "passed" : true
    },
    {
      "name" : "state band ssm.13",
      "passed" : true
    },
    {
      "name" : "state band ssm.14",
      "passed" : true
    },
    {
      "name" : "state band ssm.16",
      "passed" : true
    },
    {
      "name" : "state band ssm.17",
      "passed" : true
    },
    {
      "name" : "state band ssm.18",
      "passed" : true
    },
    {
      "name" : "state band ssm.2",
      "passed" : true
    },
    {
      "name" : "state band ssm.20",
      "passed" : true
    },
    {
      "name" : "state band ssm.21",
      "passed" : true
    },
    {
      "name" : "state band ssm.22",
      "passed" : true
    },
    {
      "name" : "state band ssm.24",
      "passed" : true
    },
    {
      "name" : "state band ssm.25",
      "passed" : true
    },
    {
      "name" : "state band ssm.26",
      "passed" : true
    },
    {
      "name" : "state band ssm.28",
      "passed" : true
    },
    {
      "name" : "state band ssm.29",
      "passed" : true
    },
    {
      "name" : "state band ssm.30",
      "passed" : true
    },
    {
      "name" : "state band ssm.32",
      "passed" : true
    },
    {
      "name" : "state band ssm.33",
      "passed" : true
    },
    {
      "name" : "state band ssm.34",
      "passed" : true
    },
    {
      "name" : "state band ssm.36",
      "passed" : true
    },
    {
      "name" : "state band ssm.37",
      "passed" : true
    },
    {
      "name" : "state band ssm.38",
      "passed" : true
    },
    {
      "name" : "state band ssm.4",
      "passed" : true
    },
    {
      "name" : "state band ssm.40",
      "passed" : true
    },
    {
      "name" : "state band ssm.41",
      "passed" : true
    },
    {
      "name" : "state band ssm.42",
      "passed" : true
    },
    {
      "name" : "state band ssm.44",
      "passed" : true
    },
    {
      "name" : "state band ssm.45",
      "passed" : true
    },
    {
      "name" : "state band ssm.46",
      "passed" : true
    },
    {
      "name" : "state band ssm.5",
      "passed" : true
    },
    {
      "name" : "state band ssm.6",
      "passed" : true
    },
    {
      "name" : "state band ssm.8",
      "passed" : true
    },
    {
      "name" : "state band ssm.9",
      "passed" : true
    },
    {
      "name" : "exact tokens",
      "passed" : true
    },
    {
      "name" : "state band value.11",
      "passed" : true
    },
    {
      "name" : "state band value.15",
      "passed" : true
    },
    {
      "name" : "state band value.19",
      "passed" : true
    },
    {
      "name" : "state band value.23",
      "passed" : true
    },
    {
      "name" : "state band value.27",
      "passed" : true
    },
    {
      "name" : "state band value.3",
      "passed" : true
    },
    {
      "name" : "state band value.31",
      "passed" : true
    },
    {
      "name" : "state band value.35",
      "passed" : true
    },
    {
      "name" : "state band value.39",
      "passed" : true
    },
    {
      "name" : "state band value.43",
      "passed" : true
    },
    {
      "name" : "state band value.47",
      "passed" : true
    },
    {
      "name" : "state band value.7",
      "passed" : true
    },
    {
      "name" : "routing inside preregistered rechunk band",
      "passed" : true
    },
    {
      "name" : "one record at most per layer\/expert in a scope",
      "passed" : true
    },
    {
      "name" : "larger scope reads fewer records",
      "passed" : true
    }
  ],
  "measurements" : {
    "candidate.conv.0" : 0,
    "candidate.conv.1" : 0,
    "candidate.conv.10" : 0,
    "candidate.conv.12" : 0,
    "candidate.conv.13" : 0,
    "candidate.conv.14" : 0,
    "candidate.conv.16" : 0,
    "candidate.conv.17" : 0,
    "candidate.conv.18" : 0,
    "candidate.conv.2" : 0,
    "candidate.conv.20" : 0,
    "candidate.conv.21" : 0,
    "candidate.conv.22" : 0,
    "candidate.conv.24" : 0,
    "candidate.conv.25" : 0,
    "candidate.conv.26" : 0,
    "candidate.conv.28" : 0,
    "candidate.conv.29" : 0,
    "candidate.conv.30" : 0,
    "candidate.conv.32" : 0,
    "candidate.conv.33" : 0,
    "candidate.conv.34" : 0,
    "candidate.conv.36" : 0,
    "candidate.conv.37" : 0,
    "candidate.conv.38" : 0,
    "candidate.conv.4" : 0,
    "candidate.conv.40" : 0,
    "candidate.conv.41" : 0,
    "candidate.conv.42" : 0,
    "candidate.conv.44" : 0,
    "candidate.conv.45" : 0,
    "candidate.conv.46" : 0,
    "candidate.conv.5" : 0,
    "candidate.conv.6" : 0,
    "candidate.conv.8" : 0,
    "candidate.conv.9" : 0,
    "candidate.index.11" : 0,
    "candidate.index.15" : 0,
    "candidate.index.19" : 0,
    "candidate.index.23" : 0,
    "candidate.index.27" : 0,
    "candidate.index.3" : 0,
    "candidate.index.31" : 0,
    "candidate.index.35" : 0,
    "candidate.index.39" : 0,
    "candidate.index.43" : 0,
    "candidate.index.47" : 0,
    "candidate.index.7" : 0,
    "candidate.key.11" : 0,
    "candidate.key.15" : 0,
    "candidate.key.19" : 0,
    "candidate.key.23" : 0,
    "candidate.key.27" : 0,
    "candidate.key.3" : 0,
    "candidate.key.31" : 0,
    "candidate.key.35" : 0,
    "candidate.key.39" : 0,
    "candidate.key.43" : 0,
    "candidate.key.47" : 0,
    "candidate.key.7" : 0,
    "candidate.ple.1" : 0,
    "candidate.ssm.0" : 0,
    "candidate.ssm.1" : 0,
    "candidate.ssm.10" : 0,
    "candidate.ssm.12" : 0,
    "candidate.ssm.13" : 0,
    "candidate.ssm.14" : 0,
    "candidate.ssm.16" : 0,
    "candidate.ssm.17" : 0,
    "candidate.ssm.18" : 0,
    "candidate.ssm.2" : 0,
    "candidate.ssm.20" : 0,
    "candidate.ssm.21" : 0,
    "candidate.ssm.22" : 0,
    "candidate.ssm.24" : 0,
    "candidate.ssm.25" : 0,
    "candidate.ssm.26" : 0,
    "candidate.ssm.28" : 0,
    "candidate.ssm.29" : 0,
    "candidate.ssm.30" : 0,
    "candidate.ssm.32" : 0,
    "candidate.ssm.33" : 0,
    "candidate.ssm.34" : 0,
    "candidate.ssm.36" : 0,
    "candidate.ssm.37" : 0,
    "candidate.ssm.38" : 0,
    "candidate.ssm.4" : 0,
    "candidate.ssm.40" : 0,
    "candidate.ssm.41" : 0,
    "candidate.ssm.42" : 0,
    "candidate.ssm.44" : 0,
    "candidate.ssm.45" : 0,
    "candidate.ssm.46" : 0,
    "candidate.ssm.5" : 0,
    "candidate.ssm.6" : 0,
    "candidate.ssm.8" : 0,
    "candidate.ssm.9" : 0,
    "candidate.value.11" : 0,
    "candidate.value.15" : 0,
    "candidate.value.19" : 0,
    "candidate.value.23" : 0,
    "candidate.value.27" : 0,
    "candidate.value.3" : 0,
    "candidate.value.31" : 0,
    "candidate.value.35" : 0,
    "candidate.value.39" : 0,
    "candidate.value.43" : 0,
    "candidate.value.47" : 0,
    "candidate.value.7" : 0,
    "candidate_logit_spread_fraction" : 0,
    "candidate_read_records" : 15633,
    "candidate_route_set_disagreement" : 0,
    "control.conv.0" : 0,
    "control.conv.1" : 0.0004340277810115367,
    "control.conv.10" : 0.017676766961812973,
    "control.conv.12" : 0.020972222089767456,
    "control.conv.13" : 0.01985294185578823,
    "control.conv.14" : 0.032608695328235626,
    "control.conv.16" : 0.03440656512975693,
    "control.conv.17" : 0.035175878554582596,
    "control.conv.18" : 0.030232558026909828,
    "control.conv.2" : 0.005076142027974129,
    "control.conv.20" : 0.035353533923625946,
    "control.conv.21" : 0.029639175161719322,
    "control.conv.22" : 0.01584506966173649,
    "control.conv.24" : 0.03383978083729744,
    "control.conv.25" : 0.031983569264411926,
    "control.conv.26" : 0.036363635212183,
    "control.conv.28" : 0.03284313902258873,
    "control.conv.29" : 0.05694444477558136,
    "control.conv.30" : 0.061486486345529556,
    "control.conv.32" : 0.06546945869922638,
    "control.conv.33" : 0.06174089014530182,
    "control.conv.34" : 0.05707273259758949,
    "control.conv.36" : 0.0950520858168602,
    "control.conv.37" : 0.06590908765792847,
    "control.conv.38" : 0.060975611209869385,
    "control.conv.4" : 0.004065040498971939,
    "control.conv.40" : 0.06340579688549042,
    "control.conv.41" : 0.04905523359775543,
    "control.conv.42" : 0.04605263099074364,
    "control.conv.44" : 0.1574675291776657,
    "control.conv.45" : 0.047445256263017654,
    "control.conv.46" : 0.04658384993672371,
    "control.conv.5" : 0.005976095795631409,
    "control.conv.6" : 0.00675223208963871,
    "control.conv.8" : 0.014843749813735485,
    "control.conv.9" : 0.012430938892066479,
    "control.index.11" : 0.16640624403953552,
    "control.index.15" : 0.21966373920440674,
    "control.index.19" : 0.26776960492134094,
    "control.index.23" : 0.1116071417927742,
    "control.index.27" : 0.16856060922145844,
    "control.index.3" : 0.08801775425672531,
    "control.index.31" : 0.4142889380455017,
    "control.index.35" : 0.43437498807907104,
    "control.index.39" : 0.16911764442920685,
    "control.index.43" : 0.17342714965343475,
    "control.index.47" : 0.25676751136779785,
    "control.index.7" : 0.09853078424930573,
    "control.key.11" : 0.3268398344516754,
    "control.key.15" : 0.3401162922382355,
    "control.key.19" : 0.3653017282485962,
    "control.key.23" : 0.2630208432674408,
    "control.key.27" : 0.43056777119636536,
    "control.key.3" : 0.11525370925664902,
    "control.key.31" : 0.4076171815395355,
    "control.key.35" : 0.48138296604156494,
    "control.key.39" : 0.29219746589660645,
    "control.key.43" : 0.26594826579093933,
    "control.key.47" : 0.31718748807907104,
    "control.key.7" : 0.24118256568908691,
    "control.ple.1" : 0,
    "control.ssm.0" : 2.7536229936231393e-06,
    "control.ssm.1" : 0.0017620461294427514,
    "control.ssm.10" : 0.029146017506718636,
    "control.ssm.12" : 0.10559389740228653,
    "control.ssm.13" : 0.031064491719007492,
    "control.ssm.14" : 0.09533275663852692,
    "control.ssm.16" : 0.1072630062699318,
    "control.ssm.17" : 0.04070375859737396,
    "control.ssm.18" : 0.11488228291273117,
    "control.ssm.2" : 0.005128984805196524,
    "control.ssm.20" : 0.12379933148622513,
    "control.ssm.21" : 0.05088068172335625,
    "control.ssm.22" : 0.1772702932357788,
    "control.ssm.24" : 0.05791229009628296,
    "control.ssm.25" : 0.09187416732311249,
    "control.ssm.26" : 0.09198995679616928,
    "control.ssm.28" : 0.04290422052145004,
    "control.ssm.29" : 0.07222522050142288,
    "control.ssm.30" : 0.08476920425891876,
    "control.ssm.32" : 0.16109824180603027,
    "control.ssm.33" : 0.10812573879957199,
    "control.ssm.34" : 0.10442596673965454,
    "control.ssm.36" : 0.23692068457603455,
    "control.ssm.37" : 0.06257522106170654,
    "control.ssm.38" : 0.13446703553199768,
    "control.ssm.4" : 0.013187984004616737,
    "control.ssm.40" : 0.05742625519633293,
    "control.ssm.41" : 0.07635097950696945,
    "control.ssm.42" : 0.027239715680480003,
    "control.ssm.44" : 0.07536008208990097,
    "control.ssm.45" : 0.18704330921173096,
    "control.ssm.46" : 0.08443077653646469,
    "control.ssm.5" : 0.16551737487316132,
    "control.ssm.6" : 0.03229247033596039,
    "control.ssm.8" : 0.06890363246202469,
    "control.ssm.9" : 0.05195139721035957,
    "control.value.11" : 0.10766423493623734,
    "control.value.15" : 0.18776370584964752,
    "control.value.19" : 0.2888889014720917,
    "control.value.23" : 0.1917239874601364,
    "control.value.27" : 0.09193840622901917,
    "control.value.3" : 0.07352941483259201,
    "control.value.31" : 0.2181311845779419,
    "control.value.35" : 0.26211240887641907,
    "control.value.39" : 0.20628415048122406,
    "control.value.43" : 0.17514124512672424,
    "control.value.47" : 0.40340909361839294,
    "control.value.7" : 0.12523818016052246,
    "control_logit_spread_fraction" : 0.07195845991373062,
    "control_read_records" : 91248,
    "control_route_set_disagreement" : 0.08058929443359375,
    "probe_process_footprint_end_bytes" : 6682546064,
    "reference_read_records" : 28598,
    "workspace_token_tile" : 2048
  },
  "name" : "optimization-layer-read-scope",
  "passed" : true
}
```

## .build/optimization/scope-tile-8192-v3/stderr.txt

SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`

```text

```

## .build/optimization/scope-tile-lifecycle-v3/manifest.json

SHA-256: `6d529427edfabded5444e555c2521e11360017deb043c7c821b840e38a4c7f0d`

```json
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-tile-v3/slotstream",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
      "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
      "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
      "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/ExpertStore.swift": "e4454bf36b5477602f627026f5a0952186e4cfd136897d4bbdabefeffe4d5ca0",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "10d3e7ccc56d69537c73846a995e67cbdead71a64812b2a0880f527ba2725ad7",
      "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
      "Sources/Slotstream/Layers.swift": "64e246ac21b5a77109305798fae88b112baf4a180a07c5103ee881e7a99722ec",
      "Sources/Slotstream/MTP.swift": "887ca25d9beb7f63273e70bd6827362d861f91ef027f86627f024ebd6d9ab082",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
      "Sources/Slotstream/Model.swift": "5418511dce458c2c82b72eda5698ca27de99c55b3de7a682e96fd19d344fed46",
      "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
      "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
      "Sources/Slotstream/Optimizations.swift": "625a45f3eb709a361d1f5f0e81c259d911b1853a2e21f814d579433b53df1e63",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
      "Sources/Slotstream/PrefixCache.swift": "bb4f3a3480d321eab5eb3ad593e06071a29ae2f3b7ff19e476567a247d9ccbf3",
      "Sources/Slotstream/ProcessMemory.swift": "403a2ea9153b9d912b6a9457cd89bdeef951022d3e67ce0dbef3099f6a55078c",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/Server.swift": "f4607005c12f3b601145d7f5df83e080a7a85fab9d5cd819a92cf3f232154515",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "6a111dd5d1d11bc7be6a994656102d481dda1bbf6a6609a13e1e5c8feff74163",
      "Sources/Slotstream/VisionPrompt.swift": "7323f7bd01f386fc0871d928989b05f96b7c73b62192ea54764b40abbec2e810",
      "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
      "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
      "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "5c176aa9f00c8530a068d7bc8cbca8c2ad4732fd2819eb96961a15c265675e60",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "d8fdab153addf92c9315abaaa4cab3128d799ecd39420b4929128c5b0b53f3fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "bcf956d09cd214ad4fbda949b074a43341b9b17bcd0691169209264e43e0f28a",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "e77a0594128eca2a4fc3359c0db7cc2d6a7e9c19c21e122a83ed56248ecb4dc9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "5df4e5401cfd2a050e36be72fe057036636a4ef70e8278d31cc1c1c202cd1aaa",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
      "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "c385c3a0445af5aaf21b335fb331bba8ea5b7c573cd1954d3c2667015d5e053c",
    "binary_sha256": "a2726723d87388c00355e42115a5f60affb9993f78f30a3af40f30264a089b08",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 13.0,
  "timeout_seconds": 600,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-tile-v3/slotstream",
    "optimization-state-check",
    "--variant",
    "scope-lifecycle",
    "--json"
  ],
  "environment": {
    "SLOTSTREAM_OPT_WORKSPACE_TILE": "2048"
  },
  "classification": "correctness only; not timing evidence",
  "passed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31617679360,
    "swapins": 41653708,
    "swapouts": 69884827,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   462093.\nPages active:                                 900966.\nPages inactive:                               670662.\nPages speculative:                            228529.\nPages throttled:                                   0.\nPages wired down:                             249454.\nPages purgeable:                                6807.\n\"Translation faults\":                    13655487016.\nPages copy-on-write:                       621482887.\nPages zero filled:                       13807263060.\nPages reactivated:                        2044915416.\nPages purged:                               59959679.\nFile-backed pages:                           1460890.\nAnonymous pages:                              339267.\nPages stored in compressor:                  1751153.\nPages occupied by compressor:                 570655.\nDecompressions:                            942130859.\nCompressions:                             1233966869.\nPageins:                                  5590061204.\nPageouts:                                   10602343.\nSwapins:                                    41653708.\nSwapouts:                                   69884827.\nPages tagged:                                 168355.\nPages tagged resident:                        114203.\nPages tagged compressed:                       54152.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6912.\nPages tag-storage free:                         3235.\nPages tag-storage non-tag pageable:            88149.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9063232.\nTagged compressions:                         9110036.\nTagged decompressions:                       8361346.\n"
  },
  "exit_code": 0,
  "assertions": 593,
  "duration_seconds": 49.544587791,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 30511185920,
    "swapins": 41653796,
    "swapouts": 69884827,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   482482.\nPages active:                                 926063.\nPages inactive:                               717105.\nPages speculative:                            207086.\nPages throttled:                                   0.\nPages wired down:                             235654.\nPages purgeable:                               18084.\n\"Translation faults\":                    13656338429.\nPages copy-on-write:                       621503282.\nPages zero filled:                       13854306870.\nPages reactivated:                        2045607517.\nPages purged:                               59996629.\nFile-backed pages:                           1361689.\nAnonymous pages:                              488565.\nPages stored in compressor:                  1621109.\nPages occupied by compressor:                 514082.\nDecompressions:                            942272023.\nCompressions:                             1233989282.\nPageins:                                  5590632555.\nPageouts:                                   10602604.\nSwapins:                                    41653796.\nSwapouts:                                   69884827.\nPages tagged:                                 166871.\nPages tagged resident:                        116520.\nPages tagged compressed:                       50351.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6908.\nPages tag-storage free:                         3245.\nPages tag-storage non-tag pageable:            88143.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8290176.\nTagged compressions:                         9110198.\nTagged decompressions:                       8363932.\n"
  }
}
```

## .build/optimization/scope-tile-lifecycle-v3/stdout.txt

SHA-256: `d41d9814a6c9eaa7b34ffd9324d81879051c168532913bff601e9c5d3290b7b8`

```text
{
  "items" : [
    {
      "name" : "layer 0: cancel emits no token",
      "passed" : true
    },
    {
      "name" : "layer 0: abort counted",
      "passed" : true
    },
    {
      "name" : "layer 0: no partial commit",
      "passed" : true
    },
    {
      "name" : "layer 0: no completed passes",
      "passed" : true
    },
    {
      "name" : "layer 0: cache limit restored",
      "passed" : true
    },
    {
      "name" : "layer 0: admission restored",
      "passed" : true
    },
    {
      "name" : "layer 0: exact committed prefix",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: fields",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.0",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.1",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.10",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.12",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.13",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.14",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.16",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.17",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.18",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.2",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.20",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.21",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.22",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.24",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.25",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.26",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.28",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.29",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.30",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.32",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.33",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.34",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.36",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.37",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.38",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.4",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.40",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.41",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.42",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.44",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.45",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.46",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.5",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.6",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.8",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: conv.9",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: index.11",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: index.15",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: index.19",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: index.23",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: index.27",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: index.3",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: index.31",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: index.35",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: index.39",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: index.43",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: index.47",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: index.7",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: key.11",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: key.15",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: key.19",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: key.23",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: key.27",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: key.3",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: key.31",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: key.35",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: key.39",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: key.43",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: key.47",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: key.7",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ngram",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ple.1",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.0",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.1",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.10",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.12",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.13",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.14",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.16",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.17",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.18",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.2",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.20",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.21",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.22",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.24",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.25",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.26",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.28",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.29",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.30",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.32",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.33",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.34",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.36",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.37",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.38",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.4",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.40",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.41",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.42",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.44",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.45",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.46",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.5",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.6",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.8",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: ssm.9",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: tokens",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: value.11",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: value.15",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: value.19",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: value.23",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: value.27",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: value.3",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: value.31",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: value.35",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: value.39",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: value.43",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: value.47",
      "passed" : true
    },
    {
      "name" : "layer 0: restored state: value.7",
      "passed" : true
    },
    {
      "name" : "layer 1: cancel emits no token",
      "passed" : true
    },
    {
      "name" : "layer 1: abort counted",
      "passed" : true
    },
    {
      "name" : "layer 1: no partial commit",
      "passed" : true
    },
    {
      "name" : "layer 1: no completed passes",
      "passed" : true
    },
    {
      "name" : "layer 1: cache limit restored",
      "passed" : true
    },
    {
      "name" : "layer 1: admission restored",
      "passed" : true
    },
    {
      "name" : "layer 1: exact committed prefix",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: fields",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.0",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.1",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.10",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.12",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.13",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.14",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.16",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.17",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.18",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.2",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.20",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.21",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.22",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.24",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.25",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.26",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.28",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.29",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.30",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.32",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.33",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.34",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.36",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.37",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.38",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.4",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.40",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.41",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.42",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.44",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.45",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.46",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.5",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.6",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.8",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: conv.9",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: index.11",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: index.15",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: index.19",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: index.23",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: index.27",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: index.3",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: index.31",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: index.35",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: index.39",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: index.43",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: index.47",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: index.7",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: key.11",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: key.15",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: key.19",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: key.23",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: key.27",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: key.3",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: key.31",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: key.35",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: key.39",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: key.43",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: key.47",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: key.7",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ngram",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ple.1",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.0",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.1",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.10",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.12",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.13",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.14",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.16",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.17",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.18",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.2",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.20",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.21",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.22",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.24",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.25",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.26",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.28",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.29",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.30",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.32",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.33",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.34",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.36",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.37",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.38",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.4",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.40",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.41",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.42",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.44",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.45",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.46",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.5",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.6",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.8",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: ssm.9",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: tokens",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: value.11",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: value.15",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: value.19",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: value.23",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: value.27",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: value.3",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: value.31",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: value.35",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: value.39",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: value.43",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: value.47",
      "passed" : true
    },
    {
      "name" : "layer 1: restored state: value.7",
      "passed" : true
    },
    {
      "name" : "layer 3: cancel emits no token",
      "passed" : true
    },
    {
      "name" : "layer 3: abort counted",
      "passed" : true
    },
    {
      "name" : "layer 3: no partial commit",
      "passed" : true
    },
    {
      "name" : "layer 3: no completed passes",
      "passed" : true
    },
    {
      "name" : "layer 3: cache limit restored",
      "passed" : true
    },
    {
      "name" : "layer 3: admission restored",
      "passed" : true
    },
    {
      "name" : "layer 3: exact committed prefix",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: fields",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.0",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.1",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.10",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.12",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.13",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.14",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.16",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.17",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.18",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.2",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.20",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.21",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.22",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.24",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.25",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.26",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.28",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.29",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.30",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.32",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.33",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.34",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.36",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.37",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.38",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.4",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.40",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.41",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.42",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.44",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.45",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.46",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.5",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.6",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.8",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: conv.9",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: index.11",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: index.15",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: index.19",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: index.23",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: index.27",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: index.3",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: index.31",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: index.35",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: index.39",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: index.43",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: index.47",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: index.7",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: key.11",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: key.15",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: key.19",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: key.23",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: key.27",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: key.3",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: key.31",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: key.35",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: key.39",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: key.43",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: key.47",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: key.7",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ngram",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ple.1",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.0",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.1",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.10",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.12",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.13",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.14",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.16",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.17",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.18",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.2",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.20",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.21",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.22",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.24",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.25",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.26",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.28",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.29",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.30",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.32",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.33",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.34",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.36",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.37",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.38",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.4",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.40",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.41",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.42",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.44",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.45",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.46",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.5",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.6",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.8",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: ssm.9",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: tokens",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: value.11",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: value.15",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: value.19",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: value.23",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: value.27",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: value.3",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: value.31",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: value.35",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: value.39",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: value.43",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: value.47",
      "passed" : true
    },
    {
      "name" : "layer 3: restored state: value.7",
      "passed" : true
    },
    {
      "name" : "layer 47: cancel emits no token",
      "passed" : true
    },
    {
      "name" : "layer 47: abort counted",
      "passed" : true
    },
    {
      "name" : "layer 47: no partial commit",
      "passed" : true
    },
    {
      "name" : "layer 47: no completed passes",
      "passed" : true
    },
    {
      "name" : "layer 47: cache limit restored",
      "passed" : true
    },
    {
      "name" : "layer 47: admission restored",
      "passed" : true
    },
    {
      "name" : "layer 47: exact committed prefix",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: fields",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.0",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.1",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.10",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.12",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.13",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.14",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.16",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.17",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.18",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.2",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.20",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.21",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.22",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.24",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.25",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.26",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.28",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.29",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.30",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.32",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.33",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.34",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.36",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.37",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.38",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.4",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.40",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.41",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.42",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.44",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.45",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.46",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.5",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.6",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.8",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: conv.9",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: index.11",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: index.15",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: index.19",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: index.23",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: index.27",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: index.3",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: index.31",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: index.35",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: index.39",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: index.43",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: index.47",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: index.7",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: key.11",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: key.15",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: key.19",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: key.23",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: key.27",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: key.3",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: key.31",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: key.35",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: key.39",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: key.43",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: key.47",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: key.7",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ngram",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ple.1",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.0",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.1",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.10",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.12",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.13",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.14",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.16",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.17",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.18",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.2",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.20",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.21",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.22",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.24",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.25",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.26",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.28",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.29",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.30",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.32",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.33",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.34",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.36",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.37",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.38",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.4",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.40",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.41",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.42",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.44",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.45",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.46",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.5",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.6",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.8",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: ssm.9",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: tokens",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: value.11",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: value.15",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: value.19",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: value.23",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: value.27",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: value.3",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: value.31",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: value.35",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: value.39",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: value.43",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: value.47",
      "passed" : true
    },
    {
      "name" : "layer 47: restored state: value.7",
      "passed" : true
    },
    {
      "name" : "retry exact output",
      "passed" : true
    },
    {
      "name" : "reference compute schedule",
      "passed" : true
    },
    {
      "name" : "candidate preserves compute schedule",
      "passed" : true
    },
    {
      "name" : "candidate commits one read scope",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: fields",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.0",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.1",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.10",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.12",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.13",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.14",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.16",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.17",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.18",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.2",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.20",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.21",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.22",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.24",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.25",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.26",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.28",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.29",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.30",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.32",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.33",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.34",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.36",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.37",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.38",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.4",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.40",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.41",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.42",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.44",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.45",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.46",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.5",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.6",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.8",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: conv.9",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: index.11",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: index.15",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: index.19",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: index.23",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: index.27",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: index.3",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: index.31",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: index.35",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: index.39",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: index.43",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: index.47",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: index.7",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: key.11",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: key.15",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: key.19",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: key.23",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: key.27",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: key.3",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: key.31",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: key.35",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: key.39",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: key.43",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: key.47",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: key.7",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ngram",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ple.1",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.0",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.1",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.10",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.12",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.13",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.14",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.16",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.17",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.18",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.2",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.20",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.21",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.22",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.24",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.25",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.26",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.28",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.29",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.30",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.32",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.33",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.34",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.36",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.37",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.38",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.4",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.40",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.41",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.42",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.44",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.45",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.46",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.5",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.6",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.8",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: ssm.9",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: tokens",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: value.11",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: value.15",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: value.19",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: value.23",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: value.27",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: value.3",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: value.31",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: value.35",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: value.39",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: value.43",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: value.47",
      "passed" : true
    },
    {
      "name" : "retry exact continuation: value.7",
      "passed" : true
    },
    {
      "name" : "capacity remains charged after abort and growth",
      "passed" : true
    }
  ],
  "measurements" : {

  },
  "name" : "optimization-scope-lifecycle",
  "passed" : true
}
```

## .build/optimization/scope-tile-lifecycle-v3/stderr.txt

SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`

```text

```

## .build/optimization/scope-tile-mtp-vision-v3/manifest.json

SHA-256: `a9ab090e597189721d08e97c03f45af5d810d29d0f30304ba197a4cad9c392b9`

```json
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-tile-v3/slotstream",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
      "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
      "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
      "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/ExpertStore.swift": "e4454bf36b5477602f627026f5a0952186e4cfd136897d4bbdabefeffe4d5ca0",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "10d3e7ccc56d69537c73846a995e67cbdead71a64812b2a0880f527ba2725ad7",
      "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
      "Sources/Slotstream/Layers.swift": "64e246ac21b5a77109305798fae88b112baf4a180a07c5103ee881e7a99722ec",
      "Sources/Slotstream/MTP.swift": "887ca25d9beb7f63273e70bd6827362d861f91ef027f86627f024ebd6d9ab082",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
      "Sources/Slotstream/Model.swift": "5418511dce458c2c82b72eda5698ca27de99c55b3de7a682e96fd19d344fed46",
      "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
      "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
      "Sources/Slotstream/Optimizations.swift": "625a45f3eb709a361d1f5f0e81c259d911b1853a2e21f814d579433b53df1e63",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
      "Sources/Slotstream/PrefixCache.swift": "bb4f3a3480d321eab5eb3ad593e06071a29ae2f3b7ff19e476567a247d9ccbf3",
      "Sources/Slotstream/ProcessMemory.swift": "403a2ea9153b9d912b6a9457cd89bdeef951022d3e67ce0dbef3099f6a55078c",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/Server.swift": "f4607005c12f3b601145d7f5df83e080a7a85fab9d5cd819a92cf3f232154515",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "6a111dd5d1d11bc7be6a994656102d481dda1bbf6a6609a13e1e5c8feff74163",
      "Sources/Slotstream/VisionPrompt.swift": "7323f7bd01f386fc0871d928989b05f96b7c73b62192ea54764b40abbec2e810",
      "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
      "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
      "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "5c176aa9f00c8530a068d7bc8cbca8c2ad4732fd2819eb96961a15c265675e60",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "d8fdab153addf92c9315abaaa4cab3128d799ecd39420b4929128c5b0b53f3fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "bcf956d09cd214ad4fbda949b074a43341b9b17bcd0691169209264e43e0f28a",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "e77a0594128eca2a4fc3359c0db7cc2d6a7e9c19c21e122a83ed56248ecb4dc9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "5df4e5401cfd2a050e36be72fe057036636a4ef70e8278d31cc1c1c202cd1aaa",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
      "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "c385c3a0445af5aaf21b335fb331bba8ea5b7c573cd1954d3c2667015d5e053c",
    "binary_sha256": "a2726723d87388c00355e42115a5f60affb9993f78f30a3af40f30264a089b08",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 13.0,
  "timeout_seconds": 600,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-tile-v3/slotstream",
    "optimization-state-check",
    "--variant",
    "scope-mtp-vision",
    "--json"
  ],
  "environment": {
    "SLOTSTREAM_OPT_WORKSPACE_TILE": "2048"
  },
  "classification": "correctness only; not timing evidence",
  "passed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 30512644096,
    "swapins": 41653796,
    "swapouts": 69884827,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   482406.\nPages active:                                 926195.\nPages inactive:                               716678.\nPages speculative:                            207491.\nPages throttled:                                   0.\nPages wired down:                             235639.\nPages purgeable:                               18084.\n\"Translation faults\":                    13656344463.\nPages copy-on-write:                       621503667.\nPages zero filled:                       13854310395.\nPages reactivated:                        2045607517.\nPages purged:                               59996629.\nFile-backed pages:                           1361854.\nAnonymous pages:                              488510.\nPages stored in compressor:                  1620997.\nPages occupied by compressor:                 514048.\nDecompressions:                            942272058.\nCompressions:                             1233989282.\nPageins:                                  5590632628.\nPageouts:                                   10602604.\nSwapins:                                    41653796.\nSwapouts:                                   69884827.\nPages tagged:                                 166867.\nPages tagged resident:                        116516.\nPages tagged compressed:                       50351.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6908.\nPages tag-storage free:                         3150.\nPages tag-storage non-tag pageable:            88238.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8290176.\nTagged compressions:                         9110198.\nTagged decompressions:                       8363932.\n"
  },
  "exit_code": 0,
  "assertions": 240,
  "duration_seconds": 40.400040958,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 30498914304,
    "swapins": 41653804,
    "swapouts": 69884827,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   558582.\nPages active:                                 896398.\nPages inactive:                               647594.\nPages speculative:                            247881.\nPages throttled:                                   0.\nPages wired down:                             249730.\nPages purgeable:                                2766.\n\"Translation faults\":                    13657051169.\nPages copy-on-write:                       621507982.\nPages zero filled:                       13894285876.\nPages reactivated:                        2046103553.\nPages purged:                               60013854.\nFile-backed pages:                           1300158.\nAnonymous pages:                              491715.\nPages stored in compressor:                  1558463.\nPages occupied by compressor:                 482189.\nDecompressions:                            942354254.\nCompressions:                             1234030010.\nPageins:                                  5591039850.\nPageouts:                                   10602692.\nSwapins:                                    41653804.\nSwapouts:                                   69884827.\nPages tagged:                                 166539.\nPages tagged resident:                        116979.\nPages tagged compressed:                       49560.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6907.\nPages tag-storage free:                         3338.\nPages tag-storage non-tag pageable:            88051.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8100480.\nTagged compressions:                         9110773.\nTagged decompressions:                       8365273.\n"
  }
}
```

## .build/optimization/scope-tile-mtp-vision-v3/stdout.txt

SHA-256: `bdfbe7ac355563eeac17cb9def34537abeedbee5f647d6a3899073caf3242f35`

```text
{
  "items" : [
    {
      "name" : "cancel during second draft-head tile",
      "passed" : true
    },
    {
      "name" : "cancel returns no logits",
      "passed" : true
    },
    {
      "name" : "cancel restores valid draft prefix",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: fields",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.0",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.1",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.10",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.12",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.13",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.14",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.16",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.17",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.18",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.2",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.20",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.21",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.22",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.24",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.25",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.26",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.28",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.29",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.30",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.32",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.33",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.34",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.36",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.37",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.38",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.4",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.40",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.41",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.42",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.44",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.45",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.46",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.5",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.6",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.8",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: conv.9",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: index.11",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: index.15",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: index.19",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: index.23",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: index.27",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: index.3",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: index.31",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: index.35",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: index.39",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: index.43",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: index.47",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: index.7",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: key.11",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: key.15",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: key.19",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: key.23",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: key.27",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: key.3",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: key.31",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: key.35",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: key.39",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: key.43",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: key.47",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: key.7",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: lastMulti",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: mtp.index",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: mtp.key",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: mtp.offset",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: mtp.value",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ngram",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ple.1",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.0",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.1",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.10",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.12",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.13",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.14",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.16",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.17",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.18",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.2",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.20",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.21",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.22",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.24",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.25",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.26",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.28",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.29",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.30",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.32",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.33",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.34",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.36",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.37",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.38",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.4",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.40",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.41",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.42",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.44",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.45",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.46",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.5",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.6",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.8",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: ssm.9",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: tokens",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: value.11",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: value.15",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: value.19",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: value.23",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: value.27",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: value.3",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: value.31",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: value.35",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: value.39",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: value.43",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: value.47",
      "passed" : true
    },
    {
      "name" : "image\/MTP rollback: value.7",
      "passed" : true
    },
    {
      "name" : "retry commits scope",
      "passed" : true
    },
    {
      "name" : "retry draft aligned",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: fields",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.0",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.1",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.10",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.12",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.13",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.14",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.16",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.17",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.18",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.2",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.20",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.21",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.22",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.24",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.25",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.26",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.28",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.29",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.30",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.32",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.33",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.34",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.36",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.37",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.38",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.4",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.40",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.41",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.42",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.44",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.45",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.46",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.5",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.6",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.8",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: conv.9",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: index.11",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: index.15",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: index.19",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: index.23",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: index.27",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: index.3",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: index.31",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: index.35",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: index.39",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: index.43",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: index.47",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: index.7",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: key.11",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: key.15",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: key.19",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: key.23",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: key.27",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: key.3",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: key.31",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: key.35",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: key.39",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: key.43",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: key.47",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: key.7",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: lastMulti",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: mtp.index",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: mtp.key",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: mtp.offset",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: mtp.value",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ngram",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ple.1",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.0",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.1",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.10",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.12",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.13",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.14",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.16",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.17",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.18",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.2",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.20",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.21",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.22",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.24",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.25",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.26",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.28",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.29",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.30",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.32",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.33",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.34",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.36",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.37",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.38",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.4",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.40",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.41",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.42",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.44",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.45",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.46",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.5",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.6",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.8",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: ssm.9",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: tokens",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: value.11",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: value.15",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: value.19",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: value.23",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: value.27",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: value.3",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: value.31",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: value.35",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: value.39",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: value.43",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: value.47",
      "passed" : true
    },
    {
      "name" : "image\/MTP continuation: value.7",
      "passed" : true
    },
    {
      "name" : "next target logits exact",
      "passed" : true
    }
  ],
  "measurements" : {

  },
  "name" : "optimization-scope-mtp-vision",
  "passed" : true
}
```

## .build/optimization/scope-tile-mtp-vision-v3/stderr.txt

SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`

```text

```

## .build/optimization/scope-generation-pilot-v3/manifest.json

SHA-256: `90fe742282a9cea77aec0f7c931216ee3ce5d481957ebdcb29e52f03b27c2ddc`

```json
{
  "schema_version": 1,
  "head": "6e66a367f93e636c3729179e24007aa99c97b9a6",
  "worktree_source": {
    "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
    "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
    "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
    "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
    "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
    "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
    "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
    "Sources/Slotstream/ExpertStore.swift": "e4454bf36b5477602f627026f5a0952186e4cfd136897d4bbdabefeffe4d5ca0",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "10d3e7ccc56d69537c73846a995e67cbdead71a64812b2a0880f527ba2725ad7",
    "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
    "Sources/Slotstream/Layers.swift": "898954e4c3fd41ffd0afef278d66446e3dc3bcf96dc1e3bb5b163792f4dc58c3",
    "Sources/Slotstream/MTP.swift": "887ca25d9beb7f63273e70bd6827362d861f91ef027f86627f024ebd6d9ab082",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/Model.swift": "5418511dce458c2c82b72eda5698ca27de99c55b3de7a682e96fd19d344fed46",
    "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
    "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
    "Sources/Slotstream/Optimizations.swift": "625a45f3eb709a361d1f5f0e81c259d911b1853a2e21f814d579433b53df1e63",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
    "Sources/Slotstream/PrefixCache.swift": "bb4f3a3480d321eab5eb3ad593e06071a29ae2f3b7ff19e476567a247d9ccbf3",
    "Sources/Slotstream/ProcessMemory.swift": "403a2ea9153b9d912b6a9457cd89bdeef951022d3e67ce0dbef3099f6a55078c",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/Server.swift": "f4607005c12f3b601145d7f5df83e080a7a85fab9d5cd819a92cf3f232154515",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
    "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
    "Sources/Slotstream/Vision.swift": "6a111dd5d1d11bc7be6a994656102d481dda1bbf6a6609a13e1e5c8feff74163",
    "Sources/Slotstream/VisionPrompt.swift": "7323f7bd01f386fc0871d928989b05f96b7c73b62192ea54764b40abbec2e810",
    "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
    "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
    "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
    "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
    "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "5c176aa9f00c8530a068d7bc8cbca8c2ad4732fd2819eb96961a15c265675e60",
    "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
    "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "d8fdab153addf92c9315abaaa4cab3128d799ecd39420b4929128c5b0b53f3fc",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "bcf956d09cd214ad4fbda949b074a43341b9b17bcd0691169209264e43e0f28a",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "e77a0594128eca2a4fc3359c0db7cc2d6a7e9c19c21e122a83ed56248ecb4dc9",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/OptimizationCommands.swift": "5df4e5401cfd2a050e36be72fe057036636a4ef70e8278d31cc1c1c202cd1aaa",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
    "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3"
  },
  "build_identities": {
    "reference": {
      "source": {
        "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
        "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
        "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
        "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
        "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
        "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
        "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
        "Sources/Slotstream/ExpertStore.swift": "e4454bf36b5477602f627026f5a0952186e4cfd136897d4bbdabefeffe4d5ca0",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "10d3e7ccc56d69537c73846a995e67cbdead71a64812b2a0880f527ba2725ad7",
        "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
        "Sources/Slotstream/Layers.swift": "64e246ac21b5a77109305798fae88b112baf4a180a07c5103ee881e7a99722ec",
        "Sources/Slotstream/MTP.swift": "887ca25d9beb7f63273e70bd6827362d861f91ef027f86627f024ebd6d9ab082",
        "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
        "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
        "Sources/Slotstream/Model.swift": "5418511dce458c2c82b72eda5698ca27de99c55b3de7a682e96fd19d344fed46",
        "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
        "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
        "Sources/Slotstream/Optimizations.swift": "625a45f3eb709a361d1f5f0e81c259d911b1853a2e21f814d579433b53df1e63",
        "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
        "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
        "Sources/Slotstream/PrefixCache.swift": "bb4f3a3480d321eab5eb3ad593e06071a29ae2f3b7ff19e476567a247d9ccbf3",
        "Sources/Slotstream/ProcessMemory.swift": "403a2ea9153b9d912b6a9457cd89bdeef951022d3e67ce0dbef3099f6a55078c",
        "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
        "Sources/Slotstream/Server.swift": "f4607005c12f3b601145d7f5df83e080a7a85fab9d5cd819a92cf3f232154515",
        "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
        "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
        "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
        "Sources/Slotstream/Vision.swift": "6a111dd5d1d11bc7be6a994656102d481dda1bbf6a6609a13e1e5c8feff74163",
        "Sources/Slotstream/VisionPrompt.swift": "7323f7bd01f386fc0871d928989b05f96b7c73b62192ea54764b40abbec2e810",
        "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
        "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
        "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
        "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
        "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "5c176aa9f00c8530a068d7bc8cbca8c2ad4732fd2819eb96961a15c265675e60",
        "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "d8fdab153addf92c9315abaaa4cab3128d799ecd39420b4929128c5b0b53f3fc",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "bcf956d09cd214ad4fbda949b074a43341b9b17bcd0691169209264e43e0f28a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
        "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
        "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
        "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
        "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
        "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
        "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
        "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
        "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
        "Sources/slotstream-cli/ContextCommands.swift": "e77a0594128eca2a4fc3359c0db7cc2d6a7e9c19c21e122a83ed56248ecb4dc9",
        "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
        "Sources/slotstream-cli/OptimizationCommands.swift": "5df4e5401cfd2a050e36be72fe057036636a4ef70e8278d31cc1c1c202cd1aaa",
        "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
        "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
        "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "c385c3a0445af5aaf21b335fb331bba8ea5b7c573cd1954d3c2667015d5e053c",
      "binary_sha256": "a2726723d87388c00355e42115a5f60affb9993f78f30a3af40f30264a089b08",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    },
    "scope": {
      "source": {
        "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
        "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
        "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
        "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
        "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
        "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
        "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
        "Sources/Slotstream/ExpertStore.swift": "e4454bf36b5477602f627026f5a0952186e4cfd136897d4bbdabefeffe4d5ca0",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "10d3e7ccc56d69537c73846a995e67cbdead71a64812b2a0880f527ba2725ad7",
        "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
        "Sources/Slotstream/Layers.swift": "64e246ac21b5a77109305798fae88b112baf4a180a07c5103ee881e7a99722ec",
        "Sources/Slotstream/MTP.swift": "887ca25d9beb7f63273e70bd6827362d861f91ef027f86627f024ebd6d9ab082",
        "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
        "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
        "Sources/Slotstream/Model.swift": "5418511dce458c2c82b72eda5698ca27de99c55b3de7a682e96fd19d344fed46",
        "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
        "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
        "Sources/Slotstream/Optimizations.swift": "625a45f3eb709a361d1f5f0e81c259d911b1853a2e21f814d579433b53df1e63",
        "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
        "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
        "Sources/Slotstream/PrefixCache.swift": "bb4f3a3480d321eab5eb3ad593e06071a29ae2f3b7ff19e476567a247d9ccbf3",
        "Sources/Slotstream/ProcessMemory.swift": "403a2ea9153b9d912b6a9457cd89bdeef951022d3e67ce0dbef3099f6a55078c",
        "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
        "Sources/Slotstream/Server.swift": "f4607005c12f3b601145d7f5df83e080a7a85fab9d5cd819a92cf3f232154515",
        "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
        "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
        "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
        "Sources/Slotstream/Vision.swift": "6a111dd5d1d11bc7be6a994656102d481dda1bbf6a6609a13e1e5c8feff74163",
        "Sources/Slotstream/VisionPrompt.swift": "7323f7bd01f386fc0871d928989b05f96b7c73b62192ea54764b40abbec2e810",
        "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
        "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
        "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
        "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
        "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "5c176aa9f00c8530a068d7bc8cbca8c2ad4732fd2819eb96961a15c265675e60",
        "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "d8fdab153addf92c9315abaaa4cab3128d799ecd39420b4929128c5b0b53f3fc",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "bcf956d09cd214ad4fbda949b074a43341b9b17bcd0691169209264e43e0f28a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
        "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
        "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
        "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
        "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
        "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
        "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
        "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
        "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
        "Sources/slotstream-cli/ContextCommands.swift": "e77a0594128eca2a4fc3359c0db7cc2d6a7e9c19c21e122a83ed56248ecb4dc9",
        "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
        "Sources/slotstream-cli/OptimizationCommands.swift": "5df4e5401cfd2a050e36be72fe057036636a4ef70e8278d31cc1c1c202cd1aaa",
        "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
        "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
        "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "c385c3a0445af5aaf21b335fb331bba8ea5b7c573cd1954d3c2667015d5e053c",
      "binary_sha256": "a2726723d87388c00355e42115a5f60affb9993f78f30a3af40f30264a089b08",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "model": {
    "chat_template.jinja": {
      "bytes": 8952,
      "mtime_ns": 1788227262420608630,
      "sha256": "c3cf9e34abf4f9e36c2d72165aa9c132d3e2a725b6c2586aaa3a8af9d7a81041"
    },
    "config.json": {
      "bytes": 33408,
      "mtime_ns": 1788227262365742673,
      "sha256": "0da22a8ed4323fbe969bf982aeb054743b315206791f28ef74a309c707080ba5"
    },
    "generation_config.json": {
      "bytes": 202,
      "mtime_ns": 1788227262233341994,
      "sha256": "e70c136c1b78ddc1fb0905bac8e733a4dc448d4f852a5dd75143fffc70be550e"
    },
    "model-00001.safetensors": {
      "bytes": 10039592993,
      "mtime_ns": 1788228748798695327,
      "header_sha256": "475ce8af9dea80570da09375a5e1039090610ae77373bffcb8d95bb0be3a9ddc"
    },
    "model-00002.safetensors": {
      "bytes": 10000066971,
      "mtime_ns": 1788229557877052892,
      "header_sha256": "430d68993347bf804c7ccc0a09b4811d503377fc9af4f524b0db0884790a12bf"
    },
    "model-00003.safetensors": {
      "bytes": 10000066984,
      "mtime_ns": 1788229795251654179,
      "header_sha256": "28b4f8f5a8606a84f5dd5de3c061130a6a65e767edb86355ae35859a525426d6"
    },
    "model-00004.safetensors": {
      "bytes": 10170248438,
      "mtime_ns": 1788230029083645564,
      "header_sha256": "c9df41567d842f9fbdf9ff53a3584ffacb1b220b43e9c9b49c0be96be6f2156d"
    },
    "model-00005.safetensors": {
      "bytes": 10194989755,
      "mtime_ns": 1788230267432612830,
      "header_sha256": "c189a7de6a617e0a0f7d3e60576b363ae0d8c240e277d8726a4ab467b30e596c"
    },
    "model-00006.safetensors": {
      "bytes": 10262727991,
      "mtime_ns": 1788230565482789975,
      "header_sha256": "b51ae1ca1c4c754dae0426f85c0f3e6c1539240bce1ae77fba8102cb08ebb977"
    },
    "model-00007.safetensors": {
      "bytes": 10190937668,
      "mtime_ns": 1788230945388951904,
      "header_sha256": "b64d4e3ba45e61f2463c6357bdca894926f19db595d4e9dd189b04822a9c611d"
    },
    "model-00008.safetensors": {
      "bytes": 10231122683,
      "mtime_ns": 1788231233782376452,
      "header_sha256": "ab49328405f98104ffab180748eba510fc6f31ba2bfa263a1d23e8b59ce261c9"
    },
    "model-00009.safetensors": {
      "bytes": 10250305804,
      "mtime_ns": 1788231584813847653,
      "header_sha256": "326333ed9d0b8df41fb3ecca875d5b7eecb29f36d674f5edf8c969bb3e71e75d"
    },
    "model-00010.safetensors": {
      "bytes": 10237786674,
      "mtime_ns": 1788231912822219158,
      "header_sha256": "962f992ebc7098380e89df4e6abd0dd5921a1702dc612eebee9d70bcc3035f37"
    },
    "model-00011.safetensors": {
      "bytes": 2192353120,
      "mtime_ns": 1788231963854477586,
      "header_sha256": "db46770964a73082aeb4e714c0b6b4da30646146f3330a5b40d26cfd4f12a608"
    },
    "model.safetensors.index.json": {
      "bytes": 317973,
      "mtime_ns": 1788231961214440193,
      "sha256": "072cc2c60b8af6cce82a387f62e39ca88754c3a6fccae0816dd21bb89d27470d"
    },
    "mtp.provenance.json": {
      "bytes": 4514,
      "mtime_ns": 1788285565619137302,
      "sha256": "6e574308bd68dcf6611e84c312ba388f7eb205e0e09dff086e14f6df86262db6"
    },
    "mtp.safetensors": {
      "bytes": 1470955171,
      "mtime_ns": 1788285565030586634,
      "header_sha256": "836ae4156c99452e932c7a81322bcca959ac6f7ed86d6270cfd56ff94c62f4b9"
    },
    "preprocessor_config.json": {
      "bytes": 390,
      "mtime_ns": 1788231961438795679,
      "sha256": "27225450ac9c6529872ee1924fcb0962ff5634834f817040f444118116f4e516"
    },
    "tokenizer.json": {
      "bytes": 12809320,
      "mtime_ns": 1788231963144872066,
      "sha256": "0997f410c57a1f4e53b09e4be8f4a172d90edd9564368fb0847030937229b9f3"
    },
    "tokenizer_config.json": {
      "bytes": 17928,
      "mtime_ns": 1788231962481057833,
      "sha256": "b11349aafa7cdc6a320767cf7ceb29ed82f7eda5d65e8e0819e76f0ce947bf27"
    },
    "video_preprocessor_config.json": {
      "bytes": 385,
      "mtime_ns": 1788231962565955466,
      "sha256": "7768af27c1fafa9cc9011c1dc20067e03f8915e03b63504550e11d5066986d13"
    },
    "vocab.json": {
      "bytes": 6722759,
      "mtime_ns": 1788231962924355528,
      "sha256": "ce99b4cb2983d118806ce0a8b777a35b093e2000a503ebde25853284c9dfa003"
    }
  },
  "arms": {
    "reference": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-tile-v3/slotstream",
      "sha256": "a2726723d87388c00355e42115a5f60affb9993f78f30a3af40f30264a089b08",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_INDEXER_TILES": "1",
        "SLOTSTREAM_OPT_PLE_TILES": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1"
      }
    },
    "scope": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-tile-v3/slotstream",
      "sha256": "a2726723d87388c00355e42115a5f60affb9993f78f30a3af40f30264a089b08",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_INDEXER_TILES": "1",
        "SLOTSTREAM_OPT_PLE_TILES": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "1",
        "SLOTSTREAM_OPT_READ_SCOPE": "8192",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "2048"
      }
    }
  },
  "fixtures": {
    "acceptance": {
      "path": "/Users/carlos/Projects/slotstream/.build/optimization/scope-generation-pilot-v3/fixtures/acceptance.txt",
      "sha256": "32e15bd0df7b057f31b74f94a24c179d4374c19ddc54b77d590e330710fc8f78"
    }
  },
  "conditions": {
    "filesystem_cache": "uncontrolled; no purge",
    "expert_cache": "empty per process",
    "prefix_cache": "empty per process",
    "mtp": false
  },
  "arguments": {
    "arm": [
      "reference=/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-tile-v3/slotstream",
      "scope=/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-tile-v3/slotstream"
    ],
    "arm_env": [
      "reference={\"SLOTSTREAM_OPT_COMPACT_STATE\": \"1\", \"SLOTSTREAM_OPT_COMPACT_MTP\": \"1\", \"SLOTSTREAM_OPT_INDEXER_TILES\": \"1\", \"SLOTSTREAM_OPT_PLE_TILES\": \"1\", \"SLOTSTREAM_OPT_FINAL_FORWARD\": \"1\"}",
      "scope={\"SLOTSTREAM_OPT_COMPACT_STATE\": \"1\", \"SLOTSTREAM_OPT_COMPACT_MTP\": \"1\", \"SLOTSTREAM_OPT_INDEXER_TILES\": \"1\", \"SLOTSTREAM_OPT_PLE_TILES\": \"1\", \"SLOTSTREAM_OPT_FINAL_FORWARD\": \"1\", \"SLOTSTREAM_OPT_LAYER_WORKSPACE\": \"1\", \"SLOTSTREAM_OPT_READ_SCOPE\": \"8192\", \"SLOTSTREAM_OPT_WORKSPACE_TILE\": \"2048\"}"
    ],
    "label": "baseline",
    "mtp": "off",
    "rounds": 3,
    "chunks": "4096",
    "prompts": "acceptance",
    "memory_gb": 8.1,
    "max_tokens": 1,
    "seed": 7,
    "sampled": false,
    "sample_footprint": true,
    "observe_arm": [],
    "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "out": "/Users/carlos/Projects/slotstream/.build/optimization/scope-generation-pilot-v3",
    "timeout": 600,
    "prepare_only": false
  }
}
```

## .build/optimization/scope-generation-pilot-v3/results.jsonl

SHA-256: `ea3d6616cfaef7ebc2f31806f26bed7d429c7d72ca33aea0bb106209a3b2a3f0`

```json
{"round": 1, "prompt": "acceptance", "chunk": 4096, "arm": "reference", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-tile-v3/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/.build/optimization/scope-generation-pilot-v3/fixtures/acceptance.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/scope-generation-pilot-v3/1-acceptance-4096-reference/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_COMPACT_MTP": "1", "SLOTSTREAM_OPT_INDEXER_TILES": "1", "SLOTSTREAM_OPT_PLE_TILES": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_PREFILL_CHUNK": "4096"}, "override_extra_allowance_gb": 4.992, "before": {"page_bytes": 16384, "reclaimable_bytes": 29614047232, "swapins": 41653808, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   496931.\nPages active:                                 926613.\nPages inactive:                               674859.\nPages speculative:                            259545.\nPages throttled:                                   0.\nPages wired down:                             258150.\nPages purgeable:                                6221.\n\"Translation faults\":                    13657385401.\nPages copy-on-write:                       621530451.\nPages zero filled:                       13894451363.\nPages reactivated:                        2046103826.\nPages purged:                               60013982.\nFile-backed pages:                           1304346.\nAnonymous pages:                              556671.\nPages stored in compressor:                  1526555.\nPages occupied by compressor:                 468184.\nDecompressions:                            942382422.\nCompressions:                             1234030010.\nPageins:                                  5591042308.\nPageouts:                                   10602692.\nSwapins:                                    41653808.\nSwapouts:                                   69884827.\nPages tagged:                                 166784.\nPages tagged resident:                        117944.\nPages tagged compressed:                       48840.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6907.\nPages tag-storage free:                         1571.\nPages tag-storage non-tag pageable:            89818.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7948864.\nTagged compressions:                         9110773.\nTagged decompressions:                       8365983.\n"}, "exit_code": 0, "wall_seconds": 27.02710525, "after": {"page_bytes": 16384, "reclaimable_bytes": 30860066816, "swapins": 41653808, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   408315.\nPages active:                                 936553.\nPages inactive:                               750221.\nPages speculative:                            184360.\nPages throttled:                                   0.\nPages wired down:                             262622.\nPages purgeable:                                4660.\n\"Translation faults\":                    13658014599.\nPages copy-on-write:                       621538741.\nPages zero filled:                       13917170121.\nPages reactivated:                        2049239447.\nPages purged:                               60027277.\nFile-backed pages:                           1470574.\nAnonymous pages:                              400560.\nPages stored in compressor:                  1690817.\nPages occupied by compressor:                 543233.\nDecompressions:                            942701453.\nCompressions:                             1234519879.\nPageins:                                  5593841275.\nPageouts:                                   10602947.\nSwapins:                                    41653808.\nSwapouts:                                   69884827.\nPages tagged:                                 166420.\nPages tagged resident:                        112987.\nPages tagged compressed:                       53433.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6907.\nPages tag-storage free:                          333.\nPages tag-storage non-tag pageable:            91056.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8955712.\nTagged compressions:                         9116111.\nTagged decompressions:                       8366710.\n"}, "metrics": {"effective_expected_peak_gb": 12.913999103999998, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 4096, "effective_prefill_cost_gb": 5.3248, "encode_seconds": 0.02839625, "experimental_memory_family": false, "extra_expert_workspace_gb": 0, "extra_read_scope_allowance_gb": 0, "launch_seconds": 26.866259334, "load_seconds": 0.821526, "optimizations": {"boundedDraftTail": false, "boundedIndexer": true, "boundedPLE": true, "boundedSweepRows": false, "compactMTPRow": true, "compactNgramRows": false, "compactStateWindows": true, "demandedPrefillOutput": false, "disjointSweepOutput": false, "fusedGDNRecording": false, "incrementalIndexer": false, "layerExpertWorkspace": false, "readScopeTokens": 0, "reuseFirstMTPEntry": false, "sharedRoPE": false, "skipUnusedFinalForward": true, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false, "workspaceTokenTile": 256}, "output_ids": [], "plan": {"availability_clamped": false, "device_available_gb": 33.8, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [760, 17593, 7189, 421, 279, 33439, 10286, 369, 4890, 6571, 36, 923, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 4558, 14162, 25, 1092, 369, 279, 33439, 10286, 30, 21134, 440, 799, 3299, 13, 198], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"abortedReadScopes": 0, "acceptedDrafts": 0, "allocatedSequenceBytes": 226492416, "decodeForwardPasses": 0, "decodeIOSeconds": 0, "decodeModelTokens": 0, "decodeReadBytes": 0, "decodeRecords": 0, "decodeScatterSeconds": 0, "decodeSeconds": 0.000819541, "decodeTokens": 0, "draftedTokens": 0, "draftSeconds": 0, "expertHitRate": 0, "finishReason": "stop", "imageEncodeSeconds": 4.2e-08, "interTokenSeconds": [], "lifetimeRSSPeakBytes": 3489382400, "mlxActiveEndBytes": 5046896792, "mlxCacheEndBytes": 605258008, "mlxPeakMemoryGB": 6.653660832, "ngramCachedRows": 976, "ngramCachePayloadBytes": 624640, "ngramRowHits": 0, "ngramRowMisses": 0, "peakMemoryGB": 6.359797576, "physicalFootprintEndBytes": 6359797576, "prefillComputePasses": [4096, 2048, 1817], "prefillGPUWaitSeconds": 1.0033307419999997, "prefillIOSeconds": 9.567529320716858, "prefillMLXActiveBytes": 5046896792, "prefillMLXCacheBytes": 604258584, "prefillPasses": [4096, 2048, 1817], "prefillPhysicalFootprintBytes": 6368104264, "prefillReadBytes": 124465766400, "prefillRecords": 45018, "prefillRowSortSeconds": 0.020393848419189453, "prefillScatterSeconds": 0.22592735290527344, "prefillSeconds": 26.014835333, "prefillTokens": 7961, "promptTokens": 7961, "queueSeconds": 3.33e-07, "reconciledHeadTokens": 0, "reconciliationSeconds": 0, "requestSeconds": 26.015978375, "reusedHeadTokens": 0, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 7525945088, "samples": 1302}, "sampleSeconds": 0.000817291, "tokenCallbackSeconds": 0, "verifyPasses": 0, "verifySeconds": 0}, "text": ""}}
{"round": 1, "prompt": "acceptance", "chunk": 4096, "arm": "scope", "valid": false, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-tile-v3/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/.build/optimization/scope-generation-pilot-v3/fixtures/acceptance.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/scope-generation-pilot-v3/1-acceptance-4096-scope/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_COMPACT_MTP": "1", "SLOTSTREAM_OPT_INDEXER_TILES": "1", "SLOTSTREAM_OPT_PLE_TILES": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_OPT_LAYER_WORKSPACE": "1", "SLOTSTREAM_OPT_READ_SCOPE": "8192", "SLOTSTREAM_OPT_WORKSPACE_TILE": "2048", "SLOTSTREAM_PREFILL_CHUNK": "4096"}, "override_extra_allowance_gb": 12.4368, "before": {"page_bytes": 16384, "reclaimable_bytes": 30844633088, "swapins": 41653808, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   407353.\nPages active:                                 937117.\nPages inactive:                               750396.\nPages speculative:                            184817.\nPages throttled:                                   0.\nPages wired down:                             262622.\nPages purgeable:                                4660.\n\"Translation faults\":                    13658016819.\nPages copy-on-write:                       621538884.\nPages zero filled:                       13917170279.\nPages reactivated:                        2049239447.\nPages purged:                               60027277.\nFile-backed pages:                           1470594.\nAnonymous pages:                              401736.\nPages stored in compressor:                  1689731.\nPages occupied by compressor:                 542836.\nDecompressions:                            942702545.\nCompressions:                             1234519879.\nPageins:                                  5593841276.\nPageouts:                                   10602947.\nSwapins:                                    41653808.\nSwapouts:                                   69884827.\nPages tagged:                                 166420.\nPages tagged resident:                        112987.\nPages tagged compressed:                       53433.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6907.\nPages tag-storage free:                          348.\nPages tag-storage non-tag pageable:            91041.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8955712.\nTagged compressions:                         9116111.\nTagged decompressions:                       8366710.\n"}, "exit_code": 0, "wall_seconds": 27.184709249999997, "after": {"page_bytes": 16384, "reclaimable_bytes": 31202361344, "swapins": 41653812, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   536150.\nPages active:                                 866325.\nPages inactive:                               700987.\nPages speculative:                            163840.\nPages throttled:                                   0.\nPages wired down:                             245525.\nPages purgeable:                               16205.\n\"Translation faults\":                    13658600071.\nPages copy-on-write:                       621541632.\nPages zero filled:                       13943174390.\nPages reactivated:                        2051169934.\nPages purged:                               60027974.\nFile-backed pages:                           1352086.\nAnonymous pages:                              379066.\nPages stored in compressor:                  1745346.\nPages occupied by compressor:                 571116.\nDecompressions:                            942788948.\nCompressions:                             1234665731.\nPageins:                                  5595719953.\nPageouts:                                   10603189.\nSwapins:                                    41653812.\nSwapouts:                                   69884827.\nPages tagged:                                 166557.\nPages tagged resident:                        114481.\nPages tagged compressed:                       52076.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6907.\nPages tag-storage free:                         1545.\nPages tag-storage non-tag pageable:            89844.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8800384.\nTagged compressions:                         9118248.\nTagged decompressions:                       8370194.\n"}, "metrics": {"effective_expected_peak_gb": 19.767622912, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 4096, "effective_prefill_cost_gb": 5.3248, "encode_seconds": 0.032301, "experimental_memory_family": true, "extra_expert_workspace_gb": 1.4155776, "extra_read_scope_allowance_gb": 5.438046207999999, "launch_seconds": 27.03281975, "load_seconds": 0.968040459, "optimizations": {"boundedDraftTail": false, "boundedIndexer": true, "boundedPLE": true, "boundedSweepRows": false, "compactMTPRow": true, "compactNgramRows": false, "compactStateWindows": true, "demandedPrefillOutput": false, "disjointSweepOutput": false, "fusedGDNRecording": false, "incrementalIndexer": false, "layerExpertWorkspace": true, "readScopeTokens": 8192, "reuseFirstMTPEntry": false, "sharedRoPE": false, "skipUnusedFinalForward": true, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false, "workspaceTokenTile": 2048}, "output_ids": [], "plan": {"availability_clamped": false, "device_available_gb": 33.8, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [760, 17593, 7189, 421, 279, 33439, 10286, 369, 4890, 6571, 36, 923, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 4558, 14162, 25, 1092, 369, 279, 33439, 10286, 30, 21134, 440, 799, 3299, 13, 198], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"abortedReadScopes": 0, "acceptedDrafts": 0, "allocatedSequenceBytes": 226492416, "decodeForwardPasses": 0, "decodeIOSeconds": 0, "decodeModelTokens": 0, "decodeReadBytes": 0, "decodeRecords": 0, "decodeScatterSeconds": 0, "decodeSeconds": 0.001183083, "decodeTokens": 0, "draftedTokens": 0, "draftSeconds": 0, "expertHitRate": 0, "finishReason": "stop", "imageEncodeSeconds": 4.2e-08, "interTokenSeconds": [], "lifetimeRSSPeakBytes": 3320922112, "mlxActiveEndBytes": 5046847640, "mlxCacheEndBytes": 698679300, "mlxPeakMemoryGB": 7.809188196, "ngramCachedRows": 976, "ngramCachePayloadBytes": 624640, "ngramRowHits": 0, "ngramRowMisses": 0, "peakMemoryGB": 6.214160032, "physicalFootprintEndBytes": 6214160032, "prefillComputePasses": [4096, 2048, 1817], "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 4.230974793434143, "prefillMLXActiveBytes": 5046847640, "prefillMLXCacheBytes": 697679872, "prefillPasses": [7961], "prefillPhysicalFootprintBytes": 6243438240, "prefillReadBytes": 51848294400, "prefillRecords": 18753, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 1.401676347187438, "prefillSeconds": 26.030003208, "prefillTokens": 7961, "promptTokens": 7961, "queueSeconds": 5.83e-07, "reconciledHeadTokens": 0, "reconciliationSeconds": 0, "requestSeconds": 26.031769333, "reusedHeadTokens": 0, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 8645414584, "samples": 1303}, "sampleSeconds": 0.001180417, "tokenCallbackSeconds": 0, "verifyPasses": 0, "verifySeconds": 0}, "text": ""}, "exclusion": "swap activity during cell; timing excluded"}
{"round": 2, "prompt": "acceptance", "chunk": 4096, "arm": "scope", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-tile-v3/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/.build/optimization/scope-generation-pilot-v3/fixtures/acceptance.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/scope-generation-pilot-v3/2-acceptance-4096-scope/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_COMPACT_MTP": "1", "SLOTSTREAM_OPT_INDEXER_TILES": "1", "SLOTSTREAM_OPT_PLE_TILES": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_OPT_LAYER_WORKSPACE": "1", "SLOTSTREAM_OPT_READ_SCOPE": "8192", "SLOTSTREAM_OPT_WORKSPACE_TILE": "2048", "SLOTSTREAM_PREFILL_CHUNK": "4096"}, "override_extra_allowance_gb": 12.4368, "before": {"page_bytes": 16384, "reclaimable_bytes": 31202066432, "swapins": 41653812, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   536121.\nPages active:                                 866423.\nPages inactive:                               700987.\nPages speculative:                            163848.\nPages throttled:                                   0.\nPages wired down:                             245525.\nPages purgeable:                               16205.\n\"Translation faults\":                    13658601000.\nPages copy-on-write:                       621541773.\nPages zero filled:                       13943174587.\nPages reactivated:                        2051169934.\nPages purged:                               60027974.\nFile-backed pages:                           1352097.\nAnonymous pages:                              379161.\nPages stored in compressor:                  1745262.\nPages occupied by compressor:                 571095.\nDecompressions:                            942789037.\nCompressions:                             1234665731.\nPageins:                                  5595719954.\nPageouts:                                   10603189.\nSwapins:                                    41653812.\nSwapouts:                                   69884827.\nPages tagged:                                 166557.\nPages tagged resident:                        114481.\nPages tagged compressed:                       52076.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6907.\nPages tag-storage free:                         1297.\nPages tag-storage non-tag pageable:            90092.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8800384.\nTagged compressions:                         9118248.\nTagged decompressions:                       8370194.\n"}, "exit_code": 0, "wall_seconds": 26.560966541999996, "after": {"page_bytes": 16384, "reclaimable_bytes": 32254345216, "swapins": 41653812, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   539345.\nPages active:                                 876856.\nPages inactive:                               695069.\nPages speculative:                            179281.\nPages throttled:                                   0.\nPages wired down:                             209510.\nPages purgeable:                               26739.\n\"Translation faults\":                    13659062115.\nPages copy-on-write:                       621544706.\nPages zero filled:                       13969117225.\nPages reactivated:                        2053211726.\nPages purged:                               60028453.\nFile-backed pages:                           1402565.\nAnonymous pages:                              348641.\nPages stored in compressor:                  1754248.\nPages occupied by compressor:                 584113.\nDecompressions:                            942868801.\nCompressions:                             1234784341.\nPageins:                                  5597750445.\nPageouts:                                   10603313.\nSwapins:                                    41653812.\nSwapouts:                                   69884827.\nPages tagged:                                 166382.\nPages tagged resident:                        113238.\nPages tagged compressed:                       53144.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6907.\nPages tag-storage free:                         1657.\nPages tag-storage non-tag pageable:            89732.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8865024.\nTagged compressions:                         9121344.\nTagged decompressions:                       8372212.\n"}, "metrics": {"effective_expected_peak_gb": 19.767622912, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 4096, "effective_prefill_cost_gb": 5.3248, "encode_seconds": 0.031666209, "experimental_memory_family": true, "extra_expert_workspace_gb": 1.4155776, "extra_read_scope_allowance_gb": 5.438046207999999, "launch_seconds": 26.441335625, "load_seconds": 0.945861875, "optimizations": {"boundedDraftTail": false, "boundedIndexer": true, "boundedPLE": true, "boundedSweepRows": false, "compactMTPRow": true, "compactNgramRows": false, "compactStateWindows": true, "demandedPrefillOutput": false, "disjointSweepOutput": false, "fusedGDNRecording": false, "incrementalIndexer": false, "layerExpertWorkspace": true, "readScopeTokens": 8192, "reuseFirstMTPEntry": false, "sharedRoPE": false, "skipUnusedFinalForward": true, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false, "workspaceTokenTile": 2048}, "output_ids": [], "plan": {"availability_clamped": false, "device_available_gb": 33.9, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [760, 17593, 7189, 421, 279, 33439, 10286, 369, 4890, 6571, 36, 923, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 4558, 14162, 25, 1092, 369, 279, 33439, 10286, 30, 21134, 440, 799, 3299, 13, 198], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"abortedReadScopes": 0, "acceptedDrafts": 0, "allocatedSequenceBytes": 226492416, "decodeForwardPasses": 0, "decodeIOSeconds": 0, "decodeModelTokens": 0, "decodeReadBytes": 0, "decodeRecords": 0, "decodeScatterSeconds": 0, "decodeSeconds": 0.000975541, "decodeTokens": 0, "draftedTokens": 0, "draftSeconds": 0, "expertHitRate": 0, "finishReason": "stop", "imageEncodeSeconds": 8.3e-08, "interTokenSeconds": [], "lifetimeRSSPeakBytes": 3318513664, "mlxActiveEndBytes": 5046847640, "mlxCacheEndBytes": 574029828, "mlxPeakMemoryGB": 7.809188196, "ngramCachedRows": 976, "ngramCachePayloadBytes": 624640, "ngramRowHits": 0, "ngramRowMisses": 0, "peakMemoryGB": 6.049107688, "physicalFootprintEndBytes": 6049107688, "prefillComputePasses": [4096, 2048, 1817], "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 4.367220997810364, "prefillMLXActiveBytes": 5046847640, "prefillMLXCacheBytes": 573030400, "prefillPasses": [7961], "prefillPhysicalFootprintBytes": 6119149288, "prefillReadBytes": 51848294400, "prefillRecords": 18753, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 1.2688092419297485, "prefillSeconds": 25.462156125, "prefillTokens": 7961, "promptTokens": 7961, "queueSeconds": 1.66e-07, "reconciledHeadTokens": 0, "reconciliationSeconds": 0, "requestSeconds": 25.463457291, "reusedHeadTokens": 0, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 8617365224, "samples": 1274}, "sampleSeconds": 0.000970792, "tokenCallbackSeconds": 0, "verifyPasses": 0, "verifySeconds": 0}, "text": ""}}
{"round": 2, "prompt": "acceptance", "chunk": 4096, "arm": "reference", "valid": false, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-tile-v3/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/.build/optimization/scope-generation-pilot-v3/fixtures/acceptance.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/scope-generation-pilot-v3/2-acceptance-4096-reference/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_COMPACT_MTP": "1", "SLOTSTREAM_OPT_INDEXER_TILES": "1", "SLOTSTREAM_OPT_PLE_TILES": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_PREFILL_CHUNK": "4096"}, "override_extra_allowance_gb": 4.992, "before": {"page_bytes": 16384, "reclaimable_bytes": 32251936768, "swapins": 41653812, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   539186.\nPages active:                                 876763.\nPages inactive:                               695206.\nPages speculative:                            179290.\nPages throttled:                                   0.\nPages wired down:                             209510.\nPages purgeable:                               26739.\n\"Translation faults\":                    13659062828.\nPages copy-on-write:                       621544850.\nPages zero filled:                       13969117332.\nPages reactivated:                        2053211726.\nPages purged:                               60028453.\nFile-backed pages:                           1402577.\nAnonymous pages:                              348682.\nPages stored in compressor:                  1754228.\nPages occupied by compressor:                 584104.\nDecompressions:                            942868826.\nCompressions:                             1234784341.\nPageins:                                  5597750446.\nPageouts:                                   10603313.\nSwapins:                                    41653812.\nSwapouts:                                   69884827.\nPages tagged:                                 166382.\nPages tagged resident:                        113238.\nPages tagged compressed:                       53144.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6907.\nPages tag-storage free:                         1487.\nPages tag-storage non-tag pageable:            89902.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8865024.\nTagged compressions:                         9121344.\nTagged decompressions:                       8372212.\n"}, "exit_code": 0, "wall_seconds": 26.76911833300001, "after": {"page_bytes": 16384, "reclaimable_bytes": 31967625216, "swapins": 41653816, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   418503.\nPages active:                                 900390.\nPages inactive:                               652982.\nPages speculative:                            244957.\nPages throttled:                                   0.\nPages wired down:                             256745.\nPages purgeable:                                8865.\n\"Translation faults\":                    13659512340.\nPages copy-on-write:                       621552931.\nPages zero filled:                       13991594660.\nPages reactivated:                        2056266893.\nPages purged:                               60047723.\nFile-backed pages:                           1523781.\nAnonymous pages:                              274548.\nPages stored in compressor:                  1796883.\nPages occupied by compressor:                 610746.\nDecompressions:                            942928852.\nCompressions:                             1234889475.\nPageins:                                  5600710682.\nPageouts:                                   10603495.\nSwapins:                                    41653816.\nSwapouts:                                   69884827.\nPages tagged:                                 166754.\nPages tagged resident:                        115332.\nPages tagged compressed:                       51422.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6907.\nPages tag-storage free:                         1507.\nPages tag-storage non-tag pageable:            89882.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8495040.\nTagged compressions:                         9122445.\nTagged decompressions:                       8375022.\n"}, "metrics": {"effective_expected_peak_gb": 12.913999103999998, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 4096, "effective_prefill_cost_gb": 5.3248, "encode_seconds": 0.030118709, "experimental_memory_family": false, "extra_expert_workspace_gb": 0, "extra_read_scope_allowance_gb": 0, "launch_seconds": 26.648466125, "load_seconds": 0.840884417, "optimizations": {"boundedDraftTail": false, "boundedIndexer": true, "boundedPLE": true, "boundedSweepRows": false, "compactMTPRow": true, "compactNgramRows": false, "compactStateWindows": true, "demandedPrefillOutput": false, "disjointSweepOutput": false, "fusedGDNRecording": false, "incrementalIndexer": false, "layerExpertWorkspace": false, "readScopeTokens": 0, "reuseFirstMTPEntry": false, "sharedRoPE": false, "skipUnusedFinalForward": true, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false, "workspaceTokenTile": 256}, "output_ids": [], "plan": {"availability_clamped": false, "device_available_gb": 35.2, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [760, 17593, 7189, 421, 279, 33439, 10286, 369, 4890, 6571, 36, 923, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 4558, 14162, 25, 1092, 369, 279, 33439, 10286, 30, 21134, 440, 799, 3299, 13, 198], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"abortedReadScopes": 0, "acceptedDrafts": 0, "allocatedSequenceBytes": 226492416, "decodeForwardPasses": 0, "decodeIOSeconds": 0, "decodeModelTokens": 0, "decodeReadBytes": 0, "decodeRecords": 0, "decodeScatterSeconds": 0, "decodeSeconds": 0.000835375, "decodeTokens": 0, "draftedTokens": 0, "draftSeconds": 0, "expertHitRate": 0, "finishReason": "stop", "imageEncodeSeconds": 4.2e-08, "interTokenSeconds": [], "lifetimeRSSPeakBytes": 3522199552, "mlxActiveEndBytes": 5047896220, "mlxCacheEndBytes": 609261844, "mlxPeakMemoryGB": 6.653675424, "ngramCachedRows": 976, "ngramCachePayloadBytes": 624640, "ngramRowHits": 0, "ngramRowMisses": 0, "peakMemoryGB": 6.351146824, "physicalFootprintEndBytes": 6351146824, "prefillComputePasses": [4096, 2048, 1817], "prefillGPUWaitSeconds": 1.002610348000001, "prefillIOSeconds": 10.061332941055298, "prefillMLXActiveBytes": 5046896792, "prefillMLXCacheBytes": 609261848, "prefillPasses": [4096, 2048, 1817], "prefillPhysicalFootprintBytes": 6359453512, "prefillReadBytes": 124465766400, "prefillRecords": 45018, "prefillRowSortSeconds": 0.023935437202453613, "prefillScatterSeconds": 0.18114793300628662, "prefillSeconds": 25.775916834, "prefillTokens": 7961, "promptTokens": 7961, "queueSeconds": 3.75e-07, "reconciledHeadTokens": 0, "reconciliationSeconds": 0, "requestSeconds": 25.77707425, "reusedHeadTokens": 0, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 7508070120, "samples": 1290}, "sampleSeconds": 0.0008335, "tokenCallbackSeconds": 0, "verifyPasses": 0, "verifySeconds": 0}, "text": ""}, "exclusion": "swap activity during cell; timing excluded"}
{"round": 3, "prompt": "acceptance", "chunk": 4096, "arm": "reference", "valid": false, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-tile-v3/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/.build/optimization/scope-generation-pilot-v3/fixtures/acceptance.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/scope-generation-pilot-v3/3-acceptance-4096-reference/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_COMPACT_MTP": "1", "SLOTSTREAM_OPT_INDEXER_TILES": "1", "SLOTSTREAM_OPT_PLE_TILES": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_PREFILL_CHUNK": "4096"}, "override_extra_allowance_gb": 4.992, "before": {"page_bytes": 16384, "reclaimable_bytes": 31967707136, "swapins": 41653816, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   418497.\nPages active:                                 900209.\nPages inactive:                               653196.\nPages speculative:                            244965.\nPages throttled:                                   0.\nPages wired down:                             256750.\nPages purgeable:                                8865.\n\"Translation faults\":                    13659513045.\nPages copy-on-write:                       621553074.\nPages zero filled:                       13991594768.\nPages reactivated:                        2056266893.\nPages purged:                               60047723.\nFile-backed pages:                           1523792.\nAnonymous pages:                              274578.\nPages stored in compressor:                  1796871.\nPages occupied by compressor:                 610741.\nDecompressions:                            942928869.\nCompressions:                             1234889475.\nPageins:                                  5600710683.\nPageouts:                                   10603495.\nSwapins:                                    41653816.\nSwapouts:                                   69884827.\nPages tagged:                                 166754.\nPages tagged resident:                        115332.\nPages tagged compressed:                       51422.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6907.\nPages tag-storage free:                         1431.\nPages tag-storage non-tag pageable:            89958.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8495040.\nTagged compressions:                         9122445.\nTagged decompressions:                       8375022.\n"}, "exit_code": 0, "wall_seconds": 28.385458166000006, "after": {"page_bytes": 16384, "reclaimable_bytes": 31051284480, "swapins": 41653820, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   417915.\nPages active:                                 925023.\nPages inactive:                               690402.\nPages speculative:                            236833.\nPages throttled:                                   0.\nPages wired down:                             248829.\nPages purgeable:                                5106.\n\"Translation faults\":                    13660152916.\nPages copy-on-write:                       621557552.\nPages zero filled:                       14013824663.\nPages reactivated:                        2059203643.\nPages purged:                               60073687.\nFile-backed pages:                           1472199.\nAnonymous pages:                              380059.\nPages stored in compressor:                  1712131.\nPages occupied by compressor:                 564439.\nDecompressions:                            943043198.\nCompressions:                             1234921612.\nPageins:                                  5603563449.\nPageouts:                                   10603688.\nSwapins:                                    41653820.\nSwapouts:                                   69884827.\nPages tagged:                                 166678.\nPages tagged resident:                        114872.\nPages tagged compressed:                       51806.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6907.\nPages tag-storage free:                         1996.\nPages tag-storage non-tag pageable:            89393.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8571008.\nTagged compressions:                         9123251.\nTagged decompressions:                       8375420.\n"}, "metrics": {"effective_expected_peak_gb": 12.913999103999998, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 4096, "effective_prefill_cost_gb": 5.3248, "encode_seconds": 0.034483875, "experimental_memory_family": false, "extra_expert_workspace_gb": 0, "extra_read_scope_allowance_gb": 0, "launch_seconds": 28.180874875, "load_seconds": 1.088408125, "optimizations": {"boundedDraftTail": false, "boundedIndexer": true, "boundedPLE": true, "boundedSweepRows": false, "compactMTPRow": true, "compactNgramRows": false, "compactStateWindows": true, "demandedPrefillOutput": false, "disjointSweepOutput": false, "fusedGDNRecording": false, "incrementalIndexer": false, "layerExpertWorkspace": false, "readScopeTokens": 0, "reuseFirstMTPEntry": false, "sharedRoPE": false, "skipUnusedFinalForward": true, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false, "workspaceTokenTile": 256}, "output_ids": [], "plan": {"availability_clamped": false, "device_available_gb": 36.1, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [760, 17593, 7189, 421, 279, 33439, 10286, 369, 4890, 6571, 36, 923, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 4558, 14162, 25, 1092, 369, 279, 33439, 10286, 30, 21134, 440, 799, 3299, 13, 198], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"abortedReadScopes": 0, "acceptedDrafts": 0, "allocatedSequenceBytes": 226492416, "decodeForwardPasses": 0, "decodeIOSeconds": 0, "decodeModelTokens": 0, "decodeReadBytes": 0, "decodeRecords": 0, "decodeScatterSeconds": 0, "decodeSeconds": 0.001266208, "decodeTokens": 0, "draftedTokens": 0, "draftSeconds": 0, "expertHitRate": 0, "finishReason": "stop", "imageEncodeSeconds": 8.4e-08, "interTokenSeconds": [], "lifetimeRSSPeakBytes": 3545366528, "mlxActiveEndBytes": 5046896792, "mlxCacheEndBytes": 610796540, "mlxPeakMemoryGB": 6.65365836, "ngramCachedRows": 976, "ngramCachePayloadBytes": 624640, "ngramRowHits": 0, "ngramRowMisses": 0, "peakMemoryGB": 6.374346568, "physicalFootprintEndBytes": 6374346568, "prefillComputePasses": [4096, 2048, 1817], "prefillGPUWaitSeconds": 1.3305606779999986, "prefillIOSeconds": 10.112304925918579, "prefillMLXActiveBytes": 5046896792, "prefillMLXCacheBytes": 609797116, "prefillPasses": [4096, 2048, 1817], "prefillPhysicalFootprintBytes": 6382653256, "prefillReadBytes": 124465766400, "prefillRecords": 45018, "prefillRowSortSeconds": 0.02480494976043701, "prefillScatterSeconds": 0.1909390687942505, "prefillSeconds": 27.055903416, "prefillTokens": 7961, "promptTokens": 7961, "queueSeconds": 4.17e-07, "reconciledHeadTokens": 0, "reconciliationSeconds": 0, "requestSeconds": 27.057539167, "reusedHeadTokens": 0, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 7539347176, "samples": 1354}, "sampleSeconds": 0.001263083, "tokenCallbackSeconds": 0, "verifyPasses": 0, "verifySeconds": 0}, "text": ""}, "exclusion": "swap activity during cell; timing excluded"}
{"round": 3, "prompt": "acceptance", "chunk": 4096, "arm": "scope", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-scope-tile-v3/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/.build/optimization/scope-generation-pilot-v3/fixtures/acceptance.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/scope-generation-pilot-v3/3-acceptance-4096-scope/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_COMPACT_MTP": "1", "SLOTSTREAM_OPT_INDEXER_TILES": "1", "SLOTSTREAM_OPT_PLE_TILES": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_OPT_LAYER_WORKSPACE": "1", "SLOTSTREAM_OPT_READ_SCOPE": "8192", "SLOTSTREAM_OPT_WORKSPACE_TILE": "2048", "SLOTSTREAM_PREFILL_CHUNK": "4096"}, "override_extra_allowance_gb": 12.4368, "before": {"page_bytes": 16384, "reclaimable_bytes": 31049531392, "swapins": 41653820, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   417796.\nPages active:                                 925095.\nPages inactive:                               690203.\nPages speculative:                            236842.\nPages throttled:                                   0.\nPages wired down:                             249044.\nPages purgeable:                                5106.\n\"Translation faults\":                    13660153615.\nPages copy-on-write:                       621557697.\nPages zero filled:                       14013824815.\nPages reactivated:                        2059203643.\nPages purged:                               60073687.\nFile-backed pages:                           1472211.\nAnonymous pages:                              379929.\nPages stored in compressor:                  1712125.\nPages occupied by compressor:                 564435.\nDecompressions:                            943043209.\nCompressions:                             1234921612.\nPageins:                                  5603563450.\nPageouts:                                   10603688.\nSwapins:                                    41653820.\nSwapouts:                                   69884827.\nPages tagged:                                 166678.\nPages tagged resident:                        114872.\nPages tagged compressed:                       51806.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6907.\nPages tag-storage free:                         2017.\nPages tag-storage non-tag pageable:            89372.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8571008.\nTagged compressions:                         9123251.\nTagged decompressions:                       8375420.\n"}, "exit_code": 0, "wall_seconds": 28.714367916000015, "after": {"page_bytes": 16384, "reclaimable_bytes": 30450909184, "swapins": 41653820, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   524212.\nPages active:                                 900963.\nPages inactive:                               781496.\nPages speculative:                            116826.\nPages throttled:                                   0.\nPages wired down:                             234917.\nPages purgeable:                               17144.\n\"Translation faults\":                    13661063466.\nPages copy-on-write:                       621574203.\nPages zero filled:                       14039977744.\nPages reactivated:                        2061253044.\nPages purged:                               60078906.\nFile-backed pages:                           1317220.\nAnonymous pages:                              482065.\nPages stored in compressor:                  1641516.\nPages occupied by compressor:                 524321.\nDecompressions:                            943262769.\nCompressions:                             1235194287.\nPageins:                                  5605473678.\nPageouts:                                   10603959.\nSwapins:                                    41653820.\nSwapouts:                                   69884827.\nPages tagged:                                 166600.\nPages tagged resident:                        113052.\nPages tagged compressed:                       53548.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6907.\nPages tag-storage free:                         2669.\nPages tag-storage non-tag pageable:            88720.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8969024.\nTagged compressions:                         9126118.\nTagged decompressions:                       8376531.\n"}, "metrics": {"effective_expected_peak_gb": 19.767622912, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 4096, "effective_prefill_cost_gb": 5.3248, "encode_seconds": 0.035038083, "experimental_memory_family": true, "extra_expert_workspace_gb": 1.4155776, "extra_read_scope_allowance_gb": 5.438046207999999, "launch_seconds": 28.469571458, "load_seconds": 1.131999292, "optimizations": {"boundedDraftTail": false, "boundedIndexer": true, "boundedPLE": true, "boundedSweepRows": false, "compactMTPRow": true, "compactNgramRows": false, "compactStateWindows": true, "demandedPrefillOutput": false, "disjointSweepOutput": false, "fusedGDNRecording": false, "incrementalIndexer": false, "layerExpertWorkspace": true, "readScopeTokens": 8192, "reuseFirstMTPEntry": false, "sharedRoPE": false, "skipUnusedFinalForward": true, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false, "workspaceTokenTile": 2048}, "output_ids": [], "plan": {"availability_clamped": false, "device_available_gb": 34.9, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [760, 17593, 7189, 421, 279, 33439, 10286, 369, 4890, 6571, 36, 923, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 27213, 14159, 998, 30411, 2112, 2272, 279, 48736, 45366, 42199, 13, 561, 10663, 19403, 35863, 24296, 4800, 45191, 2663, 6600, 279, 1834, 13, 68650, 13017, 557, 10345, 383, 279, 9897, 44350, 17188, 1785, 13, 4558, 14162, 25, 1092, 369, 279, 33439, 10286, 30, 21134, 440, 799, 3299, 13, 198], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"abortedReadScopes": 0, "acceptedDrafts": 0, "allocatedSequenceBytes": 226492416, "decodeForwardPasses": 0, "decodeIOSeconds": 0, "decodeModelTokens": 0, "decodeReadBytes": 0, "decodeRecords": 0, "decodeScatterSeconds": 0, "decodeSeconds": 0.001703625, "decodeTokens": 0, "draftedTokens": 0, "draftSeconds": 0, "expertHitRate": 0, "finishReason": "stop", "imageEncodeSeconds": 4.1e-08, "interTokenSeconds": [], "lifetimeRSSPeakBytes": 3331932160, "mlxActiveEndBytes": 5046847640, "mlxCacheEndBytes": 556597252, "mlxPeakMemoryGB": 7.809188196, "ngramCachedRows": 976, "ngramCachePayloadBytes": 624640, "ngramRowHits": 0, "ngramRowMisses": 0, "peakMemoryGB": 6.249893608, "physicalFootprintEndBytes": 6249893608, "prefillComputePasses": [4096, 2048, 1817], "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 4.224198818206787, "prefillMLXActiveBytes": 5046847640, "prefillMLXCacheBytes": 555597824, "prefillPasses": [7961], "prefillPhysicalFootprintBytes": 6258200296, "prefillReadBytes": 51848294400, "prefillRecords": 18753, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 1.4217140843889167, "prefillSeconds": 27.299988541, "prefillTokens": 7961, "promptTokens": 7961, "queueSeconds": 5.42e-07, "reconciledHeadTokens": 0, "reconciliationSeconds": 0, "requestSeconds": 27.302144584, "reusedHeadTokens": 0, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 8697974528, "samples": 1366}, "sampleSeconds": 0.001700583, "tokenCallbackSeconds": 0, "verifyPasses": 0, "verifySeconds": 0}, "text": ""}}
```

## .build/optimization/scope-generation-pilot-v3/summary.json

SHA-256: `1d2bd58f5db544a737ba9131eb01c5924a1678c9578ba6154c8a54146dcf5794`

```json
[
  {
    "prompt": "acceptance",
    "chunk": 4096,
    "arm": "reference",
    "valid_rounds": 1,
    "median_prefill_seconds": 26.014835333,
    "median_request_seconds": 26.015978375,
    "prefill_records": [
      45018
    ]
  },
  {
    "prompt": "acceptance",
    "chunk": 4096,
    "arm": "scope",
    "valid_rounds": 2,
    "median_prefill_seconds": 26.381072333,
    "median_request_seconds": 26.3828009375,
    "prefill_records": [
      18753,
      18753
    ]
  }
]
```

