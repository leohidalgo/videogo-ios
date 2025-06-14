import AVKit
import SwiftUI

struct FullscreenVideoPlayer: UIViewControllerRepresentable {

    let player: AVPlayer

    // swiftlint:disable unused_parameter
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.entersFullScreenWhenPlaybackBegins = true
        controller.exitsFullScreenWhenPlaybackEnds = true
        return controller
    }
    // swiftlint:enable unused_parameter

    // swiftlint:disable unused_parameter
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        // unused method
    }
    // swiftlint:enable unused_parameter
}
