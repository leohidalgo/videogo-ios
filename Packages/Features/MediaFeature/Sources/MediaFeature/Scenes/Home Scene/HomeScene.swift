import Localizable
import SwiftUI

public struct HomeScene: View {

    @StateObject private var viewModel = HomeViewModel(repository: ImplMediaRepository())
    @State private var showAlert = false

    public var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                GalleryView(title: L10n.Home.Category.TVDrama.title, description: L10n.Home.Category.TVDrama.description, items: viewModel.tvDramas)
                GalleryView(title: L10n.Home.Category.TVSeries.title, description: L10n.Home.Category.TVSeries.description, items: viewModel.tvSeries)
                GalleryView(title: L10n.Home.Category.TVShow.title, description: L10n.Home.Category.TVShow.description, items: viewModel.tvShows)
            }
        }
        .navigationTitle(L10n.Home.Navigation.title)
        .task(priority: .userInitiated) {
            await viewModel.refreshData()
        }
        .onReceive(viewModel.$errorMessage) { message in
            showAlert = message != nil
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(L10n.Firebase.Error.title),
                message: Text(viewModel.errorMessage ?? L10n.Firebase.Error.unknown),
                dismissButton: .default(Text(L10n.Firebase.Error.ok)) {
                    viewModel.errorMessage = nil
                }
            )
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
