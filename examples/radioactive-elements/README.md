# Radioactive Elements

A small iOS UIKit reference app. It displays a list of selected
radioactive elements and shows each element's symbol, atomic data,
discovery year, melting point, boiling point, and discovery notes when
the user selects a row.

Originally published under the course folder names
`AdaptiveLayout_Lecture1` and `AdaptiveLayout_Lecture1-2`. This folder
is the finished version (the `-2` step); the earlier starter step had
the same project file, AppDelegate, and table cell, but its storyboard
had no table view yet, so it is not a separate example.

## Tech Stack

- Swift 5.0
- UIKit
- Storyboards and Auto Layout
- iOS 13.6 minimum deployment target
- No external dependencies

## Setup

1. Open `AdaptiveLayout_Lecture1.xcodeproj` in Xcode on macOS.
2. Select an iPhone or iPad simulator, or a connected device.
3. Press **Run** (`Cmd+R`).

## How it works

- `ViewController.swift` holds the element data in memory and acts as
  the table view's data source and delegate, with automatic cell sizing.
- Selecting a row fills the detail labels from the selected element.
- `ElementTableCell.swift` configures each reusable row with the element
  symbol and name.

## Data notes

The element data is a curated selection from Wikipedia, stored directly
in `ViewController.swift`. Temperatures are labeled in the source as
Fahrenheit. It is not a complete catalog of radioactive elements, and
figures should be verified before reuse.

## Known limitations

- `Info.plist` references a `LaunchScreen` storyboard that is not
  present in this source tree.
- The Xcode test target is empty; add XCTest cases before relying on
  automated regression coverage.
- Not built on the machine this was prepared on (no Xcode there).
  Run it on iPhone and iPad simulators first.
