import Foundation

protocol MediaRepository: Sendable {
    func fetchMedia() async -> [MediaModel]
}
