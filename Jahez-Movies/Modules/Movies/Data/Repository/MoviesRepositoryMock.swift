//
//  MoviesRepositoryMock.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import Networking

struct MoviesRepositoryMock: MoviesRepository {
    private let dataSource = MoviesDataSource()
    
    func getMovies(page: Int) async -> Result<PageModel<MovieModel>, APIError> {
        do {
            let data = try await dataSource.getMovies()
            return .success(data)
        } catch {
            return .failure(APIError(type: .noResponse))
        }
    }
    
    func getCategories() async -> Result<CategoriesModel, APIError> {
        do {
            let data = try await dataSource.getCategories()
            return .success(data)
        } catch {
            return .failure(APIError(type: .noResponse))
        }
    }

}
