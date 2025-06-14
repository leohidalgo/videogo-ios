import AVKit
import Combine
import SwiftUI

struct DetailScene: View {

    @State private var showPlayer = false
    @State private var cancellable: AnyCancellable?

    private let title: String
    private let description: String?
    private let player: AVPlayer

    var body: some View {
        VStack(alignment: .leading) {
            makePlayer()

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
        self.player = AVPlayer(url: video)
    }

    private func setupStallObserver() {
        cancellable = NotificationCenter.default
            .publisher(for: .AVPlayerItemPlaybackStalled, object: player.currentItem)
            .sink { _ in
                if let error = player.currentItem?.error {
                    // TODO: Track this with Crashlytics
                    print("Error: \(error.localizedDescription)")
               }
            }
    }

    private func makePlayer() -> some View {
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
            FullscreenVideoPlayer(player: player)
                .onAppear {
                    setupStallObserver()
                    player.automaticallyWaitsToMinimizeStalling = false
                    player.play()
                }
                .onDisappear {
                    cancellable?.cancel()
                }
                .ignoresSafeArea()
        }
    }
}
