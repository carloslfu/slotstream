---
type: run
id: 01m1wjxkrw1dj4qaygfw4d3x8v
created: 2026-09-07T00:05:05.948497+00:00
updated: 2026-09-07T00:05:06.192929+00:00
summary: Actual HTTP gate exposes stale prose matching and missing structured Ollama overflow codes
binary: b64b07cff525003546694e8a129d7996a11987fb9b5350b47e0a882b9c848daf
captured_at: 2026-09-07
command: Exact commands and frozen identity below
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Actual HTTP gate exposes stale prose matching and missing structured Ollama overflow codes
tool: Native Swift diagnostics and Python CLI gates
---
# Actual overflow responses and the failing gate

The V202 symlink smoke passes. The following original live HTTP robustness
suite reports 73 passing and one failed assertion, then drains its server.
Its only failure searches for the old sentence over this server's limit.
The actual response says context_length_exceeded and names the configured
32768-token window, so the failure is not missing length enforcement.

A separate bounded live reproduction on that unchanged binary records all
four Ollama cases: chat and raw generate, each streaming and nonstreaming.
All receive HTTP 400 with the original string error and no success payload.
Chat has 40012 templated tokens; raw generate has 40001 tokens. All four omit
the stable structured code/details fields already used by other request
refusals. This reproduction passes its explicitly diagnostic expectation of
missing fields; it is a counterexample to the intended typed wire contract,
not a product acceptance pass.

The prospective correction sends the same legacy error string through the
existing typed refusal helper in those two endpoint branches, adding code
and details without changing status, prompt counting, cap boundaries,
successful paths, defaults or memory arithmetic. The HTTP suite will assert
HTTP 400 and the stable code rather than a human sentence. Twenty-one new
native assertions cover pre-header status, a structured context code and
absence of a success payload across all seven dialect variants. No original
boundary assertions are removed. Stale CLI/API vision budget wording is
corrected in the same source successor. The successor is not yet built or
accepted at this capture.

This is wire correctness evidence only. Full resource, P5 and release remain
open. No timing or capacity claim is drawn from these intervals, and the
public limit remains 65536 with default 32768.

## Frozen build identity

```json
{
  "binary_sha256": "b64b07cff525003546694e8a129d7996a11987fb9b5350b47e0a882b9c848daf",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "source_archive_sha256": "38707bb9cd38ddefe5a793451b55da56012dac1e03332b129d88577831622664"
}
```

## v202-public/remaining-http-v202/manifest.json

SHA-256 `ca2908d1ab9061b4207ab68d05e50ccc6686240e07b3a785ae358e6ff8f6de3d`; 10484 bytes.

````text
{
  "projection": "Exact text with local workspace/model paths replaced by role labels. Original bytes remain in the local run; their identity is recorded here.",
  "original_sha256": "54404448551003713fb61716c71020b7315e8b7bfc9996fd4824073683632df4",
  "original_bytes": 9828,
  "text": "{\n  \"passed\": false,\n  \"classification\": \"symlink and live HTTP correctness only; global swap observations retained, no timing or capacity claim\",\n  \"identity\": {\n    \"binary_sha256\": \"b64b07cff525003546694e8a129d7996a11987fb9b5350b47e0a882b9c848daf\",\n    \"metallib_sha256\": \"198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597\",\n    \"source_archive_sha256\": \"38707bb9cd38ddefe5a793451b55da56012dac1e03332b129d88577831622664\"\n  },\n  \"rows\": [\n    {\n      \"name\": \"symlink\",\n      \"command\": [\n        \"<shared-worktree>/.build/optimization/merged-context-build-v202/candidate/slotstream\",\n        \"run\",\n        \"--model\",\n        \"/private/tmp/slotstream-context-implementation-20260906/remaining-http-v202/model-symlink\",\n        \"--memory-gb\",\n        \"8.1\",\n        \"--max-tokens\",\n        \"1\",\n        \"--greedy\",\n        \"--prompt\",\n        \"hi\"\n      ],\n      \"passed\": true,\n      \"before\": {\n        \"page_bytes\": 16384,\n        \"reclaimable_bytes\": 28776660992,\n        \"swapins\": 43826592,\n        \"swapouts\": 77363405,\n        \"raw\": \"Mach Virtual Memory Statistics: (page size of 16384 bytes)\\nPages free:                                   319737.\\nPages active:                                1024036.\\nPages inactive:                               721669.\\nPages speculative:                            323462.\\nPages throttled:                                   0.\\nPages wired down:                             222044.\\nPages purgeable:                                1935.\\n\\\"Translation faults\\\":                    15015540030.\\nPages copy-on-write:                       703364468.\\nPages zero filled:                       20884443786.\\nPages reactivated:                        3456551405.\\nPages purged:                               71159942.\\nFile-backed pages:                           1434716.\\nAnonymous pages:                              634451.\\nPages stored in compressor:                  1787958.\\nPages occupied by compressor:                 472860.\\nDecompressions:                           1163670103.\\nCompressions:                             1476291506.\\nPageins:                                  7365990045.\\nPageouts:                                   11015456.\\nSwapins:                                    43826592.\\nSwapouts:                                   77363405.\\nPages tagged:                                 154741.\\nPages tagged resident:                        118112.\\nPages tagged compressed:                       36629.\\nPages tag-storage:                             98304.\\nPages tag-storage holding tags:                 6789.\\nPages tag-storage free:                         2139.\\nPages tag-storage non-tag pageable:            89368.\\nPages tag-storage non-tag wired:                   8.\\nBytes of compressed tags:                    6564160.\\nTagged compressions:                        11053355.\\nTagged decompressions:                      10210097.\\n\"\n      },\n      \"exit\": 0,\n      \"after\": {\n        \"page_bytes\": 16384,\n        \"reclaimable_bytes\": 28838068224,\n        \"swapins\": 43826592,\n        \"swapouts\": 77363405,\n        \"raw\": \"Mach Virtual Memory Statistics: (page size of 16384 bytes)\\nPages free:                                   334893.\\nPages active:                                1026218.\\nPages inactive:                               832280.\\nPages speculative:                            202733.\\nPages throttled:                                   0.\\nPages wired down:                             223641.\\nPages purgeable:                                1940.\\n\\\"Translation faults\\\":                    15015769046.\\nPages copy-on-write:                       703366160.\\nPages zero filled:                       20884782424.\\nPages reactivated:                        3456551619.\\nPages purged:                               71159970.\\nFile-backed pages:                           1423303.\\nAnonymous pages:                              637928.\\nPages stored in compressor:                  1787251.\\nPages occupied by compressor:                 465263.\\nDecompressions:                           1163670771.\\nCompressions:                             1476291506.\\nPageins:                                  7366100128.\\nPageouts:                                   11015457.\\nSwapins:                                    43826592.\\nSwapouts:                                   77363405.\\nPages tagged:                                 156287.\\nPages tagged resident:                        119668.\\nPages tagged compressed:                       36619.\\nPages tag-storage:                             98304.\\nPages tag-storage holding tags:                 6789.\\nPages tag-storage free:                          481.\\nPages tag-storage non-tag pageable:            91026.\\nPages tag-storage non-tag wired:                   8.\\nBytes of compressed tags:                    6561728.\\nTagged compressions:                        11053355.\\nTagged decompressions:                      10210107.\\n\"\n      },\n      \"stdout.txt_sha256\": \"66a045b452102c59d840ec097d59d9467e13a3f34f6494e539ffd32c1bb35f18\",\n      \"stderr.txt_sha256\": \"6296f6c9851ceb6cf102cc78954782522d4260e96157be3cc2c4c933aeffd32c\"\n    },\n    {\n      \"name\": \"api-robustness\",\n      \"command\": [\n        \"bash\",\n        \"Tools/api_robustness.sh\",\n        \"11640\",\n        \"13\"\n      ],\n      \"passed\": false,\n      \"before\": {\n        \"page_bytes\": 16384,\n        \"reclaimable_bytes\": 28839706624,\n        \"swapins\": 43826592,\n        \"swapouts\": 77363405,\n        \"raw\": \"Mach Virtual Memory Statistics: (page size of 16384 bytes)\\nPages free:                                   334992.\\nPages active:                                1026219.\\nPages inactive:                               832282.\\nPages speculative:                            202732.\\nPages throttled:                                   0.\\nPages wired down:                             223641.\\nPages purgeable:                                1940.\\n\\\"Translation faults\\\":                    15015769579.\\nPages copy-on-write:                       703366296.\\nPages zero filled:                       20884782477.\\nPages reactivated:                        3456551619.\\nPages purged:                               71159970.\\nFile-backed pages:                           1423304.\\nAnonymous pages:                              637929.\\nPages stored in compressor:                  1787251.\\nPages occupied by compressor:                 465263.\\nDecompressions:                           1163670771.\\nCompressions:                             1476291506.\\nPageins:                                  7366100129.\\nPageouts:                                   11015457.\\nSwapins:                                    43826592.\\nSwapouts:                                   77363405.\\nPages tagged:                                 156287.\\nPages tagged resident:                        119668.\\nPages tagged compressed:                       36619.\\nPages tag-storage:                             98304.\\nPages tag-storage holding tags:                 6789.\\nPages tag-storage free:                          508.\\nPages tag-storage non-tag pageable:            90999.\\nPages tag-storage non-tag wired:                   8.\\nBytes of compressed tags:                    6561728.\\nTagged compressions:                        11053355.\\nTagged decompressions:                      10210107.\\n\"\n      },\n      \"exit\": 1,\n      \"after\": {\n        \"page_bytes\": 16384,\n        \"reclaimable_bytes\": 28949544960,\n        \"swapins\": 43826643,\n        \"swapouts\": 77363405,\n        \"raw\": \"Mach Virtual Memory Statistics: (page size of 16384 bytes)\\nPages free:                                   432435.\\nPages active:                                 773811.\\nPages inactive:                              1167799.\\nPages speculative:                              1613.\\nPages throttled:                                   0.\\nPages wired down:                             221965.\\nPages purgeable:                                7848.\\n\\\"Translation faults\\\":                    15017022659.\\nPages copy-on-write:                       703446395.\\nPages zero filled:                       20885647639.\\nPages reactivated:                        3457127243.\\nPages purged:                               71169868.\\nFile-backed pages:                           1326657.\\nAnonymous pages:                              616566.\\nPages stored in compressor:                  1803285.\\nPages occupied by compressor:                 486866.\\nDecompressions:                           1163822651.\\nCompressions:                             1476461720.\\nPageins:                                  7372176248.\\nPageouts:                                   11016086.\\nSwapins:                                    43826643.\\nSwapouts:                                   77363405.\\nPages tagged:                                 153857.\\nPages tagged resident:                        115874.\\nPages tagged compressed:                       37983.\\nPages tag-storage:                             98304.\\nPages tag-storage holding tags:                 6789.\\nPages tag-storage free:                         1425.\\nPages tag-storage non-tag pageable:            90082.\\nPages tag-storage non-tag wired:                   8.\\nBytes of compressed tags:                    6832576.\\nTagged compressions:                        11056211.\\nTagged decompressions:                      10211590.\\n\"\n      },\n      \"external_swap_activity\": true,\n      \"stdout.txt_sha256\": \"f35e5cda66fa5a31060622059915f62aa59ab694f35a09b4b8be90fe47050f4c\",\n      \"stderr.txt_sha256\": \"5f05e68a94141d9d526d58e8048518f9e3f4d313b9f478253e3c9219bc4ad091\"\n    }\n  ],\n  \"seconds\": 164.021929833,\n  \"error\": \"AssertionError: nonzero exit\"\n}\n"
}

