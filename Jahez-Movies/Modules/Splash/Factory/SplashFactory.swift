//
//  SplashFactory.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 18/04/2026.
//

import SwiftUI

struct SplashFactory {
        
    static func makeView(
        router: Router
    ) -> some View {
        let viewModel = SplashViewModel(router: router)
        return SplashView(viewModel: viewModel)
    }
}
