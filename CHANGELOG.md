# Changelog

## v2.0.0 — SwiftUI modernization

- All three examples rewritten in SwiftUI, following the same
  pattern as the other 2023 projects modernized this week:
  Swift 6 language mode, iOS 17.0 deployment target, generated
  Info.plists, no AppDelegate, SceneDelegate, storyboards, or
  handwritten Info.plist files.
- **Radioactive Elements:** the 12 v1 elements are now a `Codable`
  `Element` struct loaded from bundled `ElementData.json` by an
  `@Observable` view model, shown in a searchable
  `NavigationSplitView` (list on iPhone, list beside detail on
  iPad) with a sectioned detail view. One correction from v1:
  "Actinum" is now spelled "Actinium". All other names, figures,
  and notes are unchanged. Temperatures are still Fahrenheit,
  and missing temperatures still show as "N/A".
- **Auto Layout:** the storyboard exercises are now SwiftUI
  demos — an adaptive stack, an adaptive grid in v1's Layout2
  palette, a size-class demo, and a slider-controlled spacing
  demo (v1's slider had no code behind it). Layout decisions
  live in a testable `LayoutModel` instead of Interface Builder
  constraints.
- **Color Blender:** the storyboard controls finally do
  something. Two colors, each set with three RGB sliders as in
  v1, a blend-ratio slider, the blended result with its hex
  value, a five-step blend grid, and preset pairs from v1's
  storyboard colors. Blending is a pure `RGBColor` function.
- Tests: Swift Testing suites for every project — element
  decoding and filtering (6 tests), layout columns and modes
  (5 tests), and color blending and the blender view model
  (7 tests).
- Tooling: SwiftLint config, GitHub Actions CI (SwiftLint
  `--strict` plus `xcodebuild test` for all three projects on an
  iPhone 17 simulator, Xcode 27.1), generated 17-slot app icons
  and real accent colors, and `.gitattributes` LF normalization.
- The v1 UIKit code is not deleted from history: v2 is a commit
  on top of the v1 consolidated commit, so the storyboard
  versions remain reachable in git history.

## v1.0.0 — Consolidated UIKit publish copy

- Four original folders consolidated into one repository with
  three examples: radioactive-elements (finished
  AdaptiveLayout_Lecture1-2; the Lecture1 starter recorded only
  as history), autolayout-exercises, and color-blender.
- MIT LICENSE added, bundle identifiers sanitized to
  `com.enonymous1.*`, Developer Team ID removed, author headers
  changed to enonymous1, tracked `xcuserdata/` removed.