````

## remaining-http-v202/api-robustness/stdout.txt

SHA-256 `f35e5cda66fa5a31060622059915f62aa59ab694f35a09b4b8be90fe47050f4c`; 4386 bytes.

````text
PASS  non-loopback browser origin is refused
PASS  loopback browser origin is allowed exactly
PASS  wrong model is rejected instead of silently relabeled
PASS  unsupported Ollama tools are rejected explicitly
PASS  unsupported OpenAI response_format is rejected explicitly
PASS  numeric stream is not mistaken for a JSON boolean
PASS  wrongly typed sampling options are rejected
PASS  numbers that overflow the sampler are rejected
PASS  unsupported message semantics are not silently dropped
PASS  OpenAI max_tokens 0 cannot become an unbounded generation
PASS  seed -1 (Ollama's random default) does not kill the server
PASS  num_predict -1 (until EOS) generates instead of trapping
PASS  client disconnecting mid-stream does not kill the server (SIGPIPE)
PASS  streamed deltas reassemble to the non-streamed text (10 cases)
PASS  out-of-range "top_p":0 falls back sanely (got 'OK')
PASS  out-of-range "top_p":-1 falls back sanely (got 'OK')
PASS  out-of-range "min_p":1.5 falls back sanely (got 'OK')
PASS  empty prompt is the load request: acknowledged, never answered from an uninitialized tensor
PASS  OpenAI array-form content is read, not dropped
PASS  stop sequence honored (got '1 2 3')
FAIL  no context limit enforced  ({"error":"context_length_exceeded: prompt is 40012 tokens, over the configured 32768-token)
PASS  /api/version (0.2.11) matches the binary
PASS  /api/tags size matches the pinned manifest
PASS  /api/show accepts the Ollama CLI request shape and advertises capabilities
PASS  /api/show accepts the deprecated name alias
PASS  /api/show refuses a non-empty system override instead of ignoring it
PASS  /api/show still rejects unknown fields
PASS  /api/chat accepts keep_alive and null options (the CLI's defaults)
PASS  /api/generate accepts the Ollama CLI one-shot shape (empty suffix/system/template)
PASS  /api/generate refuses a non-empty suffix instead of ignoring it
PASS  /api/generate with an empty prompt is the Ollama load request, acknowledged
PASS  /api/chat with no messages is the Ollama load request, acknowledged
PASS  HEAD returns no body
PASS  malformed JSON returns 400
PASS  metadata endpoints answer during a generation, and the accept loop keeps accepting
PASS  /api/show accepts an empty model with the name in the alias (ollama show)
PASS  an untagged model name resolves to the only model
PASS  a semantic Ollama knob (num_ctx) is still refused, never silently dropped
PASS  /v1 treats "max_tokens":null as unset
PASS  /v1 treats "stop":null as unset
PASS  /v1 treats "temperature":null as unset
PASS  /v1 treats "seed":null as unset
PASS  /v1 treats "stream_options":null as unset
PASS  /v1 accepts the no-op default "n":1
PASS  /v1 accepts the no-op default "frequency_penalty":0
PASS  /v1 accepts the no-op default "user":"u1"
PASS  /v1 accepts the no-op default "logprobs":false
PASS  /v1 accepts the no-op default "logit_bias":{}
PASS  /v1 accepts the no-op default "tools":[]
PASS  /v1 accepts the no-op default "response_format":{"type":"text"}
PASS  /v1 still refuses the real feature "n":2
PASS  /v1 still refuses the real feature "frequency_penalty":0.5
PASS  /v1 still refuses the real feature "logprobs":true
PASS  /v1 still refuses the real feature "tools":[{"type":"function"}]
PASS  /v1 still refuses the real feature "response_format":{"type":"json_object"}
PASS  think:true splits reasoning into message.thinking and leaves the answer clean
PASS  a short reply arrives as per-token deltas, not one batched chunk
PASS  unseeded requests vary, as the API documents
PASS  an explicit seed still reproduces exactly
PASS  a query string does not 404 the route
PASS  HEAD on a real path is 200
PASS  HEAD on an unknown path is 404, not a blanket 200
PASS  a chunked body is refused with 411, not read as empty
PASS  an oversized body gets 413, not a bare connection reset
PASS  a malformed Content-Length gets 400
PASS  a file:// image is refused and says URLs are not fetched
PASS  an https:// image is refused on the OpenAI route too
PASS  a non-string images array is a 400, not a silently text-only answer
PASS  an image part with no url is a 400
PASS  bytes that are not an image are a 400 with the reason
PASS  raw generate refuses images instead of dropping them
PASS  /v1/models carries created
PASS  the first SSE delta announces the role
PASS  server still up after every probe

robustness: passed 73, failed 1

````

## remaining-http-v202/api-robustness/stderr.txt

SHA-256 `5f05e68a94141d9d526d58e8048518f9e3f4d313b9f478253e3c9219bc4ad091`; 32 bytes.

````text
16 content deltas for 16 tokens

````

## v202-public/overflow-untyped-v202/manifest.json

SHA-256 `47eb6f827ef6e13fffaf144b87d280e6812f0b432801485573a6bf82d505af4d`; 6590 bytes.

````text
{
  "projection": "Exact text with local workspace/model paths replaced by role labels. Original bytes remain in the local run; their identity is recorded here.",
  "original_sha256": "1a628c1e690578133c658dbf71a32369b6e6b7f838e5c8630bd3c36d497f0785",
  "original_bytes": 6002,
  "text": "{\n  \"passed\": true,\n  \"binary_sha256\": \"b64b07cff525003546694e8a129d7996a11987fb9b5350b47e0a882b9c848daf\",\n  \"expected_typed\": false,\n  \"before\": {\n    \"page_bytes\": 16384,\n    \"reclaimable_bytes\": 28261990400,\n    \"swapins\": 43826748,\n    \"swapouts\": 77363405,\n    \"raw\": \"Mach Virtual Memory Statistics: (page size of 16384 bytes)\\nPages free:                                   345605.\\nPages active:                                 871609.\\nPages inactive:                              1191586.\\nPages speculative:                             10139.\\nPages throttled:                                   0.\\nPages wired down:                             223585.\\nPages purgeable:                                2955.\\n\\\"Translation faults\\\":                    15018271278.\\nPages copy-on-write:                       703578109.\\nPages zero filled:                       20886314278.\\nPages reactivated:                        3457128918.\\nPages purged:                               71172752.\\nFile-backed pages:                           1376415.\\nAnonymous pages:                              696919.\\nPages stored in compressor:                  1706357.\\nPages occupied by compressor:                 442668.\\nDecompressions:                           1163917498.\\nCompressions:                             1476461720.\\nPageins:                                  7372219092.\\nPageouts:                                   11016086.\\nSwapins:                                    43826748.\\nSwapouts:                                   77363405.\\nPages tagged:                                 154531.\\nPages tagged resident:                        119865.\\nPages tagged compressed:                       34666.\\nPages tag-storage:                             98304.\\nPages tag-storage holding tags:                 6789.\\nPages tag-storage free:                          709.\\nPages tag-storage non-tag pageable:            90798.\\nPages tag-storage non-tag wired:                   8.\\nBytes of compressed tags:                    6102400.\\nTagged compressions:                        11056211.\\nTagged decompressions:                      10214887.\\n\"\n  },\n  \"cases\": [\n    {\n      \"path\": \"/api/chat\",\n      \"stream\": false,\n      \"status\": 400,\n      \"response\": \"{\\\"error\\\":\\\"context_length_exceeded: prompt is 40012 tokens, over the configured 32768-token prompt-plus-reply window. Send less or restart with a larger supported --max-context; the model limit is 262144.\\\"}\",\n      \"typed\": false\n    },\n    {\n      \"path\": \"/api/chat\",\n      \"stream\": true,\n      \"status\": 400,\n      \"response\": \"{\\\"error\\\":\\\"context_length_exceeded: prompt is 40012 tokens, over the configured 32768-token prompt-plus-reply window. Send less or restart with a larger supported --max-context; the model limit is 262144.\\\"}\",\n      \"typed\": false\n    },\n    {\n      \"path\": \"/api/generate\",\n      \"stream\": false,\n      \"status\": 400,\n      \"response\": \"{\\\"error\\\":\\\"context_length_exceeded: prompt is 40001 tokens, over the configured 32768-token prompt-plus-reply window. Send less or restart with a larger supported --max-context; the model limit is 262144.\\\"}\",\n      \"typed\": false\n    },\n    {\n      \"path\": \"/api/generate\",\n      \"stream\": true,\n      \"status\": 400,\n      \"response\": \"{\\\"error\\\":\\\"context_length_exceeded: prompt is 40001 tokens, over the configured 32768-token prompt-plus-reply window. Send less or restart with a larger supported --max-context; the model limit is 262144.\\\"}\",\n      \"typed\": false\n    }\n  ],\n  \"classification\": \"wire correctness; no timing or capacity claim\",\n  \"command\": [\n    \"<shared-worktree>/.build/optimization/merged-context-build-v202/candidate/slotstream\",\n    \"serve\",\n    \"--memory-gb\",\n    \"10\",\n    \"--mtp\",\n    \"off\",\n    \"--vision\",\n    \"off\",\n    \"--max-context\",\n    \"32768\",\n    \"--max-prefill-wait\",\n    \"0\",\n    \"--no-elastic\",\n    \"--port\",\n    \"11641\"\n  ],\n  \"server_exit\": -15,\n  \"after\": {\n    \"page_bytes\": 16384,\n    \"reclaimable_bytes\": 28346859520,\n    \"swapins\": 43826748,\n    \"swapouts\": 77363405,\n    \"raw\": \"Mach Virtual Memory Statistics: (page size of 16384 bytes)\\nPages free:                                   367584.\\nPages active:                                 779353.\\nPages inactive:                              1263027.\\nPages speculative:                             16597.\\nPages throttled:                                   0.\\nPages wired down:                             221761.\\nPages purgeable:                                3874.\\n\\\"Translation faults\\\":                    15018487177.\\nPages copy-on-write:                       703579667.\\nPages zero filled:                       20886692275.\\nPages reactivated:                        3457151863.\\nPages purged:                               71176124.\\nFile-backed pages:                           1358697.\\nAnonymous pages:                              700280.\\nPages stored in compressor:                  1705999.\\nPages occupied by compressor:                 436526.\\nDecompressions:                           1163917856.\\nCompressions:                             1476461720.\\nPageins:                                  7378678872.\\nPageouts:                                   11016144.\\nSwapins:                                    43826748.\\nSwapouts:                                   77363405.\\nPages tagged:                                 154594.\\nPages tagged resident:                        119932.\\nPages tagged compressed:                       34662.\\nPages tag-storage:                             98304.\\nPages tag-storage holding tags:                 6789.\\nPages tag-storage free:                          854.\\nPages tag-storage non-tag pageable:            90653.\\nPages tag-storage non-tag wired:                   8.\\nBytes of compressed tags:                    6101824.\\nTagged compressions:                        11056211.\\nTagged decompressions:                      10214891.\\n\"\n  },\n  \"seconds\": 9.561390459\n}\n"
}

````

## overflow-untyped-v202/server.stdout.txt

SHA-256 `d289ec7b16f59d1eec0d8bf59b2ed9292ba21949c999e106076370192b5a7007`; 244 bytes.

````text
slotstream listening on http://127.0.0.1:11641
try it:
  curl localhost:11641/api/chat -d '{"model": "qwen3.8-flash-next:4bit", "messages": [{"role": "user", "content": "hello"}]}'
or point any Ollama or OpenAI client at http://localhost:11641

````

## overflow-untyped-v202/server.stderr.txt

SHA-256 `69c2af7508a52abe2dfd77d8e3955c5649444acc85d0391d70f30392881fe3bf`; 1005 bytes.

````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (28.2 GB reclaimable now), 40.2 GB Metal working set
  target: 10.0 GB total for this process
  cache:  ~20 of 512 experts per layer  (961 global slots = 2.7 GB pool)
  expect: ~9.0 GB peak, ~4 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 13382 tokens across 4 conversations (~0.7 GB), so a follow-up turn re-prefills only what is new
engine ready in 0.8s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]

````

## v202-public/context_overflow_probe.py

SHA-256 `a79d9e9186bcdb45a99aa971c3ffdb86716367399befd62cacb0aedcac655cba`; 3935 bytes.

````text
{
  "projection": "Exact text with local workspace/model paths replaced by role labels. Original bytes remain in the local run; their identity is recorded here.",
  "original_sha256": "3bf2633e583898d2c60ed8630409ccf314d352352ecf342bcb72d0705fde52c8",
  "original_bytes": 3579,
  "text": "\"\"\"Record the actual pre-header context refusal on both Ollama endpoints.\"\"\"\nimport argparse, http.client, json, os, socket, subprocess, sys, time\nfrom pathlib import Path\nsys.path.insert(0, 'Tools')\nfrom prefill_bench import digest, preflight, terminate_child_tree, vm_snapshot\n\np = argparse.ArgumentParser(description=__doc__)\np.add_argument('--binary', type=Path, required=True)\np.add_argument('--out', type=Path, required=True)\np.add_argument('--expect-typed', action='store_true')\na = p.parse_args()\nbinary = a.binary.resolve(); a.out.mkdir(parents=True, exist_ok=False)\nidentity = json.loads((binary.parent/'build-identity.json').read_text())\nassert digest(binary) == identity['binary_sha256']\nmanifest = {'passed': False, 'binary_sha256': identity['binary_sha256'], 'expected_typed': a.expect_typed,\n            'before': preflight(13), 'cases': [], 'classification': 'wire correctness; no timing or capacity claim'}\nenv = {k:v for k,v in os.environ.items() if not k.startswith('SLOTSTREAM_')}\nport = 11641\ncommand = [str(binary), 'serve', '--memory-gb', '10', '--mtp', 'off', '--vision', 'off',\n           '--max-context', '32768', '--max-prefill-wait', '0', '--no-elastic', '--port', str(port)]\nmanifest['command'] = command\nstarted = time.monotonic()\nwith (a.out/'server.stdout.txt').open('wb') as stdout, (a.out/'server.stderr.txt').open('wb') as stderr:\n    child = subprocess.Popen(command, env=env, stdout=stdout, stderr=stderr, start_new_session=True)\n    try:\n        while True:\n            if child.poll() is not None: raise RuntimeError('server exited')\n            try:\n                with socket.create_connection(('127.0.0.1', port), timeout=1): break\n            except OSError:\n                if time.monotonic()-started > 45: raise RuntimeError('readiness timeout')\n                time.sleep(.2)\n        text = 'word ' * 40000\n        for path in ('/api/chat', '/api/generate'):\n            for stream in (False, True):\n                request = {'stream': stream, 'options': {'num_predict': 8}}\n                if path == '/api/chat': request['messages'] = [{'role': 'user', 'content': text}]\n                else: request.update(prompt=text, raw=True)\n                connection = http.client.HTTPConnection('127.0.0.1', port, timeout=25)\n                connection.request('POST', path, json.dumps(request), {'Content-Type': 'application/json'})\n                response = connection.getresponse(); raw = response.read().decode(); connection.close()\n                obj = json.loads(raw)\n                typed = obj.get('code') == 'context_length_exceeded' and obj.get('details', {}).get('code') == 'context_length_exceeded'\n                row = {'path': path, 'stream': stream, 'status': response.status, 'response': raw, 'typed': typed}\n                manifest['cases'].append(row)\n                assert response.status == 400 and isinstance(obj.get('error'), str) and '32768' in obj['error']\n                assert obj.get('done') is not True and typed == a.expect_typed\n        manifest['passed'] = True\n    except Exception as error: manifest['error'] = f'{type(error).__name__}: {error}'\n    finally:\n        if child.poll() is None: terminate_child_tree(child)\n        manifest['server_exit'] = child.returncode; manifest['after'] = vm_snapshot()\n        manifest['seconds'] = time.monotonic()-started\n        (a.out/'manifest.json').write_text(json.dumps(manifest, indent=2)+'\\n')\nprint(json.dumps({k:manifest[k] for k in ('passed','expected_typed','seconds','error') if k in manifest}))\nraise SystemExit(0 if manifest['passed'] else 1)\n"
}

````

## typed-context-refusal-v1/before/Tools/api_robustness.sh

SHA-256 `cf7d30e9c840a21dae4b9d5e58532399be25920a453f45a3b4be7dca0df03dbf`; 29200 bytes.

````text
#!/bin/bash
# Robustness gates for the serving layer: every input here either crashed the
# server or produced silently wrong output before 0.1.5. Each one starts from a
# live server and asserts the process is still up afterwards.
#
# Usage: Tools/api_robustness.sh [port] [experts-per-layer]
set -u
cd "$(dirname "$0")/.."
BIN=${SLOTSTREAM_TEST_BINARY:-.build/release/slotstream}
SERVER_LOG=${SLOTSTREAM_TEST_LOG:-/tmp/ssrob.log}
PORT=${1:-11466}
EPL=${2:-13}
PASS=0; FAIL=0
# The 24 required files; the optional draft head (1,470,955,171 bytes, pulled
# with the weights since 0.2.2) counts when it is present, since /api/tags
# reports what is on disk.
TOTAL_WEIGHT_BYTES=103793508077
MTPFILE="$HOME/.slotstream/models/qwen38-flash-next-mlx-4bit/mtp.safetensors"
[ -f "$MTPFILE" ] && TOTAL_WEIGHT_BYTES=$((TOTAL_WEIGHT_BYTES + $(stat -f%z "$MTPFILE")))

say() { printf '%s\n' "$*"; }
ok()  { say "PASS  $1"; PASS=$((PASS+1)); }
bad() { say "FAIL  $1${2:+  ($2)}"; FAIL=$((FAIL+1)); }

SERVER_ARGS=()
[ -n "${SLOTSTREAM_TEST_MEMORY_GB:-}" ] && SERVER_ARGS+=(--memory-gb "$SLOTSTREAM_TEST_MEMORY_GB" --no-elastic)
[ -n "${SLOTSTREAM_TEST_MTP:-}" ] && SERVER_ARGS+=(--mtp "$SLOTSTREAM_TEST_MTP")
# Bash 3.2 treats an empty array as unbound under set -u. Expand it only
# when populated, and clear stale logs before any expansion can fail.
: >"$SERVER_LOG"
"$BIN" serve --port "$PORT" --experts-per-layer "$EPL" ${SERVER_ARGS[@]+"${SERVER_ARGS[@]}"} >"$SERVER_LOG" 2>&1 &
SRV=$!
cleanup() { kill "$SRV" 2>/dev/null || true; wait "$SRV" 2>/dev/null || true; }
trap cleanup EXIT
for _ in $(seq 1 90); do
  curl -s --max-time 2 "http://127.0.0.1:$PORT/api/version" >/dev/null 2>&1 && break
  sleep 1
done
alive() { kill -0 $SRV 2>/dev/null; }
alive || { say "FAIL  server never came up"; cat "$SERVER_LOG"; exit 1; }

post() { curl -s --max-time 300 -X POST "http://127.0.0.1:$PORT$1" -d "$2"; }
content() { python3 -c 'import json,sys;d=json.load(sys.stdin);print(d.get("message",{}).get("content", d.get("error","")))'; }

# Browser origins are loopback-only; arbitrary websites must not be able to
# drive a costly localhost model through CORS/private-network preflight.
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 \
    -H 'Origin: https://attacker.example' "http://127.0.0.1:$PORT/api/version")
[ "$C" = 403 ] && ok "non-loopback browser origin is refused" || bad "foreign Origin returned $C"
O=$(curl -si --max-time 20 -H 'Origin: http://localhost:3000' \
    "http://127.0.0.1:$PORT/api/version" | tr -d '\r' | awk -F': ' '/^Access-Control-Allow-Origin/{print $2}')
[ "$O" = 'http://localhost:3000' ] && ok "loopback browser origin is allowed exactly" \
    || bad "loopback CORS response wrong" "$O"

C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/api/chat" -d '{"model":"some-other-model","messages":[{"role":"user","content":"hi"}]}')
[ "$C" = 400 ] && ok "wrong model is rejected instead of silently relabeled" || bad "wrong model returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/api/chat" -d '{"messages":[{"role":"user","content":"hi"}],"tools":[{"type":"function"}]}')
[ "$C" = 400 ] && ok "unsupported Ollama tools are rejected explicitly" || bad "tools returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/v1/chat/completions" -d '{"messages":[{"role":"user","content":"hi"}],"response_format":{"type":"json_object"}}')
[ "$C" = 400 ] && ok "unsupported OpenAI response_format is rejected explicitly" || bad "response_format returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/api/chat" -d '{"stream":1,"messages":[{"role":"user","content":"hi"}]}')
[ "$C" = 400 ] && ok "numeric stream is not mistaken for a JSON boolean" || bad "numeric stream returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/api/chat" -d '{"stream":false,"messages":[{"role":"user","content":"hi"}],"options":{"temperature":"cold"}}')
[ "$C" = 400 ] && ok "wrongly typed sampling options are rejected" || bad "string temperature returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/api/chat" -d '{"stream":false,"messages":[{"role":"user","content":"hi"}],"options":{"temperature":1e300}}')
[ "$C" = 400 ] && ok "numbers that overflow the sampler are rejected" || bad "overflowing temperature returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/v1/chat/completions" -d '{"stream":false,"messages":[{"role":"user","content":"hi","name":"silently-dropped"}]}')
[ "$C" = 400 ] && ok "unsupported message semantics are not silently dropped" || bad "message name returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/v1/chat/completions" -d '{"messages":[{"role":"user","content":"hi"}],"max_tokens":0}')
[ "$C" = 400 ] && ok "OpenAI max_tokens 0 cannot become an unbounded generation" || bad "max_tokens 0 returned $C"

