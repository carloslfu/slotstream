# HTTP API

For client configuration and integration troubleshooting, start with
[Connect apps and agents](CLIENTS.md).

Start the server with `slotstream serve`. It listens on **127.0.0.1:11434**;
use `--port N` to choose another port. It has no authentication, so local
processes can use it. Browser requests must come from an allowed loopback
origin. See [Security](../SECURITY.md).

This page covers the Ollama-style `/api/*` endpoints, the OpenAI-style
`/v1/*` endpoints, and the Anthropic Messages API at `/v1/messages`. For the
AI SDK gateway, see the [fx guide](FX.md). OpenAI tool calling is described
below. The OpenAI tool and reasoning additions require Slotstream 0.2.8 or
later; the Responses API requires Slotstream 0.2.20 or later; the Messages
API requires Slotstream 0.2.21 or later. Use `qwen3.8-flash-next:4bit` as the
model name.

Unknown fields, unsupported features, and malformed values return a 400
error describing the problem, except on `/v1/messages`, which ignores unknown
top-level fields as described there. A wrong model name returns 400, or 404
on `/api/show` and `/v1/messages`. Some client compatibility fields are
accepted without an effect; these are listed below.

## Endpoints

| Endpoint | What it does |
|---|---|
| `POST /api/chat` | Chat completion in Ollama format; streams by default |
| `POST /api/generate` | Prompt completion in Ollama format; streams by default |
| `POST /v1/chat/completions` | Chat completion in OpenAI format; doesn't stream by default |
| `POST /v1/responses` | Response in OpenAI Responses format, the API Codex uses; doesn't stream by default |
| `GET`/`DELETE /v1/responses/{id}` | Returns 404; responses aren't stored |
| `POST /v1/messages` | Message in Anthropic Messages format, the API Claude Code uses; doesn't stream by default |
| `POST /v1/messages/count_tokens` | Counts a Messages request's prompt tokens |
| `GET /v1/models` | Lists the model in OpenAI format |
| `GET /api/tags` | Lists the model in Ollama format |
| `GET /api/ps` | Reports the loaded model and its current memory use |
| `POST /api/show` | Returns model metadata and capabilities |
| `GET /api/version` | Returns `{"version": "..."}` |
| `POST /api/embed`, `/api/embeddings` | Returns 400; embeddings aren't supported |
| `POST /api/pull`, `/api/create` | Returns 501; use `slotstream pull` on the host |
| `GET /slotstream/status` | Reports the server's process, window and use; see [server status](#server-status) |
| `POST /slotstream/clients` | Keeps a server started with `--idle-exit` running while a process runs |

`/api/show` accepts `model` (or the deprecated `name` alias) and optional
`verbose`. Empty `system`, `template`, and `options` fields are accepted for
Ollama CLI compatibility; non-empty overrides return 400.

## `/api/chat`

Accepted fields: `model`, `messages`, `stream` (default `true`), `think`
(boolean), `options`, and `keep_alive`. `keep_alive` has no effect because
the server keeps the model loaded.

