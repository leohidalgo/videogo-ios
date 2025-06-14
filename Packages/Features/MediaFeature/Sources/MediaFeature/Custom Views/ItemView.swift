import SwiftUI

struct ItemView: View {

    private let title: String
    private let image: URL

    var body: some View {
        AsyncImage(url: image) { phase in
            if let image = phase.image {
                image.resizable()
            } else if phase.error != nil {
                // TODO: Track this error with Crashlytics

                ZStack {
                    Color.blue
                    Text(title)
                        .foregroundStyle(.white)
                        .font(.caption)
                }
            } else {
                ZStack {
                    Rectangle()
                        .fill(.gray.opacity(0.3))
                    ProgressView()
                }
            }
        }
        .cornerRadius(10)
        .frame(width: 100, height: 150)
        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 4)
    }

    init(title: String, image: URL) {
        self.title = title
        self.image = image
    }
}
