#!/usr/bin/env python3
"""Weights-free regression checks for coverage_ratchet.py."""

from coverage_ratchet import compare


def main():
    measured = {
        "Sources/Slotstream/Existing.swift": (7, 10),
        "Sources/Slotstream/New.swift": (9, 10),
        "Sources/Slotstream/Up.swift": (8, 10),
    }
    floor = {
        "Sources/Slotstream/Existing.swift": 80.0,
        "Sources/Slotstream/Up.swift": 70.0,
    }
    failures, gains, missing = compare(measured, floor)
    assert failures == [("Sources/Slotstream/Existing.swift", 80.0, 70.0)]
    assert gains == [("Sources/Slotstream/Up.swift", 70.0, 80.0)]
    assert missing == [("Sources/Slotstream/New.swift", 90.0)]

    # LLVM's attribution can move by a tenth of a point on unrelated edits.
    failures, gains, missing = compare(
        {"Sources/Slotstream/Stable.swift": (799, 1000)},
        {"Sources/Slotstream/Stable.swift": 80.0},
    )
    assert failures == []
    assert gains == []
    assert missing == []
    print("coverage ratchet checks pass")


if __name__ == "__main__":
    main()
