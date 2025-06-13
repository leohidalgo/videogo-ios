import Foundation

struct MediaModel {
    let id: UUID
    let category: CategoryKind
    let description: String?
    let title: String
    let image: URL
    let video: URL?

    init(id: UUID = UUID(), title: String, description: String?, image: URL, video: URL?, category: CategoryKind) {
        self.id = id
        self.title = title
        self.description = description
        self.image = image
        self.category = category
        self.video = video
    }
}
