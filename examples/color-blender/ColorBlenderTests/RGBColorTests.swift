import Testing

@testable import ColorBlender

@Suite("RGB color blending")
struct RGBColorTests {
    private let red = RGBColor(red: 255, green: 0, blue: 0)
    private let blue = RGBColor(red: 0, green: 0, blue: 255)

    @Test("A ratio of 0 returns the first color, 1 returns the second")
    func blendEndpoints() {
        #expect(red.blended(with: blue, ratio: 0) == red)
        #expect(red.blended(with: blue, ratio: 1) == blue)
    }

    @Test("A ratio of 0.5 is the exact midpoint of each component")
    func blendMidpoint() {
        let blended = red.blended(with: blue, ratio: 0.5)
        #expect(blended == RGBColor(red: 127.5, green: 0, blue: 127.5))
    }

    @Test("Ratios outside 0–1 clamp to the ends instead of extrapolating")
    func blendClampsRatio() {
        #expect(red.blended(with: blue, ratio: -1) == red)
        #expect(red.blended(with: blue, ratio: 2) == blue)
    }

    @Test("Components clamp to 0–255 on creation")
    func componentsClamp() {
        let color = RGBColor(red: -10, green: 300, blue: 128)
        #expect(color.red == 0)
        #expect(color.green == 255)
        #expect(color.blue == 128)
    }

    @Test("Hex matches v1's label format")
    func hexFormat() {
        #expect(RGBColor.white.hex == "#FFFFFF")
        #expect(RGBColor(red: 255, green: 0, blue: 0).hex == "#FF0000")
    }
}
