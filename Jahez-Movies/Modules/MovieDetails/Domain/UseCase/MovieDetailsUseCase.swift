//
//  MovieDetailsUseCase.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import Foundation
import Networking

public struct MovieDetailsUseCase {
    private let repository: MovieDetailsRepository
    
    init(repository: MovieDetailsRepository) {
        self.repository = repository
    }
    
    func getMovie(id: Int)
    async -> Result<MovieModel, APIError> {
        let result = await repository.getMovie(id: id)
        switch result {
        case .success(let response):
            return .success(response)
        case .failure(let error):
            return .failure(error)
        }
    }
}
