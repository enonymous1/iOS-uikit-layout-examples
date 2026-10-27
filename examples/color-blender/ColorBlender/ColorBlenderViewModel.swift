import Foundation
import Observation

/// Owns the two colors and the blend ratio for the blender view.
///
/// v1's sliders and text fields were never wired to any code, so
/// there was no blending logic to preserve. The sliders here drive
/// these values directly, and `blended` and `blendSteps` are pure
/// derivations of them, which is what the tests exercise.
@MainActor
@Observable
final class ColorBlenderViewModel {
    var firstRed: Double = 255
    var firstGreen: Double = 0
    var firstBlue: Double = 0
    var secondRed: Double = 0
    var secondGreen: Double = 64
    var secondBlue: Double = 255
    var ratio: Double = 0.5

    var firstColor: RGBColor {
        RGBColor(red: firstRed, green: firstGreen, blue: firstBlue)
    }

    var secondColor: RGBColor {
        RGBColor(red: secondRed, green: secondGreen, blue: secondBlue)
    }

    var blended: RGBColor {
        firstColor.blended(with: secondColor, ratio: ratio)
    }

    /// The blend grid: five steps from the first color to the
    /// second, replacing v1's static grid of color views.
    var blendSteps: [RGBColor] {
        [0, 0.25, 0.5, 0.75, 1].map { firstColor.blended(with: secondColor, ratio: $0) }
    }

    /// Preset pairs taken from v1's storyboard colors.
    func applyPreset(first: RGBColor, second: RGBColor) {
        firstRed = first.red
        firstGreen = first.green
        firstBlue = first.blue
        secondRed = second.red
        secondGreen = second.green
        secondBlue = second.blue
    }
}
