import MediaFeature
import SwiftUI

@main
struct VideoGoApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }

    init() {
        _ = FirebaseSetup()
    }
}
