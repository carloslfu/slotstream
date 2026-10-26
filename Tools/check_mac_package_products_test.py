#!/usr/bin/env python3
"""Exercise the identity guard with JSON fixtures; never run Swift or plutil."""
import contextlib
import importlib.util
import io
import json
from pathlib import Path
import subprocess
import unittest
from unittest import mock


NATIVE_TARGET = "34A04005BCAF206EEC990BD9"
NATIVE_CONFIG_LIST = "4A807E8A027297B0B93701FB"
CONFIGS = {
    "Debug": "952548237D7F645F11D1E7B6",
    "Release": "E2D3A31BEAA1368FC62DA77A",
}
PASS_MESSAGE = (
    "PASS: local package products, Xcode app target and module have distinct identities\n"
)


def fixtures():
    # Identity fields from Package.swift and apps/macos/Package.swift. Other
    # dump-package fields are omitted because this guard does not consume them.
    engine = {
        "products": [{"name": name} for name in (
            "Slotstream", "SlotstreamDiagnostics", "slotstream",
        )],
        "targets": [{"name": name} for name in (
            "CSlotpack", "Slotstream", "SlotstreamDiagnostics", "slotstream-cli",
            "SlotstreamTestKit", "slotstream-checks",
        )],
    }
    app = {
        "products": [{"name": name} for name in (
            "SlotstreamRuntime", "SlotstreamPresentation", "SlotstreamDesktop",
            "slotstream-presentation-checks", "slotstream-composer-checks",
            "slotstream-local", "slotstream-mac-checks", "slotstream-extract",
        )],
        "targets": [{"name": name} for name in (
            "SlotstreamText", "SlotstreamPresentation", "SlotstreamPresentationChecks",
            "SlotstreamComposerChecks", "SlotstreamRuntime", "SlotstreamMac",
            "SlotstreamLocal", "SlotstreamMacChecks", "CSlotstreamSandbox",
            "SlotstreamExtract",
        )],
    }
    # Preserve the native target -> configuration list -> Debug/Release graph
    # and identifiers from Slotstream.xcodeproj/project.pbxproj.
    objects = {
        NATIVE_TARGET: {
            "isa": "PBXNativeTarget",
            "name": "SlotstreamDesktop",
            "buildConfigurationList": NATIVE_CONFIG_LIST,
        },
        NATIVE_CONFIG_LIST: {
            "isa": "XCConfigurationList",
            "buildConfigurations": list(CONFIGS.values()),
        },
    }
    for name, identifier in CONFIGS.items():
        objects[identifier] = {
            "isa": "XCBuildConfiguration",
            "name": name,
            "buildSettings": {
                "PRODUCT_NAME": "Slotstream",
                "PRODUCT_MODULE_NAME": "SlotstreamMac",
            },
        }
    return engine, app, {"objects": objects}


def settings(project, configuration):
    return project["objects"][CONFIGS[configuration]]["buildSettings"]


def safe_swift_overrides(project):
    for configuration in CONFIGS:
        settings(project, configuration)["SWIFT_MODULE_NAME"] = "SlotstreamMac"


class CheckerCase(unittest.TestCase):
    def run_checker(self, engine, app, project, failure_at=None, command_error=None):
        # Import the real guard only when a test invokes this helper. Its module
        # defines main() without evaluating manifests or reading the project.
        path = Path(__file__).resolve().with_name("check_mac_package_products.py")
        spec = importlib.util.spec_from_file_location("mac_package_products_under_test", path)
        checker = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(checker)
        root = path.parent.parent
        requests = [
            ["swift", "package", "--package-path", str(root), "dump-package"],
            ["swift", "package", "--package-path", str(root / "apps/macos"), "dump-package"],
            ["plutil", "-convert", "json", "-o", "-",
             str(root / "apps/macos/Slotstream.xcodeproj/project.pbxproj")],
        ]
        replies = [json.dumps(value) for value in (engine, app, project)]
        consumed = []

        def fake_check_output(command, **kwargs):
            index = len(consumed)
            self.assertLess(index, len(requests), "unexpected extra command")
            self.assertEqual(command, requests[index], "command arguments or ordering changed")
            self.assertEqual(kwargs, {"text": True})
            consumed.append(command)
            if index == failure_at:
                raise command_error
            return replies[index]

        output = io.StringIO()
        exit_code = None
        expected_count = 3 if failure_at is None else failure_at + 1
        with mock.patch.object(checker.subprocess, "check_output", fake_check_output):
            try:
                with contextlib.redirect_stdout(output):
                    try:
                        checker.main()
                    except SystemExit as error:
                        exit_code = error.code
            finally:
                # Every successful/refused identity check must consume exactly
                # both manifests and the project. Command failures stop there.
                self.assertEqual(consumed, requests[:expected_count])
        return exit_code, output.getvalue()

    def assert_passes(self, result):
        exit_code, output = result
        self.assertIsNone(exit_code, str(exit_code))
        self.assertEqual(output, PASS_MESSAGE)

    def assert_refuses(self, result, diagnostic):
        exit_code, output = result
        self.assertIsInstance(exit_code, str)
        self.assertTrue(exit_code.startswith("Xcode package or module names collide: "))
        self.assertIn(diagnostic, exit_code)
        self.assertEqual(output, "")


