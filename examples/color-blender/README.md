# Color Blender

A native iOS UIKit app that presents a color-blending layout with a
title and a grid of color views. The visible interface is defined in
`Main.storyboard`.

## Tech Stack

- Swift 5.0
- UIKit
- Storyboards and Auto Layout
- iOS 16.4 deployment target
- iPhone and iPad
- No external dependencies

## Setup

1. Open `ColorBlender.xcodeproj` in Xcode on macOS.
2. Select an iPhone or iPad simulator, or a connected device.
3. Press **Run** (`Cmd+R`).

## What's in here

- `ColorBlender/Base.lproj/Main.storyboard` — the color-view layout
  and Auto Layout constraints.
- `ColorBlender/Base.lproj/LaunchScreen.storyboard` — launch screen.
- `ColorBlender/ViewController.swift` — the initial view controller.
  It is an empty stub: the layout is the example, and interaction
  logic was never added beyond the storyboard.

## Known limitations

- Not built on the machine this was prepared on (no Xcode there).
  Run it on iPhone and iPad simulators first.