Each message has a `role` and `content`, with optional `images`. Content can
be text or an array of supported image/text parts; see [Images](#images).
Tool calls aren't supported on this endpoint. Tool clients should use
`/v1/chat/completions` with OpenAI function definitions and tool-result messages.

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
`top_k`, `min_p`, `presence_penalty`, `max_tokens` / `max_completion_tokens`,
`seed`, `stop`, `stream_options` (`{"include_usage": true}`), `tools`,
`tool_choice`, `parallel_tool_calls`, and `reasoning_effort`. `top_k`,
`min_p`, `think` (boolean), and `options.num_ctx` are slotstream extensions.
Without `max_tokens` or `max_completion_tokens`, a reply may use a quarter of
the served window, at most 8,192 tokens and never more than the room the
prompt leaves. `num_ctx` may lower the
request's prompt-plus-reply budget; it cannot exceed the served context.
JSON `null` is treated as unset.

For SDK compatibility, these fields are accepted only at the listed values:
`n: 1`, `frequency_penalty: 0`, `logprobs: false`, `logit_bias: {}`,
`response_format: {"type": "text"}`. Other values for these options return
400. These are accepted and have no effect, because nothing is stored or
billed: `store: false`, `metadata` (an object of text values), and the text
fields `user`, `prompt_cache_key`, `prompt_cache_retention`,
`safety_identifier` and `service_tier`. `store: true` returns 400: it asks
for a completion to fetch later, and the server keeps none.

Function tools use OpenAI's `{"type":"function","function":{"name":...,
"description":...,"parameters":...}}` shape. The server renders their schemas
with the model's native template and converts complete generated calls into
`message.tool_calls`, each with an `id`, `type: "function"`, and a function
name plus JSON argument string. The finish reason is `tool_calls`. Send the
assistant message back unchanged, followed by a `role: "tool"` message with
the matching `tool_call_id` and textual result. Each outstanding call needs
exactly one result before the next conversation message. Results may arrive
in any order; the adapter matches their IDs and restores call order for the
native model template.

`tool_choice` accepts `auto` (default), `none`, `required`, or a named
function object. A required/named choice is both prompted and checked; an
unsatisfied choice produces an inference error unless the output token budget
was exhausted. `parallel_tool_calls: false`
ends generation after the first complete call. The default allows multiple
calls, with distinct IDs and stream indices. The caller executes tools.
Chat Completions streams a declared string argument while it is generated,
including large file contents. Reassemble `delta.tool_calls` by `index`,
concatenating each function's `arguments` fragments. Calls become complete
only when their closing tags arrive. If the output budget is exhausted,
the reply ends with `finish_reason: "length"`, requested usage, and `[DONE]`,
including when a required tool call has not finished. Partial argument strings
can be incomplete JSON; do not execute them. A completed tool reply ends with
`finish_reason: "tool_calls"`. Non-streaming replies use the same length
semantics. Malformed calls on a normal stop and undeclared function names
produce an inference error. Strict
schema enforcement is unavailable: omit `strict` or use `false`, and validate
arguments in the caller before execution.

`reasoning_effort: "none"` or `"minimal"` disables reasoning. `low`, `medium`,
`high`, `xhigh`, and `max` enable it, using the same model mapping as the
gateway. Reasoning is returned separately in `reasoning_content`, which is
accepted on assistant history messages. A conflicting `think` flag is a 400.
Initial `system` and `developer` instructions are combined in order.

## `/v1/responses`

The OpenAI Responses API, which Codex and newer OpenAI SDK code use. Set the
client's base URL to `http://localhost:11434/v1`; a placeholder API key works.
For Codex, follow the [Codex guide](CODEX.md).

```bash
curl localhost:11434/v1/responses -d '{
  "model": "qwen3.8-flash-next:4bit",
  "instructions": "Answer briefly.",
  "input": "What is 2+2?"
}'
```

Accepted fields: `model`, `input` (text or an array of items),
`instructions`, `tools`, `tool_choice`, `parallel_tool_calls`,
`reasoning.effort`, `max_output_tokens`, `temperature`, `top_p`, and
`stream` (default `false`). JSON `null` is treated as unset.