# --- crashes: the process must survive each of these ---
R=$(post /api/chat '{"stream":false,"messages":[{"role":"user","content":"Say OK"}],"options":{"seed":-1,"num_predict":4}}')
if alive && [ -n "$R" ]; then ok "seed -1 (Ollama's random default) does not kill the server"
else bad "seed -1 killed the server"; fi

R=$(post /api/chat '{"stream":false,"messages":[{"role":"user","content":"Say OK"}],"options":{"num_predict":-1}}')
N=$(printf '%s' "$R" | python3 -c 'import json,sys;print(json.load(sys.stdin).get("eval_count",-1))' 2>/dev/null)
if alive && [ "${N:-0}" -gt 0 ]; then ok "num_predict -1 (until EOS) generates instead of trapping"
else bad "num_predict -1 killed the server or produced nothing"; fi

python3 - "$PORT" <<'PY' >/dev/null 2>&1
import socket, sys, time
s = socket.create_connection(("127.0.0.1", int(sys.argv[1])))
b = b'{"messages":[{"role":"user","content":"Write a long poem about the sea"}],"options":{"num_predict":200,"temperature":0}}'
s.sendall(b"POST /api/chat HTTP/1.1\r\nHost: x\r\nContent-Length: %d\r\n\r\n" % len(b) + b)
s.recv(200); time.sleep(2); s.close()
PY
sleep 6
if alive; then ok "client disconnecting mid-stream does not kill the server (SIGPIPE)"
else bad "mid-stream disconnect killed the server"; fi

