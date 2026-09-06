# Connect apps and agents to Slotstream

Slotstream supplies the local model through an HTTP API. Your chat app or agent
is installed separately; an agent executes its own tools and sends their results
back to Slotstream. Choose the API that your client implements, then use the
matching connection settings below.

## Choose a connection

| Client | Connection type | Setup |
|---|---|---|
| Hermes | Custom provider using OpenAI Chat Completions | [Hermes guide](HERMES.md), including its context, timeout, and summary settings |
| Other clients with OpenAI-compatible chat or function tools | OpenAI Chat Completions | [Common settings](#openai-compatible-clients) below, then check the client's supported features |
| Open WebUI or the Ollama CLI | Ollama-compatible chat | [Ollama settings](#ollama-compatible-clients) below |
| fx | AI SDK gateway | [fx guide](FX.md), including permission-review and compaction limits |

OpenAI function tools and reasoning support require **Slotstream 0.2.8 or
later**. Run the [installer](../README.md#install) again to update, then confirm
`slotstream --version` and restart the server. See the [changelog](../CHANGELOG.md)
for the release history.

## Start one server

For ordinary chat, start the installed server and leave it running:

```sh
slotstream serve
```

If you built the source without installing it, use
`.build/release/slotstream serve` from the repository instead. For Hermes, use
the startup command in its [guide](HERMES.md#start-slotstream), which selects
the larger context. Stop the server with Ctrl+C when finished.

The addresses below apply to clients running directly on the same Mac. A
container's or remote machine's `localhost` refers to that environment, so it
needs separate networking configuration to reach the Mac. Slotstream binds to
the Mac's loopback interface and accepts browser origins from loopback only;
see [Security](../SECURITY.md).

## OpenAI-compatible clients

Choose the client's **OpenAI-compatible** or **custom OpenAI** provider, with
**Chat Completions** as the API mode:

| Setting | Value |
|---|---|
| Base URL | `http://127.0.0.1:11434/v1` |
| Model | `qwen3.8-flash-next:4bit` |
| API key, if required by the client | `unused` |
| Full chat endpoint, if the client asks for an endpoint instead of a base URL | `http://127.0.0.1:11434/v1/chat/completions` |

Use the base URL when the client appends its own route. Slotstream does not
authenticate the placeholder key. The OpenAI **Responses API** is unsupported;
a client that requires it needs a Chat Completions mode to connect.

For an agent, enable client-executed function tools. Slotstream returns tool
calls; the client validates arguments, performs the requested action using its
own permissions, and returns the result with the matching call ID. The
[API reference](API.md#v1chatcompletions) describes the exact fields and
streaming format.

Set an explicit output budget appropriate for the task. Also configure title
generation, summarization, and any fallback model to use the local endpoint
when you want the whole conversation to stay local. A main-model URL alone
does not configure every auxiliary request. Hermes's tested settings are in
its [guide](HERMES.md#configure-hermes).

## Ollama-compatible clients

Use these settings for Ollama-style chat, including Open WebUI:

| Setting | Value |
|---|---|
| Provider | Ollama |
| Server URL | `http://127.0.0.1:11434` |
| Model | `qwen3.8-flash-next:4bit` |

An installed Ollama CLI can use the running Slotstream server:

```sh
OLLAMA_HOST=http://127.0.0.1:11434 ollama run qwen3.8-flash-next:4bit
```

The Ollama endpoints support chat, streaming, and images. They reject function
tools. For an agent that offers both provider types, select OpenAI Chat
Completions when using tools, with the version requirement above.

## Check the connection

In another terminal, confirm that the model is discoverable:

```sh
curl -sS http://127.0.0.1:11434/v1/models
```

Then send a plain chat request:

```sh
curl -sS http://127.0.0.1:11434/v1/chat/completions \
  -H 'Content-Type: application/json' \
  -d '{
    "model": "qwen3.8-flash-next:4bit",
    "messages": [{"role": "user", "content": "Hello"}],
    "stream": false
  }'
```

For an agent, follow this with a real tool round trip: put a distinctive code
in a test file, ask the agent to read it using its file or terminal tool, then
ask it to recall the code from the conversation. Check the client's tool log
and returned file contents. If you use summaries or images, check those paths
as well. The [testing guide](TESTING.md) provides automated integration gates.

## Troubleshooting

| Symptom | What to check |
|---|---|
| Connection refused or the wrong model appears | Confirm the server is running, the port matches, and another server is not answering there. Check the executable you started and `/v1/models`. |
| A tool request is rejected | Confirm the client uses OpenAI Chat Completions and the server is version 0.2.8 or later. The Ollama endpoints reject tools. |
| The client calls `/v1/responses` | Select its Chat Completions mode. Responses-only clients are unsupported. |
| Context is rejected or the client guesses a huge window | Match the client's limit to the served window, which includes instructions, tool definitions, history, images, and output. The ordinary default is 32,768; Hermes uses an explicit `--max-context 65536`. |
| The first answer times out | Read the server's prefill progress. Large standing prompts can take minutes; configure the client's local stream watchdog using measured waits. See the Hermes and fx guides for their different timeout behavior. |
| Summaries stop early or auxiliary requests leave the local provider | Configure auxiliary routing and an explicit summary output budget. Hermes has a tested configuration; fx has known compaction limits. |
| Structured output or strict schemas are rejected | JSON-schema constrained output and `strict: true` tool schemas are unsupported. Disable that requirement only if the client supports a fallback; otherwise the feature is incompatible. |
| An image request fails | Enable vision and send inline image bytes in the API's format. Slotstream does not fetch remote image URLs or read API-supplied file paths. See [Images](API.md#images). |

The [API reference](API.md) lists supported fields and errors. The
[troubleshooting guide](TROUBLESHOOTING.md) covers server startup, port conflicts,
memory, and weight files. Successful checks with Hermes, fx, or a chat client
qualify those tested versions and request paths; another client's optional
features can require additional support.

## Reporting an integration problem

Include the client version, Slotstream release or source commit, Mac model and
RAM, exact server command, provider/API mode, base URL, model ID, and the full
error text. Say whether model discovery, plain chat, the tool call, the returned
tool result, or a later summary failed. A minimal request and response help
separate a protocol problem from a client setting. Remove real credentials and
private conversation or file contents before posting them.
