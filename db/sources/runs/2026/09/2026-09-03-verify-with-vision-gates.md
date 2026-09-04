---
type: run
created: 2026-09-04T00:20:00-05:00
updated: 2026-09-04T00:20:00-05:00
captured_at: 2026-09-04T00:20:00-05:00
summary: 'verify.sh with the vision gates: 23 passed, 1 failed — the serving suite''s server was killed by the kernel while an unrelated slotstream serve held the machine.'
command: bash Tools/verify.sh
binary: local release build of main + vision (post-0.2.6), .build/release/slotstream
tool: verify
discarded: false
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: verify.sh with the vision gates, dev Mac, 2026-09-03
note: 'The single failure is environmental and recorded as such: the kernel killed the suite''s server (Killed: 9) with 0.34 GB free and swap nearly full, because a second, user-started `slotstream serve` at the auto target was running at the same time. The gate now reads reclaimable memory first and skips with the re-run command. The same suite passed 18/18 twice, standalone, at --memory-gb 10.'
---

Full transcript. Vision parity and the serving suite are at the end.

```
== build ==
== weights provenance (hashes all 105.3 GB vs the pinned revisions; the draft head is optional) ==
PASS  pull --verify: 25/25 files match
== goldens (need bench/parity31 from Tools/parity_ref.py under mlx==0.31.1) ==
PASS  ngram row ids == python reference
PASS  chat template == transformers
PASS  layer parity (0-1 bit-exact gate)
== planner: right thing across machine setups (simulated, no model needed) ==
PASS  48GB pristine: 33.0 GB target and starts quiet
PASS  48GB busy: clamped to 15.4 GB, sized-down note
PASS  16GB pristine: 9.8 GB target, no notes
PASS  16GB busy: floor 8.1 GB + heavy-paging warning
PASS  8GB Mac: floor 8.1 GB + too-small warning
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
PASS  explicit 30GB on busy 48: honored + info note
PASS  --experts-per-layer 0 refused
PASS  --pool-gb 0 refused
PASS  --memory-gb below minimum refused
PASS  --memory-gb inf is a clean error
PASS  --pool-gb inf is a clean error
PASS  --pool-gb 1e300 saturates safely instead of trapping
PASS  --memory-gb 1e300 plans safely instead of trapping
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
PASS  prefill-schedule: bounded, floored, monotone
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
PASS  sampler == numpy reference: high temp, large vocab
PASS  seeded sampling is reproducible and seed-sensitive
PASS  elastic governor policy (20 branches)
sampler + governor: passed 16, failed 0
PASS  sampler + governor gates
== golden equivalence: streaming must not change the math ==
PASS  8.1 GB cache output == 10 GB cache output
== elastic pool: live resizes must not change the math ==
PASS  grow/shrink/regrow byte-identical (elastic-check)
== elastic governor: shrinks, honors the cooldown, grows back ==
PASS  ELASTIC DRILL PASS: governor shrank under simulated pressure, honored the grow cooldown, grew back when memory returned, and every generation was byte-identical
== conversation prefix cache: bounded, flat with depth, deterministic ==
PASS  prefix reuse within the prefill-rechunk control (prefix-check)
== prefill sweep: matches the pool path, deterministic, blind to the pool ==
PASS  sweep within the prefill-rechunk control, identical cold and warm (sweep-check)
== MTP draft head: parity with the Python reference + speculative gates ==
PASS  mtp head bit-parity vs Python reference (mtp-parity)
PASS  speculative decode gates (determinism, state integrity, accept sanity)
== memory target keeps its promise ==
PASS  --memory-gb 10 process RSS peak (6.4 GB) stays under target
PASS  --memory-gb 10 output is stable
PASS  --memory-gb 10 RSS peak (7.3 GB) under target on a 7,960-token prompt
PASS  long-context answer still correct (sparse indexer active)
PASS  context-check: 2k rung reads inside the plan and reports it
== serving robustness (inputs that used to crash or corrupt output) ==
== behavioural sanity: has the conversion lost anything obvious? ==
== factual recall ==
PASS  capital of France
PASS  author of Hamlet
PASS  symbol for gold
PASS  continent count
== arithmetic and reasoning ==
PASS  17x23
PASS  elapsed time
PASS  multi-step arithmetic
PASS  sorting
PASS  decimal comparison
== instruction following ==
PASS  exact-word obedience
PASS  list format
PASS  yes/no obedience
== language and code ==
PASS  translation
PASS  python one-liner
PASS  cloze completion

quality probe: passed 15, failed 0
PASS  behavioural quality probe (15 items)
== weights behind a symlink (Foundation will not list a symlinked dir) ==
PASS  run through a symlinked model dir
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
PASS  over-length prompt is refused with a 400, not a silent stall
PASS  /api/version (0.2.6) matches the binary
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
16 content deltas for 16 tokens
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

robustness: passed 74, failed 0
PASS  serving robustness suite
== vision ==
PASS  vision tower dumps its pixels and embeddings
  swift        vs mlx  f32:  cosine 0.99870270  worst token 0.919064
  swift        vs mlx  bf16:  cosine 0.99878263  worst token 0.950250
  mlx bf16     vs numpy f32:  cosine 0.99840382  worst token 0.839186
  mlx f32      vs numpy f32:  cosine 0.99996241  worst token 0.997329
  float32 implementations agree      True
  slotstream inside the dtype band   True
  slotstream matches bf16 reference  True
VISION PARITY PASS
PASS  vision tower matches the float32 reference within the bf16 band
PASS  ollama /api/chat answers an image request
PASS  and it recognises the dog
      -> 'Dog nose close up' in 18.0s, 725 prompt tokens
PASS  the picture is worth its 702 placeholder tokens, plus the two sentinels
FAIL  /v1/chat/completions answers an image_url part
FAIL  and it sees the fruit on the tree
      -> ''
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/vision_serving.py", line 293, in <module>
    sys.exit(main())
             ^^^^^^
  File "/Users/carlos/Projects/slotstream/Tools/vision_serving.py", line 177, in main
    st, text = post(
               ^^^^^
  File "/Users/carlos/Projects/slotstream/Tools/vision_serving.py", line 57, in post
    s = socket.create_connection(("127.0.0.1", port), timeout=timeout)
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/Users/carlos/.pyenv/versions/3.12.9/lib/python3.12/socket.py", line 865, in create_connection
    raise exceptions[0]
  File "/Users/carlos/.pyenv/versions/3.12.9/lib/python3.12/socket.py", line 850, in create_connection
    sock.connect(sa)
ConnectionRefusedError: [Errno 61] Connection refused
Tools/verify.sh: line 212: 48663 Killed: 9               "$BIN" serve --memory-gb $BIG_MEMORY --port 11468 > /tmp/ssv-vision-serve.log 2>&1
FAIL  vision serving suite

passed 23, failed 1

```

## Standalone vision parity, before the battery

```
loading the vision tower from /Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit
  333 tensors
reference forward over 2808 patches (grid 52x54) ...
  tokens          702 x 2560
  mean |ref|      0.031092
  swift        vs numpy f32:  cosine 0.99870620  worst token 0.898964
  swift        vs mlx  f32:  cosine 0.99870270  worst token 0.919064
  swift        vs mlx  bf16:  cosine 0.99878263  worst token 0.950250
  mlx bf16     vs numpy f32:  cosine 0.99840382  worst token 0.839186
  mlx f32      vs numpy f32:  cosine 0.99996241  worst token 0.997329
  float32 implementations agree      True
  slotstream inside the dtype band   True
  slotstream matches bf16 reference  True
VISION PARITY PASS
```
