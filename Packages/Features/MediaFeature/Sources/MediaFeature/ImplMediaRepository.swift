import Foundation

final class ImplMediaRepository: MediaRepository {
    func fetchMedia() async -> [MediaModel] {
        try? await Task.sleep(nanoseconds: 3 * 1_000_000_000)

        return Array(repeating: MediaModel(id: UUID(), category: .TVDrama), count: 10)
    }
}
