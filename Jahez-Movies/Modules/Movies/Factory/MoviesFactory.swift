//
//  MoviesFactory.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import SwiftUI
import Networking

struct MoviesFactory {
        
    static func makeView(
        isPreview: Bool = false,
        router: Router
    ) -> some View {
        let provider = URLSessionProvider()
        let repository = MoviesRepositoryAPI(provider: provider)
        let mockRepository = MoviesRepositoryMock()
        let useCase = MoviesUseCase(repository: isPreview ? mockRepository : repository)
        let viewModel = MoviesViewModel(
            useCase: useCase,
            router: router
        )
        return MoviesView(viewModel: viewModel)
    }
}
