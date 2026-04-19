//
//  MovieDetailsRepositoryMock.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import Networking

struct MovieDetailsRepositoryMock: MovieDetailsRepository {
    private let dataSource = MovieDetailsDataSource()
    
    func getMovie(id: Int) async -> Result<MovieModel, APIError> {
        do {
            let movie = try await dataSource.getMovie()
            return .success(movie)
        } catch {
            return .failure(APIError(type: .noResponse))
        }
    }
}