# --- silently wrong output ---
# The streaming contract: concatenating every delta must reproduce the
# non-streamed text exactly, including multi-token characters, scalars that
# merge into an already-sent grapheme (U+FE0F), and stop sequences that
# straddle a token boundary.
if python3 - "$PORT" <<'PYEOF'
import json, sys, http.client
P = int(sys.argv[1])
def call(body, stream):
    b = dict(body); b["stream"] = stream
    c = http.client.HTTPConnection("127.0.0.1", P, timeout=300)
    c.request("POST", "/api/chat", json.dumps(b), {"Content-Type": "application/json"})
    d = c.getresponse().read().decode(); c.close()
    if not stream:
        return json.loads(d)["message"]["content"]
    return "".join(json.loads(l)["message"]["content"] for l in d.splitlines() if l.strip())
cases = [
 ("plain",           "Say exactly: hello world", {}),
 ("emoji only",      "Reply with exactly these five emoji and nothing else: rocket, fire, star, heart, tree", {}),
 ("emoji + text",    "Write one short sentence about space with exactly one rocket emoji.", {}),
 ("CJK",             "Write the word for cat in Japanese, Chinese and Russian. Just the three words.", {}),
 ("mixed scripts",   "Reply with exactly: caf\u00e9 na\u00efve \u4e2d\u6587 \U0001f600", {}),
 ("1-char stop",     "Count from 1 to 9, digits only, one per line.", {"stop": ["5"]}),
 ("multi-char stop", "Count from 1 to 20 as words, one per line.", {"stop": ["five"]}),
 ("newline stop",    "Write three short lines of a poem.", {"stop": ["\n\n"]}),
 ("stop never hit",  "Say exactly: alpha beta gamma", {"stop": ["ZZZQQQ"]}),
 ("longer output",   "List the first 12 prime numbers, comma separated.", {}),
]
bad = []
for name, prompt, extra in cases:
    o = {"num_predict": 60, "temperature": 0}; o.update(extra)
    body = {"messages": [{"role": "user", "content": prompt}], "options": o}
    ns, st = call(body, False), call(body, True)
    if ns != st:
        bad.append(f"{name}: non-stream={ns!r} streamed={st!r}")
