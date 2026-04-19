//
//  CategoriesViewModel.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import Combine

final class CategoriesViewModel: ObservableObject {
    @Published private(set) var categories: [CategoryModel]
    @Published private(set) var selectedId: Int?
    let action: (Int) -> ()?
    
    init(
        _ categories: [CategoryModel],
        selectedId: Int?,
        action: @escaping (Int) -> ()?
    ) {
        self.categories = categories
        self.selectedId = selectedId
        self.action = action
    }
}

