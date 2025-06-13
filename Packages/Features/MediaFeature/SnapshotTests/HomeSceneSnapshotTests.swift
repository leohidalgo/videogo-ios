import SnapshotTesting
import Testing

@testable import MediaFeature

@MainActor
struct HomeSceneSnapshotTests {

    @Test
    func test_view_shouldBeEqualToSnapshot() {
        let sut = HomeScene()

        assertSnapshot(of: sut, as: .image(layout: .device(config: .iPhone13Pro)))
    }
}
