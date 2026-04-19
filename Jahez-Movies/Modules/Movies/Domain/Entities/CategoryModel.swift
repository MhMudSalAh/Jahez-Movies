//
//  CategoryModel.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import Foundation

struct CategoryModel: Identifiable, Hashable {
    let id: Int
    let name: String
}

extension CategoryModel: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