for b in bad:
    print(b, file=sys.stderr)
sys.exit(1 if bad else 0)
PYEOF
then ok "streamed deltas reassemble to the non-streamed text (10 cases)"
else bad "streaming does not reassemble to the non-streamed text"; fi

for BADP in '"top_p":0' '"top_p":-1' '"min_p":1.5'; do
  R=$(post /api/chat "{\"stream\":false,\"messages\":[{\"role\":\"user\",\"content\":\"Say OK\"}],\"options\":{\"num_predict\":6,\"temperature\":1,$BADP}}" | content)
  case "$R" in
    *'!!!'*|'') bad "out-of-range $BADP produces garbage" "got '$R'" ;;
    *) ok "out-of-range $BADP falls back sanely (got '$R')" ;;
  esac
done

# An empty prompt is Ollama's documented "load" request (the CLI sends one when
# an interactive session opens). It must be acknowledged with no text and
# without touching the engine: generating from it would read an uninitialized
# tensor, which is what this gate originally guarded against.
R=$(post /api/generate '{"raw":true,"prompt":"","stream":false,"options":{"num_predict":8}}')
case "$R" in
  *'"done_reason":"load"'*) case "$R" in *'"response":""'*) ok "empty prompt is the load request: acknowledged, never answered from an uninitialized tensor" ;;
    *) bad "load acknowledgment carried text" "$R" ;; esac ;;
  *) bad "empty prompt was answered or refused instead of acknowledged" "$R" ;; esac

