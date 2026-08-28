import SlotstreamCore
import Testing

@Suite struct QuantMath {
    @Test func bf16RoundExact() {
        #expect(bf16Round(1.0) == 1.0)
        #expect(bf16Round(0.1000976562) == Float(bitPattern: 0x3DCD_0000))
        // round-to-nearest-even at the halfway point
        #expect(bf16Round(Float(bitPattern: 0x3F80_8000)) == Float(bitPattern: 0x3F80_0000))
    }
}
