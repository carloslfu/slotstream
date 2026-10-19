#!/usr/bin/env python3
"""Emit the native app's SwiftPM clang arguments, separated by NUL bytes."""
import json
from pathlib import Path
import re
import sys


def clang_flags(manifest):
    # SwiftPM writes the command's args as a JSON array in this YAML block.
    module = '\n  "C.SlotstreamMac-arm64-apple-macosx-debug.module":'
    start = manifest.find(module)
    if start < 0:
        raise ValueError('SlotstreamMac debug module not found in the SwiftPM manifest')
    end = manifest.find('\n  "', start + len(module))
    block = manifest[start:end] if end >= 0 else manifest[start:]
    entries = list(re.finditer(r'^    args: ', block, re.M))
    if len(entries) != 1:
        raise ValueError('expected one SlotstreamMac args array')
    text = block[entries[0].end():].lstrip()
    arguments, consumed = json.JSONDecoder().raw_decode(text)
    if text[consumed:].split('\n', 1)[0].strip():
        raise ValueError('unexpected text after the SlotstreamMac args array')
    if not isinstance(arguments, list) or any(
        not isinstance(arg, str) or '\0' in arg for arg in arguments
    ):
        raise ValueError('SlotstreamMac arguments must be strings without NUL bytes')
    flags, i = [], 0
    while i < len(arguments):
        if arguments[i] == '-Xcc':
            if i + 1 == len(arguments):
                raise ValueError('missing argument after -Xcc')
            flags.extend(arguments[i:i + 2])
            i += 2
        else:
            i += 1
    return flags


def main():
    if len(sys.argv) != 2:
        raise SystemExit('usage: slotstream_clang_flags.py DEBUG_YAML')
    try:
        flags = clang_flags(Path(sys.argv[1]).read_text())
        encoded = b''.join(flag.encode('utf-8') + b'\0' for flag in flags)
    except (OSError, ValueError) as error:
        raise SystemExit(str(error))
    sys.stdout.buffer.write(encoded)


if __name__ == '__main__':
    main()
