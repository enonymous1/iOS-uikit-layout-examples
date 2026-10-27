import SwiftUI

/// SwiftUI app entry point. v1's AppDelegate, SceneDelegate, and
/// storyboards are gone: the scene lifecycle is the WindowGroup
/// below, and the layout demos are SwiftUI views, not Interface
/// Builder scenes.
@main
struct AutoLayoutApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
