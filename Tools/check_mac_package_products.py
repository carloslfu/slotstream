#!/usr/bin/env python3
"""Keep local package and app identities distinct in Xcode's build graph."""
import json
from pathlib import Path
import subprocess
import sys


def main():
    root = Path(__file__).resolve().parent.parent
    owners = {}
    collisions = []
    engine_modules = set()
    package_targets = set()
    for package in [root, root / "apps/macos"]:
        manifest = json.loads(subprocess.check_output(
            ["swift", "package", "--package-path", str(package), "dump-package"], text=True))
        if package == root:
            engine_modules = {target["name"] for target in manifest["targets"]}
        package_targets.update(target["name"].casefold() for target in manifest["targets"])
        for product in manifest["products"]:
            name = product["name"]
            owner = str(package.relative_to(root))
            if name in owners:
                collisions.append(f"{name}: {owners[name]} and {owner}")
            owners[name] = owner
    project = json.loads(subprocess.check_output(
        ["plutil", "-convert", "json", "-o", "-", str(root / "apps/macos/Slotstream.xcodeproj/project.pbxproj")], text=True))
    objects = project["objects"]
    for target in objects.values():
        if target.get("isa") != "PBXNativeTarget":
            continue
        # Xcode uses target names in intermediate build paths. The native
        # project and engine package also differ only in capitalization, so
        # equal target names overwrite compiler inputs on ordinary macOS disks.
        if target["name"].casefold() in package_targets:
            collisions.append(f"app target {target['name']} shares a package target's intermediate build path")
        for identifier in objects[target["buildConfigurationList"]]["buildConfigurations"]:
            config = objects[identifier]
            settings = config["buildSettings"]
            module = settings.get("PRODUCT_MODULE_NAME", settings.get("PRODUCT_NAME", target["name"]))
            # Literal compiler overrides take precedence; unresolved settings keep the fallback.
            override = settings.get("SWIFT_MODULE_NAME")
            if isinstance(override, str) and override and "$" not in override:
                module = override
            if module in engine_modules:
                collisions.append(f"{config['name']} app module {module} shadows an engine module")
    if collisions:
        sys.exit("Xcode package or module names collide: " + "; ".join(collisions))
    print("PASS: local package products, Xcode app target and module have distinct identities")


if __name__ == "__main__":
    main()
