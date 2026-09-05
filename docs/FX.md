# Use fx with slotstream

[fx](https://fx.sh) is Vercel Labs' coding agent. You can point its gateway
client at slotstream to use a local model for file reads, edits, and tool
calls. The setup below uses a separate fx profile and asks you to approve
actions.

Automatic action reviews time out in this setup, and long-session compaction
is unreliable. See [Limitations](#limitations) before starting a long task.

## Setup

Start slotstream in one terminal and leave it running:

```sh
slotstream serve --port 11434
```

Save the following as `fxs` in your working directory:

```sh
#!/bin/sh
# Run fx with a separate profile for the local model.
FX_PROFILE_DIR="$HOME/.fx-slotstream"
mkdir -p "$FX_PROFILE_DIR/.fx"
[ -f "$FX_PROFILE_DIR/.fx/settings.json" ] || cat > "$FX_PROFILE_DIR/.fx/settings.json" <<'JSON'
{
  "provider": "gateway",
  "models": { "gateway": "slotstream/qwen3.8-flash-next:4bit" },
  "permission_mode": "ask",
  "auto_upgrade": false
}
JSON
HOME="$FX_PROFILE_DIR" \
FX_PERMISSION_MODE=ask \
FX_GATEWAY_BASE_URL=http://127.0.0.1:11434 \
FX_GATEWAY_CHAT_URL=http://127.0.0.1:11434/v3/ai/language-model \
AI_GATEWAY_API_KEY=local-dummy-key \
FX_DISABLE_KEYCHAIN=1 \
exec fx "$@"
```

In a second terminal, make it executable and check the model list:

```sh
chmod +x fxs
./fxs models
```

The list should include `slotstream/qwen3.8-flash-next:4bit`. Then run `./fxs`
where you would normally run `fx`. You need fx installed separately.

The wrapper keeps settings, sessions, and usage records under
`~/.fx-slotstream/.fx`. It sets `FX_PERMISSION_MODE=ask` on every launch
because fx can rewrite its settings file. The API key is a placeholder;
slotstream doesn't authenticate it.

**Keep both gateway URLs on loopback HTTP with an explicit port.** fx accepts
`127.0.0.1`, `localhost`, or `[::1]`, with no userinfo in the URL. An invalid
override is silently ignored by the tested fx client, which then connects to
Vercel. Check `./fxs models` after changing these settings.

<a id="what-works-and-what-does-not"></a>

## Supported features

The main agent loop supports multiple tool calls per turn, tool results,
file reads and writes, images, and follow-up turns. Image parts must contain
inline bytes; see [Images](API.md#images).

Reasoning is available through fx's effort setting and streams separately
from the answer. slotstream retains compatible conversation state, including
reasoning state, so follow-up turns process only the new material while that
state is cached.

The first turn processes fx's system prompt and tool schemas as well as your
question. That can take minutes on a small memory target. The main agent
step has no client-side deadline in the tested client.

## Limitations

- **Automatic permission reviews:** `permission_mode: auto` sends a separate
  review request with a different tool set. It misses the conversation cache
  and can exceed fx's 30-second review deadline, leaving the action on hold.
  Use the wrapper's `ask` setting to approve actions yourself.
- **Session compaction:** fx gives each summary chunk a 120-second budget.
  Generation can exceed it, even with the smaller window advertised for the
  compactor alias. Start a new session if compaction fails.
- **Structured output:** JSON-schema constrained output returns a typed
  400 error.
- **Provider tools:** tools executed by a hosted provider, such as fx's web
  search, aren't available locally. They are removed from the request before
  it reaches the model. Ordinary client-executed tools remain available.

These observations describe the tested fx integration. A client update can
change its accepted overrides, request fields, or deadlines.

## Troubleshooting

### The model list doesn't show slotstream

Check that the server is running and both URLs use loopback HTTP with an
explicit port. Use the model ID returned by `./fxs models` or
`GET /coding-agent/v1/models`.

### fx reports an invalid finish reason

Upgrade slotstream. An older server may not implement this gateway protocol;
a proxy that changes the response stream can also cause this error.

### The first turn takes minutes

Check the progress in the server terminal. A cold first turn processes fx's
full standing prompt. `slotstream doctor` estimates prompt-processing time
for your memory plan.

### Requests fail with `unsupported_field`

A client may be sending a field this server doesn't support. Open an issue
with the field name and both software versions.

<a id="what-slotstream-serves"></a>

## Protocol reference

slotstream implements the Vercel AI SDK Language Model Specification v4 over
AI Gateway protocol 0.0.1.

| Route | Purpose |
|---|---|
| `POST /v3/ai/language-model` | Model calls, streamed as Server-Sent Events |
| `POST /v1/ai/language-model` | The same handler under the `v1` path |
| `GET /coding-agent/v1/models` | Model IDs and capabilities |
| `GET /coding-agent/v1/credits` | A zero balance for `fx credits` |

The model emits tool calls in its native XML format. slotstream parses them
incrementally, converts arguments using the tool's JSON Schema, and returns
AI SDK `tool-call` parts.

<a id="how-it-is-tested"></a>

## Tests

`slotstream-checks --tier t0` tests validation, prompt mapping, the model
catalogue, stream frames, and tool-call parsing without weights or a GPU.

`Tools/fx_gates.sh` tests a live server: model discovery, rejected requests,
streaming, a complete tool loop, and conversation reuse. When fx is installed,
it also tests the client completing a task with the local model.
