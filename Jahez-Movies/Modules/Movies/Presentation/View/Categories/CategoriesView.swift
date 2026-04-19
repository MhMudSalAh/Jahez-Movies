//
//  CategoriesView.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import SwiftUI

struct CategoriesView: View {
    @ObservedObject var viewModel: CategoriesViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: Sizes.px8) {
                ForEach( viewModel.categories, id: \.id) { category in
                    let isSelected = viewModel.selectedId == category.id
                    
                    Button(
                        action: { viewModel.action(category.id) }
                    ) {
                        Text(category.name)
                            .foregroundColor(isSelected ? Color.primary : .white)
                            .padding(.horizontal, Sizes.px16)
                            .padding(.vertical, Sizes.px4)
                            .background(isSelected ? Color.secondary : .clear)
                            .cornerRadius(Sizes.px100)
                            .overlay(
                                RoundedRectangle(cornerRadius: Sizes.px100)
                                    .stroke(Color.secondary, lineWidth: 1)
                            )
                    }
                }
            }
            .padding(.horizontal, Sizes.px2)
            .padding(.vertical, Sizes.px2)
        }
        .background(Color.clear)
    }
}