R=$(post /v1/chat/completions '{"messages":[{"role":"user","content":[{"type":"text","text":"Reply with exactly: ARRAYOK"}]}],"max_tokens":8,"temperature":0}' \
    | python3 -c 'import json,sys;print(json.load(sys.stdin)["choices"][0]["message"]["content"])')
case "$R" in *ARRAYOK*) ok "OpenAI array-form content is read, not dropped" ;;
  *) bad "array-form content dropped" "got '$R'" ;; esac

R=$(post /api/chat '{"stream":false,"messages":[{"role":"user","content":"Count from 1 to 9, digits only, one per line."}],"options":{"num_predict":40,"temperature":0,"stop":["4"]}}' | content)
case "$R" in *4*) bad "stop sequence ignored" "got '$(printf %s "$R" | tr '\n' ' ')'" ;;
  *) ok "stop sequence honored (got '$(printf %s "$R" | tr '\n' ' ')')" ;; esac

# --- limits and protocol ---
BIG=$(python3 -c 'print("word "*40000)')
R=$(python3 - "$PORT" "$BIG" <<'PY'
import json,sys,urllib.request
port,big=sys.argv[1],sys.argv[2]
req=urllib.request.Request(f"http://127.0.0.1:{port}/api/chat",
    data=json.dumps({"stream":False,"messages":[{"role":"user","content":big}]}).encode(),
    headers={"Content-Type":"application/json"})
try: print(urllib.request.urlopen(req,timeout=120).read().decode())
except urllib.error.HTTPError as e: print(e.read().decode())
PY
)
case "$R" in *"over this server's limit"*) ok "over-length prompt is refused with a 400, not a silent stall" ;;
  *) bad "no context limit enforced" "$(printf %.90s "$R")" ;; esac

V=$(curl -s --max-time 20 "http://127.0.0.1:$PORT/api/version" | python3 -c 'import json,sys;print(json.load(sys.stdin)["version"])')
B=$($BIN --version)
[ "$V" = "$B" ] && ok "/api/version ($V) matches the binary" || bad "/api/version stale" "api=$V binary=$B"

S=$(curl -s --max-time 20 "http://127.0.0.1:$PORT/api/tags" | python3 -c 'import json,sys;print(json.load(sys.stdin)["models"][0]["size"])')
[ "$S" = "$TOTAL_WEIGHT_BYTES" ] && ok "/api/tags size matches the pinned manifest" || bad "/api/tags size wrong" "$S != $TOTAL_WEIGHT_BYTES"

# --- the Ollama CLI's wire format ---
# Its ShowRequest serializes every field, so `ollama run` opens with empty
# name/system/template/options, and its chat may carry keep_alive and a null
# options. Rejecting those broke the CLI in 0.1.8 without any gate noticing.
R=$(post /api/show '{"model":"qwen3.8-flash-next:4bit","name":"","system":"","template":"","options":{},"verbose":false}')
case "$R" in *'"capabilities"'*) ok "/api/show accepts the Ollama CLI request shape and advertises capabilities" ;;
  *) bad "/api/show rejects the Ollama CLI request shape" "$(printf %.90s "$R")" ;; esac
R=$(post /api/show '{"name":"qwen3.8-flash-next:4bit"}')
case "$R" in *'"capabilities"'*) ok "/api/show accepts the deprecated name alias" ;;
  *) bad "/api/show rejects the name alias" "$(printf %.90s "$R")" ;; esac
R=$(post /api/show '{"model":"qwen3.8-flash-next:4bit","system":"You are a pirate"}')
case "$R" in *"not supported"*) ok "/api/show refuses a non-empty system override instead of ignoring it" ;;
  *) bad "/api/show silently accepted a system override" "$(printf %.90s "$R")" ;; esac
R=$(post /api/show '{"model":"qwen3.8-flash-next:4bit","foo":1}')
case "$R" in *"unsupported request field"*) ok "/api/show still rejects unknown fields" ;;
  *) bad "/api/show accepted an unknown field" "$(printf %.90s "$R")" ;; esac
R=$(post /api/chat '{"model":"qwen3.8-flash-next:4bit","stream":false,"keep_alive":"5m","options":null,"messages":[{"role":"user","content":"Reply with exactly: pong"}]}' | content)
case "$R" in ""|*"unsupported"*|*"must be"*) bad "/api/chat rejects keep_alive or null options" "$(printf %.90s "$R")" ;;
  *) ok "/api/chat accepts keep_alive and null options (the CLI's defaults)" ;; esac
# One-shot `ollama run model "prompt"` uses /api/generate with empty suffix/system/template.
R=$(post /api/generate '{"model":"qwen3.8-flash-next:4bit","prompt":"Reply with exactly: pong","suffix":"","system":"","template":"","options":{},"stream":false}' | python3 -c 'import json,sys;d=json.load(sys.stdin);print(d.get("response", d.get("error","")))')
case "$R" in ""|*"unsupported"*|*"must be"*) bad "/api/generate rejects the Ollama CLI one-shot shape" "$(printf %.90s "$R")" ;;
  *) ok "/api/generate accepts the Ollama CLI one-shot shape (empty suffix/system/template)" ;; esac
R=$(post /api/generate '{"model":"qwen3.8-flash-next:4bit","prompt":"def f(","suffix":"return 1","stream":false}')
case "$R" in *"not supported"*) ok "/api/generate refuses a non-empty suffix instead of ignoring it" ;;
  *) bad "/api/generate silently accepted a suffix" "$(printf %.90s "$R")" ;; esac
# Interactive `ollama run` opens with Ollama's documented "load" request: an empty prompt.
R=$(post /api/generate '{"model":"qwen3.8-flash-next:4bit","prompt":"","suffix":"","system":"","template":"","options":{}}')
case "$R" in *'"done_reason":"load"'*) ok "/api/generate with an empty prompt is the Ollama load request, acknowledged" ;;
  *) bad "/api/generate rejects the empty-prompt load request" "$(printf %.90s "$R")" ;; esac
R=$(post /api/chat '{"model":"qwen3.8-flash-next:4bit","messages":[]}')
case "$R" in *'"done_reason":"load"'*) ok "/api/chat with no messages is the Ollama load request, acknowledged" ;;
  *) bad "/api/chat rejects the empty-messages load request" "$(printf %.90s "$R")" ;; esac

