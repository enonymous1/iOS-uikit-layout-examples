import SwiftUI

/// Two boxes that sit side by side on a wide layout and stack on a
/// narrow one. This is the SwiftUI version of v1's size-class
/// exercise: the decision comes from `LayoutModel.mode(forWidth:)`
/// fed by the actual width, not from a storyboard trait variation.
struct AdaptiveStackDemo: View {
    var body: some View {
        GeometryReader { geometry in
            Group {
                if LayoutModel.mode(forWidth: geometry.size.width) == .sideBySide {
                    HStack {
                        demoBox("Left", color: .blue)
                        demoBox("Right", color: .green)
                    }
                } else {
                    VStack {
                        demoBox("Top", color: .blue)
                        demoBox("Bottom", color: .green)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Adaptive stack")
    }

    private func demoBox(_ label: String, color: Color) -> some View {
        Text(label)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(color.opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

/// A grid of colored boxes that adds columns as the width grows,
/// using v1's Layout2 palette. `LazyVGrid` with an adaptive item
/// does what v1's grid of constrained boxes did, without a single
/// Interface Builder constraint.
struct AdaptiveGridDemo: View {
    private let columns = [
        GridItem(.adaptive(minimum: 100), spacing: 12)
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(Array(LayoutModel.gridColors.enumerated()), id: \.offset) { _, color in
                    color
                        .frame(height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
            .padding()
        }
        .navigationTitle("Adaptive grid")
    }
}

/// Shows the current size class and adapts its text layout to it,
/// mirroring v1's Main storyboard, which varied its layout by
/// size class.
struct SizeClassDemo: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.verticalSizeClass) private var verticalSizeClass

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Horizontal size class: \(horizontalSizeClass == .regular ? "regular" : "compact")")
            Text("Vertical size class: \(verticalSizeClass == .regular ? "regular" : "compact")")
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                .font(horizontalSizeClass == .regular ? .title2 : .body)
            Spacer()
        }
        .padding()
        .navigationTitle("Size class")
    }
}

/// A slider that controls the spacing of a row of boxes, replacing
/// v1's Main storyboard slider, which had no code behind it at all.
/// The spacing value is shown so the effect is measurable, not
/// just visible.
struct SliderSpacingDemo: View {
    @State private var spacing: CGFloat = 12

    var body: some View {
        VStack(spacing: 24) {
            HStack(spacing: spacing) {
                ForEach(0..<3) { _ in
                    Color.blue
                        .frame(width: 60, height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
            VStack {
                Slider(value: $spacing, in: 0...40, step: 1)
                Text("Spacing: \(Int(spacing)) points")
                    .font(.caption)
            }
            .padding()
            Spacer()
        }
        .padding()
        .navigationTitle("Slider spacing")
    }
}
