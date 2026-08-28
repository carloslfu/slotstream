# slotstream build. SwiftPM cannot compile the Metal shaders (mlx-swift
# limitation), so the prebuilt metallib matching the vendored MLX version
# (0.31.1, fetched from the mlx-metal PyPI wheel) is colocated with the binary.

METALLIB := Tools/lib/mlx-0.31.1.metallib
RELEASE  := .build/release

.PHONY: build debug test clean

build: $(METALLIB)
	swift build -c release
	cp $(METALLIB) $(RELEASE)/mlx.metallib

debug: $(METALLIB)
	swift build
	cp $(METALLIB) .build/debug/mlx.metallib

$(METALLIB):
	Tools/fetch_metallib.sh

# swift test needs Xcode (Command Line Tools ship no XCTest); the acceptance
# battery in Tools/verify.sh is the real test suite.
test:
	Tools/verify.sh

clean:
	swift package clean
