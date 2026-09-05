# HTTP API

Start the server with `slotstream serve`. It listens on **127.0.0.1:11434**;
use `--port N` to choose another port. It has no authentication, so local
processes can use it. Browser requests must come from an allowed loopback
origin. See [Security](../SECURITY.md).

This page covers the Ollama-style `/api/*` and OpenAI-style `/v1/*` endpoints.
For the AI SDK gateway and tool calling, see the [fx guide](FX.md).
Use `qwen3.8-flash-next:4bit` as the model name.

Unknown fields, unsupported features, and malformed values return a 400
error describing the problem. A wrong model name returns 400, or 404 on
`/api/show`. Some client compatibility fields are accepted without an effect;
these are listed below.

## Endpoints

| Endpoint | What it does |
|---|---|
| `POST /api/chat` | Chat completion in Ollama format; streams by default |
| `POST /api/generate` | Prompt completion in Ollama format; streams by default |
| `POST /v1/chat/completions` | Chat completion in OpenAI format; doesn't stream by default |
| `GET /v1/models` | Lists the model in OpenAI format |
| `GET /api/tags` | Lists the model in Ollama format |
| `GET /api/ps` | Reports the loaded model and its current memory use |
| `POST /api/show` | Returns model metadata and capabilities |
| `GET /api/version` | Returns `{"version": "..."}` |
| `POST /api/embed`, `/api/embeddings` | Returns 400; embeddings aren't supported |
| `POST /api/pull`, `/api/create` | Returns 501; use `slotstream pull` on the host |

`/api/show` accepts `model` (or the deprecated `name` alias) and optional
`verbose`. Empty `system`, `template`, and `options` fields are accepted for
Ollama CLI compatibility; non-empty overrides return 400.

## `/api/chat`

Accepted fields: `model`, `messages`, `stream` (default `true`), `think`
(boolean), `options`, and `keep_alive`. `keep_alive` has no effect because
the server keeps the model loaded.

