#!/usr/bin/env python3
"""Require a completed, bounded answer to the frozen long-context recall task."""
import argparse
import json
import re
from pathlib import Path


def check_answer(payload, text, expected, minimum_prompt_tokens, maximum_output_tokens):
    stats = payload['stats']
    prompt, output = payload['prompt_ids'], payload['output_ids']
    if not isinstance(prompt, list) or not isinstance(output, list):
        raise ValueError('token observations must be lists')
    if any(type(token) is not int or not 0 <= token < 248320 for token in prompt + output):
        raise ValueError('token observations must belong to the pinned vocabulary')
    if len(prompt) < minimum_prompt_tokens or not 0 < len(output) <= maximum_output_tokens:
        raise ValueError('delivered work does not match the bounded long-context task')
    if stats['promptTokens'] != len(prompt) or stats['decodeTokens'] != len(output):
        raise ValueError('reported counts do not match exact token observations')
    if stats['finishReason'] != 'stop' or stats.get('runtimeError') is not None:
        raise ValueError('the answer was truncated or failed before completion')
    if re.fullmatch(r'\s*' + re.escape(expected) + r'[.!]?\s*', text, flags=re.IGNORECASE) is None:
        raise ValueError('completed answer does not match the expected recalled value')
    return {'passed': True, 'prompt_tokens': len(prompt), 'output_tokens': len(output), 'completed': True}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('stats', type=Path); parser.add_argument('text', type=Path)
    parser.add_argument('--expected', required=True)
    parser.add_argument('--minimum-prompt-tokens', type=int, required=True)
    parser.add_argument('--maximum-output-tokens', type=int, required=True)
    args = parser.parse_args()
    if args.minimum_prompt_tokens < 2049 or not 1 <= args.maximum_output_tokens <= 512 or not args.expected:
        parser.error('a sparse-context prompt, bounded output and nonempty expected value are required')
    try:
        result = check_answer(json.loads(args.stats.read_text()), args.text.read_text(), args.expected,
                              args.minimum_prompt_tokens, args.maximum_output_tokens)
    except (ValueError, KeyError, TypeError, OSError) as error:
        print(json.dumps({'passed': False, 'error': str(error)})); return 1
    print(json.dumps(result)); return 0


if __name__ == '__main__':
    raise SystemExit(main())
