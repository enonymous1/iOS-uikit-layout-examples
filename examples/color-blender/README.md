# Color Blender (v2, SwiftUI)

An interactive color blender. Two colors, each set with three
RGB sliders as in v1, a blend-ratio slider, the blended result
with its hex value, a five-step blend grid, and preset pairs
from v1's storyboard colors.

v1 had these controls in its storyboard but no code behind
them. v2 wires them to an `@Observable` view model, and
blending itself is a pure `RGBColor` function.

## Tech Stack

- Swift 6
- SwiftUI
- iOS 17.0 or later
- No external dependencies

## Setup

1. Open `ColorBlender.xcodeproj` in Xcode on macOS.
2. Select an iPhone or iPad simulator, or a connected device.
3. Press **Run** (`Cmd+R`).

Tests: press **Test** (`Cmd+U`). The suite covers blend
endpoints, midpoints, clamping, hex formatting, and the
blender view model's five-step grid.

## Known limitations

- Not built on the machine this was prepared on (no Xcode
  there). Run it on iPhone and iPad simulators first.