Input items are `message` (roles `system`, `developer`, `user`, `assistant`;
content as text or `input_text`, `output_text`, and `input_image` parts),
`reasoning`, `function_call`, and `function_call_output` (text, or content
items with text and `input_image` parts). System and developer messages
before the conversation join `instructions`; a later one renders as user
text, which is what Codex does with its own context messages. Function call
outputs may arrive in any order; the adapter matches `call_id` and restores
the call order for the native model template. An `input_image` needs an
inline `image_url` data URL; see [Images](#images).

Tools use the Responses shape, `{"type":"function","name":...,
"description":...,"parameters":...}`. A `namespace` tool is flattened: each
member renders as `namespace.name`, and a call to it is reported with the
`name` and `namespace` fields split again. Hosted `web_search` and
`file_search` tools are dropped because the model cannot run them. Other
tool types, `strict: true`, and the `text.format` constrained-output
setting return 400, as on `/v1/chat/completions`. `tool_choice` accepts
`auto`, `none`, `required`, `{"type": "function", "name": ...}`, or
`{"type": "custom", "name": ...}` for a freeform tool; `allowed_tools`
returns 400.

Accepted without effect, because the server has nothing to change:
`store` (nothing is stored either way), `include`, `metadata`,
`prompt_cache_key`, `prompt_cache_retention`, `safety_identifier`, `user`,
`service_tier`, `stream_options`, `text.verbosity`, `truncation:
"disabled"`, and the Codex fields `client_metadata` and `access_programs`.
Refused with 400: `previous_response_id` and `conversation` (no responses are
stored, so every request carries its whole conversation), `background:
true`, `prompt` templates, `context_management`, `max_tool_calls`,
`top_logprobs`, `truncation: "auto"`, `input_file` and `input_audio` parts,
`file_id` images, encrypted reasoning or tool output from another provider,
and an input that ends with an assistant item.

`reasoning.effort` uses the same mapping as `reasoning_effort` on the chat
endpoint: `none` and `minimal` disable thinking, the other levels enable it.
The model's reasoning streams as `reasoning_summary_text` deltas and is
returned as the reasoning item's `summary`, which clients echo back on the
next turn. Without `max_output_tokens` the reply budget is the
`max_output_tokens` value `/v1/models` reports, a quarter of the served window
up to 8,192 tokens, bounded by the room the prompt leaves.

The response object, returned whole without `stream` and carried by the
`response.created` and `response.completed` events, has `id`, `status`,
`model`, `output`, and `usage`, and repeats the request's `tools`,
`tool_choice`, `parallel_tool_calls`, `instructions`, `temperature`,
`top_p`, `max_output_tokens`, `reasoning`, and `text` as the API does. It
reports `store: false` and a null `previous_response_id` because nothing is
kept.

A streamed reply is Server-Sent Events, each with an `event:` line and a
`data:` line: `response.created`, `response.in_progress`,
`response.output_item.added` and `.done`, `response.content_part.added` and
`.done`, `response.output_text.delta` and `.done`,
`response.reasoning_summary_part.added`, `.delta` and `.done`,
`response.function_call_arguments.delta` and `.done`, and
`response.completed` with `usage`. During a long prompt read the server sends
a `response.in_progress` event every 10 seconds, because Codex's idle timeout
counts events rather than bytes. Running out of tokens before the reply ends
is `response.incomplete` with `incomplete_details.reason:
"max_output_tokens"`, unless a complete function call was already delivered,
in which case the response completes. An inference failure after the stream
starts is a `response.failed` event carrying `error.code` and `error.message`,
with no `response.completed` after it. Function calls are delivered whole:
`response.output_item.added`, one arguments delta, `arguments.done`, and
`output_item.done`, only once the model's call block is complete.

## `/v1/messages`

The Anthropic Messages API, which Claude Code and the Anthropic SDKs use. Set
the client's base URL to `http://127.0.0.1:11434`, without `/v1`; any API key
or token works. For Claude Code, follow the [Claude Code guide](CLAUDE-CODE.md).

```bash
curl localhost:11434/v1/messages -H 'content-type: application/json' -d '{
  "model": "qwen3.8-flash-next:4bit",
  "max_tokens": 256,
  "messages": [{"role": "user", "content": "What is 2+2?"}]
}'
```

With the Python SDK:

```python
import anthropic

client = anthropic.Anthropic(base_url="http://127.0.0.1:11434", api_key="unused")
reply = client.messages.create(
    model="qwen3.8-flash-next:4bit",
    max_tokens=256,
    messages=[{"role": "user", "content": "Hello"}],
)
print(reply.content[0].text)
```

Accepted fields: `model`, `messages`, `max_tokens` (required), `system` (text
or text blocks), `stop_sequences`, `stream` (default `false`), `temperature`,
`top_p`, `top_k`, `tools`, `tool_choice`, `thinking`, and
`output_config.effort`. JSON `null` is treated as unset. `metadata`,
`context_management` and `service_tier` are accepted without effect.
`container`, `mcp_servers` and `output_config.format` return 400, because
they ask for work this server cannot do.

Other top-level fields are ignored rather than refused, because Claude Code
adds request fields in most releases. The reply names them in an
`X-Slotstream-Ignored-Fields` header, and the server's output, in its window
or its log, names each one once. Inside messages and tools, an unknown content block type or tool
type returns 400, and other fields, such as `cache_control`, are ignored.
Headers such as `anthropic-version` and `anthropic-beta` are not required
and have no effect.

Messages alternate between `user` and `assistant`; consecutive assistant
messages are joined. User content is text or blocks: `text`, `image` (a
`base64` source in JPEG, PNG, GIF or WebP; see [Images](#images)),
`document`, `search_result` (read as its title, source and text), and
`tool_result`. A `document` with a plain-text source is read inline; a PDF,
URL or file document is replaced by a note telling the model it cannot see
it, so the conversation can go on. Assistant content is
`text`, `thinking`, `redacted_thinking` (skipped, since it is encrypted by
another provider) and `tool_use`. A `system` message before the conversation
joins `system`; a later one renders as user text, which is where Claude Code
puts its environment details. Its `tool_addition` and `tool_removal` blocks
are skipped, and any other non-text block returns 400. `cache_control`
markers have no effect: the server reuses prompts on its own. Image `url` and
`file` sources return 400, and so does a conversation that ends with an
assistant message, except in a token count.

Every `tool_use` needs a `tool_result` with its id in the next user message,
and the results may come in any order. A result's content is text or `text`,
`image`, `document`, `search_result` and `tool_reference` blocks (read as
`Tool available: <name>`); `is_error: true` prefixes the text with `Error:`.
Tools use `name`, `description` and `input_schema`. Server tools the API runs
itself, such as `web_search`, `code_execution` and `advisor`, are dropped
because the model cannot run them, and a `tool_choice` that names one returns
400; other typed tools return 400. `strict` is
accepted but not enforced: calls are checked to be complete JSON objects,
not validated against the schema. `tool_choice` accepts `auto`, `any`,
`none`, and `{"type": "tool", "name": ...}`, with
`disable_parallel_tool_use`, and is prompted and checked as on
`/v1/chat/completions`.

Thinking is off unless `thinking` asks for it. `{"type": "adaptive"}` turns
it on at `output_config.effort` (`high` when absent), and `{"type":
"enabled", "budget_tokens": N}` at an effort chosen from the budget; both use
the same model mapping as `reasoning_effort` on the chat endpoint.
`{"type": "disabled"}` turns it off. `display: "omitted"` returns thinking
blocks with empty text; any other `display` value shows it. Each thinking block carries a `signature` that holds
its reasoning, so a client that sends the block back, even with its text
omitted as Claude Code does, gives the model its earlier reasoning.

Without a stop, the reply ends with `stop_reason` `end_turn`, or `tool_use`
after a complete tool call, `max_tokens` when the budget runs out, or
`stop_sequence` with the matched `stop_sequence`. When `max_tokens` was
larger than the room the prompt left in the window and the reply filled that
room, the reason is `model_context_window_exceeded` instead of
`max_tokens`. `usage` reports
`input_tokens` (the prompt tokens read for this request),
`cache_read_input_tokens` (the tokens reused from an earlier request),
`cache_creation_input_tokens` (always 0) and `output_tokens`; the first two
add up to the whole prompt.

A streamed reply is Server-Sent Events in Anthropic's order:
`message_start` (sent once the request is admitted), `ping`,
`content_block_start`, `content_block_delta` (`thinking_delta`,
`signature_delta`, `text_delta` or `input_json_delta`), `content_block_stop`,
`message_delta` with `stop_reason` and `usage`, and `message_stop`. During a
long prompt read the server sends a `ping` every 10 seconds, or, while a
thinking block with omitted text is open, an empty `thinking_delta`.
`message_start` reports the prompt tokens read and reused for the request. A tool call is
delivered whole: its start, one `input_json_delta` with the complete input,
and its stop, once the model's call block is complete. An inference failure
after the stream starts is an `error` event, and nothing follows it.

Errors use Anthropic's shape, `{"type": "error", "error": {"type": ...,
"message": ...}}`, with `invalid_request_error` for 400, `not_found_error`
for 404, `request_too_large` for 413, `api_error` for 500, and
`overloaded_error` for 503. A prompt longer than the served window fails
with `prompt is too long: N tokens > M maximum`, the message Claude Code
reads to compact its conversation.

`POST /v1/messages/count_tokens` takes the same body without `max_tokens`
and returns `{"input_tokens": N}`: the prompt the model would read, with the
same template, tools, thinking setting and images. It needs no generation and
answers while another request runs.

## Sampling defaults

The table applies to ordinary chat. Tool-enabled requests default to temperature
0.2, top_p 0.9 and presence_penalty 0 to preserve the repeated tool grammar.
Reasoning without tools uses the existing thinking profile. Explicit request
values override these defaults.

| Option | Default |
|---|---|
| `temperature` | 0.7 |
| `top_p` | 0.8 |
| `top_k` | 20 |
| `min_p` | 0 |
| `presence_penalty` | 1.5 |
| `num_predict` / `max_tokens` | 512 on the Ollama endpoints; a nonpositive `num_predict` uses the remaining context. On `/v1/chat/completions` and `/v1/responses`, a quarter of the served window, at most 8,192 tokens; their output limits must be positive. |
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

Tool streams carry `delta.tool_calls` with an `index`, ID, function name and
complete argument string. The final choice has `finish_reason: "tool_calls"`.
Reasoning uses `delta.reasoning_content`; it is excluded from answer text.
An inference error after streaming starts is an SSE `error` object followed
by connection termination, without a successful finish or `[DONE]` marker.

## Images

Every API accepts images, using these request shapes:

| API | Image field |
|---|---|
| Ollama chat | `images: [base64]` on the user message |
| Ollama generate | `images: [base64]` on the request |
| OpenAI chat | An `image_url` content part with a `data:` URL |
| OpenAI Responses | An `input_image` part with an `image_url` data URL, in a message or a `function_call_output` |
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
the shared context, which a request with images may fill up to 65,536 tokens. The decoded image file must be at most
24 MiB, with an aspect ratio no greater than 200:1.

The vision tower uses 0.9 GB and loads on the first image request. For auto
and `--memory-gb` plans, that reservation stays inside the original process
target, reducing expert capacity as needed. Explicit pool-size settings retain
their pool and add the resident cost to the expected footprint.
Image attention and decoded pixels also need workspace;
a request is rejected before dispatch if its budget or real headroom is insufficient.
`serve --vision off` disables images. Follow-up turns reuse image state while
the matching conversation remains cached; image identity is checked by a
digest of its bytes.

<a id="server-status"></a>

## Server status and idle stop

These endpoints are available starting in Slotstream 0.2.21. `slotstream
launch` and `slotstream stop` use them to find the server's process and to
see whether it is in use.

`GET /slotstream/status` returns:

```json
{
  "server": "slotstream",
  "version": "0.2.21",
  "pid": 4242,
  "port": 11434,
  "model": "qwen3.8-flash-next:4bit",
  "context_window": 32768,
  "started_at": 1789660800,
  "active_requests": 0,
  "clients": 1,
  "idle_seconds": 0,
  "idle_exit_minutes": 30,
  "memory_source": "--memory-gb",
  "memory_target_gb": 12
}
```

`started_at` is in Unix seconds. `active_requests` counts requests being
handled, other than status checks. `clients` counts registered processes
still running. `idle_seconds` is how long the server has had neither, and 0
while it has either. `idle_exit_minutes` is the `serve --idle-exit` setting,
or `null` when the server does not stop by itself. `memory_source` says what
sized the memory plan (`--memory-gb`, `auto`, `--pool-gb` or
`--experts-per-layer`) and `memory_target_gb` the whole-process target, or
`null` for a plan without one. Reading the status is not activity.

The development version also reports `memory_limit_gb`: the saved adaptive
ceiling, or `null` when none was selected. Adaptive plans still use
`memory_source: "auto"`; their current `memory_target_gb` can be lower than
the saved limit while other apps need memory.

`POST /slotstream/clients` with `{"pid": 4242}` registers a running process
of the user the server runs as, and returns `{"clients": 1}`, the number
registered. A server started with `--idle-exit` keeps running while any
registered process runs, and counts from the last one's exit. A pid that is
not a positive process id, or not a running process of that user, returns
400. `slotstream launch` registers the agent it starts this way.

Once a server with `--idle-exit` has decided to stop, every request other
than the status returns 503 with `the server is stopping`, and the process
exits. A request that is running when the server decides has already made it
not idle, so the stop never interrupts one. `slotstream stop` sends the
process `SIGTERM`, which stops it at once, also during a request.

<a id="errors"></a>
<a id="limits"></a>

## Errors and limits

Ollama errors use `{"error": "message"}`. OpenAI errors use
`{"error": {"message": "..."}}`; validation failures also include
`"type": "invalid_request_error"`. Anthropic errors use the shape described
under [`/v1/messages`](#v1messages).

| Status | Meaning |
|---|---|
| 400 | Invalid or unsupported request, including tools on the Ollama endpoints, JSON-schema output, strict tool schemas, logprobs, embeddings, or named reasoning levels for `think` |
| 500 | Inference failure, including an incomplete generated tool call or unsatisfied required tool choice |
| 411 | Chunked request body; send `Content-Length` instead |
| 413 | Request body exceeds 32 MiB |
| 431 | Request headers exceed 64 KiB |
| 503 | Too many open connections, insufficient memory, an expired request-to-first-token deadline, including a request that waited behind others until its prefill no longer fit the wait budget, or a server that is [stopping by itself](#server-status) |

A query string doesn't affect routing. `HEAD` returns 200 or 404 for the
requested path.

Prompt plus completion is capped by the served window. By default the server
picks it for the Mac: 32,768 tokens through 32 GB of RAM, 65,536 at 36 GB,
32,768 at 48 GB, 131,072 at 64 GB and 262,144 from 96 GB, or less on a Mac
that is busy at startup. Use `serve --max-context 65536` to fix a
65,536-token window, or any size from 1 to 262,144. Requests with images stay
within 65,536 tokens. The
planner charges extra state and transient memory before allocating the pool.
A prompt over the configured cap returns 400 with the actual limit. A known
prefill estimate can also refuse work that exceeds the remaining wait budget. `/v1/models` and `/api/show` report the actual served window;
the model's training window must not be used as the request limit.

Generation requests run one at a time; a second waits for the first. Metadata
endpoints read a separate snapshot and remain responsive during generation.

The server log identifies each accepted request and periodically reports its
elapsed time and current guarded phase, including prompt preparation and
waiting for inference. Cache diagnostics say whether memory or disk supplied
the prefix, or why retained state could not be reused. Exact token prefixes,
compatible prefill boundaries and available memory remain required; a saved
state does not guarantee a cache hit for a changed prompt.
The disk cache also retains the exact generated token IDs needed to reconstruct
history when a client omits reasoning. These IDs share the checkpoint's quota,
expiry and deletion rules; the reusable numerical state still ends at its
original prefill boundary.

Prefill progress reports completed passes by elapsed time. Its remaining-time
estimate uses recent throughput, so a slow tail replaces the faster early
rate. The initial plan estimate cannot predict other applications' memory or
SSD contention. A stalled pass still appears in the request-phase heartbeat.
Socket output failures are logged separately from request completion.

## Request deadlines and resource failures

The request policy and structured resource failures in this section are
available starting in Slotstream 0.2.14.

`--max-prefill-wait` bounds the interval from accepting a complete request to
sampling its first model token. Its default is 30 minutes; `0` disables only
time. Upload and model startup are outside this clock; queueing, prompt
preparation, image work and prefill are inside it. Decode after the first token
remains subject to memory and cancellation checks. SSE keepalives preserve
transport liveness and never reset the clock.

Admission resolves the current memory plan and exact reusable prefix while
holding the generation gate. It prices missing input from its absolute position;
an unknown estimate stays unknown. `/api/show`, `/v1/models` and the gateway
catalog expose an additive `context_policy` with configured, model and qualified
mode limits. `doctor --json` additionally computes memory feasibility, which is
independent of the wait policy.

| Code | Before streaming headers | Action |
|---|---|---|
| `context_length_exceeded` | 400 | Send less input or restart with a supported larger window. |
| `prefill_wait_exceeded` | 400 | The estimated prefill alone exceeds the wait budget. Reduce missing input, reuse a valid prefix or raise the wait budget. |
| `insufficient_memory` | 503 | Free memory, lower the target/context, or resize an image. |
| `prefill_deadline_exceeded` | 503 | The deadline passed, or the request waited behind others until its estimated prefill no longer fit. Retry when the server is free, with less work, or with a deliberate longer wait budget. |
| `inference_error` | 500 | Inspect the error and retry after correcting its cause. |

After headers, failures use the dialect's terminal error frame and close the
stream. They never emit a successful OpenAI finish or `[DONE]`, Ollama
`done: true`, or gateway success terminal. Disconnection stops bounded work.
A tool proposal from an errored, truncated or incomplete turn is not a completed
tool request; receiving clients must require successful termination before
executing it. The engine's strict consumer fixture covers its wire contract;
application-side tool authority remains the receiver's responsibility.

Memory checks precede the next bounded allocation and leave safety headroom.
They cannot prevent another application from allocating between checks. The
engine joins readers and synchronizes GPU users before releasing request pins,
and failed state is not reused. A subsequent request either succeeds or receives
an explicit still-unavailable error.