L=$(curl -s -I --max-time 20 "http://127.0.0.1:$PORT/api/tags" | tr -d '\r' | awk -F': ' '/^Content-Length/{print $2}')
[ "${L:-x}" = "0" ] && ok "HEAD returns no body" || bad "HEAD returned a body" "Content-Length=$L"

C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST "http://127.0.0.1:$PORT/api/chat" -d '{not json')
[ "$C" = "400" ] && ok "malformed JSON returns 400" || bad "malformed JSON returned $C"

# --- metadata must not block behind a running generation --------------------
# /api/tags and /api/ps read pool numbers. Taking the generation lock to do it
# made them hang for the length of a request, and because the accept loop also
# waited on the connection semaphore, enough blocked metadata calls stopped the
# server answering anything at all. A polling GUI saw a working server as dead.
if python3 - "$PORT" <<'PYEOF'
import http.client, json, socket, sys, threading, time
P = int(sys.argv[1]); M = "qwen3.8-flash-next:4bit"
def gen():
    c = http.client.HTTPConnection("127.0.0.1", P, timeout=600)
    c.request("POST", "/api/chat", json.dumps({"model": M, "stream": False,
        "messages": [{"role": "user", "content": "Write a long poem about the sea."}],
        "options": {"num_predict": 60, "temperature": 0}}), {"Content-Type": "application/json"})
    c.getresponse().read(); c.close()
t = threading.Thread(target=gen); t.start(); time.sleep(2.5)
problems = []
def timed(method, path, body=None):
    t0 = time.time()
    try:
        c = http.client.HTTPConnection("127.0.0.1", P, timeout=8)
        c.request(method, path, json.dumps(body) if body else None,
                  {"Content-Type": "application/json"})
        r = c.getresponse(); r.read(); c.close()
        return r.status, time.time() - t0
    except Exception as e:
        return type(e).__name__, time.time() - t0
for method, path, body in [("GET", "/api/version", None), ("GET", "/api/tags", None),
                           ("GET", "/api/ps", None), ("GET", "/v1/models", None),
                           ("POST", "/api/show", {"model": M})]:
    st, el = timed(method, path, body)
    if st != 200 or el > 2.0:
        problems.append("%s %s -> %s in %.1fs" % (method, path, st, el))
hold = []
for _ in range(34):   # more than maxConcurrentConnections
    try:
        k = socket.create_connection(("127.0.0.1", P), timeout=5)
        k.sendall(b"GET /api/tags HTTP/1.1\r\nHost: x\r\nConnection: close\r\n\r\n")
        hold.append(k)
    except Exception:
        pass
st, el = timed("GET", "/api/version")
if st != 200:
    problems.append("/api/version under connection load -> %s in %.1fs" % (st, el))
for k in hold:
    k.close()
t.join()
for line in problems:
    print(line, file=sys.stderr)
sys.exit(1 if problems else 0)
PYEOF
then ok "metadata endpoints answer during a generation, and the accept loop keeps accepting"
else bad "metadata endpoints block behind generation"; fi

# --- `ollama show` sends the name in `name` and an EMPTY `model` ------------
R=$(post /api/show '{"model":"","system":"","template":"","verbose":false,"options":null,"name":"qwen3.8-flash-next:4bit"}')
case "$R" in *'"capabilities"'*) ok "/api/show accepts an empty model with the name in the alias (ollama show)" ;;
  *) bad "/api/show rejects the ollama show shape" "$(printf %.90s "$R")" ;; esac
R=$(post /api/chat '{"model":"qwen3.8-flash-next","stream":false,"messages":[{"role":"user","content":"Say OK"}],"options":{"num_predict":4}}')
case "$R" in *'"message"'*) ok "an untagged model name resolves to the only model" ;;
  *) bad "untagged model name rejected" "$(printf %.90s "$R")" ;; esac
R=$(post /api/chat '{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":"hi"}],"options":{"num_ctx":4096}}')
case "$R" in *"unsupported options field"*) ok "a semantic Ollama knob (num_ctx) is still refused, never silently dropped" ;;
  *) bad "num_ctx was silently accepted" "$(printf %.90s "$R")" ;; esac

# --- OpenAI clients send null for "unset", and defaults on every call -------
for F in '"max_tokens":null' '"stop":null' '"temperature":null' '"seed":null' '"stream_options":null'; do
  C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 120 -X POST "http://127.0.0.1:$PORT/v1/chat/completions" \
      -d "{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[{\"role\":\"user\",\"content\":\"Say OK\"}],\"max_tokens\":4,$F}")
  [ "$C" = 200 ] && ok "/v1 treats $F as unset" || bad "/v1 rejected $F" "$C"
done
for F in '"n":1' '"frequency_penalty":0' '"user":"u1"' '"logprobs":false' '"logit_bias":{}' '"tools":[]' '"response_format":{"type":"text"}'; do
  C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 120 -X POST "http://127.0.0.1:$PORT/v1/chat/completions" \
      -d "{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[{\"role\":\"user\",\"content\":\"Say OK\"}],\"max_tokens\":4,$F}")
  [ "$C" = 200 ] && ok "/v1 accepts the no-op default $F" || bad "/v1 rejected the no-op default $F" "$C"
done
for F in '"n":2' '"frequency_penalty":0.5' '"logprobs":true' '"tools":[{"type":"function"}]' '"response_format":{"type":"json_object"}'; do
  C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 60 -X POST "http://127.0.0.1:$PORT/v1/chat/completions" \
      -d "{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[{\"role\":\"user\",\"content\":\"hi\"}],$F}")
  [ "$C" = 400 ] && ok "/v1 still refuses the real feature $F" || bad "/v1 accepted $F" "$C"
done

# --- think: reasoning belongs in `thinking`, not in the answer --------------
R=$(post /api/chat '{"model":"qwen3.8-flash-next:4bit","stream":false,"think":true,"messages":[{"role":"user","content":"What is 2+2?"}],"options":{"num_predict":80,"temperature":0}}')
if printf '%s' "$R" | python3 -c '
import json, sys
m = json.load(sys.stdin)["message"]
c, t = m.get("content", ""), m.get("thinking", "")
sys.exit(0 if t.strip() and c.strip() and "</think>" not in c and "</think>" not in t else 1)'; then
  ok "think:true splits reasoning into message.thinking and leaves the answer clean"
else bad "think:true leaked reasoning into content" "$(printf %.120s "$R")"; fi

# --- a short reply streams token by token -----------------------------------
if python3 - "$PORT" <<'PYEOF'
import http.client, json, sys
P = int(sys.argv[1])
c = http.client.HTTPConnection("127.0.0.1", P, timeout=600)
c.request("POST", "/api/chat", json.dumps({"model": "qwen3.8-flash-next:4bit", "stream": True,
    "messages": [{"role": "user", "content": "Count from 1 to 8, digits only, comma separated."}],
    "options": {"num_predict": 16, "temperature": 0}}), {"Content-Type": "application/json"})