Each message has a `role` and `content`, with optional `images`. Content can
be text or an array of supported image/text parts; see [Images](#images).
Tool calls aren't supported on this endpoint.

```bash
curl localhost:11434/api/chat -d '{
  "model": "qwen3.8-flash-next:4bit",
  "messages": [{"role": "user", "content": "Hello"}],
  "stream": false,
  "options": {"temperature": 0.2, "seed": 7}
}'
```

`options` accepts `temperature`, `top_p`, `top_k`, `min_p`,
`presence_penalty`, `num_predict`, `seed`, and `stop` (a string or array).
JSON `null` is treated as an unset field.

With `think: true`, reasoning appears in `message.thinking` and the answer
in `message.content`, for both streamed and complete responses. If the token
budget runs out during reasoning, `content` is empty.

## `/api/generate`

Accepted fields: `model`, `prompt`, `system`, `raw`, `stream`, `think`,
`images`, `keep_alive`, and the same `options` as chat. Empty `suffix` and
`template` fields are accepted for Ollama CLI compatibility. A non-empty
suffix or template override returns 400.

`think: true` returns reasoning in `thinking` and the answer in `response`.
`raw: true` sends the prompt without the chat template and can't be combined
with a system prompt, thinking, or images.

An empty prompt acknowledges Ollama's load request with
`done: true, done_reason: "load"`. `/api/chat` does the same for an empty
message list. The model is already loaded in either case.

## `/v1/chat/completions`

Set an OpenAI-compatible client's base URL to `http://localhost:11434/v1`.
If it requires an API key, use any placeholder string. For example, with the
Python OpenAI SDK installed:

```python
from openai import OpenAI

client = OpenAI(base_url="http://localhost:11434/v1", api_key="unused")
reply = client.chat.completions.create(
    model="qwen3.8-flash-next:4bit",
    messages=[{"role": "user", "content": "Hello"}],
)
print(reply.choices[0].message.content)
```

Accepted fields: `model`, `messages`, `stream`, `temperature`, `top_p`,
`top_k`, `presence_penalty`, `max_tokens` / `max_completion_tokens`, `seed`,
`stop`, and `stream_options` (`{"include_usage": true}`). `top_k` is a
slotstream extension. JSON `null` is treated as unset.

For SDK compatibility, these fields are accepted only at the listed values:
`n: 1`, `frequency_penalty: 0`, `logprobs: false`, `logit_bias: {}`,
`tools: []`, `tool_choice: "none"`, `parallel_tool_calls: false`, and
`response_format: {"type": "text"}`. `user` accepts any string and has no
effect. Other values for these options return 400.

## Sampling defaults

| Option | Default |
|---|---|
| `temperature` | 0.7 |
| `top_p` | 0.8 |
| `top_k` | 20 |
| `min_p` | 0 |
| `presence_penalty` | 1.5 |
| `num_predict` / `max_tokens` | 512; `<= 0` uses the remaining context |
| `seed` | Random for each request |
| `stop` | None |

Set `seed` for reproducible sampling. For comparisons, keep the model,
prompt, and generation settings fixed and start the server with
`--no-prefix-cache`: reusing conversation state can change nearly tied
outputs. Out-of-range sampling values are clamped to supported ranges.

## Streaming

Ollama endpoints stream newline-delimited JSON. The final object has
`done: true`, `done_reason`, `prompt_eval_count`, and `eval_count`.

The OpenAI endpoint streams Server-Sent Events (SSE) as `data:` lines ending
with `[DONE]`. Its first delta includes `"role": "assistant"`.

Text is sent incrementally. Incomplete UTF-8 characters and possible stop
sequences are held back until resolved. Concatenating the text deltas gives
the same text as a non-streamed response under the same generation
conditions; `Tools/api_robustness.sh` checks this.

## Images

All three APIs accept images, using these request shapes:

| API | Image field |
|---|---|
| Ollama chat | `images: [base64]` on the user message |
| Ollama generate | `images: [base64]` on the request |
| OpenAI chat | An `image_url` content part with a `data:` URL |
| AI SDK gateway | A `file` part with an `image/*` media type and inline `data` |

This Python 3 example sends `cat.jpg` to the Ollama chat endpoint. It uses
only the standard library:

```python
import base64
import json
from pathlib import Path
from urllib.request import Request, urlopen

image = base64.b64encode(Path("cat.jpg").read_bytes()).decode("ascii")
body = {
    "model": "qwen3.8-flash-next:4bit",
    "messages": [{"role": "user", "content": "What is in this picture?",
                  "images": [image]}],
    "stream": False,
}
request = Request(
    "http://localhost:11434/api/chat",
    data=json.dumps(body).encode(),
    headers={"Content-Type": "application/json"},
)
with urlopen(request) as response:
    print(json.load(response)["message"]["content"])
```

For the OpenAI endpoint, replace the message above with:

```python
{"role": "user", "content": [
    {"type": "image_url", "image_url": {"url": "data:image/jpeg;base64," + image}},
    {"type": "text", "text": "What is in this picture?"},
]}
```

Send it to `/v1/chat/completions` and read
`choices[0].message.content` from the JSON response. Use a media type that
matches your image. From the terminal, `slotstream run --image cat.jpg
--prompt "What is in this picture?"` is the shorter option.

The server accepts **inline bytes only**, as bare base64 or a `data:` URL.
It rejects `http://`, `https://`, and `file://` URLs. It applies EXIF
orientation, composites transparency onto white, and rejects truncated files.

Each resized image uses one token per 32×32 pixels, up to 2,304 tokens, from
the shared 32,768-token context. The decoded image file must be at most
24 MiB, with an aspect ratio no greater than 200:1.

The vision tower uses 0.9 GB and loads on the first image request, in addition
to the text memory plan. A request is rejected if there's insufficient room.
`serve --vision off` disables images. Follow-up turns reuse image state while
the matching conversation remains cached; image identity is checked by a
digest of its bytes.

<a id="errors"></a>
<a id="limits"></a>

## Errors and limits

Ollama errors use `{"error": "message"}`. OpenAI errors use
`{"error": {"message": "..."}}`; validation failures also include
`"type": "invalid_request_error"`.

| Status | Meaning |
|---|---|
| 400 | Invalid or unsupported request, including tools on the Ollama/OpenAI endpoints, JSON-schema output, logprobs, embeddings, or named reasoning levels for `think` |
| 411 | Chunked request body; send `Content-Length` instead |
| 413 | Request body exceeds 32 MiB |
| 431 | Request headers exceed 64 KiB |
| 503 | Too many open connections |

A query string doesn't affect routing. `HEAD` returns 200 or 404 for the
requested path.

Prompt plus completion is capped at 32,768 tokens. `serve --max-context N`
can lower that ceiling. A prompt over the cap returns 400 with the limit and
an estimated processing time.

Generation requests run one at a time; a second waits for the first. Metadata
endpoints read a separate snapshot and remain responsive during generation.
