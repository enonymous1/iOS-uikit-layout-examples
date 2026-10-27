# Auto Layout Exercises

An iOS UIKit sample for experimenting with Auto Layout constraints,
storyboards, and size-class-specific layouts for iPhone and iPad.
The interface is built primarily in Interface Builder.

## Tech Stack

- Swift 5.0
- UIKit
- Xcode project and Interface Builder storyboards
- iOS 16.4 or later
- iPhone and iPad
- No external dependencies

## Setup

1. Open `AutoLayout.xcodeproj` in Xcode on macOS.
2. Select an iPhone or iPad simulator, or a connected device.
3. Press **Run** (`Cmd+R`).

## What's in here

- `AutoLayout/Base.lproj/Main.storyboard` — the app's main storyboard.
- `Layout2.storyboard` (at the example root) — additional Auto Layout
  exercises, included as a project resource. The project reference
  originally pointed to a file outside the repository; it now points
  to this shipped file. Confirm in Xcode that it loads as expected.
- `AutoLayout/Base.lproj/LaunchScreen.storyboard` — launch screen.

The `ViewController.swift` is intentionally an empty stub: the layout
itself is the exercise, and no interaction logic was added.

## Known limitations

- Not built on the machine this was prepared on (no Xcode there).
  Run it on iPhone and iPad simulators first.
- A duplicate `Base.lproj/Layout2.storyboard` (identical to Main, not
  referenced by the project) was removed during publication cleanup.
