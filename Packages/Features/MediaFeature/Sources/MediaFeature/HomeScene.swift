import Localizable
import SwiftUI

public struct HomeScene: View {

    @StateObject private var viewModel = HomeViewModel(repository: ImplMediaRepository())

    public var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                GalleryView(title: L10n.Home.Category.ContinueWatching.title, items: viewModel.continueWatching)
                GalleryView(title: L10n.Home.Category.TVDrama.title, description: L10n.Home.Category.TVDrama.description, items: viewModel.tvDramas)
                GalleryView(title: L10n.Home.Category.TVSeries.title, description: L10n.Home.Category.TVSeries.description, items: viewModel.tvSeries)
                GalleryView(title: L10n.Home.Category.TVShow.title, description: L10n.Home.Category.TVShow.description, items: viewModel.tvShows)
            }
        }
        .navigationTitle(L10n.Home.Navigation.title)
        .task(priority: .userInitiated) {
            await viewModel.refreshData()
        }
        .refreshable {
            await viewModel.refreshData()
        }
    }

    public init() { }
}

#Preview {
    NavigationStack {
        HomeScene()
    }
}
