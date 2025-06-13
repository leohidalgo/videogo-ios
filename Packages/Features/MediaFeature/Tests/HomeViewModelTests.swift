import Combine
import Foundation
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

        try #require(mockRepository.fetchMediasCalled == false)

        await sut.refreshData()

        #expect(mockRepository.fetchMediasCalled)
    }

    @Test
    func test_refreshData_shouldFilterMediaByCategory() async throws {
        let mockRepository = MockMediaRepository()
        mockRepository.mediasToReturn = [
            try Helper.makeMediaModel(category: .tvDrama),
            try Helper.makeMediaModel(category: .tvSerie),
            try Helper.makeMediaModel(category: .tvSerie),
            try Helper.makeMediaModel(category: .tvShow),
            try Helper.makeMediaModel(category: .tvShow),
            try Helper.makeMediaModel(category: .tvShow)
        ]
        let sut = HomeViewModel(repository: mockRepository)

        try #require(mockRepository.fetchMediasCalled == false)

        await sut.refreshData()

        #expect(sut.tvDramas.count == 1)
        #expect(sut.tvSeries.count == 2)
        #expect(sut.tvShows.count == 3)
    }
}

private extension Helper {

    static func makeMediaModel(
        title: String = "",
        description: String = "",
        image: URL? = nil,
        video: URL? = nil,
        category: CategoryKind = .tvDrama
    ) throws -> MediaModel {

        let defaultURL = try #require(URL(string: "http://example.com"))

        return MediaModel(
            title: title,
            description: description,
            image: image ?? defaultURL,
            video: video,
            category: category
        )
    }
}
