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
| `GET /api/ps` | The loaded model and its memory. |
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
empty prompt is Ollama's "load the model" request and is acknowledged with
`done: true, done_reason: "load"` (the same for `/api/chat` with no
messages); the model is always loaded here, so nothing else happens. `raw: true` sends your prompt with no chat template, and
can't be combined with `system` or `think`.

## `/v1/chat/completions`

Fields: `model`, `messages`, `stream`, `temperature`, `top_p`, `top_k`,
`presence_penalty`, `max_tokens` / `max_completion_tokens`, `seed`, `stop`,
and `stream_options` (`{"include_usage": true}`). `top_k` is an extension
beyond the OpenAI schema; the rest is standard.

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

Out-of-range values are clamped into the range the sampler is defined on
rather than erroring: a `top_p` of 0 or a `min_p` above 1 used to empty the
candidate set and make the old sampler emit token 0 forever.

## Streaming

Ollama endpoints stream newline-delimited JSON objects and finish with a
`done: true` object carrying `done_reason` and the token counts
(`prompt_eval_count`, `eval_count`). `/v1` streams SSE `data:` lines ending
with `[DONE]`. Either way, concatenating every delta reproduces the
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

## Limits

Prompt plus completion is capped at 32,768 tokens (`serve --max-context`);
a request past the cap is refused rather than left to stall. Generation is
serialized: a second completion request waits its turn, while the metadata
endpoints answer immediately even mid-generation.
