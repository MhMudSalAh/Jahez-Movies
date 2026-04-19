//
//  CaptionView.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import SwiftUI

struct Caption: View {
    let text: String
    let textWeight: Font.Weight
    
    var body: some View {
        Text(text)
            .font(.caption)
            .fontWeight(textWeight)
            .foregroundColor(.white)
            .shadow(color: .white, radius: 5, x: 2, y: 2)
    }
}

#Preview {
    Caption(
        text: MoviesDataSource().movies.first!.title,
        textWeight: .semibold
    )
}
