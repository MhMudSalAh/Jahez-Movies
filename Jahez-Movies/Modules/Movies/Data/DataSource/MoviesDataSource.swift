//
//  MoviesDataSource.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import Foundation

final class MoviesDataSource {
    
    var movies: [MovieModel] {
        [
            MovieModel(
                id: 1226863,
                title: "The Super Mario Galaxy Movie",
                image:  "/eJGWx219ZcEMVQJhAgMiqo8tYY.jpg",
                adult: false,
                cover: "/9Z2uDYXqJrlmePznQQJhL6d92Rq.jpg",
                categories: nil,
                categoriesIDs: [
                    10751,
                    35,
                    12,
                    28,
                    16
                ],
                date: "2015-04-23"
            ),
            MovieModel(
                id: 1523145,
                title: "Your Heart Will Be Broken",
                image:  "/7wIBfBl2gejt6xHxNSK0reVIm7E.jpg",
                adult: false,
                cover: "/1x9e0qWonw634NhIsRdvnneeqvN.jpg",
                categories: nil,
                categoriesIDs: [
                    10749,
                    12
                ],
                date: "2019-08-07"
            )
        ]
    }
    
    var categories: CategoriesModel {
        CategoriesModel(
            data: [
                CategoryModel(
                    id: 28,
                    name: "Action"
                ),
                CategoryModel(
                    id: 12,
                    name: "Adventure"
                ),
            ]
        )
    }

    
    func getMovies() async throws -> PageModel<MovieModel> {
        PageModel(
            page: 1,
            data: movies,
            totalPages: 5,
            totalResults: 50
        )
    }
    
    func getCategories() async throws -> CategoriesModel {
        categories
    }

}
