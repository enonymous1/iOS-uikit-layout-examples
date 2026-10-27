import SwiftUI

/// SwiftUI app entry point. v1's AppDelegate, SceneDelegate, and
/// storyboards are gone: the scene lifecycle is the WindowGroup
/// below, and the blending interface is SwiftUI views, not a
/// storyboard grid of static color views.
@main
struct ColorBlenderApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
