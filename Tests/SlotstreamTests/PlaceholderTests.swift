import XCTest
@testable import SlotstreamCore

final class QuantMathTests: XCTestCase {
    func testBF16Round() {
        XCTAssertEqual(bf16Round(1.0), 1.0)
        XCTAssertEqual(bf16Round(0.1000976562), Float(bitPattern: 0x3DCD_0000), accuracy: 1e-6)
    }
}
