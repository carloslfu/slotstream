# Connect apps and agents to Slotstream

Slotstream runs the model; your app provides the chat interface or tools.
Install both separately, then connect the app to the running Slotstream server.

## Choose a connection

| I use… | Follow… |
|---|---|
| Hermes | [Hermes setup](HERMES.md), which includes all the settings it needs |
| Open WebUI or the Ollama CLI | [Ollama-compatible clients](#ollama-compatible-clients) below |
| An app with an OpenAI-compatible or custom provider | [OpenAI-compatible clients](#openai-compatible-clients) below |
| fx | [fx setup](FX.md), including its permission and long-session limitations |

Start with [Get started](GETTING-STARTED.md) if Slotstream isn't installed.
For agents that use tools, you need **Slotstream 0.2.8 or later**. Check with
`slotstream --version`; run the [installer](../README.md#install) again to update.

## Start one server

**Hermes and fx users:** follow your app's guide above for the server command
and configuration. For an ordinary chat app, open Terminal and run:

```sh
slotstream serve
```

On first use, accept the model download and wait for it to finish.
Once you see `slotstream listening on http://127.0.0.1:11434`, leave this
window open. Stop the server with **Control+C** when finished.

The settings below are for an app running directly on the same Mac.
Apps running in Docker or on another computer need separate networking
configuration. See [Security](../SECURITY.md) for the server's local-access limits.

## OpenAI-compatible clients

In your app's provider settings, choose **OpenAI-compatible** or **custom
OpenAI**, then enter:

| Setting | Value |
|---|---|
| API mode, if offered | Chat Completions |
| Base URL | `http://127.0.0.1:11434/v1` |
| Model | `qwen3.8-flash-next:4bit` |
| API key, if required | `unused` |

No OpenAI account or key is needed for this local connection. Leave `unused`
as written. An app that requires the OpenAI Responses API cannot use this
connection unless it also offers a Chat Completions mode.

If the app asks for a **full endpoint** instead of a base URL, use:

```text
http://127.0.0.1:11434/v1/chat/completions
```

Apps may have separate model settings for conversation titles, summaries,
and fallbacks. Set those to the same local provider if you want those model
requests to stay on your Mac. Hermes's [configuration](HERMES.md#configure-hermes)
already does this. Tools that use web services still need their own connections.

## Ollama-compatible clients

In Open WebUI or another app with an Ollama provider, use:

| Setting | Value |
|---|---|
| Provider | Ollama |
| Server URL | `http://127.0.0.1:11434` |
| Model | `qwen3.8-flash-next:4bit` |

These settings support chat and images. For agents that use tools, choose
OpenAI Chat Completions or follow the [Hermes guide](HERMES.md).

If you already have the Ollama CLI installed, you can also open a chat in
a second Terminal window:

```sh
OLLAMA_HOST=http://127.0.0.1:11434 ollama run qwen3.8-flash-next:4bit
```

## Check the connection

Select the model in your app and send a short message, such as “Hello.”
You should see activity in the Slotstream terminal, followed by a reply in
your app. A first reply may take a while to begin.

For an agent, try the [file-reading example](HERMES.md#try-it). Check that
it actually reads the file and returns its contents.

## Troubleshooting

| Problem | What to check |
|---|---|
| Connection refused or the wrong model appears | Keep the Slotstream server running and copy the address and model name exactly. Check for [port conflicts](TROUBLESHOOTING.md#the-server-cant-listen-on-port-11434). |
| Tools don't work | Use OpenAI Chat Completions with Slotstream 0.2.8 or later. The Ollama connection does not support tools. |
| The app calls `/v1/responses` | Select Chat Completions mode. Responses-only apps are unsupported. |
| The conversation is too long | The ordinary limit is 32,768 tokens, including instructions, history, and reply. Hermes needs the larger `--max-context 65536` setup in its guide. |
| The first answer times out | Check progress in the Slotstream window. Long prompts can take minutes. See your agent's guide for its timeout settings. |
| Summaries stop early or use a cloud model | Check the separate summary-provider and reply-length settings. Use the full configuration in the Hermes guide; fx has known summary limitations. |
| The app requires strict structured output | JSON-schema constrained output and strict tool schemas are unsupported. The app needs a mode that works without that requirement. |
| An image fails | Check available memory and that you haven't started Slotstream with `--vision off`. Developers can check the [image request format](API.md#images). |

<a id="reporting-an-integration-problem"></a>

[General troubleshooting](TROUBLESHOOTING.md) covers startup, memory, and
model files. For a bug report, include the app and Slotstream versions, Mac
model and memory, server command, connection settings, and error text.
Remove credentials and private conversation or file contents.

Developers: see the [API reference](API.md) for supported fields and request
examples, and [integration tests](TESTING.md#openai-agent-integration) for
protocol and real-client checks.
