import SnapshotTesting
import Testing

@testable import MediaFeature

@MainActor
struct GalleryViewSnapshotTests {

    @Test
    func testGalleryView_shouldBeEqualToSnapshot() {
        let items = Array(repeating: MediaModel(category: .TVDrama), count: 10)
        let sut = GalleryView(title: "foo.title", description: "foo.description", items: items)

        assertSnapshot(of: sut, as: .image(layout: .fixed(width: 400, height: 280)))
    }
}
