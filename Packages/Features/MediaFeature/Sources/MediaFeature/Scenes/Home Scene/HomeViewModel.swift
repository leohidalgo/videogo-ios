import Foundation
import Localizable

@MainActor
final class HomeViewModel: ObservableObject {

    @Published var continueWatching: [MediaModel] = []
    @Published var tvDramas: [MediaModel] = []
    @Published var tvSeries: [MediaModel] = []
    @Published var tvShows: [MediaModel] = []
    @Published var errorMessage: String?

    private let repository: MediaRepository

    init(repository: MediaRepository) {
        self.repository = repository
    }

    func refreshData() async {
        do {
            let medias = try await self.repository.fetchMedias()

            await MainActor.run {
                self.continueWatching = []
                self.tvDramas = medias.filter { $0.category == .tvDrama }
                self.tvSeries = medias.filter { $0.category == .tvSerie }
                self.tvShows = medias.filter { $0.category == .tvShow }
            }
        } catch {
            errorMessage = L10n.Firebase.error(error.localizedDescription)
        }
    }
}
