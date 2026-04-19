//
//  MovieModel.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import Foundation

struct MovieModel: Identifiable, Hashable {
    let id: Int
    let title: String
    let image: String
    let adult: Bool
    let cover: String
    let categories: [CategoryModel]?
    let categoriesIDs: [Int]?
    let date: String
}

extension MovieModel: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case image = "poster_path"
        case adult
        case cover = "backdrop_path"
        case categories = "genres"
        case categoriesIDs = "genre_ids"
        case date = "release_date"
    }
}
