//
//  MovieDetailsDataSource.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import Foundation

final class MovieDetailsDataSource {
    
    var movie: MovieModel {
        MovieModel(
            id: 1226863,
            title: "The Super Mario Galaxy Movie",
            overView: "Having thwarted Bowser's previous plot to marry Princess Peach, Mario and Luigi now face a fresh threat in Bowser Jr.",
            image:  "/eJGWx219ZcEMVQJhAgMiqo8tYY.jpg",
            cover: "/9Z2uDYXqJrlmePznQQJhL6d92Rq.jpg",
            adult: false,
            categories: [
                CategoryModel(
                    id: 10751,
                    name: "Family"
                ),
                CategoryModel(
                    id: 35,
                    name: "Comedy"
                )
            ],
            categoriesIDs: nil,
            date: "2015-04-23",
            homepage: "https://www.thesupermariogalaxymovie.com",
            budget: 110000000,
            revenue: 628589780,
            languages: [
                LanguageModel(
                    englishTitle: "English",
                    iso: "en",
                    title: "English"
                )
            ],
            status: "Released",
            runTime: 98,
        )
    }
    
    func getMovie() async throws -> MovieModel {
        return movie
    }
}
