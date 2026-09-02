# The HTTP API

`slotstream serve` listens on **127.0.0.1 only** (port 11434, `--port N`) and
speaks two dialects of the same engine: Ollama-style under `/api/*` and
OpenAI-style under `/v1/*`. There is no auth token: the server can't be
reached from other machines, and browser requests are accepted from loopback
origins only, so a web page you happen to visit can't drive your model.

Validation is strict on purpose. Unknown fields, unsupported features, and
malformed values return a 400 that names the problem; nothing is silently
ignored. A wrong model name is a 400 naming the only model (a 404 on
`/api/show`). The only model name is `qwen3.8-flash-next:4bit`.

## Endpoints

| Endpoint | What it does |
|---|---|
| `POST /api/chat` | Chat completion, Ollama format. Streams by default. |
| `POST /api/generate` | Prompt completion, Ollama format. Streams by default. |
| `POST /v1/chat/completions` | Chat completion, OpenAI format. `stream: false` by default. |
| `GET /v1/models` | The one model, OpenAI list format. |
| `GET /api/tags` | The one model, Ollama list format. |
| `GET /api/ps` | The loaded model and what it is costing in memory right now. |
| `POST /api/show` | Model metadata, including `capabilities`. Fields: `model` (or Ollama's deprecated `name`), optional `verbose`; empty `system`, `template`, and `options` are accepted because the Ollama CLI always sends them, non-empty ones are a 400. |
| `GET /api/version` | `{"version": "..."}` |
| `POST /api/embed`, `/api/embeddings` | 400 — the model does not do embeddings. |
| `POST /api/pull`, `/api/create` | 501 — run `slotstream pull` on the host instead. |

## `/api/chat`

Fields: `model`, `messages`, `stream` (default `true`), `think`
(`true`/`false`), `options`, and `keep_alive`, which is accepted and has no
effect because the model never unloads.

Messages are `{"role", "content"}` with text content; images and `tool_calls`
are rejected. `options` accepts `temperature`, `top_p`, `top_k`, `min_p`,
`presence_penalty`, `num_predict`, `seed`, and `stop` (a string or an array).
A JSON `null` means "not set" for any field, which is what client SDKs send for
one they are not using.

With `think: true` the model reasons before it answers. The reasoning comes
back in `message.thinking` and the answer in `message.content`, streamed and
non-streamed alike; it is never mixed into the answer. A reply that runs out of
tokens mid-reasoning has an empty `content`.

```bash
curl localhost:11434/api/chat -d '{
  "model": "qwen3.8-flash-next:4bit",
  "messages": [{"role": "user", "content": "hello"}],
  "options": {"temperature": 0.2, "seed": 7}
}'
```

## `/api/generate`

Fields: `model`, `prompt`, `system`, `raw`, `stream`, `think`, `keep_alive`,
and the same `options` as chat (`null` counts as none). Empty `suffix` and
`template` are accepted because the Ollama CLI's one-shot mode sends them;
a non-empty suffix (fill-in-the-middle) or template override is a 400. An
`think: true` puts the reasoning in a `thinking` field, separate from
`response`. An empty prompt is Ollama's "load the model" request and is acknowledged with
`done: true, done_reason: "load"` (the same for `/api/chat` with no
messages); the model is always loaded here, so nothing else happens. `raw: true` sends your prompt with no chat template, and
can't be combined with `system` or `think`.

## `/v1/chat/completions`

Fields: `model`, `messages`, `stream`, `temperature`, `top_p`, `top_k`,
`presence_penalty`, `max_tokens` / `max_completion_tokens`, `seed`, `stop`,
and `stream_options` (`{"include_usage": true}`). `top_k` is an extension
beyond the OpenAI schema; the rest is standard. `null` means "not set" for
every field, which is how the OpenAI client serializes an unset `max_tokens`.

Stock SDKs put a few more fields on every call. Each is accepted at the single
value this server already implements and refused at any other, so nothing is
silently dropped: `n: 1`, `frequency_penalty: 0`, `logprobs: false`,
`logit_bias: {}`, `tools: []`, `tool_choice: "none"`,
`parallel_tool_calls: false`, `response_format: {"type": "text"}`, and `user`
(any string; it has no effect here).

```python
from openai import OpenAI

client = OpenAI(base_url="http://localhost:11434/v1", api_key="unused")
r = client.chat.completions.create(
    model="qwen3.8-flash-next:4bit",
    messages=[{"role": "user", "content": "hello"}],
)
print(r.choices[0].message.content)
```

`api_key` can be any string; nothing checks it.

## Sampling defaults

| knob | default |
|---|---|
| `temperature` | 0.7 |
| `top_p` | 0.8 |
| `top_k` | 20 |
| `min_p` | 0 |
| `presence_penalty` | 1.5 |
| `num_predict` / `max_tokens` | 512; `<= 0` means "as many as the context allows" |
| `seed` | random each request |
| `stop` | none |

A request that names no `seed` gets a fresh one, so repeated calls differ;
pass a `seed` to reproduce a reply exactly. An unseeded request used to replay
one fixed stream from the moment the process started, which is why this is
spelled out.

Out-of-range values are clamped into the range the sampler is defined on
rather than erroring: a `top_p` of 0 or a `min_p` above 1 used to empty the
candidate set and make the old sampler emit token 0 forever.

## Streaming

Ollama endpoints stream newline-delimited JSON objects and finish with a
`done: true` object carrying `done_reason` and the token counts
(`prompt_eval_count`, `eval_count`). `/v1` streams SSE `data:` lines ending
with `[DONE]`, and its first delta carries `"role": "assistant"`. A delta is
sent per token, withheld only while a UTF-8 scalar or a stop sequence is still
incomplete. Either way, concatenating every delta reproduces the
non-streamed text exactly — including multi-byte graphemes that merge across
tokens and stop sequences that straddle a token boundary. That equality is a
gated test (`Tools/api_robustness.sh`), not an intention.

## Errors

Ollama dialect: `{"error": "why"}` with 400, 404, or 501. OpenAI dialect:
`{"error": {"message": "..."}}`, with `"type": "invalid_request_error"` added
on validation failures.

Deliberately unsupported, and rejected with a clear 400 rather than ignored:
tool calling, images, JSON-schema output, logprobs, embeddings, and named
reasoning levels for `think`.

A malformed request gets a status line, never a dropped connection: 411 for a
chunked body (send `Content-Length`), 413 for a body over 4 MiB, 431 for
headers over 64 KiB, 503 when too many connections are already open. A query
string does not affect routing, and `HEAD` answers 200 or 404 for the path
actually asked for.

## Limits

Prompt plus completion is capped at 32,768 tokens (`serve --max-context`,
which can only lower it); a request past the cap is refused with a 400 that
names the cap, what it is (the largest context measured so far, not a memory
limit), and the wait that prompt would have cost. Generation is
serialized: a second completion request waits its turn. The metadata
endpoints never take that lock — they read a published snapshot — so
`/api/version`, `/api/tags`, `/api/ps`, `/api/show`, and `/v1/models` answer in
milliseconds while a request is running, and the listener keeps accepting new
connections throughout.
