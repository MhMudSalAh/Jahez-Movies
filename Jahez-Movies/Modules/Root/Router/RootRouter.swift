//
//  RootRouter.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 18/04/2026.
//

import SwiftUI

struct RootRouter {

    let container: RootContainer

    @ViewBuilder
    func build(_ route: RootRoute) -> some View {
        switch route {
        case .splash:
            container.makeSplashView()
        case .movies:
            container.makeMoviesView()
        case .movie(let movie):
            container.makeMoviesView(movie: movie)
        }
    }
}
