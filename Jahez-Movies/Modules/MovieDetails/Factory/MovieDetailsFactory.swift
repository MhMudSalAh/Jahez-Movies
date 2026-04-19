//
//  MovieDetailsFactory.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import SwiftUI
import Networking

struct MovieDetailsFactory {
        
    static func makeView(
        isPreview: Bool = false,
        router: Router,
        movie: MovieModel
    ) -> some View {
        let provider = URLSessionProvider()
        let repository = MovieDetailsRepositoryAPI(provider: provider)
        let mockRepository = MovieDetailsRepositoryMock()
        let useCase = MovieDetailsUseCase(repository: isPreview ? mockRepository : repository)
        let viewModel = MovieDetailsViewModel(useCase: useCase, movie: movie)
        return MovieDetailsView(viewModel: viewModel)
    }
}
