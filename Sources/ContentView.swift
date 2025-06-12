import Localizable
import MediaFeature
import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            NavigationStack { ItemView() }
                .tabItem { Label(L10n.Home.Tab.title, systemImage: "play.rectangle.fill") }
        }
    }
}

#Preview {
    ContentView()
}
