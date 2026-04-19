//
//  RootContainer.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 18/04/2026.
//

import SwiftUI

final class RootContainer {

    let router: Router

    init(router: Router) {
        self.router = router
    }

    // MARK: - Factories

    func makeSplashView() -> some View {
        SplashFactory.makeView(router: router)
    }
    
    func makeMoviesView() -> some View {
        MoviesFactory.makeView(isPreview: false, router: router)
    }
    
    func makeMoviesView(movie: MovieModel) -> some View {
        MovieDetailsFactory.makeView(isPreview: false, router: router, movie: movie)
    }
}
