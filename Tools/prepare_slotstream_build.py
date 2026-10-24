#!/usr/bin/env python3
"""Invalidate native consumers when their local Swift inputs change.

SwiftPM's incremental imports reused an old app object after ModelPack's layout
changed. It linked successfully and crashed while destroying the value. Keep
third-party/engine caches, but never combine native consumers from different
source/toolchain identities in development bundles or offscreen UI checks.
"""
import argparse
import hashlib
import pathlib
import shutil
import subprocess


TARGETS = ('SlotstreamText', 'SlotstreamRuntime', 'SlotstreamPresentation', 'SlotstreamMac', 'SlotstreamLocal',
           'SlotstreamMacChecks', 'SlotstreamComposerChecks', 'SlotstreamPresentationChecks')


def prepare(binary_dir, fingerprint):
    stamp = binary_dir / '.slotstream-native-inputs'
    if stamp.is_file() and stamp.read_text() == fingerprint:
        return False
    for target in TARGETS:
        directory = binary_dir / (target + '.build')
        if directory.is_dir():
            shutil.rmtree(directory)
        modules = binary_dir / 'Modules'
        for artifact in modules.glob(target + '.*'):
            if artifact.is_dir():
                shutil.rmtree(artifact)
            else:
                artifact.unlink()
    binary_dir.mkdir(parents=True, exist_ok=True)
    stamp.write_text(fingerprint)
    return True


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--configuration', choices=['debug', 'release'], default='debug')
    parser.add_argument('--check', action='store_true', help='Fail if inputs changed since preparation; do not invalidate anything.')
    args = parser.parse_args()
    root = pathlib.Path(__file__).resolve().parent.parent
    paths = [root / p for p in ['Package.swift', 'Package.resolved', 'apps/macos/Package.swift', 'apps/macos/Package.resolved', 'Tools/prepare_slotstream_build.py']]
    for base in ['Sources', 'apps/macos/Extract', 'apps/macos/CSandbox', 'apps/macos/Runtime', 'apps/macos/Presentation', 'apps/macos/Text', 'apps/macos/App', 'apps/macos/CLI', 'apps/macos/Checks', 'apps/macos/ComposerChecks', 'apps/macos/PresentationTests']:
        paths.extend(p for p in (root / base).rglob('*') if p.is_file())
    identity = hashlib.sha256()
    for path in sorted(set(paths)):
        identity.update(str(path.relative_to(root)).encode() + b'\0' + path.read_bytes() + b'\0')
    for command in [['swift', '--version'], ['xcrun', '--show-sdk-path'], ['xcrun', '--show-sdk-version']]:
        identity.update(subprocess.check_output(command))
    binary_dir = pathlib.Path(subprocess.check_output(['swift', 'build', '--package-path', str(root / 'apps/macos'), '-c', args.configuration, '--show-bin-path'], text=True).strip())
    if args.check:
        stamp = binary_dir / '.slotstream-native-inputs'
        if not stamp.is_file() or stamp.read_text() != identity.hexdigest():
            parser.exit(1, 'Native inputs changed during verification. Repeat with stable sources.\n')
    elif prepare(binary_dir, identity.hexdigest()):
        print('Native Swift inputs changed; rebuilding their consumers.')


if __name__ == '__main__':
    main()
