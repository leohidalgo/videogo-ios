import Localizable
import SwiftUI

public struct GalleryView: View {

    private let title: String
    private let description: String?
    private let items: [MediaModel]

    public var body: some View {
        VStack(alignment: .leading) {
            makeTitle(text: title, description: description)
                .padding(.horizontal)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(items, id: \.id) { _ in
                        ItemView()
                    }

                    if items.count > 7 {
                        ItemView(title: L10n.Gallery.More.title)
                    }
                }
                .padding()
            }
            .scrollIndicators(.hidden)
        }
    }

    public init(title: String, description: String? = nil, items: [MediaModel]) {
        self.title = title
        self.description = description
        self.items = items
    }

    private func makeTitle(text: String, description: String?) -> some View {
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

#Preview {
    let itemsA = Array(repeating: MediaModel(id: UUID(), category: .TVShow), count: 7)
    GalleryView(title: "foo.title", description: "foo.description", items: itemsA)

    let itemsB = Array(repeating: MediaModel(id: UUID(), category: .TVShow), count: 10)
    GalleryView(title: "foo.title", description: "foo.description", items: itemsB)
}
