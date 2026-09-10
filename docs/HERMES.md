<a id="hermes-with-slotstream"></a>

# Use Hermes with Slotstream

Use Hermes with a model running on your Mac. Hermes handles the conversation
and tools, such as reading files; Slotstream runs the model.

## Before you start

- [Install Slotstream](GETTING-STARTED.md). Check `slotstream --version`:
  you need 0.2.8 or later. Rerun the installer to update.
- [Install Hermes](https://github.com/NousResearch/hermes-agent#quick-install).
  Return here once the `hermes` command is available.

Both programs run on the same Mac, in separate Terminal windows.

## Start Slotstream

In Terminal, run:

```sh
slotstream serve --max-context 65536
```

If the model hasn't been downloaded, Slotstream asks to download it first.
Wait until you see `slotstream listening on http://127.0.0.1:11434`.
**Leave this window open and the server running.**

The larger context gives Hermes room for its instructions, tools, and conversation
history. Slotstream chooses its memory plan and whether to use speculative
decoding automatically. This context uses more memory than ordinary chat.
If startup fails, see [Troubleshooting](#troubleshooting) below.

## Configure Hermes

Open a **second Terminal window**. This setup keeps your usual Hermes
settings separate. Create a folder and open the configuration in a text editor:

```sh
mkdir -p ~/.hermes-slotstream
nano ~/.hermes-slotstream/config.yaml
```

Paste this configuration, keeping the indentation. If you've followed this
guide before, replace its previous configuration block with this one. Preserve
any unrelated settings you added; do not leave duplicate sections or the old
`model.base_url` and `model.max_tokens` entries.

```yaml
model:
  provider: slotstream
  default: qwen3.8-flash-next:4bit
  context_length: 65536
providers:
  slotstream:
    base_url: http://localhost:11434/v1
    api_key: unused
    api_mode: chat_completions
    extra_body:
      max_tokens: 4096
agent:
  reasoning_effort: none
  local_stream_stale_timeout: 1800
auxiliary:
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
compression:
  enabled: true
```

Press **Control+O**, then **Enter** to save. Press **Control+X** to close the
editor. You only need to do this setup once.

The configuration sends replies, conversation summaries, and titles to
Slotstream. Hermes tools that use web services still need their own connections.
Keep the provider name `slotstream` in both the configuration and launch command.
It keeps this connection separate from other providers named `custom`.

The three `max_tokens` settings limit replies, summaries, and titles separately.
They are output ceilings, not required response lengths. You can adjust them
for your tasks. Keep replies and summaries within the server's output limit;
see [output budgets](HERMES-NOTES.md#output-budgets).

Reasoning is optional. The `reasoning_effort` setting above uses `none` to skip
the model's extra thinking before answering. Change it to `medium` to enable
thinking, or remove the setting to use Hermes's default. Tools work with either
setting.

## Start Hermes

For your first session, create a practice folder and a small file:

```sh
mkdir -p ~/slotstream-demo
cd ~/slotstream-demo
printf 'The garden gate code is MAPLE.\n' > note.txt
```

This creates or replaces `note.txt` in the practice folder. Then start Hermes:

```sh
HERMES_HOME="$HOME/.hermes-slotstream" \
  hermes chat --provider slotstream --model qwen3.8-flash-next:4bit
```

Leave `api_key: unused` in the configuration as written. It is a placeholder;
no OpenAI account or key is needed. The first reply can take several minutes.
Follow progress in the Slotstream window.

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

## Use it again

Next time, start Slotstream with the same command. In a second window,
open your working folder and run the same Hermes command, including
`HERMES_HOME` to select this configuration.

When finished, exit Hermes with `/exit`, then press **Control+C** in the
Slotstream window to stop the server.

Slotstream 0.2.13 defaults to 30 minutes from accepting a request to the first
sampled token, including queueing and preparation. If you change the server's
`--max-prefill-wait`, keep Hermes's client timeouts compatible with it. See
[server request deadlines](HERMES-NOTES.md#server-request-deadlines).

## Troubleshooting

| Problem | What to do |
|---|---|
| Command not found | Open a new Terminal window. If it still fails, check the program's installation guide. |
| Hermes cannot connect | Keep Slotstream running. Copy the address and model name exactly as shown. |
| A local connection fails while using an HTTP proxy | Add `localhost` and `127.0.0.1` to the proxy exclusions in `NO_PROXY` and `no_proxy`, preserving any existing exclusions. Check this profile's `.env` as well as your shell settings. |
| An error mentions OpenRouter or asks for a cloud API key | Hermes selected a different connection. Replace the old guide configuration above and use `--provider slotstream`, including `HERMES_HOME`. |
| A log still labels the provider `custom` | Hermes also uses that internal label for named providers. Check the endpoint address to confirm which connection it selected. |
| Hermes cannot find provider `slotstream` | Check that the file is named `config.yaml`, the indentation matches, and the launch command selects this folder. See the diagnostic command below. |
| Another server is running | Stop your existing Slotstream server with Control+C, then restart with this guide's command. For another app, see [port conflicts](TROUBLESHOOTING.md#the-server-cant-listen-on-port-11434). |
| The first reply is slow | Check progress in Slotstream. Long prompts and summaries can take several minutes. |
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
error and the Slotstream window's output when reporting a problem.

For other connection errors, see [connection troubleshooting](CLIENTS.md#troubleshooting).
Developers can find configuration explanations, image support, and integration
tests in the [Hermes engineering notes](HERMES-NOTES.md).