class ExistingIdentityChecks(CheckerCase):
    """Compatibility selector: these controls also pass before the repair."""

    def test_current_literal_names_pass(self):
        self.assert_passes(self.run_checker(*fixtures()))

    def test_safe_explicit_swift_name_passes(self):
        for configuration in CONFIGS:
            with self.subTest(configuration=configuration):
                engine, app, project = fixtures()
                settings(project, configuration)["SWIFT_MODULE_NAME"] = "SlotstreamMac"
                self.assert_passes(self.run_checker(engine, app, project))

    def test_missing_empty_and_unresolved_overrides_preserve_product_module_fallback(self):
        for configuration in CONFIGS:
            for override in (None, "", "$(PRODUCT_MODULE_NAME)", "${PRODUCT_MODULE_NAME}"):
                for product_module in ("SlotstreamMac", "Slotstream"):
                    with self.subTest(configuration=configuration, override=override,
                                      product_module=product_module):
                        engine, app, project = fixtures()
                        values = settings(project, configuration)
                        values["PRODUCT_MODULE_NAME"] = product_module
                        if override is not None:
                            values["SWIFT_MODULE_NAME"] = override
                        result = self.run_checker(engine, app, project)
                        if product_module == "Slotstream":
                            self.assert_refuses(
                                result, f"{configuration} app module Slotstream shadows an engine module")
                        else:
                            self.assert_passes(result)

    def test_duplicate_products_still_fail_with_safe_swift_override(self):
        engine, app, project = fixtures()
        app["products"][0]["name"] = "Slotstream"
        safe_swift_overrides(project)
        self.assert_refuses(
            self.run_checker(engine, app, project), "Slotstream: . and apps/macos")

    def test_package_target_collision_still_fails_with_safe_swift_override(self):
        engine, app, project = fixtures()
        project["objects"][NATIVE_TARGET]["name"] = "slotstream"
        safe_swift_overrides(project)
        self.assert_refuses(
            self.run_checker(engine, app, project),
            "app target slotstream shares a package target's intermediate build path")

    def test_product_and_target_name_fallbacks_are_preserved(self):
        for configuration in CONFIGS:
            for fallback in ("product", "target"):
                for name in ("SlotstreamDesktop", "Slotstream"):
                    with self.subTest(configuration=configuration, fallback=fallback, name=name):
                        engine, app, project = fixtures()
                        values = settings(project, configuration)
                        del values["PRODUCT_MODULE_NAME"]
                        if fallback == "product":
                            values["PRODUCT_NAME"] = name
                        else:
                            del values["PRODUCT_NAME"]
                            project["objects"][NATIVE_TARGET]["name"] = name
                        result = self.run_checker(engine, app, project)
                        if name == "Slotstream":
                            self.assert_refuses(
                                result, f"{configuration} app module Slotstream shadows an engine module")
                            if fallback == "target":
                                self.assertIn(
                                    "app target Slotstream shares a package target's intermediate build path",
                                    result[0])
                        else:
                            self.assert_passes(result)

    def test_command_failure_propagates_without_further_requests(self):
        for failure_at in range(3):
            with self.subTest(failure_at=failure_at):
                error = subprocess.CalledProcessError(23, ["fixture-command"], output="fixture failure")
                with self.assertRaises(subprocess.CalledProcessError) as raised:
                    self.run_checker(*fixtures(), failure_at=failure_at, command_error=error)
                self.assertIs(raised.exception, error)


class SwiftModuleOverrides(CheckerCase):
    def test_colliding_swift_override_refuses_safe_product_module(self):
        for configuration in CONFIGS:
            with self.subTest(configuration=configuration):
                engine, app, project = fixtures()
                settings(project, configuration)["SWIFT_MODULE_NAME"] = "Slotstream"
                self.assert_refuses(
                    self.run_checker(engine, app, project),
                    f"{configuration} app module Slotstream shadows an engine module")

    def test_safe_swift_override_passes_colliding_product_module(self):
        for configuration in CONFIGS:
            with self.subTest(configuration=configuration):
                engine, app, project = fixtures()
                values = settings(project, configuration)
                values["PRODUCT_MODULE_NAME"] = "Slotstream"
                values["SWIFT_MODULE_NAME"] = "SlotstreamMac"
                self.assert_passes(self.run_checker(engine, app, project))


if __name__ == "__main__":
    unittest.main()
