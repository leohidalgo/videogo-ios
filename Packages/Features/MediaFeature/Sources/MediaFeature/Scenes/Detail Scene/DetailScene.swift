import AVKit
import SwiftUI

struct DetailScene: View {

    @State private var showPlayer = false

    private let title: String
    private let description: String?
    private let video: URL

    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Rectangle()
                    .fill(.gray)
                Image(systemName: "play.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
                    .accessibilityAddTraits(.isButton)
                    .onTapGesture {
                        showPlayer = true
                    }
            }
            .aspectRatio(16 / 9, contentMode: .fit)
            .frame(maxWidth: .infinity)
            .fullScreenCover(isPresented: $showPlayer) {
                FullscreenVideoPlayer(player: AVPlayer(url: video))
                    .ignoresSafeArea()
            }

            Text(title)
                .font(.title)
                .padding(.horizontal)
            if let description {
                Text(description)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal)
            }
            Spacer()
        }
    }

    init(title: String, description: String?, video: URL) {
        self.title = title
        self.description = description
        self.video = video
    }
}
