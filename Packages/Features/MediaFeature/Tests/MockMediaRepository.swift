import Foundation

@testable import MediaFeature

@MainActor
final class MockMediaRepository: MediaRepository {

    var fetchMediaCalled = false
    var mediaToReturn: [MediaModel] = []

    func fetchMedia() -> [MediaModel] {
        fetchMediaCalled = true

        return mediaToReturn
    }
}
