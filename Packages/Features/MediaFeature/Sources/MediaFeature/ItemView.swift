import SwiftUI

public struct ItemView: View {

    private let title: String?

    public var body: some View {
        ZStack {
            Rectangle()
                .fill(.gray)
                .cornerRadius(10)
                .frame(width: 100, height: 150)
            if let title {
                Text(title)
                    .foregroundStyle(.white)
            }
        }
        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 4)
    }

    public init(title: String? = nil) {
        self.title = title
    }
}

#Preview {
    HStack {
        ItemView()
        ItemView(title: "foo")
    }
}
