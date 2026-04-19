//
//  SplashView.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 18/04/2026.
//

import SwiftUI

struct SplashView: View {
    
    @StateObject private var viewModel: SplashViewModel
    
    init(viewModel: SplashViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Image(.splash)
                    .resizable()
                    .scaledToFit()
                    .frame(width: Sizes.px120, height: Sizes.px120)
                Spacer()
            }
            .task {
                try? await Task.sleep(for: .seconds(3))
                viewModel.didFinishSplash()
                
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(uiColor: .primary))
        }
    }
}