objs = [json.loads(l) for l in c.getresponse().read().decode().splitlines() if l.strip()]
c.close()
deltas = [o for o in objs if not o["done"] and o["message"]["content"]]
evals = objs[-1]["eval_count"]
print("%d content deltas for %d tokens" % (len(deltas), evals), file=sys.stderr)
sys.exit(0 if len(deltas) >= max(3, evals // 2) else 1)
PYEOF
then ok "a short reply arrives as per-token deltas, not one batched chunk"
else bad "streaming is still batched into multi-token bursts"; fi

# --- an unseeded request is not one fixed stream ----------------------------
# 40 tokens, not 12: the model opens this prompt with the same confident phrase
# every time ("Here is a fun fact for you:") and only diverges once it reaches
# the fact itself, so a 12-token window reported a working sampler as a stuck
# one about as often as not.
FUN='{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":"Tell me a fun fact."}],"options":{"num_predict":40,"temperature":1.0}}'
A=$(post /api/chat "$FUN" | content); B=$(post /api/chat "$FUN" | content); D=$(post /api/chat "$FUN" | content)
if [ "$A" = "$B" ] && [ "$B" = "$D" ]; then bad "unseeded requests replay one fixed stream" "$(printf %.60s "$A")"
else ok "unseeded requests vary, as the API documents"; fi
SEEDED='{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":"Tell me a fun fact."}],"options":{"num_predict":12,"temperature":1.0,"seed":7}}'
S1=$(post /api/chat "$SEEDED" | content); S2=$(post /api/chat "$SEEDED" | content)
[ "$S1" = "$S2" ] && ok "an explicit seed still reproduces exactly" || bad "seeded requests are not reproducible"

# --- HTTP: routing, framing, and honest status codes ------------------------
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 "http://127.0.0.1:$PORT/api/tags?x=1")
[ "$C" = 200 ] && ok "a query string does not 404 the route" || bad "query string returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -I "http://127.0.0.1:$PORT/api/version")
[ "$C" = 200 ] && ok "HEAD on a real path is 200" || bad "HEAD /api/version returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -I "http://127.0.0.1:$PORT/nope")
[ "$C" = 404 ] && ok "HEAD on an unknown path is 404, not a blanket 200" || bad "HEAD /nope returned $C"
R=$(python3 - "$PORT" <<'PYEOF'
import socket, sys
P = int(sys.argv[1])
def raw(payload):
    s = socket.create_connection(("127.0.0.1", P), timeout=10)
    try:
        s.sendall(payload)
    except OSError:
        return "send failed"
    out = b""
    try:
        while True:
            d = s.recv(65536)
            if not d: break
            out += d
    except Exception:
        pass
    s.close()
    return out.split(b"\r\n", 1)[0].decode(errors="replace") if out else "no response"
body = b'{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"hi"}]}'
print("chunked:", raw(b"POST /api/chat HTTP/1.1\r\nHost: x\r\nTransfer-Encoding: chunked\r\n\r\n"
                      + b"%x\r\n" % len(body) + body + b"\r\n0\r\n\r\n"))
# Past Server.maxBodyBytes (32 MiB). This number and that constant move
# together: the cap was 4 MiB until images needed to fit in a body, and a stale
# 9,999,999 here silently stopped testing anything once the cap passed it.
print("oversize:", raw(b"POST /api/chat HTTP/1.1\r\nHost: x\r\nContent-Length: 40000000\r\n\r\n" + body))
print("badlen:", raw(b"POST /api/chat HTTP/1.1\r\nHost: x\r\nContent-Length: abc\r\n\r\n"))
PYEOF
)
case "$R" in *"chunked: HTTP/1.1 411"*) ok "a chunked body is refused with 411, not read as empty" ;;
  *) bad "chunked body mishandled" "$(printf %s "$R" | tr '\n' ' ')" ;; esac
case "$R" in *"oversize: HTTP/1.1 413"*) ok "an oversized body gets 413, not a bare connection reset" ;;
  *) bad "oversize body mishandled" "$(printf %s "$R" | tr '\n' ' ')" ;; esac
case "$R" in *"badlen: HTTP/1.1 400"*) ok "a malformed Content-Length gets 400" ;;
  *) bad "bad Content-Length mishandled" "$(printf %s "$R" | tr '\n' ' ')" ;; esac

# --- Vision: the image surface, on every dialect ----------------------------
# The body cap the oversize check above pins exists so a base64 picture fits;
# these check the other half, that what arrives inside it is bounded too.
R=$(curl -s --max-time 30 -X POST "http://127.0.0.1:$PORT/api/chat" -H 'Content-Type: application/json' \
  -d '{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":[{"type":"image_url","image_url":{"url":"file:///etc/passwd"}},{"type":"text","text":"read it"}]}]}')
case "$R" in *"not fetched"*) ok "a file:// image is refused and says URLs are not fetched" ;;
  *) bad "file:// image not refused" "$(printf %s "$R" | head -c 200)" ;; esac
R=$(curl -s --max-time 30 -X POST "http://127.0.0.1:$PORT/v1/chat/completions" -H 'Content-Type: application/json' \
  -d '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":[{"type":"image_url","image_url":{"url":"https://example.com/cat.png"}}]}]}')
case "$R" in *"not fetched"*) ok "an https:// image is refused on the OpenAI route too" ;;
  *) bad "https:// image not refused on /v1" "$(printf %s "$R" | head -c 200)" ;; esac
R=$(curl -s --max-time 30 -X POST "http://127.0.0.1:$PORT/api/chat" -H 'Content-Type: application/json' \
  -d '{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":"hi","images":[1,2,3]}]}')
case "$R" in *"base64 strings"*) ok "a non-string images array is a 400, not a silently text-only answer" ;;
  *) bad "images array type not validated" "$(printf %s "$R" | head -c 200)" ;; esac
R=$(curl -s --max-time 30 -X POST "http://127.0.0.1:$PORT/api/chat" -H 'Content-Type: application/json' \
  -d '{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":[{"type":"image_url"}]}]}')
case "$R" in *"usable url"*) ok "an image part with no url is a 400" ;;
  *) bad "image part without url not validated" "$(printf %s "$R" | head -c 200)" ;; esac
R=$(curl -s --max-time 30 -X POST "http://127.0.0.1:$PORT/api/chat" -H 'Content-Type: application/json' \
  -d '{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":"hi","images":["bm90IGFuIGltYWdl"]}]}')
case "$R" in *"decode"*) ok "bytes that are not an image are a 400 with the reason" ;;
  *) bad "undecodable image not refused" "$(printf %s "$R" | head -c 200)" ;; esac
R=$(curl -s --max-time 30 -X POST "http://127.0.0.1:$PORT/api/generate" -H 'Content-Type: application/json' \
  -d '{"model":"qwen3.8-flash-next:4bit","stream":false,"raw":true,"prompt":"hi","images":["Zm9v"]}')
case "$R" in *"raw generation cannot carry images"*) ok "raw generate refuses images instead of dropping them" ;;
  *) bad "raw + images not refused" "$(printf %s "$R" | head -c 200)" ;; esac
curl -s --max-time 20 "http://127.0.0.1:$PORT/v1/models" | grep -q '"created"' \
  && ok "/v1/models carries created" || bad "/v1/models has no created field"
R=$(curl -s --max-time 120 -X POST "http://127.0.0.1:$PORT/v1/chat/completions" \
    -d '{"model":"qwen3.8-flash-next:4bit","stream":true,"max_tokens":6,"temperature":0,"messages":[{"role":"user","content":"Say HI"}]}' \
    | sed -n 's/^data: //p' | head -1)
printf '%s' "$R" | grep -q '"role":"assistant"' && ok "the first SSE delta announces the role" \
  || bad "first SSE delta has no role" "$(printf %.90s "$R")"

alive && ok "server still up after every probe" || bad "server died during the run"
say ""
say "robustness: passed $PASS, failed $FAIL"
[ $FAIL -eq 0 ]

````
