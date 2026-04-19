//
//  CategoriesModel.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

// MARK: - Welcome
import Foundation

struct CategoriesModel {
    let data: [CategoryModel]
}

extension CategoriesModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case data = "genres"
    }
    
}
