import Foundation

struct MediaModel {
    let id: UUID
    let category: CategoryKind

    init(id: UUID = UUID(), category: CategoryKind) {
        self.id = id
        self.category = category
    }
}
