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
slotstream serve --max-context 65536 --mtp off
```

If the model hasn't been downloaded, Slotstream asks to download it first.
Wait until you see `slotstream listening on http://127.0.0.1:11434`.
**Leave this window open and the server running.**

These settings give Hermes room for its instructions, tools, and conversation
history. They use more memory than ordinary chat. If startup fails, see
[Troubleshooting](#troubleshooting) below.

## Configure Hermes

Open a **second Terminal window**. This setup keeps your usual Hermes
settings separate. Create a folder and open the configuration in a text editor:

```sh
mkdir -p ~/.hermes-slotstream
nano ~/.hermes-slotstream/config.yaml
```

Paste this configuration, keeping the indentation. If you've followed this
guide before, edit the existing configuration instead of adding a second copy.

```yaml
model:
  provider: custom
  base_url: http://localhost:11434/v1
  default: qwen3.8-flash-next:4bit
  context_length: 65536
  max_tokens: 4096
agent:
  local_stream_stale_timeout: 1800
auxiliary:
  compression:
    provider: main
    extra_body:
      max_tokens: 4096
      temperature: 0.2
      presence_penalty: 0
  title_generation:
    provider: main
compression:
  enabled: true
```

Press **Control+O**, then **Enter** to save. Press **Control+X** to close the
editor. You only need to do this setup once.

The configuration sends replies, conversation summaries, and titles to
Slotstream. Hermes tools that use web services still need their own connections.

## Start Hermes

For your first session, create a practice folder and a small file:

```sh
mkdir -p ~/slotstream-demo
cd ~/slotstream-demo
printf 'The garden gate code is MAPLE.\n' > note.txt
```

This creates or replaces `note.txt` in the practice folder. Then start Hermes:

```sh
HERMES_HOME="$HOME/.hermes-slotstream" OPENAI_API_KEY=unused \
  hermes chat --provider custom --model qwen3.8-flash-next:4bit --reasoning none
```

Leave `unused` as written. It is a placeholder; no OpenAI account or key is
needed. The first reply can take several minutes. Follow progress in the
Slotstream window.

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

## Troubleshooting

| Problem | What to do |
|---|---|
| Command not found | Open a new Terminal window. If it still fails, check the program's installation guide. |
| Hermes cannot connect | Keep Slotstream running. Copy the address and model name exactly as shown. |
| Another server is running | Stop your existing Slotstream server with Control+C, then restart with this guide's command. For another app, see [port conflicts](TROUBLESHOOTING.md#the-server-cant-listen-on-port-11434). |
| The first reply is slow | Check progress in Slotstream. Long prompts and summaries can take several minutes. |
| Insufficient memory | Close memory-heavy apps. Run `slotstream doctor --max-context 65536` to check the plan without loading the model. See [memory help](TROUBLESHOOTING.md#the-whole-mac-is-slow). |
| Replies or summaries stop early | Check the saved configuration, including both `max_tokens` settings. |

For other connection errors, see [connection troubleshooting](CLIENTS.md#troubleshooting).
Developers can find configuration explanations, image support, and integration
tests in the [Hermes engineering notes](HERMES-NOTES.md).
