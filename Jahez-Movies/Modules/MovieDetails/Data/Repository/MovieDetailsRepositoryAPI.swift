//
//  MovieDetailsRepositoryAPI.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import Networking

struct MovieDetailsRepositoryAPI: MovieDetailsRepository {
    private let provider: URLSessionProviderProtocol
    
    init(provider: URLSessionProviderProtocol) {
        self.provider = provider
    }
    
    func getMovie(id: Int) async -> Result<MovieModel, APIError> {
        let service = MovieDetailsService(movieId: id)
        return await provider.request(service: service)
    }
}
