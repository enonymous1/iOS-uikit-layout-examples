import Testing

@testable import AutoLayout

@Suite("Stacked versus side-by-side layout mode")
struct LayoutModeTests {
    @Test("Widths below the threshold stack, widths at or above it sit side by side")
    func modeThreshold() {
        #expect(LayoutModel.mode(forWidth: 599) == .stacked)
        #expect(LayoutModel.mode(forWidth: 600) == .sideBySide)
        #expect(LayoutModel.mode(forWidth: 1024) == .sideBySide)
    }

    @Test("The threshold is the 600-point regular-width breakpoint")
    func thresholdValue() {
        #expect(LayoutModel.sideBySideThreshold == 600)
    }
}
