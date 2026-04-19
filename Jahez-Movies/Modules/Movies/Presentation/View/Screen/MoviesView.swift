//
//  MoviesView.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import SwiftUI

struct MoviesView: View {
    
    @StateObject private var viewModel: MoviesViewModel
    
    init(viewModel: MoviesViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: Sizes.px16) {

                    categoriesView

                    LazyVGrid(
                        columns: [
                            GridItem(.flexible(), spacing: Sizes.px12),
                            GridItem(.flexible(), spacing: Sizes.px12)
                        ],
                        spacing: 12
                    ) {
                        ForEach(viewModel.filteredMovies) { movie in
                            movieView(for: movie)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
            }
            .background(Color.primary.ignoresSafeArea())
            .navigationTitle("Watch New Movies")
            .navigationBarTitleDisplayMode(.large)
            .searchable(
                text: $viewModel.searchQuery,
                prompt: "Search TMDB by name"
            )
            .task {
                await viewModel.viewDidLoad()
            }
        }
    }
    
    private var categoriesView: some View {
        CategoriesView(
            viewModel: CategoriesViewModel(
                viewModel.categories,
                selectedId: viewModel.selectedId,
                action: { id in
                    viewModel.selectedId = id
                }
            )
        )
    }
    
    private func movieView(for movie: MovieModel) -> some View {
        MovieView(viewModel: MovieViewModel(movie))
            .frame(height: Sizes.px220)
            .onTapGesture {
                viewModel.didSelectMovie(movie)
            }
            .task {
                await viewModel.loadMore(currentItem: movie)
            }
            .background(Color(uiColor: .clear))
    }
    
    private var emptyView: some View {
        VStack {
            Spacer()
            Text("No Movies Found !!")
                .foregroundColor(.white)
                .font(.headline)
            Spacer()
        }
    }
}

#Preview {
    MoviesFactory.makeView(isPreview: true, router: Coordinator())
}
