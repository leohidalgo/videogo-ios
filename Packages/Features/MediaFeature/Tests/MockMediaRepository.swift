import Foundation

@testable import MediaFeature

@MainActor
final class MockMediaRepository: MediaRepository {

    var fetchMediasCalled = false
    var mediasToReturn: [MediaModel] = []

    func fetchMedias() -> [MediaModel] {
        fetchMediasCalled = true

        return mediasToReturn
    }
}
