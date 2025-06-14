import Foundation

protocol MediaRepository: Sendable {
    func fetchMedias() async throws -> [MediaModel]
}
