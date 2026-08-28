# slotstream build. SwiftPM cannot compile the Metal shaders (mlx-swift
# limitation), so the prebuilt metallib matching the vendored MLX version
# (0.31.1, from the mlx-metal PyPI wheel) is colocated with the binary.

METALLIB := Tools/lib/mlx-0.31.1.metallib
RELEASE  := .build/release

.PHONY: build run test clean

build:
	swift build -c release
	cp $(METALLIB) $(RELEASE)/mlx.metallib

debug:
	swift build
	cp $(METALLIB) .build/debug/mlx.metallib

test: build
	swift test 2>&1 | tail -20

clean:
	swift package clean
