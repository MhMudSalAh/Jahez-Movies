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
    let overView: String
    let image: String
    let cover: String
    let adult: Bool
    let categories: [CategoryModel]?
    let categoriesIDs: [Int]?
    let date: String
    let homepage: String?
    let budget: Int?
    let revenue: Int?
    let languages: [LanguageModel]?
    let status: String?
    let runTime: Int?
}

extension MovieModel: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overView = "overview"
        case image = "poster_path"
        case cover = "backdrop_path"
        case adult
        case categories = "genres"
        case categoriesIDs = "genre_ids"
        case date = "release_date"
        case homepage
        case budget
        case revenue = "Revenue"
        case languages = "spoken_languages"
        case status
        case runTime = "runtime"
    }
}
