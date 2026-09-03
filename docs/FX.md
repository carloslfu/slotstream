# Running fx against slotstream

[fx](https://fx.sh) is Vercel Labs' coding agent. It ships three providers —
`gateway`, `codex`, `grok` — and no plugin point, so there is no "add a custom
model" setting to fill in. But its gateway client honours two environment
variables when, and only when, they name an `http://` **loopback** address with
an explicit port. slotstream serves exactly what that client expects, so fx can
drive a local model with no fork and no patched binary.

Nothing here changes fx. If Vercel later ships a first-class local provider,
this path keeps working and the tool-calling engine underneath it is unchanged.

## What slotstream serves

The **Vercel AI SDK Language Model Specification v4**, carried over **AI Gateway
protocol 0.0.1** — the same wire fx uses against Vercel:

| Route | Purpose |
| --- | --- |
| `POST /v3/ai/language-model` | the model call, streamed as Server-Sent Events |
| `POST /v1/ai/language-model` | the same handler, for a client configured with the `v1` path |
| `GET /coding-agent/v1/models` | the model catalogue fx reads capabilities from |
| `GET /coding-agent/v1/credits` | a zero balance, so `fx credits` answers |

Tool calls are native. The model does not emit JSON tool calls; its template
teaches it an XML form, and slotstream parses that as it streams, types each
argument against the tool's own JSON Schema, and emits the `tool-call` parts the
specification defines.

## Setup

Start a server, then point fx at it with a private profile:

```sh
slotstream serve --port 11434
```

```sh
#!/bin/sh
# fxs: run fx against a local slotstream, in its own profile
P="$HOME/.fx-slotstream"
mkdir -p "$P/.fx"
[ -f "$P/.fx/settings.json" ] || cat > "$P/.fx/settings.json" <<'JSON'
{
  "provider": "gateway",
  "models": { "gateway": "slotstream/qwen3.8-flash-next:4bit" },
  "permission_mode": "ask",
  "auto_upgrade": false
}
JSON
HOME="$P" \
FX_PERMISSION_MODE=ask \
FX_GATEWAY_BASE_URL=http://127.0.0.1:11434 \
FX_GATEWAY_CHAT_URL=http://127.0.0.1:11434/v3/ai/language-model \
AI_GATEWAY_API_KEY=local-dummy-key \
FX_DISABLE_KEYCHAIN=1 \
exec fx "$@"
```

Save it as `fxs`, `chmod +x`, and use it wherever you would use `fx`. Check the
wiring with `fxs models`, which should list the local model.

Four details are load-bearing:

- **The private `$HOME` is the isolation.** fx resolves everything under
  `$HOME/.fx` and has no config-directory variable, so a separate home is the
  only way to keep your normal fx profile, sessions and usage records untouched.
  Symlink `~/.fx/mcp.json` and `~/.fx/skills` into the profile if you want them
  shared.
- **The URLs must be loopback `http://` with an explicit port.** fx checks the
  scheme, the host (`127.0.0.1`, `localhost`, `[::1]`), the port, and the
  absence of userinfo. Anything else is *silently* ignored and fx talks to
  Vercel instead — which looks like your local model answering suspiciously
  well.
- **`FX_PERMISSION_MODE` is set as well as the settings field.** fx's compiled
  default is `auto`, which does not work here (see below), the settings file is
  only written when absent, and fx rewrites its own settings.
- **The model id must match the catalogue.** Take it from `fxs models` or from
  `GET /coding-agent/v1/models`.

The key is a dummy. It is never checked, never logged, and never leaves the
loopback socket.

## What works, and what does not

**Works.** The main agent loop: multi-step tool use, reading and writing files,
several calls in a turn, tool results fed back, and conversation state reused
between turns so a follow-up turn only prefills what is new. Reasoning is
available through fx's effort setting and streams as reasoning parts, and
reasoning turns stay on the cache too: fx never echoes reasoning back, so the
replayed history cannot match the ids that produced it, and slotstream splices
the ids it still holds in place of the re-render rather than rebuilding the
prompt.

A first turn against a cold cache pays a full prefill of the standing payload —
fx's system prompts and tool schemas are a few thousand tokens before your
question — and the main agent step has no client-side deadline, so it is slow
rather than broken.

**`permission_mode: auto` does not work.** In that mode fx asks a reviewer model
to classify each action, and that call carries a different tool set, so it misses
the conversation's cached prefix and pays a full prefill against a 30-second
deadline it cannot meet. Reviews time out and fx holds the action. Use `ask`
(you approve) or `yolo` (nothing is asked). This is a property of the deadline,
not of the dialect.

**Compaction is unreliable.** fx summarises a long session by calling a fixed
compactor model with a 120-second budget per chunk, and decode is the binding
constraint. The catalogue advertises a deliberately small window and reply
budget for that alias to keep chunks inside the budget, but a long session is
still better restarted than compacted.

**Not supported, and refused with a typed 400:** vision and image parts, JSON
schema constrained output, and provider-executed tools (fx's web search). A
provider tool in the request is dropped before the model sees it rather than
failing the turn, since a model cannot run one.

## Troubleshooting

*fx answers instantly and far too well* — the override was rejected and fx is
talking to Vercel. The URL must be `http://` on a loopback host with an explicit
port. `fxs models` shows four models when the override is live.

*fx reports an invalid finish reason* — the server predates this dialect, or
something between fx and the server is rewriting the stream. Upgrade slotstream.

*The first turn takes minutes* — that is a cold prefill of fx's standing prompt
at your configured memory size. Later turns in the same conversation reuse it.
`slotstream doctor` prints what your machine can plan for.

*Every request is refused with `unsupported_field`* — a newer fx is sending a
field this dialect does not know. The accepted set follows the v4 specification;
please open an issue with the field name.

## How it is tested

- `slotstream-checks --tier t0` covers the contract with no weights and no GPU:
  request validation and the field policy, prompt mapping in both directions,
  the catalogue invariants, the stream frames, and the tool-call parser
  (including that every split point of a streamed call parses identically).
- `Tools/fx_gates.sh` runs the live half against a real server: the catalogue,
  the refused shapes, streamed turns, a complete tool loop, the conversation
  reuse that makes the loop affordable, and — when `fx` is installed — the real
  binary completing a task against the local model.
