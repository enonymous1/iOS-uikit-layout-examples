import Testing

@testable import AutoLayout

@Suite("Adaptive grid columns")
struct LayoutModelTests {
    @Test("Narrow widths get one column, wider widths get more")
    func columnsGrowWithWidth() {
        #expect(LayoutModel.columns(forWidth: 50) == 1)
        #expect(LayoutModel.columns(forWidth: 100) == 1)
        #expect(LayoutModel.columns(forWidth: 250) == 2)
        #expect(LayoutModel.columns(forWidth: 390) == 3)
        #expect(LayoutModel.columns(forWidth: 800) == 8)
    }

    @Test("Columns never drop below one, even at zero width")
    func columnsNeverBelowOne() {
        #expect(LayoutModel.columns(forWidth: 0) == 1)
        #expect(LayoutModel.columns(forWidth: -10) == 1)
    }

    @Test("The grid palette has five colors, matching v1's Layout2 boxes")
    func gridPaletteCount() {
        #expect(LayoutModel.gridColors.count == 5)
    }
}
