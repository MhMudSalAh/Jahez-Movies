//
//  MovieDetailsViewModel.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import Combine

final class MovieDetailsViewModel: ObservableObject {
    
    // MARK: - Propreties
      
    private let useCase: MovieDetailsUseCase
    @Published private(set) var movie: MovieModel

    // MARK: - Init
    
    init(
        useCase: MovieDetailsUseCase,
        movie: MovieModel
    ) {
        self.useCase = useCase
        self.movie = movie
    }
    
    func viewDidLoad() async {
        await getMovie()
    }
    
    @MainActor
    private func getMovie() async {
        let result = await useCase.getMovie(id: movie.id)
        switch result {
        case let .success(movie):
            self.movie = movie
        case .failure(_):
            break
        }
    }
}
