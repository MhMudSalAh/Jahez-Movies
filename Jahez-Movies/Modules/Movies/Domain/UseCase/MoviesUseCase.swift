//
//  MoviesUseCase.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import Foundation
import Networking

public struct MoviesUseCase {
    private let repository: MoviesRepository
    
    init(repository: MoviesRepository) {
        self.repository = repository
    }
    
    func getMovies(page: Int) async -> Result<([MovieModel], Int), APIError> {
        let result = await repository.getMovies(page: page)
        switch result {
        case .success(let response):
            return .success((response.data, response.page))
        case .failure(let error):
            return .failure(error)
        }
    }
    
    func getCategories() async -> Result<[CategoryModel], APIError> {
        let result = await repository.getCategories()
        switch result {
        case .success(let response):
            return .success(response.data)
        case .failure(let error):
            return .failure(error)
        }
    }

}
