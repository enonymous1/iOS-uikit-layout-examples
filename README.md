# iOS UIKit Layout Examples — now SwiftUI

Three small iOS examples from April 2023, consolidated into one
repository and modernized to current standards in v2.0.0. They
share a stack — Swift 6, SwiftUI, iOS 17.0, no external
dependencies — but they are not the same example repeated.

v1 was UIKit storyboards. v2 rewrites all three in SwiftUI; the
v1 code remains in git history, one commit back, for anyone who
wants the storyboard versions.

## Examples

| Example | Folder | What it is |
| --- | --- | --- |
| Radioactive Elements | `examples/radioactive-elements/` | The only example with real data: a searchable list of 12 radioactive elements, with a sectioned detail view on selection. iPad shows list beside detail. |
| Auto Layout Exercises | `examples/autolayout-exercises/` | Layout demos: an adaptive stack, an adaptive grid, a size-class demo, and a slider-controlled spacing demo. |
| Color Blender | `examples/color-blender/` | An interactive blender: two colors set with RGB sliders, a blend-ratio slider, the blended result with its hex value, and a five-step blend grid. |

## Setup

Each example is an independent Xcode project. There are no
package installation steps.

1. Open the example's `.xcodeproj` in Xcode on macOS.
2. Select an iPhone or iPad simulator (or a connected device).
3. Press **Run** (`Cmd+R`).

For a physical device, select your own development team in the
target's **Signing & Capabilities** settings. No signing team
is baked into these projects.

Tests: open a project and press **Test** (`Cmd+U`), or run
the CI workflow, which tests all three projects on an iPhone 17
simulator.

## History: why four original folders became three examples

The original upload contained four folders. They were not four
separate examples:

- `AdaptiveLayout_Lecture1` was the starter step of the
  radioactive-elements app: its storyboard had no table view
  yet. `AdaptiveLayout_Lecture1-2` is the same project
  finished — identical project file, AppDelegate, and table
  cell, with the table view, detail outlets, and images added.
  Only the finished version was published in v1, as
  `radioactive-elements/`; the starter is recorded in the
  CHANGELOG, not as a separate repo.
- `AutoLayout` and `ColorBlender` are distinct exercises, so
  each keeps its own folder, but neither is strong enough on
  its own to justify a standalone repository.

## What v2 changed

See `CHANGELOG.md` for the full list. In short: SwiftUI
throughout, `Codable` models and `@Observable` view models,
Swift Testing suites (18 tests total), SwiftLint, GitHub
Actions CI, generated app icons and real accent colors, and
generated Info.plists. The v1 data is preserved except for one
correction: "Actinum" is now spelled "Actinium" in the
radioactive-elements data. Element figures are a curated
selection from Wikipedia and should be verified before reuse.

## Known limitations

- Not built on the machine this was prepared on: there is no
  Xcode/Swift toolchain on the Linux box used here. The build
  gate is CI plus Xcode on a Mac after push — run each example
  on iPhone and iPad simulators first.
- The Auto Layout demos teach SwiftUI layout now, not
  Interface Builder constraints. For the original constraint
  exercises, check out the v1 commit.

## License

MIT — see `LICENSE`.
