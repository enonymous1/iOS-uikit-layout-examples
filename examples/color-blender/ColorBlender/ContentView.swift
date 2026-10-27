import SwiftUI

/// The color blender. Two colors, each set with three RGB sliders
/// like v1's, a ratio slider between them, the blended result with
/// its hex value, and a five-step blend grid.
///
/// v1 had all of these controls in its storyboard but no code
/// behind them; here every control drives the view model.
struct ContentView: View {
    @State private var viewModel = ColorBlenderViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("Color Blender")
                    .font(.largeTitle)
                    .bold()

                colorEditor(title: "First color", color: viewModel.firstColor) {
                    sliderRow(label: "R", value: $viewModel.firstRed)
                    sliderRow(label: "G", value: $viewModel.firstGreen)
                    sliderRow(label: "B", value: $viewModel.firstBlue)
                }

                colorEditor(title: "Second color", color: viewModel.secondColor) {
                    sliderRow(label: "R", value: $viewModel.secondRed)
                    sliderRow(label: "G", value: $viewModel.secondGreen)
                    sliderRow(label: "B", value: $viewModel.secondBlue)
                }

                VStack(alignment: .leading) {
                    Text("Blend ratio: \(Int(viewModel.ratio * 100))%")
                    Slider(value: $viewModel.ratio, in: 0...1)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Blended color")
                        .font(.headline)
                    viewModel.blended.swiftUIColor
                        .frame(height: 120)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    Text(viewModel.blended.hex)
                        .font(.system(.body, design: .monospaced))
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Blend grid")
                        .font(.headline)
                    HStack(spacing: 8) {
                        ForEach(viewModel.blendSteps, id: \.self) { step in
                            step.swiftUIColor
                                .frame(height: 60)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                    }
                }

                HStack {
                    Button("Red / Blue") {
                        viewModel.applyPreset(
                            first: RGBColor(red: 255, green: 0, blue: 0),
                            second: RGBColor(red: 0, green: 64, blue: 255)
                        )
                    }
                    Button("Purple / Orange") {
                        viewModel.applyPreset(
                            first: RGBColor(red: 175, green: 82, blue: 222),
                            second: RGBColor(red: 255, green: 149, blue: 0)
                        )
                    }
                }
                .buttonStyle(.bordered)
            }
            .padding()
        }
    }

    private func colorEditor<Content: View>(
        title: String,
        color: RGBColor,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(title)
                    .font(.headline)
                Spacer()
                color.swiftUIColor
                    .frame(width: 44, height: 44)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                Text(color.hex)
                    .font(.system(.body, design: .monospaced))
            }
            content()
        }
    }

    private func sliderRow(label: String, value: Binding<Double>) -> some View {
        HStack {
            Text(label)
                .frame(width: 16, alignment: .leading)
            Slider(value: value, in: 0...255, step: 1)
            Text("\(Int(value.wrappedValue))")
                .frame(width: 36, alignment: .trailing)
                .font(.system(.body, design: .monospaced))
        }
    }
}
