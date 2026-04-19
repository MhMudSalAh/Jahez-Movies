//
//  CircleImage.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import SwiftUI
import Kingfisher

struct CircleImage: View {
    var image: String
    
    var body: some View {
        KFImage.load(url: image)
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: Sizes.px4)
            }
            .shadow(radius: Sizes.px7)
    }
}

#Preview {
    CircleImage(image: MovieDetailsDataSource().movie.image)
}
