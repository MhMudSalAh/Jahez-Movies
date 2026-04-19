//
//  KeyValueView.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import SwiftUI

struct KeyValueView: View {
    let key: String?
    let value: String?
    private var isURL: Bool {
        value?.isURL == true
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: Sizes.px0) {
            Text(key ?? "")
                .font(.callout)
                .fontWeight(.bold)
            + Text(": ")
            
            Text(value ?? "")
                .font(.callout)
                .fontWeight(.regular)
                .foregroundColor(isURL ? .blue : .white)
                .underline(isURL)
        }
        .foregroundColor(.white)
    }
}

#Preview {
    KeyValueView(
        key: "Status",
        value: MovieDetailsDataSource().movie.status!
    )
}
