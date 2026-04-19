//
//  MovieDetailsRepository.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import Networking

protocol MovieDetailsRepository {
    func getMovie(id: Int) async -> Result<MovieModel, APIError>
}
