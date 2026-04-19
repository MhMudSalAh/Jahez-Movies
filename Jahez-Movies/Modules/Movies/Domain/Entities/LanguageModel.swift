//
//  LanguageModel.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import Foundation

struct LanguageModel: Hashable {
    let englishTitle: String
    let iso: String
    let title: String
}

extension LanguageModel: Codable {
    enum CodingKeys: String, CodingKey {
        case englishTitle = "english_name"
        case iso = "iso_639_1"
        case title = "name"
    }
}
