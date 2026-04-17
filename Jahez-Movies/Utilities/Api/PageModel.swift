//
//  PageModel.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 15/04/2026.
//

import Foundation

struct PageModel<T: Codable>: Codable {
    let page: Int
    let data: [T]
    let totalPages: Int
    let totalResults: Int
}

extension PageModel {
    enum CodingKeys: String, CodingKey {
        case page
        case data = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
