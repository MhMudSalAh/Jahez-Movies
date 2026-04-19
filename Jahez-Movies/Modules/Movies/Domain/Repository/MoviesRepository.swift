//
//  MoviesRepository.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import Networking

protocol MoviesRepository {
    func getMovies(page: Int) async -> Result<PageModel<MovieModel>, APIError>
    func getCategories() async -> Result<CategoriesModel, APIError>
}
