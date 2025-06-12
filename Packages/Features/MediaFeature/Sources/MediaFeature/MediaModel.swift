import Foundation

public struct MediaModel {
    public let id: UUID
    public let category: CategoryKind

    public init(id: UUID = UUID(), category: CategoryKind) {
        self.id = id
        self.category = category
    }
}
