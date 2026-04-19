//
//  MovieDetailsService.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import Networking

struct MovieDetailsService: ServiceProtocol {
    var path: String
    var method: HTTPMethod { .GET }
    var parameters: Parameters?
    
    init(movieId: Int) {
        self.path = EndPointEnum.movieDetails + "/\(movieId)"
    }
}
