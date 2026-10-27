import Foundation
import SwiftUI

/// The pure layout decisions behind the demos, kept out of the
/// views so they can be unit-tested without rendering anything.
///
/// These replace v1's Interface Builder constraints: instead of a
/// constraint that pins a view to a size class, the view asks this
/// model what shape it should take at the current width.
enum LayoutMode: Equatable {
    /// Narrow widths stack content vertically, like a compact
    /// size class on an iPhone in portrait.
    case stacked
    /// Wide widths lay content out side by side, like a regular
    /// size class on an iPad.
    case sideBySide
}

enum LayoutModel {
    /// The breakpoint v1's size-class layouts turned on: below it
    /// the layout stacks, at or above it the layout sits side by side.
    static let sideBySideThreshold: CGFloat = 600

    static func mode(forWidth width: CGFloat) -> LayoutMode {
        width >= sideBySideThreshold ? .sideBySide : .stacked
    }

    /// How many columns an adaptive grid should use at a given
    /// width, for a minimum cell width of 100 points (the same
    /// minimum v1's grid boxes were built around).
    static func columns(forWidth width: CGFloat, minimumCellWidth: CGFloat = 100) -> Int {
        max(1, Int(width / minimumCellWidth))
    }

    /// The palette from v1's Layout2 storyboard, as SwiftUI colors.
    static let gridColors: [Color] = [
        Color(red: 0.808, green: 0.867, blue: 0.949),
        Color(red: 0.412, green: 0.659, blue: 1.0),
        Color(red: 0.553, green: 0.886, blue: 0.957),
        Color(red: 0.647, green: 1.0, blue: 0.608),
        Color(red: 1.0, green: 0.694, blue: 0.396),
    ]
}
