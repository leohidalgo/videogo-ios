import Combine
import SnapshotTesting
import Testing

@testable import MediaFeature

@MainActor
struct HomeViewModelTests {

    var mockRepository: MockMediaRepository!

    @Test
    func test_refreshData_shouldCallRepositoryFetchMedia() async throws {
        let mockRepository = MockMediaRepository()
        let sut = HomeViewModel(repository: mockRepository)

        try #require(mockRepository.fetchMediaCalled == false)

        await sut.refreshData()

        #expect(mockRepository.fetchMediaCalled)
    }
}
