# Auto Layout Exercises (v2, SwiftUI)

Layout demos for iPhone and iPad: an adaptive stack that sits
side by side on wide layouts and stacks on narrow ones, an
adaptive grid in v1's Layout2 palette, a size-class demo, and
a slider-controlled spacing demo.

v1 was Interface Builder storyboards. v2 is SwiftUI, and the
layout decisions live in a testable `LayoutModel` instead of
storyboard constraints — the demos teach the same adaptive
ideas in the current idiom. For the original constraint
exercises, check out the v1 commit.

## Tech Stack

- Swift 6
- SwiftUI
- iOS 17.0 or later
- No external dependencies

## Setup

1. Open `AutoLayout.xcodeproj` in Xcode on macOS.
2. Select an iPhone or iPad simulator, or a connected device.
3. Press **Run** (`Cmd+R`).

Tests: press **Test** (`Cmd+U`). The suite covers grid
columns and the stacked/side-by-side breakpoint.

## Known limitations

- Not built on the machine this was prepared on (no Xcode
  there). Run it on iPhone and iPad simulators first.
