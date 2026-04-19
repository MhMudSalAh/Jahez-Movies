//
//  MovieDetailsView.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import SwiftUI
import Kingfisher

struct MovieDetailsView: View {
    
    @StateObject private var viewModel: MovieDetailsViewModel
    
    init(viewModel: MovieDetailsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: Sizes.px20) {
                ZStack(alignment: .bottom) {
                    coverImage
                    profileImage
                }
                .padding(.bottom, Sizes.px70)
                
                titleSectionView
                
                Divider()
                    .overlay(Color.white)
                
                attributesSectionView
            }
        }
        .background(Color.appPrimary)
        .task {
            await viewModel.viewDidLoad()
        }
    }
    
    private var coverImage: some View {
        GeometryReader { geo in
            KFImage.load(url: viewModel.movie.cover)
                .resizable()
                .scaledToFill()
                .frame(width: geo.size.width, height: Sizes.px300)
                .clipped()
                .overlay {
                    Rectangle()
                        .fill(.black.opacity(0.3))
                }
        }
        .frame(height: Sizes.px300)
    }
    
    private var profileImage: some View {
        CircleImage(image: viewModel.movie.image)
            .frame(width: Sizes.px150, height: Sizes.px150)
            .overlay {
                Circle().stroke(.white, lineWidth: Sizes.px4)
            }
            .shadow(radius: Sizes.px7)
            .offset(y: Sizes.px70)
    }
    
    private var titleSectionView: some View {
        VStack(alignment: .leading, spacing: Sizes.px8) {
            Text(viewModel.movie.title)
                .font(.title)
                .fontWeight(.bold)
            +
            Text("\t(\(viewModel.movie.date.monthYear))")
                .font(.title3)
                .fontWeight(.light)
            
            Text(viewModel.movie.categories?.compactMap({ $0.name }).joined(separator: ", ") ?? "")
                .font(.callout)
                .fontWeight(.light)
                .padding(.bottom, Sizes.px24)

            Text(viewModel.movie.overView)
                .font(.callout)
                .fontWeight(.bold)
        }
        .padding(.horizontal, Sizes.px8)
        .multilineTextAlignment(.leading)
        .foregroundColor(.appSecondary)
    }
    
    private var attributesSectionView: some View {
        VStack(alignment: .leading, spacing: Sizes.px8) {
            KeyValueView(key: "Homepage", value: viewModel.movie.homepage)
            
            KeyValueView(key: "Languages", value: viewModel.movie.languages?.compactMap({ $0.title }).joined(separator: ", ") ?? "")
            
            HStack(alignment: .top, spacing: Sizes.px0) {
                KeyValueView(key: "Status", value: viewModel.movie.status)
                Spacer()
                KeyValueView(key: "Runtime", value: "\(viewModel.movie.runTime ?? 0)")
            }
            
            HStack(alignment: .top, spacing: Sizes.px0) {
                KeyValueView(key: "Budget", value: "\(viewModel.movie.budget ?? 0) $")
                Spacer()
                KeyValueView(key: "Revenue", value: "\(viewModel.movie.revenue ?? 0) $")
            }
            
        }
        .padding(.horizontal, Sizes.px16)
        .padding(.bottom, Sizes.px20)
    }

}

#Preview {
    MovieDetailsFactory.makeView(
        isPreview: true,
        router: Coordinator(),
        movie: MovieDetailsDataSource().movie
    )
}
