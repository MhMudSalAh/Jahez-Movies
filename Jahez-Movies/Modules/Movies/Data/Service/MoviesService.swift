//
//  MoviesService.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import Networking

struct MoviesService: ServiceProtocol {
    var path: String { EndPointEnum.movies }
    var method: HTTPMethod { .GET }
    var parameters: Parameters?
    
    init(page: Int? = nil) {
        guard let page else { return }
        parameters = ["page": "\(page)"]
    }
}
