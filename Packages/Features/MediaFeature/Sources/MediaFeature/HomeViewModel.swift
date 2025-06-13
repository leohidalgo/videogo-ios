import Foundation

@MainActor
final class HomeViewModel: ObservableObject {

    @Published var continueWatching: [MediaModel] = []
    @Published var tvDramas: [MediaModel] = []
    @Published var tvSeries: [MediaModel] = []
    @Published var tvShows: [MediaModel] = []

    private let repository: MediaRepository

    init(repository: MediaRepository) {
        self.repository = repository
    }

    func refreshData() async {
        let medias = await self.repository.fetchMedia()

        await MainActor.run {
            self.continueWatching = []
            self.tvDramas = medias.filter { $0.category == .tvDrama }
            self.tvSeries = medias.filter { $0.category == .tvSerie }
            self.tvShows = medias.filter { $0.category == .tvShow }
        }
    }
}
