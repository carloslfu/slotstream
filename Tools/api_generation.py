"""Require successful generated output before API acceptance compares text."""
import argparse
import json
import sys


def ollama_text(value, *, stream=False, generated=False):
    frames = value if stream else [value]
    if not isinstance(frames, list) or not frames:
        raise ValueError('missing response')
    parts = []
    for index, frame in enumerate(frames):
        if not isinstance(frame, dict) or 'error' in frame:
            raise ValueError('failed generation')
        if frame.get('done') is not (index == len(frames) - 1):
            raise ValueError('missing, repeated or early terminal')
        if generated:
            text = frame.get('response')
        else:
            message = frame.get('message')
            if not isinstance(message, dict) or message.get('role') != 'assistant':
                raise ValueError('invalid assistant message')
            text = message.get('content')
        if not isinstance(text, str):
            raise ValueError('invalid content')
        parts.append(text)
    terminal = frames[-1]
    if terminal.get('done_reason') not in ('stop', 'length'):
        raise ValueError('unsuccessful terminal')
    count = terminal.get('eval_count')
    if type(count) is not int or count <= 0:
        raise ValueError('missing generated tokens')
    text = ''.join(parts)
    if not text.strip():
        raise ValueError('empty generation')
    return text


def openai_text(value):
    if not isinstance(value, dict) or 'error' in value:
        raise ValueError('failed generation')
    choices = value.get('choices')
    if not isinstance(choices, list) or len(choices) != 1:
        raise ValueError('missing or multiple completions')
    choice = choices[0]
    if not isinstance(choice, dict) or choice.get('finish_reason') not in ('stop', 'length'):
        raise ValueError('unsuccessful terminal')
    message = choice.get('message')
    if not isinstance(message, dict) or message.get('role') != 'assistant':
        raise ValueError('invalid assistant message')
    text = message.get('content')
    if not isinstance(text, str) or not text.strip():
        raise ValueError('empty generation')
    usage = value.get('usage')
    count = usage.get('completion_tokens') if isinstance(usage, dict) else None
    if type(count) is not int or count <= 0:
        raise ValueError('missing generated tokens')
    return text


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('format', choices=['ollama-chat', 'ollama-generate', 'openai'])
    args = parser.parse_args()
    value = json.load(sys.stdin)
    text = openai_text(value) if args.format == 'openai' else ollama_text(
        value, generated=args.format == 'ollama-generate')
    print(text, end='')


if __name__ == '__main__':
    main()
