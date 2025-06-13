import SwiftUI

struct ItemView: View {

    private let title: String?
    private let image: URL

    var body: some View {
        ZStack {
            AsyncImage(url: image) { image in
                image.resizable()
            } placeholder: {
                ZStack {
                    Rectangle()
                        .fill(.gray.opacity(0.3))
                    ProgressView()
                }
            }
            .cornerRadius(10)
            .frame(width: 100, height: 150)
        }
        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 4)
    }

    init(title: String? = nil, image: URL) {
        self.title = title
        self.image = image
    }
}
