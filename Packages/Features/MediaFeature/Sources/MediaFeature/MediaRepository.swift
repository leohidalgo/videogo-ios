import Foundation

protocol MediaRepository: Sendable {
    func fetchMedias() async -> [MediaModel]
}
