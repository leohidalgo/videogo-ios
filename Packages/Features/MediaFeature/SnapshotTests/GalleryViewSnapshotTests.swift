import SnapshotTesting
import Testing

@testable import MediaFeature

@MainActor
struct GalleryViewSnapshotTests {

    @Test
    func test_view_shouldBeEqualToSnapshot() {
        let items = Array(repeating: MediaModel(category: .TVDrama), count: 8)
        let sut = GalleryView(title: "foo.title", description: "foo.description", items: items)

        assertSnapshot(of: sut, as: .image(layout: .fixed(width: 1000, height: 280)))
    }

    @Test
    func test_view_whenItemsAreLessThan7_shouldBeEqualToSnapshot() {
        let items = Array(repeating: MediaModel(category: .TVDrama), count: 7)
        let sut = GalleryView(title: "foo.title", description: "foo.description", items: items)

        assertSnapshot(of: sut, as: .image(layout: .fixed(width: 1000, height: 280)))
    }

    @Test
    func test_view_whenDescriptionIsNil_shouldBeEqualToSnapshot() {
        let items = Array(repeating: MediaModel(category: .TVDrama), count: 7)
        let sut = GalleryView(title: "foo.title", description: nil, items: items)

        assertSnapshot(of: sut, as: .image(layout: .fixed(width: 1000, height: 280)))
    }
}
