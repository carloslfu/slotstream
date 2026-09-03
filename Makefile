# slotstream build. SwiftPM cannot compile the Metal shaders (mlx-swift
# limitation), so the prebuilt metallib matching the vendored MLX version
# (0.31.1, fetched from the mlx-metal PyPI wheel) is colocated with the binary.
#
# "Colocated" means the directory of the executable that is running: MLX finds
# it with dladdr on its own code. That is why every executable which touches
# MLX — the CLI and the check runner alike — needs its own copy beside it, and
# why a test bundle would need one in its .xctest/Contents/MacOS.

METALLIB := Tools/lib/mlx-0.31.1.metallib
RELEASE  := .build/release
DEBUG    := .build/debug

.PHONY: build debug checks checks-all test coverage clean hooks docs

build: $(METALLIB)
	swift build -c release
	cp $(METALLIB) $(RELEASE)/mlx.metallib

debug: $(METALLIB)
	swift build
	cp $(METALLIB) $(DEBUG)/mlx.metallib

$(METALLIB):
	Tools/fetch_metallib.sh

# The check catalogue. T0 needs nothing; T1 and up touch MLX, so the runner
# gets the metallib beside it too.
checks: debug
	$(DEBUG)/slotstream-checks --tier t0

checks-all: debug
	$(DEBUG)/slotstream-checks --tier t0 --tier t1

# swift test needs Xcode (Command Line Tools ship no XCTest), which is why the
# catalogue is an executable: `make checks` runs it anywhere. Tools/verify.sh
# remains the acceptance battery against the real weights.
test:
	Tools/verify.sh

coverage:
	Tools/coverage.sh

# The generated files: llms-full.txt from the docs, MEASUREMENTS.md and
# PLAN.md from the brain's records. CI fails when a commit moves a source
# without its projection, so `make hooks` installs the pre-commit hook that
# regenerates them with the commit. Git cannot enable a hook from a clone on
# its own; run it once per checkout.
docs:
	Tools/llms_full.sh
	python3 Tools/projections.py

hooks:
	git config core.hooksPath .githooks
	@echo "pre-commit hook installed: the generated files regenerate with the commit"

clean:
	swift package clean
