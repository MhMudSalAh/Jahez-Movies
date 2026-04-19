//
//  MovieView.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import SwiftUI
import Kingfisher

struct MovieView: View {
    @ObservedObject private(set) var viewModel: MovieViewModel
    
    @State private var isAnimating = true
    
    var body: some View {
        KFImage.load(url: viewModel.movie.image)
            .fade(duration: 0.3)
            .onSuccess { _ in
                isAnimating = false
            }
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity)
            .frame(height: 220)
            .clipShape(RoundedRectangle(cornerRadius: Sizes.px12))
            .overlay(alignment: .bottom) {
                VStack(alignment: .leading, spacing: Sizes.px8) {
                    Caption(
                        text: viewModel.movie.title,
                        textWeight: .bold
                    )
                    Caption(
                        text: viewModel.movie.date,
                        textWeight: .semibold
                    )
                }
                .padding(.leading, Sizes.px12)
                .padding(.vertical, Sizes.px12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.black.opacity(0.7))
            }
            .overlay(alignment: .center) {
                ProgressView()
                    .isHidden(!isAnimating)
            }
            .clipShape(RoundedRectangle(cornerRadius: Sizes.px14))
    }
    
}

#Preview {
    MovieView(
        viewModel: MovieViewModel(
            MoviesDataSource().movies.first!
        )
    )
}
