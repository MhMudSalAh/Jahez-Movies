//
//  MoviesRepositoryAPI.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import Networking

struct MoviesRepositoryAPI: MoviesRepository {
    private let provider: URLSessionProviderProtocol
    
    init(provider: URLSessionProviderProtocol) {
        self.provider = provider
    }
    
    func getMovies(page: Int) async -> Result<PageModel<MovieModel>, APIError> {
        let service = MoviesService(page: page)
        return await provider.request(service: service)
    }
    
    func getCategories() async -> Result<CategoriesModel, APIError> {
        let service = CategoriesService()
        return await provider.request(service: service)
    }
}
