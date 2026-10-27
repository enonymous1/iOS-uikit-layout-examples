import SwiftUI

/// A color as three 0–255 components, matching v1's three RGB
/// sliders and three "255" text fields. The components are clamped
/// on creation, so a slider can never build an invalid color.
///
/// Keeping this separate from SwiftUI's `Color` makes blending a
/// pure, testable function instead of a view-side calculation.
struct RGBColor: Equatable, Hashable, Sendable {
    let red: Double
    let green: Double
    let blue: Double

    init(red: Double, green: Double, blue: Double) {
        self.red = min(255, max(0, red))
        self.green = min(255, max(0, green))
        self.blue = min(255, max(0, blue))
    }

    /// The v1 storyboard's starting color: white.
    static let white = RGBColor(red: 255, green: 255, blue: 255)

    /// Linear blend toward another color. A ratio of 0 returns
    /// this color, 1 returns the other, and values outside 0–1
    /// are clamped to the ends instead of extrapolating.
    func blended(with other: RGBColor, ratio: Double) -> RGBColor {
        let clamped = min(1, max(0, ratio))
        return RGBColor(
            red: red + (other.red - red) * clamped,
            green: green + (other.green - green) * clamped,
            blue: blue + (other.blue - blue) * clamped
        )
    }

    /// Hex string in v1's label format, for example "#FFFFFF".
    var hex: String {
        String(
            format: "#%02X%02X%02X",
            Int(red.rounded()),
            Int(green.rounded()),
            Int(blue.rounded())
        )
    }

    var swiftUIColor: Color {
        Color(red: red / 255, green: green / 255, blue: blue / 255)
    }
}
