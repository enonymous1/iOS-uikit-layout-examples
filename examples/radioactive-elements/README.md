# Radioactive Elements (v2, SwiftUI)

A small iOS app that displays a list of 12 radioactive elements
and shows each element's symbol, atomic data, discovery year,
melting point, boiling point, and discovery notes when the user
selects a row.

v1 was a UIKit storyboard app (table view plus detail labels).
v2 is SwiftUI: a searchable `NavigationSplitView` with a
sectioned detail view, a `Codable` `Element` model loaded from
bundled JSON, and an `@Observable` view model.

## Tech Stack

- Swift 6
- SwiftUI
- iOS 17.0 or later
- No external dependencies

## Setup

1. Open `RadioactiveElements.xcodeproj` in Xcode on macOS.
2. Select an iPhone or iPad simulator, or a connected device.
3. Press **Run** (`Cmd+R`).

Tests: press **Test** (`Cmd+U`). The suite covers element
decoding, temperature display, and list filtering.

## Data notes

The element data is a curated selection from Wikipedia, stored
in `RadioactiveElements/ElementData.json`. Temperatures are in
Fahrenheit, as in v1. Missing temperatures decode to `nil` and
show as "N/A". It is not a complete catalog of radioactive
elements, and figures should be verified before reuse. One v1
typo is corrected here: "Actinum" is now "Actinium".

## Known limitations

- Not built on the machine this was prepared on (no Xcode
  there). Run it on iPhone and iPad simulators first, and
  confirm the split view behaves on both.
