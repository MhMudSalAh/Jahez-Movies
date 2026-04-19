//
//  MovieViewModel.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import Combine

final class MovieViewModel: ObservableObject {
    @Published private(set) var movie: MovieModel
    
    init(_ movie: MovieModel) {
        self.movie = movie
    }
}
