import Localizable
import SwiftUI

struct GalleryView: View {

    private let title: String
    private let description: String?
    private let items: [MediaModel]

    var body: some View {
        VStack(alignment: .leading) {
            makeTitle(text: title, description: description)
                .padding(.horizontal)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(items, id: \.id) { item in
                        if let video = item.video {
                            let destination = DetailScene(title: item.title, description: item.description, video: video)
                            NavigationLink(destination: destination) {
                                ItemView(title: item.title, image: item.image)
                            }
                        } else {
                            ItemView(title: item.title, image: item.image)
                        }
                    }
                }
                .padding()
            }
            .scrollIndicators(.hidden)
        }
    }

    init(title: String, description: String? = nil, items: [MediaModel]) {
        self.title = title
        self.description = description
        self.items = items
    }

    func makeTitle(text: String, description: String?) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(text)
                    .font(.title2)
                    .bold()
                Image(systemName: "chevron.right")
                    .bold()
            }
            if let description {
                Text(description)
                    .foregroundStyle(.secondary)
            }
        }
    }
}
