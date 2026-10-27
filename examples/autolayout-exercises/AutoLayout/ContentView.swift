import SwiftUI

/// A list of layout demos, replacing v1's Main and Layout2
/// storyboards. Each row opens one demo; the demos themselves
/// live in LayoutDemos.swift.
struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Adaptive stack") {
                    AdaptiveStackDemo()
                }
                NavigationLink("Adaptive grid") {
                    AdaptiveGridDemo()
                }
                NavigationLink("Size class") {
                    SizeClassDemo()
                }
                NavigationLink("Slider spacing") {
                    SliderSpacingDemo()
                }
            }
            .navigationTitle("Auto Layout")
        }
    }
}
