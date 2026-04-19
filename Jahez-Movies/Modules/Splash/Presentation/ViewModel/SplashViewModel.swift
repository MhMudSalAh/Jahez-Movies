//
//  SplashViewModel.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 18/04/2026.
//

import Combine

final class SplashViewModel: ObservableObject {
    
    private let router: Router
    
    init(router: some Router) {
        self.router = router
    }
    
    func didFinishSplash() {
        router.presentFullScreen(.movies)
    }
}
