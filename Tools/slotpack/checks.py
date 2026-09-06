#!/usr/bin/env python3
"""Model-free acceptance gates for the default compressed downloader."""
import json
import subprocess
import download_checks
import raw_checks
import memory_checks


def main():
    root, out = download_checks.ROOT, download_checks.OUT
    out.mkdir(parents=True, exist_ok=True)
    subprocess.run(['python3', str(root/'Tools/slotpack/publish_hf_checks.py')], check=True)
    binary = out/'codec-checks-sanitized'
    subprocess.run(['cc', '-O1', '-g', '-fsanitize=address,undefined', '-fno-omit-frame-pointer',
                    '-I', str(root/'Sources/CSlotpack/include'), str(root/'Sources/CSlotpack/slotpack.c'),
                    str(root/'Tools/slotpack/codec_checks.c'), '-lm', '-o', str(binary)], check=True)
    run = subprocess.run([str(binary)], check=True, capture_output=True, text=True)
    assert json.loads(run.stdout)['pass']
    (out/'codec-checks.json').write_text(run.stdout)
    print(run.stdout, end='', flush=True)
    binary = download_checks.compile_harness('ManifestChecks.swift')
    run = subprocess.run([str(binary)], check=True, capture_output=True, text=True)
    assert json.loads(run.stdout)['pass']
    (out/'manifest-checks.json').write_text(run.stdout)
    print('MANIFEST CHECKS PASS', flush=True)
    download_checks.run()
    raw_checks.main()
    memory_checks.main()
    print('SLOTPACK GATES PASS', flush=True)


if __name__ == '__main__': main()
