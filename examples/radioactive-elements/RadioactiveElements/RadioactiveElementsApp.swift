import SwiftUI

/// SwiftUI app entry point. v1's `@UIApplicationMain` AppDelegate,
/// storyboard, and handwritten Info.plist are gone: the scene
/// lifecycle is the WindowGroup below, and the launch screen is
/// the app's first view.
@main
struct RadioactiveElementsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
