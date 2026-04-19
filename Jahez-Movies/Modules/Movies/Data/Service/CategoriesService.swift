//
//  CategoriesService.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import Networking

struct CategoriesService: ServiceProtocol {
    var path: String { EndPointEnum.categories }
    var method: HTTPMethod { .GET }
}
