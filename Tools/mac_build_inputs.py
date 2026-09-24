#!/usr/bin/env python3
"""Capture the exact development app inputs without touching the engine graph."""
import hashlib
import json
import pathlib
import subprocess
import sys

root = pathlib.Path(__file__).resolve().parent.parent
paths = [root / 'Package.swift', root / 'Package.resolved', root / 'Tools/lib/mlx-0.32.2.metallib']
for base in ['Sources', 'apps/macos/Runtime', 'apps/macos/Presentation', 'apps/macos/App', 'apps/macos/Resources', 'apps/macos/Extract', 'apps/macos/CSandbox']:
    paths.extend(p for p in (root / base).rglob('*') if p.is_file())
paths.extend(root / p for p in ['apps/macos/Package.swift', 'apps/macos/Package.resolved', 'apps/macos/Info.plist', 'Tools/build_sevra_mac.sh', 'Tools/mac_build_inputs.py', 'Tools/generate_sevra_icon.sh', 'Tools/render_sevra_icon.swift', 'apps/macos/Sevra.xcodeproj/project.pbxproj'])
manifest = {'files': {str(p.relative_to(root)): hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted(set(paths))},
            'dbmd_sha256': hashlib.sha256(pathlib.Path(sys.argv[1]).read_bytes()).hexdigest(),
            'swift': subprocess.check_output(['swift', '--version'], text=True).strip(),
            'sdk': subprocess.check_output(['xcrun', '--show-sdk-version'], text=True).strip(),
            'scope': 'Local development build inputs. Ad-hoc signing is not release qualification.'}
print(json.dumps(manifest, sort_keys=True, indent=2))
