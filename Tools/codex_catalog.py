#!/usr/bin/env python3
"""Write the Codex model catalog that makes Slotstream a first-class Codex model.

Codex looks up every model by name in its bundled catalog. A name it does not
know gets fallback metadata, and that fallback has two problems for a local
model: it assumes a 272,000-token window, so Codex never compacts and the
server refuses the oversized prompt, and it declares no `apply_patch` tool
while its base prompt tells the model to use one, so the model's first edit is
a call to a tool that does not exist. `model_catalog_json` in `config.toml`
replaces the bundled catalog, and this script writes one entry for the served
model: the real window, thinking levels, and `apply_patch` as the freeform tool
Codex expects.

A catalog entry replaces the model's instruction template too, so the entry has
to carry Codex's own base prompt. The script fetches the prompt that ships with
the installed Codex version (it is `codex-rs/models-manager/prompt.md` at the
`rust-v<version>` tag of github.com/openai/codex), or takes a local copy with
`--prompt-file`. The context window comes from a running server's `/v1/models`,
or from `--context`.

Usage, with `slotstream serve` running:

    python3 Tools/codex_catalog.py

writes `~/.codex/slotstream-models.json` and prints the `config.toml` lines to
add. See docs/CODEX.md.
"""

import argparse
import json
import os
import re
import subprocess
import sys
import urllib.request

MODEL = "qwen3.8-flash-next:4bit"


def codex_version():
    out = subprocess.run(["codex", "--version"], capture_output=True, text=True, check=True).stdout
    match = re.search(r"(\d+\.\d+\.\d+)", out)
    if not match:
        raise SystemExit(f"could not read a version from `codex --version`: {out.strip()!r}")
    return match.group(1)


def fetch_prompt(version):
    url = f"https://raw.githubusercontent.com/openai/codex/rust-v{version}/codex-rs/models-manager/prompt.md"
    with urllib.request.urlopen(url, timeout=30) as response:
        return response.read().decode("utf-8"), url


def served_context(base):
    with urllib.request.urlopen(f"{base}/v1/models", timeout=10) as response:
        data = json.load(response)
    model = data["data"][0]
    return int(model["context_window"]), model["id"]


def main():
    parser = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    parser.add_argument("--server", default="http://127.0.0.1:11434", help="running Slotstream server (default: %(default)s)")
    parser.add_argument("--context", type=int, help="context window in tokens; default: ask the server")
    parser.add_argument("--prompt-file", help="Codex base prompt to embed instead of fetching it for the installed version")
    parser.add_argument("--codex-version", help="Codex version whose prompt to fetch; default: `codex --version`")
    parser.add_argument("--output", default=os.path.expanduser("~/.codex/slotstream-models.json"))
    args = parser.parse_args()

    model = MODEL
    if args.context is None:
        try:
            context, model = served_context(args.server)
        except Exception as error:  # noqa: BLE001 - the message is the point
            raise SystemExit(f"could not read the context window from {args.server}/v1/models ({error}); "
                             "start `slotstream serve` or pass --context") from error
    else:
        context = args.context

    if args.prompt_file:
        with open(args.prompt_file, encoding="utf-8") as handle:
            prompt = handle.read()
        source = args.prompt_file
    else:
        version = args.codex_version or codex_version()
        try:
            prompt, source = fetch_prompt(version)
        except Exception as error:  # noqa: BLE001
            raise SystemExit(f"could not fetch Codex {version}'s base prompt ({error}); pass --prompt-file") from error

    entry = {
        "slug": model,
        "display_name": "Qwen3.8-Flash-Next via Slotstream",
        "description": "Local model served by Slotstream on this Mac.",
        "supported_reasoning_levels": [
            {"effort": "low", "description": "Brief thinking before each reply"},
            {"effort": "medium", "description": "Balanced thinking"},
            {"effort": "high", "description": "Thorough thinking, slower"},
        ],
        "shell_type": "unified_exec",
        "visibility": "list",
        "supported_in_api": True,
        "priority": 1,
        "availability_nux": None,
        "upgrade": None,
        "support_verbosity": False,
        "default_verbosity": None,
        "apply_patch_tool_type": "freeform",
        "truncation_policy": {"mode": "bytes", "limit": 10000},
        "experimental_supported_tools": [],
        "context_window": context,
        "max_context_window": context,
        "base_instructions": prompt,
    }
    os.makedirs(os.path.dirname(os.path.abspath(args.output)), exist_ok=True)
    with open(args.output, "w", encoding="utf-8") as handle:
        json.dump({"models": [entry]}, handle, indent=1)
        handle.write("\n")
    print(f"wrote {args.output}: model {model}, {context}-token window, base prompt from {source}")
    print("\nAdd to ~/.codex/config.toml, above any [table] header:\n")
    # TOML rejects surrogate escapes and an unescaped DEL character.
    catalog_path = json.dumps(os.path.abspath(args.output), ensure_ascii=False).replace("\x7f", "\\u007f")
    print(f'model_catalog_json = {catalog_path}')
    return 0


if __name__ == "__main__":
    sys.exit(main())
