# iOS UIKit Layout Examples

Three small UIKit storyboard examples from April 2023, consolidated into one
repository. They share a stack — Swift 5, UIKit, storyboards, Auto Layout,
no external dependencies — but they are not the same example repeated.

This is a learning collection, not a finished app. Each example is kept
exactly as a runnable Xcode project, with its own folder and README.

## Examples

| Example | Folder | What it is |
| --- | --- | --- |
| Radioactive Elements | `examples/radioactive-elements/` | The only example with real app logic: a table of radioactive elements, with a detail view on row selection. iOS 13.6. |
| Auto Layout Exercises | `examples/autolayout-exercises/` | Storyboard Auto Layout / size-class exercises for iPhone and iPad. The ViewController is an empty stub; the layout is the example. iOS 16.4. |
| Color Blender | `examples/color-blender/` | A storyboard color-blending layout with a title and a grid of color views. The ViewController is an empty stub; the layout is the example. iOS 16.4. |

## Setup

Each example is independent. There are no package installation steps.

1. Open the example's `.xcodeproj` in Xcode on macOS.
2. Select an iPhone or iPad simulator (or a connected device).
3. Press **Run** (`Cmd+R`).

For a physical device, select your own development team in the target's
**Signing & Capabilities** settings. No signing team is baked into these
projects.

## History: why four original folders became three examples

The original upload contained four folders. They were not four separate
examples:

- `AdaptiveLayout_Lecture1` was the starter step of the radioactive-elements
  app: its storyboard had no table view yet. `AdaptiveLayout_Lecture1-2`
  is the same project finished — identical project file, AppDelegate, and
  table cell, with the table view, detail outlets, and images added. Only
  the finished version is published here, as `radioactive-elements/`;
  the starter is recorded here, not as a separate repo.
- `AutoLayout` and `ColorBlender` are distinct exercises, so each keeps
  its own folder, but neither is strong enough on its own to justify a
  standalone repository.

## Changes made for publication

- MIT LICENSE added (holder: enonymous1).
- Sanitized to the enonymous1 pattern: bundle identifiers changed from
  the original student/school prefixes to `com.enonymous1.*`, the
  Developer Team ID removed, author headers changed to "enonymous1",
  and the tracked `xcuserdata/` folders removed.
- AutoLayout cleanup: the duplicate `Base.lproj/Layout2.storyboard`
  (identical to `Base.lproj/Main.storyboard`, not referenced by the
  project) was removed. The project's Layout2 reference originally
  pointed to a file outside the repository; it now points to the
  shipped `Layout2.storyboard` at the example root. Confirm in Xcode
  that Layout2 loads as expected.
- The radioactive-elements data comment was rewritten: the element data
  is a curated selection from Wikipedia, not a verified catalog.
  Verify figures before reuse.

## Known limitations

- Not built on this machine: there is no Xcode/Swift toolchain on the
  Linux box this was prepared on. Open each project in Xcode and run it
  on iPhone and iPad simulators before calling it verified.
- Radioactive Elements: `Info.plist` still references a `LaunchScreen`
  storyboard that is not in the source tree, and the Xcode test target
  is empty. The detail view is populated from in-memory data in
  `ViewController.swift`.
- Auto Layout and Color Blender: interaction logic was never added
  beyond the storyboard layout. Their ViewControllers contain only
  `viewDidLoad`.

## License

MIT — see `LICENSE`.
