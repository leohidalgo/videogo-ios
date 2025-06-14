import Foundation
import SnapshotTesting
import Testing

@testable import MediaFeature

@MainActor
struct GalleryViewSnapshotTests {

    @Test
    func test_view_shouldBeEqualToSnapshot() throws {
        let items = try Array(repeating: Helper.makeMediaModel(), count: 8)
        let sut = GalleryView(title: "foo.title", description: "foo.description", items: items)

        assertSnapshot(of: sut, as: .image(layout: .fixed(width: 1000, height: 280)))
    }

    @Test
    func test_view_whenItemsAreLessThan7_shouldBeEqualToSnapshot() throws {
        let items = try Array(repeating: Helper.makeMediaModel(), count: 7)
        let sut = GalleryView(title: "foo.title", description: "foo.description", items: items)

        assertSnapshot(of: sut, as: .image(layout: .fixed(width: 1000, height: 280)))
    }

    @Test
    func test_view_whenDescriptionIsNil_shouldBeEqualToSnapshot() throws {
        let items = try Array(repeating: Helper.makeMediaModel(), count: 7)
        let sut = GalleryView(title: "foo.title", description: nil, items: items)

        assertSnapshot(of: sut, as: .image(layout: .fixed(width: 1000, height: 280)))
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
            id: UUID().uuidString,
            title: title,
            description: description,
            image: image ?? defaultURL,
            video: video,
            category: category
        )
    }
}
