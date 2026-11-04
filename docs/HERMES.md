<a id="hermes-with-slotstream"></a>

# Use Hermes with Slotstream

Use Hermes with a model running on your Mac. Hermes handles the conversation
and tools, such as reading files; Slotstream runs the model.

## Before you start

- [Install Slotstream](GETTING-STARTED.md). Check `slotstream --version`:
  you need 0.2.21 or later for `slotstream launch`, used below, and 0.2.8 or
  later to [start Hermes yourself](#start-hermes-yourself). Rerun the
  installer to update.
- [Install Hermes](https://github.com/NousResearch/hermes-agent#quick-install).
  Return here once the `hermes` command is available.

Both programs run on the same Mac.

## Start Hermes

For your first session, create a practice folder and a small file in
Terminal:

```sh
mkdir -p ~/slotstream-demo
cd ~/slotstream-demo
printf 'The garden gate code is MAPLE.\n' > note.txt
```

This creates or replaces `note.txt` in the practice folder. Then start Hermes:

```sh
slotstream launch hermes
```

If Slotstream is not running, this starts it in the background first and
shows its start until the model answers. If the model hasn't been
downloaded, it asks to download it first. The server gets a context window of
at least 65,536 tokens, which gives Hermes room for its instructions, tools,
and conversation history, and uses more memory than ordinary chat. It keeps
running while Hermes runs and stops 30 minutes after the last session ends;
`slotstream stop` stops it sooner. If startup fails, see
[Troubleshooting](#troubleshooting) below.

The first time, this creates a separate Hermes folder,
`~/.hermes-slotstream`, with the [configuration below](#configure-hermes),
so your usual Hermes settings stay as they are. It then starts
`hermes chat --provider slotstream --model qwen3.8-flash-next:4bit` with that
folder selected. Later launches use the folder as it is, including any
changes you make to it.

No OpenAI account or key is needed. The first reply can take several
minutes; `tail -f ~/.slotstream/logs/serve.log` in another window shows its
progress.

Anything after `hermes` is passed to Hermes, for example
`slotstream launch hermes chat --yolo`. If the server runs on another port,
pass it before the tool name: `slotstream launch --port 8080 hermes`. To
use a different folder, set `HERMES_HOME` before the command.

<a id="verify-the-loop"></a>

## Try it

Ask Hermes:

> Read note.txt using your terminal tool and tell me what it says.

You should see a tool call to read the file, followed by its contents:
`The garden gate code is MAPLE.` If Hermes asks permission to read the file,
approve that action.

Then ask:

> What was the gate code? Answer from our conversation without reading the file again.

It should answer `MAPLE`.

<a id="configure-hermes"></a>

## The configuration

`slotstream launch hermes` writes this to `~/.hermes-slotstream/config.yaml`,
with the address and window of your server:

```yaml
model:
  provider: slotstream
  default: "qwen3.8-flash-next:4bit"
  context_length: 65536
providers:
  slotstream:
    base_url: http://127.0.0.1:11434/v1
    api_key: unused
    api_mode: chat_completions
    extra_body:
      max_tokens: 4096
agent:
  reasoning_effort: none
  local_stream_stale_timeout: 1800
auxiliary:
  vision:
    provider: main
    timeout: 1800
  compression:
    provider: main
    timeout: 1800
    extra_body:
      max_tokens: 4096
      temperature: 0.2
      presence_penalty: 0
  title_generation:
    provider: main
    timeout: 1800
    extra_body:
      max_tokens: 64
  approval: {provider: main}
  skills_hub: {provider: main}
  review: {provider: main}
  mcp: {provider: main}
  memory_query_rewrite: {provider: main}
  tts_audio_tags: {provider: main}
  triage_specifier: {provider: main}
  kanban_decomposer: {provider: main}
  profile_describer: {provider: main}
  goal_judge: {provider: main}
  curator: {provider: main}
  monitor: {provider: main}
  background_review: {provider: main}
  moa_reference: {provider: main}
  moa_aggregator: {provider: main}
compression:
  enabled: true
```

To change it, open it in a text editor, for example with
`nano ~/.hermes-slotstream/config.yaml`; press **Control+O**, then **Enter**
to save and **Control+X** to close.

The configuration sends replies to Slotstream, and every side task Hermes
runs besides them: conversation summaries, titles, the check that decides
whether a command needs your approval, and the rest of the `auxiliary` list.
A side task left out of that list uses Hermes's automatic choice, which tries
cloud providers such as OpenRouter when the server is busy or stopped, so
each one is set to `provider: main`. Hermes tools that use web services still
need their own connections.
Keep the provider name `slotstream` in both the configuration and launch command.
It keeps this connection separate from other providers named `custom`.
Leave `api_key: unused` as written. It is a placeholder.

The three `max_tokens` settings limit replies, summaries, and titles separately.
They are output ceilings, not required response lengths. You can adjust them
for your tasks. Keep replies and summaries within the server's output limit;
see [output budgets](HERMES-NOTES.md#output-budgets).

Reasoning is optional. The `reasoning_effort` setting above uses `none` to skip
the model's extra thinking before answering. Change it to `medium` to enable
thinking, or remove the setting to use Hermes's default. Tools work with either
setting.

<a id="run-the-server-yourself"></a>

## Run the server yourself

To watch the server, or to start Hermes without `slotstream launch`, start
the server in its own Terminal window first:

```sh
slotstream serve --max-context 65536
```

Wait until you see `slotstream listening on http://127.0.0.1:11434`, and
leave the window open; `slotstream launch hermes` then uses this server as it
is. Slotstream chooses its memory plan and whether to use speculative
decoding automatically. Without the flag the window depends on the Mac, for
example 32,768 at 48 GB; the flag keeps the window Hermes is configured for on
every Mac. Press
**Control+C** in the window, or run `slotstream stop`, to stop the server.

<a id="start-hermes-yourself"></a>

## Start Hermes yourself

Without `slotstream launch`, [run the server yourself](#run-the-server-yourself),
then create the folder and the configuration once:

```sh
mkdir -p ~/.hermes-slotstream
nano ~/.hermes-slotstream/config.yaml
```

Paste the configuration above, keeping the indentation, and save. If you've
followed this guide before, replace its previous configuration block with this
one; `slotstream launch hermes` names any side task an older block leaves
out. Preserve any unrelated settings you added; do not leave duplicate sections
or the old `model.base_url` and `model.max_tokens` entries. Then start Hermes
with the folder selected:

```sh
HERMES_HOME="$HOME/.hermes-slotstream" \
  hermes --profile default chat --provider slotstream --model qwen3.8-flash-next:4bit
```

`--profile default` selects the configuration in this folder even if you
previously selected another Hermes profile.

## Use it again

Next time, open your working folder and run `slotstream launch hermes`. If
you start Hermes yourself, run the server first as above, then the Hermes
command including `HERMES_HOME`.

When finished, exit Hermes with `/exit`. A server `slotstream launch` started
stops 30 minutes later, or at once with `slotstream stop`. Stop a server you
started yourself with **Control+C** in its window.

Slotstream 0.2.14 defaults to 30 minutes from accepting a request to the first
sampled token, including queueing and preparation. If you change the server's
`--max-prefill-wait`, keep Hermes's client timeouts compatible with it. See
[server request deadlines](HERMES-NOTES.md#server-request-deadlines).

## Troubleshooting

| Problem | What to do |
|---|---|
| Command not found | Open a new Terminal window. If it still fails, check the program's installation guide. |
| `slotstream launch: no Slotstream server answered` | You ran it with `--no-start`. [Run the server yourself](#run-the-server-yourself), or run the launch without `--no-start`. |
| `another Slotstream model process is running` | A server on another port, `slotstream run` or a check holds the model, and only one fits in memory. Stop it, or pass that server's port with `--port`. |
| `Slotstream stopped while starting` | The lines above it, and `~/.slotstream/logs/serve.log`, say why. If memory is short, close memory-heavy apps or pass a smaller `--memory-gb`. |
| `Hermes needs a context window of at least 65536 tokens` | The running server has a smaller window. If you started it, stop it and run this guide's command. If another agent still uses the server `slotstream launch` started, run the launch again once that agent exits; it then restarts the server with the larger window. |
| `config.yaml has no slotstream provider` | The folder has a configuration from something else. Add the configuration above, or set `HERMES_HOME` to a new folder. |
| `does not point at port` | The configuration names another address. Correct `base_url`, or pass the matching `--port` to `slotstream launch`. |
| `sets context_length to` | The configuration was written for a server with another window. Set `context_length` to the window the message names, or restart the server with the `--max-context` it names. |
| `` does not set `provider: main` for these Hermes side tasks `` | The configuration comes from an older version of this guide. Replace its `auxiliary` block with the one above. |
| Hermes cannot connect | The server stopped, with `slotstream stop` or 30 minutes after the last session; run `slotstream launch hermes` again. If you configured Hermes yourself, keep the server running and copy the address and model name exactly as shown. |
| A local connection fails while using an HTTP proxy | Add `localhost` and `127.0.0.1` to the proxy exclusions in `NO_PROXY` and `no_proxy`, preserving any existing exclusions. Check this profile's `.env` as well as your shell settings. |
| An error mentions OpenRouter or asks for a cloud API key | Hermes selected a different connection. Replace the old guide configuration with the one above and start with `slotstream launch hermes`. |
| A log still labels the provider `custom` | Hermes also uses that internal label for named providers. Check the endpoint address to confirm which connection it selected. |
| Hermes cannot find provider `slotstream` | Check that the file is named `config.yaml`, the indentation matches, and `HERMES_HOME` selects this folder. See the diagnostic command below. |
| Another server is running | Stop your existing Slotstream server with `slotstream stop` or Control+C in its window, then run `slotstream launch hermes` again. For another app, see [port conflicts](TROUBLESHOOTING.md#the-server-cant-listen-on-port-11434). |
| The first reply is slow | `tail -f ~/.slotstream/logs/serve.log` shows its progress, or the Slotstream window if you started the server yourself. Long prompts and summaries can take several minutes. |
| Hermes says “reasoning…” with thinking off | Hermes uses that word in its loading animation even when model thinking is off. |
| Insufficient memory | Close memory-heavy apps. Run `slotstream doctor --max-context 65536` to check the plan without loading the model. See [memory help](TROUBLESHOOTING.md#the-whole-mac-is-slow). |
| Replies or summaries stop early | Check all three `extra_body.max_tokens` settings. A `max_tokens` entry directly under `model` does not set Hermes's chat output limit in the tested versions. |

To diagnose a connection, exit Hermes and run:

```sh
HERMES_HOME="$HOME/.hermes-slotstream" \
  hermes --profile default chat --cli --verbose \
  --provider slotstream --model qwen3.8-flash-next:4bit
```

`--profile default` selects the configuration in this folder even if you
previously selected another Hermes profile. Send a short greeting. Any reported
inference endpoint should be `localhost:11434` or `127.0.0.1:11434`. Keep the
error and the server's output, from its window or
`~/.slotstream/logs/serve.log`, when reporting a problem.

For other connection errors, see [connection troubleshooting](CLIENTS.md#troubleshooting).
Developers can find configuration explanations, image support, and integration
tests in the [Hermes engineering notes](HERMES-NOTES.md).
