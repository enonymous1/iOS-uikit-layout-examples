import Testing

@testable import ColorBlender

@MainActor
@Suite("Color blender view model")
struct ColorBlenderViewModelTests {
    @Test("The blend grid has five steps, from first color to second")
    func blendGridSteps() {
        let viewModel = ColorBlenderViewModel()
        viewModel.applyPreset(
            first: RGBColor(red: 0, green: 0, blue: 0),
            second: RGBColor(red: 255, green: 255, blue: 255)
        )
        #expect(viewModel.blendSteps.count == 5)
        #expect(viewModel.blendSteps.first == RGBColor(red: 0, green: 0, blue: 0))
        #expect(viewModel.blendSteps.last == RGBColor(red: 255, green: 255, blue: 255))
        #expect(viewModel.blendSteps[2] == RGBColor(red: 127.5, green: 127.5, blue: 127.5))
    }

    @Test("Applying a preset sets both colors")
    func applyPreset() {
        let viewModel = ColorBlenderViewModel()
        viewModel.applyPreset(
            first: RGBColor(red: 10, green: 20, blue: 30),
            second: RGBColor(red: 40, green: 50, blue: 60)
        )
        #expect(viewModel.firstColor == RGBColor(red: 10, green: 20, blue: 30))
        #expect(viewModel.secondColor == RGBColor(red: 40, green: 50, blue: 60))
    }
}
