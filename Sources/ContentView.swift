import Localizable
import MediaFeature
import SwiftUI

struct ContentView: View {

    let items = Array(repeating: MediaModel(category: .TVShow), count: 10)

    var body: some View {
        TabView {
            NavigationStack { GalleryView(title: "foo.title", items: []) }
                .tabItem { Label(L10n.Home.Tab.title, systemImage: "play.rectangle.fill") }
        }
    }
}

#Preview {
    ContentView()
}
